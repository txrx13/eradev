# META Hansei — Framework Improvements from PLUGY 19-bug Burst

> Date: 2026-04-20
> Session: META-META reflection (RT-1 5-role synthesis)
> Source incident: PLUGY (AI-PBX) 19-bug burst over 48h → operator declared architectural rework
> Triggered by: `reports/hansei-architectural-rework-2026-04-20.md` (PLUGY-local)
> Status: RT-1 synthesis COMPLETE — Phase 1 (P0) edits authorized by operator for immediate implementation
> Framework version: EraDev v10

---

## 0. Operator directive (verbatim)

> "Глубоко изучи сессию PLUGY (AI-PBX) а так же отчет hansei-architectural-rework-2026-04-20.md и продумай какие улучшения необходимо сделать чтобы недоупскать ошибок которые произошли в этой сессии разработки"

Translation: "Study deeply the PLUGY session and the hansei report, and think through what improvements need to be made to prevent the errors that happened in this development session."

Follow-up: "вноси сразу изменения в eradev" (apply changes directly to EraDev framework).

---

## 1. RT-1 team composition and convergence

Five RU-stack role agents, parallel background execution per Invariant 13:

| Role | B | Key contribution |
|---|---|---|
| [VISIONARY] | 0.619 | 5 violated ODTOE invariants; Push/Pull/Resonance priorities; Apophatic OOD check |
| [ANALYST] | 0.585 | **6/6 PLUGY bug classes have form-1 (docs) rules, 0/6 have form-3 (hook/CI) — super-bottleneck**; TOC/TRIZ/SMD per class |
| [BUILDER] | 0.585 | Concrete SPEC at file:line precision; MERGE/RETIRE plan; 3 enforcement hooks |
| [VALIDATOR] | 0.585 | 7-Q overfit filter; 14 framework-level NO-GO items; phantom-coherence model `S_framework = 1 - 0.04·ln(1+N_rules)` → threshold N=35 |
| [COHERENCER] | 0.678 | Cross-project Λ scan: **Ω = 1.385–1.458** healthy; 7/10 PLUGY lessons have cross-project echo; glossary unification |

`S_team = 0.88` (high convergence after resolving Analyst BL-33/34/35 vs Builder BL-33/34/35 nomenclature collision). `S_adjusted = 0.88 · 0.610 = 0.537` (healthy). `Ω(H_hist) = 1.36` (N_relevant = 10 applied BLs). **`S_total = 0.537 · 1.36 = 0.730`** — ABOVE v10 target of 0.7.

---

## 2. Super-bottleneck identified (Analyst + Coherencer consensus)

**All 6 PLUGY bug classes (A/B/C/D/E/F) have documentation-level rules (form 1 per meta.md §13). ZERO have automated enforcement (form 3).** This is the meta-gap that produced the 19-bug burst:

| Class | BD spent | Rule exists in | Enforcement form missing |
|---|---|---|---|
| A — Dual-source divergence | 4.5 BD | BL-40 (PLUGY-local) | No cross-service atomic-write gate |
| B — Async delivery gaps | 8 BD | BL-36 (PLUGY-local) | No transport-vs-semantic linter |
| C — State-machine races | 12 BD | BL-42 (PLUGY-local) | No N+1-atomic-on-shared-timeline check |
| D — Guardrail sprawl | 6 BD | BL-35 + BL-50 (PLUGY-local) | BL-35 is policy-only; BL-50 not yet shipped |
| E — Config/secret drift | 7 BD | BL-37 + BL-48 (PLUGY-local) | `verify-secrets.sh` never built |
| F — Liveness absence | 6 BD | BL-47 (post-hoc) | No monitoring-tier attestation gate |

**Cross-class bottleneck: meta.md §13 enforcement ladder has only 3 tiers (docs / checklist / hook). PLUGY EMP6 proved a 4th tier is required: compile-time / type-level / schema-level structural impossibility.**

---

## 3. Five ODTOE-invariants violated (Visionary)

