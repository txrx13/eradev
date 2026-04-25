# RT-7 NEXT-B2 Builder Report — rework-framing-detector advisory → BLOCK

**Date:** 2026-04-25
**Role:** [BUILDER]
**Task:** Convert `.claude/hooks/rework-framing-detector.sh` from `exit 0` advisory to `exit 2` BLOCKING; resolve L-52 Tier-claim falsification (BL-35 said T2-detector but hook never blocked).

## Builder Result

### Modified artifacts
- `.claude/hooks/rework-framing-detector.sh` — final `exit 0` (advisory) → `exit 2` (BLOCK); message redirected to stderr (`cat >&2`) so Claude Code feeds it to model on UserPromptSubmit; expanded with override paths + 6-step sequence.
- `BOOTSTRAP_LESSONS.md` BL-35 Tier line: `T2 (regex detector)` → `T1-enforced (UserPromptSubmit hook exits 2 BLOCKING ... override via ERADEV_HOOKS_DISABLED=1)`.
- `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` — skill mirror sync (identical Tier-line update).

### Override mechanism (Inv 14 safety)
1. `ERADEV_HOOKS_DISABLED=1` env var (line 4, pre-existing) — bypasses all hook logic with `exit 0`.
2. Operator-explicit verbal authorization ("skip rework audit" / "proceed without Hansei") documented in stderr message; META cites in next turn.

### Verification
- `bash -n` syntax check: PASS (`SYNTAX_OK`).
- Scenario T1 (trigger match + active pivot, current repo has recent feat/refactor commits): exits **2**, BL-35 message printed to stderr. PASS.
- Scenario T2 (benign prompt, no trigger): exits **0**, no output. PASS.
- Scenario T3 (`ERADEV_HOOKS_DISABLED=1` + trigger match): exits **0**, no output. Override works. PASS.
- Scenario T4 (empty input): exits **0** gracefully. PASS.

### Validation
- All 4 paths tested with real `jq` JSON input. Stderr (`cat >&2`) is documented Claude Code mechanism for `exit 2` UserPromptSubmit feedback. `ACTIVE_PIVOT=0` still exits 0 — intentional: BL-35 says "DURING active pivots".

### Security & integrity
- [x] Hook still degrades gracefully on missing `jq`/`git`/empty input (no false-positive blocks).
- [x] Override path preserved (env var) — operator never trapped.
- [x] No secrets, no destructive ops added.
- [x] Backwards compatible — env-var disable works exactly as before.

**Blast Radius:** MEDIUM (changes META session behavior on regex match; but override path preserved + only fires on rare trigger+pivot combo).

**B-check:** F=0.95 E=0.95 (1-σ)=0.95 Λ=0.85 → B=0.73 (well above 0.5 threshold, no ANDON).

## Out-of-scope items (deferred per task scope)
- meta.md §14 item 7b doc update (mention "BLOCKING" Tier) — separate task if needed.
- CLAUDE.md Inv 16 wording update (mention hook BLOCK semantics) — separate task if needed.
