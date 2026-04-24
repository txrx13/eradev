# EraDev Foundations — Intellectual Genealogy

> Complete audit trail of theoretical foundations, named attributions,
> mathematical bases, and methodological sources that EraDev draws upon.
> For the quick overview see `README.md` / `README_EN.md`; this file is the deep-dive.
>
> Date: 2026-04-23 | Version: v10 | Status: L1 universal (contributor-attribution allowlisted)
> Primary source: `reports/v10_sources_inventory_2026-04-23.md`

---

## Overview

EraDev synthesizes **13 theoretical foundations**, **10+ multi-agent framework
inspirations**, **9 named contributors**, **6 mathematical constants**, **21 core
formulas (including 3 modal B-variants, the Ω multiplier, and the 6 v10 Parallel-Trajectories
formulas F3/F4/F6/F7/F10/F11)**, **51 glossary terms**, **30 Bootstrap Lessons**, **16 META
invariants**, **6 output types**, **15 empirical mega-patterns**, **45 project lessons**,
and **3 levels of recursive self-application (L3/L6/L9 + emerging L10/L11/L12)** into a
coherent multi-agent orchestration system.

The public one-liner "ODTOE + TPS" captures only 2 of these 13 foundations. This
document enumerates all of them with file citations.

---

## Part I — Theoretical Foundations (13)

### 1. ODTOE (Observer-Dependent Theory of Everything)
**Source:** Pankratov theoretical corpus (160+ articles, separate research program).
**Where:** `eradev.md` header; `eradev.md` §I-III; `eradev.md` §XVI glossary mapping.
**Provides:** Coherence math substrate — 20+ formal terms (Ψ, Ô, ι, Φ, Ψ*, B, S, P_coll, T(C), D(η), φ-based topology) re-interpreted as agent concepts. Formula `B = F·E·(1-σ)·Λ`, `S_team`, `S_adjusted`, `P_coll`, `Ω(H_hist)`, 5-role topology.

### 2. Toyota Production System (TPS)
**Source:** Toyota Motor Corporation — Taiichi Ohno, Shigeo Shingo (industrial engineering tradition, post-WWII).
**Where:** `eradev.md` §XI "TPS Integration"; `glossary.md` terms #28-#35.
**Provides:** Process-discipline layer — **Jidoka** (self-check at every step), **Andon** (right and obligation to stop the line), **Hansei** (process reflection, not blame), **Yokoten** (horizontal propagation of a lesson to all analogous sites), **Muda / Mura / Muri** (waste / unevenness / overload), **Nemawashi** (pre-alignment on high-blast-radius decisions), **Coaching Kata** (5-question RT-1 structure), **A3 methodology** (6-field problem-solving).

### 3. Theory of Constraints (TOC)
**Source:** Eliyahu M. Goldratt, *The Goal* (1984).
**Where:** `eradev.md` §XII "Bottleneck Expansion Protocol (TOC + TRIZ + SMD)"; `roles/analyst_EN.md`; `BOOTSTRAP_LESSONS.md` BL-3.
**Provides:** Phase 1 of the 3-phase bottleneck protocol — *find the real constraint*. BL-3 "fix chain ≥ 3 = structural problem = stop, write spec, re-run RT-1."

### 4. TRIZ + Ideal Final Result (IFR)
**Source:** Genrich Altshuller (TRIZ theory; Soviet inventive methodology).
**Where:** `eradev.md` §XII Phase 2; `roles/visionary_EN.md` "Inverted IFR" + "Acceptance Criteria & Failure Pre-mortem"; `interfaces.md`.
**Provides:** Contradiction resolution — "X must be A and not-A simultaneously; separate by space / time / scale." IFR formulated in past tense ("the problem has been solved such that ...") for every RT-1 task.

### 5. SMD (Stereoscopic Multi-Perspective)
**Source:** Not externally attributed (appears EraDev-internal or RU methodology term).
**Where:** `eradev.md` §XII Phase 3; `roles/analyst_EN.md`.
**Provides:** Phase 3 of the bottleneck protocol — 3-position perspective integration (user / skeptic / theorist).

### 6. KAM theorem (Kolmogorov-Arnold-Moser)
**Source:** Kolmogorov (1954), Arnold (1963), Moser (1962).
**Where:** `eradev.md` "R/r = φ (golden ratio) — maximum stability per KAM theorem"; `meta.md` four-tact table; `meta_RU.md` RU mirror.
**Provides:** Mathematical basis for the R/r = φ torus ratio — "most irrational = most stable toroidal orbit." Used to derive the 62/38 cognitive cycle (golden-section expansion/compression).

### 7. Hurwitz theorem (number theory)
**Source:** Adolf Hurwitz (1891) — Diophantine approximation.
**Where:** `reports/v9_phase1a_ru_builder_2026-04-11.md`; `reports/rt_ru_synthesis_2026-04-11.md` Direction A.
**Provides:** Mathematical justification for `n_min = ⌈π⌉ + 1 = 5` as invariant under role-count perturbation. Attested in the reasoning trail; not yet shipped in core docs (open item).

