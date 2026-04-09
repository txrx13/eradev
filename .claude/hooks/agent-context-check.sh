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
if ! echo "$PROMPT" | grep -qiE '(you are|role).*(visionary|analyst|builder|validator|coherencer)'; then
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

# Check 5: Role file content loaded (signature phrases)
if ! echo "$PROMPT" | grep -qiE '(activation operator|jidoka self-check|jidoka|B-diagnostics|blast radius)'; then
  WARNINGS="${WARNINGS}NO_ROLE_FILE "
fi

# Check 6: Role file completeness (last section present = not truncated)
if ! echo "$PROMPT" | grep -qiE '(output format|формат выхода|Builder Result|Результат Строителя|Validator Report|Отчёт Валидатора)'; then
  WARNINGS="${WARNINGS}TRUNCATED_ROLE "
fi

# BLOCK if role file content missing (Check 5) or truncated (Check 6)
if echo "$WARNINGS" | grep -qE "NO_ROLE_FILE|TRUNCATED_ROLE"; then
  REASON=""
  if echo "$WARNINGS" | grep -q "NO_ROLE_FILE"; then
    REASON="Missing signatures: Activation Operator, Jidoka Self-Check."
  fi
  if echo "$WARNINGS" | grep -q "TRUNCATED_ROLE"; then
    REASON="${REASON} Role file appears truncated: Output Format section missing."
  fi
  echo "BLOCKED: Agent prompt lacks FULL role file content. Read roles/{role}_EN.md or roles/{role}.md and include COMPLETE file in prompt.${REASON} (Invariant 12)" >&2
  exit 2
fi

# Advisory for other warnings (not blocking)
if [ -n "$WARNINGS" ]; then
  echo "BL-28 advisory: Agent prompt may be missing context. Flags: $WARNINGS (Prompt length: $PROMPT_LEN chars)" >&2
fi

exit 0
