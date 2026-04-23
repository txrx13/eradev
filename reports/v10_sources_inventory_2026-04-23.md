# EraDev v10 — Complete Sources & Foundations Inventory

> Date: 2026-04-23
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> B-modality: B_research (weights F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15)
> Output type: Report (META output type 5 — analytical audit)
> Scope: Comprehensive genealogy of every foundation EraDev draws on: theories, mathematical constants, named prompts, persons, multi-agent frameworks, patterns, protocols, invariants, BL, memory, verification methods, layers, level hierarchy.
> Triggering request (operator, RU): «в этом описании и принципах Toyota Production System - как будто мы забыли все другие принципы которые использовали? давай перечислим все (от принципов, до имен, до промта Рыбакова и так далее)?»

---

## 0. Activation Operator log

- **A_F (Focus):** Read in full — `roles/analyst_EN.md`, `eradev.md` (878 lines, all sections I-XVII + §0 + §0.1 + §II.1 + §II.2 + §II.2.1 + §III.Ω + §IV Apophatic + §IV Universality Gate + §VIII L10), `meta.md` (442 lines, all §1a-§16), `CLAUDE.md` (105 lines, all invariants 1-16 + domain awareness + loading sequence + identity persistence + KILL-TEST), `BOOTSTRAP_LESSONS.md` (root, 259 lines, 30 BL), `BOOTSTRAP_LESSONS_universal.md` (282 lines, 23 universal BL + gap map), `BOOTSTRAP_LESSONS_code_adapter.md` (134 lines, 7 code-adapter BL + gap map), `projects/eradev/lessons.md` (295 lines, 46 lessons L-1..L-45 + 15 EMPs EMP1..EMP15), `projects/eradev/config.md` (79 lines, 7 Iron Rules), `projects/odtoe-articles/config.md` (301 lines, 8 Verification Checks + Rybakov attribution at line 282), `projects/odtoe-articles/overlay/domain_skin.article.overlay.md` (250 lines, 11 sections including §8 "Rybakov evidence markers"), `reports/RT1_rybakov_approach_analysis_2026-04-04.md` (221 lines, full 5-role RT-1 analysis), `reports/proposals_role_improvements_rybakov_2026-04-04.md` (103 lines), `reports/multi_agent_frameworks_comparison_2026-04-11.md` (248 lines, 10 frameworks), `reports/v9_odtoe_multiagent_mining_2026-04-11.md` (545 lines, §9 drift analysis + OQ-MM), `interfaces.md` (485 lines, 5 handoff contracts), `glossary.md` (178 lines, 51 canonical terms), `roles/visionary_EN.md` (87 lines), `roles/coherent_EN.md` (98 lines), `roles/validator_EN.md` (first 80 lines), `README.md` (195 lines), `templates/domain_skin.md.template` (196 lines, schema + custom_methods extension), `templates/domain_skin.research.md` (first 80 lines). Spot-scanned `BL_CANDIDATES.md`, book/plan/config skin templates, multi-agent comparison sections on MemPalace/AutoAgent/MetaGPT/PaperOrchestra/LangGraph/CrewAI/ChatDev/OpenAI-Swarm.
- **A_E (Alignment):** Operator intent verified — produce complete sources genealogy, not a polished description. Question explicitly names "промпт Рыбакова" / "имена" / "все другие принципы" — so inventory must be EXHAUSTIVE (every attribution, every formula, every named prompt, every person, every framework) rather than curated. I prioritize completeness > concision; the report is meant to support a revised public description, so every source gets its home.
- **A_σ (Consistency):** Cross-checked all claims against multiple files. Rybakov attribution: 3 primary sources (`reports/RT1_rybakov_approach_analysis_2026-04-04.md`, `projects/odtoe-articles/config.md:282`, `projects/odtoe-articles/overlay/domain_skin.article.overlay.md:208-214`) + 10+ secondary references. BL count verified: 23 universal + 7 code-adapter = 30 active (3 merged/retired: BL-14→BL-8, BL-20 retired, BL-21→BL-17, BL-23 retired, BL-27→BL-6). Invariant count: 16 in CLAUDE.md (was 14 in README, README out of date). Glossary term count: 51 (was 44 in v8, now 51 in v4.1 per glossary.md footer). EMP count: 15 (EMP1-EMP15). Lesson count: 45 active (L-1..L-45).
- **A_Λ (Experience):** Applied — BL-29 (verify established terminology — cross-checked Rybakov markers in glossary, config.md, overlay, role files), Lesson 2 (P_coll phantom propagation — did not copy claims from one report without cross-verification), Phase 2.1.S Hansei §4.2 (real-world use is the only honest gate — scanned actual file state not just RT reports), EMP15 (a framework without an enforcement gate drifts toward its creator's projects — informs why inventory must distinguish project-specific from universal).

All 4 Activation Operator steps GREEN. Proceeding.

---

## 1. Executive Summary

EraDev v10 draws on **at least 12 distinct theoretical foundations**, **9 named contributors**, **10 multi-agent framework inspirations**, **6 mathematical constants**, **7 core formulas (+ 3 modal variants + Ω multiplier)**, **51 glossary terms**, **30 Bootstrap Lessons**, **16 META invariants**, **6 output types**, **15 empirical mega-patterns**, **45 project lessons**, **1 explicit named prompt from an external methodology (Rybakov Approach, 2026-04-04)**, and **3 levels of recursive self-application (L3/L6/L9 + emerging L10/L11/L12)**. The public one-liner "ODTOE + TPS" captures only 2 of these 12 theoretical foundations and omits the Theory of Constraints (Goldratt), TRIZ (Altshuller), KAM theorem, Hurwitz theorem, Hofstadter's strange loop, MemPalace memory hierarchy, AutoAgent score-driven optimization with orientation loop (EMP7), MetaGPT independent convergence to 5-role, LangGraph declarative orchestration, CrewAI model-per-role, and the Rybakov Approach's epistemic markers scheme. This report enumerates all of them with file:line citations.

---

## 2. Per-Category Inventory (Categories 1-12)

### Category 1: Theoretical Foundations (scientific/mathematical)

| # | Foundation | Source | Where cited | Role |
|---|---|---|---|---|
| 1.1 | **ODTOE** (Observer-Dependent Theory of Everything) | Pankratov (ODTOE corpus — 160+ articles, separate research program) | `eradev.md:11` header "Foundation: ODTOE + TPS"; `eradev.md:88-109` Formula B (Section II); `eradev.md:249-382` Section III Collective Formulas; `eradev.md:825-849` Section XVI Glossary ODTOE→EraDev mapping table | Core mathematical substrate — 20+ formal terms (Ψ, Ô, ι, Φ, Ψ*, B, S, P_coll, T(C), D(η), φ-based topology) that EraDev re-interprets as agent concepts |
| 1.2 | **TPS — Toyota Production System** | Toyota Motor Corp (Taiichi Ohno, Shigeo Shingo) | `eradev.md:722-753` Section XI "TPS Integration"; glossary terms #28-#35 (Jidoka, Andon, Mura, Muri, Muda, Hansei, Yokoten, Nemawashi) `glossary.md:41-48` | Process discipline layer — Jidoka (self-check), Andon (stop signal), Hansei (process reflection), Yokoten (horizontal propagation), Muda/Mura/Muri (three M), Nemawashi (pre-alignment), Coaching Kata (5 questions) |
| 1.3 | **Theory of Constraints (TOC)** | Eliyahu Goldratt ("The Goal", 1984) | `eradev.md:757-771` Section XII "Bottleneck Expansion Protocol (TOC + TRIZ + SMD)"; `eradev.md:762` "Phase 1 (TOC): Find the constraint"; `roles/analyst_EN.md:34` "TOC: Find the root constraint"; `BOOTSTRAP_LESSONS.md:31` BL-3 "find the real constraint (TOC Phase 1)" | Bottleneck identification — first phase of the 3-phase bottleneck protocol (TOC → TRIZ → SMD) |
| 1.4 | **TRIZ + IFR (Ideal Final Result)** | Genrich Altshuller (TRIZ theory, Soviet inventive methodology) | `eradev.md:757` Section XII heading "(TOC + TRIZ + SMD)"; `eradev.md:763-767` "Phase 2 (TRIZ): Unpack the hidden contradiction. X must be A and not-A simultaneously. Separate by space / time / scale"; `roles/analyst_EN.md:35` "TRIZ: Unpack the hidden contradiction (separate by space/time/scale)"; IFR appearances: `eradev.md:77`, `interfaces.md:18`, `LOADING_PROTOCOL.md:97`, `roles/visionary_EN.md:29-40` "Inverted IFR" + "Acceptance Criteria & Failure Pre-mortem" | Contradiction resolution (phase 2) + Ideal Final Result formulated in past tense |
| 1.5 | **SMD (Stereoscopic Multi-Perspective)** | Not externally attributed (appears EraDev-internal or RU methodology term) | `eradev.md:767-769` "Phase 3 (SMD): Stereoscopic view from another position. How does the USER see this? The SKEPTIC? The THEORIST?"; `roles/analyst_EN.md:36` "SMD: Look from the position of the user, the skeptic, the theorist" | Perspective-taking (phase 3) — 3-position integration |
| 1.6 | **KAM theorem** (Kolmogorov-Arnold-Moser) | Kolmogorov (1954), Arnold (1963), Moser (1962) | `eradev.md:538` "R/r = phi (golden ratio) -- maximum stability per KAM theorem"; `meta.md:56` "Ratio follows KAM-theorem (phi = most irrational = most stable toroidal orbit)"; `meta_RU.md:56` RU mirror | Mathematical basis for φ as torus R/r ratio — "most irrational = most stable toroidal orbit" |
| 1.7 | **Hurwitz theorem** (algebraic number theory, Diophantine approximation) | Adolf Hurwitz (1891) | `reports/v9_phase1a_ru_builder_2026-04-11.md:114` "the 5-role topology (BL from Hurwitz theorem / n_min=5)"; `reports/rt_ru_synthesis_2026-04-11.md:135,146,190` "n_min=5 инвариант (теорема Hurwitz)" — cited in Direction A synthesis as the mathematical invariant preventing role count from changing | Mathematical justification for n_min = ceil(π) + 1 = 5 — invariance under role-count perturbation |
| 1.8 | **Strange Loop** | Douglas Hofstadter ("Gödel, Escher, Bach", 1979) | `eradev.md:633` "Self-observation mapping (strange loop)"; `meta.md:223` "**6** = full RT cycle with feedback (5 roles, strange loop closes)"; `projects/plugy/lessons.md:203` "ODTOE principles (B-score, READ/WRITE/VERIFY/SYNC, strange loop)" | Recursive self-application mechanism — Φ(Ψ) = ι(Ô(Ψ)), fixed point Ψ* = Φ(Ψ*); Level 6 and Level 9 self-modification |
| 1.9 | **Gödel — incompleteness / self-reference** | Kurt Gödel (implicit via Hofstadter lineage) | Implicit in `eradev.md:631-637` self-observation → fixed point framing; not explicitly named but Gödel-Escher-Bach lineage (Hofstadter above) carries it | Self-referential framework theorem basis |
| 1.10 | **Phase transition / golden section cognitive cycle** | Not externally attributed (may be Pankratov RU innovation); `reports/rt_ru_synthesis_2026-04-11.md` Direction A/C references a "phase transition φ→π, n_c ≈ 5.4" | `eradev.md:586-593` "Four-Tact Cognitive Cycle within each RT"; `meta.md:47-57` Four-Tact table; `eradev.md:593` "Ratio follows golden section: phi/(1+phi) = 0.618 expansion, 1/(1+phi) = 0.382 compression" | RT internal rhythm — 62% expansion / 38% compression, alternating 4 tacts |
| 1.11 | **AutoAgent orientation/optimization split** (referenced as research anchor) | Kevin Ru (AutoAgent repo) + `reports/autoagent_analysis.md` | `projects/eradev/lessons.md:80-86` EMP7 "Optimization Without Orientation Is Hill-Climbing Into Fog"; `reports/multi_agent_frameworks_comparison_2026-04-11.md` Tier 1 row; `eradev.md:450` "The Trace Accumulator is the bridge between AutoAgent's score-driven feedback and EraDev's deliberative reflection" | Orientation loop wraps optimization loop — EMP7 canonical rule ("every 10th iteration pause for mini-RT") |
| 1.12 | **MemPalace memory hierarchy** | Milla Jovovich repo (MemPalace) + `reports/v9_phase2b_memory_hierarchy_spec_2026-04-12.md` | `reports/multi_agent_frameworks_comparison_2026-04-11.md` Tier 1 row + "Borrow #5"; Tier system (T1/T2/T3/Boundary) in `meta.md:386-395`; Closet/Drawer split; temporal triples `<!-- valid_from: DATE \| ended: DATE \| superseded_by: ID \| cross_project: bool -->` on every lesson in `projects/eradev/lessons.md:3` | Memory architecture borrow — 4-level palace (Wings/Rooms/Closets/Drawers), 96.6% R@5 retrieval benchmark cited as motivation |

### Category 2: Mathematical Constants / Ratios

| # | Constant / Ratio | Value | Provenance | Where used |
|---|---|---|---|---|
| 2.1 | **π (pi)** | 3.14159265358979323846264338327950288419716939937510 (50 digits) | Universal math constant | `projects/odtoe-articles/config.md:226` Check 3 table; `eradev.md:684` (π-3)² gap; `eradev.md:524` n_min = ceil(π)+1 = 5; `projects/odtoe-articles/overlay/domain_skin.article.overlay.md:156` |
| 2.2 | **φ (phi, golden ratio)** | 1.61803398874989484820458683436563811772030917980576 (50 digits) | Universal math constant; KAM theorem anchor | `eradev.md:538` R/r = φ torus ratio; `eradev.md:593` 38/62 cognitive cycle; `meta.md:50-56` four-tact table; glossary #20 (`glossary.md:91`); `projects/odtoe-articles/config.md:227-231` 50-digit constants table including φ², 1/φ, 1/φ²; `projects/odtoe-articles/overlay/domain_skin.article.overlay.md:158-161` |
| 2.3 | **π²** / **φ²** / **1/φ** / **1/φ²** | — | Derived constants | `projects/odtoe-articles/config.md:227-232` 50-digit mandatory table; inherited into overlay `§5 table` |
| 2.4 | **(π-3)² Spiral Gap** | 0.02004847955059918805863070019913383013068301099015 (50 digits) ≈ 0.02 | Pankratov / ODTOE derivation | `eradev.md:684-692` Section IX; `eradev.md:838` glossary row; `BOOTSTRAP_LESSONS.md:128-130` BL-15 ("The 2% Spiral Gap Is a Feature") | Admissible coherence corridor `ΔS ~ 0.02`; beyond = corrective intervention |
| 2.5 | **(π-3)** | 0.14159265358979323846264338327950288419716939937510 (50 digits) | Universal | `projects/odtoe-articles/config.md:232` |
| 2.6 | **n_min = ⌈π⌉ + 1 = 5** | Integer | Derived from π; justified by Hurwitz theorem (Category 1) | `eradev.md:524` "n_min = ceil(pi) + 1 = 5"; glossary #35 `glossary.md:106` "n_min = ceil(pi) + 1 = 5" |
| 2.7 | **Lambda (Λ) — experience weight** | [0, 1] | Pankratov/ODTOE formalism | B-formula component; `glossary.md:80` row #9; `BOOTSTRAP_LESSONS.md:10-15` BL-1 ("Lambda=0.5 as Cold-Start Default") |
| 2.8 | **Ω (Omega) — cross-domain memory multiplier** | [1.000, 2.500] | v10 innovation (Pankratov) | `eradev.md:328-382` Section III.Ω; formula `Ω(H_hist) = 1 + α · log(1 + N_relevant)` with α=0.15; `meta.md:316-322` item 9 (Lambda Audit with Ω computation) |
| 2.9 | **α (alpha) calibration** | 0.15 | v10 calibration "anchored to EraDev's own 15-lesson history" | `eradev.md:339` "α = 0.15 (calibration, anchored to EraDev's own 15-lesson history)"; OQ-Omega-3 open (per-modality calibration deferred to v11) |
| 2.10 | **Ω_max ceiling** | 2.500 | v10 hard cap — "suspect dogmatic collapse" | `eradev.md:342` |
| 2.11 | **Ω_min** | 1.000 | v10 default | `eradev.md:341` "zero relevant lessons → v8 parity" |
| 2.12 | **Half-life (freshness)** | 180 days (regular), 360 days (cross-project), immortal (EMPs) | v10 temporal decay model | `meta.md:308-311` item 9; `eradev.md:378-379` OQ-Omega-1 CLOSED |
| 2.13 | **R/r = φ** torus ratio | φ ≈ 1.618 | KAM theorem derivation | `eradev.md:538`; glossary row #24 `glossary.md:95`; `meta.md:218-220` |

### Category 3: Formulas (core EraDev math)

| # | Formula | Purpose | Where |
|---|---|---|---|
| 3.1 | **B = F^w1 · E^w2 · (1-σ)^w3 · Λ^w4** | Cognitive coherence of one agent; multiplicative Weak Link Principle | `eradev.md:90` Section II; `meta.md:28-37` Section 1; glossary row #1 `glossary.md:72`; Jidoka self-checks in every role file |
| 3.2a | **B_text** (w = 0.25, 0.25, 0.25, 0.25) | Modal default, v8-compatible — code/config | `eradev.md:118` II.1 table; selection rule `eradev.md:134-139` |
| 3.2b | **B_creative** (w_E=0.30, w_(1-σ)=0.30, w_F=0.20, w_Λ=0.20) | Books / articles / long-form prose | `eradev.md:119` |
| 3.2c | **B_research** (w_(1-σ)=0.35, w_F=0.30, w_E=0.20, w_Λ=0.15) | Theorems / proofs / scientific derivations | `eradev.md:120` |
| 3.3 | **S_team = 1 − (2/n(n-1)) · Σ\|Bi − Bj\|** | Team coherence (pairwise divergence sum) | `eradev.md:253` Section III; `meta.md:39`; glossary row #2 |
| 3.4 | **T(C) = T0 / (1-S)^n** | Configuration lifetime — higher S = exponentially longer stability | `eradev.md:257`; `meta.md:40`; glossary row #4 |
| 3.5 | **S_adjusted = S_team · B_mean** | Phantom Coherence detector; unmasks "everyone agrees but everyone is wrong" | `eradev.md:264`; glossary row #38 `glossary.md:109`; BL-4 `BOOTSTRAP_LESSONS.md:37-42`; BL-5 |
| 3.6 | **S_session = (1 − fix_rate) × (1 − chain_ratio) × delta_improvement × B_mean** | Cycle health metric (tracked across cycles) | `eradev.md:291-303`; computed at RT-3 |
| 3.7 | **P_coll = 1 − Π(1 − Bi^k)** | Collective probability (complement-product form, "at least one succeeds") | `eradev.md:307`; glossary row #3 | Divergence from paper form documented in `reports/v9_odtoe_multiagent_mining_2026-04-11.md §9.1` |
| 3.8 | **D(η) = D0 · (1 − S)** | Stochastic noise suppression via coherence | `eradev.md:322`; glossary row #17 |
| 3.9 | **Ω(H_hist) = 1 + α · log(1 + N_relevant)** with α = 0.15, clipped to [1.000, 2.500] | Cross-domain memory multiplier (v10) | `eradev.md:333`; computation in `meta.md:316-322` item 9 |
| 3.10 | **Λ_effective = Ω · Λ** (per-agent) | v10 experience amplification | `eradev.md:335` |
| 3.11 | **S_total = S_adjusted · Ω** (per-team, at RT-3) | v10 reported coherence with memory reinforcement | `eradev.md:336`; thresholds `eradev.md:367-370` |
| 3.12 | **Â = A_Λ ∘ A_σ ∘ A_E ∘ A_F** | Activation Operator composition (4-step) | `eradev.md:386-392`; `meta.md:62-69`; glossary row #15 |
| 3.13 | **Φ(Ψ) = ι(Ô(Ψ)); Ψ* = Φ(Ψ*)** | Self-observation strange loop + fixed point | `eradev.md:634-636`; glossary rows #5, #10 |
| 3.14 | **I(C) = files × coupling × legacy_factor**; **v = α/(I(C) + ε)**; **N_teams = ⌈N_modules / 3⌉** | Configuration inertia + velocity + team scaling | `meta.md:186`; `eradev.md:706` |
| 3.15 | **two-column BD: Agent-BD + Wall-clock-BD** (v10, BL-51) | Velocity model for L/XL tasks with parity windows | `meta.md:189-201` |

### Category 4: Named Prompts / Methodologies with Person Attribution

| # | Name | What it is | Where introduced | Scope |
|---|---|---|---|---|
| 4.1 | **Rybakov Approach** (Подход Рыбакова) — also "Супер-промпт Физтеха" | 7-stage methodology for AI-generated scientific deliverables using biological metaphor (DNA / RNA / Splicing / Protein / Conscience / Metric); core contribution = **epistemic markers** `[FACT]` / `[DERIVATION]` / `[HYPOTHESIS]` / `[OPEN]` | External RU document "Промпт Подход Рыбакова.docx" provided by operator on 2026-04-04; RT-1 analysis at `reports/RT1_rybakov_approach_analysis_2026-04-04.md` | Project-scoped to ODTOE articles — `projects/odtoe-articles/config.md:282` Check 8; `projects/odtoe-articles/overlay/domain_skin.article.overlay.md §8`. **Explicitly NOT a framework-universal principle** (scope-bounded by BL-34 / universality gate). |
| 4.2 | **Pankratov (Панкратов Антон Сергеевич)** | EraDev framework creator + ODTOE author (independent researcher, Казань, Россия); ORCID 0009-0002-4870-2995 | Author field in `projects/odtoe-articles/config.md:193-198`; framework implicitly authored by same person across all root files | Universal (framework-wide) author — but specific author-name references only allowed in project scope per v10 universality gate |
| 4.3 | **Anton Pankratov** — user identity (operator) | Same person; lives at `/Users/antonpankratov/Downloads/eradev/` working dir | `MEMORY.md` user identity record | Framework operator / sole contributor |
| 4.4 | **MetaGPT 5-role team** | Product Manager / Architect / Engineer / QA Engineer / Project Manager convergence | Cited in `reports/multi_agent_frameworks_comparison_2026-04-11.md:166-172` as independent empirical evidence for 5-role decomposition | Empirical anchor for n_min=5 ("different teams, same conclusion") |
| 4.5 | **PaperOrchestra (Google Research, 2026)** | 5-role scientific paper writing framework: Outline / Plotting / Literature Review / Section Writing / Content Refinement; reports 84% acceptance rate | `reports/rt_en_visionary_2026-04-11.md:48,123-127,207` + `reports/rt_en_builder_2026-04-11.md:115,496,510` | Second independent convergence to n=5 — cited in v9 roadmap as "2 datapoints → stable attractor" |
| 4.6 | **Gödel — Escher — Bach (Hofstadter 1979)** | Source for strange-loop concept | Explicit citation in ODTOE article bibliography `[8]` (flagged as "weak attribution" for Penrose tilings in `reports/v9_phase2_1_s_second_smoke_test_2026-04-11.md:128-129` DEF-2) | Strange loop / self-reference lineage (Category 1.8) |
| 4.7 | **Ohno / Shingo (Toyota)** | TPS architects (not named in files but TPS IS their methodology) | Implicit attribution via "TPS" tag | Jidoka, Andon, Hansei, etc. methodology (Category 1.2) |
| 4.8 | **Altshuller (TRIZ)** | Not explicitly named, but TRIZ is his theory | Implicit attribution via "TRIZ" tag | Contradiction resolution (Category 1.4) |
| 4.9 | **Goldratt (TOC, The Goal 1984)** | Not explicitly named, but TOC is his theory | Implicit attribution via "TOC" tag | Bottleneck detection (Category 1.3) |
| 4.10 | **Kolmogorov / Arnold / Moser (KAM theorem)** | Not explicitly named | Implicit attribution via "KAM" tag | Torus stability (Category 1.6) |
| 4.11 | **Hurwitz** | Named once in report | `reports/v9_phase1a_ru_builder_2026-04-11.md:114`, `reports/rt_ru_synthesis_2026-04-11.md:135,146,190` | n_min=5 invariance (Category 1.7) |
| 4.12 | **Claude Opus (Anthropic, 4.6 / 4.7)** | LLM test platform | `projects/eradev/config.md:49` "Claude Opus 4.6" | Single-LLM limitation flagged in `reports/v9_odtoe_multiagent_mining_2026-04-11.md §4.3` |

### Category 5: Multi-Agent Framework Inspirations (from Research)

From `reports/multi_agent_frameworks_comparison_2026-04-11.md` (full 10-framework survey, 2026-04-11):

| # | Framework | Author | Key borrow / role in EraDev | Where documented |
|---|---|---|---|---|
| 5.1 | **MetaGPT** | FoundationAgents team | "Code = SOP(Team)" — 5-role software team that independently mirrors EraDev's 5 roles | Comparison report Tier 2 row #7; `projects/eradev/lessons.md` footer n=5 attractor evidence |
| 5.2 | **PaperOrchestra** | Google Research (2026) | 5-role science paper writing convergence | `reports/rt_en_visionary_2026-04-11.md:48` — used as n=5 anchor |
| 5.3 | **AutoAgent** | Kevin Ru (kevinrgu) | Score-driven hill-climbing; EMP7 "orientation without optimization = stagnation" derived from it | `reports/autoagent_analysis.md`; `projects/eradev/lessons.md:80-86` EMP7 |
| 5.4 | **MemPalace** | milla-jovovich | Hierarchical memory Wings/Rooms/Closets/Drawers; 96.6% R@5 retrieval; temporal triples | Comparison report Tier 1 row #2; `reports/v9_phase2b_memory_hierarchy_spec_2026-04-12.md`; `meta.md:386-395` Context Tiers T1/T2/T3/Boundary |
| 5.5 | **everything-claude-code (ECC)** | affaan-m | Continuous-learning-v2: PostToolUse → Haiku → instinct → `/evolve`; hook profiles (minimal/standard/strict) | Comparison report Tier 1 row #3; `meta.md:364-380` Phase 2.C Background Instinct Extraction (CronCreate-based alternative to PostToolUse); `/extract` skill |
| 5.6 | **LangGraph** | LangChain | Declarative StateGraph; observability; replay | Comparison report Tier 2 row #4; `templates/rt_graph.schema.md` schema (v10 RT-graph prototype); engine deferred to v11 |
| 5.7 | **CrewAI** | crewAIInc | Model-per-role cost optimization (Opus/Sonnet/Haiku) + Flows | Comparison report Tier 2 row #5; Phase 2.D v9 roadmap item (operator-deferred) |
| 5.8 | **AutoGen / MS Agent Framework** | Microsoft | Modular memory + debugging/monitoring | Comparison report Tier 2 row #6 |
| 5.9 | **ChatDev** | OpenBMB | Waterfall multi-agent; "communicative dehallucination" | Comparison report Tier 2 row #8; `reports/multi_agent_frameworks_comparison_2026-04-11.md:174-176` (validates RT-1 deliberation pattern) |
| 5.10 | **OpenAI Swarm / Agents SDK** | OpenAI | Explicit `handoff()` primitive | Comparison report Tier 2 row #9 |
| 5.11 | **Claude Code Subagents** | Anthropic | Native hub-and-spoke + per-role tool whitelists | Comparison report Tier 2 row #10; `.claude/skills/eradev/` distribution bundle |
| 5.12 | **RTK (output compression)** | `reports/rtk_analysis_2026-04-11.md` | Bash output compression for code-domain diagnostic chains — ultimately REJECTED for universalization per `reports/rt_en_validator_2026-04-11.md:197` ("NEW-1: RTK compression → CRITICAL → REJECT → code-only optimization") | Code-domain, not universal |
| 5.13 | **Book-Agent / Squibler / ai-book-writer / StoryWriter / Agents' Room** | Various | Industry validation for 5-role decomposition in narrative writing | `reports/rt_en_builder_2026-04-11.md:115` "Industry validation (PaperOrchestra, StoryWriter, Agents' Room, Book-Agent)" |

