#!/bin/bash
# pre-validator-handoff.sh
# R-3 (Wave 6 / Task B): defence-in-depth for Inv 18 (R-1) + Validator role-card 4-tuple (R-2).
# Triggers PostToolUse on Agent tool when description starts with [VALIDATOR].
# Scans agent output for evidence-block 4-tuple: {name, command, stdout_excerpt, verdict}.
#
# Policy:
#   v10.0 (default)              → ADVISORY: warn on stderr, exit 0 (handoff proceeds).
#   v10.1+ (ERADEV_VALIDATOR_STRICT=1) → BLOCK: warn on stderr, exit 2 (handoff rejected).
#
# Source: reports/eradev-improvement-recommendations-2026-04-27.md §R-3.
# Rationale: BL-16 (reading the framework ≠ applying the framework) — R-1 + R-2 normative
# .md instructions can be ignored at the META layer; this hook is the runtime backstop.
#
# Emergency override: ERADEV_HOOKS_DISABLED=1 (P0 only; post-incident Hansei mandatory).

if [ "${ERADEV_HOOKS_DISABLED:-0}" = "1" ]; then
  exit 0
fi

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')

# Only inspect Agent tool calls
if [ "$TOOL_NAME" != "Agent" ]; then
  exit 0
fi

DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // empty')

# Match only [VALIDATOR] handoffs (case-insensitive, anchored at start; allow leading whitespace).
if ! echo "$DESCRIPTION" | grep -qiE '^\s*\[VALIDATOR\]'; then
  exit 0
fi

# Extract Validator output. PostToolUse delivers the agent's response under .tool_response;
# fall back to common alternative shapes (.tool_response.content, .tool_output) for
# forward-compatibility with harness variations.
OUTPUT=$(echo "$INPUT" | jq -r '
  if (.tool_response | type) == "string" then .tool_response
  elif (.tool_response | type) == "object" then
    (.tool_response.content // .tool_response.text // .tool_response.output // (.tool_response | tostring))
  elif .tool_output then (.tool_output | tostring)
  else empty
  end
' 2>/dev/null)

# If output is empty, we cannot inspect — log advisory and exit 0 (don't block on missing data).
if [ -z "$OUTPUT" ]; then
  echo "pre-validator-handoff advisory: tool_response empty or unrecognised shape — skipping evidence-block scan." >&2
  exit 0
fi

# Step 1: enumerate L-N / BL-N gate references in the Validator output.
# Pattern: L- followed by 1+ digits, or BL- followed by 1+ digits.
GATE_REFS=$(echo "$OUTPUT" | grep -oiE '\b(L|BL)-[0-9]+\b' | sort -u)
GATE_COUNT=$(echo "$GATE_REFS" | grep -c . || true)

# Step 2: count complete 4-tuples in the output. A "complete" 4-tuple is the simultaneous
# presence of all four field labels (name:, command:, stdout_excerpt:, verdict:) anywhere
# in the output. We also count occurrences of each as a sanity check for partial blocks.
NAME_COUNT=$(echo "$OUTPUT" | grep -cE '^\s*[*-]?\s*\bname\s*:' || true)
COMMAND_COUNT=$(echo "$OUTPUT" | grep -cE '^\s*[*-]?\s*\bcommand\s*:' || true)
STDOUT_COUNT=$(echo "$OUTPUT" | grep -cE '^\s*[*-]?\s*\bstdout_excerpt\s*:' || true)
VERDICT_COUNT=$(echo "$OUTPUT" | grep -cE '^\s*[*-]?\s*\bverdict\s*:' || true)

# Determine completeness:
#   - At least one full 4-tuple (all four labels present at least once).
#   - At least as many `command:` and `stdout_excerpt:` lines as `name:` lines (no missing fields per gate).
EVIDENCE_OK=1
REASON=""

if [ "$NAME_COUNT" -lt 1 ] || [ "$COMMAND_COUNT" -lt 1 ] || [ "$STDOUT_COUNT" -lt 1 ] || [ "$VERDICT_COUNT" -lt 1 ]; then
  EVIDENCE_OK=0
  REASON="missing one or more 4-tuple fields (name=$NAME_COUNT, command=$COMMAND_COUNT, stdout_excerpt=$STDOUT_COUNT, verdict=$VERDICT_COUNT)"
fi

# If any gate is referenced but `command:` lines are fewer than `name:` lines, evidence is partial.
if [ "$EVIDENCE_OK" -eq 1 ] && [ "$NAME_COUNT" -gt 0 ]; then
  if [ "$COMMAND_COUNT" -lt "$NAME_COUNT" ] || [ "$STDOUT_COUNT" -lt "$NAME_COUNT" ]; then
    EVIDENCE_OK=0
    REASON="partial 4-tuples: $NAME_COUNT name(s) but $COMMAND_COUNT command(s) / $STDOUT_COUNT stdout_excerpt(s)"
  fi
fi

# If the Validator referenced gates (L-N / BL-N) but produced ZERO 4-tuple fields,
# this is the canonical bare-verdict failure mode (Critique 2026-04-27 trio).
if [ "$EVIDENCE_OK" -eq 1 ] && [ "$GATE_COUNT" -gt 0 ] && [ "$NAME_COUNT" -eq 0 ]; then
  EVIDENCE_OK=0
  REASON="$GATE_COUNT gate reference(s) found ($(echo "$GATE_REFS" | tr '\n' ' ')) but no 4-tuple evidence block"
fi

if [ "$EVIDENCE_OK" -eq 1 ]; then
  exit 0
fi

# Failure path: emit canonical message.
MESSAGE=$(cat <<'EOF'
BLOCKED: Validator handoff lacks evidence block (Inv 18 / R-2).
Re-spawn Validator with directive:
"For each L-N or BL-N gate referenced, produce {name, command, stdout_excerpt, verdict} 4-tuple. Bare verdicts will not be accepted."

Soft policy applies in v10.0 — advisory only. Set ERADEV_VALIDATOR_STRICT=1 to enforce as BLOCK.
EOF
)

echo "$MESSAGE" >&2
echo "Detected: $REASON" >&2

# Strict mode → BLOCK (exit 2). Default → ADVISORY (exit 0).
if [ "${ERADEV_VALIDATOR_STRICT:-0}" = "1" ]; then
  exit 2
fi

exit 0
