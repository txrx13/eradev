# RT-11 META Audit — Builder bloat lens (2026-04-26)

Practitioner view. Brutal. "Framework deteriorated".

## Stats (3-day window)

22 commits, +17,605 / −1,257. 50 new reports (RT-5 = 13, RT-9 = 13). lessons.md = 361 lines / 57 entries. CLAUDE.md = 107 lines (was ~70). 8 hooks = 666 lines shell.

## 1. Decision overhead

| Era | Items | Sub | Tokens before first spawn |
|---|---|---|---|
| b1486ed | 7 | 0 | ~250 |
| Today | 12 | 5b/5c/6b/7b + GREEN + Omega + BL-comp + freshness | ~1,400 |

**5.6× checklist inflation.** ~6 of 12 gates fire on a typical M-task.

## 2. Ceremony:work for typical M-task

Bootstrap print 3-5m + RIGOR cascade 1-2m + comp-hazards 1-10m + baseline 1-3m + RT-1 8-15m + μ-check 2-5m + **Builder real 5-15m** + Validator 2-5m + pre-commit 2-15s. **Ratio 2:1 to 5:1 ceremony:work.** S-tasks: ~4m checklist for ~3m work.

## 3. Hook friction

8 sequential pre-commit hooks. Override matrix: PN_OVERRIDE / BL19_OVERRIDE / ERADEV_HOOKS_DISABLED / --no-verify / `--phantom-checked` sentinel = **5 paths for 4 hooks.** Operator can't remember which disables what.

## 4. Decision paralysis

| Decision | Failure mode |
|---|---|
| RIGOR_LEVEL (4-val × per-task/seg × cascade × override) | Asked every task; 90% defaults to strict |
| BIM full/partial/off | Auto-derived from RIGOR; harmless |
| FLUX vs RT-1 | Underused; trigger unclear |
| BL extend vs new | PN-1 hook mechanizes — OK |
| μ-check BLOCKING vs ADVISORY | Another lookup |

## 5. ROI retro

**TOP-3:** PN-1 hook (mechanically blocks dup L-N) · BL-19 sync hook (EN/RU drift was real) · Inv 13 MAX parallelism (5+ agents/turn).

**BOTTOM-3:** Omega(H_hist) per session (cross-project Λ rarely fires — theatre) · GREEN ≢ ready amendment (1-line lesson became 25-line amendment) · RT-5+RT-9 13-file pattern (26 reports of self-audit, recursive overhead).

**Honest tally:** 11 RTs in 3 days, 50 reports, **zero operator-domain output.** Framework consumed itself.

## 6. Recommendations

**Prune (S):**
- Bootstrap 5c/9/11 → trigger-only printing (default = 7 items)
- GREEN amendment → one line in Validator role file
- Override paths → keep ERADEV_HOOKS_DISABLED + --no-verify; drop rest

**Merge (extend>add):**
- BL-22 PRE-FLIGHT + 5c baseline-health → one concept
- Bundle B μ-check + Bundle D RIGOR branch → single spec, conditional matrix
- Inv 11 + Inv 13 → "Default parallel; sequential on data-dep or operator request"
- L-52..L-58 → one mega-pattern: "Every claim is a verifiable hypothesis or it lies"

**Cap (M):**
- RT-N reports: max 5 (one per role; EN+RU = one deliverable)
- Internal-audit RT cadence: 1/session, not 11 in 3 days

**Keep:** Inv 1+2+3 (core identity), Activation Operator, 6 output types, fix-chain hook, universality-gate, EN/RU bifurcation.

## Verdict

Framework grew 5.6× checklist surface, ~50% core lines in 3 days. **90%+ of growth is internal-audit machinery, not operator capability.** Self-audit RTs run faster than operator work. That is the bloat signature.

## B-check

F=0.9 · E=0.95 · (1−σ)=0.85 · Λ=0.85 · **B=0.62 (GREEN structural, not "ready").** Blast Radius: MEDIUM.