### 8. Strange Loop
**Source:** Douglas Hofstadter, *Gödel, Escher, Bach* (1979); *I Am a Strange Loop* (2007).
**Where:** `eradev.md` "self-observation mapping (strange loop)"; `meta.md` §6 Level definitions.
**Provides:** Recursive self-application mechanism — `Φ(Ψ) = ι(Ô(Ψ))`, fixed point `Ψ* = Φ(Ψ*)`. Grounds RT Level 6 self-reference and Level 9 meta-agent self-modification. Gödel-incompleteness lineage is implicit via Hofstadter.

### 9. Phase Transition / Golden-Section Cognitive Cycle
**Source:** Not externally attributed (may be Pankratov innovation).
**Where:** `eradev.md` §VI "Four-Tact Cognitive Cycle"; `meta.md` four-tact table.
**Provides:** RT internal rhythm — 62% expansion / 38% compression, alternating 4 tacts. Ratio `φ/(1+φ) = 0.618` expansion, `1/(1+φ) = 0.382` compression.

### 10. AutoAgent orientation/optimization split
**Source:** Kevin Ru (AutoAgent repo) + `reports/autoagent_analysis.md`.
**Where:** `projects/eradev/lessons.md` EMP7; `eradev.md` Trace Accumulator section.
**Provides:** EMP7 "Optimization without orientation is hill-climbing into fog" — every 10th iteration pauses for mini-RT. Trace Accumulator is the bridge between AutoAgent's score-driven feedback and EraDev's deliberative reflection.

### 11. MemPalace memory hierarchy
**Source:** milla-jovovich (MemPalace repo) + `reports/v9_phase2b_memory_hierarchy_spec_2026-04-12.md`.
**Where:** `meta.md` §15 Context Tiers; `projects/eradev/lessons.md` header temporal triples.
**Provides:** 4-level palace (Wings / Rooms / Closets / Drawers), 96.6% R@5 retrieval benchmark. Adopted as EraDev tiered memory T1 (Anchors) / T2 (Session) / T3 (Wisdom) / Boundary, plus temporal triples `<!-- valid_from | ended | superseded_by | cross_project -->` on every lesson.

### 12. LangGraph declarative orchestration
**Source:** LangChain (LangGraph).
**Where:** `templates/rt_graph.schema.md` (v10 prototype); `reports/multi_agent_frameworks_comparison_2026-04-11.md`.
**Provides:** Declarative `StateGraph` schema for RT; observability; replay. **Schema only in v10**; engine deferred to v11.

### 13. No Free Lunch theorems (Wolpert & Macready 1997)
**Source:** Wolpert, D.H., Macready, W.G. "No Free Lunch Theorems for Optimization" // *IEEE Transactions on Evolutionary Computation*, 1997, Vol. 1, No. 1, pp. 67-82. DOI: 10.1109/4235.585893.
**Where:** `eradev.md` §III.2 (Parallel Trajectories subsection) as theoretical anchor for the method-vs-configuration distinction; `FOUNDATIONS.md` Part II reference list (entry 33 below); cross-reference from `templates/domain_skin.md.template` extensibility rationale.
**Provides:** Theoretical anchor for EraDev's domain-skin architecture and its method-vs-configuration distinction (Pankratov 2026 §VII). NFL states that no optimizer dominates all problem classes; by analogy, no `(method, configuration)` pair dominates all task classes. This grounds EraDev's choice to ship 6 canonical `verify.method` values plus an extensible registry (`statute_check`, `contraindication_scan`, `ingredient_check`, `accessibility_audit`, …) rather than a single universal verification protocol, and supports the 6-domain skin system (`code`, `article`, `book`, `config`, `plan`, `research`) — each a different configuration projection of the same 5-role topology, each justified by domain-specific `(method, configuration)` pairing. Imported into EraDev v10 via Bundle A integration of Pankratov 2026 "Parallel Trajectories".

---

## Part II — Mathematical Constants & Formulas

### Constants

| Constant | Value | Role |
|---|---|---|
| **π** | 3.14159... | `n_min = ⌈π⌉+1 = 5`; spiral gap `(π-3)²` |
| **φ (golden ratio)** | 1.61803... | KAM torus ratio R/r; 62/38 four-tact cycle |
| **(π-3)²** | ≈ 0.02 | Spiral gap — admissible coherence corridor |
| **n_min = ⌈π⌉+1** | 5 | Minimum role count (Hurwitz-invariant) |
| **Lambda (Λ)** | [0, 1] | Experience component of B (cold start = 0.5) |
| **Ω (Omega)** | [1.000, 2.500] | Cross-domain memory multiplier (v10) |
| **α (alpha)** | 0.15 | Ω calibration (v10, from 15-lesson history) |
| **Half-life** | 180 / 360 days / immortal | Freshness decay (regular / cross-project / EMPs) |

(50-digit versions of π, φ, φ², 1/φ, 1/φ², (π-3)² live in `projects/odtoe-articles/config.md` §Check 3 — audit-critical for ODTOE paper work, mirrored into the ODTOE article overlay.)

