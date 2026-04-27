#!/bin/bash
# check-leverage.sh
# BT-1 Phase 2.1 D-cure (D2-additive axis discipline).
#
# PreToolUse hook on Bash matching `git commit`. Computes the
# leverage_factor (LF) over currently staged files and BLOCKs a commit
# when 3 consecutive framework-self commits have LF < 0.10.
#
# Definitions (eradev.md §II.1 Λ component decomposition):
#   framework-self  = eradev.md / eradev_RU.md / meta.md / meta_RU.md /
#                     CLAUDE.md / roles/ / templates/ / scripts/ /
#                     .claude/ / .githooks/
#   operator-domain = projects/{name}/ EXCLUDING projects/eradev/
#   LF              = operator_count / max(1, framework_count)  (clipped to [0, 1])
#
# State tracking: .git/eradev_leverage_log records the LF of the last
# committed window. The hook reads this log + current staged LF to decide
# whether the third consecutive framework-only ship is about to occur.
#
# Overrides (in priority order):
#   1. ERADEV_HOOKS_DISABLED=1   — P0 emergency, post-incident Hansei mandatory
#   2. ERADEV_OPERATOR_SESSION=1 — operator-authorized framework-only session
#   3. Commit message contains `[retire-pass]` — retire-pass exemption
#
# Exit codes:
#   0 = ALLOW (LF healthy OR override active OR not a `git commit` call)
#   3 = BLOCK (3 consecutive framework-self commits with LF < 0.10)

# --- Override 1: emergency disable ---
if [ "${ERADEV_HOOKS_DISABLED:-0}" = "1" ]; then
  exit 0
fi

# --- Parse PreToolUse JSON input from stdin ---
INPUT=$(cat)

# Only react when the tool is Bash and the command is a `git commit`.
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null)
if [ "$TOOL_NAME" != "Bash" ]; then
  exit 0
fi

CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null)
if [ -z "$CMD" ]; then
  exit 0
fi

# Match `git commit` (with or without flags/args). Skip `git commit --amend`?
# Spec: gates every framework commit; amend is still a commit, treat the same.
if ! echo "$CMD" | grep -qE '(^|[^A-Za-z_-])git[[:space:]]+commit([[:space:]]|$)'; then
  exit 0
fi

# --- Override 3: retire-pass exemption ---
# Look for `[retire-pass]` token in the commit command (-m "..."  HEREDOC etc.).
if echo "$CMD" | grep -qF '[retire-pass]'; then
  exit 0
fi

# --- Resolve repo root ---
REPO_ROOT="${CLAUDE_PROJECT_DIR:-$(pwd)}"
if command -v git >/dev/null 2>&1; then
  if git -C "$REPO_ROOT" rev-parse --show-toplevel >/dev/null 2>&1; then
    REPO_ROOT="$(git -C "$REPO_ROOT" rev-parse --show-toplevel)"
  fi
fi

cd "$REPO_ROOT" || exit 0

# --- Compute LF over currently staged files ---
STAGED=$(git diff --cached --name-only 2>/dev/null || true)
if [ -z "$STAGED" ]; then
  # Empty commit (or `--allow-empty`): nothing to gate. Allow.
  exit 0
fi

# Framework-self regex (anchored at repo root).
FRAMEWORK_RE='^(eradev\.md|eradev_RU\.md|meta\.md|meta_RU\.md|CLAUDE\.md|FOUNDATIONS\.md|LOADING_PROTOCOL\.md|BOOTSTRAP_LESSONS([^/]*)?\.md|roles/.*|templates/.*|scripts/.*|\.claude/.*|\.githooks/.*)$'
# Operator-domain: projects/{name}/ EXCLUDING projects/eradev/.
OPERATOR_RE='^projects/(?!eradev/)[^/]+/'

# grep -P (PCRE) for the negative lookahead. Fallback when -P unavailable:
# explicit awk filter.
FRAMEWORK_COUNT=$(printf '%s\n' "$STAGED" | grep -cE "$FRAMEWORK_RE" || true)
OPERATOR_COUNT=$(printf '%s\n' "$STAGED" \
  | awk '/^projects\// && !/^projects\/eradev\//' \
  | wc -l \
  | tr -d ' ')

# Default counts to integers.
FRAMEWORK_COUNT=${FRAMEWORK_COUNT:-0}
OPERATOR_COUNT=${OPERATOR_COUNT:-0}

# LF = operator / max(1, framework). Clip to [0, 1].
DENOM=$FRAMEWORK_COUNT
if [ "$DENOM" -lt 1 ]; then DENOM=1; fi

# Bash-only float math: scale by 1000 for integer arithmetic.
LF_X1000=$(( (OPERATOR_COUNT * 1000) / DENOM ))
if [ "$LF_X1000" -gt 1000 ]; then LF_X1000=1000; fi
LF_INT=$LF_X1000   # leverage_factor * 1000

# --- Override 2: operator-authorized session ---
if [ "${ERADEV_OPERATOR_SESSION:-0}" = "1" ]; then
  # Still log the LF for visibility; do not gate.
  exit 0
fi

# --- Pure operator commit (no framework files staged) resets the chain ---
if [ "$FRAMEWORK_COUNT" -eq 0 ]; then
  # Reset rolling counter — operator artifact ships freely.
  : > .git/eradev_leverage_log 2>/dev/null || true
  exit 0
fi

# --- Read rolling log of last framework-self commits ---
# Each line: <LF_x1000>. Keep only the last 2 entries; we are about to add a 3rd.
LOG_FILE=".git/eradev_leverage_log"
PREV_BAD=0   # how many of the last 2 entries had LF<100 (i.e. <0.10)
if [ -f "$LOG_FILE" ]; then
  # Tail last 2 lines.
  while IFS= read -r LINE; do
    if [ -n "$LINE" ] && [ "$LINE" -lt 100 ] 2>/dev/null; then
      PREV_BAD=$((PREV_BAD + 1))
    fi
  done < <(tail -n 2 "$LOG_FILE" 2>/dev/null)
fi

# --- BLOCK condition: 2 prior bad + this would be 3rd bad ---
if [ "$PREV_BAD" -ge 2 ] && [ "$LF_INT" -lt 100 ]; then
  cat >&2 <<EOF

=== BLOCKED: BT-1 D-cure leverage gate (eradev.md §II.1) ===
3 consecutive framework-self commits with leverage_factor < 0.10.

Current commit:
  framework-self files staged : $FRAMEWORK_COUNT
  operator-domain files staged: $OPERATOR_COUNT
  leverage_factor             : 0.$(printf '%03d' "$LF_INT")  (< 0.10)

The framework cannot run away from operator artifact (axis discipline).
Ship at least one operator-domain artifact (projects/{name}/, not projects/eradev/) before the next framework edit.

Override paths:
  ERADEV_OPERATOR_SESSION=1   — operator-authorized framework-only session
  ERADEV_HOOKS_DISABLED=1     — P0 emergency (post-incident Hansei mandatory)
  Commit message tag [retire-pass] — for retire-pass commits

See eradev.md §II.1 (Λ component decomposition) and meta.md §14 item 9 (LAMBDA AUDIT).
============================================================

EOF
  exit 3
fi

# --- ALLOW: append current LF to rolling log, keep last 3 entries ---
{
  if [ -f "$LOG_FILE" ]; then
    tail -n 2 "$LOG_FILE" 2>/dev/null
  fi
  echo "$LF_INT"
} > "${LOG_FILE}.tmp" 2>/dev/null && mv "${LOG_FILE}.tmp" "$LOG_FILE" 2>/dev/null || true

exit 0
