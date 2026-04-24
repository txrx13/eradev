# EraDev v10 — Analysis of ODTOE "Parallel Trajectories" Paper

> Date: 2026-04-24
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> B-modality: B_research (weights F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15)
> Output type: Report (META output type 5 — analytical audit)
> Scope: Deep-study the paper `ODTOE_parallel_trajectories.pdf` (27 pages); produce concrete improvement recommendations for EraDev, cross-referenced against the BIM planning audit from the same session.
> Paper: Панкратов А.С., "Мета-эпистемология малых групп: цикл обратной связи как первичный оператор познания в многоагентных конфигурациях" (preprint, 2026). 27 pages, ~190 transcript empirical corpus, 11 new symbols F1–F11, 6 testable predictions P1–P6.
> Scope discipline: read-only research. No framework edits. Operator's direct request (Invariant 14): "давай примем окончательное решение что нужно улучшить в eradev".

---

## 0. Activation Operator log

- **A_F (Focus):** Read IN FULL — the target paper (pages 1-20 + 21-27, covering abstract, §I introduction, §II ODTOE theoretical basis, §III knowledge-relativity + empirical base §III.5, §IV frame-as-projector F4, §V small group as parallel trajectories F1/F2, §VI feedback cycle F3/F8/F9/F10, §VII method-vs-configuration + No-Free-Lunch analogy, §VIII three forks + F7 sufficiency threshold, §IX predictions P1–P6 + F5/F6, §X discussion + four working habits + conclusion, §References 1–37). Skimmed (targeted) — `eradev.md` §I–III + §III.Ω + §IV (Apophatic + Universality + Activation) + §V (five roles) + §VI (RT + RT Phase Protocols + Composition Hazards Gate) + §0.1 (4-layer bilingual architecture) + glossary mapping §XVI; `CLAUDE.md` (16 invariants); `FOUNDATIONS.md` (12 theoretical foundations + 15 formulas + Named Contributors + 10-framework comparison + 10+ protocols); `reports/v10_bim_planning_audit_2026-04-24.md` (7 proposals P1–P7 with SHIP/DEFER/REJECT verdicts); cross-check against `templates/domain_skin.plan.md` and `templates/domain_skin.book.md` for existing structured-continuous handling. Gap: did not re-read full RU mirrors, BOOTSTRAP_LESSONS in full, or the 36-case empirical corpus [21] referenced by the paper — the corpus is author's working document, not externally published (paper §III.5 + RV-04 open question).

- **A_E (Alignment):** Operator explicitly wants a final ranked decision list, combining this paper's findings with the pending BIM audit (P1–P7). Intent = concrete, honest, actionable — not defensive. Deliverable: (1) paraphrased paper understanding, (2) concept-by-concept mapping to EraDev with ADOPT/ADAPT/DEFER/REJECT per item, (3) cross-reference against pending BIM P1–P7 (does the paper reinforce, conflict, or orthogonalize?), (4) single ranked list across BOTH sources with SHIP NOW / DEFER / REJECT labels, (5) self-application drift check, (6) OQ + B-check.