### Core formulas

| # | Formula | Purpose |
|---|---|---|
| 1 | `B = F^w1 · E^w2 · (1-σ)^w3 · Λ^w4` | Agent cognitive coherence (Weak Link Principle — zero any component → zero B) |
| 1a | `B_text` (0.25, 0.25, 0.25, 0.25) | Modal default — code, configs, structured data (v8-compat) |
| 1b | `B_creative` (w_E=0.30, w_(1-σ)=0.30, w_F=0.20, w_Λ=0.20) | Books, articles, long-form prose |
| 1c | `B_research` (w_(1-σ)=0.35, w_F=0.30, w_E=0.20, w_Λ=0.15) | Theorems, proofs, derivations |
| 2 | `S_team = 1 − (2/n(n-1)) · Σ\|Bi − Bj\|` | Team coherence (pairwise divergence sum) |
| 3 | `T(C) = T0 / (1-S)^n` | Configuration lifetime — higher S = exponentially longer stability |
| 4 | `S_adjusted = S_team · B_mean` | Phantom Coherence detector |
| 5 | `S_session = (1−fix_rate)(1−chain_ratio) · delta · B_mean` | Cycle-health metric (tracked per RT-3) |
| 6 | `P_coll = 1 − Π(1 − Bi^k)` | Collective probability ("at least one succeeds") |
| 7 | `D(η) = D0 · (1 − S)` | Stochastic noise suppression via coherence |
| 8 | `Ω(H_hist) = min(1 + α·log(1 + N_relevant), 2.500)` | v10 cross-domain memory multiplier (α = 0.15) |
| 9 | `Λ_effective = Ω · Λ` | v10 per-agent experience amplification |
| 10 | `S_total = S_adjusted · Ω` | v10 team-level reported coherence |
| 11 | `Â = A_Λ ∘ A_σ ∘ A_E ∘ A_F` | Activation Operator composition (4-step) |
| 12 | `Φ(Ψ) = ι(Ô(Ψ)); Ψ* = Φ(Ψ*)` | Self-observation strange loop + fixed point |
| 13 | `I(C) = files × coupling × legacy_factor` | Configuration inertia |
| 14 | `v = α / (I(C) + ε)` | Velocity under inertia |
| 15 | `freshness = max(0, 1 − age_days / half_life)` | Temporal decay (v10) |
| 16 | `v_conv = α / (τ_cycle · (I(C) + ε))` — F3 | v10 Parallel Trajectories: convergence rate as function of cycle length (Pankratov 2026 §VI.2) |
| 17 | `dim(C_H) ≤ dim(C) − dim(ker(Π_H))` — F4 | v10 Parallel Trajectories: frame-as-projector, rank-nullity bound on admissible solution subspace (§IV.2-3) |
| 18 | `Π_meta = S_adjusted / τ_cycle` — F6 | v10 Parallel Trajectories: meta-epistemological productivity (§IX.7) |
| 19 | `B_received ≥ B_min` — F7 | v10 Parallel Trajectories: sufficiency threshold replacing equality target (§VIII.5-6); per-modality B_min calibration deferred to v11 (OQ-PT-3) |
| 20 | `V_practical(τ_precision) = B · (τ_precision/τ*) / (1 + (τ_precision/τ*)²)` — F10 | v10 Parallel Trajectories: inverted-U practical-value curve; `V_practical^max = B/2` at `τ_precision = τ*` (§VI.6) |
| 21 | `∇S_direction = (dN_carriers/dt, dΛ_role/dt)` with `d(B_persist · N_carriers)/dt > 0` — F11 | v10 Parallel Trajectories: growth-direction heuristic (more carriers + coordinated distortions, not distortion-minimization) (§X.4) |

Source: `eradev.md` §I-III + §III.2 + `meta.md` §1a.

---

## Part III — Multi-Agent Framework Inspirations (10+)

From `reports/multi_agent_frameworks_comparison_2026-04-11.md` (10-framework survey):

