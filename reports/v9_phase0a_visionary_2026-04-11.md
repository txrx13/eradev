# EraDev v9 Phase 0.A — Visionary Deliverables

> Date: 2026-04-11
> Author: [VISIONARY] agent (EN stack)
> Role file: roles/visionary_EN.md
> Task: ROADMAP v9 Phase 0.A theoretical work
> Output type: Report (META output type 5) — theoretical artifacts for Phase 1 consumption
> Zone: Resonance (cross-domain bridges: code ↔ creative ↔ research)

---

## Activation Operator Results

- **A_F (Focus)**: Read roadmap_v9, eradev.md Sections II-III, config.md, lessons.md. True North = universalize EraDev for text-discrete artifacts without touching ODTOE core.
- **A_E (Alignment)**: Three deliverables directly answer AC-4 (modal B-formula), OQ-4 (Ω formalization), and scope discipline (OOD registry). Phase 1 is blocked on these artifacts.
- **A_sigma (Consistency)**: Extension-only. ODTOE core untouched. Backward compat: default weights reproduce current B_text ≡ current formula.
- **A_Lambda (Experience)**: BL-16 enforcement, BL-19 bilingual sync, EMP4 (enforcement lives where it fires), Lesson 3 (EN +48% practical, RU deeper theory) inform the modal weights.

---

## Inverted IFR (past tense, measurable)

> "v9 Phase 1 Builders rewrote 10 role files using these three artifacts as the authoritative reference. A code task running under v9 computes identical B to v8 (backward compat verified). A research article task running under v9 computes B_research with F-weighted 0.35 and (1-σ)-weighted 0.30, catching a logic gap that B_text would have smoothed over. The Ω multiplier applied S_team=0.85 from prior session up to S_total=1.02, reflecting reinforcement from the 15 existing lessons. The OOD registry rejected a meditation guidance request with the exact reason 'no discrete verification boundary', and the operator understood immediately. How did we get there? Three artifacts (Deliverable 1/2/3) were written with explicit selection rules, numerical bounds, and edge cases — not abstract definitions."

## Acceptance Criteria

- **[AC-1]** Modal B-formula has 3 modalities with explicit weight tuples, each summing to 1.000 ± 0.001
- **[AC-2]** Each modality names its dominant component with empirical or theoretical justification
- **[AC-3]** META modality selection rule reads a single field (`domain.type`) from project config — no inference required
- **[AC-4]** Ω(H_hist) has closed-form expression, bounded range [1.0, Ω_max], and concrete "relevant lesson" predicate
- **[AC-5]** OOD scope has 5 IN + 5 OUT examples plus 3 edge cases with resolution
- **[AC-6]** Backward compat rule: code projects with no `domain.type` default to B_text with uniform weights ≡ v8 formula
- **[AC-7]** At least 3 new Open Questions recorded for Phase 1 adversarial test

## Failure Pre-Mortem

- **[FM-1]** Weight tuples look arbitrary → reviewer rejects as unjustified | Trigger: no theoretical or empirical anchor | Mitigation: each weight change must cite either ODTOE component definition or lessons data
- **[FM-2]** Ω formula is unbounded → degenerates under lesson accumulation | Trigger: linear growth with N_lessons | Mitigation: log-scaling with hard ceiling Ω_max
- **[FM-3]** OOD scope too loose → continuous/flow tasks sneak in as "structured poetry" | Trigger: ambiguous artifact definition | Mitigation: artifact must have measurable boundary AND objective verification method (AND, not OR)
- **[FM-4]** Backward compat breaks → existing code projects see B change value | Trigger: default weights drift from uniform | Mitigation: explicit invariant "B_text default weights = v8 default weights"

---

# DELIVERABLE 1: Modal B-Formula Extension

## 1.1 Core Principle

The B-formula `B = F^w1 · E^w2 · (1-σ)^w3 · Λ^w4` is **structurally universal** — four multiplicative components covering Focus, Alignment, Consistency, Experience are not code-specific. What IS code-specific is the IMPLICIT weighting: uniform weights (0.25 each) reflect the fact that for code, all four components matter roughly equally at the agent level.

