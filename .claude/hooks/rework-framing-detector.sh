#!/usr/bin/env bash
set -euo pipefail

if [ "${ERADEV_HOOKS_DISABLED:-0}" = "1" ]; then
  exit 0
fi

LOG="${ERADEV_HOOKS_LOG:-/dev/null}"

INPUT=$(cat)

MESSAGE=$(echo "$INPUT" | jq -r '.prompt // .user_prompt // .message // .tool_input.prompt // empty' 2>/dev/null || true)

if [ -z "$MESSAGE" ]; then
  exit 0
fi

TRIGGER_RE='менять архитектуру|полностью менять|архитектурная проблема|full rework|from scratch|architecture is wrong|completely change'

if ! printf '%s' "$MESSAGE" | grep -qiE "$TRIGGER_RE"; then
  exit 0
fi

echo "[rework-framing-detector] trigger matched, checking discrimination guards" >>"$LOG" 2>/dev/null || true

# v10.1 (RT-12 PRUNE-B1): rhetorical/conditional/past-tense discrimination guard.
# Goal: reduce 30-50% FP rate from Validator-confirmed audit (BL-35 perpetual pivot window FP).
# If trigger pattern co-occurs with rhetorical/conditional/past-tense markers in the same
# message, the operator is asking ABOUT rework — not commanding it. Exit 0 (advisory).

# Extract the trigger-bearing sentence(s): split on . ! ? \n and find segments matching trigger.
TRIGGER_SEGMENTS=$(printf '%s' "$MESSAGE" | tr '\n' ' ' | tr '.!?' '\n' | grep -iE "$TRIGGER_RE" || true)

# Re-derive: did the original message contain "?" near the trigger? Cheap proxy: any "?" in message
# AND trigger present AND no imperative-action markers (! mark, "сделай", "do it", "now").
HAS_QUESTION_MARK=0
if printf '%s' "$MESSAGE" | grep -q '?'; then
  HAS_QUESTION_MARK=1
fi

# Conditional / rhetorical / past-tense markers (Russian + English, case-insensitive).
RHETORICAL_RE='стоит ли|надо ли|нужно ли|может быть|может ли|если\b|или нет|или не|should we|should i|do we need|is it worth|maybe|might we|whether to|or not'
PAST_TENSE_RE='вчера|на прошлой неделе|раньше|уже менял|уже поменял|yesterday|last week|previously|already changed|already refactored'

HAS_RHETORICAL=0
if printf '%s' "$MESSAGE" | grep -qiE "$RHETORICAL_RE"; then
  HAS_RHETORICAL=1
fi

HAS_PAST_TENSE=0
if printf '%s' "$MESSAGE" | grep -qiE "$PAST_TENSE_RE"; then
  HAS_PAST_TENSE=1
fi

# Imperative override: explicit command markers re-arm the trigger even if "?" present elsewhere.
# Examples: "менять архитектуру!", "полностью менять — сделай это", "completely change now".
IMPERATIVE_RE='!|\bсделай\b|\bдавай\b|\bначни\b|\bначинай\b|\bsubmit\b|\bdo it\b|\bnow\b|\bproceed\b|\bship it\b'

HAS_IMPERATIVE=0
if printf '%s' "$MESSAGE" | grep -qiE "$IMPERATIVE_RE"; then
  HAS_IMPERATIVE=1
fi

# Discrimination logic:
#   - If imperative present → trigger stands (true command).
#   - Else if rhetorical OR past-tense OR (question-mark with no imperative) → exit 0 (advisory log).
if [ "$HAS_IMPERATIVE" -eq 0 ]; then
  if [ "$HAS_RHETORICAL" -eq 1 ] || [ "$HAS_PAST_TENSE" -eq 1 ] || [ "$HAS_QUESTION_MARK" -eq 1 ]; then
    echo "[rework-framing-detector] discrimination guard fired (rhetorical=$HAS_RHETORICAL past=$HAS_PAST_TENSE q=$HAS_QUESTION_MARK), exit 0 advisory" >>"$LOG" 2>/dev/null || true
    exit 0
  fi
fi

echo "[rework-framing-detector] guard cleared (imperative=$HAS_IMPERATIVE), checking pivot window" >>"$LOG" 2>/dev/null || true

CWD="${CLAUDE_PROJECT_DIR:-$(pwd)}"

ACTIVE_PIVOT=0
if command -v git >/dev/null 2>&1; then
  if git -C "$CWD" rev-parse --git-dir >/dev/null 2>&1; then
    set +o pipefail
    PIVOT_COMMITS=$(git -C "$CWD" log --since='7 days ago' --grep='feat\|refactor\|pivot' --oneline 2>/dev/null | wc -l | tr -d ' ')
    set -o pipefail
    if [ "${PIVOT_COMMITS:-0}" -gt 0 ]; then
      ACTIVE_PIVOT=1
    fi
  fi
fi

if [ "$ACTIVE_PIVOT" -eq 0 ]; then
  echo "[rework-framing-detector] no active pivot, logging only" >>"$LOG" 2>/dev/null || true
  exit 0
fi

TODAY=$(date +%Y-%m-%d)

cat >&2 <<EOF
=== BL-35 REWORK-FRAMING DETECTED (BLOCKING) ===
Operator message matches rework-trigger regex during active refactor window.
META MUST NOT proceed to Builder spawn. Mandatory sequence:
  1. Spawn [VALIDATOR] FIRST with risk-matrix prompt (Inv 16, BL-35).
  2. Validator prompt MUST include section: "## Operator rework framing: <verbatim quote>".
  3. Produce reports/hansei-architectural-rework-${TODAY}.md using templates/interlocked_sequence.template.md.
  4. Enumerate composition hazards per BL-34 (pair grid + 3-way).
  5. Propose INTERLOCKED SEQUENCE (one pivot at a time, parity windows, kill-switches), never parallel menu.
  6. Block all Builder spawns until operator sign-off on decision matrix OD-1..OD-N.

Override paths (use only with explicit operator authorization):
  - Re-run with ERADEV_HOOKS_DISABLED=1 in environment.
  - Operator may say "skip rework audit" / "proceed without Hansei" verbatim — META cites authorization.

See BL-35 in BOOTSTRAP_LESSONS.md and Invariant 16 in CLAUDE.md.
=================================================
EOF

exit 2
