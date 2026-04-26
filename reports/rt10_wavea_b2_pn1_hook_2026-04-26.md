# RT-10 Wave A B2 — PN-1 phantom-newness pre-commit hook (Builder report)

**Date:** 2026-04-26  **Role:** [BUILDER]  **Task:** Tier-T2 hook upgrade for L-58 (pre-grep mandate); closes RT-9 recursive phantom-newness (12.9 % genuine; L-A9 = dup L-1).

## Modified artifacts
- `NEW` `.githooks/phantom-newness-check.sh` (exec, 5.4 KB)
- `MOD` `.githooks/pre-commit` — PN-1 gate chained after BL-19 sync
- `MOD` `BOOTSTRAP_LESSONS.md` — Phantom NEWNESS clause appended to BL-29
- `MOD` `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` — skill mirror (byte-identical)

## Hook semantics
1. Pre-commit. Active for staged `*.md` only.
2. Scans staged additions (`git diff --cached | grep '^+'`) for new ID headings
   `### L-N:` / `### EMP-N:` / `### BL-N:`.
3. Tokenises title (lower, ASCII+Cyrillic words ≥ 4 chars, ≤ 8 keywords),
   greps against `lessons.md`, `lessons_archive.md`, `BOOTSTRAP_LESSONS.md`,
   `eradev.md`, `FOUNDATIONS.md`, `projects/*/lessons.md`.
4. ≥ 2 keyword overlaps → exit 1 + violation message (proposed ID, full title,
   matched keywords, top file) + resolution menu.
5. Override: `PN_OVERRIDE=1`, `--phantom-checked` in commit msg, or `ERADEV_HOOKS_DISABLED=1`.

## Verification
- `bash -n` → syntax OK; hook executable (-rwxr-xr-x)
- 6 scenarios (all pass):
  1. L-999 overlapping title → exit 1 + full violation
  2. L-998 novel title → exit 0
  3. L-997 overlap + `PN_OVERRIDE=1` → exit 0
  4. Empty staging / no IDs → exit 0
  5. EMP18 collision (Tier falsification path-c) → exit 1
  6. Real BL-29 update (sub-bold, no new BL-N) → exit 0
- Full chain (BL-3 → univ-gate → BL-19 → PN-1) on fixture: rc=1 on overlap, rc=0 on novel
- BL-33 PreToolUse satisfied (sub-heading ≠ new BL-N)

## Bug fixed during build
BSD `grep -oE '...[^\n]*'` reads `\n` in `[...]` as literal `n`. Title
`terminology drift verify glossary` truncated at first `n` (`TeX ligatures termi`,
19 chars). Replaced with `.*` (grep -E single-line by default). Title now full-length;
all 5 valid keywords emit (drift, glossary, ligatures, terminology, verify).

## Security & integrity
- No secrets; reads only repo files
- `set -euo pipefail`; sandboxed override paths documented
- Backwards-compatible: no-op without new ID headings or non-`.md` staging

## Blast Radius
LOW — opt-in chain, multiple overrides, no write side effects. Worst case: false
positive on novel ID with common keyword → operator overrides.

## B-check
F=0.95 E=0.95 (1-σ)=0.90 Λ=0.90 → **B = 0.73**

## Out of scope
B1 article skin · B3 meta.md · B4 roadmap

## Notes for META
- PN-1 = second hook chained from `.githooks/pre-commit` (after BL-19).
- BL-29 phantom NEWNESS now T2 (was T3 in L-58 codification).
- Recursive BL-16 closure: hook is the enforcement layer L-58 identified
  as missing — without it, L-58 itself was Lambda-zero per BL-33.

---

## Addendum — Universality Gate self-fix (2026-04-26)

**Trigger:** PR-Gate (Universality) blocked initial commit on hardcoded
`projects/odtoe-articles/lessons.md` in `EXISTING_FILES` array. Recursive
self-application: the gate caught its own enforcement hook violating
universality. (BL-16 closure, second order.)

**Fix:** Replaced explicit per-project entries with a glob loop over
`projects/*/lessons.md` and `projects/*/lessons_archive.md`. Static anchors
(`BOOTSTRAP_LESSONS.md`, `eradev.md`, `FOUNDATIONS.md`) retained as repo-root
list. Filtered to existing files only (preserves prior behavior).

**Verification:**
- `bash -n` → syntax OK
- `grep "odtoe-articles\|projects/eradev/lessons" .githooks/phantom-newness-check.sh` → 0 matches
- `grep "projects/\*/lessons" .githooks/phantom-newness-check.sh` → 2 matches (comment + glob)
- `git add -A && bash .githooks/pre-commit` → exit 0
  (`[universality-gate] OK: framework scope is universality-clean`)
- `bash .githooks/phantom-newness-check.sh` (isolated) → exit 0

**B-check (addendum):** F=1.0 E=1.0 (1-σ)=1.0 Λ=0.95 → **B = 0.95**.
Blast Radius: LOW — single-file edit, behavior preserved (existing glob loop
already covered all projects; this just removes hardcoded duplicates).