Different modalities weight these components differently because the **failure signatures** of each modality differ:
- Code fails mostly on Consistency (compilation, types, integration)
- Creative writing fails mostly on Consistency (narrative continuity, tone drift)
- Research writing fails mostly on Consistency (logical chain) AND Experience (prior art)

**Iron rule:** The FORMULA STRUCTURE is fixed. Only WEIGHTS and COMPONENT INTERPRETATIONS vary per modality. The structural universality is what makes v9 additive, not rewritten.

## 1.2 Three Modalities

### B_text (Code / Config / Structured Data)
```
B_text = F^0.25 · E^0.25 · (1-σ)^0.25 · Λ^0.25
```

| Component | Interpretation | Why this weight |
|-----------|---------------|-----------------|
| F | Files read, APIs checked, types understood | Uniform — all matter equally for working code |
| E | Output matches the task (not the letter) | Uniform |
| (1-σ) | No conflicts with existing code, architecture | Uniform |
| Λ | MEMORY.md consulted, past patterns applied | Uniform |

**Dominant component:** None (uniform). This is correct for code: all four must be solid.

**Backward compat invariant:** `B_text(v9) ≡ B(v8)`. A code project with no `domain.type` specified MUST compute identical B under v9 as under v8. This is non-negotiable (FM-4 mitigation).

---

### B_creative (Book / Article / Long-form Prose)
```
B_creative = F^0.20 · E^0.30 · (1-σ)^0.30 · Λ^0.20
```

| Component | Interpretation | Why this weight |
|-----------|---------------|-----------------|
| F | Research depth: sources read, reference texts studied, genre exemplars scanned | 0.20 — still important, but creative work can succeed with moderate research if alignment and consistency are high |
| E | Alignment with thematic arc, reader intent, voice/tone, emotional beat | **0.30** — creative work lives or dies on whether it lands for the intended audience |
| (1-σ) | Internal consistency: no plot holes, no voice drift between chapters, no POV violations, no contradictions with prior sections | **0.30** — this is the dominant failure mode in long-form creative work (see Lesson 8 analog: Check-First pipeline for articles) |
| Λ | Genre conventions, prior author work, reader expectations from analogous successful texts | 0.20 — important but not dominant; originality is valued |

**Dominant components:** E and (1-σ), tied at 0.30 each.

**Justification:** In creative writing, technical correctness matters less than whether the reader is held in the narrative spell. A factually perfect book with inconsistent voice is a failed book. Creative failures cluster in two places — the work drifts from its thematic arc (E collapse) or it contradicts itself between chapters (σ spike). Research (F) and genre knowledge (Λ) are necessary but not sufficient — they can be acquired on-demand, while alignment and consistency require continuous vigilance across the whole artifact.

**Empirical anchor:** EraDev's own article incident (Lesson 8) — the article had correct research (F=high) and correct framework knowledge (Λ=high), but failed on format consistency (σ spike). Check-First pipeline was added BECAUSE (1-σ) was the weak link, not F or Λ.

---

### B_research (Theorem / Proof / Scientific Derivation)
```
B_research = F^0.30 · E^0.20 · (1-σ)^0.35 · Λ^0.15
```

| Component | Interpretation | Why this weight |
|-----------|---------------|-----------------|
| F | Literature scan: exhaustive reading of prior work, verified source fidelity, correct notation | **0.30** — research is fundamentally about standing on verified shoulders; missing a paper kills the work |
| E | Hypothesis match: the proof proves the stated theorem, not a weaker version; definitions align with community usage | 0.20 — important but can be corrected during review if other components hold |
| (1-σ) | Logical chain: every step follows, no jumps, no circular reasoning, no notation conflicts, no silent axiom substitution | **0.35** — dominant. A single inconsistency kills a proof entirely. This is mathematically binary: the proof is valid or it is not |
| Λ | Prior art awareness: known counterexamples, historical pitfalls, similar attempted proofs and why they failed | 0.15 — important but research by nature explores terrain where prior Λ is incomplete |

