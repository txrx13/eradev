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
# Accepts optional numeric suffix for parallel-agent orientation: [BUILDER-1], [BUILDER-13], etc.
# Suffix is purely a UI/orientation aid — role stem is what matters for enforcement.
if ! echo "$DESCRIPTION" | grep -qE '^\[(VISIONARY|ANALYST|BUILDER|VALIDATOR|COHERENT)(-[0-9]+)?\]'; then
  echo "BLOCKED: Agent description must start with [ROLE] tag (optionally with numeric suffix). Got: '$DESCRIPTION'. Use: [VISIONARY], [ANALYST], [BUILDER], [VALIDATOR], [COHERENT] — or [BUILDER-1], [BUILDER-13] etc. for parallel agents. (BL-28, Invariant 9)" >&2
  exit 2
fi

exit 0