| Framework | Author | What EraDev adopted | What was rejected / deferred |
|---|---|---|---|
| **MetaGPT** | FoundationAgents team | Empirical anchor for 5-role decomposition ("Code = SOP(Team)"); PM / Arch / Eng / QA / PM convergence | — |
| **PaperOrchestra** | Google Research (2026) | Second independent convergence to n=5 (Outline / Plotting / Lit-Review / Section-Writing / Refinement); 84% acceptance-rate anchor | — |
| **AutoAgent** | Kevin Ru | Orientation-wraps-optimization loop → EMP7; Trace Accumulator bridge | Pure score-driven hill-climbing (EMP7 rejection: "optimization without orientation is hill-climbing into fog") |
| **MemPalace** | milla-jovovich | Tiered memory (Wings/Rooms/Closets/Drawers → T1/T2/T3/Boundary); temporal triples; 96.6% R@5 benchmark | Full 4-level hierarchy (collapsed to 3 tiers + Closet/Drawer split) |
| **everything-claude-code (ECC)** | affaan-m | Background instinct extraction (`CronCreate`-based `/extract` skill; Phase 2.C) | PostToolUse hook profile (minimal/standard/strict) — replaced with CronCreate for operator-safety |
| **LangGraph** | LangChain | Declarative `StateGraph` schema for RT (`templates/rt_graph.schema.md`, v10) | Engine itself (deferred to v11) |
| **CrewAI** | crewAIInc | Model-per-role cost optimization (Opus/Sonnet/Haiku) design concept | Integration (Phase 2.D, operator-deferred) |
| **AutoGen / MS Agent Framework** | Microsoft | Modular memory + debugging patterns | — (reference-only) |
| **ChatDev** | OpenBMB | Validates RT-1 deliberation pattern ("communicative dehallucination") | Waterfall pipeline (EraDev uses Round Table, not waterfall) |
| **OpenAI Swarm / Agents SDK** | OpenAI | `handoff()` primitive — validates EraDev's `interfaces.md` 5-schema contract | Explicit routing (EraDev uses topology-driven instead) |
| **Claude Code Subagents** | Anthropic | Native hub-and-spoke + per-role tool whitelists → `.claude/skills/eradev/` distribution bundle | — |
| **RTK (output compression)** | research report | Bash output compression concept | **REJECTED for universalization** (code-only optimization per `reports/rt_en_validator_2026-04-11.md`) |
| **Book-Agent / Squibler / StoryWriter / Agents' Room** | various | Industry validation for 5-role decomposition in narrative writing | — (reference-only) |

---

## Part IV — Named Contributors

### Framework creator
- **Anton Pankratov** (`@txrx13`) — EraDev framework architect; ODTOE author (independent researcher, Казань). ORCID 0009-0002-4870-2995. Attributions: `projects/odtoe-articles/config.md` author field; framework implicitly authored across all root files.

### Historical (theoretical substrate)
- **Taiichi Ohno / Shigeo Shingo** — TPS architects (implicit via the TPS tag).
- **Eliyahu M. Goldratt** — Theory of Constraints; *The Goal* (1984).
- **Genrich Altshuller** — TRIZ; Ideal Final Result.
- **Kolmogorov / Arnold / Moser** — KAM theorem (1954 / 1963 / 1962).
- **Adolf Hurwitz** — 1891 theorem on Diophantine approximation; grounds `n_min = 5`.
- **Douglas Hofstadter** — *Gödel, Escher, Bach* (1979); strange-loop concept.
- **Kurt Gödel** — incompleteness / self-reference (implicit via Hofstadter lineage).

### RIGOR_LEVEL axis + FLUX protocol attribution (v10 Bundle D)