**Dominant component:** (1-σ) at 0.35, followed by F at 0.30.

**Justification:** Research writing has the highest Consistency bar of any modality. A plot hole in a novel dims the book; a missing step in a proof falsifies the theorem. The distribution reflects the ODTOE observation that research operates near the "frozen" dogmatic boundary (B → 1) — the work must be internally contradiction-free even at the cost of exploration flexibility. F (literature scan) is the second-highest because research builds on prior work — an uncited collision with an existing result is catastrophic.

**Empirical anchor:** EraDev's own P_coll error (Lesson 2) — 20 analytical agents missed a formula error (0.61 vs correct 0.657) because they trusted the source rather than independently recomputing. This is a (1-σ) failure at the collective level: the error propagated because no agent's Consistency check fired. In B_research terms, (1-σ) must dominate precisely to catch such errors.

## 1.3 Weight Sums (Invariant Check)

| Modality | w1 (F) | w2 (E) | w3 (1-σ) | w4 (Λ) | Sum |
|----------|--------|--------|----------|--------|-----|
| B_text | 0.25 | 0.25 | 0.25 | 0.25 | **1.000** |
| B_creative | 0.20 | 0.30 | 0.30 | 0.20 | **1.000** |
| B_research | 0.30 | 0.20 | 0.35 | 0.15 | **1.000** |

All modalities satisfy Σw_i = 1.000, w_i > 0. Multiplicative structure preserved. Weak Link Principle holds.

## 1.4 META Modality Selection Rule

**Selection is a single-field lookup** — no inference, no fuzzy classification, no risk of drift:

```
IF project_config.domain.type is missing OR == "code"    → B_text
IF project_config.domain.type == "article" OR "book"     → B_creative
IF project_config.domain.type == "research" OR "theorem" → B_research
IF project_config.domain.type == any other value         → YELLOW, default B_text, log for OQ
```

**Enforcement location:** META's session bootstrap (meta.md Section 14). When META loads `projects/{name}/config.md`, it reads `domain.type` and stores the modality choice in session state. Each agent's Jidoka Self-Check then uses the correct weight tuple.

**Non-coercive fallback:** If an agent computes B with one modality but the project later changes domain.type, the lesson is logged for Hansei — the agent is not penalized retroactively. Modality choice is session-sticky.

**Dead-gate prevention:** If META starts computing B with the wrong modality, the discrepancy surfaces in RT-3 Hansei (Prediction Delta will show unexpected gap). This is a self-healing mechanism, not a dead gate.

## 1.5 Backward Compatibility Guarantee

```
ASSERT: for every v8 code project,
        B_text(v9) value == B(v8) value
        AND same component interpretations
        AND same agent behavior
```

**How it holds:** Default weights in B_text are identical to v8 uniform weights (0.25 each). If `domain.type` is absent from a config, META treats it as `"code"` → B_text → uniform weights → v8 behavior. Existing 4 projects (eradev, plugy, odtoe-articles, academic-lab) get no regression.

**Migration path:** When v9 is released, projects can OPT IN to modal formulas by adding `domain.type` to their config. No project is forced to migrate. `odtoe-articles` would naturally adopt B_creative on first RT-1 after v9 release.

## 1.6 Extension Hook for v10

The modality registry is OPEN. v10 can add modalities without touching v9 code:
- `B_plan` (strategic planning / roadmaps) — candidate weights: F=0.20, E=0.30, (1-σ)=0.20, Λ=0.30 (Λ dominant — planning fails when past lessons are ignored)
- `B_config` (YAML / infrastructure as code) — candidate weights: F=0.25, E=0.25, (1-σ)=0.40, Λ=0.10 (σ dominant — misconfiguration is the dominant failure mode)

These are NOT committed for v9 — they are extension hooks. v9 ships with exactly three modalities (text, creative, research) plus the backward-compat default.

