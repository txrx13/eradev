#!/usr/bin/env bash
# in-session-fix-counter.sh
# Closes ODTOE F7 (RT-11 audit): BL-3 was blind to in-flight fix chains
# because it checked committed `^fix:` messages, not Builder spawns mid-session.
# This hook counts fix-pattern Agent spawns within the current session day
# and BLOCKS at >=3 attempts.
#
# Trigger: PreToolUse on Agent tool calls.
# Pattern: description matches \b(fix|fix-up|repair|исправ|patch|correct)\b (case-insensitive).
# Counter: .eradev/fix-counter-{YYYY-MM-DD}.txt (one line per fix-attempt).
# Reset:   new date OR 24h gap (file rotates by date).
# Override: ERADEV_HOOKS_DISABLED=1 OR BL3_OVERRIDE=1.

set -euo pipefail

# Global override
if [ "${ERADEV_HOOKS_DISABLED:-0}" = "1" ]; then
  exit 0
fi

# BL-3 specific override (operator confirmed root-cause investigation done)
if [ "${BL3_OVERRIDE:-0}" = "1" ]; then
  exit 0
fi

LOG="${ERADEV_HOOKS_LOG:-/dev/null}"

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null || true)
if [ "$TOOL_NAME" != "Agent" ]; then
  exit 0
fi

DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // empty' 2>/dev/null || true)
if [ -z "$DESCRIPTION" ]; then
  exit 0
fi

# Fix-pattern regex (case-insensitive). Matches EN fix verbs and RU "исправ*".
# `\b` boundaries to avoid matching "prefix", "fixture", etc.
if ! echo "$DESCRIPTION" | grep -qiE '\b(fix|fix-up|repair|patch|correct)\b|исправ'; then
  exit 0
fi

COUNTER_DIR=".eradev"
DATE_STAMP=$(date +%Y-%m-%d)
COUNTER_FILE="${COUNTER_DIR}/fix-counter-${DATE_STAMP}.txt"
mkdir -p "$COUNTER_DIR"

# Append current attempt with timestamp + description
TS=$(date +%Y-%m-%dT%H:%M:%S)
printf '%s\t%s\n' "$TS" "$DESCRIPTION" >> "$COUNTER_FILE"

COUNT=$(wc -l < "$COUNTER_FILE" | tr -d ' ')

echo "[in-session-fix-counter] count=$COUNT description=\"$DESCRIPTION\"" >>"$LOG" 2>/dev/null || true

if [ "$COUNT" -ge 3 ]; then
  {
    echo "BLOCKED: BL-3 in-session fix chain detected ($COUNT fix attempts today)."
    echo "Per BL-3: STOP. Do not attempt fix #$((COUNT + 1)). Return to spec, re-run RT-1."
    echo ""
    echo "Recent fix attempts (last 5):"
    tail -5 "$COUNTER_FILE" | sed 's/^/  - /'
    echo ""
    echo "Override (only after root-cause investigation):"
    echo "  ERADEV_HOOKS_DISABLED=1   # disable all eradev hooks"
    echo "  BL3_OVERRIDE=1            # disable just this BL-3 counter"
    echo ""
    echo "Counter file: $COUNTER_FILE (rotates daily; rm to reset)"
    echo "Closes ODTOE F7 (RT-11 audit). See BL-3 in BOOTSTRAP_LESSONS.md."
  } >&2
  exit 2
fi

exit 0
