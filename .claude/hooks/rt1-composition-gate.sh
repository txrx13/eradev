#!/usr/bin/env bash
set -euo pipefail

if [ "${ERADEV_HOOKS_DISABLED:-0}" = "1" ]; then
  exit 0
fi

LOG="${ERADEV_HOOKS_LOG:-/dev/null}"

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null || true)
if [ -z "$TOOL_NAME" ]; then
  exit 0
fi

if [ "$TOOL_NAME" != "Write" ] && [ "$TOOL_NAME" != "Edit" ]; then
  exit 0
fi

FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null || true)

case "$FILE_PATH" in
  */reports/rt1-*.md) ;;
  */reports/RT1-*.md) ;;
  */reports/rt1_*.md) ;;
  *)
    exit 0
    ;;
esac

if [ "$TOOL_NAME" = "Edit" ]; then
  PAYLOAD=$(echo "$INPUT" | jq -r '.tool_input.new_string // empty' 2>/dev/null || true)
else
  PAYLOAD=$(echo "$INPUT" | jq -r '.tool_input.content // empty' 2>/dev/null || true)
fi

if [ -z "$PAYLOAD" ]; then
  exit 0
fi

echo "[rt1-composition-gate] file=$FILE_PATH len=${#PAYLOAD}" >>"$LOG" 2>/dev/null || true

set +o pipefail
REFACTOR_COUNT=$(printf '%s\n' "$PAYLOAD" | grep -oEi '(refactor|phase|pivot|рефактор)' | wc -l | tr -d ' ')
PARALLEL_HIT=$(printf '%s\n' "$PAYLOAD" | grep -oEi '(parallel|simultaneously|together|одновременно|параллельно|в одном релиз)' | wc -l | tr -d ' ')
set -o pipefail

if [ "${REFACTOR_COUNT:-0}" -lt 2 ] || [ "${PARALLEL_HIT:-0}" -lt 1 ]; then
  exit 0
fi

TODAY=$(date +%Y-%m-%d)

REPO_ROOT=""
DIR="$(dirname "$FILE_PATH")"
while [ "$DIR" != "/" ] && [ -n "$DIR" ]; do
  if [ -d "$DIR/.git" ] || [ -d "$DIR/reports" ]; then
    REPO_ROOT="$DIR"
    break
  fi
  DIR="$(dirname "$DIR")"
done

if [ -z "$REPO_ROOT" ]; then
  REPO_ROOT="$(pwd)"
fi

HAZARDS_FILE="$REPO_ROOT/reports/composition-hazards-${TODAY}.md"

if [ ! -f "$HAZARDS_FILE" ]; then
  {
    echo "BL-34 violation: plan lists >=2 refactors in one release window but no composition-hazards grid exists."
    echo "Expected: reports/composition-hazards-${TODAY}.md"
    echo "Author: Visionary. Template: templates/composition_hazards.template.md"
    echo "Minimum pairs: N*(N-1)/2 + 3-way combinations for N >= 3."
  } >&2
  exit 2
fi

exit 0