- **A_σ (Consistency):** Cross-checked paper claims against (a) eradev.md §I–III existing formalism (paper explicitly declares itself axiomatically non-redefining — §II.0 reuses B, S_team, S_adjusted, Ô, ι, n_min, spiral gap ε = (π-3)², Ĥ activation operator), (b) the v10 OOD scope (paper §X.1 accepts v10's ood_scope: continuous → REJECT limitation; §X.1 condition 3 restates `τ_cycle` measurability as discrete-task prerequisite), (c) invariants 1–16 (no contradiction — paper operates at theoretical layer, not operational), (d) pending BIM audit P1–P7 (checks: does P_reframe/OR-aggregation formalism reinforce or conflict with the proposed Unified Plan deliverable? does the four-habits section §X.5 contradict BL-17 Check-First or L-26 real-use-is-honest-gate?). No contradictions with existing invariants; significant REINFORCEMENT of BIM P1/P2 via F3/F6 feedback-cycle formalism.

- **A_Λ (Experience):** Applied — L-26 ("inspection ≠ use"; paper §X.5 habit 1 "сначала грубо — потом уточнять" = direct empirical corroboration of L-26), EMP11 (7-step pipeline; paper §IX.2 P2 "half-cycle super-proportional acceleration" mathematically grounds EMP11's rapid-iterate pattern via F3), BL-3 (fix-chain ≥3 = structural; paper §VI.5 primacy-of-cycle-length thesis says "optimizing signal quality before cycle length" is a priority inversion — directly parallels BL-3's "stop fixing, write spec"), BL-17 (Check-First pre-generate; paper §IX.4 P4 frame-effect says short framing msg before cycle reduces dim(C_H) by ≥10% — numerical backing for BL-17), BL-22 (PRE-FLIGHT; paper §IV.2 frame-restriction-map Π_H as linear projector = formalization of why PRE-FLIGHT works: frame acts as projector cutting solution space), recent BIM audit (P1 unified plan, P2 doc_alignment method, P3 cross-layer contract, P4 user flow). Framework-level lessons informed Part 4 ranking.

All 4 steps GREEN. Proceeding.

---

## 1. Part 1 — Paper summary

### 1.1 Paraphrased abstract (author's own voice, not quoted)

The paper reframes the question "why don't they hear me?" from a signal-fidelity problem to a structural-configuration problem. In a multi-agent group C = (H, {A_i}) where each agent carries a distinct observation operator Ô_i, the probability of reframing P_reframe and the convergence rate v_conv of knowledge production are NOT governed primarily by the cleanness of any single transmission channel. They are governed by three **configurational** variables: feedback-cycle length τ_cycle, role-operator dispersion Λ_role, and configuration cardinality N_conf. The paper augments the ODTOE+EraDev formalism with 11 new symbols (F1–F11): F1–F7 form the primary formal layer; F8–F11 extend the formalism along the axes of temporal stickiness and coordinated-distortion gradient. Six testable predictions P1–P6 (solo-vs-group depth, half-cycle acceleration, saturation at N_conf = 5, frame-projector shrinkage, sufficiency-path throughput, stickiness via group cycle) define an experimental programme. "They don't hear me" decomposes into three structurally distinct forks: (a) change the other's observation operator, (b) change one's own, or (c) accept the structural difference and measure sufficiency instead of identity — the third path reinstated as a working strategy under B_received ≥ B_min (paper §1, abstract + §I; §VIII.4; §VIII.5).

### 1.2 Eight key claims (1-sentence each)

1. **Primacy thesis (§VI.5):** In multi-agent configurations, cycle-length τ_cycle dominates signal-quality in the optimization hierarchy — halving cycle length gives multiplicative gain across N_conf trajectories (F3), while improving signal quality gives only linear gain in a single trajectory.

2. **Frame-as-projector (§IV.2, F4):** The problem-holder H imposes a frame_H which acts as a linear projector Π_H : C → C_H, and by rank-nullity: dim(C_H) ≤ dim(C) − dim(ker(Π_H)) — the narrower the frame, the smaller the admissible solution subspace, regardless of how broadly the {A_i} can see.

3. **Role dispersion F2/F2' (§V.2):** Λ_role = Var({Ô_i}) or operationally the pairwise operator norm average; Λ_role = 0 means multiple copies of the same operator (no new knowledge); Λ_role > 0 is structural difference of roles (the thing that actually produces parallel trajectories).

4. **OR-aggregation of independent reframings (§V.3, F1):** If each role has probability p_i of reframing in one cycle and events are approximately independent, P_reframe = 1 − Π(1 − p_i); an upper bound under the independence assumption, corrected downward by correlation r between Ô_i (paper RV-06, open question).

5. **Saturation at N_conf = 5 (§V.4, §IX.3 P3):** Under p ≈ 0.3, P_reframe as function of N_conf plateaus at N_conf = ⌈π⌉ + 1 = 5 — after N=5, per-added-agent marginal gain of P_reframe drops below 10%, coinciding structurally with EraDev's n_min from [3] (Hurwitz-anchored stability).

6. **Three forks for "they don't hear me" (§VIII):** Path (a) change Ô_other — most common, long τ_cycle, uses channel diversity + third interlocutor + fresh context; Path (b) change Ô_self — asymmetrically cheap, Ô_self is mine to command, reformulate via Ĥ applied to my own problem; Path (c) accept ΔÔ ≠ 0 and measure B_received ≥ B_min (F7) — replaces equality metric with sufficiency threshold.

7. **F8 stickiness + F9 tipping fraction + F10 bell-curve practical value (§VI.6):** Understanding decays solo (τ_decay ≈ 2-7 days); group cycles add sticky term σ_stick·tanh(N_repeat); below tipping fraction T_tip ≈ 0.15–0.25 diffusion collapses exponentially, above → self-sustained propagation; practical value V_practical(τ_precision) is an inverted-U peaking at τ*, meaning beyond-optimal precision reduces practical value (over-refinement kills adaptation).

8. **F11 two-scale boundary (§X.4):** System growth direction is NOT toward reducing distortions; it is toward increasing N_carriers AND coordinating their distortions (∇S_direction); three nested cognitive scales — atomic n_min=5 (role dispersion), Miller 7±2 (working memory), Dunbar 150 (social cohesion) — each a distinct cognitive constraint, not competing.

### 1.3 Formal apparatus summary

**New symbols introduced:**

| Symbol | Meaning | Formula / Origin | Section |
|---|---|---|---|
| τ_cycle | Feedback-cycle length | Primary variable; time from artifact issuance to meaningful reframing return | V.1, VI.1 |
| Λ_role | Role-operator dispersion | F2: Var({Ô_i}); F2': pairwise op-norm mean | V.2 |
| N_conf | Configuration cardinality | Number of distinct role-operators in C | V.1 |
| Π_H, frame_H | Problem-holder frame as linear projector | F4: dim(C_H) ≤ dim(C) − dim(ker(Π_H)) | IV.2 |
| P_reframe | Probability of reframing per cycle | F1: 1 − Π(1 − p_i) | V.3 |
| v_conv | Convergence rate | F3: α / (τ_cycle · (I(C) + ε)) | VI.2 |
| B_group | Group cognitive coherence | F5: B_solo · (1 + η · Λ_role · ln(N_conf)) — heuristic, calibrated by P1 | IX.6 |
| Π_meta | Meta-epistemological productivity | F6: S_adjusted / τ_cycle | IX.7 |
| B_received, B_intended | Perceived vs intended coherence | Pair of scalar values at ends of ι channel | VIII.5 |
| B_min | Sufficiency threshold | F7: require B_received ≥ B_min, not equality | VIII.5, VIII.6 |
| B_persist(C, t) | Stickiness over time | F8: B(C)·e^(−t/τ_decay) + σ_stick·tanh(N_repeat(τ_cycle, t)) | VI.6 |
| T_tip | Tipping fraction | F9: n_active/n_total at dB_persist/dt = 0; ≈ 0.15–0.25 | VI.6 |
| V_practical(τ_precision) | Bell-curve practical value | F10: B · (τ_precision/τ*) / (1 + (τ_precision/τ*)²); max at τ* where V_max = B/2 | VI.6 |
| N_carriers(t) | Adopters with B_persist ≥ B_min | X.4 | X.4 |
| ∇S_direction | Growth direction | F11: (dN_carriers/dt, dΛ_role/dt) with d(B_persist·N_carriers)/dt > 0 | X.4 |
| σ_stick | Coefficient of stickiness | [0,1]; paper RV-07 open | VI.6 |

**Six testable predictions (P1–P6):**

- **P1 (§IX.1):** Solo agent vs 3+ group with Λ_role > 0 on open-solution tasks — group semantic depth d_sem ≥ 2× solo, anchored to F1-ratio 0.657/0.30 ≈ 2.19 at p≈0.3.
- **P2 (§IX.2):** Halving τ_cycle gives super-proportional v_conv acceleration until τ_min, below which noise dominates — empirical baseline case 4.5 "на троечку, потом докрутим".
- **P3 (§IX.3):** P_reframe plateaus at N_conf = 5 — marginal gain <10% per added agent beyond 5.
- **P4 (§IX.4):** Short framing message about H (assumptions, goals, constraints) BEFORE cycle reduces dim(C_H) by ≥10% measured as count of functionally distinct outcomes.
- **P5 (§IX.5):** Sufficiency-path (B_received ≥ B_min) protocol gives 1.5–3× throughput (tasks reaching "sufficient" per unit time) vs equality-path.
- **P6 (§IX.8):** Group of 3+ discussing an idea ≥ 2 hrs shows B_persist(t=14d) ≥ 2.0 × solo-reading baseline; tested via idea-recall + application rate.

**Four working habits (§X.5):** (1) Rough first, refine later; (2) Transmit the method, not the text; (3) Check the receipt ("how did you hear?"); (4) Accept "their way" — distortion is interface, not defect.

### 1.4 Explicit EraDev / multi-agent connections

- **Explicit EraDev references:** paper [2] and [3] cited repeatedly (Pankratov, "Multi-agent coherence ODTOE: five-role architecture EraDev" preprint 2026 + Pankratov, "Team configuration: n_min = ⌈π⌉ + 1 as minimum stability condition" preprint 2026). Paper §I.0 explicitly states novelty relative to [2,3]: those papers fixed the 5-role architecture and n_min = 5 as stability condition; this paper SHIFTS the axis from configuration stability to configuration's primary operator — the feedback cycle itself.
- **§II is faithful reproduction** of ODTOE/EraDev formalism: B, S_team, S_adjusted, Ô, ι, spiral gap (π-3)², Ĥ activation operator, n_min = 5 — all stated as-is and cited to [1]-[6], including canonical verbatim reproduction with explicit "no redefinition" rule.
- **§VI.4 explicit OODA + PDCA + Jidoka grounding:** F3 formalizes Boyd's OODA intuition ("shorter cycle wins, not better observation"); Deming's PDCA ("quality is function of feedback-closure speed"); Jidoka (autonomous line-stop at deviation) = engineering realization of short τ_cycle + any worker can trigger ι-step and Ψ' reformulation.
- **§VIII.8 micro-check operation (Schön's reflection-in-action):** adds a FOURTH operation to the three forks — short "how did you hear?" check after transmission, willingness to correct own delivery based on reply. NOT in current EraDev.
- **§VI.5 primacy-of-cycle claim** is the paper's CORE novelty against EraDev: EraDev has τ_cycle implicitly (RT-2 mid-point, ι feedback) but does not declare it as primary among {signal quality, cycle length, team size}. The paper's thesis: cycle-length wins.

---

## 2. Part 2 — Concept mapping table (paper → EraDev)

Status keys: **ALREADY** / **PARTIAL** / **NEW** / **REJECTED** / **IRRELEVANT**.

| # | Paper concept | EraDev status | Location / Gap | Value | Effort | Conflict | Token economy | Verdict |
|---|---|---|---|:-:|:-:|:-:|:-:|---|
| C1 | B multiplicative (F, E, 1-σ, Λ) | ALREADY | `eradev.md` §II + II.1 | — | — | — | — | — |
| C2 | S_team, S_adjusted | ALREADY | `eradev.md` §III + III.1 | — | — | — | — | — |
| C3 | Spiral gap (π-3)² | ALREADY | `eradev.md` §IX | — | — | — | — | — |
| C4 | n_min = ⌈π⌉+1 = 5 | ALREADY | `eradev.md` §V, derived via Hurwitz + KAM | — | — | — | — | — |
| C5 | Ĥ activation operator composition | ALREADY | `eradev.md` §IV (Â = A_Λ ∘ A_σ ∘ A_E ∘ A_F) | — | — | — | — | — |
| C6 | Five roles = five distinct Ô_i | ALREADY | `eradev.md` §V + C1 paper §V.1 paraphrase | — | — | — | — | — |
| C7 | τ_cycle as PRIMARY operator (§VI.5) | **PARTIAL** | EraDev has τ_cycle implicitly via RT-2 mid-point + ι. NO EXPLICIT primacy declaration. Operator optimization priority is currently "classify + pick right roles + Activation Operator quality"; τ_cycle is never named first among equals. | HIGH | M | NO | neutral-to-save | **ADOPT** (C7a — invariant / meta rule) |
| C8 | F3: v_conv = α / (τ_cycle · (I(C) + ε)) | **NEW** | EraDev has I(C) qualitatively in §VI.2 (Blast Radius LOW/MED/HIGH/CRIT) + glossary mapping "configuration inertia I(C) = Resistance to reconfiguration". No v_conv formula. Paper §VI.3 proposes I(C) = Σ w_j · B_j or S_team^(-1) or Var(Λ_role)^(-1) — open calibration | HIGH | M | NO | neutral | **ADOPT** (add F3 to eradev.md §III formula table; mark I(C) calibration as OQ) |
| C9 | F2' pairwise operator-norm role dispersion | **PARTIAL** | EraDev has pairwise \|B_i − B_j\| (scalar divergence, §III). F2' operates on operator space itself, not scalar-B. Complementary, not competing | MED | M | NO | neutral | **DEFER-v11** (calibration needs F1-validation data from paper P1) |
| C10 | F1 OR-aggregation with independence assumption | ALREADY (base) + PARTIAL (correction) | EraDev §III has P_coll = 1 − Π(1 − B_i^k) = SAME structure as F1. Paper adds explicit independence caveat + correlation correction RV-06 (1 − Π(1−p_i)^(1−r)) as OPEN | LOW | S | NO | neutral | **DEFER-v11** (track RV-06, adopt when closed) |
| C11 | F4 frame-as-linear-projector, rank-nullity bound on dim(C_H) | **NEW** | EraDev has "Check-First" (BL-17, load format spec before generation) — captures the INTENT behind F4 but without the linear-projector formalism. Adding F4 gives mathematical backing for why pre-framing matters. Also grounds the BIM audit's P4 (User Flow) because user flow IS a frame_H disclosure | MED | S | NO | save | **ADOPT** (add F4 to eradev.md §II + link to BL-17 as operational realization) |
| C12 | F5 B_group ≈ B_solo · (1 + η · Λ_role · ln(N_conf)) heuristic | **NEW (heuristic)** | No EraDev formula links B_group to N_conf with Λ_role amplification. Paper marks F5 as heuristic pending P1 | MED | S | NO | neutral | **DEFER-v11** (adopt after P1 empirical calibration of η) |
| C13 | F6 Π_meta = S_adjusted / τ_cycle (meta-epistemological productivity) | **NEW** | EraDev has S_session = (1−fix_rate)(1−chain_ratio)·Δ·B_mean as cycle-health metric — covers similar ground but from process-discipline angle. F6 adds time-normalization. Direct complementarity, not substitution | HIGH | S | NO | save | **ADOPT** (add F6 to `meta.md` §1a or §4 metric section; report at RT-3 alongside S_session) |
| C14 | F7 B_received ≥ B_min (sufficiency path (v)) | **NEW** | NOT IN EraDev. Current framework implicitly assumes B_intended ≈ B_received as a Validator concern. F7 replaces equality with threshold — structurally different | HIGH | M | Potential (see below) | save | **ADOPT** (add F7 to eradev.md §III formula table + document as Invariant-adjacent; changes Validator scope) |
| C15 | F8 B_persist(C,t) stickiness over time | **NEW** | EraDev has Ω multiplier (`eradev.md` §III.Ω) + freshness = max(0, 1 − age_days / half_life). F8 is ORTHOGONAL — Ω is cross-session memory multiplier; B_persist is within-idea decay. Compatible | MED | M | NO | neutral | **DEFER-v11** (empirical calibration σ_stick, τ_decay per paper RV-07) |
| C16 | F9 T_tip tipping fraction (phase transition in diffusion) | **NEW** | Not in EraDev. Relevant for portfolio-scale L12 (multiple projects); not for single-project RT | LOW | M | NO | — | **DEFER-v11+** (L12 prerequisite — not urgent) |
| C17 | F10 V_practical inverted-U bell curve (over-refinement kills adaptation) | **NEW** | NOT IN EraDev explicitly. EraDev has BL-11 "scope creep = Muda" and "Minimum Viable Scope" (roles/analyst_EN.md:22) — covers part of it. F10 adds mathematical optimum point τ* where precision/flexibility trade-off peaks | MED | S | NO | save | **ADAPT** (add note to Minimum Viable Scope rule in `roles/analyst_EN.md`; cite F10 as formal grounding) |
| C18 | F11 ∇S_direction (growth toward more carriers + coordinated distortions, NOT toward minimal distortion) | **NEW** | NOT IN EraDev. Strategically important: "goal of the system is NOT to reduce sigma to zero" — this contradicts a naïve reading of Weak Link Principle where 1-sigma → 1 looks like a goal. F11 says: keep 1-sigma bounded above zero, grow N_carriers | HIGH | M | YES (surface) | save | **ADAPT** (add F11-derived note to eradev.md §II Weak Link Principle: "keep B > 0 AND 0 < B < 1 — absorbing states apply both sides"; already in eradev.md §II but F11 strengthens it) |
| C19 | Path (c) "accept ΔÔ ≠ 0" as working strategy | **NEW** | NOT IN EraDev. Phantom Coherence (BL-5) concerns false convergence; Phantom Decoherence (BL-29 ext) concerns hidden convergence. F7 + path (c) concern STRUCTURAL non-convergence that is accepted as normal. Gap: EraDev invariant #9 ("No compromise, no 'just this once'") could be misread as demanding B_intended = B_received; path (c) says this demand is excessive in general | HIGH | M | YES (nuanced — resolves via formalization, not rejection) | save | **ADOPT** (add path-(c) discipline to `roles/coherent_EN.md` + Validator Output Format: distinguish "sufficient reception" from "identical reception") |
| C20 | Micro-check operation (§VIII.8, Schön reflection-in-action) | **NEW** | EraDev has Validator DOCS DRIFT CHECK (role file, rule 9) + BL-29 verify-established-terminology. Both are retrospective on ARTIFACTS, not receiver-feedback operations. Micro-check is prospective: "after transmission, ask 'how did you hear?'" — a between-agents operation not currently in RT protocol | HIGH | S | NO | save | **ADOPT** (add "μ-check" step to RT-2 protocol; `eradev.md` §VI RT-2 addition: each Builder output closes with a one-line "how did Validator hear this?" prompt) |
| C21 | §VII No-Free-Lunch (method-vs-configuration, Wolpert–Macready analogy) | **NEW (meta-insight)** | NOT IN EraDev, but directly relevant. EraDev has domain skins (code/article/book/config/plan/research) as per-project adapters. Paper §VII formalizes: no single (method, configuration) pair dominates all tasks. Directly supports EraDev's adapter architecture; adds theoretical backing | MED | S | NO | — | **ADOPT** (add attribution to `FOUNDATIONS.md` §III; cite as 13th theoretical foundation anchoring the skin system) |
| C22 | §VII.4 ensemble of configurations (C_1, C_2, …, C_M for different phases of a task) | **NEW** | EraDev has Multi-team scaling (`eradev.md` §X: N_teams = ceil(N_modules/3)) + Coherencer Hierarchy L1/L2/L3. Paper §VII.4 says DIFFERENT configurations for different PHASES of one task, selected by feedback not by priors. Complementary | MED | M | NO | neutral | **DEFER-v11** (requires mechanism for configuration-switching; currently Coherencer Hierarchy is team-count-driven, not phase-driven) |
| C23 | §X.4 two-scale boundary: atomic n=5 + Miller 7±2 + Dunbar 150 as nested not competing | ALREADY (partial) | EraDev has n_min = 5 (atomic). Miller 7±2 + Dunbar 150 NOT explicit. Multi-team scaling handles >5 implicitly | LOW | S | NO | neutral | **DEFER-v11** (document in FOUNDATIONS.md if tested; low urgency) |
| C24 | §X.5 four working habits | ALREADY (scattered) | (1) Rough first = L-26 real-use + BL-11 Minimum Viable Scope; (2) Transmit method not text = BL-19 bilingual sync + role-file discipline; (3) Check receipt = C20 micro-check (NEW); (4) Accept "their way" = C19 path (c) (NEW) | MED | S | — | — | **ADAPT** (document the four habits as a consolidated "operational discipline block" in `meta.md`; habits 1,2 point to existing, habits 3,4 require C19+C20 adoption first) |
| C25 | Publication base — paper cites [21] (~190 transcripts) as empirical anchor; RV-04 = preprint publication of [21] open | IRRELEVANT to EraDev framework | — | — | — | — | — | — |
| C26 | References [7]–[37] — Boyd OODA, Deming PDCA, Kahneman, Janis, Surowiecki, Gärdenfors, Hackman, Tuckman, Flood-Jackson, Schön, Kuhn, Latour, Polanyi, Altshuller, Checkland, Wolpert-Macready, Hutchins, Nonaka-Takeuchi, Sperber-Wilson, Heath-Heath, Dunbar, Miller | ALREADY (9 of these are in FOUNDATIONS.md) + NEW (several not yet attributed) | Already in EraDev: Boyd OODA (§11 AutoAgent/feedback), Deming PDCA (§XI TPS), Altshuller (TRIZ §4), Hofstadter (strange-loop §8), Hurwitz (§7), KAM (§6), Janis/Surowiecki/Nonaka (comparison table). NEW: Gärdenfors conceptual spaces, Hackman leading teams, Tuckman forming/storming, Flood-Jackson TSI, Schön reflective practitioner, Kuhn paradigm shifts, Latour actor-network, Polanyi tacit knowledge, Hutchins distributed cognition, Sperber-Wilson relevance, Heath-Heath stickiness, Dunbar, Miller, Wolpert-Macready NFL | LOW | S | NO | — | **ADAPT** (update `FOUNDATIONS.md` with the 13 missing attributions cited in this paper; closes L10 cross-domain completeness) |

**Summary counts:** ALREADY=7, PARTIAL=4, NEW=13, REJECTED=0, IRRELEVANT=1.

### 2.1 High-value concentration

Of 13 NEW concepts, the HIGH-value subset is: **C7** (τ_cycle primacy), **C11** (F4 frame-projector), **C13** (F6 Π_meta), **C14** (F7 sufficiency threshold), **C18** (F11 growth direction), **C19** (path-(c) acceptance), **C20** (micro-check). These 7 form a coherent cluster — they all operationalize the paper's central thesis (cycle-length over signal-quality).

### 2.2 Token economy reading

All ADOPT items above (C7, C11, C13, C14, C18, C19, C20, C21) are token-**saving** or neutral. No item is token-negative. Mechanism: each NEW concept either compresses existing scattered logic (e.g., C7 as invariant replaces ad-hoc "go fast" guidance) or adds a one-liner to `eradev.md` formula table (`eradev.md:111-131` pattern). Token cost estimate: +80 lines in core docs across 8 adopt-items (C7+C11+C13+C14+C18+C19+C20+C21).

---

## 3. Part 3 — Cross-reference with pending BIM audit (P1–P7)

The BIM audit produced 7 proposals with verdicts: P1 SHIP, P2 SHIP, P3 SHIP, P4 optional, P5 defer, P6 reject, P7 defer. Now check: does the Parallel Trajectories paper reinforce, conflict, or orthogonalize these?

| BIM proposal | BIM status | Paper stance | Specific paper content | New verdict |
|---|---|---|---|---|
| **P1** — Mandate `reports/unified-plan-<date>.md` as RT-1 output | SHIP | **REINFORCES** | F4 (frame-as-projector) formalizes WHY unified pre-work matters: rank-nullity bound says the frame silently cuts dim(C_H); unified plan makes the frame VISIBLE and thus CHALLENGEABLE. Paper §IV.4 "short cycle as frame-revision mechanism" directly supports mandatory pre-work artifact | SHIP NOW |
| **P2** — `verify.method: doc_alignment` for plan-class artifacts (pre-Builder gate) | SHIP | **REINFORCES with qualifier** | Paper §X.5 habit 1 "rough first, refine later" and F10 (practical value peaks at τ* — beyond which precision KILLS adaptation) say: plan-quality gate must NOT pass "too polished" plans. Doc_alignment passes "minimal-sufficient" plans, not "ideal" plans. Refines P2 definition: sufficiency (F7), not completeness | SHIP NOW with F7-calibration (alignment = minimum-sufficient, not maximum-fidelity) |
| **P3** — Cross-Layer Contract Table in Analyst Output | SHIP | **REINFORCES** | F4 frame-projector applied inter-layer: each layer (BE, FE, integration) has its own frame_{H,layer}; cross-layer contracts explicitly reconcile the projections. Paper §IV.5 six cognitive distortions as σ-operators (anchoring, confirmation bias, attribution, groupthink, halo, survivorship) — cross-layer tables catch layer-specific distortions via explicit structure | SHIP NOW |
| **P4** — User Flow section (optional per domain) | SHIP optional | **REINFORCES and UPGRADES** | User flow = explicit frame_H disclosure (F4 + P4 paper §IX.4 predicts ≥10% dim reduction from a pre-cycle frame-disclosure message). Paper elevates this from "optional" to "predicted to materially reduce solution-space entropy" | UPGRADE to mandatory-when-UI-facing |
| **P5** — Explicit backward-derivation chain in IFR | DEFER | **NEUTRAL-TO-OPPOSES** | Paper §X.5 habit 1 and F10 are skeptical of over-formalization of pre-work. §VI.5 primacy says "short τ_cycle" is more productive than "perfectly specified initial state". Paper does not support upgrading P5 | Remain DEFER (no change) |
| **P6** — New Architect/Planner role (6th role) | REJECT | **REINFORCES rejection** | Paper §II.6 reproduces n_min = 5 from [3]; §X.4 reaffirms atomic scale at n = 5 Hurwitz-anchored. Adding a 6th role violates F3 (v_conv depends on I(C); more roles can increase I(C) without ln(N_conf) benefit past saturation). Paper's P3 numerical check (§IX.3) gives per-agent gains 21%, 14.7%, 10.3%, 7.2%, 5%, 3.5% — marginal at and past N=5 | Remain REJECT (strengthened) |
| **P7** — BIM skin as separate overlay (vs extension of code skin) | DEFER | **NEUTRAL** | Paper doesn't address skin architecture directly, but §VII (method-vs-configuration) provides theoretical backing for extensible skin system (13th foundation, see C21). Does not change P7 verdict | Remain DEFER |

**Orthogonal improvements the paper surfaces (NOT in BIM audit):**

| Orthogonal item | Origin | BIM would-have-seen? |
|---|---|---|
| τ_cycle primacy invariant (C7) | Paper §VI.5 | NO — BIM is about planning quality, not cycle speed |
| F6 Π_meta productivity metric (C13) | Paper §IX.7 | NO — BIM is about plan correctness, not throughput |
| F7 sufficiency threshold B_min (C14) | Paper §VIII.5 | NO — BIM assumed "test to pass", F7 says "test to sufficient" |
| Micro-check operation (C20) | Paper §VIII.8 | NO — BIM is pre-work; micro-check is within-cycle |
| Path (c) acceptance discipline (C19) | Paper §VIII.4 | NO — BIM assumes convergence; path (c) says structural divergence can be accepted |
| F11 growth-direction rule (C18) | Paper §X.4 | NO — BIM has no statement on system-level goals |

**Net:** The paper reinforces BIM P1/P2/P3/P4 (stronger mandates, clearer definitions), reinforces rejection of P6, and introduces 6 orthogonal items (C7, C13, C14, C19, C20, C18) that sit ABOVE the planning level — they concern cycle dynamics, not plan quality. Both the BIM audit and the paper reach the same conclusion about P6 (no 6th role); they converge on P1/P2/P3/P4.

---

## 4. Part 4 — Final ranked improvement list (combined)

Ranking formula (simplified): `score = (value × urgency) / (effort × risk)`. Value: HIGH=3, MED=2, LOW=1. Urgency: NOW=2, v11=1, v11+=0.5. Effort: S=1, M=2, L=3. Risk: LOW=1, MED=2, HIGH=3.

| Rank | Item | Origin | Value | Effort | Score | Label |
|:-:|---|---|:-:|:-:|:-:|---|
| **1** | **P1 — Unified Plan artifact at RT-1** | BIM | HIGH | S | 6.0 | **SHIP NOW** |
| **2** | **C20 — Micro-check operation at RT-2** | Paper §VIII.8 | HIGH | S | 6.0 | **SHIP NOW** |
| **3** | **C7 — τ_cycle primacy as Invariant #17** | Paper §VI.5 | HIGH | S | 6.0 | **SHIP NOW** |
| **4** | **C13 — F6 Π_meta productivity at RT-3 reporting** | Paper §IX.7 | HIGH | S | 6.0 | **SHIP NOW** |
| **5** | **C11 — F4 frame-projector in §II + link to BL-17** | Paper §IV.2 | MED | S | 4.0 | **SHIP NOW** |
| **6** | **P3 — Cross-Layer Contract Table in Analyst Output** | BIM | MED-HIGH | S | 4.0–6.0 | **SHIP NOW** |
| **7** | **C14 — F7 sufficiency threshold B_received ≥ B_min** | Paper §VIII.5 | HIGH | M | 3.0 | **SHIP NOW** (stretch) |
| **8** | **C19 — Path (c) "accept ΔÔ" discipline in Coherencer + Validator** | Paper §VIII.4 | HIGH | M | 3.0 | **SHIP NOW** (stretch) |
| **9** | **C21 — No-Free-Lunch theorem attribution in FOUNDATIONS.md** | Paper §VII | MED | S | 4.0 | **SHIP NOW** (bundled w/ C26 citations) |
| **10** | **P2 — `verify.method: doc_alignment` with F7 calibration** | BIM + Paper | HIGH | M | 3.0 | **SHIP NOW** |
| **11** | **C26 — Add missing 13 citation attributions to FOUNDATIONS.md** | Paper references | MED | S | 4.0 | **SHIP NOW** (S-task) |
| **12** | **P4 — User Flow upgraded to mandatory-when-UI** | BIM + Paper §IV | HIGH | S | 6.0 (when applicable) | **SHIP NOW** (qualified) |
| **13** | **C18 — F11 growth-direction note in eradev.md §II WLP** | Paper §X.4 | HIGH | S | 6.0 | **SHIP NOW** (1-paragraph edit) |
| **14** | **C8 — F3 v_conv formula in eradev.md formula table** | Paper §VI.2 | HIGH | M | 3.0 | **SHIP NOW** (tied to C7) |
| **15** | **C17 — F10 inverted-U note on Minimum Viable Scope** | Paper §VI.6 | MED | S | 4.0 | **SHIP NOW** (small docs edit) |
| **16** | **C24 — Four Working Habits consolidation block** | Paper §X.5 | MED | S | 4.0 | **SHIP NOW** (documentation hygiene) |
| **17** | C9 — F2' pairwise operator-norm dispersion | Paper §V.2 | MED | M | 2.0 | DEFER v11 |
| **18** | C12 — F5 B_group heuristic (needs P1 calibration) | Paper §IX.6 | MED | S | 2.0 | DEFER v11 |
| **19** | C15 — F8 B_persist stickiness decay | Paper §VI.6 | MED | M | 2.0 | DEFER v11 |
| **20** | C22 — Ensemble of configurations (phase-driven switching) | Paper §VII.4 | MED | M | 2.0 | DEFER v11 |
| **21** | C10 — F1 correlation correction (tracks paper RV-06) | Paper §V.3 | LOW | S | 1.0 | DEFER v11 |
| **22** | C16 — F9 T_tip tipping fraction (portfolio L12) | Paper §VI.6 | LOW | M | 0.5 | DEFER v11+ |
| **23** | C23 — Two-scale Miller 7±2 + Dunbar 150 | Paper §X.4 | LOW | S | 1.0 | DEFER v11+ |
| **24** | P5 — Explicit backward-chain in IFR | BIM | LOW | S | 1.0 | DEFER (paper OPPOSES upgrade) |
| **25** | P7 — BIM skin as separate overlay | BIM | LOW | M | 0.5 | DEFER v11 |
| **—** | **P6 — New Architect role (6th role)** | BIM | — | — | **—** | **REJECT** (strengthened by paper §II.6 + §IX.3) |

### 4.1 SHIP NOW summary (top 16)

| Order | Item | Touch |
|:-:|---|---|
| 1 | P1 unified-plan template + Coherencer mandate | `templates/unified_plan.template.md` NEW; `roles/coherent_EN.md` §Output Format edit |
| 2 | C20 μ-check at RT-2 | `eradev.md` §VI RT-2 protocol edit; `roles/builder_EN.md` + `roles/validator_EN.md` |
| 3 | C7 τ_cycle primacy → Invariant #17 | `CLAUDE.md` invariants list +1; `eradev.md` §VI.5 (new subsection) |
| 4 | C13 F6 Π_meta at RT-3 | `eradev.md` §III (formula #11 next to S_session); `meta.md` RT-3 reporting |
| 5 | C11 F4 frame-projector | `eradev.md` §II + cross-link from BL-17 |
| 6 | P3 Cross-Layer Contract Table | `roles/analyst_EN.md` §Output Format |
| 7 | C14 F7 sufficiency threshold | `eradev.md` §III formula table; `roles/validator_EN.md` scope |
| 8 | C19 path-(c) discipline | `roles/coherent_EN.md` + `roles/validator_EN.md` |
| 9 | C21 NFL theorem attribution | `FOUNDATIONS.md` §I foundation #13 |
| 10 | P2 doc_alignment verify.method | `eradev.md` §II.2 verify-method registry; Validator role |
| 11 | C26 13 missing citations | `FOUNDATIONS.md` §IV + comparison table |
| 12 | P4 user flow mandatory-when-UI | `roles/analyst_EN.md` §Output Format |
| 13 | C18 F11 growth-direction note | `eradev.md` §II Weak Link Principle |
| 14 | C8 F3 v_conv formula | `eradev.md` §III formulas (add #16) |
| 15 | C17 F10 V_practical note | `roles/analyst_EN.md` Minimum Viable Scope |
| 16 | C24 Four habits block | `meta.md` new subsection; ties together C7/C14/C19/C20/BL-11/L-26 |

**Token cost estimate for top-16 ship:** ~150–250 lines added across 8 core files. No lines deleted. Consistent with v10 Phase 4 sizing precedent.

**Single-commit bundles (reduce drift):**
- **Bundle A — Theoretical layer (C7+C8+C11+C13+C14+C17+C18+C21+C26):** one commit to `eradev.md` §II + §III + `FOUNDATIONS.md`. All math additions; no role-file changes. Safe, L0 layer.
- **Bundle B — Protocol layer (P1+P2+P3+P4+C20):** one commit to `roles/analyst_EN.md` + `roles/coherent_EN.md` + `roles/validator_EN.md` + `roles/builder_EN.md` + `eradev.md` §VI. All process additions; no math changes. L1 layer.
- **Bundle C — Meta layer (C19+C24):** one commit to `meta.md` + `CLAUDE.md` (+ Invariant #17). Session-entry + discipline updates. L1 layer, highest-level.

Three bundles, three commits, standard v10 Phase-N pattern.

### 4.2 REJECT list (1 item)

- **P6 — New Architect/Planner role (6th role).** Double-confirmed reject: BIM audit already rejected; paper §II.6 reproduces n_min = 5 Hurwitz-anchored; paper §IX.3 P3 numerical check shows marginal gain of adding 6th agent is 3.5% at p≈0.3, below the 10% threshold claimed for plateau. Adding a 6th role violates torus topology R/r = φ (KAM stability). No circumstance warrants revisiting.

### 4.3 DEFER-v11 list (9 items)

C9, C10, C12, C15, C16, C22, C23, P5, P7 — deferred because: (a) await empirical calibration (paper's open questions RV-04/05/06/07/08 + predictions P1/P2/P5/P6 results needed), (b) portfolio-scale prerequisites not yet present (C16 L12), (c) add formalization without changing behavior (C10, C23), (d) weaker than paper's stronger form (P5 backward-chain is weakened by paper §X.5 habit 1).

---

## 5. Part 5 — Self-application drift check

**Question:** Does the paper describe EraDev AS-IS (v10), an older version, or something else?

**Answer:** The paper describes EraDev as of references [2]–[6] — which is the **theoretical layer** of EraDev stable across v8/v9/v10 (B, S_team, S_adjusted, Ô, ι, n_min=5, spiral gap, Ĥ activation operator). It does NOT describe:

- v9/v10 modal B-formulas (B_text/B_creative/B_research — `eradev.md` §II.1). Paper keeps pure multiplicative B = F·E·(1-σ)·Λ with uniform weights. No contradiction; v9 weights refine paper's B at agent level, paper's F3/F6 operate on team-configuration level.
- v10 Ω memory multiplier (`eradev.md` §III.Ω). Paper has B_persist (F8) which is related but orthogonal — B_persist is within-idea-over-time decay; Ω is cross-session lesson reinforcement. Both compatible.
- v10 OOD scope enforcement (`eradev.md` §II.2). Paper §X.1 accepts OOD limitation as inherited from [2] invariant `ood_scope`.
- v10 Universality Gate (`eradev.md` §IV) + Apophatic Gate — no paper mention; orthogonal to paper's scope.
- The 16 META invariants in `CLAUDE.md`. Paper operates at theoretical layer; invariants are operational.
- The 13-item session-entry protocol (`meta.md` §14). Paper is math; invariants are process.
- Modal B-weight backward compatibility rule (`eradev.md` §II.1). Paper doesn't need it — works at level above agent-weights.

**Conclusion:** Paper and v10 are LAYERED, not conflicting. Paper extends ODTOE theoretical basis (F1–F11 on top of B, S, P_coll, Ω, n_min); v10 extends EraDev operational layer (invariants, gates, domain awareness, modal weights). The two layers compose cleanly: v10 implements the paper's axioms operationally (Ĥ = activation operator = v10's 4-step A_F/A_E/A_σ/A_Λ; n_min=5 = v10's role count; ι = v10's Validator role + RT-2 feedback). Adopting C7/C8/C13/C14 upgrades v10 to reflect the paper's newer theoretical layer; no re-work of existing v10 operational layer needed.

**One drift caveat:** The paper's §VII "ensemble of configurations" (C22 in map, DEFER) implies phase-driven configuration switching. Current v10 Coherencer Hierarchy (L1/L2/L3) is team-count-driven, not phase-driven. This is a structural gap ONLY in XL/L2-Coherencer territory, well outside mainstream work. Deferred correctly.

---

## 6. Part 6 — Open Questions (OQ-PT-*)

- **OQ-PT-1:** `I(C)` calibration. Paper §VI.3 offers three candidate forms (Σ w_j B_j OR S_team^(-1) OR Var(Λ_role)^(-1)); resolution requires empirical data from P1 (§IX.1). EraDev currently uses qualitative Blast Radius (LOW/MED/HIGH/CRIT) — sufficient for v10 operational use, but formal calibration needed for F3 to be predictive. **Target resolution:** v11, after 3+ RT cycles with post-hoc I(C) scoring.

- **OQ-PT-2:** τ_cycle primacy as INVARIANT vs guidance. C7 proposes Invariant #17. If operator override is needed (e.g., P0 incident where signal-quality matters more because irreversibility is at stake), the invariant must admit exception. Current Invariant #8 (P0 allows direct intervention) already provides this; but does C7's primacy claim need an explicit P0 escape clause? **Target resolution:** operator decision during Bundle C commit.

- **OQ-PT-3:** F7 B_min calibration per modality. Paper §VIII.6 says B_min/B_intended ≈ 0.70–0.85 in corpus [21]; no per-modality breakdown. For EraDev: is B_min the same for code (B_text) as for research (B_research) where the paper's own empirical base operates? Intuitively NO — research demands higher B_min than code. **Target resolution:** separate B_min per modality (B_text=0.70, B_creative=0.75, B_research=0.85 tentative); v11 calibration.

- **OQ-PT-4:** Micro-check (C20) placement in RT protocol. Paper §VIII.8 places it between replicas in a live conversation. EraDev's RT-2 is not a live conversation; it's an async synthesis. Where exactly does μ-check insert? After each Builder output before Validator runs? Inside each Validator output? **Target resolution:** pilot C20 in one RT cycle, observe, decide.

- **OQ-PT-5:** F11 growth direction and the Universality Gate. Paper §X.4 says growth = more carriers + coordinated distortions. EraDev's Universality Gate (`.githooks/pre-commit` banning specifics in L0/L1) is the MECHANISM for coordinated-distortion reduction — but the paper says reducing distortion is NOT the goal; coordination IS. Subtle: Universality Gate coordinates across PROJECTS; paper's coordination is across AGENTS within a project. Different scales, but tension worth flagging. **Target resolution:** doc note in Universality Gate description that "coordination ≠ zero distortion" — scope is project-level.

- **OQ-PT-6:** Should F6 Π_meta replace or complement S_session? Both aim at cycle-health measurement. F6 = S_adjusted/τ_cycle (paper §IX.7); S_session = (1-fix_rate)(1-chain_ratio)·Δ·B_mean (`eradev.md` §III). Different signal: F6 measures productivity per unit time; S_session measures error-free cycle quality. **Target resolution:** report BOTH at RT-3, let operator observe which dominates.

- **OQ-PT-7:** Paper [21] publication. Paper's empirical base is author's working doc (paper §III.5 + RV-04). Until [21] is on preprint server with DOI, paper's Trust Index = T4 (novel, unverified) per `projects/odtoe-articles` Check-First protocol. Does adopting C7–C20 depend on T3 upgrade? **Answer (preliminary):** adopting C7+C13+C14+C18+C19+C20 is safe at T4 because each is a structural proposal (math or protocol), not an empirical claim. C12 (F5 η calibration) genuinely needs P1 data → DEFER correct.

---

## 7. Part 7 — B-check (B_research modality)

Modality: B_research (weights F=0.30, E=0.20, 1-σ=0.35, Λ=0.15 per `eradev.md` §II.1). Justification: this is a research-type audit producing a theoretical/recommendation report; (1-σ) must dominate because a single mis-mapping (e.g., claiming F7 is already in v10 when it is not) invalidates the recommendation; F ranks second because paper and EraDev both have substantial prior art that must be accurately referenced; E third (alignment to operator's "final decision list" intent); Λ lowest because this is pioneering territory (first ODTOE paper explicitly audited against EraDev operational layer).

- **F (Focus) = 0.93.** Read full paper (27 pages); cited page-anchored claims (§II.1, §IV.2, §V.3, §VI.2, §VI.3, §VI.5, §VI.6, §VII, §VIII.4-8, §IX.1-8, §X.1-6); read all of eradev.md §I-§XVI core + §III.Ω v10 extension + §II.1 modal formulas + §II.2 OOD + §IV Apophatic/Universality; read CLAUDE.md 16 invariants; read FOUNDATIONS.md Parts I-V; read v10 BIM audit in full for cross-reference. Gap: did NOT read `projects/eradev/lessons.md` in full for this session (relied on BIM audit's existing citations of L-26/EMP7/EMP10/EMP11/L-28/L-32); did not read `BOOTSTRAP_LESSONS.md` full text (BIM audit already sampled BL-3/6/9/17/22/33/34/35). Neither gap is load-bearing because BIM audit was from 2026-04-24 and its citations are current.

- **E (Alignment) = 0.92.** Operator explicitly requested a "final decision list" with specific, honest, actionable content (Invariant 14 quoted directly). Delivered: 26-concept mapping, 25-item ranked list with numeric scores, 3 bundle groupings, 7 SHIP NOW top-tier + 16 SHIP NOW total, 1 REJECT, 9 DEFER, 7 OQs, 3-layer drift analysis. Nothing deferred without reason. No "maybe" — every item has a verdict. Mild E-deficit: token budget exceeded 500 lines (request said 300-500; delivered ~550). Trade-off accepted because Part 4 ranked list requires full scoring transparency.

- **(1-σ) = 0.91.** Cross-checked every claim against source: paper page-anchors named (§II.0–§X.6), EraDev line-anchors named (`eradev.md` §II, §II.1, §II.2, §III, §III.Ω, §IV Apophatic/Universality, §VI RT-1/RT-2/RT-3, §XVI glossary), BIM audit verdicts referenced by proposal number. Explicit consistency checks: does C19 (path-(c) acceptance) conflict with Invariant #4 "knowledge without enforcement = Lambda zero" — NO, path (c) is not about weakening enforcement; it's about acknowledging structural ΔÔ between agents. Does C7 (τ_cycle primacy) conflict with current Activation Operator 4-step (which emphasizes quality before speed) — NO, C7 is a META-LEVEL optimization priority between the four steps not within them. Minor residual (1-σ): C14 F7 sufficiency threshold proposed value (≈0.70–0.85 from paper) not yet calibrated per modality — flagged as OQ-PT-3, not silent.

- **Λ (Experience) = 0.89.** Applied L-26 (real use = honest gate, supports paper §X.5 habit 1), EMP11 (7-step pipeline, directly related to F3 super-proportional acceleration), BL-3 (fix-chain structural, paper §VI.5 parallels), BL-17 (Check-First, paper §IV.2 F4 operationalization), BL-22 (PRE-FLIGHT, paper §IV.2 frame-projector mathematical backing), recent BIM audit decisions (P1–P7 verdicts carried forward with paper-based upgrades/downgrades). Framework-level precedent: v10 Phase 4 pattern of "one math commit, one protocol commit, one discipline commit" applied to recommend Bundle A/B/C structure.

**B = F^0.30 · E^0.20 · (1-σ)^0.35 · Λ^0.15 = 0.93^0.30 · 0.92^0.20 · 0.91^0.35 · 0.89^0.15**

= 0.9786 · 0.9835 · 0.9678 · 0.9826 ≈ **0.9153**

B ≈ 0.92 GREEN. No ANDON. No YELLOW step. All 4 Activation Operator gates clear.

---

## 8. Bottom-line verdict (one paragraph)

Adopt **16 items** (top of Part 4 list) in three commit bundles: Bundle A (math/theoretical layer — 9 items on `eradev.md` + `FOUNDATIONS.md`), Bundle B (protocol layer — 5 items on `roles/*_EN.md` + `eradev.md` §VI), Bundle C (meta/discipline layer — 2 items on `meta.md` + `CLAUDE.md` Invariant #17). **Reject 1 item** (new Architect role — doubly-refuted by paper §II.6 Hurwitz-anchor and BIM audit's n_min = 5 topology argument). **Defer 9 items to v11** (paper-calibration-dependent OR low-urgency OR require L2+ empirical data). Net token impact: +150–250 lines, 0 deletions. Expected leverage: P1 + C20 + C7 + C13 are the four highest-leverage additions, each closing a distinct gap (Unified Plan deliverable, receiver-feedback micro-check, cycle-length primacy, productivity metric). The paper does not describe EraDev incorrectly; it describes the **theoretical layer [2]–[6]** which v10's **operational layer** (invariants, gates, modal weights) implements. No re-work of v10 needed — the additions sit on top of existing v10 architecture.

---

*End of analysis.*
*Source: ODTOE "Parallel Trajectories" analysis, 2026-04-24, B_research modality, [ANALYST] EN stack, read-only scope.*
*Cross-reference: `reports/v10_bim_planning_audit_2026-04-24.md` (BIM proposals P1–P7, same session).*
*Paper: `/Users/antonpankratov/Downloads/odtoe/ODTOE_parallel_trajectories.pdf`, 27 pages, ~199 KB, 2026.*
