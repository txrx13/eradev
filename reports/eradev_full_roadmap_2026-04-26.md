# ERADEV Full Improvement Roadmap — 2026-04-26

**As of commit `30aba78`.** Consolidated backlog of ALL identified framework improvements across active waves, parked B-tasks, RT-11 untouched findings, structural disease, and aspirational v11 work.

## TL;DR — by tier

- **Tier 1 (active):** BT-1 β path Phase 2 = real Pareto prune wave (D→M→P) — designed, pending operator GO
- **Tier 2 (parked, ready):** BT-2/3/4 — identified during RT-12 + BT-1, scoped, awaiting wave
- **Tier 3 (RT-11 OPEN):** F1/F2/F8 from ODTOE session audit — surfaced but not addressed
- **Tier 4 (structural disease):** Λ_effective broken (operator-domain output near zero) — root cause
- **Tier 5 (aspirational):** v11 increment, multi-project deployment, cross-domain skin work

## Tier 1 — BT-1 β Phase 2 (active, designed)

See `reports/bt1_phase2_roadmap_2026-04-26.md` for full plan. Summary:

| Phase | Cure | LOC | Files |
|---|---|---|---|
| 2.1 | **D** axis re-anchor | ~50 + RU | eradev{,_RU}.md §II.1, meta{,_RU}.md §14, check-leverage.sh, .eradev/beta_snapshot.txt |
| 2.2 | **M** META discipline | ~31 + RU | CLAUDE.md ε_meta anchor, enforce-delegation.sh ext, meta{,_RU}.md §14 |
| 2.3 | **P** retirement organ | ~60 + RU + sweep | meta{,_RU}.md §14, lessons_archive.md, hansei template, phantom-newness-check.sh ext, all skill mirrors |
| 3 | Integrated finalize | — | Validator + zip + bundle commit + tags |

**Total:** ~184 LOC + RU mirror, 14-16 agents, 4 commits.
**Outcome:** post-cure B target ≥ 0.504 GREEN at LF≥0.70; ψ*-gap reduction expected.

## Tier 2 — Parked B-tasks (ready, awaiting wave)

### BT-2: B4 path-strip greedy fix
**Source:** `rt12_integrated_validator_2026-04-26.md` NOTE-1.
**Issue:** `enforce-delegation.sh` line 43 uses greedy `${FILE_PATH##*/eradev/}` → skill-mirror deny-pattern (lines 73-79) is dead code; falls through to generic block message instead of skill-mirror-specific.
**Fix:** non-greedy strip + ordered pattern check. ~10 LOC.
**Priority:** LOW (functional, just diagnostic-quality).

### BT-3: BL split files lag aggregate
**Source:** `rt12_integrated_validator_2026-04-26.md` NOTE-2 + Builder RU β-spec finding.
**Issue:** `BOOTSTRAP_LESSONS_universal.md` (BL-26/34/35) + `BOOTSTRAP_LESSONS_code_adapter.md` (BL-3) lag aggregate `BOOTSTRAP_LESSONS.md` after RT-12. Source-of-truth divergence. Skill-mirror drift outside BL-19 hook coverage.
**Fix:** reconcile split→aggregate sync + extend BL-19 hook to skill mirrors. ~30 LOC.
**Priority:** MEDIUM (will worsen with each wave; BT-1 β cures will widen gap).

### BT-4: enforce-delegation `rg` regex word-boundary
**Source:** RT-12 commit cycle LIVE-BLOCKED (operator commit attempt blocked by `rg` substring inside «divergence»). Self-witnessed weakness.
**Issue:** `.claude/hooks/enforce-delegation.sh` diagnostic regex alternative `rg` (ripgrep) without word boundary matches «div**rg**ence», «em**rg**ent», «su**rg**ical», etc. Plus `dig`, `jq` similar.
**Fix:** add `\b` word boundary OR escape to literal command name detection. ~5 LOC.
**Priority:** MEDIUM (blocks legitimate META commits with theoretical/strategic vocabulary).

## Tier 3 — RT-11 OPEN findings (untouched by RT-12 or BT-1 Phase 1)

Source: `reports/rt11_meta_audit_odtoe_session_2026-04-26.md` §F1/F2/F8.

### F1: Scope-bypass under operator critique
**Issue:** When operator pushes back, META expands task scope without re-classifying. Captured 2x in RT-12 cycle (rework-framing + L-A9 phantom newness audit).
**Status:** PARTIAL addressed by RT-12 B1 (rework-discrimination guard) but root pattern (META scope-creep under pressure) untouched.
**Likely fix:** scope-classification gate at every operator critique trigger. Could extend B1 hook OR add new lesson. ~20 LOC + Inv amendment.
**Priority:** MEDIUM (recurring pattern, BT-1 M-cure may partially help via intent-action separator).

### F2: GREEN-then-failed (still advisory)
**Issue:** Validator returns GREEN, operator catches issue post-ship. Not a regression but a Validator-scope blindspot. Wave A advisory NOTE only; never escalated.
**Status:** Advisory only. RT-9 amendment «GREEN ≢ ready» exists but no enforcement.
**Likely fix:** post-ship operator-feedback hook (new GitHub issue creates Hansei trigger). ~40 LOC + new template.
**Priority:** LOW-MEDIUM (rare but high-impact when fires).

