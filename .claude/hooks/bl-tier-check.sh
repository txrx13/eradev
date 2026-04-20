#!/usr/bin/env bash
set -euo pipefail

if [ "${ERADEV_HOOKS_DISABLED:-0}" = "1" ]; then
  exit 0
fi

LOG="${ERADEV_HOOKS_LOG:-/dev/null}"

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null || true)
if [ -z "$TOOL_NAME" ]; then
  echo "bl-tier-check: could not parse tool_name" >&2
  exit 1
fi

if [ "$TOOL_NAME" != "Edit" ] && [ "$TOOL_NAME" != "Write" ]; then
  exit 0
fi

FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null || true)

case "$FILE_PATH" in
  *BOOTSTRAP_LESSONS*.md) ;;
  *bootstrap_lessons*.md) ;;
  *BL_CANDIDATES*.md) ;;
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

echo "[bl-tier-check] tool=$TOOL_NAME file=$FILE_PATH len=${#PAYLOAD}" >>"$LOG" 2>/dev/null || true

NEW_BL_HEADINGS=$(printf '%s\n' "$PAYLOAD" | grep -nE '^### BL-[0-9]+' || true)

if [ -z "$NEW_BL_HEADINGS" ]; then
  exit 0
fi

MISSING=""
while IFS=: read -r lineno heading; do
  [ -z "$lineno" ] && continue
  end=$((lineno + 30))
  CHUNK=$(printf '%s\n' "$PAYLOAD" | sed -n "${lineno},${end}p")
  if ! printf '%s\n' "$CHUNK" | grep -qE '^\*?\*?Tier:\*?\*?[[:space:]]*T[1-4]'; then
    MISSING="${MISSING}${heading}\n"
  fi
done <<EOF
$NEW_BL_HEADINGS
EOF

if [ -n "$MISSING" ]; then
  {
    echo "BL-33 violation: new BL entry missing \"Tier:\" line."
    echo "Add one of: \"Tier: T1 (type-level)\" | \"T2 (hook or CI)\" | \"T3 (checklist)\" | \"T4 (docs)\"."
    echo "See meta.md §13 enforcement ladder and BL-33 rule."
    echo "Offending heading(s):"
    printf '%b' "$MISSING"
  } >&2
  exit 2
fi

exit 0
