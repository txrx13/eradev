#!/bin/bash
# enforce-delegation.sh
# BLOCKING enforcement: META cannot use Edit/Write directly.
# Subagents (Builder, etc.) are ALLOWED — detected via agent_id field.
#
# agent_id present = subagent (ALLOW)
# agent_id absent  = main session / META (BLOCK Edit/Write)

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
AGENT_ID=$(echo "$INPUT" | jq -r '.agent_id // empty')

# If this is a subagent call, ALLOW everything
if [ -n "$AGENT_ID" ]; then
  exit 0
fi

# Main session (META) — BLOCK Edit/Write
if [ "$TOOL_NAME" = "Edit" ] || [ "$TOOL_NAME" = "Write" ]; then
  echo "BLOCKED: META-Orchestrator L9 cannot use $TOOL_NAME directly. Delegate via Agent tool to a Builder agent. (BL-26, BL-31)" >&2
  exit 2
fi

# All other tools from main session — ALLOW (git, Read, Glob, Grep, Agent, etc.)
exit 0
