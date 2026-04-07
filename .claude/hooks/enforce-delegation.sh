#!/bin/bash
# enforce-delegation.sh
# Advisory enforcement: reminds META to delegate Edit/Write via Agent tool
# NOTE: Cannot hard-block because agents also use Edit/Write
# This hook provides a friction point — META sees the warning and reconsiders

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')

# Advisory warning for direct Edit/Write usage
if [[ "$TOOL_NAME" == "Edit" ]] || [[ "$TOOL_NAME" == "Write" ]]; then
  echo '{"message": "META-Orchestrator L9 reminder: Edit/Write should be delegated via Agent tool. Are you a spawned Builder agent? If not, this is a delegation violation (BL-26)."}'
  exit 0
fi

exit 0