1. **I-1 Weak Link Principle (B = F·E·(1-σ)·Λ multiplicative) on ops layer.** sipguard Λ=0 (config→nonexistent path), fail2ban F=0 (asterisk jail absent), ipsets E=0 (DROP-rules ready but sets empty). Three layers, three zeros → defense = 0.
2. **I-2 Phantom Coherence crossed all three layers simultaneously.** Code (BL-35: low b_score → `text=""`), data (BL-40: 12 rows `call_segments` vs 22 rows `messages`), ops (EMP5: `systemctl active` ≠ protecting). Framework only covered code-layer phantom; no universal "Signal≠State Invariant".
3. **I-3 Spiral Gap ~2% → Spiral Chasm ~50%.** Each pivot (L3 Asterisk, Q.1 Redis pub/sub, Q.1.5 batch insert) left 40-60% new attack surface vs 2% healthy residual. No metric for "pivot debt".
4. **I-4 F=0 on architectural handoff (pivot).** Λ tied to old object; new Visionary spawn's A_F sees only new architecture → F_handoff ≈ 0. No required "pivot-delta manifest".
5. **I-5 Invariant 7 (≥5 files → RT-2) doesn't scale to ROADMAP.** BL-24 is commit-level; 6 bug classes × simultaneous pivots = ROADMAP-level compositional hazard invisible to current gates.

---

## 4. Five framework blind spots (Coherencer)

1. **No "type-level enforcement" tier in §13.** PLUGY EMP6 proves need for 4-tier ladder.
2. **Rework-discipline gap (BL-49 class).** Operator saying "полностью менять архитектуру" during active pivots had no universal rule.
3. **Classifier reconciliation missing as universal (BL-42).** ≥2 classifiers firing on same decision — no universal tie-break rule.
4. **Liveness vs functionality conflation (EMP5).** `systemctl active` as liveness signal, not functionality signal — not codified universally.
5. **Multi-agent planning horizon not modeled (BL-51).** meta.md §9 Task Classification uses `I(C) = files × coupling × legacy_factor` but no **agent-hours vs wall-clock** columns.

---

## 5. Cross-project Λ: 7/10 PLUGY lessons have cross-project echo (Coherencer)

| PLUGY lesson | Found in | L10 predicate |
|---|---|---|
| BL-35 signal≠content | odtoe-articles L-30, omnibot L-018 | #4 #5 |
| BL-36 async-delivery parity | academic-lab MP7, omnibot L-13 | #3 #4 |
| BL-37 secret distribution | academic-lab MP8, eradev L-25 | #3 #5 |
| BL-40 dual-source admin-view | odtoe-articles L-29, omnibot L-015 | #5 |
| BL-47 critical-host liveness | academic-lab L-4, omnibot L-018 | #3 |
| BL-48 pivot protection-audit | eradev L-25, academic-lab MP9 | #4 #5 |
| BL-49 rework-discipline | omnibot L-021, eradev L-16 | #1 #5 |
| BL-50 type-level enforcement | eradev L-20, L-24 | #5 |
| BL-51 agent-hours ≠ wall-clock | omnibot L-019+L-020 | #1 #5 |

**Ω = 1.385–1.46** → healthy cross-project Λ uplift. **BL-40, BL-47, BL-48, BL-50 are TRUE universals** (not yet in BOOTSTRAP_LESSONS.md) — candidates for promotion.

---

## 6. Adversarial filter (Validator — mandatory per-proposal gates)

**7-Question overfit filter (fail Q1 or Q4 → reject):**

- Q1 Tech axis: survives `s/Redis/any-bus/` `s/Asterisk/any-PBX/`?
- Q2 Pipeline: fires on stages other than voice hot-path?
- Q3 Environment: applies in dev/staging/prod/canary identically?
- Q4 **Counterfactual: if 19-bug burst never happened, rule still improves system?**
- Q5 Non-telephony example: fires on article / book / research pipeline?
- Q6 Proper-noun smell: mentions b_score / DeliverableText / sttMuteUntil outside Evidence block?
- Q7 Single-fire: evidence of ≥2 incidents across ≥2 projects?

**Phantom coherence threshold (framework-level):** `N_rules = 35` → `S_framework ≈ 0.85` borderline. **DO NOT exceed 35 BL without retire.**

**Framework-level NO-GO list (14 items):** no 6th role, no Prometheus coupling, no invariant quoting specific PLUGY bug IDs, no relaxation of BL-28/BL-26, etc.