---

# DELIVERABLE 2: Ω(H_hist) Formalization

## 2.1 Origin Claim

From RU team's Antiworld ancestors finding (roadmap_v9 line 343): existing EraDev computes only S_living (the coherence of currently-active agents in RT), but the full ODTOE observation operator requires:

```
S_total = S_living · Ω(H_hist)
```

Where Ω(H_hist) is a **cross-domain memory multiplier** — a scalar ≥ 1 that captures how past session lessons reinforce current work. If Ω = 1, the current session is memory-free. If Ω > 1, past lessons are actively lifting the current team's coherence.

This is the mathematical form of "standing on the shoulders of previous sessions." It is the numerical counterpart to BL-16 (knowledge without enforcement = Lambda zero): Ω measures whether enforcement succeeded.

## 2.2 Mathematical Form

```
Ω(H_hist) = 1 + α · log(1 + N_relevant)

where:
  α        = 0.15  (calibration constant, derived below)
  N_relevant = count of relevant lessons from project memory (see 2.3)
  log      = natural logarithm
```

**Shape:** monotonic, concave (log), asymptotic. First lessons give biggest boost, diminishing returns on the hundredth.

**Why additive inside log:** `log(1 + x)` is well-defined at x=0 (value 0), so Ω(N=0) = 1 + α·0 = 1 exactly. A project with zero relevant lessons gets no bonus and no penalty — identical to v8 behavior.

