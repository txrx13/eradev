# RT-9 ODTOE Audit — Visionary EN Lens

**Date**: 2026-04-26
**Author**: [VISIONARY] EN — strategic audit
**Scope**: ODTOE_dark_energy_merger RT-3 publication-readiness failures vs EraDev v10
**Source Hansei**: `/Users/antonpankratov/Downloads/odtoe/reports/hansei-rt3-publication-readiness-2026-04-26.md`
**Self-application**: This audit is a Visionary output applying v10 to v10 (EMP15 mirror).

---

## True North Violation Diagnosis

**True North for any article task**: a publication-grade artifact convincing a hostile external referee with no project context.

**What was actually optimized**: internal coherence (cite_check, recompute, no-fitting, AI markers) — engineering validity, not publication readiness. The 5-role team converged on **B as proxy for readiness**, but `B_research` weights (1-σ=0.35, F=0.30, E=0.20) under-weight E, the very component that measures alignment-with-external-reader. With w_E=0.20, "ready for the journal" was structurally underweighted vs "internally consistent." The team optimized what it could measure; the artifact failed on what wasn't measured.

**Root violation**: True North was operationally **redefined** (silently, by the gate set) as "passes BL-A2." The ODTOE corpus's slug-citation `[ODTOE-N]`, originally a **process-internal label**, was load-bearing for project memory but became a **publication semaphore** without anyone deciding so. This is an EMP15 instance: a framework without an enforcement gate drifts toward its creator's vocabulary.

---

## Strategic Blind Spot — IFR was set, direction was wrong

IFR was formulated (per Hansei timeline, all gates declared GREEN). What the IFR omitted: **rendered-artifact verification**. The Visionary's IFR template (past tense, with metrics) was satisfied by source-side metrics; no AC mandated a metric on the **compiled output as it appears to a reader who never saw the source**. The team had Pull-zone discipline but missed Resonance-zone signal: cross-domain bridge to "external reader" was never reified as an AC. The Hansei correctly identifies "no naive PhD-cosmologist persona for the abstract" — this is a **Resonance-zone failure** (cross-domain bridge) misclassified as Pull-zone (specific structured outcome).

---

## Top 3 Strategic Risks That Should Have Been Caught Upstream

**R1. Modal B-formula is calibrated for engineering validity, not publication readiness** (Blast Radius: ALL `B_research` projects)
- Current weights: w_(1-σ)=0.35 dominant, w_E=0.20 lowest. Hansei evidence: 13 cycles, B_mean=0.88, defects spotted in 2 seconds by operator.
- **Mitigation**: Either add `B_publication` modality with E-dominant weights for final-pass gate, OR mandate AC includes external-decoder test BEFORE B is computed. The B-formula is honest; the gate stack didn't include the right inputs. Don't change B; change what feeds E.

**R2. Operator-Decision (OD) bundling collapses individual gates** (Blast Radius: ALL XL tasks)
- Hansei: Coherencer EN P-02 raised "decision needed" on slug-citation → operator's «применить full RT-3» = bundled yes → individual OD never explicitly resolved → Builder defaulted.
- **Existing invariant coverage**: BL-34/35 require explicit operator sign-off on OD-1..OD-N for refactor composition. **This pattern is structurally identical** but the invariants only fire on refactor framing. Article-domain inherits no equivalent.
- **Mitigation**: Generalize the OD-Open list discipline (BL-35 step 6) to ALL Coherencer-flagged "decision needed" items across all domains, regardless of whether refactor framing fired.

**R3. "GREEN means ready" is a framework-level vocabulary defect** (Blast Radius: framework, all domains)
- Hansei §10 honest accounting: META declared "GREEN, commit-ready" 2× in error. The vocabulary GREEN ≡ ready is implicit in B≥0.7 conventions (BL-22 Tier mapping, Jidoka self-check). It's never been formally bound to "all domain-specific gates passed."
- **Mitigation**: META Output Specification amendment — "Synthesis" output type cannot include "ready for commit" string unless ALL domain-specific gates declared in `domain.verify.method` chain have produced PASS artifacts. T2 enforcement (pre-commit hook) > T3 (checklist).

---

## EMP Candidates (after CONSOLIDATION lift)

**EMP-CANDIDATE-A: "Engineering-validity gates underspecify domain-readiness."** Pattern: BL-A2 covers article-engineering, not article-publication. Same shape as code projects shipping with passing tests but failing UAT (user-acceptance test). Generalization: every domain has TWO orthogonal gate stacks — internal-validity (compiles/parses/recomputes) and external-readiness (lands on the reader/referee/auditor). v10 currently ships only the first stack as default. **EMP form**: "Engineering validity is necessary but not sufficient. Every `domain.verify.method` MUST declare a paired `domain.publish.method`." This generalizes Hansei BL-A5.

