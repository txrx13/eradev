#!/bin/bash
# agent-context-check.sh
# ADVISORY: Checks Agent prompt for BL-28 context prefix elements
# Warns if role identity, file paths, or output format appear missing

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')

# Only check Agent tool calls
if [ "$TOOL_NAME" != "Agent" ]; then
  exit 0
fi

PROMPT=$(echo "$INPUT" | jq -r '.tool_input.prompt // empty')
PROMPT_LEN=${#PROMPT}
WARNINGS=""

# Check 1: Prompt length (very short = likely incomplete)
if [ $PROMPT_LEN -lt 100 ]; then
  WARNINGS="${WARNINGS}SHORT_PROMPT "
fi

# Check 2: Role identity present
if ! echo "$PROMPT" | grep -qiE '(you are|role).*(visionary|analyst|builder|validator|coherent)'; then
  WARNINGS="${WARNINGS}NO_ROLE "
fi

# Check 3: File paths present
if ! echo "$PROMPT" | grep -qiE '(read|file|path).*\.(md|js|ts|py|go)'; then
  WARNINGS="${WARNINGS}NO_FILES "
fi

# Check 4: Output format specified
if ! echo "$PROMPT" | grep -qiE '(output|format|result)'; then
  WARNINGS="${WARNINGS}NO_FORMAT "
fi

# Check 5: Role file Read directive
# Verify prompt instructs agent to Read a role file (path must be present)
# Path-anchored: presence of role file path implies Read intent
# Language-agnostic: works for EN ("Read"), RU ("Прочитай"), or path-only mentions
ROLE_FILE_PATTERN='roles/(visionary|analyst|builder|validator|coherent)(_EN)?\.md'

if ! echo "$PROMPT" | grep -qiE "${ROLE_FILE_PATTERN}"; then
  WARNINGS="${WARNINGS}NO_ROLE_READ "
fi

# Check 5b: Role tag in description matches role file path in prompt
# Extraction regex accepts optional numeric suffix (e.g., [BUILDER-13]) for parallel-agent orientation.
# Suffix is stripped before file-stem matching — role identity is the stem alone.
DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // empty')
ROLE_TAG=$(echo "$DESCRIPTION" | grep -oiE '\[(visionary|analyst|builder|validator|coherent)(-[0-9]+)?\]' | head -1 | tr '[:upper:]' '[:lower:]' | tr -d '[]')

# Strip trailing -<digits> suffix to recover bare role stem for file-path matching
ROLE_TAG=$(echo "$ROLE_TAG" | sed -E 's/-[0-9]+$//')

if [ -n "$ROLE_TAG" ]; then
  EXPECTED_FILE_STEM="$ROLE_TAG"

  if ! echo "$PROMPT" | grep -qiE "roles/${EXPECTED_FILE_STEM}(_EN)?\.md"; then
    WARNINGS="${WARNINGS}ROLE_MISMATCH "
  fi
fi

# Check 6: Activation Operator directive (advisory)
if ! echo "$PROMPT" | grep -qiE '(activation operator|apply.*operator|A_F.*A_E)'; then
  WARNINGS="${WARNINGS}NO_OPERATOR_DIRECTIVE "
fi

# BLOCK if Read directive missing or role mismatch (Check 5, 5b)
if echo "$WARNINGS" | grep -qE "NO_ROLE_READ|ROLE_MISMATCH"; then
  REASON=""
  if echo "$WARNINGS" | grep -q "NO_ROLE_READ"; then
    REASON="Prompt does NOT instruct agent to Read a role file. Required: 'Read roles/{role}_EN.md' (EN tasks) or 'roles/{role}.md' (RU). META names the path, agent reads in its own context. Do NOT paste role file content. "
  fi
  if echo "$WARNINGS" | grep -q "ROLE_MISMATCH"; then
    REASON="${REASON}Role tag in description does not match role file path in prompt. "
  fi
  echo "BLOCKED: ${REASON}(Invariant 12 — self-loading pattern)" >&2
  exit 2
fi

# Advisory for non-blocking warnings
if [ -n "$WARNINGS" ]; then
  echo "BL-28 advisory: Flags: $WARNINGS (Prompt length: $PROMPT_LEN chars)" >&2
fi

exit 0