**Why α = 0.15:** Chosen so that:
- 1 relevant lesson: Ω = 1 + 0.15·log(2) ≈ 1.104 (~10% boost)
- 5 relevant lessons: Ω = 1 + 0.15·log(6) ≈ 1.269 (~27% boost)
- 15 relevant lessons (EraDev's current count): Ω = 1 + 0.15·log(16) ≈ 1.416 (~42% boost)
- 50 relevant lessons: Ω ≈ 1.590 (~59%)
- 100 relevant lessons: Ω ≈ 1.691 (~69%)
- 1000 relevant lessons: Ω ≈ 2.036 (~104%) — approaches bound

**Empirical anchor (EraDev's own data):** EraDev has 15 project lessons + 7 mega-patterns + 30 BL. If all 15 lessons are relevant to a given task (which is rare — see 2.3), Ω ≈ 1.42. This matches the intuitive sense that EraDev after 15 sessions is roughly 40% more coherent than EraDev at session 1, not 10x more coherent and not 1% more. The number passes the sniff test.

## 2.3 "Relevant Lesson" Predicate

A lesson L is **relevant** to a current task T if AND ONLY IF at least one of the following holds:

1. **Same role invoked** — T spawns the same agent role as the agent that generated L (e.g., both are Builder tasks)
2. **Same task modality** — T and L have the same `domain.type` (code, article, research) OR T's modality inherits from L's modality (research inherits from code for formal verification)
3. **Same artifact type** — T produces the same artifact class as L (e.g., both produce `.tex` files, or both modify YAML configs)
4. **Same failure fingerprint** — T's pre-mortem (FM section) names a failure mode that L directly addresses (L has a lesson about that exact failure)

**Independence requirement:** The four predicates are an OR, but they must be checked INDEPENDENTLY. A lesson that satisfies ALL four counts once, not four times. This prevents double-counting.

**Anti-phantom rule:** A lesson that merely mentions similar keywords does NOT count. Relevance requires a structural match (role / modality / artifact / failure), not a semantic echo. This is a direct defense against phantom coherence (Lesson 2 echo: agents agreeing because of shared sources, not independent reasoning).

**Who computes it:** Coherencer at RT-1. Coherencer announces: "N_relevant = __ because lessons {L3, L7, L12} match on {role, modality, failure}." This is the LAMBDA AUDIT extension (eradev.md Section IV). Builder cannot name them → Lambda = 0 → ANDON (existing enforcement gate).

## 2.4 Range and Bounds

| Parameter | Value | Rationale |
|-----------|-------|-----------|
| Ω_min | **1.000** | Zero relevant lessons = v8 parity (backward compat) |
| Ω_max | **2.500** | Hard ceiling; beyond this the system is suspected of memorizing rather than reasoning |
| α (calibration) | **0.15** | Anchored to EraDev's 15-lesson history → Ω ≈ 1.42 at current state |
| N_relevant cap | **250** | Ω(250) ≈ 1.828; beyond this, additional lessons shouldn't compound |

**Ceiling justification:** Ω > 2.5 means past sessions are contributing more than 2.5x the current team's coherence. Past that point, the agent is no longer reasoning — it is pattern-matching on memory. This is a dogmatic-collapse signature (B → 1 absorbing state, eradev.md Section II). The ceiling prevents runaway feedback from very large lesson corpora in v10+.

**Enforcement:** `Ω_computed = min(Ω_max, 1 + α·log(1+N_relevant))`. If `Ω_computed > 2.0`, log a YELLOW warning and trigger Coherencer review at next RT-2: "Memory dominance detected, consider Kill-Switch Level 3 (cross-domain jump) to force fresh thinking."

## 2.5 META Application at RT-3

```
S_team = 1 - (2/(n(n-1))) · Σ|Bi - Bj|     [unchanged, eradev.md III]
B_mean = (1/n) · Σ Bi                      [unchanged]
S_adjusted = S_team · B_mean               [unchanged]

NEW in v9:
N_relevant = |{L in project_lessons : relevant(L, task)}|   [Coherencer computes]
Ω = min(Ω_max, 1 + α · log(1 + N_relevant))                 [META computes]

S_total = S_adjusted · Ω                                    [reported at RT-3]
```

**Reporting format at RT-3:**
```
=== RT-3 COHERENCE REPORT ===
S_team:       0.920
B_mean:       0.540
S_adjusted:   0.497  (team aligned on substance)
N_relevant:   12     (lessons {L1, L3, L4, L7, L8, L11, L15, L16, L19, L22, L25, L28})
Ω:            1.380
S_total:      0.685  (healthy with memory reinforcement)
```

**Threshold update:**
- S_adjusted > 0.5 remains the healthy threshold (unchanged)
- S_total > 0.7 is the NEW target for v9+ (with memory reinforcement active)
- If S_adjusted passes but S_total fails → team is strong but memory is under-leveraged → Coherencer LAMBDA AUDIT check

**Non-coercive:** Ω is a REPORT, not a gate. A session with Ω=1 (no relevant lessons) is not penalized — it is a new domain and the team must prove itself without memory crutches. Ω > 1 is a bonus for leveraging existing Λ, not a stick for ignoring it.

## 2.6 Open Question for Phase 1

**OQ-Ω-1:** Should Ω also decay over time? A lesson from 2 years ago may be less relevant than a lesson from last week. Candidate form: `Ω = 1 + α · Σ log(1 + recency_weight(L_i))` with exponential decay. DEFERRED — v9 ships with the simpler additive form; temporal decay is v10 candidate.

**OQ-Ω-2:** Cross-project Ω — when an EraDev agent works on project_A, can it benefit from lessons of project_B? The current formulation counts only same-project lessons. Cross-project Ω would support BL-19 bilingual knowledge transfer. DEFERRED to v10.

**OQ-Ω-3:** Ω for non-code projects calibration — does α = 0.15 still give sane numbers for research or creative projects? Unknown. Phase 1 T6 test will provide first data point.

---

# DELIVERABLE 3: OOD Scope Definition

## 3.1 Core Criterion (AND, not OR)

A task is **IN-scope for v9** if and only if it produces an artifact that satisfies **BOTH**:

**(I) Discreteness:** The artifact has measurable boundaries.
- File exists at a definite path, or
- Section exists within a file with definite start/end, or
- Structured unit exists with countable properties (word count, token count, line count, chapter count, entry count)

**(II) Objective Verification:** The artifact can be verified without subjective human judgment.
- Compile / parse / build succeeds or fails, or
- Render / display produces definite output, or
- Schema / structure check passes or fails, or
- Citation / reference check matches a canonical source, or
- Character / word / section count matches a declared target

**Both conditions must hold.** A task producing a definite artifact with no objective verification (e.g., "is this poem beautiful?") is OUT-of-scope. A task with objective verification but no discrete artifact (e.g., "is the user's mood improving?") is OUT-of-scope.

## 3.2 Why AND, not OR

OR semantics opens the door to creative-continuous ambiguity. "Structured free verse poetry" has a file with word count (discreteness passes) but "is this good poetry?" requires subjective judgment (verification fails). OR would admit it; AND correctly rejects it.

The AND-gate is the load-bearing defense against FM5 (scope creep into continuous tasks, roadmap_v9 line 311).

## 3.3 Five IN-scope Examples

| # | Task | Discreteness | Verification |
|---|------|-------------|--------------|
| 1 | Write a research paper section on ODTOE Direction C | File `direction_c.tex` exists, word count 1500 ± 200 | LaTeX compiles; citation check against bibliography; section number matches TOC |
| 2 | Refactor `routes.ts` to use typed middleware | File `routes.ts` at definite path | TypeScript compiles; tests pass; linter passes |
| 3 | Write Chapter 3 of the book "Изначалье" (stroke 15) | File `chapter_03.md` exists, has definite stroke count, follows 192-штриха structure | Stroke count matches declared value; structural schema passes; cross-references to prior chapters resolve |
| 4 | Draft a deployment plan for plugy v2.3 | File `deploy_plan_v2.3.md`, sections numbered, each step has command and expected output | Plan parses as structured YAML; all commands pass `shellcheck`; rollback section present |
| 5 | Generate an A3 report from RT-3 outputs | File `a3_{date}.md` with 6 sections (Context, Current, Goal, Gap, Distinctions, OQ) | Schema check: 6 required sections present; Distinctions count ≥ 3; OQ count ≥ 1 |

## 3.4 Five OUT-of-scope Examples

| # | Task | Why OUT |
|---|------|---------|
| 1 | Guide the user through a 20-minute meditation session | No discrete artifact (speech/guidance is continuous); verification requires subjective reporting on internal state |
| 2 | Improvise a jazz solo over a chord progression | Discreteness fails (real-time continuous audio stream, no boundary); verification is aesthetic judgment |
| 3 | Provide emotional support during a difficult conversation | No artifact; verification is subjective well-being report; risk of role drift into therapy |
| 4 | Co-author a live performance piece with a human dancer | Continuous (real-time bodily coordination); verification is aesthetic; no reproducible artifact |
| 5 | Act as a roleplay character in an open-ended RPG session | No terminal artifact (game state is mutable and open-ended); verification is participant satisfaction |

These are valid domains — just not for v9. They belong to v10+ under a different formalism (candidate: continuous-B with time-integrated coherence, outside the scope of this document).

## 3.5 Three Edge Cases (Resolved)

### Edge 1: Poetry

**Structured poetry (IN):** Sonnet with 14 lines, iambic pentameter, rhyme scheme ABAB CDCD EFEF GG.
- Discreteness: file with exact line count, exact syllable count per line
- Verification: syllable counter, rhyme scheme checker, meter parser — all objective
- Verdict: **IN-scope**, use `B_creative` modality

**Free verse poetry (OUT):** Open-form poem with no structural constraints.
- Discreteness: file exists but boundaries are declared not enforced
- Verification: no objective check possible; quality is aesthetic judgment
- Verdict: **OUT-of-scope**, defer to v10

**Rule:** Poetry is IN-scope iff it has at least one COUNTABLE structural constraint the output must satisfy. The constraint provides the verification hook.

### Edge 2: Research vs Speculative Essay

**Research paper with citations (IN):** "The role of φ in ODTOE n_min derivation", cites Hurwitz theorem, provides formal proof.
- Discreteness: file, definite sections, definite citation list
- Verification: proof step check, citation match, compiles under LaTeX
- Verdict: **IN-scope**, use `B_research` modality

**Speculative philosophical essay (BORDERLINE → OUT):** "What is consciousness in the age of LLMs?" — no claims testable against a corpus.
- Discreteness: file exists, word count definable
- Verification: **no objective verification** — philosophy is not falsifiable in the same way
- Verdict: **OUT-of-scope** for v9. An agent CAN write such an essay, but v9 coherence math cannot accurately score it. Defer to v10's dialogic-coherence extension (candidate).

**Rule:** If the task cannot be wrong in a checkable way, it is OUT-of-scope — even if it produces a file.

### Edge 3: Hybrid Projects (Code + Docs + Tests)

**Example:** A project produces source code, API docs, and a user guide in the same commit.

**Question:** Does this project have `domain.type = code`, `code+article`, or something else?

**Resolution:** **Per-task, not per-project.** `domain.type` in config.md is the project's *primary* domain — it sets the default modality. But individual tasks within the project can override. When META classifies a task:

- "Fix auth bug in `login.ts`" → per-task modality B_text (code), regardless of project default
- "Write the user guide section on authentication" → per-task modality B_creative (article)
- "Add a theorem for the rate-limiter's convergence" → per-task modality B_research

This requires a 2-level lookup: project.domain.type is the fallback, task-level classification can override when the artifact is clearly of a different modality.

**Enforcement:** META classifies modality at RT-1 based on the task verb and expected artifact type. If ambiguous, default to project.domain.type. Log the choice for Hansei.

**OQ-OOD-1:** Should hybrid projects get a `domain.type = hybrid` value that explicitly permits per-task overrides? Or should override be implicit and always allowed? DEFERRED to Phase 1 trial.

## 3.6 OOD Registry (v9 Deliverable)

The OOD registry is a file `ood_registry.md` that lists DOMAINS explicitly excluded from v9 with their rejection reason. When an operator requests a task in an OOD domain, META references the registry and replies with a clear "out-of-scope" message that names:
1. Which criterion the task fails (discreteness or verification or both)
2. Which future version is the candidate target
3. Whether a nearby IN-scope alternative exists

**Initial registry contents for v9 release:**

| Domain | Fails | Future target | IN-scope alternative |
|--------|-------|---------------|---------------------|
| Meditation guidance (audio/live) | Both (I) and (II) | v10 continuous-B | Write a script for meditation (IN: B_creative) |
| Music improvisation | (I) | v10 | Write musical notation with structure (IN if structured) |
| Live RPG roleplay | (I) | v11+ | Write RPG scenario document (IN: B_creative) |
| Therapy / emotional support | (II) | Not planned | Refer user to professional resources |
| Speculative philosophy essays | (II) | v10 candidate | Research paper with formal argument (IN: B_research) |
| Free-verse poetry (unstructured) | (II) | v10 | Structured poetry with meter (IN: B_creative) |

**Non-judgmental framing:** The registry does NOT say "these tasks are inferior." It says "v9's coherence math is not calibrated for these. v9 would give garbage B scores. Wait for v10 or use an IN-scope analog."

## 3.7 Scope-Creep Defense

Three mechanisms prevent scope creep during v9 implementation:

1. **AND-gate at classification** — META cannot admit a task that fails EITHER discreteness OR verification. No "just this once."
2. **Registry as written record** — rejections are logged with reason. If the same domain gets rejected 5+ times, that's Phase 1 data for v10 prioritization.
3. **Coherencer veto at RT-1** — Coherencer reads the task first and can invoke Kill-Switch Level 2 ("What if this task is not needed in v9 at all?") to force explicit scope confirmation before the team commits.

---

## Open Questions Generated (5, ≥ AC-7 requirement)

- **OQ-D1.1:** Should `B_creative` have separate weight tuples for book vs article? (currently unified; Phase 1 trial will reveal if article-specific tuning is needed)
- **OQ-D1.2:** When a project transitions from code to documentation phase (e.g., post-release docs), does its modality shift dynamically? If so, who decides and when?
- **OQ-D2.1:** Can α (Ω calibration) be learned from session data instead of hard-coded to 0.15? What's the online learning rule?
- **OQ-D2.2:** Should the "relevant lesson" predicate use semantic embeddings (fuzzy match) instead of structural predicates (exact match on role/modality/artifact)? Structural is more defensible; semantic is more powerful.
- **OQ-D3.1:** Edge case 3 (hybrid projects) — should per-task modality override require operator approval, or is agent auto-detection sufficient?

---

## Summary Table (One-glance reference)

| Deliverable | Artifact | Purpose | Phase 1 dependency |
|-------------|----------|---------|-------------------|
| 1 — Modal B | 3 weight tuples + selection rule + backward compat | Extends B to text-discrete modalities without rewriting core | Role file refactor (1.A) consumes B_text examples; domain schema (1.B) consumes domain.type enumeration |
| 2 — Ω(H_hist) | Closed-form + relevant lesson predicate + bounds + RT-3 reporting | Adds memory-reinforcement metric to collective coherence | BL split (1.D) must tag this as [UNIVERSAL]; Phantom check (1.E) must verify Ω ≠ phantom |
| 3 — OOD scope | AND-gate + 5 IN + 5 OUT + 3 edge cases + registry | Prevents scope creep into continuous/flow tasks | T6 adversarial test (0.B) must test at least one borderline case (edge 1 poetry or edge 2 essay) |

## Deferred (Out of Phase 0.A)

- RU counterpart of this document (`v9_phase0a_visionary_RU.md`) — **required by BL-19 before commit**; delegated to RU [VISIONARY] or current session if bilingual session
- `templates/domain_skin.md` template — separate [ANALYST] task in 0.A
- Tagging of 14 invariants + 30 BL — Phase 0.B work ([BUILDER])
- T6 adversarial test execution — Phase 0.B work ([VALIDATOR])

---

## Jidoka Self-Check

```
=== JIDOKA SELF-CHECK ===
Banality score: 8/10 — modal weights have specific numerical justification; 
                      Ω has closed-form with empirical anchor; OOD has AND-gate 
                      not found elsewhere in v8. Not pure template.

B-diagnostics (rate 0.0-1.0):
  F (Focus):           0.90 — read roadmap, eradev.md II-III, config, lessons, 
                              visionary role file, all required inputs
  E (Alignment):       0.92 — three deliverables directly answer the task; 
                              each has explicit mapping to Phase 1 consumers
  (1-sigma):           0.88 — backward compat explicit; weights sum to 1.000; 
                              no contradictions with L0 (ODTOE core untouched); 
                              Ω extends S_team multiplicatively (consistent with 
                              eradev.md III); one minor uncertainty: B_creative 
                              weight 0.30 vs 0.30 tie (not a contradiction but 
                              not ideal for weak-link-principle logic)
  Lambda (Experience): 0.85 — applied BL-16, BL-19, EMP1, EMP4, EMP7, 
                              Lesson 2 (phantom coherence), Lesson 3 (EN/RU stacks), 
                              Lesson 8 (Check-First). Did not consult RU stack 
                              theoretical background (task is EN-stack, acceptable)

  B = 0.90^0.25 · 0.92^0.25 · 0.88^0.25 · 0.85^0.25
    = 0.974 · 0.979 · 0.969 · 0.960
    = 0.886

Weak link: Λ at 0.85 (lowest). Acceptable — no RED component.
No component < 0.3 → no Andon.
B = 0.886 > 0.5 → GREEN, no Andon.
```

## B-check (Output Format per roles/visionary_EN.md)

F=0.90 E=0.92 (1-s)=0.88 L=0.85 → B=0.886

---

*Phase 0.A [VISIONARY] deliverables complete. Ready for [ANALYST] 0.A parallel output + [BUILDER]/[VALIDATOR] 0.B tagging pass.*