**EMP-CANDIDATE-B: "Bundled operator approvals hide individual ODs."** Pattern: applies to BL-34 composition hazards, BL-35 rework framing, AND article-domain stylistic ODs. Three independent occurrences = recurring pattern. Hansei §5 root-cause #5 explicit. **EMP form**: "Operator yes-to-bundle ≠ yes-to-each-OD. META's Synthesis must enumerate per-OD sign-off as discrete items, never as bulk approval."

**EMP-CANDIDATE-C: "Visual artifacts require visual verification."** Pattern: text-rendering, equation layout, figure cropping, table overflow are invisible to grep/parse/cite_check. Hansei L-A5 makes this explicit. Generalizes beyond articles: code domain has the same gap (UI screenshots aren't grepped; rendered Markdown isn't validated for actual visual layout). **EMP form**: "If the artifact is consumed visually, the gate must be visual. Source-side checks are necessary but not sufficient."

All three candidates pass the EMP threshold (≥3 instances, framework-level, cross-domain). Defer formalization until CONSOLIDATION lift (current state: 3/4 sessions stable, lift pending Session 11). Until lift: log as observations in lessons.md per roadmap rules.

---

## ROADMAP Recommendations (NOW / NEXT / DEFER)

| Rank | Item | Phase | Type | Dependency |
|------|------|-------|------|------------|
| **1** | **NOW** — Adopt BL-A5 Publication-Readiness Gate as proposed in Hansei §6, but mark as **observation only** until CONSOLIDATION lift. Append to `projects/odtoe-articles/lessons.md` (project-local L-A5..L-A10), NOT yet to global BOOTSTRAP_LESSONS.md. | This session | Hansei action item AI-4/AI-5 | Lift pending — roadmap rule "NO new BL/Invariants until lift declared" |
| **2** | **NOW** — Spawn dedicated Visual-PDF-Inspection Validator role (sub-mode of existing Validator) for any task with `domain.publish.method` set. T3 first (checklist in validator_EN.md), upgrade to T2 hook post-lift. | Next ODTOE article cycle | Role-file amendment | None — operates within current freeze window since it's mechanical drift cleanup |
| **3** | **NEXT** — After Session 11 lift: formalize EMP-CANDIDATE-A as EMP20 ("Engineering validity ≠ domain readiness"). Add `domain.publish.method` field to project config schema. Six default methods: `pdf_visual_audit`, `external_decoder_test`, `front_matter_check`, `journal_style_match`, `cross_lang_parity`, `commit_grade_check`. | Post-lift, Session 12+ | EMP + config schema | Requires CONSOLIDATION lift (3/4 conditions met) |
| **4** | **NEXT** — Generalize OD-Open discipline (currently BL-35 step 6 only) into universal Invariant 19: "Coherencer-flagged 'decision needed' items MUST be elevated by META as enumerated OD-1..OD-N before next Builder spawn, regardless of domain or refactor-framing context." Tier T2 (Coherencer output validator hook). | Post-lift | New Invariant + hook | Lift required (new Invariants frozen) |
| **5** | **DEFER (v11)** — `B_publication` modality experiment. Hypothesis: w_E=0.40, w_(1-σ)=0.30, w_F=0.20, w_Λ=0.10 for final-pass article gate. Risk: modality proliferation (currently 3, this would be 4). Gate this on whether Recommendations #3/#4 prove insufficient over 4 sessions. May be unnecessary if `domain.publish.method` correctly externalizes the readiness check from the B-formula. | v11 | Optional modality | Recommendations #3 + #4 must ship and be measured first |

**Cross-cutting note**: All 5 recommendations preserve v10's CONSOLIDATION freeze — Recommendation #1 stays project-local, #2 is mechanical, #3-#5 are gated behind lift. The freeze does NOT block this audit's logging or project-local Hansei action items per roadmap "Lessons.md additions ALLOWED (observations, not rules)."

---

## B-check (B_text — code-domain audit of code-domain framework)

- F (Focus) = 0.92 — Hansei (16.5KB) read full, eradev.md core (200 lines I-II), BL 1-35 read, roadmap + 56 lessons indexed, role file applied
- E (Alignment) = 0.94 — directly addresses operator's «глубокое исследование + 2 RT 5ки + ROADMAP» request with strategic-only lens, NO implementation, NO empirical counts (Analyst's job)
- (1-σ) (Consistency) = 0.93 — recommendations respect CONSOLIDATION freeze, OD-Open generalization aligns with BL-34/35, EMP candidates respect BL budget cap
- Λ (Experience) = 0.88 — applied L-44 (active enforcement), EMP15 (drift toward creator vocabulary), L-52 (Tier-claim falsification), BL-A5 Hansei verbatim, L-A5..L-A10 grounded

**B = 0.92^0.25 · 0.94^0.25 · 0.93^0.25 · 0.88^0.25 = 0.917** (HEALTHY)

Caveat per Hansei §10: same B-formula previously declared GREEN-in-error. Treat with structural skepticism per Invariant 18 (proposed). This audit's value is in the **content of recommendations**, not the B-score.

**Status**: audit complete. Awaiting RU-V parallel + Coherencer cross-stack synthesis.