**Four validation gates for ANY proposal:** GATE-G1 (Generalization), GATE-G2 (Bypass enumerated), GATE-G3 (3-Layer enforcement per BL-30), GATE-G4 (Budget + coverage matrix).

---

## 7. Unified improvement plan — interlocked sequence (NOT menu)

Per BL-49's own rule: changes ship in 3 phases with parity windows, not as parallel bundle.

### PHASE 1 (P0) — Rework-discipline + Composition-hazards + Multi-tier enforcement

**Blast radius: MED-HIGH** (changes how META responds to operator urgency + parallel pivots). **Ship as ONE commit.**

| Edit | File:Line | Change |
|---|---|---|
| E1 | `BOOTSTRAP_LESSONS.md:` (after BL-32) | **ADD BL-33 (Multi-tier enforcement ladder)** [UNIVERSAL] — declares T1 (type) > T2 (hook) > T3 (checklist) > T4 (docs) ordering; every new BL must declare Tier; subsumes EMP6 + BL-50 pattern |
| E2 | `BOOTSTRAP_LESSONS.md:` (after BL-33) | **ADD BL-34 (Composition Hazards Gate)** [UNIVERSAL] — ≥2 parallel refactors require N·(N-1)/2 pair grid + 3-way checks before Builder spawn |
| E3 | `BOOTSTRAP_LESSONS.md:` (after BL-34) | **ADD BL-35 (Rework-discipline framing audit)** [UNIVERSAL] — operator trigger phrases (EN+RU) during active pivot → Validator FIRST, produce Hansei, block Builder |
| E4 | `BOOTSTRAP_LESSONS.md:` BL-8 body | **MERGE BL-14 into BL-8** — rollback plan is one item of Pre-Deploy checklist |
| E5 | `BOOTSTRAP_LESSONS.md:` BL-17 body | **MERGE BL-21 into BL-17** — format specs are instance of pre-generate verification |
| E6 | `BOOTSTRAP_LESSONS.md:` BL-20 | **RETIRE BL-20**, move content into meta.md §6 MM3 (adversarial bootstrap testing is META-design rule, not operating rule) |
| E7 | `CLAUDE.md:77` | **ADD Invariant 15** (Composition Hazards Gate) |
| E8 | `CLAUDE.md:77` | **ADD Invariant 16** (Rework-framing audit) |
| E9 | `meta.md:242-248` (§13) | **REWRITE enforcement to 4-tier ladder** (T1 type > T2 hook > T3 checklist > T4 docs) |
| E10 | `meta.md:273` (§14) | **INSERT item 6b** (Composition Hazards bootstrap check) |
| E11 | `meta.md:273` (§14) | **INSERT item 7b** (Rework-framing detector bootstrap check) |
| E12 | `eradev.md:515` (§VI) | **ADD RT-1 Composition Hazards Gate subsection** |
| E13 | `templates/composition_hazards.template.md` | **CREATE new template** |
| E14 | `templates/interlocked_sequence.template.md` | **CREATE new template** |

**Budget accounting:** 30 BL → –3 (MERGE 14→8, MERGE 21→17, RETIRE 20) + 3 (NEW 33,34,35) = 30 BL net. Within cap.

**Validation gates passed:**
- G1 Generalization: BL-33/34/35 all satisfy Q1-Q5 (tech-agnostic, multi-pipeline, multi-env, counterfactual-passing, non-telephony worked examples available).
- G2 Bypass: each BL has ≥2 adversarial bypass + defense (see Builder §6).
- G3 3-Layer: docs (BL) + checklist (meta.md §14 items) + hook (3 hooks specified in SPEC-F).
- G4 Budget: net-zero BL count, MM5 coverage matrix filled.

### PHASE 2 (P1) — Liveness + BL promotion (after Phase 1 runs 14 days clean)

| Edit | Target |
|---|---|
| P2-1 | `eradev.md §XI` — ADD Liveness Prerequisite Rule |
| P2-2 | `BOOTSTRAP_LESSONS.md` — PROMOTE PLUGY BL-40 (dual-source) as new universal BL-36 |
| P2-3 | `BOOTSTRAP_LESSONS.md` — PROMOTE PLUGY BL-47 (liveness triad) as new universal BL-37 (requires Phase 1 retirement wave-2: candidates Validator §5 = BL-1, BL-7, BL-19 — operator decision required) |
| P2-4 | `meta.md §9` — ADD two-column velocity table (agent-hours / wall-clock) per BL-51 |
| P2-5 | `meta.md §11` — ADD "effectively-zero" pattern row (systemd-active + zero events) |