### F8: OD (Operator-Domain) bundling
**Issue:** Operator-domain artifacts (e.g., `projects/odtoe-articles/`) get accidentally bundled into framework commits because no clear separation mechanism. Captured by `62359c3` cleanup (commit removing `projects/odtoe-articles` from framework repo).
**Status:** One-time manual cleanup; pattern can recur.
**Likely fix:** `.gitignore` extension OR pre-commit hook checking `projects/{name}/` paths against allow-list. ~15 LOC.
**Priority:** MEDIUM (if recurs, contaminates skill zip).

## Tier 4 — Structural disease (root cause)

**Λ_effective near zero.** RT-1 Analyst EN measured: 14d window = 171 framework-self files vs ~2 operator-domain files → leverage_factor = **0.012 RED** (25-40× below GREEN floor). Framework consumes its own cycles producing self-reform artifacts; near-zero output to operator's actual project domains.

**This is the disease BT-1 D-cure is supposed to score-fix. But BT-1 doesn't FIX the underlying behavior — it only measures it correctly.**

**True fix candidates (beyond BT-1):**
- **OD-1**: Operator-domain task scheduling — META protocol amendment requiring N% of agents per session work on operator-domain tasks (not framework-self). Hard to enforce without operator providing tasks.
- **OD-2**: Λ-effective floor as session-entry hard gate — if leverage_factor 14d <0.10, BLOCK new framework reform until ≥1 operator-domain artifact ships. Would self-throttle framework reform.
- **OD-3**: Cross-project deployment — apply EraDev to a real operator-domain project (ODTOE article finalization? a coding project?), demonstrate framework usefulness on non-self domain. This is the canonical leverage signal.

**Priority: HIGH** — without addressing this, every wave makes the score worse, not better.

**Coupling:** BT-1 β + OD-2 = synergistic. β D-cure measures it; OD-2 enforces threshold. Should ship together OR sequentially (β first, OD-2 second).

## Tier 5 — Aspirational (v11 increment)

### v11-A: Cross-domain skin maturity
**Status:** 6 domain skins exist (code/article/book/plan/research/config) but only `code` is battle-tested via eradev-self-application. Other 5 skins lack empirical validation cycles.
**Fix:** apply eradev to 1-2 article projects + 1 book project, gather skin-specific lessons, refine skins.
**Priority:** MEDIUM (depends on having operator-domain projects).

### v11-B: Multi-project deployment + skill marketplace
**Status:** EraDev currently single-repo. No deployment story for «install eradev on N projects, sync improvements across them.»
**Fix:** package eradev as installable Claude Code skill + cross-project lesson-sync protocol.
**Priority:** LOW-MEDIUM (depends on v11-A maturity).

### v11-C: Operator-domain artifact pipeline
**Status:** No standard pipeline for operator-domain output. Each project ad-hoc.
**Fix:** template + protocol for «operator-domain wave» (artifact-first, framework-incidental).
**Priority:** depends on Tier 4 OD-2/OD-3 progress.

## Tier 6 — Honest residual (Hansei-level)

Items flagged for reflection but not yet actionable:

- **Hooks growth paradox:** P-cure adds 3 new hooks while pruning. Net hook count: 9 (post-RT-12) → 12 (post-BT-1). Each hook reduces *future* growth; net effect over 5 sessions to be measured via C5 dormancy audit.
- **Phantom-newness rate:** RT-9=12.9%, RT-12=50%. Trending up — but is this real (genuine novelty) or proposers improving over time? Need 3+ data points to call.
- **Self-application recursion depth:** ψ*=Φ(ψ*) at L9 META → L9 META → ... Can framework support its own reform indefinitely? Or does each meta-layer add cost? Empirical: 11 RTs in 3 days = high meta-cost. C5 audit will partially measure.
- **Operator dependency:** every major decision currently requires operator input (option α/β/γ choice, sequence pick, etc.). Healthy delegation OR dependence? Unclear.

## Recommended sequence (next 2-4 sessions)

1. **Session 14:** Test 30aba78 (operator side, fresh project). If clean → Phase 2.1 D-cure ship.
2. **Session 15:** Phase 2.2 M-cure ship (after D dormancy clear at +1 session).
3. **Session 16:** Phase 2.3 P-cure ship + Phase 3 finalize.
4. **Session 17:** C5 dormancy audit (T1+T2+T3 falsifiable). If all 3 dormant → Hansei. If ≥1 active → BT-1 success.
5. **Session 18+:** BT-2/BT-3/BT-4 (small wave, parallel-OK since disjoint files).
6. **Session 19+:** Tier 4 OD-2 (Λ-effective floor) — couples to β D-cure.
7. **Session 20+:** Tier 3 F1 fix (scope-bypass guard).
8. **Session 21+ (long-horizon):** OD-3 cross-project deployment.

## Sources

- BT-1 design trail: `reports/composition-hazards-2026-04-26-bt1_*.md` + `reports/rt13_*.md` (12 reports)
- RT-11 audit: `reports/rt11_meta_audit_*.md` (6 reports)
- RT-12 wave: `reports/rt12_*.md` + commit `8fe68fd`
- BT-1 Phase 2 roadmap: `reports/bt1_phase2_roadmap_2026-04-26.md`
- This file: `reports/eradev_full_roadmap_2026-04-26.md`

## Caveat (Inv 18 self-blindness)

This roadmap was authored by META (the same role that earlier produced ANDON cycles operator rejected). Honest σ on prioritization is high — operator may re-rank Tier 4 vs Tier 1 based on lived experience of the framework deteriorating vs improving over the next 4 sessions. Re-evaluate after C5 audit (Session 17).
