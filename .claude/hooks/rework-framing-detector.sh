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

echo "[rework-framing-detector] trigger matched, checking pivot window" >>"$LOG" 2>/dev/null || true

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
