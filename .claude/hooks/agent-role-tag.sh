#!/bin/bash
# agent-role-tag.sh
# BLOCKING: Agent description MUST start with [ROLE] tag (BL-28, Invariant 9)
# Validates: [VISIONARY], [ANALYST], [BUILDER], [VALIDATOR], [COHERENT]

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')

# Only check Agent tool calls
if [ "$TOOL_NAME" != "Agent" ]; then
  exit 0
fi

DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // empty')

# Check [ROLE] tag at start of description
if ! echo "$DESCRIPTION" | grep -qE '^\[(VISIONARY|ANALYST|BUILDER|VALIDATOR|COHERENT)\]'; then
  echo "BLOCKED: Agent description must start with [ROLE] tag. Got: '$DESCRIPTION'. Use: [VISIONARY], [ANALYST], [BUILDER], [VALIDATOR], [COHERENT]. (BL-28, Invariant 9)" >&2
  exit 2
fi

exit 0
