#!/bin/bash
# enforce-delegation.sh
# BLOCKING enforcement: META cannot use Edit/Write or diagnostic Bash directly.
# Subagents (Builder, etc.) are ALLOWED — detected via agent_id field.
#
# agent_id present = subagent (ALLOW all)
# agent_id absent  = main session / META:
#   - Edit/Write to FRAMEWORK files = BLOCK (always, overrides whitelist)
#     - rt12 / Wave Prune extension: closes ODTOE F4 (META direct Edit/Write
#       under operator critique). 5 direct edits at 11:50–11:56 to
#       Hansei/lessons/CLAUDE.md were the root violation. Whitelist paths
#       (reports/lessons/memory) stay open as legitimate META outputs;
#       framework files (CLAUDE.md, eradev.md, roles, hooks, scripts) are
#       a hard deny list regardless of context.
#   - Edit/Write to META output types = ALLOW (whitelist)
#   - Edit/Write elsewhere = BLOCK
#   - Bash diagnostic (grep, curl, ssh, psql, redis-cli, jq) = BLOCK
#   - Bash operational (git, ls, cd, mkdir, zip, cp, rm, chmod) = ALLOW
#
# Emergency override: ERADEV_HOOKS_DISABLED=1 (P0 only; post-incident Hansei mandatory).

# Emergency override (P0 incident only — post-incident Hansei mandatory per CLAUDE.md Inv 8)
if [ "${ERADEV_HOOKS_DISABLED:-0}" = "1" ]; then
  exit 0
fi

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
AGENT_ID=$(echo "$INPUT" | jq -r '.agent_id // empty')

# Subagent = ALLOW everything (delegation flow active)
if [ -n "$AGENT_ID" ]; then
  exit 0
fi

# Main session (META) — Edit/Write enforcement
if [ "$TOOL_NAME" = "Edit" ] || [ "$TOOL_NAME" = "Write" ] || [ "$TOOL_NAME" = "MultiEdit" ]; then
  FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty')

  # Strip leading repo root (path may be absolute or relative)
  # BT-2: use non-greedy '#*/eradev/' (shortest prefix match) so nested
  # '/eradev/' segments inside the project (e.g. projects/eradev/...,
  # .claude/skills/eradev/...) are preserved in REL_PATH. The previous
  # greedy '##*/eradev/' stripped through the LAST '/eradev/', making the
  # skill-mirror deny-pattern (lines below) dead code for any nested path.
  REL_PATH="${FILE_PATH#*/eradev/}"

  # ----- HARD BLOCK: framework files (rt12 Wave Prune, ODTOE F4 closure) -----
  # These paths MUST never be edited by META directly, even though some
  # (e.g. CLAUDE.md when the bare basename matched in old whitelist regex)
  # could otherwise slip through. Order matters: this check runs BEFORE
  # the whitelist so framework files cannot be exfiltrated via path tricks.
  if echo "$REL_PATH" | grep -qE '^(CLAUDE\.md|eradev\.md|eradev_RU\.md|meta\.md|meta_RU\.md|FOUNDATIONS\.md|LOADING_PROTOCOL\.md|BOOTSTRAP_LESSONS([^/]*)?\.md)$'; then
    echo "BLOCKED: META cannot directly Edit/Write framework files (BL-26 + Inv 1)." >&2
    echo "Path: $FILE_PATH is framework-scope (CLAUDE/eradev/meta/BL/FOUNDATIONS)." >&2
    echo "Required: spawn [BUILDER] agent via Agent tool." >&2
    echo "Override: ERADEV_HOOKS_DISABLED=1 (P0 emergency only; post-incident Hansei mandatory)." >&2
    exit 2
  fi

  if echo "$REL_PATH" | grep -qE '^(roles|templates)/.*\.md$'; then
    echo "BLOCKED: META cannot directly Edit/Write framework files (BL-26 + Inv 1)." >&2
    echo "Path: $FILE_PATH is framework-scope (role / template)." >&2
    echo "Required: spawn [BUILDER] agent via Agent tool." >&2
    echo "Override: ERADEV_HOOKS_DISABLED=1 (P0 emergency only; post-incident Hansei mandatory)." >&2
    exit 2
  fi

  if echo "$REL_PATH" | grep -qE '^(\.claude/hooks|\.githooks|scripts)/.*\.sh$'; then
    echo "BLOCKED: META cannot directly Edit/Write framework files (BL-26 + Inv 1)." >&2
    echo "Path: $FILE_PATH is framework-scope (hook / script)." >&2
    echo "Required: spawn [BUILDER] agent via Agent tool." >&2
    echo "Override: ERADEV_HOOKS_DISABLED=1 (P0 emergency only; post-incident Hansei mandatory)." >&2
    exit 2
  fi

  # Skill mirror of framework files is also framework-scope
  if echo "$REL_PATH" | grep -qE '^\.claude/skills/eradev/.*\.md$'; then
    echo "BLOCKED: META cannot directly Edit/Write framework files (BL-26 + Inv 1)." >&2
    echo "Path: $FILE_PATH is framework-scope (skill mirror)." >&2
    echo "Required: spawn [BUILDER] agent via Agent tool." >&2
    echo "Override: ERADEV_HOOKS_DISABLED=1 (P0 emergency only; post-incident Hansei mandatory)." >&2
    exit 2
  fi

  # ----- WHITELIST: META output types (per CLAUDE.md "6 output types") -----
  # 1. Reports: reports/*.md
  # 2. Lessons: projects/*/lessons.md
  # 3. Memory: ~/.claude/projects/*/memory/*.md
  # 4. MEMORY.md at any project root
  # 5. BL_CANDIDATES.md (background instinct extraction)
  if echo "$FILE_PATH" | grep -qE '(/reports/[^/]+\.md$|/projects/[^/]+/lessons\.md$|/memory/[^/]+\.md$|/MEMORY\.md$|/BL_CANDIDATES\.md$)'; then
    exit 0
  fi

  # BLOCK: everything else (code, configs, residual framework files outside whitelist)
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
  # BT-4: word boundaries (\b) prevent substring matches inside legitimate
  # vocabulary. Without \b, the short tokens 'rg' / 'dig' / 'jq' / 'yq'
  # match inside ordinary words like 'divergence', 'paradigm', 'jquery',
  # 'syzygy' — blocking META commits with theoretical/strategic prose.
  # Self-witnessed in RT-12 commit cycle (operator commit message
  # containing "divergence" was LIVE-BLOCKED by the unbounded 'rg').
  if echo "$COMMAND" | grep -qiE '\b(grep|rg|curl|wget|ssh|psql|redis-cli|jq|yq|dig|nslookup|netstat|lsof|docker|kubectl)\b'; then
    echo "BLOCKED: META cannot run diagnostic Bash. Delegate to Check Agent ([ANALYST] or [VALIDATOR]). Command: '$(echo "$COMMAND" | head -c 80)' (BL-26)" >&2
    exit 2
  fi
fi

# All other tools — ALLOW
exit 0