### PHASE 3 (P2) — Glossary + cosmetic cleanup (after Phase 2 shadow-mode clean)

| Edit | Target |
|---|---|
| P3-1 | `eradev.md` glossary — unify "composition hazards" → "cross-phase coupling risks" (keep H1..Hn as instance IDs) |
| P3-2 | `templates/CLAUDE.md.template:1` — version bump v9 → v10 |
| P3-3 | `templates/CLAUDE.md.template:81` — sync Invariants 15, 16 into template |
| P3-4 | `BOOTSTRAP_LESSONS.md` BL-28 — append "architectural rework framing" clause |

---

## 8. Kill-switches and rollback

Per BL-8 (feature flag = deployment event) applied to framework itself:

- **Every new hook has `ERADEV_HOOKS_DISABLED=1` env-var bypass.**
- **Every new BL has explicit `ended:` field** — rollback = set `ended: 2026-04-XX`.
- **Phase 1 rollback:** revert single commit (git revert SHA); all edits are in one commit per Invariant 7 + BL-24.
- **Phase boundaries = kill-switch points:** operator may halt after Phase 1 without touching Phase 2/3.

**Shadow-mode window:** 14 days after Phase 1 → measure: (a) spurious hook fires (target: 0), (b) operator frustration events (target: ≤1), (c) S_team at next RT-1 (target: ≥ previous).

---

## 9. Open questions (spiral gap ~2%)

**OQ-FW-1:** Should Kill-Switch Level 0 ("Λ-audit at RT-1 start: does any rule being enforced have form 3?") be added? [Analyst proposed, others did not oppose]

**OQ-FW-2:** BL-51 (agent-hours vs wall-clock) — extend §9 table with 2 columns OR separate §9b section? [Coherencer default: extend]

**OQ-FW-3:** Cross-project Ω alpha = 0.15 universal or per-modality? [OQ-Omega-3 deferred to v11 per eradev.md §III.Ω]

**OQ-FW-4:** Retire BL-1 (Lambda=0.5 cold-start) as "architectural constant" promoted to eradev.md §III? [Validator proposed, risk: loses bootstrap anchor for Lambda calibration]

**OQ-FW-5:** BL-52 PBX outbound boundary — PLUGY-specific or universal "egress boundary discipline"? [deferred to Phase 2 operator decision]

**OQ-FW-6:** Four-tier Λ enforcement cost-per-tier encoding (to make upgrade decision mechanical) — requires its own RT-1 in a future META-reflection cycle.

---

## 10. Expected outcome

After Phase 1 lands:

- **Operator "менять архитектуру" mid-flight** → automatic Validator-first audit → no big-bang parallel ship.
- **Any plan with ≥2 refactors** → mandatory pairwise+3-way hazard grid → H1-H6 style risks surface at RT-1, not as production incidents.
- **Every new BL** declares its enforcement tier → T4-only rules flagged as Lambda-zero debt automatically.
- **Ω(H_hist) next PLUGY-class session ≥ 1.4** (baseline 1.385 → target with new BLs 1.45).
- **Number of "operator reminded META"** interventions per session: ≥5 → ≤1.

**The class of errors from PLUGY 2026-04-18..04-20 becomes impossible to construct in future projects, because the code paths that would have created them (unaudited parallel pivots + rework-framing misread + form-1-only enforcement) do not exist in the framework.**

---

## Related documents

- `/Users/antonpankratov/Downloads/plugy/reports/hansei-architectural-rework-2026-04-20.md` — source incident
- `projects/plugy/lessons.md` Session 5 — BL-49 + BL-50 PLUGY-local (this synthesis promotes the abstract patterns)
- RT-1 role agent outputs archived in session transcript (agent IDs: Visionary `a8395a1354f6d5f71`, Analyst `a475350f7618d3bfd`, Builder `a0373a2e0f0049184`, Validator `af734dfb7012eef3a`, Coherencer `add04f9f44a2113e4`)
