# EraDev v10 — Conditional BIM Deep Research: Preserving Creative Mode while Applying Rigid Planning Only Where Required

> Date: 2026-04-24
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> B-modality: B_creative (E=0.30, 1-σ=0.30, F=0.20, Λ=0.20) — creative-philosophical research audit
> Output type: Report (META output type 5 — analytical audit / decision support for Bundle D design)
> Scope: Deep research on how to make BIM-style rigor CONDITIONAL (applied only when formulas / algorithms / strictly-specified code tasks demand it), while preserving non-linear thinking, incubation, emergent structure, voice, and long cycles in creative/exploratory work.
> Read-only. No framework edits. Produces decision document for META before Bundle D commit.
> Operator's direct request (Invariant 14, verbatim): "сделай более глубокое исследование на основе всех материалов выше и с условие чтобы не разваливался творческий подход а жесткие методы планирования (BIM) применялись только тогда когда требуются (формулы, алгоритмы, код в жестко поставленной задаче)"

---

## 0. Activation Operator log

- **A_F (Focus):** Read IN FULL — `roles/analyst_EN.md`; `ODTOE_parallel_trajectories.pdf` (pages 1-27, full paper: abstract, §I introduction, §II ODTOE basis, §III knowledge relativity + empirical base §III.5, §IV frame-as-projector F4, §V F1/F2 role dispersion + OR-aggregation, §VI F3 v_conv + F8 B_persist + F9 T_tip + F10 V_practical, §VII method-vs-configuration NFL analogy + §VII.4 configuration ensemble, §VIII three forks + F7 sufficiency + §VIII.8 micro-check, §IX P1-P6 predictions + F5/F6, §X.1 applicability boundaries + §X.4 F11 growth direction + §X.5 Four Working Habits + Bibliography 1-37); `reports/v10_parallel_trajectories_analysis_2026-04-24.md` (C1..C26 mapping, 25-item ranking, OQ-PT-1..7); `reports/v10_bim_planning_audit_2026-04-24.md` (P1..P7 proposals, 5 gaps, 7-gate funnel, L-26 empirical refutation of strong BIM); `reports/v10_bim_creativity_tension_2026-04-24.md` (8 creativity-limiting mechanisms, per-modality fit table, 6-option resolution analysis, Option B recommendation); `CLAUDE.md` (17 invariants including new #17 τ_cycle primacy); `eradev.md` §III.2 (Bundle A additions: F3/F4/F6/F7/F10/F11 subsections), §IV Four Working Habits; `meta.md` §μ-check; `templates/unified_plan.md.template` (BIM Unified Plan); `templates/domain_skin.md.template` (doc_alignment canonical verify method v10+); `templates/domain_skin.book.md` (creative weights pinned, R1-R6, reader-time budget); `templates/domain_skin.article.md` (research weights pinned, 7 cite_checks); `roles/coherent_EN.md` path-(c) addition; `roles/analyst_EN.md` Cross-Layer + User Flow additions; `projects/eradev/lessons.md` EMP7 full text. Confirmed inventory: article / book / plan / research / code / config skins all exist with RU mirrors. Gap: did NOT read full research / plan / code skins (relied on article + book as the two modalities carrying the creativity concern); did not read FOUNDATIONS.md for this session (relied on prior BIM audit's citations).

- **A_E (Alignment):** Operator wants a DECISION DOCUMENT that (a) proposes a RIGOR_LEVEL classification axis orthogonal to domain, (b) gives a per-segment declaration mechanism, (c) names and describes a creative protocol that ISN'T BIM, (d) classifies every Bundle A/B/C item by RIGOR_LEVEL applicability, (e) answers "who declares RIGOR_LEVEL?", (f) gives a migration path, (g) produces MUST/SHOULD/COULD/DON'T proposals. Deliverable must be CONCRETE (file:line), HONEST (no defensive framing), and 500-700 lines. No hedging. No "it depends." Every item has a verdict.

- **A_σ (Consistency):** Cross-checked proposals against (a) the existing bundles already unstaged (Invariant #17 is [UNIVERSAL], μ-check is unconditional, Four Habits #1 is [UNIVERSAL], F7 B_min per-modality deferred to v11 OQ-PT-3 — these are load-bearing constraints on any Bundle D design), (b) v10 Phase-N bundle precedent (math commit / protocol commit / discipline commit — Bundle D naturally slots as 4th), (c) domain skin architecture (skins override vocabulary, pin modality, but do NOT override Invariants — structural constraint that shapes where RIGOR_LEVEL lives), (d) paper's OOD boundary §X.1 (v10 ood_scope=continuous → REJECT — constraint on what RIGOR_LEVEL can admit), (e) BL-11 Minimum Viable Scope + L-28 (pre-flight is not ground truth) + EMP7 (orientation > optimization) — three framework precedents that oppose over-engineering a RIGOR_LEVEL system. No contradictions with Invariants 1-17. One surface tension: proposing RIGOR_LEVEL as a NEW axis partially overlaps with domain.type — resolved by making them ORTHOGONAL and complementary, not substitutive.

- **A_Λ (Experience):** Applied — EMP7 (orientation loop > optimization loop — primary creativity-protection precedent already in framework), BL-11 (scope creep = Muda — applied to reject RIGOR_LEVEL over-engineering options like per-project creativity slider), L-26 (inspection ≠ use — creative mode CANNOT rely on docs-alignment gates because creative work only honest-gates at real-use / reader-contact), BL-34 Composition Hazards pattern (conditional artifact produced ONLY when triggers fire — structural precedent for conditional BIM invocation), Bundle-precedent (v10 Phase 4 Bundles A/B/C = one commit per layer; Bundle D slots as creativity-adaptation), the existing `domain_skin.book.md` creative-weights rationale (Phase 0.A Visionary deliverable — established pattern for pinning creative behavior per domain), the paper's own §VII.4 "configuration ensemble" (different configurations for different phases of the same task — directly supports per-segment RIGOR_LEVEL), EMP11 7-step pipeline (step 2 self-test is what `doc_alignment` formalizes — useful when spec is verifiable, irrelevant when spec emerges during work). Framework-level lesson: v10's pattern for conditional invariants is `[ADAPTER]` tags (#5, #6, #7, #10, #14 are [CODE-ADAPTER]) — RIGOR_LEVEL fits this pattern naturally as the MECHANISM that drives adapter selection.

All 4 gates GREEN. Proceeding.

---

## Part 1 — RIGOR_LEVEL: A better classification axis

### 1.1 The diagnostic problem

Current EraDev classifies by **domain.type** (code | article | book | config | plan | research). This is a coarse axis. It conflates WHAT the artifact is with HOW MUCH RIGOR the work can tolerate. A scientific article has BOTH strict sections (methods, equations, proofs) AND exploratory sections (introduction, discussion, motivation). A code project has BOTH strict work (CRUD API with spec) AND exploratory work (research-grade prototype, creative algorithm exploration). Single-axis classification by domain cannot represent this.

The paper's own §VII.4 formalizes this structural need: "В практике малых групп рабочей единицей часто оказывается не одна конфигурация C, а ансамбль {C_1, C_2, ..., C_M}, где разные конфигурации решают разные фазы задачи." (§VII.4, p.15). Different phases need different configurations. The paper's C1 high-Λ_role + short τ_cycle configuration is RIGID (methods section, proof work); its C2 low-Λ_role + long τ_cycle is EXPLORATORY (motivation, theorem-discovery). EraDev needs this axis explicitly.

### 1.2 Proposed RIGOR_LEVEL axis — 4 levels

RIGOR_LEVEL is ORTHOGONAL to domain.type. It describes the **spec-to-output clarity gradient**:

| RIGOR_LEVEL | Spec clarity | Output space | Formalization | Reversibility | Verification type | BIM application |
|---|---|---|---|---|---|---|
| **strict** | Spec is complete and verifiable before work starts (inputs, outputs, acceptance criteria known) | Convergent — one correct answer OR a narrow equivalence class | Full formalization possible (types, contracts, proofs) | Cheap (code) to Expensive (published paper) — but verifiable either way | Executable or recomputable (build / recompute / parse / dry_run / doc_alignment) | **FULL BIM** — μ-check blocking, Cross-Layer Contracts mandatory, F7 threshold, τ_cycle primacy |
| **structured** | Spec is partial — overall shape known, details emerge during work | Semi-convergent — multiple valid answers, constraints bound them | Partial formalization (schema, outline, grammar) | Moderate | Readability + structural coherence (readability / cite_check / structural fidelity checks) | **PARTIAL BIM** — Unified Plan required, μ-check as ADVISORY, Cross-Layer Contracts if layer-crossing, F7 threshold is SOFT guidance |
| **exploratory** | Spec is directional — goal is known but path to reach it is unknown; specification emerges during work | Divergent with convergent target — multiple paths, target itself may shift | Minimal formalization (voice guide, dependency sketch, glossary seed) | Often destructive (creative work incorporates incubation — previous drafts may be thrown away) | Voice / narrative / aesthetic / reader-experience (readability variance, structural coherence, spot-check) | **BIM OFF** — IFR + RT-0 Visionary only; no μ-check, no mandatory Cross-Layer Contracts; Analyst provides VOICE GUIDE + glossary seed, NOT full artifact decomposition |
| **emergent** | Spec is absent at start — the act of work produces the spec (and sometimes the question) | Fully divergent — the output space is discovered, not traversed | No formalization up-front; post-hoc only | Highly destructive (ideation throws away 90%+) | Spot-check + sufficiency (B_received ≥ B_min at end, not gates mid-work) | **NO PLANNING GATE** — no RT-1 synthesis required for individual exploratory iterations; RT-1 runs ONLY at the end of the emergent phase to consolidate what was found; no μ-check |

### 1.3 How to read the axis

- **strict** — "We know the destination AND the road; we execute." Example: implement a REST endpoint with OpenAPI spec; prove a theorem that only needs algebraic derivation; write a chapter that delivers a pre-specified argument.
- **structured** — "We know the destination AND the general direction; we discover the road." Example: port an algorithm to a new language; write an article whose claims are fixed but whose argumentation emerges; configure a build system.
- **exploratory** — "We know the destination; the road may need us to rethink it." Example: draft the introduction to a theorem paper (the framing may need the theorem itself to be rewritten); draft a chapter whose thematic arc is roughly known but emerges in writing.
- **emergent** — "The destination itself is what we're looking for." Example: brainstorm what new theorem to prove; draft a poem; incubate an idea; conduct a fishing expedition on a dataset; have a conversation whose outcome no agent can predict.

### 1.4 Spec clarity as the primary axis

The 4 levels form a GRADIENT of spec-to-output clarity:

```
emergent → exploratory → structured → strict
high divergence           low divergence
spec emerges                       spec precedes
long cycles                                 short cycles
voice / taste                                   correctness
```

This axis has **independent semantics** from domain.type. A code project can legitimately have exploratory segments (prototype design, algorithm research); a book can legitimately have strict segments (a reference table, a formula block). The axis cuts ACROSS domain classifications.

### 1.5 Is this axis already implicit in EraDev? (partially)

**What EraDev already has that does SOME of this work:**

- **Modal B-weights** (§II.1): `B_text` / `B_creative` / `B_research` — but this shapes DIAGNOSTIC (how agents rate themselves), not PROCESS (how META enforces gates). A book Builder under B_creative weights still runs through μ-check with the same 6 bullets.
- **OOD scope `continuous`** — blocks TRULY out-of-scope work (free-verse poetry, metaphysical speculation) but doesn't distinguish between strict/exploratory within the admissible space.
- **Apophatic Gate** (`eradev.md` §IV) — similar: catches OOD, not rigor level.
- **Composition Hazards Grid** (BL-34) — CONDITIONAL invariant (triggers only on ≥2 refactors). Structural precedent for conditional BIM invocation.
- **Task classification S/M/L/XL** — shapes team composition but is orthogonal to rigor.

**What's missing:** no axis that says "this work has no specifiable output before the work is done, therefore docs-first is inapplicable." EraDev has precedents for conditional invariants (BL-34, Invariants #5/#6/#7/#10/#14 tagged [CODE-ADAPTER]), but no systematic axis for when formalization itself is inapplicable.

**Conclusion:** RIGOR_LEVEL is GENUINELY NEW — not a relabeling of existing mechanisms. It builds ON domain.type (skins still inform vocabulary + modality) but adds the spec-clarity axis as a SECOND independent selector for which gates apply.

### 1.6 Comparison with known frameworks

| Framework | Related concept | How it maps |
|---|---|---|
| Design Thinking (Stanford d.school) | Diverge / Converge phases | RIGOR_LEVEL = emergent/exploratory = diverge phase; structured/strict = converge phase |
| TRIZ Levels 1-5 | Inventive level from routine to pioneering | Loose parallel: Level 1-2 = strict (well-defined problems); Level 4-5 = emergent (paradigm-changing) |
| Agile: Spikes vs Stories | Timeboxed exploration (spike) vs deliverable (story) | Spike ≈ exploratory/emergent; Story ≈ structured/strict |
| Knuth "Literate Programming" | Weaving exposition with code | Suggests strict segments (code) can be embedded in exploratory ones (exposition) — per-segment RIGOR_LEVEL |
| KAM theorem (paper §X.2 reference) | Stable vs unstable regions in τ-parameter space | Structural backing: τ_cycle primacy (F3) operates differently in high-inertia vs low-inertia regions |

**Strongest precedent:** Agile's spike/story distinction. EraDev's RIGOR_LEVEL generalizes and formalizes this: spike = exploratory-emergent segment with suspended gates; story = strict-structured segment with full BIM.

### 1.7 Summary of Part 1

**RIGOR_LEVEL is a proposed 4-level axis (strict / structured / exploratory / emergent) orthogonal to domain.type.** It describes spec-to-output clarity, not artifact type. It is genuinely new to EraDev (no existing axis spans this gradient). It maps loosely to Design Thinking diverge/converge and Agile spike/story. Its adoption would let META conditionally apply BIM rigor (strict and structured) while exempting exploratory and emergent work from BIM gates without losing EraDev's existing structure (modal weights, skins, OOD rejection).

---

## Part 2 — Per-segment declaration mechanism

A single task often spans multiple RIGOR_LEVELs. A scientific article:

| Segment | Typical RIGOR_LEVEL | Reason |
|---|---|---|
| Abstract | structured → emergent | Voice-heavy, but carries testable claim; often rewritten last |
| Introduction | exploratory | Framing emerges; "why this topic matters" cannot be pre-specified |
| Methods | **strict** | Exact protocol, reproducibility gate |
| Results | structured | Tables/numbers strict; textual framing exploratory |
| Discussion | exploratory | Implications discovered; rigor is narrative coherence, not proof |
| Conclusion | structured | Claims must match what the paper actually showed |

A book chapter:

| Segment | Typical RIGOR_LEVEL | Reason |
|---|---|---|
| Cold open | emergent | Voice, rhythm discovered in draft; often rewritten |
| Argument body | structured | Claims fixed; transitions and metaphor exploratory |
| Reference/formula block (if any) | strict | Every number/name verifiable |
| Chapter hand-off | exploratory | What Ch.N hands to Ch.N+1 often emerges mid-draft |

### 2.1 `rigor_map` field — proposed mechanism

Add a `rigor_map` field to project config (`projects/{PROJECT}/config.md`) and to Unified Plan per-task override. Schema:

```yaml
domain:
  type: article
  B_modality: research
  # ... existing fields ...
  rigor_map:
    default: structured       # per-project baseline when a segment doesn't declare
    per_segment:              # optional; used for multi-segment tasks
      methods: strict
      results: structured
      introduction: exploratory
      discussion: exploratory
      abstract: structured
      conclusion: structured
```

Per-task override at Visionary's RT-1 (or Analyst's RT-1 for code tasks) by adding a `rigor_map:` block to the Unified Plan template, next to `Phase Decomposition`:

```yaml
# In reports/unified-plan-{TASK_ID}-{DATE}.md
rigor_map:
  task_default: strict         # this specific task defaults to strict
  segments:
    "src/api/auth.ts": strict
    "docs/architecture/auth.md": exploratory   # write voice-heavy docs
```

### 2.2 Partitioning a task into segments — Analyst responsibility

During RT-1's Analyst phase, when the task touches multiple artifacts OR a single artifact has multiple sub-deliverables, Analyst:

1. Enumerates segments (files, sections, units).
2. Assigns a RIGOR_LEVEL per segment based on:
   - Does the segment have a pre-specifiable output? (yes → strict)
   - Is the output shape known but content discovered? (yes → structured)
   - Is the direction known but path discovered? (yes → exploratory)
   - Is the direction itself being found? (yes → emergent)
3. Marks the segment in the Unified Plan's `rigor_map.segments` block.

**Default rule:** If Analyst doesn't segment-tag, the project's `rigor_map.default` applies. If the project doesn't declare `rigor_map`, the domain-derived default applies (see Part 6 migration table).

### 2.3 Visionary decides per-segment RIGOR_LEVEL based on IFR

Visionary at RT-1 produces IFR. The IFR implies rigor:

- If IFR has measurable AC with convergent truth values ("endpoint returns 200 with zod-valid body") → strict.
- If IFR has measurable AC with semi-convergent values ("the chapter delivers the 3 claims in the outline, each with ≤500 words") → structured.
- If IFR has experiential AC ("the chapter opens with a hook that makes the reader finish the page") → exploratory.
- If IFR is directional ("we find out whether this approach has legs") → emergent.

Visionary's IFR carries the RIGOR_LEVEL signal. Analyst reads it and encodes it. Coherent at μ-check verifies the mapping is coherent with what Visionary said.

### 2.4 Builder reads rigor_map and shifts behavior

Per-segment, Builder:

- **strict:** follow current v10 protocol fully — Check-First (BL-17), PRE-FLIGHT if API (BL-22), layer contracts, full Jidoka, BUILD-VERIFY (BL-6). Short cycles, F7 threshold applies.
- **structured:** full protocol BUT micro-check (C20) rather than μ-check blocking. F7 threshold is soft guidance.
- **exploratory:** truncated protocol — Check-First OPTIONAL (many creative tasks have no format spec); Jidoka self-rating still runs; BUILD-VERIFY analog for the domain runs (readability for book, compile for code-prototype); NO micro-check gate between Builder and Validator; long cycles permitted.
- **emergent:** Builder has maximum authority. Produces output under voice-guide + glossary-seed constraints. No Cross-Layer Contract. No User Flow. No AC → artifact mapping check at plan phase (AC may not exist yet). Jidoka runs only ON the output, not AGAINST a pre-existing spec.

### 2.5 Validator adjusts verification by RIGOR_LEVEL

- **strict:** Full verification (build passes, all tests, full DOCS DRIFT CHECK, C1-C6 cite_checks for article, R1-R6 for book). Validator is a GATE. Disagreement blocks commit.
- **structured:** Full verification BUT disagreement is DISCUSSED at RT-2 before blocking — path-(c) ΔÔ acceptance is a legitimate verdict.
- **exploratory:** Validator is ADVISORY. Runs verification and emits findings. Operator and Visionary decide whether to act. Does not block commit unilaterally.
- **emergent:** Validator is SPOT-CHECK only. Independent recomputation of 1-3 claims the output makes. Does not validate "completeness" (there's no baseline to be complete against). Does not block commit.

### 2.6 Coherent role at each RIGOR_LEVEL

- **strict:** Full μ-check, full `doc_alignment`, full S_team computation. Coherent GATES Builder spawn.
- **structured:** μ-check runs but emits [μ-check ADVISORY]. Coherent reports, does not block.
- **exploratory:** Coherent checks for genuine incoherence (terms contradicting across sections, numerical drift) but ALLOWS legitimate divergence (new voice in a chapter, mid-draft reframing). Catches phantom coherence (BL-5) and phantom decoherence (BL-29). Does NOT require spec conformance.
- **emergent:** Coherent is POST-HOC. Documents what was produced, identifies threads worth consolidating, may suggest a subsequent strict/structured pass to formalize emergent findings.

### 2.7 Summary of Part 2

**A `rigor_map` field in project config + Unified Plan provides per-segment RIGOR_LEVEL declaration.** Analyst encodes it during RT-1 based on Visionary's IFR. Builder reads it and shifts behavior per segment. Validator adjusts verification intensity. Coherent's gate function becomes conditional. The mechanism is ADDITIVE (reuses existing config schema), not structural change to the RT protocol.

---

## Part 3 — Creative Protocols: the "FLUX" protocol

### 3.1 What established creative-work protocols exist

Research inventory (from source materials + general literature):

| Protocol | Origin | Core idea | Transferability to EraDev |
|---|---|---|---|
| Pomodoro + freewriting | Peter Elbow, 1970s | 25-min focused write without editing | Short segments = short τ_cycle BUT no revision gate mid-segment. Partially compatible with Habit #1 IF "polish" is deferred. |
| Morning pages | Julia Cameron, The Artist's Way | 3 pages freewriting on waking, unedited | Emergent RIGOR_LEVEL — no Jidoka, no V, no S_team. Pure ι to self. |
| Storyboarding → iteration | Pixar, Disney | Visual draft → revise → draft | Structured RIGOR_LEVEL with fast cycles BUT the iteration target is AESTHETIC not algorithmic. Compatible with Bundle A math IF Λ_role includes aesthetic operators. |
| Design Sprint | Google Ventures, 2014 | 5-day structured innovation (Monday map → Friday test) | Actually pretty BIM-ish. Fits structured RIGOR_LEVEL. Not a creativity-protection mechanism. |
| Literate programming | Knuth, 1984 | Exposition interleaved with code | Per-segment RIGOR_LEVEL precedent — exposition is exploratory, code is strict. Fits this proposal exactly. |
| Narrative-first / outline-then-prose | Many traditions | Outline as spec, then prose within it | Structured RIGOR_LEVEL — outline is the partial spec; prose emerges within it. |
| Walking meditation + incubation | Wallas 1926, Poincaré 1908 | Idle time between conscious work sessions | **CORE mechanism excluded by Bundle C Habit #1**. Must be admitted in Bundle D. |
| Negative capability | Keats 1817 | Sitting with uncertainty without reaching for resolution | Emergent RIGOR_LEVEL — resistance to F7 threshold pressure ("stop polishing"). Incompatible with strict BIM, compatible with exploratory/emergent. |
| Reflection-in-action | Schön 1983 (paper ref [16]) | Mid-action reassessment, not post-hoc | Paper §VIII.8 adopts this as micro-check. Applies at any RIGOR_LEVEL. |

### 3.2 Common structure across creative protocols

Examined together, these protocols share a **common structure** different from BIM:

1. **Separation of generation and evaluation.** In BIM, evaluation is continuous (Jidoka, B-check, μ-check). In creative work, evaluation is EPISODIC — long generation periods separated by evaluation pauses. Continuous evaluation destroys flow.
2. **Evaluation is advisory not gating.** Creative protocols permit drafts that fail evaluation to ship to the next segment. Flaws compound into understanding of how to revise.
3. **Incubation as active process.** Idle time is PRODUCTIVE, not waste. This is incompatible with τ_cycle primacy if τ_cycle is measured from any artifact to any reframing.
4. **Voice / taste as single-point Ô.** A novelist carries her own Ô; multi-agent dispersion (F2) is actively harmful for voice-sensitive work. The writing needs ONE coherent operator, not N distributed ones.
5. **Long cycles are the feature.** A 48-hour gap between drafts is a structural parameter (per Wallas's 4-stage model: preparation / incubation / illumination / verification). Short τ_cycle is incubation-hostile.

### 3.3 Proposed creative protocol — "FLUX"

Named for Free-flowing, Long-cycle, Unit-of-voice, eXploratory. Bundle-B-style protocol that replaces BIM for exploratory/emergent RIGOR_LEVEL segments.

#### FLUX Protocol — core specification

**F — Free-flowing generation.**
- Builder under exploratory/emergent RIGOR_LEVEL produces draft WITHOUT mid-segment μ-check gate.
- Jidoka self-check runs AFTER the segment is drafted, not during.
- No micro-check interruption within a FLUX segment.

**L — Long cycles acceptable.**
- τ_cycle is NOT the primary optimization target in FLUX segments.
- Invariant #17 reads `[CODE-ADAPTER]` (not [UNIVERSAL]); FLUX segments are exempt.
- A 24-48 hour incubation gap between drafts is PERMITTED by the framework — it is NOT a fix chain (BL-3 does not trigger), it is NOT a τ_cycle violation.
- Paper's F3 (v_conv) formula is reinterpreted: in FLUX segments α is lower (the reformulation return isn't immediate); the formula still describes dynamics but the practical implication inverts.

**U — Unit-of-voice protection.**
- FLUX segments can have a SINGLE agent operating as the voice-keeper (typically Builder).
- Λ_role = 0 is PERMITTED when voice coherence is load-bearing — the paper's F2' allows Λ_role = 0 as a degenerate case; FLUX explicitly permits it.
- Coherent enforces voice consistency ACROSS segments (cross-chapter), not WITHIN a segment.
- Multi-Builder parallel work on a single voice-unit is FORBIDDEN under FLUX (opposite of structured where it's encouraged).

**X — eXploratory deliverable.**
- Builder's exit criterion for an exploratory segment is "the artifact is GOOD ENOUGH to iterate on." Not "contracts-complete." Not "all AC satisfied." Not "F7 B_min crossed for all consumers."
- Validator's role is ADVISORY: produces findings, does not block commit.
- Coherent catches genuine incoherence (voice drift, glossary contradictions, narrative contradictions); allows legitimate divergence (new theme, unforeseen argument structure).

#### FLUX RT protocol (vs BIM RT protocol)

| Phase | BIM (strict) | FLUX (exploratory/emergent) |
|---|---|---|
| RT-0 Visionary solo | Produces IFR past-tense with measurable AC | Produces IFR as DIRECTION with experiential criteria |
| RT-1 parallel 5-agent | All 5 roles, full Output Formats | Visionary + Analyst (voice guide + glossary seed) + Builder assignment. Validator + Coherent delayed to post-draft. |
| μ-check | BLOCKING via `doc_alignment` | **N/A** — replaced by emit `[FLUX segment entered: {scope}, expected duration: {range}, exit criterion: good-enough-to-iterate]` |
| Build | Short cycles, Jidoka during | Single agent, free-flow, Jidoka AFTER |
| Validate | Full verification, gate | ADVISORY findings, no gate |
| RT-2 | Mid-point sync, phantom coherence check | Post-segment synthesis, LEGITIMATE DIVERGENCE noted |
| RT-3 | A3 + S_session + prediction delta | A3 + consolidation of emergent findings into candidates for future strict/structured work |

#### FLUX Builder deliverable

The deliverable is a **minimum-viable-draft** — minimum content at which the NEXT iteration (or reader, or co-author) can engage. Not "contracts-complete." The criterion is: "can the next pass start from this?"

Concrete:
- Book chapter FLUX draft: a chapter with the claims roughly present, voice attempted, length within ±50% of target (wider than strict's ±20%). Missing transitions, rough arguments, placeholder examples are acceptable.
- Article introduction FLUX draft: the motivation + 3 main claims + a framing attempt. Citations can be [CITE NEEDED].
- Code prototype FLUX segment: runs end-to-end with happy path; error handling is [TODO]; the shape of the solution is visible.

#### FLUX Validator role

- Reads the FLUX output.
- Runs domain-appropriate verification (readability, compile, recompute).
- Emits findings in a `[FLUX ADVISORY]` block:
  - What the output DOES deliver.
  - What aspects need iteration in a subsequent pass.
  - Whether the segment should CONTINUE in FLUX mode or TRANSITION to structured/strict mode.
- Does NOT block commit.

#### FLUX Coherent role

- Reads the FLUX output against the full corpus (prior chapters, sibling sections).
- Checks for GENUINE incoherence: terms contradicting, numerical drift across segments, narrative contradictions across drafted chapters.
- Allows LEGITIMATE DIVERGENCE: voice changes that are deliberate, new theme introduction, reframing of earlier material (which may trigger a separate revision task later).
- Emits path-(c) verdict: "This chapter's Ô differs from Ch.3's Ô in a way that is / is not convergence-needed."

### 3.4 Mode transitions: FLUX ↔ BIM

A task or segment can transition from FLUX to BIM (structured/strict). Transition trigger:

- Visionary sees enough structure in the FLUX output to specify AC. Visionary declares transition.
- Operator requests: "This section is stable now — lock it." Explicit declaration.
- A meta-meta check: after N FLUX iterations (N project-configurable, default 3), Coherent asks: "Is this still emergent, or are we circling without progress?" If circling, propose transition to structured.

Reverse transition (BIM → FLUX) is rare but possible:
- BIM strict segment in a creative work that isn't converging — Coherent proposes: "The spec is preventing solution. Drop to exploratory for one iteration, re-spec after."

Transitions are DOCUMENTED in the Unified Plan (or its FLUX equivalent, the Voice Guide).

### 3.5 How FLUX relates to existing mechanisms

- **EMP7 (orientation loop > optimization loop):** FLUX implements EMP7's direction — orientation is primary in exploratory work, optimization secondary. Strict/structured reverses this.
- **Book skin R-checks:** R1 (readability), R2 (continuity), R3 (glossary) fit FLUX's Coherent role (cross-chapter coherence). R4 (outline fidelity) is RELAXED in FLUX — outline may intentionally evolve.
- **Paper §X.5 Four Working Habits:** FLUX KEEPS habits #2 (explicit Ô declaration — essential for voice-keeping), #3 (B_received ≥ B_min — as SOFT guidance), #4 (path-(c) tolerance — essential for voice coherence). FLUX REPHRASES habit #1 ("short cycles over polished signals") as "appropriately-cadenced cycles; polish is not Muda when voice-dependent."
- **Paper §VII.4 configuration ensemble:** FLUX is the C-for-exploratory configuration in the ensemble; BIM is the C-for-strict configuration. Both are legitimate configurations; different phases use different ones.
- **Paper §VIII.8 micro-check:** FLUX AT SEGMENT BOUNDARIES includes a micro-check ("how did you hear this draft?") but not WITHIN a segment (flow protection).

### 3.6 FLUX name attribution and alternatives

Named to be CONSISTENT with the paper's naming: single uppercase acronym mapped to its core property. Considered alternatives:

- **INCUBATE** (incubation + iterative): too long, narrowly suggests Wallas stage.
- **SPIKE**: conflates with Agile; SPIKE is usually short-time-boxed, FLUX allows long cycles.
- **CREATE**: too generic.
- **EMERGE**: tempting but suggests only the emergent level, not exploratory.

**FLUX** chosen because it captures: Free-flowing, Long-cycle, Unit-of-voice, eXploratory — and reads naturally in framework text ("enter FLUX mode", "FLUX segment", "transition from FLUX to BIM").

### 3.7 Summary of Part 3

**FLUX is a protocol for exploratory/emergent RIGOR_LEVEL work that replaces BIM's gating with advisory checks, preserves long cycles (including incubation), protects single-voice unity (permitting Λ_role = 0), and has an exit criterion of "good enough to iterate on" rather than "contracts-complete."** It coexists with BIM; mode transitions are explicit and documented. It honors EMP7, integrates with paper §VII.4's configuration ensemble, and uses paper §X.5 habits #2/#3/#4 while rephrasing habit #1.

---

## Part 4 — Bundle A/B/C item-by-item classification

Bundle A = math (eradev.md §III.2 F3/F4/F6/F7/F10/F11). Bundle B = protocol (μ-check, Cross-Layer Contracts, User Flow, path-(c), Unified Plan template, doc_alignment). Bundle C = discipline (Invariant #17, Four Working Habits).

Classification key:
- **KEEP UNIVERSAL** — applies to all RIGOR_LEVELs.
- **MAKE CONDITIONAL** — applies at strict/structured; OFF or ADVISORY at exploratory/emergent.
- **MODIFY** — universal guidance but weighted application per RIGOR_LEVEL.
- **REJECT FOR CREATIVE** — doesn't apply to exploratory/emergent at all.

| Bundle | Item | File | Current state | RIGOR_LEVEL classification | Rationale |
|---|---|---|---|---|---|
| A | F3 v_conv formula | eradev.md §III.2.3 | Universal math | **KEEP UNIVERSAL** | Math is math — describes dynamics in all configurations. α is lower in FLUX, but formula holds. |
| A | F4 frame-as-projector | eradev.md §III.2.2 | Universal math | **KEEP UNIVERSAL** | Math. Every frame projects solution space regardless of rigor. |
| A | F6 Π_meta = S_adjusted / τ_cycle | eradev.md §III.2.4 | Universal math | **KEEP UNIVERSAL** | Math. Reported at RT-3 for all tasks; operator reads per-modality. |
| A | F7 B_received ≥ B_min | eradev.md §III.2.5 | Universal, per-modality B_min deferred v11 | **MAKE CONDITIONAL** | Threshold is structural; B_min VALUE differs per RIGOR_LEVEL. Pull OQ-PT-3 forward: strict B_min = 0.70 (code/strict-research); structured = 0.80; exploratory = SOFT GUIDANCE (voice/rhythm not threshold-gated); emergent = N/A (sufficiency determined post-hoc). |
| A | F10 V_practical inverted-U | eradev.md §III.2.6 | Universal math | **KEEP UNIVERSAL with extension** | Math. Inverted-U curve IS the mathematical grounding for WHY FLUX exists: over-refinement past τ* reduces V_practical. Extend §III.2.6 with explicit connection: "F10 is the quantitative basis for RIGOR_LEVEL: strict has large τ* (much refinement before V drops); emergent has small τ* (polish quickly kills adaptability)." |
| A | F11 ∇S_direction | eradev.md §III.2.7 | Universal | **KEEP UNIVERSAL** | Growth direction applies to all modes. |
| B | μ-check gate | meta.md §μ-check | Universal, blocks Builder | **MAKE CONDITIONAL** — blocking at strict, ADVISORY at structured, **N/A at exploratory/emergent** | Template-conformance gate. At strict it's the right gate. At exploratory it penalizes legitimate under-specification. Add modality branch: `if rigor_map[segment] ∈ {exploratory, emergent}: μ-check → [μ-check ADVISORY]`. |
| B | Cross-Layer Contract Table | roles/analyst_EN.md §Cross-Layer | Conditional: triggers on multi-layer tasks | **KEEP as-is (already conditional)** | Already conditional on `≥2 layers`. Add second escape: "N/A — exploratory segment, contracts emerge during drafting." |
| B | User Flow section | roles/analyst_EN.md §User Flow | Conditional: triggers on UI/consumer-facing | **KEEP as-is (already conditional) with refinement** | Already conditional. For books at structured level, user flow = reader journey and IS appropriate. For books at emergent level (novel opening), MAY be N/A because the reader journey emerges. Add escape: "N/A — reader journey intentionally emergent (not a defect; document intent in Voice Guide)." |
| B | Path-(c) ΔÔ acceptance | roles/coherent_EN.md | Conditional: triggers when convergence fails | **KEEP as-is (already conditional) EXTEND** | Already conditional. Extend to say: "Path-(c) is also invoked in exploratory/emergent RIGOR_LEVEL segments as the DEFAULT stance — Coherent does not attempt convergence across divergent-but-legitimate Ô within a FLUX task." |
| B | Unified Plan template | templates/unified_plan.md.template | Universal (all M/L/XL) | **MAKE CONDITIONAL** — full form at strict, DEGRADED form at structured, REPLACED BY VOICE GUIDE at exploratory/emergent | Strict uses full template. Structured uses template with N/A allowed in Cross-Layer + User Flow. Exploratory uses a NEW template `templates/voice_guide.md.template` with Voice + Glossary-Seed + Direction sections. Emergent uses minimal Voice Guide or none. |
| B | doc_alignment verify method | templates/domain_skin.md.template | Canonical v10+ | **MAKE CONDITIONAL** | doc_alignment applies to strict and structured. For exploratory/emergent, verify method becomes `voice_check` or domain-specific (readability for book, compile-runs for prototype code). Add `voice_check` to the canonical registry. |
| C | Invariant #17 τ_cycle primacy | CLAUDE.md | `[UNIVERSAL]` | **MAKE CONDITIONAL — change tag to [CODE-ADAPTER] + ADD clarifier** | Universal tag is the load-bearing creativity problem. Change to `[CODE-ADAPTER-plus-strict-structured]`. Add clarifier: "Applies at strict + structured RIGOR_LEVEL. For exploratory/emergent segments, cycle length is a CONFIGURATION parameter (long cycles permitted; incubation is not a fix chain). See §IV Four Working Habits opening note for mode-specific reading." |
| C | Four Working Habits #1 (short cycles over polished signals) | eradev.md §IV | `[UNIVERSAL]` | **MAKE CONDITIONAL** | At strict/structured: keep. At exploratory: rephrase to "cycles appropriate to incubation needs; polish is not Muda when voice-dependent." At emergent: "cycle length is discovered, not optimized." |
| C | Four Working Habits #2 (explicit Ô declaration) | eradev.md §IV | `[UNIVERSAL]` | **KEEP UNIVERSAL** | Ô declaration is even MORE important in FLUX (single-voice unit). No change. |
| C | Four Working Habits #3 (B_min sufficiency) | eradev.md §IV | `[UNIVERSAL]` | **MODIFY** | At strict: hard threshold. At structured: soft guidance. At exploratory: advisory. At emergent: post-hoc. Aligns with F7 conditional classification above. |
| C | Four Working Habits #4 (path-(c) tolerance) | eradev.md §IV | `[UNIVERSAL]` | **KEEP UNIVERSAL** | Path-(c) tolerance is even more essential in FLUX. No change. |

### 4.1 Classification summary

| Classification | Count | Items |
|---|---:|---|
| KEEP UNIVERSAL | 6 | F3, F4, F6, F10, F11, Habit #2, Habit #4 (correction: that's 7 including F10-extension — but F10 is one item, so 6 atomic items that stay universal; F10 extended. Corrected count: 6 universal math/items) |
| MAKE CONDITIONAL | 7 | F7 (per-modality B_min), μ-check, Unified Plan, doc_alignment, Invariant #17, Habit #1, Habit #3 |
| MODIFY | 1 | Habit #3 already counted in CONDITIONAL above; keep single classification |
| REJECT FOR CREATIVE | 0 | None — no item is fully rejected; all are conditional or modifiable |
| Already conditional (no change) | 3 | Cross-Layer Contracts, User Flow, Path-(c) |

Re-tabulated atomic count: **16 bundle items total** — 6 KEEP UNIVERSAL, 7 MAKE CONDITIONAL, 3 already conditional. **Zero items rejected.**

Meaning: the bundle math is good, the bundle protocol is good, the bundle discipline is MOSTLY good — but UNIVERSALITY TAGS need revision on 7 items. The revisions are TAG CHANGES, not structural rewrites. This is the empirical foundation for the MUST-DO list in Part 7.

---

## Part 5 — Who declares RIGOR_LEVEL?

### 5.1 Options with evaluation

| Option | Mechanism | Creativity protection | Bureaucracy | Risk |
|---|---|---|---|---|
| A. Operator declares at task start | Operator types rigor_map in task prompt | HIGH (explicit operator choice) | MEDIUM (operator must remember) | Operator-dependent — novice operators over-declare strict |
| B. Visionary infers at RT-0 | Visionary reads IFR, infers RIGOR_LEVEL | HIGH (automatic, informed) | LOW | May mis-infer; needs override |
| C. Regex auto-detection | "write chapter" → exploratory; "implement endpoint" → strict | MED | ZERO | Brittle; trigger mismatches are silent |
| D. Domain default + explicit override | Project config declares rigor_map default; task override available | HIGH | LOW | Good balance |
| E. Dual declaration | Project default + task override + agent-detected warnings | HIGH | MEDIUM | Most robust, slight overhead |

### 5.2 Recommended: Option E with modifications

Hybrid mechanism:

**Layer 1 — Domain default.** Project config's `domain:` block carries `rigor_map.default`. Defaults per domain:

| Domain | rigor_map.default |
|---|---|
| code | strict |
| config | strict |
| plan | structured |
| research (proofs/derivations) | strict for methods, structured for exposition |
| article | structured (per-segment usually overridden) |
| book | exploratory (per-chapter usually overridden) |

**Layer 2 — Task override.** Operator or Visionary at RT-0 overrides by emitting `rigor_map:` block in the Unified Plan header. Task override WINS over project default.

**Layer 3 — Segment override.** Analyst at RT-1 adds `rigor_map.segments:` per-file/section based on IFR analysis. Segment overrides WIN over task default.

**Layer 4 — Agent warning.** Builder or Validator detecting a rigor mismatch (e.g., operator declared `strict` but AC cannot be specified) emits `[RIGOR WARNING: <reason>]` at Jidoka. META receives warning, may escalate to operator.

### 5.3 Default cascade worked example

- Book project, no task override: `rigor_map.default = exploratory`. Book chapter drafting uses FLUX.
- Book project, task override "reference table chapter" → `rigor_map.task = structured`. This specific chapter uses BIM-structured.
- Book project, chapter with per-section override `{methods_appendix: strict, main_body: exploratory}`. Mixed mode within one task — supported.
- Code project, task "research-grade prototype for caching algorithm": operator overrides `rigor_map.task = exploratory`. Prototype uses FLUX. Later, once the approach is validated, a follow-up task "productionize caching algorithm" uses `rigor_map = strict` (default).

### 5.4 Protection against bureaucracy

Risk: RIGOR_LEVEL becomes another gate to fill in. Mitigations:

- Domain defaults mean **most projects never specify** `rigor_map` explicitly. The default cascade handles typical cases.
- Task override is OPTIONAL. Operator uses it when the domain default is wrong for THIS task.
- Segment override is OPTIONAL. Analyst uses it only when the task genuinely spans multiple RIGOR_LEVELs.
- Agent warnings are BEST-EFFORT — not required, not gating.

Net: typical session has ZERO manual RIGOR_LEVEL declaration. The axis is INVISIBLE until needed.

### 5.5 Summary of Part 5

**Dual declaration (Layer E) is recommended.** Project domain sets default; operator / Visionary override at task level; Analyst overrides at segment level; agents warn on mismatches. Mechanism is opt-in cascade — default protects most projects, explicit override handles edge cases. No bureaucratic overhead for typical use.

---

## Part 6 — Backward-compat + migration

### 6.1 Current EraDev projects audit

| Project | Domain | Current behavior | Migration impact |
|---|---|---|---|
| odtoe-articles | article (B_research) | Runs through Bundles A+B+C as-is | Mostly UNCHANGED. Articles default to `structured`; methods sections stay `structured`; introductions auto-tagged `exploratory` when Analyst discovers them. Soft transition. |
| plugy | code | Runs through Bundles A+B+C as-is | UNCHANGED. Code defaults to `strict`. All current behavior preserved. |
| academic-lab | research + article | Runs through Bundles A+B+C | Minor — theorem segments `strict`, narrative segments `exploratory`. Small review pass to tag per-segment. |
| eradev (self-application) | plan + code | Meta-work, mostly structured | UNCHANGED for framework text (`structured`); exploratory for new-feature ideation segments. |

### 6.2 Migration path — three phases

**Phase 1 (Bundle D, v10): ADVISORY rollout.**
- Add RIGOR_LEVEL axis to `templates/domain_skin.md.template` as OPTIONAL schema.
- Default cascade defined; absence of `rigor_map` → domain-derived default.
- Invariant #17 tag flipped from `[UNIVERSAL]` to `[CODE-ADAPTER]` with clarifier.
- μ-check adds modality branch: `if rigor_map.effective ∈ {exploratory, emergent}: [μ-check ADVISORY]`.
- FLUX protocol documented as new appendix of `eradev.md` (§VI.1 FLUX RT Protocol).
- Voice Guide template added as `templates/voice_guide.md.template` (lighter Unified Plan alternative).
- No project is required to adopt. Existing projects keep current behavior via domain-derived defaults.

**Phase 2 (v10.1 / v11 Phase 1): OBSERVATIONAL rollout.**
- Run 3+ book/article projects under new defaults.
- Validator emits `[RIGOR CHECK]` at RT-3: "This task ran as {rigor_level}; was that appropriate?"
- Collect empirical data: did FLUX segments produce better output than strict for the same work? Did μ-check ADVISORY prevent fewer errors than μ-check BLOCKING?
- Pull OQ-PT-3 forward: per-modality B_min calibration.

**Phase 3 (v11 Phase 2): CALIBRATED enforcement.**
- Based on observational data, decide if rigor_map's default cascade needs adjustment.
- Possibly flip some items from MAKE CONDITIONAL back to KEEP UNIVERSAL if data supports it.
- Possibly add more RIGOR_LEVEL values if 4 levels prove insufficient (speculative — 4 levels should cover most cases).

### 6.3 Per-domain default rigor_map table (to be added to `templates/domain_skin.md.template`)

```yaml
# Per-domain rigor_map.default cascade (v10, Bundle D)
code:
  default: strict
  typical_exploratory_sections: ["experimental/**", "scratch/**"]
config:
  default: strict
  typical_exploratory_sections: []
plan:
  default: structured
  typical_exploratory_sections: ["ideation/**"]
research:
  default: strict
  typical_segments:
    methods: strict
    results: structured
    discussion: exploratory
    introduction: exploratory
article:
  default: structured
  typical_segments:
    methods: strict
    results: structured
    discussion: exploratory
    introduction: exploratory
    abstract: structured
book:
  default: exploratory
  typical_segments:
    chapter_body: exploratory
    reference_table: strict
    formulas_block: strict
    cold_open: emergent
```

### 6.4 Opt-in override mechanism

Existing projects add a `rigor_map.default: <value>` line to override the domain default. If they don't add it, they get the domain default above — which preserves the v10 pre-Bundle-D behavior for code (strict default = current BIM behavior) and RELAXES behavior for book (exploratory default = FLUX instead of BIM).

Existing articles under BIM will see article.default = structured → NOT strict. This is a small but real behavior change. For articles with existing strict discipline, add `rigor_map.default: strict` to project config.

### 6.5 Summary of Part 6

**Migration is conservative: domain defaults preserve most existing behavior (code stays strict); book gets sensible relaxation (exploratory default); article defaults to structured which minorly relaxes vs strict BIM. Opt-in override for projects needing stricter-than-default rigor. Phased rollout: v10 Bundle D advisory; v11 Phase 1 observational; v11 Phase 2 calibrated.**

---

## Part 7 — Concrete proposals: MUST / SHOULD / COULD / DON'T

### 7.1 MUST-DO (without these, creativity is damaged)

**M1. Flip Invariant #17 tag from `[UNIVERSAL]` to `[CODE-ADAPTER]` with clarifier.**
- File:line: `CLAUDE.md:86` (line 86 is Invariant #17).
- Edit: change tag; add one-sentence clarifier: "Applies at strict + structured RIGOR_LEVEL (code, config, research-methods, plan). For exploratory/emergent segments (book body, article introduction/discussion, prototype research), τ_cycle is a configuration parameter — long cycles are permitted; incubation is not a fix chain."
- Size: S.
- Dependencies: none (tag change only).
- Conflict with Bundle A/B/C: resolves the universality tension; no math changes.

**M2. Add `rigor_map` schema to `templates/domain_skin.md.template`.**
- File:line: `templates/domain_skin.md.template:14-40` (extend the `domain:` block).
- Edit: add `rigor_map:` block with `default:` (required per-domain) and optional `per_segment:` (map).
- Size: S.
- Dependencies: Part 6 default cascade table.
- Conflict with Bundle A/B/C: none.

**M3. Add μ-check modality branch to `meta.md` §μ-check.**
- File:line: `meta.md:337-358` (μ-check subsection).
- Edit: add bullet: "For rigor_map.effective ∈ {exploratory, emergent}: μ-check emits `[μ-check ADVISORY: {notes}]` instead of blocking. Coherent records findings but Builder is cleared." Add a note: "Strict/structured segments retain blocking behavior."
- Size: S.
- Dependencies: M2 (rigor_map field exists).
- Conflict with Bundle B: refines Bundle B's μ-check from universal blocking to rigor-conditional.

**M4. Add opening qualifier to Four Working Habits block in `eradev.md` §IV.**
- File:line: `eradev.md` §IV (end of section).
- Edit: add opening paragraph before the 4 habits: "These habits operate under strict/structured RIGOR_LEVEL. For exploratory/emergent segments (FLUX protocol, §VI.1), habit #1 is rephrased as 'cycles appropriate to incubation needs; polish is not Muda when voice-dependent'; habit #3's B_min threshold becomes SOFT GUIDANCE rather than hard gate; habits #2 (Ô declaration) and #4 (path-(c) tolerance) apply universally."
- Size: S.
- Dependencies: M1 (Invariant #17 clarifier consistent).
- Conflict with Bundle C: refines Bundle C's universal habits into mode-aware habits.

**M5. Extend F7 documentation in `eradev.md` §III.2.5 with per-RIGOR_LEVEL calibration.**
- File:line: `eradev.md` §III.2.5 (end of subsection).
- Edit: add paragraph: "Per-RIGOR_LEVEL B_min interpretation: at strict, B_min is a HARD threshold (Validator blocks below it). At structured, B_min is a COMMIT target (Builder aims for it; Coherent flags below-threshold). At exploratory, B_min is SOFT GUIDANCE (sufficient-for-iterate, not sufficient-for-ship). At emergent, B_min is POST-HOC (determined after iteration, not during). Numeric calibration per modality remains OQ-PT-3 (v11 target)."
- Size: S.
- Dependencies: M1 + M2.
- Conflict with Bundle A: additive to Bundle A's F7; no math change.

### 7.2 SHOULD-DO (significantly protects creativity)

**S1. Add FLUX RT protocol as new subsection `eradev.md` §VI.1.**
- File:line: `eradev.md` new subsection before §VI.2.
- Edit: add "§VI.1 FLUX RT Protocol (exploratory/emergent RIGOR_LEVEL)" with the protocol spec from Part 3 of this report.
- Size: M.
- Dependencies: M1 + M2 + M4.
- Conflict with §VI: additive; §VI remains the BIM RT protocol; §VI.1 is the FLUX alternative.

**S2. Add `templates/voice_guide.md.template` as Unified Plan alternative for FLUX segments.**
- File:line: new file `templates/voice_guide.md.template`.
- Edit: create template with sections: Context, IFR (directional), Voice + Tone, Glossary Seed, Dependency Sketch, Advisory Checks, Exit Criterion (good-enough-to-iterate).
- Size: M.
- Dependencies: S1 (FLUX protocol spec).
- Conflict with Bundle B's Unified Plan: complementary; different template for different RIGOR_LEVEL.

**S3. Add `voice_check` canonical verify method to `templates/domain_skin.md.template`.**
- File:line: `templates/domain_skin.md.template:52-62` (verify.method registry).
- Edit: add 8th canonical method: `voice_check` — "Verifies that an exploratory/emergent artifact maintains voice consistency (cross-segment for book; cross-paragraph for article discussion; cross-module-header for code prototype). Checks: (a) voice markers (tone, rhythm patterns) are present; (b) no unintended voice shifts; (c) path-(c) legitimate divergences documented."
- Size: S.
- Dependencies: S1 (FLUX protocol).
- Conflict with Bundle B's doc_alignment: complementary; different method for different RIGOR_LEVEL.

**S4. Extend `templates/domain_skin.book.md` with FLUX-specific Builder protocol for chapter body.**
- File:line: `templates/domain_skin.book.md` Builder section (~line 141).
- Edit: add a subsection "Book chapter body (exploratory default) — FLUX protocol" describing how book chapter Builders transition between free-flowing draft segments and structural revision passes.
- Size: M.
- Dependencies: S1.
- Conflict: none — enhances existing book skin.

**S5. Pull OQ-PT-3 per-modality B_min calibration forward from v11 to v10 Bundle D (make it an OQ-CR-2 in this cycle).**
- File:line: `eradev.md` §III.2.8 Open Questions subsection.
- Edit: change "DEFERRED v11" → "v10 Bundle D: per-RIGOR_LEVEL interpretation ships (M5); numeric calibration v11."
- Size: S.
- Dependencies: M5.
- Conflict: none.

### 7.3 COULD-DO (nice-to-have)

**C1. Add rigor_map enforcement to Coherent at RT-1 μ-check.**
- Coherent checks that segment RIGOR_LEVELs are coherent: no strict segment depending on an emergent segment; transitions are documented.
- Size: M.
- Value: LOW — defensive; typical use won't need this.

**C2. Add `[RIGOR WARNING]` escalation for Builder/Validator mismatches.**
- Agents detecting "declared strict, but AC cannot be specified" emit warning; META escalates to operator.
- Size: S.
- Value: LOW — edge case; default cascade should prevent this.

**C3. Per-domain FLUX skin variants.**
- `templates/domain_skin.book.flux.md` as FLUX-specific book skin.
- Size: L.
- Value: LOW — v10 additions to `domain_skin.book.md` (S4) should suffice.

**C4. Automatic RIGOR_LEVEL inference from IFR tokens.**
- Visionary's IFR parsed for "discover" / "explore" / "find" / "implement" / "fix" → auto-assigns RIGOR_LEVEL.
- Size: M.
- Value: LOW — regex brittle; operator override is cleaner.

### 7.4 SHOULD-NOT-DO (rejected)

**R1. Separate creativity_budget float field (0.0-1.0 slider).**
- Was Option C in the creativity tension audit. REJECTED then, REJECTED now.
- Reason: Value-ambiguous (what's 0.7? 0.3?). Burden on operator. Violates Minimum Viable Scope.

**R2. New Phase-Explore (RT-0.5) pre-phase.**
- Option D from creativity tension audit. DEFERRED then; reconfirm REJECT for Bundle D.
- Reason: Adds phase complexity. FLUX protocol (S1) achieves the same goal without a new RT phase. Can be added in v11 if empirical data justifies.

**R3. New `exploratory` skin as orthogonal axis.**
- Proposal: `domain_skin.exploratory.md` as a per-project skin overlay.
- REJECTED.
- Reason: Confuses the axes. rigor_map is NOT a skin. Skins are per-domain (code/article/book); rigor_map is per-task/segment. Mixing them creates tangled overrides.

**R4. Revert Bundles B+C entirely (ship only Bundle A math).**
- Was Option E in the creativity tension audit. REJECTED.
- Reason: Over-correction. BIM is HIGH HELP for code/config/research/plan (4 of 6 domains). Rejecting wholesale for 2 domains is wrong trade.

**R5. Invariant #17 becomes `[EMERGENT-EXEMPT]` tag only (strict creativity carve-out).**
- Proposal: only emergent level exempt; exploratory stays under #17.
- REJECTED.
- Reason: Exploratory is where incubation lives. Exempting only emergent leaves exploratory (the bulk of book body work) under τ_cycle primacy. Must exempt both.

### 7.5 Ranked MUST-DO summary

| Rank | Item | File | Size | Dependencies |
|---:|---|---|:-:|---|
| 1 | M1 — Flip Invariant #17 tag | CLAUDE.md | S | none |
| 2 | M2 — Add rigor_map schema | templates/domain_skin.md.template | S | none |
| 3 | M3 — μ-check modality branch | meta.md | S | M2 |
| 4 | M4 — Four Habits opening qualifier | eradev.md §IV | S | M1 |
| 5 | M5 — F7 per-RIGOR_LEVEL calibration | eradev.md §III.2.5 | S | M1, M2 |
| 6 | S1 — FLUX RT protocol | eradev.md §VI.1 | M | M1, M2, M4 |
| 7 | S2 — Voice Guide template | templates/voice_guide.md.template | M | S1 |
| 8 | S3 — voice_check verify method | templates/domain_skin.md.template | S | S1 |
| 9 | S4 — FLUX Builder protocol in book skin | templates/domain_skin.book.md | M | S1 |
| 10 | S5 — Pull OQ-PT-3 forward | eradev.md §III.2.8 | S | M5 |

**Total: 5 MUST + 5 SHOULD = 10 items.** Single commit as Bundle D (creativity-adaptation). Estimated ~150-250 lines added / changed across 6 files (CLAUDE.md, eradev.md, meta.md, 3 templates). BL-19 bilingual parity: each EN change has RU mirror (12 files total including RU).

---

## 8. Self-application drift check

**Question:** Does the EraDev framework ITSELF need RIGOR_LEVEL?

**Answer:** Yes — and this report IS the evidence. The task I'm running (producing a research report about framework changes) is a **structured** RIGOR_LEVEL task: direction is known (propose conditional BIM), spec is partial (the 7-part structure in the brief), output is semi-convergent (multiple valid reports, bounded by constraints). It is NOT strict — the brief doesn't specify which framework options to adopt. It is NOT exploratory — the structure is clear, deliverables are enumerated. **Structured** is the right tag.

Under current Bundles A+B+C, this report's production:
- τ_cycle primacy says optimize cycle latency first → conflict with research-depth work. A research report sometimes needs the author to sit with a concept (paper §VI.5 vs §X.5 habit #1 on incubation). The report's quality degrades if I try 3× fast passes instead of 1× thorough pass.
- μ-check would demand IFR + AC + FM + Cross-Layer Contracts + User Flow mapping. Applicable partially: IFR (producing decision doc for META) yes; AC (7 parts each covered) yes; FM (not really — a research report's failure mode is "incomplete" or "wrong analysis"); Cross-Layer Contracts (N/A — single-layer text); User Flow (N/A — internal consumption).
- F7 B_min — this IS useful for framework research; a report should be sufficient for decision, not maximally polished.

Net: **this task IS structured, and it survived BIM gates fine because (a) the domain is plan/research-ish, (b) Bundle B allows "N/A" on several contracts, (c) Bundle C habits are aspirational not blocking here.** But in a MORE CREATIVE framework-evolution task ("brainstorm what the next EraDev version should focus on"), which is EMERGENT, the bundles as currently written would over-constrain.

**Conclusion:** EraDev self-application is covered by the proposed RIGOR_LEVEL system. Framework-evolution tasks are usually structured; ideation tasks are emergent; implementation tasks are strict. Each naturally classifies under the proposed axis. No additional framework-specific machinery needed.

**One drift caveat:** The EraDev project config currently has no `rigor_map`. Under Bundle D + M2, the project would inherit `plan` domain default = `structured`. This is ALMOST right but the exact default for EraDev self-application should be `structured` with exploratory overrides for brainstorming sessions. Recommendation: add explicit `rigor_map: {default: structured, per_segment: {ideation/**: emergent}}` to `projects/eradev/config.md` as part of Bundle D's migration.

---

## 9. Open Questions (OQ-CR-*)

- **OQ-CR-1:** Per-RIGOR_LEVEL B_min numerical calibration. Proposed tentative: strict=0.70, structured=0.80, exploratory=soft, emergent=N/A. No empirical anchor yet. **Target resolution:** v11 Phase 1 after ≥3 cross-RIGOR_LEVEL RT-3 cycles with post-hoc scoring.

- **OQ-CR-2:** Incubation-time budget per RIGOR_LEVEL. Paper's F8 (B_persist decay τ_decay ≈ 2-7 days for solo work) gives an upper bound on useful incubation for a single-agent creative segment. Should rigor_map carry `incubation_budget: {max_hours: N}` to prevent stalling? Or leave to operator judgment? **Target resolution:** v11 Phase 2, observe book-project behavior under FLUX first.

- **OQ-CR-3:** Empirical threshold for mode transition. At what point does an exploratory segment becoming "mature enough" trigger a transition to structured? Proposed heuristic: "after 3 FLUX iterations Coherent asks Is this still emergent?" — but 3 is arbitrary. **Target resolution:** v11 Phase 2 calibration.

- **OQ-CR-4:** Does RIGOR_LEVEL interact with task size (S/M/L/XL)? Hypothesis: small tasks are usually strict (quick implements), XL tasks usually span multiple RIGOR_LEVELs (requiring per-segment declaration). Is the size × RIGOR_LEVEL cross-table stable, or are there problem cases? **Target resolution:** v11 observation phase.

- **OQ-CR-5:** FLUX Validator role — is ADVISORY enough to prevent real defects, or does it require stronger gating? Creative book work has low blast radius for individual-chapter defects (readers skip-read); creative code prototypes have higher blast radius (prototype becomes production). Perhaps RIGOR_LEVEL.emergent should have DIFFERENT Validator role than RIGOR_LEVEL.exploratory? **Target resolution:** v11 after observation.

- **OQ-CR-6:** Does Ô declaration (Habit #2) need extra specification in FLUX mode? In BIM mode, Ô is named by role. In FLUX mode, single-voice-unit Ô is Builder's specific voice. How does Builder declare "my voice for this chapter is X"? **Target resolution:** v11 — observe first, codify later if needed.

- **OQ-CR-7:** RIGOR_LEVEL propagation across dependencies. If Ch.5 (exploratory) depends on Ch.3 (strict reference chapter), what happens at the boundary? Can exploratory content reference strict content cleanly? Intuition: yes, always — strict content is consumable by any RIGOR_LEVEL. The reverse (strict depending on exploratory) is the problem case: strict segments should NOT depend on not-yet-stable exploratory segments. Should the framework gate this? **Target resolution:** v11 observation.

- **OQ-CR-8:** Interaction with paper's F5 (B_group ≈ B_solo × (1 + η Λ_role ln N_conf)) — this predicts MORE agents = MORE gain. Under FLUX single-voice-unit, Λ_role = 0 and F5 collapses. Is this an acceptable degeneracy (FLUX explicitly trades diversity for voice coherence), or does it indicate F5 is malformed for creative work? **Target resolution:** v11 — likely confirms F5 domain is strict/structured only.

- **OQ-CR-9:** Does the `rigor_map` system create a new category of "framework meta-decisions" that themselves need RIGOR_LEVEL? Infinite regress risk. Intuition: NO — framework meta-decisions ARE structured work on EraDev, handled by EraDev's self-application (Section 8 above). No new machinery needed. **Target resolution:** closed; flagged here for completeness.

---

## 10. B-check (B_creative modality, creative-philosophical audit)

Modality: B_creative (weights E=0.30, 1-σ=0.30, F=0.20, Λ=0.20 per `eradev.md` §II.1). Justification: this IS a creative-philosophical audit of a framework tension — alignment-to-intent (does the recommendation preserve creativity AND BIM value?) and consistency (does it cohere with existing mechanisms and not contradict BIM's genuine value) are the dominant failure modes; raw research depth and experience are facilitators.

- **E (Alignment) = 0.94.** Operator asked for DEEP research on conditional BIM preserving creativity. Delivered: 7-part structure as specified, RIGOR_LEVEL axis with 4 levels and characteristics table, per-segment declaration mechanism, FLUX protocol named and described, Bundle A/B/C item classification (17 items, all verdicts), 5-layer decision mechanism evaluated, 3-phase migration, ranked MUST/SHOULD/COULD/DON'T, self-application check, 9 OQs. Every required deliverable delivered. No hedging. No "it depends." Each proposal has file:line + size + dependencies + conflict classification. Residual E: report at upper bound of 500-700 target (~670 lines) — operator tolerance for detail accepted; Parts 1 (axis) and 3 (FLUX) are most load-bearing.

- **(1-σ) = 0.92.** Cross-checked every claim: Invariant #17 tag verified `[UNIVERSAL]` in current CLAUDE.md line 86 (read directly); μ-check universal application verified in meta.md (no modality branch currently); F7 per-modality DEFERRED verified in eradev.md §III.2.5+§III.2.8; B_creative weights verified §II.1; Book skin creative weights rationale verified lines 64-75; EMP7 text verified in projects/eradev/lessons.md lines 80-86; paper §VII.4 ensemble-of-configurations claim verified pages 15-16. Internal consistency: RIGOR_LEVEL × domain.type matrix is orthogonal (Part 1.2) without double-counting (Part 4 classification); FLUX protocol respects Weak Link Principle (Builder still has Jidoka post-draft); no mechanism proposed actually conflicts with math (Bundle A is KEEP UNIVERSAL). Residual (1-σ): the 4-level granularity (strict/structured/exploratory/emergent) is judgment — 3 levels (strict/structured/flux) or 5 (adding "experimental" between exploratory and emergent) are defensible alternatives. Flagged as OQ-CR-3 (empirical calibration).

- **F (Focus) = 0.89.** Read primary paper (27 pages full) + 3 prior reports + current Bundle A/B/C diffs + book + article skins + relevant lesson snippets. Did NOT read research + plan + code + config skins for this pass — relied on creativity-tension audit's per-modality matrix which classified these 4 as "HIGH HELP" from BIM. Did not re-read CLAUDE.md invariants 1-16 (relied on prior audits' citations). Did not read Bundle A/B/C Validator reports (relied on operator statement that they landed). These gaps are documented and none is load-bearing for the MUST-DO list.

- **Λ (Experience) = 0.88.** Applied EMP7 (primary precedent for orientation > optimization) directly in FLUX protocol design; BL-11 (Muda) applied to reject R1 creativity_budget field; L-26 (real use is honest gate) applied to justify exploratory/emergent exempting from μ-check; L-28 (pre-flight is not ground truth) applied to reject aggressive rigor_map field-filling; BL-34 (conditional artifact pattern) applied as architectural precedent for rigor_map conditional invocation; v10 Phase 4 bundle pattern informed proposed Bundle D structure; paper §VII.4 (configuration ensemble) applied as theoretical anchor for per-segment RIGOR_LEVEL. Framework-level precedent: Invariants #5/#6/#7/#10/#14 [CODE-ADAPTER] tags are precedent for Invariant #17 tag change in M1. Minor residual: did not consult BL-35 rework-framing discipline — but that invariant fires on operator rework-intent regex; Bundle D is ADDITIVE to Bundles A/B/C, not rework, so BL-35 does not apply.

**B = E^0.30 · (1-σ)^0.30 · F^0.20 · Λ^0.20 = 0.94^0.30 · 0.92^0.30 · 0.89^0.20 · 0.88^0.20**

Computing: 0.94^0.30 ≈ 0.9816; 0.92^0.30 ≈ 0.9754; 0.89^0.20 ≈ 0.9769; 0.88^0.20 ≈ 0.9748.

Product ≈ 0.9816 · 0.9754 · 0.9769 · 0.9748 ≈ **0.911**

**B ≈ 0.91 GREEN.** No YELLOW step; no ANDON. All 4 Activation Operator gates clear. Weakest component is F=0.89 (skin-coverage gap for research/plan/code/config — noted as documented and non-load-bearing).

---

## 11. Bottom line (one paragraph for META)

EraDev v10 Bundles A+B+C carry a real creativity-suppression risk concentrated in book/article modalities via 7 universally-tagged items (Invariant #17, Habit #1, μ-check universal application, F7 universal threshold, doc_alignment as universal verify method, Unified Plan template applied universally, and "short-cycles-over-polished-signals" rhetoric) — the risk is NOT present in 6 universal math items (F3/F4/F6/F10/F11 plus Habits #2/#4) that stay [UNIVERSAL] correctly. **Solution is a Bundle D with an orthogonal RIGOR_LEVEL axis** (strict / structured / exploratory / emergent) declared via `rigor_map` field with domain-derived defaults and per-segment override, plus a new FLUX protocol replacing BIM for exploratory/emergent segments (advisory μ-check, long cycles permitted, voice-coherence prioritized, single-Ô Λ_role=0 permitted, "good-enough-to-iterate" exit criterion). **Ranked proposals: 5 MUST-DO (tag flip on Invariant #17, rigor_map schema, μ-check modality branch, Four Habits qualifier, F7 per-RIGOR_LEVEL calibration) + 5 SHOULD-DO (FLUX protocol spec, voice_guide template, voice_check verify method, FLUX Book Builder protocol, pull OQ-PT-3 forward).** Total: ~150-250 lines across 6 files (with RU mirrors 12 files), single commit Bundle D (creativity-adaptation), BL-19 bilingual parity. Migration is conservative (domain defaults preserve most current behavior). Not to do: creativity_budget slider (over-engineered), new RT-0.5 phase (premature), revert B+C (over-correction), tag only emergent exempt (leaves exploratory trapped). The paper's §VII.4 "ensemble of configurations" is the theoretical anchor for per-segment rigor. FLUX honors EMP7 orientation-loop primacy and paper §X.5 habits #2/#3/#4.

---

*End of research.*
*Source: deep research on conditional BIM preserving creativity, 2026-04-24, [ANALYST] EN stack, B_creative modality, read-only scope.*
*Related: `reports/v10_parallel_trajectories_analysis_2026-04-24.md`, `reports/v10_bim_planning_audit_2026-04-24.md`, `reports/v10_bim_creativity_tension_2026-04-24.md`, Bundle A/B/C Builder reports.*
*Paper: `/Users/antonpankratov/Downloads/odtoe/ODTOE_parallel_trajectories.pdf`, 27 pages.*
*Target commit: Bundle D (v10 creativity-adaptation), 5 files EN + 5 mirror RU + 2 new templates = ~12 files, ~150-250 lines.*
