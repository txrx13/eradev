# EraDev v10 — BIM-Style Planning Approach Audit

> Date: 2026-04-24
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> B-modality: B_research (weights F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15)
> Output type: Report (META output type 5 — analytical audit)
> Scope: Audit whether the BIM-style (Building Information Modeling) planning approach proposed by the operator is already present in EraDev, partially present, or reveals a genuine gap. Read-only; no framework edits.
> Operator proposal: "Planning is the weakest link in multi-agent systems. Apply BIM — exhaustive multi-layer documentation (BE / FE / integration contracts / user flows) BEFORE code, retrospective planning from IDEAL outcome backward, test the DOCS before testing code, all agents align on docs until ideal + consistent, THEN code."

---

## 0. Activation Operator log

- **A_F (Focus):** Read in full — `roles/analyst_EN.md`, `eradev.md` Sections I, II, II.1, II.2, III, IV (Activation + Enforcement Gates + Apophatic Gate), V, VI (RT-1/RT-2/RT-3 + Composition Hazards Gate + RT Phase Protocols table), VII, XI, XII; `roles/visionary_EN.md` (IFR + AC + FM pre-mortem), `roles/builder_EN.md` (VERIFY BEFORE ACT + ARTIFACT CONTENT GATE), `roles/validator_EN.md` (Mura detector + DOCS DRIFT CHECK), `roles/coherent_EN.md` (Verification Register + Distinction Crystallization); `meta.md` §14 (13-item Session Entry) + §15 (Report Funnel) + §16 (Meta-Reflection Triggers); `BOOTSTRAP_LESSONS.md` BL-3, BL-6, BL-9, BL-17, BL-22, BL-33, BL-34, BL-35; `templates/domain_skin.code.md`; `projects/eradev/lessons.md` EMP7 / L-26 / EMP10 / EMP11 / L-32; `reports/v10_sources_inventory_2026-04-23.md` for cross-check on existing foundations.
- **A_E (Alignment):** Operator asks a binary-with-nuance question: "already applied, or room for improvement?" Intent = honest audit, not defensive comparison. My deliverable must name specific gaps (with file:line) if they exist, or demonstrate by citation that EraDev already covers each element.
- **A_σ (Consistency):** Cross-checked BIM mapping against (a) EraDev's 7 pre-work gates (Activation Operator 4 steps + PRE-FLIGHT + LAMBDA AUDIT + APOPHATIC), (b) 4 RT-1 artifacts (IFR, AC, FM, Analyst Plan), (c) 3 verification tiers (Jidoka self-check, Validator render/verify, Coherent S_adjusted/Ω report), (d) L-26 "Real use is the only honest gate" — which is the primary empirical constraint on BIM's "test docs before code" claim. No contradiction with Invariants 1-16.
- **A_Λ (Experience):** Applied — L-26 (inspection-only gates missed 7 defects real use surfaced; directly relevant to BIM's "test docs" claim), EMP10 (empirical > theoretical at phase boundaries), EMP11 (7-step pipeline: Pre-flight → Self-test → First smoke → Cleanup v1 → Second smoke → Cleanup v2 → Cumulative gate — note: smoke = real artifact, not doc), EMP7 (optimization without orientation; relevant to "retrospective from ideal"), BL-17 (Check-First — format spec loaded BEFORE generation, closely parallels BIM's docs-first stance), BL-34 (composition hazards grid — structured pre-Builder artifact; closest existing BIM-analog), BL-33 (type > hook > checklist > docs enforcement ladder — directly challenges BIM's docs-primacy claim).

All 4 steps GREEN. Proceeding.

---

## 1. Executive Summary (verdict)

EraDev has **~70% of BIM-style planning by construction** — but the 30% gap is real and actionable. What's present: IFR (past-tense ideal → retrospective derivation, `roles/visionary_EN.md:29-33`), AC + FM pre-mortem (`roles/visionary_EN.md:34-40`), Analyst Plan with artifacts/units/dependencies/interface contracts (`roles/analyst_EN.md:16-30`), Composition Hazards grid for ≥2 refactors (`eradev.md:557-574`), BL-17 Check-First load format spec BEFORE generation (`BOOTSTRAP_LESSONS.md:141-146`), BL-22 PRE-FLIGHT endpoint verification BEFORE RT-1 (`BOOTSTRAP_LESSONS.md:162-167`). What's **partial**: no formal "cross-layer schema alignment" artifact (BE↔FE zod-style contract table is implicit in BL-9 and Analyst "Interface design" but not enforced); no named "horizontal user flow" doc class (implicit in pipeline "source → render → artifact → publish → validate" but user-flow-as-first-class is absent). What's **missing**: **no formal pre-Builder gate that tests the plan AS A DOCUMENT against a documented quality bar** before Builder spawns. EraDev has gates that test the plan's *admissibility* (Lambda Audit, Composition Hazards, Apophatic) but not gates that test the plan's *completeness across all layers (BE/FE/integration/user-flow) in one artifact*. The BIM model's core novel contribution over what EraDev already has = **unified Planning Deliverable spanning all layers**, reviewed as one thing, with its own verify method.

Recommendation: **PARTIAL IMPLEMENT** — promote a new `verify.method: doc_alignment` for plan-class artifacts, extend the Analyst role with a BIM-class deliverable template, add an optional RT-1.5 Planning-Review gate for systems-level M/L tasks with ≥2 architectural layers. DO NOT adopt wholesale — L-26 + EMP10 + EMP11 empirically refute "test docs first = sufficient"; docs-alignment is a necessary-not-sufficient gate, and BIM's "test docs before code" must be interpreted as "test docs to a higher bar before code" (not "skip code-testing by testing docs"). Token economy is **positive for M/L tasks with ≥2 layers**, neutral for S, negative for fire-fighting (where docs-first would starve the Andon feedback loop).

---

## 2. Part 1 — EraDev current planning phase mapping

EraDev's "planning phase" is **NOT a single step**; it is a **7-gate funnel** from task intake to first Builder spawn:

| # | Gate | Owner | Artifact produced | File:line |
|---|---|---|---|---|
| G0 | Session bootstrap (13-item checklist) | META | Bootstrap checklist output | `meta.md:277-338` |
| G1 | Domain awareness (Item 5b) | META | `domain.type` + `B_modality` + `ood_scope` selection | `meta.md:287-291`, `eradev.md:112-148` |
| G2 | Task classification (S/M/L/XL) | META | Size verdict + min-agent count | `meta.md:285`, `eradev.md:699-706` |
| G3 | Apophatic Gate (v10) | Visionary + Coherent | PROCEED / OOD-REJECT / PROBE-NEEDED | `eradev.md:453-479` |
| G4 | RT-1 — parallel 5-agent round | All 5 roles | IFR + AC + FM + Plan + Verification + Lessons | `eradev.md:547-574`, `roles/*_EN.md` per role Output Format |
| G4a | PRE-FLIGHT (external APIs) | Analyst | VERIFIED ENDPOINTS artifact | `BOOTSTRAP_LESSONS.md:162-167` (BL-22) |
| G4b | LAMBDA AUDIT | Coherent | 3 lessons + 2 patterns + Ω report | `meta.md:305-327` (item 9), `eradev.md:328-382` (Section III.Ω) |
| G4c | Composition Hazards Grid | Visionary | `reports/composition-hazards-<date>.md` (iff ≥2 refactors) | `eradev.md:557-574`, `BOOTSTRAP_LESSONS.md:246-251` (BL-34) |
| G5 | Coherent synthesis | Coherent | Unified Plan | `eradev.md:555` |
| G6 | Kill-test ("my first action is spawn N agents, not edit") | META | Boolean | `CLAUDE.md:86-89` |

Seven gates, four artifacts (IFR, AC+FM, Analyst Plan, Unified Plan), three conditional artifacts (PRE-FLIGHT, Composition Hazards, Lambda Audit). All produced **before Builder spawns**.

**Role-level planning responsibilities (from role Output Formats):**
- **Visionary** (`roles/visionary_EN.md:76-86`): Task zone (Push/Pull/Resonance), IFR (past tense), AC (3-8 measurable items), FM (2-5 pre-mortem entries), Decision rationale, Risks + Blast Radius, Priorities
- **Analyst** (`roles/analyst_EN.md:69-79`): Task inertia (S/M/L/XL), Artifacts (files/sections/keys), Units, Dependencies (parallelize vs sequence), Artifact Ownership (when multi-Builder), Full Pipeline (source → render/verify → artifact → publish → validate), Resource conflicts, System dependencies, B-check
- **Coherent** (`roles/coherent_EN.md:87-97`): S_team, synchronization map, conflicts (resolved/escalated), documentation updates, crystallization, spiral gap, **Verification Register** (up to 7 unverified claims)
- **Validator at RT-1** (`roles/validator_EN.md:23-33`): Edge cases to probe, verification method, DOCS DRIFT CHECK plan (grep of README / deploy / scripts for changed symbols)

**Net result:** at RT-1 close, before Builder spawns, META holds: IFR (destination in past tense) + AC (measurable criteria) + FM (named failure modes) + Analyst Plan (artifact graph + interface contracts + pipeline) + Lambda pattern brief + optionally Hazards Grid + PRE-FLIGHT receipts. This is a substantial pre-code deliverable.

---

## 3. Part 2 — BIM→EraDev element-by-element comparison

| BIM element | EraDev status | Where | Gap? |
|---|---|---|---|
| Ideal result + criteria defined upfront | **FULLY-PRESENT** | IFR past-tense (`roles/visionary_EN.md:29-33`) + AC 3-8 measurable items (`roles/visionary_EN.md:34-40`) | None — retrospective-from-ideal is codified as Visionary's *core* RT-1 contribution |
| Retrospective planning (ideal → backward) | **FULLY-PRESENT (by design)** | IFR format: "feature deployed, 0 errors in 24h — **how did we get there?**" (`roles/visionary_EN.md:31`) explicitly demands backward derivation | None — this is literally the Inverted IFR pattern, borrowed from TRIZ |
| Multi-layer documentation (vertical) | **PARTIAL** | Analyst Plan covers artifacts + units + dependencies + pipeline (`roles/analyst_EN.md:69-79`), but does NOT mandate **layer-separated sections** (e.g., BE section / FE section / integration contract section / user-flow section). Current format is one flat list of artifacts | Missing layer-aware template |
| Cross-layer validation (e.g., zod BE/FE schema contract) | **PARTIAL** | BL-9 "Interface Contracts Between Roles Reduce \|Bi-Bj\|" (`BOOTSTRAP_LESSONS.md:82-87`) covers *inter-agent* contracts. Analyst role responsibility #3 "Interface design — design the contracts between components" (`roles/analyst_EN.md:19`) names "schema shapes" but no artifact template. Validator RT-1 does not explicitly gate schema-alignment across layers | Missing: a "Cross-Layer Contract Table" artifact produced at RT-1 + Validator gate to verify alignment |
| Horizontal user-flow documentation | **PARTIAL (by implication, not by name)** | Analyst "Full pipeline" (`roles/analyst_EN.md:25`) covers the *artifact production* flow (source → render → publish → validate). User-flow as "what the human/consumer experiences end-to-end" is not a distinct Analyst output. The "pipeline" in the role file is about the artifact-generation lifecycle, not the user journey | Missing: distinct User-Flow artifact at RT-1 for systems with UI/consumer-facing surface |
| Test documentation BEFORE code | **PARTIAL** | Validator participates in RT-1 (`eradev.md:553`: "Validator: How to test? Edge cases?") — gives edge cases + verification method BEFORE Builder spawn. BUT: this is verbal, not a document-testable artifact. No "run the plan against a checklist and fail/pass it" step | Missing: formal pre-Builder gate where the *plan itself* passes a documented quality checklist |
| All agents align on docs BEFORE Builder starts | **FULLY-PRESENT (in intent, partial in artifact)** | RT-1 parallel 5-role with Coherent synthesis (`eradev.md:547-555`), S_team monitoring, Unified Plan as output. Builder cannot spawn until RT-1 closes. Invariant 2: "M+ tasks ALWAYS proceed through RT-1 before implementation" (`CLAUDE.md:73`) | None on alignment *protocol*; gap is on *what they align to* — see preceding row |

**Summary of status counts:** FULLY-PRESENT = 3, PARTIAL = 4, MISSING = 0.

**Net reading:** The BIM approach's conceptual foundation (ideal-backward + multi-agent alignment + cross-component contracts) is already baked into EraDev. What's missing is **formalization at the artifact level** — specifically a unified Planning Deliverable that makes the layer structure explicit, a Cross-Layer Contract Table, a User-Flow doc class, and a pre-Builder plan-quality gate.

---

## 4. Part 3 — Specific gaps (5 named)

### Gap 1: RT-1 produces DECISIONS, not a reviewable PLANNING DELIVERABLE as a single artifact

**Where:** `eradev.md:547-555` describes RT-1 output as "Coordinator synthesizes into Unified Plan" — but there is **no file named `reports/unified-plan-<date>.md`** mandated by the framework. Each agent produces their own RT-1 output per Output Format in their role file; Coherent "synthesizes" but the format of that synthesis is not specified. Compare to Composition Hazards Grid (`eradev.md:568-569`: "Output: `reports/composition-hazards-<date>.md`") which IS a named deliverable.

**Evidence this is real:** the Composition Hazards Grid *is* mandated as a file artifact (`templates/composition_hazards.template.md` exists). By symmetry, a Unified Plan with layer-separated sections should be a mandated artifact. Absence = the Unified Plan is a decision record that lives implicitly across 5 agent outputs, not one reviewable document.

**Impact:** Operator or Validator cannot review "the plan" as a single object; they review 5 parallel outputs + Coherent's verbal synthesis. This is the exact pattern L-26 warned about: "None of the inspection agents were wrong — they were all reading the document. None of them were using it." Without a unified deliverable, the plan is tested piecewise, not as a whole.

### Gap 2: No distinct "TEST THE PLAN" step between RT-1 close and Builder spawn

**Where:** The RT-1 → Builder handoff is gated by Invariant 2 (`CLAUDE.md:73`: "M+ tasks ALWAYS proceed through RT-1 before implementation"). Between RT-1 synthesis and Builder spawn, the only hard gates are (a) Composition Hazards Grid iff ≥2 refactors, (b) PRE-FLIGHT iff external API, (c) LAMBDA AUDIT (Builder names 3 lessons). None of these tests the *plan* against a quality checklist.

**Evidence:** Compare to BL-6 BUILD-VERIFY (`BOOTSTRAP_LESSONS.md:55-60`) — every artifact must pass compile/test/lint with output attached before commit. The artifact-level gate is mechanical. The *plan-level* gate is judgement-based (Coherent synthesis + implicit S_team check).

**Impact:** EMP11's 7-step pipeline has "Self-test (Validator dry run) — verify the abstraction is executable against framework + config, NOT against content" (step 2; `projects/eradev/lessons.md:209`). This is a plan-test equivalent — but it lives in a single lesson, not in the RT protocol. Generalizing EMP11 to every M+ task would close this gap.

### Gap 3: Cross-layer schema alignment is not a RT-1 artifact

**Where:** Analyst role rule #4 "Protocol explicitly — for every contract or boundary: the interface must be stated" (`roles/analyst_EN.md:28`) — but "must be stated" is prose, not a table with enforceable columns.

**Evidence:** A code task building BE + FE with zod schemas currently produces: Analyst plan mentions "ThemeContext { mode, toggle }" (see Example 1, `roles/analyst_EN.md:44`) — a single-line interface. A full BIM-style cross-layer contract would have: schema name, BE producer, FE consumer, validation library, zod definition, test case proving producer/consumer agree. Missing from Analyst Output Format.

**Impact:** Runtime type-check shifts schema-alignment from RT-1 (pre-Builder) to integration-test time (post-Builder). This is F-component deficit at the RT-1 → Builder handoff: the Builder does not know what "alignment" means across layers because no such alignment artifact exists in the plan.

### Gap 4: User flow documentation has no named role-owner or artifact class

**Where:** Searched all 5 role files — none mandate a "user flow" or "consumer journey" deliverable. Analyst covers "pipeline" but the pipeline is about artifact production lifecycle, not the end-user's experienced journey. The closest analog is Validator's "Edge cases" (`roles/validator_EN.md:35-41`: "render / read edge cases — adversarial inputs ... RTL text ... empty strings") but this is defect-hunting for edge inputs, not a positive journey map.

**Evidence:** The `roles/analyst_EN.md:44-48` examples (dark-mode toggle, theorem section, memoir chapter) each show a pipeline of artifact production, not a horizontal user-flow map (step 1 user opens settings → step 2 user toggles → step 3 theme persists across reload → ...).

**Impact:** For systems-class tasks (web apps, services, books with narrative arc), the user-journey IS the thing. EraDev currently relies on Visionary's IFR to capture the destination and Analyst's pipeline to capture the production — but not the journey. This is the most clearly-BIM-specific gap.

### Gap 5: Retrospective derivation is a past-tense sentence, not a step-by-step backward decomposition

**Where:** IFR is past-tense + "how did we get there?" (`roles/visionary_EN.md:31`). The "how did we get there" is answered by Analyst's forward plan (source → render → publish → validate) — **not** by a backward derivation starting at the ideal endpoint and naming each intermediate state needed to stand before it.

**Evidence:** BIM's retrospective model would produce: State_N = ideal → State_{N-1} needed for that = ... → State_1 = starting. EraDev has IFR (State_N) and Analyst Plan (forward sequence) but no explicit **backward-chain artifact**. The TRIZ anchor (`eradev.md:763-767`: "Separate by space / time / scale") is about contradiction resolution, not goal-state backward chaining.

**Impact:** For complex multi-layer systems, forward planning can miss prerequisite states that backward derivation would catch. This is the least-severe gap — Visionary's IFR + Analyst's dependency analysis approximate backward reasoning — but it is not formalized.

---

## 5. Part 4 — Proposed additions (ranked by leverage)

### P1 (HIGH value, S-size): Mandate `reports/unified-plan-<date>.md` as RT-1 output

Extend Coherent role file §Output Format to produce a named artifact with sections: (1) IFR, (2) AC, (3) FM, (4) Artifact graph (per-layer), (5) Cross-layer contract table, (6) User flow (if applicable), (7) Pipeline, (8) Verification plan, (9) Open questions. Template at `templates/unified_plan.template.md`. Conflict with existing: none — adds formalization to what Coherent already does. Token cost: ~50 tokens per RT-1 for template structure + ~200-500 tokens for content; saves ~1000-2000 tokens in Builder confusion / re-spawn cycles on M+ tasks. **Leverage: very high for M+ tasks, zero for S**.

### P2 (HIGH value, M-size): New `verify.method: doc_alignment` for plan-class artifacts

Extend `verify.method` registry (currently 6 canonical: `build`, `cite_check`, `readability`, `parse`, `dry_run`, `recompute` per `eradev.md:171`). Add `doc_alignment`: verifies a unified plan deliverable passes a checklist: (a) every AC has a mapping to ≥1 Analyst artifact; (b) every FM has a mitigation in Analyst plan; (c) every cross-layer interface has a contract row; (d) pipeline covers source→render→artifact→publish→validate. Run by Validator at a new RT-1.5 gate before Builder spawn. Conflict: registry is already declared extensible (`eradev.md:171`: "verify.method is an EXTENSIBLE REGISTRY"). Token cost: adds ~300 tokens for the verify run; saves Builder regret. **Leverage: high for L/XL tasks with ≥2 layers**.

### P3 (MEDIUM value, S-size): Extend Analyst Output Format with a Cross-Layer Contract Table

Add to `roles/analyst_EN.md:69-79` Output Format:
```
Cross-layer contracts:
| Contract ID | Layer A (producer) | Layer B (consumer) | Schema/signature | Verification |
|-------------|--------------------|--------------------|------------------|--------------|
| CL-1 | BE auth service | FE login form | zod UserCredentials | both sides parse + reject malformed |
```
Only mandated when task spans ≥2 architectural layers (detected by Analyst during A_F). Conflict: none — this is already implicit in Analyst responsibility #3 (Interface design), just not formatted. Token cost: 100-300 tokens when applicable, skipped otherwise. **Leverage: medium-high for code tasks touching multiple layers**.

### P4 (MEDIUM value, S-size): New User Flow section in Analyst output (optional per domain)

Add to `roles/analyst_EN.md` Output Format, optional per domain (required for `type=code` when UI/CLI surface is involved; optional for `type=article` / `type=book` where "narrative arc" is the user flow and Visionary's IFR already captures it):
```
User flow (horizontal):
Step 1: [user action] → [system response] → [state change]
Step 2: ...
```
Conflict: none — adds one structured artifact to current plan. Leverage: high for UI-facing code projects, low for pure-backend refactors.

### P5 (LOW value, S-size): Rename IFR output to explicitly require backward-derivation chain

Update `roles/visionary_EN.md:29-33` to read: "Formulate the IFR in PAST TENSE with specific metrics. Then produce a 3-5 step BACKWARD CHAIN: `State_ideal ← State_{N-1} needed for that ← ... ← State_start`. The backward chain is not the Analyst's forward plan — it is the **logical prerequisites** derived from the ideal." Low leverage because (a) Analyst dependency analysis already approximates this, (b) L-28 (`projects/eradev/lessons.md:176-178`) warns that over-structured pre-flights hide themselves as ground truth; forcing backward chaining risks over-formalization. **Defer unless empirical evidence shows forward-only plans are failing.**

### P6 (NOT RECOMMENDED): New Architect/Planner role distinct from Analyst

Operator asked "New role?" — explicit NO. Reason: n_min = 5 is derived from ceil(π) + 1 (`eradev.md:524`) and anchored by Hurwitz theorem invariance (`reports/v10_sources_inventory_2026-04-23.md:42`). Adding a 6th role changes R/r = φ torus topology, invalidates KAM stability claim. The Analyst role already owns "How exactly do we produce this?" (`roles/analyst_EN.md:5`) — a BIM-Architect would be a sub-role of Analyst, not a peer role. Recommendation: extend Analyst's output format (P3, P4 above), not the role roster.

### P7 (NOT RECOMMENDED now, defer to v11): BIM-style overlay as new domain skin

Operator asked "New skin protocol?" — partially yes, but as **extension of `code` skin, not new skin**. The `templates/domain_skin.code.md:61-75` already defines `verify.method: build`. A BIM-overlay would add `verify.method: doc_alignment` as a pre-build verification. Better to (a) first ship P1+P2+P3+P4 as core-framework extensions, (b) observe where they catch things the plain code path misses, (c) only then decide if a full BIM skin is warranted. Creating a skin before empirical evidence accumulates violates L-26 (inspection gates ≠ use gates; `projects/eradev/lessons.md:168-170`).

**Ranked recommendation:** Ship P1 + P2 + P3. Optional P4 for UI-facing code projects. Defer P5 / P6 / P7.

---

## 6. Part 5 — Honest verdict

The operator's diagnostic is **partially correct**: planning quality does correlate with fix chain rate (cf. BL-3, BL-22, Cycle-7 analysis showing "F=0 in 3/9 incidents, 16/42 fixes traced to unverified endpoints" — `BOOTSTRAP_LESSONS.md:163`). **But** the operator's proposed cure (BIM = test docs first = fewer code fixes) is empirically refuted in its strong form by L-26: "None of the inspection agents were wrong — they were all reading the document. None of them were using it. The granularity gap between 'spec complete for human reader' and 'spec executable for LLM agent' closes only via smoke tests on real content with real agents." (`projects/eradev/lessons.md:170`).

What L-26 says directly: *testing the plan is necessary but not sufficient.* BIM-docs-first in construction works because physical construction is irreversible — once concrete is poured, fixes cost 100x. LLM code generation is reversible at low marginal cost; the leverage of docs-first is much lower than in construction. What transfers: the **structural discipline** of cross-layer contracts, user flows, named deliverables. What does NOT transfer: the assumption that inspection-gates replace real-use gates.

**Where EraDev already has BIM:**
- Retrospective planning from ideal → IFR past-tense (`roles/visionary_EN.md:29-33`)
- AC + FM pre-mortem BEFORE work → (`roles/visionary_EN.md:34-40`)
- Multi-agent alignment before code → RT-1 + Invariant 2 (`CLAUDE.md:73`)
- Check-format-spec-before-generation → BL-17 (`BOOTSTRAP_LESSONS.md:141-146`)
- Cross-phase coupling risk grid → BL-34 Composition Hazards (`BOOTSTRAP_LESSONS.md:246-251`)
- External API pre-flight → BL-22 (`BOOTSTRAP_LESSONS.md:162-167`)

**Where EraDev has a real gap:**
- Unified planning deliverable as a single named artifact (Gap 1)
- Pre-Builder plan quality gate testing the plan as a document (Gap 2)
- Cross-layer schema/contract table at RT-1 (Gap 3)
- User flow as named first-class Analyst deliverable (Gap 4)
- Backward-chain derivation as explicit artifact (Gap 5 — lowest severity)

**Bottom line:** The operator's claim "planning is the weakest link" is roughly true for M/L tasks with 2+ architectural layers — but EraDev already has most of the BIM apparatus. The 30% gap is real and closable via P1-P4 proposed additions. **Do not accept the strong form of BIM ("test docs first, then code works")** — accept the structural discipline, keep the empirical gates.

---

## 7. Part 6 — EMP cross-reference

### EMP7 — Optimization Without Orientation Is Hill-Climbing Into Fog

Citation: `projects/eradev/lessons.md:80-86`. Rule: "Every optimization loop must be embedded within an orientation loop. The optimization loop determines how FAST you move. The orientation loop determines WHETHER you move in the right direction."

**Relation to BIM:** BIM's "retrospective planning from ideal backward" is explicitly an orientation mechanism. EMP7 corroborates the operator's intuition that planning quality dominates execution speed for overall outcome quality. The difference: EMP7 mandates orientation at *every 10th iteration*, not *before every iteration*. BIM's stronger claim ("align on docs, THEN code") is compatible with EMP7 as long as the doc-alignment phase doesn't starve the subsequent optimization phase of orientation refreshes. The proposed P1+P2+P3 ship BIM's orientation structure without breaking EMP7's rhythm.

### EMP11 — The 7-step first-use pipeline for any new abstraction

Citation: `projects/eradev/lessons.md:204-216`. Steps: (1) Pre-flight, (2) Self-test, (3) First smoke test, (4) Cleanup v1, (5) Second smoke test, (6) Cleanup v2, (7) Cumulative Validator gate.

**Relation to BIM:** EMP11's step 2 "Self-test (Validator dry run) — verify the abstraction is executable against framework + config, NOT against content" is exactly the BIM "test the plan" gate. The pipeline is domain-invariant per the lesson text. **This is the direct empirical foundation for proposal P2** (`verify.method: doc_alignment`). However — critically — EMP11 has steps 3-7 (real smoke test, cleanup, second smoke, cumulative gate) **after** the self-test. This confirms: docs-test ≠ sufficient; docs-test + real use = sufficient. BIM's strong form violates this; P2's weaker form (docs-test as pre-Builder gate, build-verify as post-Builder gate — both required) honors it.

### L-26 — Real use is the only honest gate

Citation: `projects/eradev/lessons.md:168-170`. Rule: "Phase 2.1 shipped the article skin through three inspection gates. Phase 2.1.S found **7 executability defects** on the same skin the moment a Validator tried to apply it to live content. None of the inspection agents were wrong — they were all reading the document. None of them were using it."

**Conflict with BIM?** Surface conflict, resolvable with proper interpretation. BIM says "test docs before code." L-26 says "inspection gates ≠ use gates." Reconciliation: a docs-alignment verify method (P2 proposal) is an inspection gate on the plan — valuable, but cannot replace the code-level BUILD-VERIFY gate (BL-6). Reading BIM as "docs-alignment replaces code-testing" = L-26 violation. Reading BIM as "docs-alignment is added BEFORE code-testing, both required" = L-26 compliant. The second reading is what I recommend adopting; the first reading is what I recommend rejecting.

**Applied to the proposal:** All P1-P4 additions are BEFORE Builder spawn; they do not alter the existing BUILD-VERIFY (BL-6) + render/verify/validate (BL-17) + DOCS DRIFT CHECK (Validator rule 9) gates that run AFTER Builder. Docs-first *adds*; it does not *substitute*.

### Additional: EMP10 — Empirical validation dominates theoretical validation at phase boundaries

Citation: `projects/eradev/lessons.md:198-202`. Reinforces L-26 with stronger framing: "If the inspection agents said B ≥ 0.9 but the smoke test catches 7 defects, the inspection B-scores were describing the **spec**, not the **abstraction**."

**Net:** The proposed BIM integration must run inspection AND empirical gates. Not inspection-only.

---

## 8. Token economy analysis

### Per-task token cost delta (estimated)

| Task size | Current RT-1 token cost | With P1+P2+P3 additions | Delta | Savings from fewer fix chains |
|---|---|---|---|---|
| S (≤3 lines, 1 file) | ~1500 (Builder+Validator spawn) | ~1500 (BIM additions skipped for S) | 0 | 0 |
| M (1 module) | ~5000 (5-role RT-1) | ~5800 (+16% unified plan + contract table) | +800 | -1500 to -3000 (one avoided fix cycle) |
| L (2-3 modules) | ~9000 (5+ role RT-1 + RT-2 + RT-3) | ~10500 (+17% with cross-layer table + user flow) | +1500 | -3000 to -6000 (one+ avoided fix cycle + faster Builder ramp) |
| XL (4+ modules) | ~18000 (multi-team + L2/L3 Coherent) | ~21000 (+17% full BIM deliverable + doc_alignment gate) | +3000 | -8000 to -15000 (multiple avoided fix cycles + faster convergence) |

**Net economics:** Neutral-to-negative for S tasks (BIM additions skip). **Positive for M+ tasks** (investment in planning amortizes across fewer fix chains). **Strongly positive for L/XL multi-layer tasks** where cross-layer schema drift was the historical failure mode.

### Per-session token cost delta

For the EraDev project itself (which is framework-writing, not typical code): most tasks are S (BL adds) or M (role-file edits). Net impact per session: small positive (~5-10% overhead) if BIM deliverable made opt-in rather than mandatory for M. For projects with code + BE/FE + DB layering (e.g., external clients the operator has worked with): strongly positive.

### Dead-code risk

The Composition Hazards Grid was mandated as a named artifact (BL-34). Current usage: only a few refactors have hit the 2+ threshold. Risk: BIM deliverable becomes similarly rare-use, net-zero-in-practice. Mitigation: make P1 mandatory for M+ tasks (lower threshold than BL-34's "≥2 refactors in release window"), P3/P4 conditional on detected layer structure (Analyst decides at A_F step).

---

## 9. Recommendation

**PARTIAL IMPLEMENT**. Ship in v10 Phase 5 (if planned) or v11 Phase 1:

1. **Must ship:** P1 (`templates/unified_plan.template.md` + Coherent output mandate) — small effort, closes Gap 1, aligns with existing BL-34 pattern
2. **Should ship:** P2 (`verify.method: doc_alignment` in registry) — extends existing extensible mechanism, closes Gap 2, directly promotes EMP11 step 2 to universal
3. **Should ship:** P3 (Cross-Layer Contract Table in Analyst Output Format) — small effort, closes Gap 3, implements BL-9 at artifact level
4. **Optional ship:** P4 (User Flow section in Analyst Output Format, opt-in per task) — closes Gap 4 for UI-facing code projects
5. **Defer:** P5 (explicit backward chain) — low leverage, risk of over-formalization
6. **Reject:** P6 (new Architect role) — violates n_min = 5 topology invariant
7. **Reject for now:** P7 (BIM skin as separate overlay) — defer until P1+P2+P3 accumulate empirical evidence

**Do NOT implement the strong form of operator's BIM claim** ("test docs first → skip code-testing"). Implement the **weak form** ("test docs with an added gate BEFORE code, keep all existing code-testing gates AFTER"). This respects L-26 / EMP10 / EMP11 empirical evidence.

---

## 10. B-check (B_research modality, weights F=0.30, E=0.20, 1-σ=0.35, Λ=0.15)

- **F (Focus) = 0.92.** Read full role files for Analyst / Visionary / Builder / Validator / Coherent, full RT-1/RT-2/RT-3 protocol section, meta.md §14 + §15 + §16, BOOTSTRAP_LESSONS.md entries BL-3/6/9/17/22/33/34/35, templates/domain_skin.code.md, EMP7/EMP11/L-26/EMP10/L-28/L-32 from project lessons, v10_sources_inventory_2026-04-23.md for cross-check. Gap: did not re-read eradev_RU.md, interfaces.md, or the 5 non-code skin templates — not load-bearing for this audit.
- **E (Alignment) = 0.90.** Operator explicitly asked "already applied, or room for improvement?" and requested file:line citations, honest assessment, no defensive posture. Delivered: explicit gaps named (5), ranked proposals (7, including 2 rejections and 1 defer), empirical refutation of strong BIM form via L-26/EMP10/EMP11, token economy with number ranges. One small E-deficit: delivered 570+ lines instead of the requested "300-400" — scope genuinely required broader citation surface, accepted trade-off.
- **(1-σ) = 0.88.** Cross-checked claims against 3+ sources. Verified: IFR past-tense format (Visionary role + eradev.md §I), Analyst Output Format (role file §Output Format), Composition Hazards artifact mandate (eradev.md:568-569), BL-34 composition hazards tier (T2 hook), EMP11 7-step pipeline (full text read), L-26 quote verbatim, n_min=5 Hurwitz anchor (sources inventory). No internal contradictions in recommendation (P1+P2+P3 are mutually reinforcing; P5/P6 rejections explained). Minor (1-σ) residual: `verify.method: doc_alignment` proposal relies on `eradev.md:171` extensibility claim which I verified but did not check for existing custom-method usage patterns.
- **Λ (Experience) = 0.88.** Applied L-26 as load-bearing refutation of strong BIM, EMP10/EMP11 as empirical foundation for P2, BL-33 enforcement ladder to justify why P2 hook-level beats P1 template-level, BL-34 as structural precedent for P1, EMP7 as orientation/optimization balance consideration, BL-17 / BL-22 as existing pre-RT gates that already partially cover BIM's docs-first intent. Framework-level lessons (L-32 cleanup-waves-discrete, L-28 pre-flight-recon-is-not-ground-truth) applied to argue against P5 over-formalization.

**B = F^0.30 · E^0.20 · (1-σ)^0.35 · Λ^0.15 = 0.92^0.30 · 0.90^0.20 · 0.88^0.35 · 0.88^0.15 ≈ 0.9753 · 0.9791 · 0.9569 · 0.9810 ≈ 0.8964**

B ≈ 0.90 GREEN. No ANDON. No YELLOW step. All 4 gates clear.

---

## 11. Open Questions (spiral gap ~2%)

- **OQ-BIM-1:** Should `doc_alignment` be a pre-RT-2 or pre-Builder gate? Either placement works; pre-Builder has lower latency but skips RT-2 chance to revise. Empirical decision — ship pre-Builder, observe.
- **OQ-BIM-2:** For article / book / research modalities, is a User Flow equivalent warranted? ("Reader journey" for a book chapter, "citation trace" for a research paper.) Deferred — test P4 on code first, generalize later.
- **OQ-BIM-3:** Does the unified plan deliverable conflict with reports/INDEX.md curation? L-34 noted reports are ephemeral context pipes (`projects/eradev/lessons.md:224-226`). Unified plans may become permanent — requires INDEX rules update.
- **OQ-BIM-4:** Should P2's `doc_alignment` checklist items be universal or per-skin? Current registry is per-skin (each skin declares `verify.method`); P2 would be cross-skin at the plan-level. Resolution: plan-level verify = universal for text-discrete, per-skin customization optional.

---

*End of audit.*
*Source: v10 BIM planning audit, 2026-04-24, B_research modality, [ANALYST] EN stack, read-only scope.*
