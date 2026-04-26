# RT-12 Pareto-Prune B2 — rt1-composition-gate Path-Glob Fix

**Date:** 2026-04-26  **Role:** [BUILDER]  **Scope:** L-52 falsification recurrence closure (BL-34 hook, single-line glob fix)

## Builder Result

**Modified artifacts:**
- `.claude/hooks/rt1-composition-gate.sh` — case-glob extended: `*/reports/rt1_*.md|reports/rt1_*.md` (3 alt-pairs total: rt1-, RT1-, rt1_)
- `BOOTSTRAP_LESSONS.md` — BL-34 Tier line annotated with path-glob fix note + L-52 closure reference
- `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` — skill mirror sync, same annotation
- `projects/eradev/lessons.md` — L-52 (EMP19) sweep updated 3/4 → 4/4 with fix details + lesson on case-glob fragility

## Verification

**Syntax:** `bash -n .claude/hooks/rt1-composition-gate.sh` → SYNTAX OK

**Glob unit tests (8 scenarios):**
- `reports/rt1_test.md` (REL `_`) → MATCH
- `reports/rt1-test.md` (REL `-`) → MATCH
- `reports/RT1-test.md` (REL caps) → MATCH
- `/Users/abc/.../reports/rt1_test.md` (ABS `_`) → MATCH
- `/Users/abc/.../reports/rt1-test.md` (ABS `-`) → MATCH
- `other_path.md` → silent (no match)
- `reports/rt2_test.md` → silent
- `src/code.py` → silent

**E2E (full hook invocation):**
- Input: relative path `reports/rt1_e2e_2026-04-26.md` + payload with `refactor` x2 + `parallel` x1, no hazards file → exit 2 (BLOCK), correct stderr message. **Pre-fix would have been exit 0 (silent leak).**
- Input: `other_file.md` + same trigger words → exit 0 (silent, correct).

## Validation
- L-52 sweep claim "4/4 closed" was actually 3/4 (RT-11 Validator finding rt11_meta_audit_validator_hooks_2026-04-26.md §"L-52 sweep claim"). Now genuinely 4/4 after this fix — BL-34 hook fires symmetrically on absolute and relative paths.
- BL-19 closure pattern (RT-7 NEXT-B1) reused: declare T2, point at hook, verify hook fires via test scenarios.
- No bilingual file pair affected (hook is .sh, not .md) — BL-19 sync hook does not apply.

## Security & integrity checklist
- No secrets, no hardcoded project names, no protocol/release event. Defaults safe (override `ERADEV_HOOKS_DISABLED=1` preserved).
- Backwards compatible: pre-fix accepted absolute paths; post-fix accepts absolute + relative. No regression on existing callers.

## Blast Radius: LOW
Single hook, 3-line case-glob extension, non-blocking change for absolute-path callers. Validator T2 sweep in 4 sessions will re-verify.

## B-check
F=0.95 (read hook + role + BL-33/34 + L-52 + RT-11 finding + skill mirror) ·
E=0.95 (artifact directly closes the named falsification) ·
(1-σ)=0.95 (no conflict; consistent with BL-19 closure template) ·
Λ=0.90 (L-52 deja vu pattern recognized; case-glob fragility lesson recorded) ·
**B = 0.95 × 0.95 × 0.95 × 0.90 = 0.772 (GREEN)**
