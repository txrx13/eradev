#!/bin/bash
# enforce-delegation.sh
# BLOCKING enforcement: META cannot use Edit/Write or diagnostic Bash directly.
# Subagents (Builder, etc.) are ALLOWED — detected via agent_id field.
#
# agent_id present = subagent (ALLOW all)
# agent_id absent  = main session / META:
#   - Edit/Write = BLOCK
#   - Bash diagnostic (grep, curl, ssh, psql, redis-cli, jq) = BLOCK
#   - Bash operational (git, ls, cd, mkdir, zip, cp, rm, chmod) = ALLOW

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
AGENT_ID=$(echo "$INPUT" | jq -r '.agent_id // empty')

# Subagent = ALLOW everything
if [ -n "$AGENT_ID" ]; then
  exit 0
fi

# Main session (META) — Edit/Write whitelist (META output types only)
if [ "$TOOL_NAME" = "Edit" ] || [ "$TOOL_NAME" = "Write" ]; then
  FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty')

  # ALLOW: META output types
  # 1. Reports: reports/*.md
  # 2. Lessons: projects/*/lessons.md
  # 3. Memory: ~/.claude/projects/*/memory/*.md
  # 4. MEMORY.md at any project root
  if echo "$FILE_PATH" | grep -qE '(/reports/[^/]+\.md$|/projects/[^/]+/lessons\.md$|/memory/[^/]+\.md$|/MEMORY\.md$|/BL_CANDIDATES\.md$)'; then
    exit 0
  fi

  # BLOCK: everything else (code, configs, framework files)
  echo "BLOCKED: META can only Write/Edit own output types (reports/, lessons.md, memory). For code/config/framework changes, delegate to [BUILDER] agent. Path: $FILE_PATH (BL-26, BL-31)" >&2
  exit 2
fi

# Main session (META) — BLOCK diagnostic Bash
if [ "$TOOL_NAME" = "Bash" ]; then
  COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

  # ALLOW: git operations
  if echo "$COMMAND" | grep -qE '^git\s'; then
    exit 0
  fi

  # ALLOW: file ops (ls, cd, mkdir, cp, rm, zip, chmod, diff, wc, echo, cat for pipes)
  if echo "$COMMAND" | grep -qE '^(ls|cd|pwd|mkdir|cp|rm|mv|zip|unzip|chmod|diff|wc|echo|cat)\s'; then
    exit 0
  fi

  # BLOCK: diagnostic patterns
  if echo "$COMMAND" | grep -qiE '(grep|rg|curl|wget|ssh|psql|redis-cli|jq|yq|dig|nslookup|netstat|lsof|docker|kubectl)'; then
    echo "BLOCKED: META cannot run diagnostic Bash. Delegate to Check Agent ([ANALYST] or [VALIDATOR]). Command: '$(echo "$COMMAND" | head -c 80)' (BL-26)" >&2
    exit 2
  fi
fi

# All other tools — ALLOW
exit 0
