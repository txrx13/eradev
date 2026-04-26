# RT-12 Prune B5: in-session-fix-counter (close ODTOE F7)

**Date:** 2026-04-26
**Role:** [BUILDER]
**Task:** Pareto prune — close ODTOE F7 fix-chain blindness (BL-3 hook saw committed `^fix:` only).

## Builder Result

### Modified artifacts
- `.claude/hooks/in-session-fix-counter.sh` (NEW, 2.6 KB, +x) — PreToolUse hook on Agent tool, counts in-session fix-pattern spawns, BLOCKS at >=3
- `.claude/settings.json` — registered new hook in PreToolUse Agent matcher chain (3rd in line, after agent-role-tag.sh + agent-context-check.sh)
- `.gitignore` (NEW) — excludes `.eradev/fix-counter-*.txt` (session-scoped, daily rotating)
- `BOOTSTRAP_LESSONS.md` BL-3 — added Hook reference (RT-12, 2026-04-26) closing ODTOE F7
- `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` BL-3 — skill mirror sync (identical update)

### Hook semantics
- **Trigger:** PreToolUse on Agent tool calls only (other tools exit 0 immediately)
- **Pattern:** `\b(fix|fix-up|repair|patch|correct)\b` (EN, case-insensitive) OR `исправ` (RU, no boundary needed for Cyrillic)
- **Counter:** `.eradev/fix-counter-{YYYY-MM-DD}.txt`, append-only, one line per fix-attempt, format `{timestamp}\t{description}`
- **Reset:** new date (file rotates daily) → 24h gap = automatic counter reset
- **Block threshold:** count >= 3 → exit 2 with stderr message (BL-3 violation, recent attempts, override instructions)
- **Overrides:** `ERADEV_HOOKS_DISABLED=1` (global) OR `BL3_OVERRIDE=1` (BL-3-only); both checked at top, exit 0 before any logic

### Verification
- `bash -n in-session-fix-counter.sh` → SYNTAX_OK
- `jq . settings.json` → JSON_OK (valid)
- E2E hook test (6 paths): non-Agent skip, Agent-no-fix pass, fix #1 pass, fix #2 (RU `исправь`) pass, fix #3 BLOCKED with exit=2 + diagnostic stderr, override pass — all 6 expected exits matched
- Counter file rotation: file path includes `$(date +%Y-%m-%d)` — automatic daily reset confirmed
- Hook executable: `-rwxr-xr-x` confirmed via `ls -la`

### Validation
- Skill mirror parity: BL-3 entries identical in `BOOTSTRAP_LESSONS.md` and `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md`
- Pattern follows existing hook conventions: `set -euo pipefail`, `jq -r` parsing, `ERADEV_HOOKS_DISABLED` global override, `$ERADEV_HOOKS_LOG` log redirect, `exit 2` for BLOCK, stderr for diagnostic
- BL-30 defense-in-depth: in-flight session counter + existing committed-message check work in tandem (different surfaces, same rule)
- BL-33 Tier ladder: T2 hook (was T2 hook) — no tier upgrade needed; existing T2 narrowed scope to commits only, this hook closes the in-session gap

### Security & integrity checklist
- [x] No secrets in plaintext, no real credentials
- [x] Defaults safe for fresh installation (no counter file = count 0, hook exits 0)
- [x] Backwards compatible: pre-existing `.eradev/` ignored if missing (mkdir -p creates)
- [x] Override mechanism documented in stderr message
- [x] Counter file gitignored (session-scoped, not for commit)

### Blast Radius: LOW
Hook runs in isolation; failure mode is exit 2 (block) only after >=3 fix attempts. Override available. No state leaked across sessions (date-rotation).

### B-check
F=0.95 (read all relevant hooks, BL-3, settings, role file)
E=0.95 (closes F7 exactly: in-flight Agent spawn detection, daily counter, override hatch)
(1-s)=0.95 (matches existing hook patterns, no conflicts; skill mirror in sync)
L=0.90 (applied BL-30 defense-in-depth, BL-33 tier-T2, Inv-11 ordering)
**B = 0.95 * 0.95 * 0.95 * 0.90 = 0.77** (above ANDON 0.5, above gate 0.7)
