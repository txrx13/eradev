#!/usr/bin/env bash
#
# build-skill.sh — Rebuild the EraDev Claude Code skill bundle (eradev-skill.zip).
#
# Purpose: automate the zip-packaging of .claude/skills/eradev/ so rebuilds are
# repeatable and cannot silently ship a stale (v8-era) SKILL.md.
#
# Usage (from anywhere):
#   bash scripts/build-skill.sh
#
# Exit codes:
#   0  — bundle rebuilt, v9 header verified
#   1  — v9 header assertion failed (bundle is stale or corrupt)
#
# Guardrails:
#   - set -euo pipefail (any error aborts the build)
#   - excludes macOS .DS_Store and Python __pycache__/ junk
#   - verifies the resulting zip contains "EraDev v9" in SKILL.md before exiting 0

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILL_ROOT="$REPO_ROOT/.claude/skills"
ZIP_PATH="$REPO_ROOT/eradev-skill.zip"

# 1. Remove stale zip (if present) so size/ctime are honest.
if [ -f "$ZIP_PATH" ]; then
  rm -f "$ZIP_PATH"
  echo "[build-skill] removed stale $ZIP_PATH"
fi

# 2. Sanity check: skill bundle source must exist.
if [ ! -d "$SKILL_ROOT/eradev" ]; then
  echo "[build-skill] ERROR: skill source not found at $SKILL_ROOT/eradev" >&2
  exit 1
fi

# 3. Build zip from .claude/skills/ so the archive contains eradev/... entries.
cd "$SKILL_ROOT"
zip -r "$ZIP_PATH" eradev/ \
  -x '*.DS_Store' \
  -x '*/__pycache__/*' \
  > /dev/null

# 4. Print human-readable size (ls -lh is portable enough for macOS + Linux).
echo "[build-skill] built $ZIP_PATH"
ls -lh "$ZIP_PATH" | awk '{print "[build-skill] size: " $5}'

# 5. Verify v9 header by peeking at SKILL.md inside the zip.
#    The first 6 lines of SKILL.md must contain the literal "EraDev v9" string.
HEADER="$(unzip -p "$ZIP_PATH" eradev/SKILL.md | head -6)"
if printf '%s\n' "$HEADER" | grep -q 'EraDev v9'; then
  echo "[build-skill] OK: SKILL.md contains 'EraDev v9'"
else
  echo "[build-skill] ERROR: SKILL.md does NOT contain 'EraDev v9'" >&2
  echo "[build-skill] First 6 lines were:" >&2
  printf '%s\n' "$HEADER" >&2
  exit 1
fi

echo "[build-skill] done"