The RIGOR_LEVEL axis and FLUX protocol (see Part V above) are EraDev's own synthesis of prior art rather than a single-source import. The synthesis draws on:
- **Agile spike/story distinction** (various agile literature) — timeboxed exploration (spike) vs. deliverable (story) maps to exploratory/emergent vs. structured/strict RIGOR_LEVELs.
- **Design Thinking diverge/converge phases** (Stanford d.school and predecessors) — the diverge/converge rhythm informs the emergent → exploratory → structured → strict gradient.
- **Negative capability** (John Keats, 1817 letter; pedagogical descendants) — "sitting with uncertainty without reaching for resolution" grounds the emergent-level exemption from threshold gating (F7 becomes post-hoc, not mid-work).
- **ODTOE_parallel_trajectories §VII.4 configuration ensemble** (Pankratov 2026) — "в практике малых групп рабочей единицей часто оказывается не одна конфигурация C, а ансамбль {C_1, C_2, ..., C_M}, где разные конфигурации решают разные фазы задачи." Direct theoretical anchor for per-segment rigor declaration: strict segments run C_strict, exploratory run C_FLUX.
- **Wallas four-stage creativity model** (G. Wallas, *The Art of Thought*, 1926) — preparation / incubation / illumination / verification. Grounds FLUX Long-cycle (L) component: incubation is NOT idle time, it is active cognitive work invisible to latency metrics; τ_cycle primacy (Invariant #17) must not penalize incubation.

No single external attribution captures the RIGOR_LEVEL + FLUX synthesis. The framework's contribution is (a) formalizing the 4-level axis as orthogonal to `domain.type`, (b) connecting rigor declaration to the μ-check modality branch (BLOCKING ↔ ADVISORY), (c) pairing BIM (strict/structured gates) with FLUX (exploratory/emergent advisory) in one coherent protocol family.

### Project-scoped contributor
- **Rybakov Approach** — 7-stage RU methodology for AI-generated scientific deliverables (biological metaphor DNA → RNA → Splicing → Protein → Conscience → Metric). Source: external `.docx` provided by operator 2026-04-04; RT-1 analysis at `reports/RT1_rybakov_approach_analysis_2026-04-04.md`. Project-scoped to `projects/odtoe-articles/`.
  - **Adopted (unanimous RT-1 verdict, S_coherence = 0.88):** epistemic markers `[FACT]` / `[DERIVATION]` / `[HYPOTHESIS]` / `[OPEN]` as **Check 8** (see `projects/odtoe-articles/config.md`); **Failure Modes (3-7)** at RT-1 (added to `roles/visionary_EN.md`); **Source Register + Trust Index T1-T4** (Check-First item 4b); **Verification Register (capped at 10)** in Coherencer (`roles/coherent_EN.md`).
  - **Rejected:** full 7-stage pipeline (budget overflow, +150-200 lines); biological metaphor (conflicts with ODTOE physical metaphor Ô/Ψ/ι); metric `E = h·ν` (direct glossary collision with EraDev term #12 "E = Alignment"); "do not ask questions" principle (contradicts Andon obligation).
  - **Universality boundary:** `.githooks/pre-commit` banned-pattern regex includes `rybakov` — references outside `projects/odtoe-articles/` block the commit. Enforces L3 project-scope.

### LLM test platform
- **Claude Opus (Anthropic)** — 4.6 / 4.7 — single-LLM test environment. Multi-LLM generalization flagged in `reports/v9_odtoe_multiagent_mining_2026-04-11.md §4.3`.

---

## Part V — Protocols, Gates, Patterns

Core patterns shipped in the framework (not exhaustive; full list in the sources inventory §Category 6):

- **A3 methodology** (Toyota 6-field: Context / Current State / True North / Gap / Distinctions / Open Questions)
- **Round Table RT-0 / RT-1 / RT-2 / RT-3** — `eradev.md` §VI (RT-0 added v10, pre-Apophatic Gate)
- **FLUX RT Protocol (v10 Bundle D)** — `eradev.md` §VI.1. Free-flowing, Long-cycle, Unit-of-voice, eXploratory. Replaces BIM (Bundles A+B+C full application) for RIGOR_LEVEL ∈ {exploratory, emergent} segments: μ-check is ADVISORY (not blocking), Voice Guide substitutes Unified Plan, Validator emits findings but does not gate, Coherencer allows legitimate divergence, long cycles (including 24-48h incubation gaps) are permitted and NOT a fix chain. Exit criterion is "good-enough-to-iterate," not contracts-complete. Applies at exploratory/emergent RIGOR_LEVEL per `templates/domain_skin.md.template` rigor_map schema. Verify method: `flux_check` (advisory — 7 checks, none blocking). See `meta.md` §μ-check modality branch.
- **RIGOR_LEVEL axis (v10 Bundle D)** — `eradev.md` §III.3. Four-level gradient (strict / structured / exploratory / emergent) describing spec-to-output clarity. Orthogonal to `domain.type`. Strict/structured → BIM gates apply (μ-check BLOCKING, Unified Plan mandatory); exploratory/emergent → FLUX protocol (μ-check ADVISORY, Voice Guide). Declared via `rigor_default` + `rigor_map` in project config (see `templates/domain_skin.md.template` schema). Four-layer declaration cascade: domain default → task override → segment override → agent warning.
- **Self-application fixed point** `Ψ* = Φ(Ψ*)` — Level 6 and Level 9 self-modification
- **4-layer file architecture** L0 immutable / L1 universal / L2 domain skins / L3 project instances
- **4-layer bilingual architecture** (`eradev.md` §0.1) — L0 math canonical, L1 TPS canonical, L2 templates, L3 project
- **Apophatic Gate (v10)** — pre-RT-1 checkpoint (preserves n=5 torus invariant)
- **Phantom Coherence Check (BL-5)** — detects "everyone agrees but everyone is wrong"
- **Phantom Decoherence (v9 Wave 9, BL-29 extension)** — symmetric to BL-5
- **Check-First pipeline (BL-17, absorbed BL-21)** — pre-generate verification
- **Universality Gate (v10 Session 7)** — `.githooks/pre-commit` regex + `.universality-allowlist`
- **Kill-Switch Levels 1-5** — escalation ladder for operator override
- **Jidoka Self-Check** — B-diagnostics on every role output
- **Banality score 1-10** — detects low-effort output early
- **Blast Radius classification** — LOW / MEDIUM / HIGH / CRITICAL
- **Damping Detection** — S ± 0.02 corridor (the spiral gap as feature, BL-15)
- **Graduated Activation** — GREEN / YELLOW / RED Andon (replaces binary stop)
- **Enforcement Gates** — PRE-FLIGHT / LAMBDA AUDIT / FIX-TO-SPEC / BUILD-VERIFY
- **Dead Gate Rule** — "a gate that fires but doesn't change behavior is a dead gate"
- **Trace Accumulator** — real-time failure signal (AutoAgent-bridge)
- **Composition Hazards Gate (BL-34)** — ≥ 2 parallel refactors require N·(N-1)/2 + 3-way grid
- **Rework-discipline audit (BL-35)** — rework-framing regex triggers mandatory audit
- **Enforcement-Tier Ladder T1 / T2 / T3 / T4 (BL-33)** — type > hook > checklist > docs
- **Liveness Prerequisite (v10, BL-47 promoted)** — external probe / silent-protector detector
- **Report Funnel** — Builder (full) → Validator (Structured Verdict, 7 lines) → Coherencer (Cycle Brief, 10 lines) → META compression
- **Defense-in-Depth (BL-30)** — minimum 3 enforcement layers per invariant

---

## Part VI — Invariants, Bootstrap Lessons, Output Types

- **16 META Invariants** (`CLAUDE.md`) — tagged `[UNIVERSAL]` or `[CODE-ADAPTER]`. Invariants 15 and 16 added in v10 PLUGY uplift 2026-04-20 (BL-34 composition hazards, BL-35 rework-discipline audit).
- **30 active Bootstrap Lessons** — 23 universal (`BOOTSTRAP_LESSONS_universal.md`) + 7 code-adapter (`BOOTSTRAP_LESSONS_code_adapter.md`). 5 retired/merged: BL-14 → BL-8; BL-20 retired; BL-21 → BL-17; BL-23 retired; BL-27 → BL-6.
- **6 META output types** (`meta.md` §1a + `CLAUDE.md`): Agent calls / Decisions / Synthesis / Lessons / Reports / Check Agent. Any other output is a violation.
- **51 glossary terms** (`glossary.md` v4.1) — bilingual single source of truth (EN + RU canonical forms).

---

## Part VII — Memory + Extraction Infrastructure

- **Tiered memory** T1 Anchors (200 lines) / T2 Session (50 lines) / T3 Wisdom (100 lines) / Boundary (0 lines) — `meta.md` §15.
- **Closet / Drawer pattern** (MemPalace-inspired) — `MEMORY.md` header "Budget: <= 200 lines. This file is the TABLE OF CONTENTS."
- **Temporal decay** — `freshness = max(0, 1 − age_days / half_life)`; 180-day regular, 360-day cross-project, EMPs immortal.
- **BL compression protocol** — PROMOTE / MERGE / DISCARD / DEFER; `BL_CANDIDATES.md` staging; cap 30 active BL.
- **Cross-project scan** — computes Ω input (`meta.md` §Item 9 Lambda Audit).
- **CronCreate background extraction (Phase 2.C)** — ECC-inspired; schedule `17,47 * * * *`; `templates/extraction_prompt.md`.
- **`/extract` skill** — manual extraction trigger.
- **Identity persistence** — `MEMORY.md` record; checked at session start.

---

## Part VIII — Verification Methods (Domain Registry)

| Method | Domain | Sub-checks |
|---|---|---|
| `build` | code | compile / lint / parse / render |
| `cite_check` | article | C1-C6 + ODTOE 8-check overlay |
| `readability` | book | R1-R6 |
| `parse` | config | P1-P7 |
| `dry_run` | plan | DR1-DR6 |
| `recompute` | research | RC1-RC8 |
| `doc_alignment` | plan-class (strict/structured RIGOR_LEVEL) | 7 checks at μ-check; BLOCKING gate (Bundle B) |
| `flux_check` | exploratory/emergent RIGOR_LEVEL | 7 advisory checks at μ-check; NON-BLOCKING (Bundle D) |
| `structure_check` | structured-continuous (sonnet / haiku / screenplay) | skeleton verification only — v10 prototype |
| `custom_methods` | any | per-project declared (v10 extensible registry) |

Example declarable custom methods (documented in `templates/domain_skin.md.template`): `statute_check` (legal drafts), `contraindication_scan` (medical protocols), `ingredient_check` (culinary recipes), `accessibility_audit` (UI configs vs WCAG/ARIA).

---

## Part IX — Domain Skins (L2)

Six canonical skins in `templates/`:

- `domain_skin.code.md` / `domain_skin.code_RU.md`
- `domain_skin.article.md` / `domain_skin.article_RU.md`
- `domain_skin.book.md` / `domain_skin.book_RU.md`
- `domain_skin.plan.md` / `domain_skin.plan_RU.md`
- `domain_skin.research.md` / `domain_skin.research_RU.md`
- `domain_skin.config.md` / `domain_skin.config_RU.md`
- `domain_skin.md.template` — schema for future skins

**Overlay pattern (v10 Session 7, L-43 split-beats-purify):** universal skin + project-local overlay for specialized cases. Example: `projects/odtoe-articles/overlay/domain_skin.article.overlay.md` (250 lines) — houses ODTOE-only rules (8-file RU+EN mandate, LaTeX/tectonic stack, Rybakov markers, glossary overlay) separated from the universal article skin.

---

## Part X — Level Hierarchy

| Level | Description | Status |
|---|---|---|
| **L3** | Single-agent Jidoka self-check (compile / test / lint) | Active |
| **L6** | Full RT cycle with feedback (5 roles, strange loop closes) | Active |
| **L9** | Meta-Agent modifies the observation operator — `O(O) = O'` | Active (this is EraDev itself) |
| **L10: Cross-Domain Lambda** | Mechanical cross-project lesson discovery (Ω multiplier) | Active (v10) |
| **L11: multi-attractor Ψ*** | Multiple stable configurations per project (per-artifact-class B tracking) | Deferred (v11) |
| **L12: global Ω** | All projects improving together as portfolio (L10 at 3+ project scale) | Deferred (v11) |

---

## Part XI — Version History

| Version | Key uplift |
|---|---|
| v7.1 | Constitution structure stabilized; RU primary |
| v8 | Self-loading context architecture (Invariant 12); 3-layer runtime enforcement |
| v9 | Universalization: 4-layer architecture, domain skins, bilingual L0/L1/L2/L3, memory hierarchy (Phase 2.B) |
| v10 | Ω multiplier (cross-domain Lambda), BL compression, Apophatic Gate, Universality Gate (Session 7), L10 activation, 4-tier enforcement ladder (BL-33), composition hazards (BL-34), rework-discipline audit (BL-35), Liveness Prerequisite, Parallel-Trajectories integration (Bundle A: F3/F4/F6/F7/F10/F11 + NFL foundation #13 + 13-citation bibliography import from Pankratov 2026) |

---

## Part XII — Release Provenance (meta-reflection)

EraDev applies its own 5-role Round Table protocol to its own development. This is
the self-application principle — Level 9 self-modification, `Ψ* = Φ(Ψ*)`. Each
version is documented via Hansei reports in `reports/` (40+ reports as audit trail),
with the framework improving itself by following its own process.

---

## Part XIII — Extended Bibliography (v10 Parallel-Trajectories imports)

The following 13 citations were imported into EraDev's reference corpus as part of v10 Bundle A integration of Pankratov 2026 "Meta-epistemology of Small Groups: Feedback Cycle as the Primary Operator of Knowledge Production in Multi-agent Configurations" (preprint; paper reference [2]–[6] are the author's ODTOE corpus already internalized by EraDev; the 13 below are external-literature attributions newly incorporated). Each is load-bearing for a specific EraDev concept and had either no prior attribution or only implicit lineage before this import.

| # | Citation | Supports EraDev concept | First place of use |
|---|---|---|---|
| 1 | **Gärdenfors, P.** *Conceptual Spaces: The Geometry of Thought.* MIT Press, 2000. DOI: 10.7551/mitpress/2076.001.0001. | Geometric intuition for the `Ψ`-field of states and `C ⊂ Ψ` configuration subspace (F4 frame-projector); Sperber-Wilson communication-vs-cognition pair | `eradev.md` §III.2.2 (F4 subsection); glossary term `Ψ-field of states` |
| 2 | **Hackman, J.R.** *Leading Teams: Setting the Stage for Great Performances.* Harvard Business School Press, 2002. ISBN 978-1-57851-333-8. | Empirical grounding for 5-role team topology (paper [3]); team-size effects behind n_min=5 | `eradev.md` §V "Five Roles"; `FOUNDATIONS.md` Part III multi-agent frameworks |
| 3 | **Tuckman, B.W.** "Developmental Sequence in Small Groups" // *Psychological Bulletin*, 1965, Vol. 63, pp. 384-399. DOI: 10.1037/h0022100. | Forming/storming/norming/performing sequence — grounds why RT-1 is independent parallel and RT-2 is hybrid (team stages matter for protocol design) | `eradev.md` §VI "RT Phase Protocols" |
| 4 | **Flood, R.L., Jackson, M.C.** *Creative Problem Solving: Total Systems Intervention.* Wiley, 1991. ISBN 978-0-471-93052-5. | Ensemble-of-configurations intuition for phase-driven method selection (Pankratov 2026 §VII.4, deferred to v11 per OQ-PT) | `eradev.md` §III.2.8 OQ-PT; future v11 roadmap for phase-driven Coherencer Hierarchy |
| 5 | **Schön, D.A.** *The Reflective Practitioner: How Professionals Think in Action.* Basic Books, 1983. ISBN 978-0-465-06874-6. | Reflection-in-action concept underpinning the μ-check ("how did you hear?") operation at RT-2 (Bundle B) and post-hoc Hansei discipline | `roles/validator_EN.md` μ-check (Bundle B); `eradev.md` §VI RT-2 protocol |
| 6 | **Kuhn, T.S.** *The Structure of Scientific Revolutions.* 4th ed. University of Chicago Press, 2012. ISBN 978-0-226-45812-0. | Paradigm-shift lineage for `Ô_t0 → Ô_t1` shift operator — knowledge is `(Ψ, Ô_t)` pair, not `Ψ` alone; grounds `ood_scope` enforcement (some questions are structurally outside the current paradigm) | `eradev.md` §II.2 OOD scope rationale; glossary |
| 7 | **Latour, B.** *Science in Action: How to Follow Scientists and Engineers Through Society.* Harvard University Press, 1987. ISBN 978-0-674-79291-3. | Knowledge-as-network-of-actants — grounds EraDev's multi-agent epistemology: B is not a property of one agent but of the `(O, C)` pair | `eradev.md` §II Formula B framing; glossary `Cognitive coherence B` |
| 8 | **Polanyi, M.** *Personal Knowledge: Towards a Post-Critical Philosophy.* University of Chicago Press, 1958. ISBN 978-0-226-67288-5. | Tacit knowledge — directly grounds "transmit the method, not the text" habit (Bundle C Four Habits); BL-19 bilingual sync discipline | `roles/*.md` role-file transmission vs. prompt text; `CLAUDE.md` Four Habits block (Bundle C) |
| 9 | **Hutchins, E.** *Cognition in the Wild.* MIT Press, 1995. ISBN 978-0-262-08231-2. | Distributed cognition — empirical grounding for why coherence is collective (`P_coll`) not individual; humans + artifacts as cognition substrate | `eradev.md` §III `P_coll` formula; `FOUNDATIONS.md` Part III framework comparison |
| 10 | **Nonaka, I., Takeuchi, H.** *The Knowledge-Creating Company.* Oxford University Press, 1995. ISBN 978-0-19-509269-1. | SECI model (Socialization/Externalization/Combination/Internalization) — implicit lineage for RT-1→Build→RT-2→Build→RT-3 knowledge-creation cycle | `eradev.md` §VI Round Table protocols |
| 11 | **Sperber, D., Wilson, D.** *Relevance: Communication and Cognition.* 2nd ed. Blackwell, 1995. ISBN 978-0-631-19878-9. | Cognitive-effect-vs-effort trade-off grounds F7 sufficiency threshold (B_received ≥ B_min) — relevance theory's sufficiency criterion formalized in ODTOE multiplicative B-formula | `eradev.md` §III.2.5 F7 (Bundle A) |
| 12 | **Dunbar, R.I.M.** "Neocortex size as a constraint on group size in primates" // *Journal of Human Evolution*, 1992, Vol. 22, No. 6, pp. 469-493. DOI: 10.1016/0047-2484(92)90081-J. | Dunbar number (~150) as third nested cognitive scale above n_min=5 (atomic role dispersion) and Miller 7±2 (working memory) — deferred framing for v11 multi-team scaling | `eradev.md` §X Task Classification future work; `FOUNDATIONS.md` Part I future v11 |
| 13 | **Miller, G.A.** "The Magical Number Seven, Plus or Minus Two" // *Psychological Review*, 1956, Vol. 63, No. 2, pp. 81-97. DOI: 10.1037/h0043158. | Working-memory limit — second nested cognitive scale between atomic n_min=5 and social Dunbar 150; informs why RT outputs cap at 500 words | `eradev.md` §XV "Standard Agent Output Format" (500-word cap); future v11 three-scale documentation |

**Additional anchor citation — entry 33 from paper [33]:**
- **Wolpert, D.H., Macready, W.G.** "No Free Lunch Theorems for Optimization" // *IEEE Transactions on Evolutionary Computation*, 1997, Vol. 1, No. 1, pp. 67-82. DOI: 10.1109/4235.585893. — Full attribution in Part I foundation #13; cited here for bibliographic completeness.

**Adjacent attributions already present in EraDev (no re-citation needed, referenced by the paper but prior to this import):**
- Boyd / OODA → already in `FOUNDATIONS.md` Part III (AutoAgent orientation).
- Deming / PDCA → already in `FOUNDATIONS.md` Part I (TPS foundation #2).
- Kahneman, Janis (groupthink), Surowiecki (wisdom of crowds), Altshuller (TRIZ), Checkland (Soft Systems), Heath-Heath (stickiness), Gladwell (tipping point), Vygotsky, Bakhtin — all present in comparison table `reports/multi_agent_frameworks_comparison_2026-04-11.md` as reference-only or indirectly cited via other foundations.

> Provenance audit: all 13 citations were imported in v10 Bundle A commit (Parallel-Trajectories integration). Source paper for each attribution: Pankratov 2026 §§III.3, IV.5, V, VII, VIII, X.4 — see `reports/v10_parallel_trajectories_analysis_2026-04-24.md` for concept-to-citation mapping (item C26).

---

## Further reading

- **Quick overview:** `README.md` / `README_EN.md`
- **Full source audit:** `reports/v10_sources_inventory_2026-04-23.md` (12 categories, file:line citations, Rybakov deep-dive, cross-reference matrix)
- **Session Entry protocol:** `meta.md` §14 (13-item bootstrap)
- **Core math:** `eradev.md` §I-III
- **Invariants:** `CLAUDE.md`
- **Bootstrap Lessons:** `BOOTSTRAP_LESSONS.md` (combined) / `BOOTSTRAP_LESSONS_universal.md` / `BOOTSTRAP_LESSONS_code_adapter.md`
- **Glossary:** `glossary.md` (51 terms, bilingual)
- **Project lessons:** `projects/eradev/lessons.md` (45 lessons + 15 EMPs)
- **Multi-agent survey:** `reports/multi_agent_frameworks_comparison_2026-04-11.md`
- **Rybakov RT-1:** `reports/RT1_rybakov_approach_analysis_2026-04-04.md`
- **v9 ODTOE mining:** `reports/v9_odtoe_multiagent_mining_2026-04-11.md`

---

*EraDev v10 | FOUNDATIONS.md | 2026-04-23 | L1 universal (contributor attributions allowlisted for intellectual-honesty audit trail)*