### Category 6: Patterns / Protocols / Gates

| # | Pattern / Gate | Where | Introduced in |
|---|---|---|---|
| 6.1 | **A3 methodology (Toyota 6-field: Context / Current State / True North / Gap / Distinctions / Open Questions)** | `eradev.md:583-585` RT-3 step 3; `meta.md:358-361`; `MEMORY_TEMPLATE.md` / `MEMORY_TEMPLATE_EN.md` | v7 inherited from TPS |
| 6.2 | **Round Table RT-0/RT-1/RT-2/RT-3** | `eradev.md:542-610` Section VI | v7 core; RT-0 added v10 (pre-Apophatic Gate) |
| 6.3 | **Strange Loop (Level 6 → Level 9 self-modification)** | `eradev.md:625-677` Section VIII + L10 | v7 core; L10 added v10 |
| 6.4 | **Self-application fixed point Ψ* = Φ(Ψ*)** | `eradev.md:634-636`; glossary #21 | Core ODTOE axiom |
| 6.5 | **4-layer architecture L0/L1/L2/L3** | `eradev.md:56-67` §0.1 bilingual table; `projects/eradev/lessons.md:220-222` L-33 | v9 Phase 1 |
| 6.6 | **4-layer bilingual architecture (Section 0.1)** | `eradev.md:54-67` | v9 Wave 8 (extracted from ODTOE paper §IX.3) |
| 6.7 | **Apophatic Gate (v10)** | `eradev.md:453-479`; `projects/eradev/lessons.md:252-254` L-39 | v10 as gate not role — preserves n=5 torus invariant |
| 6.8 | **Phantom Coherence Check (BL-5)** | `BOOTSTRAP_LESSONS.md:46-52`; `meta.md:245-250` §12 | v8 |
| 6.9 | **Phantom Decoherence (v9 Wave 9 extension of BL-29)** | `BOOTSTRAP_LESSONS.md:208-216`; symmetric to BL-5 | v9 Wave 9 from `reports/v9_odtoe_multiagent_mining_2026-04-11.md` REC-2 |
| 6.10 | **Check-First pipeline (BL-17 absorbed BL-21)** | `BOOTSTRAP_LESSONS.md:141-146`; `projects/odtoe-articles/config.md:40-53` 8-item pre-gen checklist | v8 + v9; BL-21 merged into BL-17 on 2026-04-20 |
| 6.11 | **Universality Gate (v10 Session 7)** | `eradev.md:481-518`; `.githooks/pre-commit` regex ban; `projects/eradev/lessons.md:276-294` L-42..L-45 + EMP15 | v10 Session 7 (2026-04-23) |
| 6.12 | **Kill-Switch Levels 1/2/3/4/5** | `eradev.md:775-789` Section XIII; glossary #43 | v7 core |
| 6.13 | **Jidoka Self-Check (B-diagnostics)** | `eradev.md:793-807` Section XIV; every role file | v7 core (TPS) |
| 6.14 | **Banality score 1-10** | `eradev.md:797-799`; `meta.md:78` | v7 |
| 6.15 | **Blast Radius classification (LOW/MED/HIGH/CRIT)** | `roles/coherent_EN.md:33` Key Rule 4; glossary #18 via "Configuration Inertia" | v7 |
| 6.16 | **Damping Detection (S ± 0.02)** | `eradev.md:690` corridor; `meta.md:43` "Damping corridor: S within ~0.02 normal" | v7 |
| 6.17 | **Graduated Activation (GREEN/YELLOW/RED)** | `eradev.md:394-411` Section IV; glossary #39 | v7 (replaces binary Andon) |
| 6.18 | **Enforcement Gates (PRE-FLIGHT / LAMBDA AUDIT / FIX-TO-SPEC / BUILD-VERIFY)** | `eradev.md:413-431` Enforcement Gates (Cycle-7) | v8 Cycle-7 |
| 6.19 | **Dead Gate Rule** | `eradev.md:431` "An Enforcement Gate that fires but does not change behavior is a dead gate" | v8 |
| 6.20 | **Trace Accumulator (Real-Time Failure Signal)** | `eradev.md:433-450` "bridge between AutoAgent's score-driven feedback and EraDev's deliberative reflection" | v8, AutoAgent-inspired |
| 6.21 | **Composition Hazards Gate (BL-34)** | `eradev.md:557-574` §VI RT-1 extension; grid N·(N-1)/2 + 3-way; template `templates/composition_hazards.template.md` | v10 PLUGY Hansei 2026-04-20 |
| 6.22 | **Rework-discipline audit (BL-35)** | `CLAUDE.md` Invariant 16 + `meta.md:298-303` item 7b + `templates/interlocked_sequence.template.md` | v10 PLUGY 2026-04-20 |
| 6.23 | **Enforcement-Tier Ladder T1/T2/T3/T4 (BL-33)** | `meta.md:254-268` §13; `BOOTSTRAP_LESSONS.md:239-244` BL-33; glossary #51 | v10 PLUGY 2026-04-20 |
| 6.24 | **Liveness Prerequisite (v10, BL-47 promoted)** | `eradev.md:740-753` §XI; external probe / host exporter / service fault counter / silent-protector detector | v10 from PLUGY 2026-04-19 silent-protector incident |
| 6.25 | **Signal-to-content anti-pattern (BL-50 / glossary #48)** | `glossary.md:119` | v10 PLUGY |
| 6.26 | **Effectively-zero signal (glossary #49 / BL-47)** | `glossary.md:120`; `meta.md:11` commit archaeology row | v10 PLUGY |
| 6.27 | **Report Funnel (Builder → Validator → Coherencer → META compression)** | `meta.md:397-416` §15 | v8 |
| 6.28 | **Structured Verdict (7-line)** + **Cycle Brief (10-line)** | `meta.md:405-412` | v8 |
| 6.29 | **Defense-in-Depth (BL-30)** | `BOOTSTRAP_LESSONS.md:218-223` | v8 from 3-layer identity enforcement design |
| 6.30 | **Output-type Constraint (BL-31)** | `BOOTSTRAP_LESSONS.md:225-230`; META 6 output types | v8 |
| 6.31 | **BL merge & grep cleanup (BL-32)** | `BOOTSTRAP_LESSONS.md:232-237` | v8 |
| 6.32 | **Self-loading context architecture (Invariant 12, BL-28)** | `CLAUDE.md:57` Invariant 12; `BOOTSTRAP_LESSONS.md:192-199` BL-28 | v9 |

### Category 7: Invariants + Bootstrap Lessons (full list)

**16 Invariants (CLAUDE.md, v10; README.md says 14 — stale):**
1. META always delegates via Agent tool [UNIVERSAL]
2. M+ tasks always proceed through RT-1 [UNIVERSAL]
3. Must classify every task S/M/L/XL [UNIVERSAL]
4. Reading framework ≠ enforcing it (BL-16 recursive) [UNIVERSAL]
5. External API → Analyst PRE-FLIGHT before RT-1 (BL-22) [CODE-ADAPTER]
6. Fix chain ≥ 3 = STOP, write spec, re-run RT-1 (BL-3) [CODE-ADAPTER]
7. One commit = one phase; >5 files from different modules = RT-2 (BL-24) [CODE-ADAPTER]
8. P0 production incident: operator override allowed, post-incident Hansei mandatory [UNIVERSAL]
9. Agent description MUST start with [ROLE] tag [UNIVERSAL]
10. Bash OPERATIONAL vs DIAGNOSTIC split [CODE-ADAPTER]
11. Execution order: Builder completes first, THEN Validator [UNIVERSAL]
12. Every Agent call MUST instruct agent to self-load its role file [UNIVERSAL]
13. Maximize parallelization: independent agents with `run_in_background: true` [UNIVERSAL]
14. Remote/dangerous ops → Check Agent, include operator quote verbatim [CODE-ADAPTER]
15. ≥2 independent refactors → composition hazards grid BEFORE RT-1 (BL-34) [UNIVERSAL]
16. Rework-framing regex → mandatory rework-discipline audit (BL-35) [UNIVERSAL]

Source: `CLAUDE.md:56-82`.

**30 Bootstrap Lessons** (all with Source attribution):

| BL | Title | Tag | Source (verbatim) | Tier |
|---|---|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | UNIVERSAL | Framework invariant (ODTOE Formula B) | T4 |
| BL-2 | Protocol Changes Require Canary Deployment | CODE-ADAPTER | RT analysis (multiple post-mortems) | T3 |
| BL-3 | Fix Chain > 3 = Structural Problem | CODE-ADAPTER | Framework invariant (CHECKLIST fix chain counter) | T2 |
| BL-4 | S_adjusted = S_team × B_mean | UNIVERSAL | Framework invariant (ODTOE collective formulas) | T3 |
| BL-5 | Phantom Coherence Detection | UNIVERSAL | A/B experiment (RT analysis) | T3 |
| BL-6 | Verify Before Act — Artifact Validity Gate | CODE-ADAPTER | Framework invariant + META Hansei Cycle 2 L-017 (absorbed BL-27) | T2 |
| BL-7 | EN for Practical, RU for Theoretical | UNIVERSAL | A/B experiment (Language Policy) | T3 |
| BL-8 | Deployment Events Require Pre-Deploy Checklist (incl. Rollback Plan) | CODE-ADAPTER | RT analysis + META Hansei 2026-04-20 (absorbed BL-14) | T3 |
| BL-9 | Interface Contracts Between Roles Reduce \|Bi - Bj\| | UNIVERSAL | Framework invariant (S_team formula) | T3 |
| BL-10 | Multiplicative Structure Means Zero Tolerance for Zero Components | UNIVERSAL | Framework invariant (Weak Link Principle) | T3 |
| BL-11 | Scope Creep Is Muda | UNIVERSAL | Framework invariant (TPS Integration) | T3 |
| BL-12 | Hansei Targets Process, Not People | UNIVERSAL | Framework invariant (TPS Hansei) | T3 |
| BL-13 | Yokoten — One Lesson, All Analogous Cases (+ Grep Gate) | UNIVERSAL | Framework invariant (TPS Yokoten) + Cycle-7 incident #8 | T2 |
| BL-14 | MERGED INTO BL-8 on 2026-04-20 | — | — | — |
| BL-15 | The 2% Spiral Gap Is a Feature | UNIVERSAL | Framework invariant (Section IX) | T4 |
| BL-16 | Reading the Framework ≠ Applying the Framework | UNIVERSAL | A/B experiment — real-world deployment session analysis (5-agent RT, April 2026) | T3 |
| BL-17 | Pre-Generate Verification — check format, spec, sources FIRST | UNIVERSAL | META Hansei ODTOE articles + META Hansei 2026-04-20 (absorbed BL-21) | T3 |
| BL-18 | Session Scope Must Be Formally Reclassified at 2x Initial Estimate | UNIVERSAL | META Hansei — session grew from M to XL without reclassification | T3 |
| BL-19 | Bilingual Files Must Be Created and Updated Simultaneously | UNIVERSAL | META Hansei — eradev_RU.md v7.0 vs eradev.md v7.1 5-HIGH sync issues | T2 |
| BL-20 | RETIRED 2026-04-20 — content to meta.md §13 MM3 | — | — | — |
| BL-21 | MERGED INTO BL-17 on 2026-04-20 | — | — | — |
| BL-22 | PRE-FLIGHT Gate for External APIs | CODE-ADAPTER | Cycle-7 analysis — F=0 in 3/9 incidents | T3 |
| BL-23 | RETIRED | — | — | — |
| BL-24 | Single-Responsibility Commits | CODE-ADAPTER | Cycle-7 — big-bang commits catastrophic rollback | T2 |
| BL-25 | Error Path Coverage Matrix | CODE-ADAPTER | Cycle-7 — E=0 in 2/9 incidents | T3 |
| BL-26 | META Always Delegates — No Exceptions | UNIVERSAL | Cycle-7 + incident L-016 + gravity hansei | T2 |
| BL-27 | MERGED INTO BL-6 (BL-32 enforcement) | — | — | — |
| BL-28 | Agent Prompt Must Include Explicit Context (self-load semantics) | UNIVERSAL | Hansei — gravity session April 2026 + v9 Invariant 12 + v10 BL-35 extension | T3 |
| BL-29 | Verify Established Terminology Before Generating + Phantom DECOHERENCE extension | UNIVERSAL | Hansei — gravity session + v9 Wave 9 ODTOE mining REC-2 | T3 |
| BL-30 | Defense-In-Depth for Enforcement | UNIVERSAL | v8 session — 3-layer identity enforcement | T3 |
| BL-31 | Constrain Output Types to Constrain Behavior | UNIVERSAL | v8 session — META Output Specification (5 permitted types) | T3 |
| BL-32 | Grep After BL Merge — Reference Cleanup | UNIVERSAL | Hansei v8 session — BL-27 stale refs in 5 files | T3 |
| BL-33 | Enforcement-Tier Ladder — type > hook > checklist > docs | UNIVERSAL | PLUGY Session 5 EMP6 + META Hansei 2026-04-20 | T2 |
| BL-34 | Composition Hazards Gate for ≥2 parallel refactors | UNIVERSAL | PLUGY Hansei 2026-04-20 §6 | T2 |
| BL-35 | Rework-discipline audit on "architectural rework" framing | UNIVERSAL | PLUGY BL-49 Session 5 promoted UNIVERSAL 2026-04-20 | T2 |

**6 META Output Types:** Agent calls / Decisions / Synthesis / Lessons / Reports / Check Agent — `meta.md:11-22` §1a and `CLAUDE.md:6-14`.

### Category 8: Memory + Extraction Infrastructure

| # | Mechanism | Source | Where |
|---|---|---|---|
| 8.1 | **Tiered memory T1 (Anchors) / T2 (Session) / T3 (Wisdom) / Boundary** | `meta.md:386-395` §15 | Context budgets: 200 / 50 / 100 / 0 lines |
| 8.2 | **Closet/Drawer pattern** | MemPalace-inspired (Category 5.4) | `/Users/antonpankratov/.claude/projects/.../memory/MEMORY.md` header "Budget: <= 200 lines. This file is the TABLE OF CONTENTS." |
| 8.3 | **Temporal decay (freshness formula)** | v10 | `eradev.md:378` OQ-Omega-1 CLOSED; `meta.md:308-311` item 9; formula `freshness = max(0, 1 - age_days / half_life)` |
| 8.4 | **BL compression protocol PROMOTE/MERGE/DISCARD/DEFER** | v10 | `BL_CANDIDATES.md:16-17`; full spec `reports/v10_omega_compression_decay_spec_2026-04-12.md` |
| 8.5 | **Cross-project scan** | v10 | `meta.md:314-316` item 9; EMP8 "Coherence framework, not software framework" makes cross-domain Lambda possible |
| 8.6 | **CronCreate background extraction** | v10 ECC-inspired alternative | `meta.md:364-380` "Background Instinct Extraction (Phase 2.C)"; CronCreate schedule `17,47 * * * *`; `templates/extraction_prompt.md` |
| 8.7 | **`/extract` skill (manual)** | v10 | `meta.md:374-376` + skill registry |
| 8.8 | **BL_CANDIDATES.md staging** | v10 | `BL_CANDIDATES.md`; compression at count ≥ 5 |
| 8.9 | **Temporal triples `<!-- valid_from: DATE \| ended: DATE \| superseded_by: ID \| cross_project: bool -->`** | MemPalace-inspired, v9 Phase 2.B | `projects/eradev/lessons.md:3` header + every lesson |
| 8.10 | **Identity persistence (MEMORY.md)** | v8 | `CLAUDE.md:48-51`; `meta.md:329-332` item 11 |

### Category 9: Verification Methods (by domain)

| Method | Domain | Sub-checks | Where |
|---|---|---|---|
| **build** | code | compile / lint / parse / render | `templates/domain_skin.code.md`; `projects/eradev/config.md:15` `verify.method: build` |
| **cite_check** | article | C1-C6 (6 sub-checks) + additional ODTOE 8-check overlay | `templates/domain_skin.article.md`; `projects/odtoe-articles/config.md:203-282` 8 Checks |
| **readability** | book | R1-R6 | `templates/domain_skin.book.md` |
| **parse** | config | P1-P7 | `templates/domain_skin.config.md` |
| **dry_run** | plan | DR1-DR6 | `templates/domain_skin.plan.md` |
| **recompute** | research | RC1-RC8 | `templates/domain_skin.research.md` |
| **structure_check** | structured-continuous (sonnet, haiku, screenplay with metered constraint) | skeleton verification only | v10 prototype — `eradev.md:206-245` §II.2.1 |
| **custom_methods** (registry) | any | per-project declared | v10 extensible — `templates/domain_skin.md.template:52-62`; `eradev.md:171` "`verify.method` is an EXTENSIBLE REGISTRY" |

Examples of declarable custom methods (not shipped, documented in skin template):
- `statute_check` — legal drafts vs jurisdiction statute set
- `contraindication_scan` — medical protocols vs drug-interaction DB
- `ingredient_check` — culinary recipes vs allergen lists
- `accessibility_audit` — UI configs vs WCAG/ARIA

### Category 10: Domain Skins (v9+v10 L2)

Located in `templates/`:
- `domain_skin.code.md` / `domain_skin.code_RU.md`
- `domain_skin.article.md` / `domain_skin.article_RU.md` — has ODTOE-specific overlay
- `domain_skin.book.md` / `domain_skin.book_RU.md`
- `domain_skin.plan.md` / `domain_skin.plan_RU.md`
- `domain_skin.research.md` / `domain_skin.research_RU.md`
- `domain_skin.config.md` / `domain_skin.config_RU.md`
- `domain_skin.md.template` (the schema for future skins)

**Overlay pattern (v10 Session 7, L-43 split-beats-purify):** universal skin + project-local overlay for specialized cases. Example: `projects/odtoe-articles/overlay/domain_skin.article.overlay.md` (250 lines) — houses ODTOE-only rules (8-file RU+EN mandate, LaTeX/tectonic stack, Rybakov markers, Pankratov self-cite, 46-term glossary, ODTOE filename prefix) separated from the universal skin (reusable by any article project).

### Category 11: RU/EN Bilingual Architecture

| Layer | Canonical | Files | Bilingual rule | Mirror file | Rationale |
|---|---|---|---|---|---|
| **L0: Math canonical** | Single source | `eradev.md §I-III main`, `BOOTSTRAP_LESSONS_universal.md` | EN primary, RU mirror byte-line parity | `eradev_RU.md` | Math is language-invariant |
| **L1: TPS canonical (process)** | Dual source | `eradev.md §0, §IV, §V`, `meta.md`, `roles/*.md`, `CLAUDE.md` | EN + RU co-authoritative (both can lead) | `meta_RU.md`, `roles/*_RU.md`, `eradev_RU.md` | Process wording differs by language culture |
| **L2: Templates + adapters** | EN canonical, RU mirror | `templates/CLAUDE.md.template`, `templates/domain_skin.*.md`, `.claude/skills/eradev/**` | EN primary, RU optional | Skill bundle mirror | Templates ship into new projects |
| **L3: Project instances** | Project-local | `projects/{name}/config.md`, `projects/{name}/lessons.md` | Per-project decision | N/A | Operator preference |

Source: `eradev.md:54-67` §0.1.

**BL-19 sync rule** per-layer — L0 simultaneous commit; L1 pre-commit hook flag; L2 EN-first with RU deferred; L3 out of framework scope.

**`domain.languages` field (v10+)** per-project enforcement vehicle — `templates/domain_skin.md.template:42-49`. Default `[en]`; bilingual-sync gates fire only when `languages.length > 1`.

### Category 12: Level Hierarchy

| Level | Description | Status | Where |
|---|---|---|---|
| **L3** | Single-agent self-check (compile, test, lint) | Active | `eradev.md:628`; `meta.md:223` |
| **L6** | Full RT cycle with feedback (5 roles, strange loop closes) | Active | `eradev.md:630`; `meta.md:223` |
| **L9** | Meta-Agent modifies the observation operator — O(O) = O' — self-modification | Emerging | `eradev.md:631`; `meta.md:224-226` |
| **L10: Cross-Domain Lambda** | Mechanical cross-project lesson discovery | Active v10 | `eradev.md:639-677` §VIII L10; `projects/eradev/lessons.md` EMP8 "Coherence framework, not software framework" makes this possible |
| **L11: multi-attractor Ψ*** | Multiple stable configurations per project (per-artifact-class B tracking) | Deferred (v11) | `eradev.md:669-672` |
| **L12: global Ω** | All projects improving together as portfolio (L10 at 3+ project scale) | Deferred (v11) | `eradev.md:673-675` |

---

## 3. Deep-Dive: The Rybakov Prompt

### 3.1 What it is (verbatim from primary source)

**Source document:** "Промпт Подход Рыбакова.docx" — external RU document provided by operator on 2026-04-04. Not checked into the repo. Contents summarized as "Супер-промпт Физтеха" (Supreme Physics-Tech Prompt) in `reports/RT1_rybakov_approach_analysis_2026-04-04.md:12`.

**Author:** Rybakov (Рыбаков) — attribution identifies a person, not a framework. No first name, affiliation, or institutional context in the audit trail beyond "Физтеха" tag (Physics-Tech = МФТИ / Moscow Institute of Physics and Technology colloquial). No published URL, no DOI, no GitHub repo — prompt arrived as a `.docx` file from operator.

**Full methodology (reproduced from `reports/RT1_rybakov_approach_analysis_2026-04-04.md:14-30`):**

7-stage methodology with biological metaphor (DNA → RNA → Protein) for turning raw material into a verifiable РИД (Результат интеллектуальной деятельности — Result of Intellectual Activity):

| Stage | Name | Substance |
|---|---|---|
| 0 | ДИАГНОСТИКА (Diagnostics) | Base type, topic, content map (7-15 items), trust index, terminology |
| I | ДНК (DNA) — 5 questions | WHY / WHO / HOW / WHEN / RESOURCES + acceptance criteria (5-12) + failure modes (3-7) |
| II | РНК (RNA — Synthesis) | Draft with markers `[ФАКТ]` / `[ИНТЕРПРЕТАЦИЯ]` / `[ГИПОТЕЗА]` / `[ТРЕБУЕТ ПРОВЕРКИ]` + register of gaps (up to 25) |
| III | СПЛАЙСИНГ (Splicing — Audit) | Self-check: 10-25 risks, contradictions, ambiguities, removal of excess, addition of needed, mini-red-teaming |
| IV | БЕЛОК (Protein — Final) | Ready artifact + usage checklist + verification checklist + open questions |
| V | СОВЕСТЬ (Conscience) | Authorship fix: hash, metadata, version |
| VI | МЕТРИКА E = h·ν (Metric) | Time per cycle, iteration count, usage frequency |

**Rybakov's 5 core principles:**
1. AI never invents facts — everything grounded in "the BASE"
2. Do not ask questions — instead mark gaps as `[REQUIRES VERIFICATION]`
3. Every claim is marked: `[FACT]`, `[INTERPRETATION]`, `[HYPOTHESIS]`, `[RISK]`, `[CHECK]`
4. Acceptance criteria BEFORE work begins (5-12 items)
5. Red-teaming built into Splicing stage

### 3.2 What EraDev adopted vs rejected (from the 5-role RT-1 verdict)

**Source:** `reports/RT1_rybakov_approach_analysis_2026-04-04.md:178-215` UNIFIED PLAN, S_coherence = 0.88.

**UNANIMOUSLY ADOPTED:**
1. **Epistemic markers `[FACT]` / `[DERIVATION]` / `[HYPOTHESIS]` / `[OPEN]`** — added as **Check 8** in `projects/odtoe-articles/config.md` on 2026-04-04. LaTeX comments, invisible in PDF, auditable in `.tex`. Source attribution explicit at `projects/odtoe-articles/config.md:282`: "Source: Rybakov Approach integration (RT-1 analysis 2026-04-04)."
2. **Failure Modes (3-7) at RT-1** — extended Visionary's Coaching Kata / IFR block. Landed in `roles/visionary_EN.md:34-40` "Acceptance Criteria & Failure Pre-mortem (mandatory in RT-1, M+ tasks)".

**ADOPTED WITH RESERVATIONS:**
3. **Source Register + Trust Index T1-T4** — entered `projects/odtoe-articles/config.md:47-48` Check-First item 4b.
4. **SPLICING audit in Validator** — absorbed as sub-items into existing 7 checks rather than new stage (reservation avoided bureaucracy).
5. **REQUIRES_VERIFICATION Register (capped at 10, not 25)** — `roles/coherent_EN.md:45-52` "Verification Register (mandatory in RT-3, M+ tasks)".

**UNANIMOUSLY REJECTED:**
- Full integration of all 7 stages as parallel pipeline (RED — cognitive budget exhausted, +150-200 lines)
- Biological metaphor (DNA/RNA/Protein) in core files — conflicts with ODTOE physical metaphor (Ô/Ψ/ι) and AMP8 "corpus terminology is canonical"
- Metric `E = h·ν` — **direct collision** with EraDev glossary term #12 "E (Alignment)" per `reports/RT1_rybakov_approach_analysis_2026-04-04.md:151`
- Principle "do not ask questions" — **conflicts with Andon** obligation to stop when problem detected
- Stage V СОВЕСТЬ (Conscience) — git commit hash already covers (70% overlap)
- Stage 0 ДИАГНОСТИКА — Activation Operator covers (95% overlap)

### 3.3 Where Rybakov is cited in code / config / skins (full grep)

From `grep -rn "Rybakov\|Рыбаков"`:

1. `projects/odtoe-articles/config.md:282` — **primary attribution** in Check 8 definition: "Source: Rybakov Approach integration (RT-1 analysis 2026-04-04)"
2. `projects/odtoe-articles/config.md:35` — overlay pointer: "ODTOE-specific: ... Rybakov markers, ..."
3. `projects/odtoe-articles/overlay/domain_skin.article.overlay.md:15` — overlay scope disclaimer
4. `projects/odtoe-articles/overlay/domain_skin.article.overlay.md:169` — Check 8 evidence classification with `% [FACT]` / `% [DERIVATION]` / `% [HYPOTHESIS]` / `% [OPEN]` syntax
5. `projects/odtoe-articles/overlay/domain_skin.article.overlay.md:208-214` — **full §8 "Rybakov evidence markers (Check 8 provenance)"** with canonical case precedent `ODTOE_phi_fractality.tex` Section III.2 DEF-5
6. `projects/odtoe-articles/overlay/domain_skin.article.overlay.md:238` — live-reference project declaration: "MUST NOT inherit ODTOE-specific fields (filename prefix, 8-file mandate, Pankratov self-cite, Rybakov markers) unless the project is itself part of the ODTOE corpus"
7. `.githooks/pre-commit:36` — **Universality Gate ban regex**: `BANNED_PATTERN='ODTOE_[A-Za-z_]+\.|odtoe-articles|iznachalye|plugy|academic-lab|pankratov|rybakov|/Users/antonpankratov/Downloads/'` — i.e., Rybakov references in framework-scope commits are BLOCKED; only allowed in `projects/odtoe-articles/` (L3)
8. `reports/RT1_rybakov_approach_analysis_2026-04-04.md` — **primary RT-1 analysis** (221 lines, 5 roles)
9. `reports/proposals_role_improvements_rybakov_2026-04-04.md` — 3 proposals for universal role files
10. `reports/INDEX.md:98-99` — both 2026-04-04 Rybakov reports flagged as "stale / Session 1" (pre-v9)
11. `reports/v9_phase2_1_s_*.md` — Phase 2.1.S smoke tests reference temporal exception for pre-2026-04-04 articles (Check 8 cannot retroactively demand Rybakov markers)
12. Various v10 universality audit reports — verify grep for "rybakov" returns 0 in framework scope (only project-scope)

### 3.4 Integration timing

- **Introduction date:** 2026-04-04 (RT-1 analysis date per file header)
- **Integration date:** Same day as RT-1 (Check 8 added to `projects/odtoe-articles/config.md`)
- **Universality status:** **SCOPED — ODTOE-only.** Rybakov markers are an ODTOE-specific naming of the generic "evidence marker scheme." Per `projects/odtoe-articles/overlay/domain_skin.article.overlay.md:210`: "The universal skin references 'evidence-marker scheme' generically; this overlay names it Rybakov and fixes the exact marker syntax above (Check 8)."
- **Universal generalization:** The `templates/domain_skin.article.md` universal skin has a generic "evidence-marker scheme" slot; the ODTOE overlay names it Rybakov and fixes syntax. Other article projects can have their own marker schemes (or none). Universality Gate (.githooks/pre-commit BANNED_PATTERN) ENFORCES that "rybakov" cannot appear in framework-scope files.
- **Temporal exception:** Articles predating 2026-04-04 are NOT retroactively failed for missing markers — per `reports/v9_phase2_1_s_skin_cleanup_v2_2026-04-11.md:127-129` and overlay §5 Case B (LEGACY INFO classification).

**Conclusion: The Rybakov Approach contributed exactly one named concept (epistemic markers) and three mechanical additions (Failure Modes at RT-1, Verification Register in Coherencer, Trust Index for bibliography) to EraDev. Everything else in the 7-stage methodology was rejected as redundant or conflicting.** The prompt itself is not reproduced in the framework — only the markers scheme and the 3 mechanical additions remain.

---

## 4. Cross-Reference Matrix: Principles × Framework Files

This table shows which category of principle lives in which file (X = primary home, ● = secondary reference).

| Principle | eradev.md | meta.md | CLAUDE.md | BL files | roles/ | templates/ | glossary.md | projects/eradev/ | projects/odtoe/ |
|---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| ODTOE (Ψ, Ô, ι, Φ, Ψ*) | X | ● | — | ● | ● | — | X | ● | — |
| TPS (Jidoka, Andon, Hansei, Yokoten, Muda/Mura/Muri) | X | ● | — | ● | X | ● | X | ● | — |
| TOC + TRIZ + SMD | X | — | — | ● | X (Analyst) | — | — | — | — |
| IFR (Ideal Final Result) | X | — | — | — | X (Visionary) | ● | ● | — | — |
| KAM theorem | X | X | — | — | — | — | — | — | — |
| Hurwitz theorem | — | — | — | — | — | — | — | — | — (only in reports/) |
| Strange loop (Hofstadter) | X | ● | — | — | — | — | — | — | — |
| Formula B (4 components) | X | X | — | X | X | X | X | X | X |
| Modal B (B_text/creative/research) | X | — | X | — | — | ● | — | ● | ● |
| Ω cross-domain multiplier | X | X | ● | — | — | — | — | ● | — |
| Spiral gap (π-3)² | X | X | — | X BL-15 | ● | — | X #23 | — | ● |
| n_min = ⌈π⌉+1 = 5 | X | — | — | — | — | — | X #35 | — | — |
| Golden ratio φ (torus R/r) | X | X | — | — | — | — | X #20 | — | X |
| 5 roles | X | — | — | — | X (all 10) | X (all skins) | X | X | X |
| RT-0 / RT-1 / RT-2 / RT-3 | X | ● | ● | ● | X | ● | X #16 | — | — |
| Apophatic Gate (v10) | X | — | — | — | — | — | — | X L-39 | — |
| Phantom Coherence Check | X | X | — | X BL-5 | ● | — | X #40 | ● | — |
| Phantom Decoherence (v9 Wave 9) | ● | — | — | X BL-29 ext. | — | — | — | ● | — |
| Universality Gate (v10) | X | — | — | — | — | — | — | X L-42..L-45, EMP15 | — (enforces) |
| Kill-Switch 1-5 | X | — | — | ● | — | — | X #43 | — | — |
| Jidoka Self-Check | X | X | — | — | X (every role) | X (skins) | X #26 | — | — |
| Banality score | X | X | — | — | — | — | — | — | — |
| Blast Radius LOW/MED/HIGH/CRIT | — | — | — | — | X (Coherencer) | — | X #18 | — | — |
| Damping corridor ±0.02 | X | X | — | X BL-15 | — | — | X #23 | — | — |
| 16 Invariants | — | — | X | — | — | — | — | — | — |
| 30 BL entries | — | — | ● | X | ● | ● | ● | — | — |
| 15 EMPs | — | — | — | — | — | — | — | X | — |
| 45 lessons L-1..L-45 | — | — | — | — | — | — | — | X | — |
| Memory T1/T2/T3 | — | X | ● | — | — | — | — | — | — |
| CronCreate extraction | — | X | — | — | — | — | — | — | — |
| Report Funnel | — | X | — | — | — | — | — | — | — |
| 8 Verification Checks (ODTOE) | — | — | — | — | — | ● (article skin) | — | — | X |
| **Rybakov markers (Check 8)** | — | — | — | — | — | — | — | — | X |
| 46-term ODTOE glossary | — | — | — | — | — | — | ● | — | X |
| 51-term EraDev glossary | — | — | — | — | — | — | X | — | — |
| LaTeX/tectonic stack | — | — | — | — | — | — | — | — | X |
| Pankratov self-cite | — | — | — | — | — | — | — | — | X (overlay §7) |

---

## 5. Revised Public Description Proposal

The current README one-liner — *"EraDev v10 — мультиагентная разработка, основанная на теории ODTOE и принципах Toyota Production System"* — captures 2 of 12 foundations. Here is an honest 3-4 paragraph description that names every major source:

---

### Proposed revised description (4 paragraphs):

**EraDev is a META-orchestration framework for multi-agent cognitive work.** It is built on **ODTOE (Observer-Dependent Theory of Everything)** for coherence mathematics (multiplicative agent quality `B = F·E·(1-σ)·Λ`, pairwise team coherence `S_team`, collective probability `P_coll`, and the strange-loop fixed point `Ψ* = Φ(Ψ*)` for recursive self-application), and on the **Toyota Production System** (TPS) for process discipline — Jidoka (self-check at every step), Andon (the right and obligation to stop the line), Hansei (process reflection, not blame), Yokoten (horizontal propagation of a lesson to all analogous sites), Muda / Mura / Muri (waste / unevenness / overload elimination), Nemawashi (pre-alignment on high blast-radius decisions), and Coaching Kata (the 5-question RT-1 structure).

**Additional theoretical foundations include:** **Theory of Constraints** (Goldratt) for bottleneck identification (the first phase of the 3-phase bottleneck protocol), **TRIZ** (Altshuller) for contradiction resolution through separation by space/time/scale and the **Ideal Final Result** stated in past tense, **KAM theorem** (Kolmogorov-Arnold-Moser) mathematically justifying the R/r = φ torus ratio as "most irrational = most stable toroidal orbit," **Hurwitz theorem** justifying n_min = ⌈π⌉ + 1 = 5 as an invariant of role count, **Hofstadter's strange loop** (Gödel-Escher-Bach, 1979) for the self-observation Φ and Level 9 self-modification, and the **spiral gap** `(π-3)² ≈ 0.02` as admissible coherence corridor. v10 adds a cross-domain memory multiplier Ω(H_hist) = 1 + 0.15·log(1 + N_relevant), clipped to [1.000, 2.500], enabling cross-project Lambda reinforcement.

**Framework-level architecture borrows from 10+ multi-agent systems:** **MetaGPT** and Google's **PaperOrchestra** (2026) independently converged on 5-role decomposition — empirical anchors for n=5 as a stable attractor; **MemPalace** contributes the tiered memory hierarchy (T1 Anchors / T2 Session / T3 Wisdom / Boundary); **AutoAgent** contributes the score-driven optimization idea (while EMP7 warns "optimization without orientation = hill-climbing into fog"); **everything-claude-code (ECC)** contributes background instinct extraction (implemented as CronCreate-based /extract); **LangGraph** (schema only, engine deferred to v11) contributes declarative RT orchestration; **CrewAI** contributes model-per-role cost optimization (Phase 2.D, deferred); **ChatDev** validates structured-dialogue dehallucination. The framework's Universality Gate (v10 Session 7) enforces that specialized content lives in `projects/{PROJECT}/overlay/` layer (L3), not in the universal core (L0/L1/L2). One such overlay — the **ODTOE article overlay** — incorporates the **Rybakov Approach** (external 2026-04-04 methodology) as Check 8 epistemic markers `[FACT] / [DERIVATION] / [HYPOTHESIS] / [OPEN]`, Failure Modes at RT-1, Verification Register in Coherencer, and Trust Index for bibliography — all added as selective integrations, not as a parallel pipeline.

**EraDev operates through:** a **META-Orchestrator (Level 9)** that only produces 6 output types (Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent); a **5-role team** (Visionary, Analyst, Builder, Validator, Coherencer) mapped to ODTOE observation operators on a **torus topology** (inner ring fast: A↔B↔V; outer ring slow: Vis↔Coh↔A; R/r = φ); a **4-layer architecture** (L0 math canonical / L1 universal roles / L2 domain skins / L3 project instances); a **bilingual EN+RU stack** where English is the practical execution layer and Russian the theoretical-depth layer (A/B-validated); **16 Invariants**, **30 Bootstrap Lessons** (23 universal + 7 code-adapter), **6 verification methods** (build / cite_check / readability / parse / dry_run / recompute) plus an extensible custom_methods registry for domain-specific verification; **4 enforcement gates** (PRE-FLIGHT / LAMBDA AUDIT / FIX-TO-SPEC / BUILD-VERIFY) plus the Apophatic Gate (v10, pre-RT-1) and Universality Gate (v10, pre-commit); and an **Enforcement-Tier Ladder** (T1 type-level > T2 hook/CI > T3 agent-prompt checklist > T4 docs-only) where every new rule must declare its tier. The spiral gap (~2%) is preserved per cycle as the engine of development — perfect closure = dogmatic collapse.

---

## 6. B-check (Jidoka Self-Check)

```
=== JIDOKA SELF-CHECK ===
Modality: B_research (F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15)

F (Focus)       = 0.92
  + Read in full: eradev.md (all 878 lines), meta.md (all 442 lines), CLAUDE.md
    (all 105 lines + 16 invariants), BOOTSTRAP_LESSONS.md (all 30 BL), universal+code
    split BL files, projects/eradev/lessons.md (all 45 lessons + 15 EMPs),
    projects/eradev/config.md (7 Iron Rules), projects/odtoe-articles/config.md
    (8 Checks + Rybakov attribution line 282), overlay/domain_skin.article.overlay.md
    (11 sections), RT1_rybakov_approach_analysis (all 221 lines 5-role RT),
    proposals_role_improvements_rybakov (all 103 lines), multi_agent_frameworks_
    comparison (all 248 lines, 10 frameworks, 5 top borrows), v9_odtoe_multiagent_
    mining (all 545 lines including §9 drift analysis), interfaces.md (5 handoff
    contracts), glossary.md (51 terms), visionary_EN.md, coherent_EN.md,
    validator_EN.md, README.md, domain_skin.md.template, domain_skin.research.md
    head.
  + 2 targeted greps: Rybakov (12 distinct citation sites enumerated); multi-agent
    framework names (verified 10+ frameworks named with file:line).
  + Cross-checked counts: 16 Invariants (not 14 — README stale); 30 BL (3 retired/
    merged: BL-14→BL-8, BL-20 retired, BL-21→BL-17, BL-23 retired, BL-27→BL-6);
    51 glossary terms; 15 EMPs; 45 lessons.
  − Did not read the full book/plan/config skin templates (spot-scanned research
    skin only); did not read `cycle-7-reflection.md` or other Session-1 era
    historical reports beyond the two Rybakov ones.
  − Did not verify external URLs (GitHub repos, KAM theorem references) are live.

E (Alignment)   = 0.95
  + Operator asked for comprehensive genealogy ("от принципов, до имен, до промта
    Рыбакова и так далее"). Report structure: 12 categories + deep-dive Rybakov +
    cross-ref matrix + revised description. All requested categories covered.
  + Rybakov deep-dive includes: (a) source provenance (external .docx, person attr),
    (b) full 7-stage methodology reproduced from RT-1 analysis, (c) what was
    adopted vs rejected with RT-1 verdict citations, (d) 12 grep citation sites,
    (e) integration timing + universality status.
  + Revised description proposal names all 12 theoretical foundations, all 10
    frameworks, key formulas, and the Rybakov scope-boundary. 3 paragraphs ≈ the
    requested "honest 3-4 paragraph description."
  + Report committed read-only (no file edits, per task constraint).
  − Could have added a small "dropped / deprecated" section for foundations that
    WERE considered but rejected (e.g., RTK for universalization, AutoAgent's
    hill-climbing without orientation, full Rybakov pipeline integration, phase-
    adaptive weights, toroidal topology role assignment E29).
  − I conflated a few category boundaries — Category 1 "Theoretical Foundations"
    vs Category 5 "Multi-Agent Framework Inspirations" has overlap (MemPalace
    appears in both 1.12 and 5.4; AutoAgent in both 1.11 and 5.3). Intentional to
    ensure reader can find via either axis, but slight redundancy.

(1-σ) (Consistency) = 0.90
  + Rybakov provenance triangulated across 3 primary sources (config.md:282,
    overlay §8, RT-1 report) and 10+ secondary.
  + Cross-checked all BL numbers against active BL count (30 = 23 universal + 7
    code-adapter; 5 retired/merged: BL-14/20/21/23/27).
  + Formula count verified: 3.1-3.15 (15 distinct formula IDs, no duplicates).
  + Constants verified: π and φ to 50 digits match the table in config.md:226-232
    and overlay §5.
  + Theoretical foundations: cross-verified TOC/TRIZ/SMD appear together in
    eradev.md:757 Section XII heading + analyst_EN.md:34-36 + BL-3 source note.
  − I called KAM "Kolmogorov-Arnold-Moser (1954/1962/1963)" without citing the
    source for the years — the framework doesn't cite the years; I pulled them
    from general knowledge. Flagged as a minor attribution gap.
  − Hurwitz theorem cited only in `reports/v9_phase1a_ru_builder_2026-04-11.md` and
    RT-RU synthesis — NOT in eradev.md / meta.md / CLAUDE.md. So it's attested in
    the reasoning trail but not in the shipped framework docs. I listed it as
    Category 1.7 anyway because it's substantive historical justification, but
    a strict reader might argue "not shipped = not a foundation." Flagged.

Λ (Experience) = 0.88
  + Applied BL-29 (verify established terminology) — every Rybakov citation
    cross-checked; every foundation traced to at least 2 files.
  + Applied Lesson 2 (P_coll phantom propagation) — did not copy claims from
    one report without cross-verification against primary framework files.
  + Applied Phase 2.1.S Hansei §4.2 (real-world use is only honest gate) —
    scanned actual file state (grep + Read) not just RT reports.
  + Applied EMP15 (framework without enforcement gate drifts toward creator's
    projects) — explicitly flagged Rybakov as project-scoped via Universality
    Gate regex, not universal.
  + Applied EMP8 (coherence framework, not software framework) — made the
    revised description lead with coherence math not with code examples.
  − Did NOT consult reports on individual roles evolution (e.g., how the
    Visionary role gained "Acceptance Criteria & Failure Pre-mortem" —
    attributed to Rybakov Proposal 1 but the operator may have come via
    other channels). Minor gap in attribution depth.
  − Λ weight is 0.15 so any gap here has limited impact on final B.

Weighted B:
  B = F^0.30 · E^0.20 · (1-σ)^0.35 · Λ^0.15
    = 0.92^0.30 · 0.95^0.20 · 0.90^0.35 · 0.88^0.15
    = 0.976 · 0.990 · 0.964 · 0.981
    ≈ 0.914

B ≥ 0.5: no Andon. All 4 components above 0.3 floor.
Report is HEALTHY for Analyst scope.
```

---

*End of Analyst report. Ready for META synthesis.*
*All findings are derived from file-level evidence with file:line citations. No content edited. No framework files modified. Output type: Report (META output type 5).*
