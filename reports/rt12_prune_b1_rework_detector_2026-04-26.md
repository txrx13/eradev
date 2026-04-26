# RT-12 PRUNE-B1 Builder Report — rework-framing-detector FP discrimination guard

**Date:** 2026-04-26
**Role:** [BUILDER]
**Task:** Reduce 30-50% live FP rate of `.claude/hooks/rework-framing-detector.sh` (RT-11 Validator). Path A: rhetorical/conditional/past-tense discrimination guard.
**META framing:** "Pareto prune" (Inv 14).

## Builder Result

### Modified artifacts
- `.claude/hooks/rework-framing-detector.sh` — Option A guard inserted between trigger match and pivot check; exits 0 when message contains question mark OR rhetorical markers («стоит ли», «надо ли», «или нет», «should we», «is it worth», «whether to», «or not») OR past-tense markers («вчера», «уже менял», «yesterday», «previously») UNLESS imperative override present (`!`, «сделай», «давай», «начни»/«начинай», «do it», «now», «proceed», «ship it»).
- `BOOTSTRAP_LESSONS.md` BL-35 Tier line: appended discrimination-guard description + RT-12 PRUNE-B1 attribution. Tier remains **T1-enforced** (Option A retained, Option B not needed).
- `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` — skill mirror sync (identical Tier line; `diff` MIRROR_OK).

### Verification
- `bash -n` syntax check: **SYNTAX_OK**.
- Live FPs from RT-11 Validator (T1, T3): exit 0 ✅
- True triggers (T2 imperative, T4 active refactor): exit 2 ✅
- Regression scenarios (R1-R7) all PASS:
  - R1 «архитектурная проблема или нет?» → exit 0 (rhetorical disjunction)
  - R2 «вчера менял архитектуру тестов» → exit 0 (past tense)
  - R3 «если completely change to TS, то надо ли?» → exit 0 (conditional + rhetorical)
  - R4 «should we do a full rework or not?» → exit 0 (EN rhetorical)
  - R5 «completely change now, do it» → exit 2 (imperative override)
  - R6 `ERADEV_HOOKS_DISABLED=1` + imperative → exit 0 (env override preserved)
  - R7 empty input → exit 0 (graceful)

### Validation
- Discrimination logic: imperative markers re-arm trigger even if `?` present elsewhere → preserves operator-command intent. RT-7 NEXT-B2 BLOCK semantics fully intact for true commands; only FP class neutralized.
- Override paths preserved: `ERADEV_HOOKS_DISABLED=1` and verbal authorization unchanged.
- Logging extended: guard fires emit diagnostic to `$ERADEV_HOOKS_LOG` with marker breakdown for future tuning.

### Security & integrity
- [x] Hook degrades gracefully on missing jq/git/empty input.
- [x] Override path preserved (env var) — operator never trapped.
- [x] No secrets, no destructive ops, no new external deps.
- [x] Backwards compatible — existing imperative trigger sites still BLOCK as before.

**Blast Radius:** LOW (narrows trigger surface; failure mode is now FN rather than FP, which is recoverable via operator escalation; live FP rate at 30-50% was the operator-frustration source).

**B-check:** F=0.95 E=0.90 (1-σ)=0.95 Λ=0.85 → B=0.69 (above 0.5, no ANDON).

## Out-of-scope (per task scope)
- glossary.md / glossary_EN.md Tier-48 entries (still say T2) — separate sync task.
- BOOTSTRAP_LESSONS_universal.md L259 (T2 stale) — separate sync task.
- meta.md / CLAUDE.md doc tweaks — not required by task scope.
