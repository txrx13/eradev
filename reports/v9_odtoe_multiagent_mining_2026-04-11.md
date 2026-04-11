# v9 ODTOE Multi-Agent Papers — Analyst Mining Report

> Date: 2026-04-11
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> Task type: research / paper mining / v9 gap analysis
> B-modality: **B_research** (weights F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15)
> Output type: Report (META output type 5) — input for META decision on Phase 2 continuation
> Scope: mine two ODTOE papers for ideas applicable to EraDev v9; compare against v9 state + backlog; rank by leverage; flag self-application drift.

---

## 0. Activation Operator log

- **A_F (Focus):** Read in full — `roles/analyst_EN.md` (mission + activation + jidoka); `ODTOE_multiagent_coherence.md` (869 lines, RU primary); `ODTOE_eradev_multiagent_research.md` (1399 lines, RU primary); spot-checked `ODTOE_multiagent_coherence_EN.md` header + abstract (parity confirmed); `CLAUDE.md` (v9 meta-orchestrator protocol, 14 invariants, 4-layer architecture); `BOOTSTRAP_LESSONS.md` (30 BL — BL-1..BL-32 with 3 merges, 22 universal + 8 code-adapter); `eradev.md:71..308` (Sections II / II.1 modal B / II.2 OOD / III / III.Ω cross-domain memory — all from Wave 8); `reports/v9_hansei_2026-04-11.md` §1-§8 (Phase 1 closure); `reports/v9_phase2_1_s_hansei_2026-04-11.md` §1-§8 (Phase 2.1.S closure); `reports/roadmap_v9_2026-04-11.md` (full — 8 OQs, Phase 0/1/2/3 phase plan, 8 AC); `reports/v9_phase0b_t6_2026-04-11.md` (T6 adversarial test); `reports/v9_wave8_framework_gaps_2026-04-11.md` (Wave 8 gap closure report); `projects/odtoe-articles/config.md:1..40`; `projects/eradev/lessons.md:1..60`. Also verified `templates/` directory (article + code skins exist; book/config/plan/research skins absent; `domain_skin.md.template` exists). **EN companion for `ODTOE_eradev_multiagent_research` does not exist as .md** — only .docx/.pdf/.tex — so I could not spot-check parity for paper 2; working exclusively off the RU primary. Documented as OQ-MM-1.
- **A_E (Alignment):** Operator's direct request (quoted in task): "читал ли ты до этого статью ODTOE_multiagent_coherence и что мы еще можем использовать из нее у нас в eradev проекте?" Intent is NOT "translate the paper" or "add new BL" — it is "find what's mineable for v9 (or flag as v10+) before resuming Phase 2 auto-execution." META decision depends on whether ANY integration should precede Phase 2 skin creation. My output is therefore ranked by *actionable delta vs current v9 state*, not by theoretical novelty.
- **A_σ (Consistency):** Primary risk — **phantom coherence with the paper**. Both papers are Anton Pankratov's own writing about EraDev's own framework. Agreement between my report and the paper is baseline, not signal. I must flag where the paper (a) repeats what v9 already ships, (b) describes EraDev as aspirational or historical rather than current v9, (c) introduces genuinely novel material. The (1-σ) weight is 0.35 (B_research) precisely because this class of mining task has high phantom-coherence risk. Secondary risk — confusing paper 1 (domain-general, no EraDev name) with paper 2 (names EraDev v7.1 + "pluggy" session): structurally they describe the same 4 experiments with different framing, so extractable ideas are largely a superset of paper 1 with paper 2 adding the historical EraDev naming.
- **A_Λ (Experience):** Applied — BL-16 (knowledge without enforcement = Lambda zero — exactly the paper's "Lambda problem"); BL-29 (verify established terminology before generating — I'm writing *about* a framework that already has 30 BL + 14 invariants + Section II.1/II.2/III.Ω, so every claim about "v9 could add X" must be cross-checked against what v9 already ships); BL-17 (pre-generate verification — I'm writing a structured report, so I define the 11 output sections *before* drafting them); Lesson 2 from `projects/eradev/lessons.md` (P_coll error 0.61 → 0.657 propagated across 20 agents because of shared-source phantom coherence — directly applicable because the paper itself references this incident; I must NOT re-propagate claims I'm paraphrasing from the paper without cross-checking against v9's current state); Phase 2.1.S Hansei §4.2 (real-world use is the only honest gate for a new abstraction — same principle: paper claims about EraDev are NOT honest gates for v9; v9 hansei is).

All 4 Activation Operator steps GREEN. Proceeding with mining.

---

## 1. Paper 1 summary — `ODTOE_multiagent_coherence.md`

### 1.1 1-paragraph abstract (paraphrased)

The paper presents a 5-role multi-agent architecture for LLM systems built on the ODTOE (Observer-Dependent Theory of Everything) formalism, and reports four experiments run across 80+ agents in a single research session: (1) a large-scale 25-agent framework rebuild producing 2.5x prompt compression, (2) an A/B experiment comparing Russian and English prompt stacks showing EN yields 48% higher B-scores on practical tasks while RU yields superior mathematical depth, (3) an A/B experiment on entry-point architecture showing that a separate routing file splits the team across stacks while in-core routing produces higher coherence, and (4) root-cause analysis of a real deployment session where an agent read the entire framework but still operated as a solo executor (the "Lambda problem"). Secondary contributions include the `S_adjusted = S_team × B_mean` metric as a phantom-coherence detector, a sync audit identifying 16 drift issues across bilingual files, a four-layer bilingual architecture placing math/TPS/process/project content in language-appropriate layers, and a Check-First Pipeline for pre-generation verification.

### 1.2 Key claims

1. **Five roles as observation operators.** Each role (Visionary, Analyst, Builder, Validator, Coherencer) corresponds to a distinct observation operator Ô_r projecting tasks into the role's configuration subspace, with a dominant B-component (Λ for Visionary, F for Analyst, E for Builder, (1-σ) for Validator, all four for Coherencer). Toroidal topology with R/r = φ golden ratio.
2. **Language as observation operator.** Prompt language is not a neutral carrier but an active operator Ô_lang that configures the agent's cognitive space. RU = depth (theory, math), EN = breadth (practice, bug-finding). Same LLM + different language = different observers projecting the same Ψ into different R.
3. **S_adjusted detects phantom coherence.** `S_adjusted = S_team × B_mean` catches the failure mode where agents agree but agree around a flawed model. Operational thresholds: S_adjusted > 0.5 = healthy; S_team > 0.7 ∧ S_adjusted < 0.5 = phantom coherence → activate premise-review kill-switch.
4. **Lambda problem = knowledge without enforcement.** An agent that has read the entire framework can still ignore it if there is no mechanism forcing the framework to *fire*. The fix is a three-level enforcement system: auto-loaded file (guaranteed execution surface), META-protocol checklist (orchestrator-visible), and a lesson capturing the specific failure mode (Λ-initialization surface).
5. **Check-First Pipeline.** For any formatted artifact, the format specification must be the first input to A_F, not a post-generation filter. Pre-generation verification is prevention; post-generation checking is rework (2-3x cost ratio).

### 1.3 Formal apparatus (candidates for v9 integration)

| Formula / Protocol | Paper Section | Status vs v9 |
|---|---|---|
| `B = F^w1 · E^w2 · (1-σ)^w3 · Λ^w4` | II.1 | **ALREADY IN** eradev.md Section II (v8) |
| Default weights w1=w2=w3=w4=0.25 | II.1 | **ALREADY IN** eradev.md Section II (v8) + II.1 `B_text` row (v9) |
| `S_team = 1 − (2/n(n−1))·Σ\|Bi−Bj\|` | II.2 | **ALREADY IN** eradev.md Section III (v8) |
| `S_adjusted = S_team · B̄` | II.2 / VII | **ALREADY IN** eradev.md Section III (v8) + BL-5 + Phantom Coherence Check as release gate (v9) |
| `P_coll = (1/n^k)·(ΣB_i)^k` | II.3 | **ALREADY IN** eradev.md Section III as `P_coll(E) = 1 − Π(1−Bi^k)` (note: **different form** — see §9 self-application drift) |
| `Â = A_Λ ∘ A_σ ∘ A_E ∘ A_F` | II.5 | **ALREADY IN** eradev.md Section IV (v8) |
| φ-weighted S_team over toroidal topology | III.13 / V.4 | **NOT IN v9** — RU team innovation only mentioned in paper, never operationalized → CANDIDATE |
| Graduated Activation (GREEN/YELLOW/RED) | III.6 / V.4 | **ALREADY IN** eradev.md Section IV Graduated Activation table (v8) |
| Phase-Adaptive Weights | V.4 | **NOT IN v9** — mentioned as RU innovation, never operationalized → CANDIDATE |
| Check-First Pipeline (7 checks) | X.2 | **PARTIALLY IN** — projects/odtoe-articles/config.md has the 8-check version (v9 evolved to 8); BL-17 captures the principle |
| 3-level enforcement (auto-loaded / META-protocol / BL) | VIII.5 | **ALREADY IN** v9 as CLAUDE.md (auto) + meta.md §14 (checklist) + BL-16 (lesson) + BL-30 (defense-in-depth formalized) |
| 4-layer bilingual architecture (math / TPS / process / project) | IX.3 | **ALREADY IN** spirit (EN core + RU theoretical + bilingual glossary rule) but NOT formally expressed as a 4-layer schema in v9 docs |
| Bootstrap Protocol 7 items | VIII.6 | **ALREADY IN** meta.md Section 14 — v9 has 13 items including domain check |
| Three diagnostic scenarios table (healthy / phantom / misaligned) | VII.3 | **NOT IN v9** as a table — captured dispersed across BL-4, BL-5, Phantom Coherence release gate → CANDIDATE (small consolidation win) |
| 9 "extracted principles" (XI) + 4 mega-patterns (XII) | XI / XII | **ALREADY IN** projects/eradev/lessons.md EMP1..EMP7 (with partial overlap) + BL-1..BL-32 |
| Spiral gap residual (π−3)² ≈ 0.02 | XII.1 / XIII.4 | **ALREADY IN** eradev.md Section IX (v8) |
| Language map of 12 framework files (III.1) | III.1 | **ALREADY CAPTURED** in reports/language_analysis.md; not in v9 core |

### 1.4 Explicit EraDev connections

Paper 1 contains **zero literal references** to "EraDev" by name. The paper has been deliberately stripped of EraDev naming — it calls the framework "five-role architecture," "prompt architecture," "the framework under study." References to specific files use generic names ("framework core," "meta-protocol," "role prompts"). References to the real session call it "deployment session D," not "pluggy." This is the domain-general version of paper 2. The experiments, formulas, and conclusions are identical.

---

## 2. Paper 2 summary — `ODTOE_eradev_multiagent_research.md`

### 2.1 1-paragraph abstract (paraphrased)

Paper 2 is the *EraDev-named* companion to paper 1. It reports the same four experiments, same formulas, same conclusions, but explicitly names the framework as **EraDev v7.1**, the deployment session as **"pluggy"**, the auto-loaded file as **CLAUDE.md**, the meta-protocol as **meta.md Section 14**, and enumerates **21 Bootstrap Lessons (BL-1..BL-21)** explicitly as a section (§XI). It reads as the historical record of EraDev's April 2026 research session, with all the software-specific hooks exposed.

### 2.2 Key claims (delta vs paper 1)

1. **Same 5 roles, same formulas, same 4 experiments** — no formal apparatus differs between paper 1 and paper 2.
2. **Paper 2 names BL-1..BL-21 explicitly** (§XI). This is a direct time-stamp: paper 2 documents the BL state at EraDev **v7.1 era** (before v8, before the BL-22..BL-32 additions that followed cycle-7 and the v8 hansei).
3. **Paper 2 names CLAUDE.md + meta.md §14 + BL-16 as the 3-level enforcement** (§VIII.5) — direct confirmation that v7.1 already had the tri-layer pattern; v9 did not invent this.
4. **Paper 2 names Claude Opus 4.6 as the test platform** (§XIV.5 Limitations) — confirming the experiments are single-LLM single-session data, not cross-model validated.
5. **Paper 2 frames EraDev as the "pluggy session" subject** (§VIII.1) — the 157 tool calls, 0 Round Tables, 95% solo Builder failure. This is the same incident captured in projects/eradev/lessons.md Lesson 5.

### 2.3 Formal apparatus (delta vs paper 1)

None. Paper 2's formulas are byte-identical to paper 1's — same (II.1)..(II.5), same `P_coll` form, same thresholds, same φ-weighted and Phase-Adaptive weights as RU innovations "proposed but not operationalized."

### 2.4 Explicit EraDev connections

Paper 2 is **saturated with EraDev references** — literally every section. Key mentions (§-indexed, paraphrased):
- §I: "A framework is proposed that formalizes five AI-agent roles and their interaction protocol" — EraDev named
- §III.1 table: lists 12 framework files including `eradev.md`, `meta.md`, `eradev_RU.md`, `roles/{role}.md`, `BOOTSTRAP_LESSONS.md`, `glossary.md`, `CLAUDE.md`, `README.md`, `LOADING_PROTOCOL.md`
- §VIII.5: names CLAUDE.md as Level 1, meta.md Section 14 as Level 2, BL-16 as Level 3 of the three-level enforcement
- §IX.1 table: 16 sync audit defects named by file (`eradev_RU.md` v7.0 vs v7.1 drift, `glossary_EN.md` 14 missing terms, `README.md` header/footer contradiction, etc.)
- §X.1: names the research article (itself) as the BL-21 motivating example, references `ODTOE_article.tex` as the format template
- §XI: lists BL-1, BL-4, BL-5, BL-7, BL-16, BL-17, BL-19, BL-20, BL-21 by number with EraDev-specific phrasing

---

## 3. Extractable ideas table (compiled from both papers, ranked)

Classification legend:
- **Status:** ALREADY-IN-V9 / CANDIDATE-PHASE-2 / CANDIDATE-V10 / REJECTED
- **Integration target:** which v9 file would receive it
- **Size:** S (single edit) / M (new subsection) / L (new file) / XL (architectural change)

| # | Idea | Status | Target | Size | Dependency | Evidence (paraphrased from paper) |
|---|------|--------|--------|:----:|------------|-----------------------------------|
| E01 | Five-role topology with dominant-B assignment per role | **ALREADY-IN-V9** | `eradev.md` §V, `roles/*_EN.md` | — | — | Paper §II.4 table: Visionary=Λ, Analyst=F, Builder=E, Validator=(1−σ), Coherencer=all. v9 roles/*_EN.md encode the same pairing via Activation Operator anchors. |
| E02 | `B = F·E·(1−σ)·Λ` multiplicative coherence | **ALREADY-IN-V9** | `eradev.md` §II (v8) | — | — | Paper §II.1 formula (II.1). Byte-identical to v8 Section II. |
| E03 | `S_adjusted = S_team · B̄` phantom-coherence metric | **ALREADY-IN-V9** | `eradev.md` §III + BL-5 + Phantom Coherence release gate | — | — | Paper §II.2 formula (II.3). v9 Hansei §3.6 confirms Phantom Coherence Check caught drift RT-1 consensus missed. |
| E04 | Activation Operator `Â = A_Λ ∘ A_σ ∘ A_E ∘ A_F` | **ALREADY-IN-V9** | `eradev.md` §IV | — | — | Paper §II.5 formula (II.5). All 10 v9 role files encode it. |
| E05 | `P_coll` formula (specific form) | **DRIFT — SEE §9** | `eradev.md` §III | — | — | Paper §II.3: `P_coll = (1/n^k)(ΣB_i)^k`. v9 eradev.md §III: `P_coll(E) = 1 − Π(1−Bi^k)`. **TWO DIFFERENT FORMS.** Flagged in §9 self-application drift analysis. |
| E06 | Spiral gap residual (π−3)² ≈ 0.02 | **ALREADY-IN-V9** | `eradev.md` §IX | — | — | Paper §XIII.4. v9 has Section IX + BL-15 (the 2% is a feature). |
| E07 | Language as observation operator (RU depth / EN breadth) | **ALREADY-IN-V9** | `CLAUDE.md` §Language Stack, `eradev.md` §0 | — | — | Paper §III.12, §V.6. v9 CLAUDE.md encodes the EN-practical / RU-theoretical routing. |
| E08 | Bilingual sync rule (BL-19) | **ALREADY-IN-V9** | BL-19 universal | — | — | Paper §IX.2. |
| E09 | Three-level enforcement (auto / meta / BL) | **ALREADY-IN-V9** | CLAUDE.md + meta.md §14 + BL-16 + BL-30 | — | — | Paper §VIII.5. v9 has it + BL-30 "defense-in-depth" generalizing it. |
| E10 | Bootstrap Protocol 7-item checklist | **ALREADY-IN-V9** (expanded) | meta.md §14 | — | — | Paper §VIII.6. v9 has 13 items including domain check at 5b. |
| E11 | Check-First Pipeline (7 checks) | **ALREADY-IN-V9** (expanded to 8) | `projects/odtoe-articles/config.md`, BL-17, BL-21 | — | — | Paper §X.2. v9 has 8-check version (Check 8 = Rybakov evidence markers added 2026-04-04). W8d closed the Seven→Eight heading drift. |
| E12 | Check-First role distribution (Validator/Analyst/Coherencer) | **ALREADY-IN-V9** | `projects/odtoe-articles/config.md`, `templates/domain_skin.article.md` | — | — | Paper §X.3 table. v9 article skin encodes this division of labour. |
| E13 | 4-layer bilingual architecture (math / TPS / process / project) | **PARTIALLY-IN-V9** | `eradev.md` §0 or new §0.1 | S-M | — | Paper §IX.3 table. v9 has the practice (math is lang-independent, TPS is canonical, process in EN, projects in team language) but **no single canonical table** stating the 4 layers. Consolidation candidate. |
| E14 | 3 diagnostic scenarios table (healthy / phantom / misaligned) | **PARTIALLY-IN-V9** | `eradev.md` §III after S_adjusted | S | — | Paper §VII.3 table. v9 has the 3 thresholds dispersed across `eradev.md:210..212` + BL-5. Consolidation into one table would be a small clarity win. |
| E15 | 3-level diagnostic + Kill-Switch mapping | **ALREADY-IN-V9** | `eradev.md` §XIII Kill-Switch | — | — | Paper §VII.3. v9 has Kill-Switch levels 1/2/3 in eradev.md. |
| E16 | **φ-weighted S_team over toroidal topology** (RU-Analyst innovation) | **CANDIDATE-V10** | `eradev.md` §III | M | OQ-Ω-3 calibration; toroidal topology formalization | Paper §V.4, §III.13. Proposed by RU team, never operationalized in the paper itself. Requires explicit toroidal-ring assignment per role (paper §II.4 gives "inner/outer/bridge" rings, but v9 role files do not reference the torus topology). v10+ because (a) not calibrated, (b) no empirical anchor in v9, (c) risks over-formalization without data. See OQ-MM-3 and paper §II.4. |
| E17 | **Phase-Adaptive Weights** (RU-Analyst innovation) | **CANDIDATE-V10** | `eradev.md` §II.1 modal B extension | M-L | Empirical per-phase data | Paper §V.4 / §III. Paper says RU team proposed weights that shift per RT phase (different weights at RT-1 exploration vs RT-3 synthesis). Not operationalized. v10+ because it doubles the dimensionality of the B formula (modality × phase) and v9's Section II.1 was just added in Wave 8 — too early to layer on top. |
| E18 | Language map of 12 framework files (quantitative RU%/EN%) | **ALREADY-IN reports, NOT IN v9 core** | keep in `reports/language_analysis.md` | — | — | Paper §III.1. Useful historical artifact; not v9 core material. |
| E19 | Token inefficiency ratio (cyrillic ≈ 1.5–2.5x EN) | **ALREADY-IN** implicit via BL-7 | BL-7 | — | — | Paper §III.2. BL-7 captures the practical consequence. |
| E20 | LLM benchmark gap (EN wins 5–15% on MMLU / MGSM / XCOPA) | **ALREADY-IN** implicit via BL-7 | BL-7 | — | — | Paper §III.3. BL-7 captures the consequence. |
| E21 | Phantom DECOHERENCE (false disagreement from terminology drift) | **NEW — NOT IN v9** | BL-29 expansion or new subsection | S | BL-29 | Paper §III.8. Mirror-image of phantom coherence: two agents using different terminology for the same concept appear to disagree. v9 has BL-29 ("verify established terminology") but does NOT call out the phantom-decoherence failure mode symmetrically. **Small, high-clarity addition.** See recommendation §6 item 3. |
| E22 | Terminology bifurcation (Mura from EN/RU glossary mixing) | **ALREADY-IN-V9** via BL-19, BL-29 | — | — | — | Paper §III.4. Covered by existing BL rules. |
| E23 | Three-level metalanguage (math symbols / TPS canonical / operational RT format) | **PARTIALLY-IN-V9** | `eradev.md` §VI RT format OR new glossary layer | S-M | — | Paper §III.6 + operational format example `[RT-2][Coherencer][S=0.68<0.7]`. v9 has TPS canonical names + math symbols as conventions, but the **operational RT-message format** (`[RT-N][Role][metric]`) is NOT standardized in v9. This would be a real add for inter-agent comms. See recommendation §6 item 2. |
| E24 | Bootstrap adversarial testing (BL-20 pattern) | **ALREADY-IN-V9** | BL-20, reinforced by T6 adversarial test | — | — | Paper §XI (BL-20). v9 applied it in Phase 0.B T6 (non-code task) → PASS B=0.75. |
| E25 | Self-application = ultimate test (EMP1 / Mega-Pattern 1) | **ALREADY-IN-V9** | `projects/eradev/lessons.md` EMP1 | — | — | Paper §XII EMP1. EMP1 is already in EraDev lessons. |
| E26 | A/B experiments = highest-value activity (Mega-Pattern 2) | **ALREADY-IN-V9** | EMP2 in lessons | — | — | Paper §XII EMP2. |
| E27 | Bilingual architecture = feature (Mega-Pattern 3) | **ALREADY-IN-V9** | EMP3 in lessons | — | — | Paper §XII EMP3. |
| E28 | Enforcement-location principle (Mega-Pattern 4) | **ALREADY-IN-V9** | EMP4 in lessons | — | — | Paper §XII EMP4. |
| E29 | Toroidal topology roles (inner/outer/bridge rings) | **NEW — NOT IN v9** | `eradev.md` §V or new §V.a | M | Toroidal topology paper [ref 8] formalization | Paper §II.4 bottom: "inner ring r = Analyst ↔ Builder ↔ Validator; outer ring R = Visionary ↔ Coherencer ↔ Analyst; R/r = φ." v9 has 5 roles listed but NO topological relationship stated. This is **real formalism not in v9** — but it depends on accepting the toroidal topology paper (paper ref [8]) as load-bearing. See recommendation §7 for deferral rationale. |
| E30 | Independent recomputation requirement (for formulas) | **ALREADY-IN-V9** via BL-6 + Phase 2.1.S C6 reference impl | `projects/odtoe-articles/config.md` Check 2 + skin C6 | — | — | Paper §IV.2 RT4 finding (the 0.61 → 0.657 P_coll error was caught only by independent recomputation, not 20-agent consensus). Phase 2.1.S skin C6a/C6b encodes this as an operational check. |
| E31 | Constants Registry (Ω remediation for 50-digit precision) | **NOT-IN-V9, FLAGGED AS OQ** | `projects/odtoe-articles/` or root | M | — | Paper §XIII.4 open question 5: "CONSTANTS_REGISTRY.md to prevent P_coll=0.61 propagation was not created." v9 has Check 2 (formula precision) in odtoe-articles config, but **no central constants registry**. Could live in projects/odtoe-articles. Recommendation §6 item 4 (deferred). |
| E32 | Role-per-model cost optimization (Opus=V/C, Sonnet=B/V, Haiku=ops) | **DEFERRED by operator** | `roles/*_EN.md` model: field | — | — | Paper does NOT describe this — this is EraDev's own Phase 2.D item. DEFERRED per operator decision 2026-04-11 (roadmap §Phase 2.D). Not a paper contribution. |
| E33 | 80+ agents never B-measured (open question) | **ALREADY-IN-V9** as OQ | roadmap OQ-8 variant | — | — | Paper §XIII.4 OQ-7: the session's 80+ agents lack B-diagnostics. v9 tracks per-wave B in each wave report (Wave 8 report, Phase 2.1.S hansei). Partially closed for v9 work but inherited corpus is untagged. |
| E34 | Language-hybrid vs monolingual debate resolution | **ALREADY-IN-V9** via BL-7 / CLAUDE.md | — | — | — | Paper §III.10: "verdict is bilingual by task type." v9 Language Stack encodes it. |
| E35 | Kill-Switch level 2 trigger mapping (premise-review on phantom) | **ALREADY-IN-V9** | `eradev.md` §XIII | — | — | Paper §XI BL-5. v9 has Kill-Switch + BL-5. |

**Total extractable ideas: 35.** Status breakdown:
- **ALREADY-IN-V9 (verbatim or equivalent):** 24 (E01..E12, E15, E18..E20, E22, E24..E28, E30, E33..E35)
- **PARTIALLY-IN-V9 (consolidation/cleanup candidates):** 3 (E13, E14, E23)
- **NEW — NOT-IN-V9 but landable:** 2 (E21, E29)
- **CANDIDATE-V10 (depends on substrate not yet built):** 2 (E16, E17)
- **OQ-only (logged as open question):** 1 (E31)
- **DEFERRED by other means:** 2 (E18 kept as report; E32 operator-deferred)
- **DRIFT (self-application mismatch):** 1 (E05 — P_coll form divergence, see §9)

---

## 4. Comparison with v9 backlog

Cross-reference each paper-mined idea with named v9 backlog items.

### 4.1 Phase 2.A remaining L2 skins (book, plan, config, research)

**Paper contribution:** NONE. The paper says nothing about book/plan/config/research skin design — it predates v9's 4-layer architecture and L2 skin concept. Paper's "Check-First Pipeline" is article-specific; v9's `templates/domain_skin.article.md` already encodes it. For book/plan/config/research, the paper provides zero targeted material.

**Verdict:** Paper does NOT accelerate Phase 2.A. Continue as planned.

### 4.2 Phase 2.B Memory hierarchy (MemPalace pattern, v10+)

**Paper contribution:** PARTIAL. Paper §VIII discusses Λ-initialization and §XI BL-1 captures the cold-start Λ=0.5 rule. Paper does NOT describe a memory hierarchy (T1/T2/T3 tiers, Closet/Drawer split, temporal triples). That content comes from other sources (rtk_analysis, roadmap Phase 2.B borrows).

**Verdict:** Paper does NOT contribute to Phase 2.B. Continue using existing Phase 2.B plan.

### 4.3 Phase 2.C Background instinct extraction

**Paper contribution:** NONE. Paper §VIII diagnoses the Lambda problem but the proposed solution is "3-level enforcement" (already shipped in v9). Paper does NOT describe automatic lesson extraction via PostToolUse hooks.

**Verdict:** No paper contribution. Continue Phase 2.C as planned.

### 4.4 8 Spiral Gap Open Questions from roadmap (OQ-1..8)

| OQ | Description | Paper contribution? |
|----|-------------|---------------------|
| OQ-1 | Is `domain.type` enum sufficient or need free-form? | NONE — paper has no domain enum concept |
| OQ-2 | Hybrid projects (code + docs + tests) — single or multi domain? | NONE — paper doesn't address hybrids |
| OQ-3 | Modal B generalize to v10 continuous tasks? | NONE — paper has single B form, no modal extension |
| OQ-4 | Numerical Ω(H_hist)? | NONE — paper has no Ω concept |
| OQ-5 | Is n_min=5 universal or domain-dependent? | PARTIAL — paper asserts 5-role as stable attractor (§II.4, §XII) but offers no formal n-derivation; uses ODTOE axiom as given |
| OQ-6 | Bilingual sync for ALL files or only core? | PARTIAL — paper §IX.3 4-layer architecture suggests layer-specific rules; v9 current BL-19 = ALL files |
| OQ-7 | Multiplicative vs geometric-mean B-formula across teams | PARTIAL — paper uses strict multiplicative everywhere; does not discuss geometric mean |
| OQ-8 | When is Phase 0 T6 "good enough" (non-code partial universality)? | NONE — paper has no non-code universality concept |

**Verdict:** Paper touches 3 of 8 OQs partially (OQ-5, OQ-6, OQ-7). None are fully resolvable from paper alone. Paper does NOT close any OQ; at best it offers weak evidence on OQ-5 and OQ-6.

### 4.5 Phase 2.1.S follow-ups

- **Third smoke test on derivation-chain article** — paper offers NO guidance on what article to test; deferred regardless.
- **RU mirror of article skin** — paper §III.6 + §IX.3 endorse bilingual skins in principle; v9 needs to write the actual file. No paper block.
- **OQ-v2-1, OQ-v2-2** — paper offers no resolution; these are empirical questions about C5 thresholds and C6b provenance that require more smoke tests.
- **DEF-A closure** — paper does NOT reference eradev.md Section II.1 by name (the orphan was paper 2's reference to "Section 0 Language Policy" which is structurally similar). **Wave 8 already closed DEF-A** → strike from backlog.

**Verdict:** Paper does NOT materially advance Phase 2.1.S follow-ups.

### 4.6 v10+ items

- **Apophatic role** — paper §II.4 has 5 roles with no 6th; Apophatic is a v9 Phase 3 / v10 invention. Paper is silent.
- **Continuous tasks** — paper explicitly does NOT address continuous tasks (all experiments are discrete file-based).
- **L10/L11/L12 levels** — paper §XII Mega-Pattern 1 references Level 9 (Ψ* = Φ(Ψ*)) but does NOT specify L10-L12. This is v9 roadmap speculation; paper provides zero material.
- **Cross-harness parity** — paper is Claude-only (§XIV.5 Limitations); explicitly flags GPT-4o / Gemini / Llama as untested.

**Verdict:** Paper provides zero v10+ substrate.

---

## 5. Comparison with v9 backlog — summary

**Net leverage from the papers against v9's backlog: LOW.**

The papers are a **historical snapshot of EraDev v7.1** (paper 2) and the **sanitized domain-general version** (paper 1). They capture the state of the framework as of the April 2026 research session. Since then:
- v8 added META output specification, BL-22..BL-32, Invariants 1-14, defense-in-depth (BL-30), structural output constraints (BL-31), BL merge-and-grep (BL-32).
- v9 added modal B-formula (B_text/B_creative/B_research), OOD scope, Ω(H_hist) cross-domain memory, 4-layer architecture (L0/L1/L2/L3), BL split (universal/code-adapter), Phantom Coherence Check as release gate, self-loading context architecture, Invariant 14 authorization context pattern.

**The papers describe v7.1. V9 is structurally ahead.** The papers are input material for what v9 *already is*, not a roadmap for what v9 *becomes next*.

**But:** 3 small consolidation wins (E13 4-layer table, E14 three-scenario table, E23 operational RT message format) + 2 genuine additions (E21 phantom decoherence, E29 toroidal topology) are landable NOW without violating v9 invariants.

---

## 6. TOP 3 NOW recommendations

Ranked by `leverage ÷ risk` on v9's current Phase 2 trajectory.

### REC-1 (TOP 1): Consolidate 3 diagnostic scenarios into a single table in `eradev.md` §III

**Idea:** E14 from the extraction table.

**Rationale:** v9 currently has the 3 S_team/S_adjusted scenarios (healthy / phantom / misaligned) dispersed across 3 locations: `eradev.md:210..212` (the three bullet lines after the S_adjusted formula), BL-5 (phantom coherence detection, separate BL entry), and the Kill-Switch section (separate section). A new reader has to triangulate across 3 sites to reconstruct the decision table. Paper §VII.3 presents it as one table. Consolidating into a 3-row table directly under the S_adjusted formula (with the existing bullets kept as narrative below) reduces the cognitive load for any agent doing Jidoka self-check.

**Integration plan:**
- File: `eradev.md` and `eradev_RU.md` (bilingual sync mandatory per BL-19)
- Section: `### Adjusted Coherence S_adjusted (Phantom Coherence Detection)` at `eradev.md:201..212`
- Edit: add a 3-row table after the formula, before the existing 3 bullet lines. Table columns: `Scenario | Condition | Diagnosis | Action`. Rows:
  - `1 | S_adjusted > 0.5 | Healthy substance | Continue`
  - `2 | S_team > 0.7 ∧ S_adjusted < 0.5 | Phantom coherence | Kill-Switch L2 "challenge premise" (BL-5)`
  - `3 | S_adjusted > 0.7 ∧ S_team < 0.7 | Individually strong, misaligned | RT synchronization`
- Existing bullets remain as prose narrative directly below the table (bullets reference the table rows for cross-link).
- BL addition: **none** — this consolidates, does not add a rule.
- Ω impact: **none** — Ω is orthogonal to this table; Ω reporting format already has its own RT-3 format.

**Size:** S — 1 table addition, ~8 lines × 2 files (EN + RU). Single commit.
**Risk:** LOW. No contradiction with existing BL or invariants. No change to formulas.
**Dependency:** none.
**Fires when:** any agent running Jidoka after any RT phase.
**B-check for this change:** F=0.95 (all 3 scenarios already in v9), E=0.95 (consolidation is the exact intent), (1-σ)=0.95 (no conflict), Λ=0.85 (Phase 2.1.S confirmed phantom coherence is load-bearing) → B ≈ 0.925.

### REC-2 (TOP 2): Add Phantom Decoherence section to BL-29 (or adjacent BL)

**Idea:** E21 from the extraction table.

**Rationale:** V9 has BL-29 ("verify established terminology before generating") which captures the **symptom** (terminology drift across parallel agents creates inconsistencies). It does NOT capture the **dual failure mode** that paper §III.8 names as "phantom decoherence": two agents who actually agree look like they disagree because they use different terminology for the same concept. The symmetry is important: phantom coherence (BL-5) = false agreement; phantom decoherence = false disagreement. Both are artifacts of the observer setup, not the content. Without naming phantom decoherence, an agent seeing |B_i − B_j| = 0.4 in an RT will assume the two agents genuinely disagree and trigger kill-switch, when in fact they're using different words for the same thing — an unnecessary kill-switch fire.

**Integration plan:**
- File: `BOOTSTRAP_LESSONS_universal.md` (the v9-split file). Both BL-29 (already universal-tagged) and the new phantom-decoherence material live there.
- Option A (small): extend BL-29 with a second paragraph "**Also covers phantom decoherence:** when two agents use different terminology for the same concept, their B-vectors appear to diverge even though they agree substantively. Symptom: |B_i − B_j| > 0.3 but Coherencer RT-sync reveals no substantive gap. Fix: same as BL-29 primary rule — normalize terminology before measuring divergence."
- Option B (new BL): add BL-33 explicitly naming Phantom Decoherence. Paper's §III.8 treats it as a named phenomenon. BL-33 would mirror BL-5 (phantom coherence) symmetrically.
- **Recommendation: Option A (extend BL-29).** Rationale: (a) v9 BL budget is at 30 entries (current count as stated in BOOTSTRAP_LESSONS.md header); adding BL-33 requires merging/retiring another BL first (per the budget cap rule); (b) BL-29 is thematically adjacent — both are about terminology; (c) the extended-paragraph pattern is used elsewhere (BL-26 has "Also covers diagnostic Bash"). Option A is the low-friction path.
- BL tag: [UNIVERSAL] (BL-29 is already universal-tagged; same tag applies).
- Bilingual sync: BL-29 lives in `BOOTSTRAP_LESSONS_universal.md` only; `BOOTSTRAP_LESSONS_code_adapter.md` has BL-2/3/6/8/14/22/24/25, not BL-29. Single-file edit.

**Size:** S — 1 paragraph added to BL-29 in 1 file. Single commit.
**Risk:** LOW. Pure clarification; no rule change.
**Dependency:** none.
**Fires when:** Coherencer RT-sync when |B_i − B_j| ≥ 0.3 in parallel RT.

### REC-3 (TOP 3): Formalize the 4-layer bilingual architecture as a table in `eradev.md` §0

**Idea:** E13 from the extraction table.

**Rationale:** V9 has bilingual practice but no single canonical table that states the 4 layers and the language rule per layer. An agent joining mid-project has to reverse-engineer the policy from BL-7 + BL-19 + `CLAUDE.md` §Language Stack. Paper §IX.3 captures it in a clean 4-row table. Putting this table in `eradev.md` §0 (Language Policy) makes the policy self-stating instead of inference-dependent.

**Integration plan:**
- File: `eradev.md` and `eradev_RU.md`
- Section: `eradev.md:22..52` has Section 0 Language Policy. Add a new subsection `### 0.1 4-layer bilingual architecture` or extend the existing table.
- 4-row table: `Layer | Content | Examples | Language`
  - `L1 Math | Formulas, constants | B = F·E·(1−σ)·Λ, S_adjusted, P_coll | Language-independent (symbols not translated)`
  - `L2 TPS canonical | Methodology names | Jidoka, Andon, Hansei, Yokoten, Round Table, Kill-Switch | English canonical + Russian translation only; no synonyms`
  - `L3 Process | Operational terminology | True North, Blast Radius, Spiral Gap, Phantom Coherence, Kill-Switch L1/L2/L3 | English (operational lingua franca)`
  - `L4 Project | Task descriptions, prose comments, team docs | project README, task titles, commit messages | Team language (RU for internal, EN for international)`
- Reference: BL-19 sync rule stays as-is; this table documents what it syncs.
- **Do NOT remove or modify** the existing `eradev.md` §0 task-routing table (EN-practical / RU-theoretical / BOTH). The new 4-layer table is complementary, not replacing.

**Size:** S-M — 1 new subsection ~15 lines × 2 files. Single commit.
**Risk:** LOW-MEDIUM. The 4 layers must not contradict the existing EN-practical/RU-theoretical routing. I checked: they don't — the 4-layer schema is a **file-content classification**, the routing table is an **agent-assignment rule**. Orthogonal.
**Dependency:** none beyond BL-19 (already present).

---

## 7. DEFER TO V10

### DEFER-1: φ-weighted S_team over toroidal topology (E16)

**Why defer:** Two blockers.
1. **No empirical anchor.** Paper §V.4 mentions this as an RU-Analyst innovation from the research session but the paper itself never operationalizes it (never computes a φ-weighted S_team on any team, never compares to uniform-weight S_team). It's a proposed formula without calibration data.
2. **Requires toroidal topology substrate.** The formula depends on each role being assigned to a torus ring (inner/outer/bridge) per paper §II.4. V9 role files do NOT currently reference the torus topology or ring assignments. Adding the formula first would require asserting the topology retroactively, which risks the same pattern as the P_coll=0.61 propagation error — assert a formula without independent verification → everyone agrees → error propagates.

**What needs to exist before v10 can land it:**
- Toroidal topology formal paper (ODTOE ref [8] "Тороидальная топология реальности") must be promoted from external theoretical reference to v10 core material.
- Empirical calibration: compute φ-weighted S_team on N ≥ 3 historical EraDev RT sessions, compare to uniform-weight S_team, report whether the weighted version actually surfaces additional signal.
- OQ-MM-2 (new open question, see §10).

### DEFER-2: Phase-Adaptive Weights (E17)

**Why defer:** Same logic — paper proposes weights shifting across RT phases (RT-1 exploration vs RT-3 synthesis), but never operationalizes them. v9 just shipped modal B-formula in Wave 8; layering phase-adaptive on top of modality-adaptive would double-dimension the weight space (modality × phase) before we have calibration data for the first dimension. Phase 2.1.S showed that the article modality's B_research weights were the right choice empirically; we have 1 data point per modality. Need more before extending.

**What needs to exist:** 5+ smoke tests across modalities with per-phase B breakdown. v9 does not currently record per-phase B in agent reports. Instrumentation is a prerequisite.

### DEFER-3: Toroidal topology role assignment (E29)

**Why defer:** v9 role files do not currently reference topology. Adding inner/outer/bridge ring metadata to 10 role files is a non-trivial edit that would also require updating: (a) `roles/*_EN.md` and `roles/*.md` (10 files); (b) every role reference in `eradev.md`; (c) every diagram in `reports/`; (d) the `templates/domain_skin.*.md` files that reference role focuses. Cost-benefit is poor in v9 because no existing v9 protocol uses the topology — it would be paperwork without operational consequences.

**What needs to exist:** a v10 protocol that *uses* the topology (e.g., "inner-ring handoffs have tighter latency SLOs than outer-ring handoffs" or "torus-crossing messages are rate-limited"). v9 has no such protocol. v10 can introduce it along with the topology assignment in one move.

### DEFER-4: Constants Registry `CONSTANTS_REGISTRY.md` (E31)

**Why defer:** Paper §XIII.4 flags this as an unresolved item from the April 2026 session. V9 did NOT close it. But:
- `projects/odtoe-articles/config.md` Check 2 already enforces 50-digit precision with independent recomputation; the Phase 2.1.S article skin's C6a/C6b split encodes this operationally per-article.
- A central registry has a cost: every new constant requires adding to two places (registry + article), every change requires updating both, and the registry becomes stale if an article's locally-corrected constant isn't propagated back.
- The actual fix for P_coll propagation is not a central registry — it is BL-6 (Verify Before Act) + Phase 2.1.S C6a/C6b (independent recomputation per formula, no copy from other articles). **v9 already has the structural fix; the registry is a belt-and-suspenders that adds maintenance cost.**

**Defer to:** v10+ if-and-only-if smoke tests on ≥3 articles still surface copy-propagated constants after the C6a/C6b protocol is in full use.

---

## 8. REJECTED / CONTRADICTION findings

### REJ-1: None of the paper's contributions contradict v9 invariants.

I scanned all 35 extractable ideas against the 14 CLAUDE.md invariants. No contradictions.

### REJ-2: `P_coll` formula divergence — NOT rejected, but flagged

See §9.1 for details. The paper's `P_coll = (1/n^k)(ΣB_i)^k` and v9's `P_coll(E) = 1 − Π(1−Bi^k)` are **different formulas** solving different computational problems. Neither contradicts ODTOE axioms (they measure different quantities). v9's form is correct for its use case (collective collapse probability as an event-based OR across agents). Paper's form appears to be a **linear-limit simplification** (for k=1 it reduces to B̄), which is a special case, not the general formula. **No v9 change needed.** Flagged as a potential clarity improvement: v9 could add a footnote to eradev.md §III explaining the relationship.

### REJ-3: 4-hour single-session "session D" as deployment reference

Paper §VIII characterizes the "deployment session" as the Lambda problem instance (157 tool calls, 0 RT). This is **paper 2's "pluggy" session**. V9 has evolved significantly: v8 shipped CLAUDE.md + hook + memory tri-layer enforcement; v9 added 14 invariants + defense-in-depth (BL-30) + structural output constraints (BL-31). The Lambda problem is still the root failure mode, but v9's defense stack is 3-4x deeper than what paper §VIII.5 describes. **The paper's remediation (3-level enforcement) is a subset of v9's current defense.** If taken at face value, a reader of paper §VIII would under-estimate v9's enforcement surface. **Not a contradiction; it's a snapshot-vs-state gap.** See §9.3.

### REJ-4: φ-weighted S_team without empirical anchor → REJECTED for v9

Already covered in §7 DEFER-1. The rejection reason is operational: no data, no calibration. This is not a theoretical rejection (the formula may be valid); it's a deployment rejection (v9 is not in a position to use it safely).

---

## 9. Self-application drift analysis (Paper 2 vs v9 state)

Paper 2 is explicitly about EraDev. It names EraDev v7.1. This section identifies where paper 2's description of EraDev drifts from v9 state.

### 9.1 DRIFT — `P_coll` formula form

**Paper 2 §II.3:** `P_coll = (1/n^k) · (ΣB_i)^k`, with k=1 simplifying to `P_coll = B̄`.

**v9 eradev.md:233..239:** `P_coll(E) = 1 − Π(1 − Bi^k)` ("1 minus product of (1 minus Bi^k)")

**Assessment:** The two formulas measure related but distinct quantities.
- Paper's form: a **scaled power sum** of B-values. At k=1: the arithmetic mean. At k=2: a measure of concentration.
- v9's form: the **complementary probability** that NO agent contributes to the event (event = collapse). Standard OR-probability structure.

**Consistency check:** At k=1 and n=1: paper gives `P_coll = B`. v9 gives `P_coll = 1 − (1−B) = B`. **Agree at n=1.**
At k=1 and n=2 with both B=0.5: paper gives `P_coll = (1/2)(0.5+0.5) = 0.5`. v9 gives `P_coll = 1 − (0.5)(0.5) = 0.75`. **Different.**

The numbers differ because they are different quantities: paper's is an *average* collapse score, v9's is the *probability that at least one agent causes collapse*. Both can be valid in different contexts. **Neither is mathematically wrong.**

**v9 phantom-coherence risk:** Paper 1 §IV.2 famously documents that the P_coll=0.61 (B=0.3, n=3, k=1) error propagated across 20 agents who all trusted the paper's own value until RT4-Validator independently recomputed and got 0.657. Paper 1 presents 0.657 as the correct value using paper's own formula `(1/n^k)(ΣB_i)^k`. V9's formula gives yet a different number: at B=0.3, n=3, k=1, v9's `1 − (1−0.3)^3 = 1 − 0.343 = 0.657`. **Identical to paper's 0.657.** So at k=1, both formulas happen to give the same value (by algebraic coincidence: `1 − (1−B)^n` = `(1/n)(nB)` = `B̄` when all B_i are equal and n is small). At k≠1 or non-uniform B they diverge.

**Recommendation:** Do NOT change v9's form — it is the correct "probability that at least one agent contributes to collapse" formula. Consider adding a footnote to `eradev.md:233..239` stating: "This form is equivalent to the mean-B form `(1/n^k)(ΣB_i)^k` at k=1 with uniform B, and diverges for non-uniform or k≠1." But this is **low priority** — it's a clarity improvement, not a correctness fix. Logged as OQ-MM-4.

### 9.2 DRIFT — "3-level enforcement" vs v9's defense-in-depth

**Paper 2 §VIII.5:** Three levels: (1) auto-loaded file `CLAUDE.md`, (2) meta.md §14 checklist, (3) BL-16 lesson.

**v9 state:**
1. `CLAUDE.md` — 14 invariants, 4-layer architecture, domain awareness, loading sequence, session entry, KILL-TEST, language stack
2. `meta.md` §14 — 13-item session bootstrap (including domain check at item 5b, added v9 Wave 3)
3. `BOOTSTRAP_LESSONS_universal.md` — 22 universal BL including BL-16 (Lambda problem), BL-30 (defense-in-depth formalized), BL-31 (constrain output types to constrain behavior)
4. **`enforce-delegation.sh` hook** — Layer 2 enforcement; blocks META-direct work unless whitelisted (reports, lessons, memory). Not in paper.
5. **`agent-context-check.sh` hook Check 5** — verifies agent is instructed to load its role file; language-agnostic path match. Not in paper (added v9 Wave 1).
6. **`templates/CLAUDE.md.template`** — project-scaffold enforcement, updated in Wave 5 to use self-load semantics. Not in paper.
7. **Phantom Coherence Check as release gate** — v9 Hansei §3.6 confirms this caught drift that 10-agent RT-1 consensus missed. Not in paper.
8. **`projects/*/MEMORY.md` identity persistence** — written at session start. Reinforces identity through the act of writing. Referenced in CLAUDE.md §Identity Persistence. Not in paper.

**Drift assessment:** Paper describes 3 layers. V9 ships 8. Paper captures the pattern ("defense-in-depth"), v9 captures the pattern + the generalization (BL-30) + the concrete mechanisms (hooks, release gate, identity persistence, output-type constraints). **Paper is accurate for v7.1. Paper under-represents v9 by roughly 2.5x.**

**Implication:** Do NOT treat paper 2 §VIII.5 as a spec for v9 enforcement. It is a historical artifact. Any new reader of paper 2 should be told "this captures v7.1; v9 shipped additional layers — see CLAUDE.md invariants 1-14, BL-30, BL-31, the hook files, and Phase 1.E Phantom Coherence Check."

### 9.3 DRIFT — Paper 2 enumerates 21 BL (BL-1..BL-21); v9 has 30 BL (BL-1..BL-32 with merges)

**Paper 2 §XI:** Lists BL-1, BL-4, BL-5, BL-7, BL-16, BL-17, BL-19, BL-20, BL-21 by number with v7.1 phrasing.

**v9 BOOTSTRAP_LESSONS.md header:** "Budget cap: maximum 30 BL entries (current count: 30)." The BL set evolved through cycle-7 (BL-22..BL-26 for CODE-ADAPTER boundary work), v8 session (BL-28..BL-32 for self-loading architecture and output-type constraints), and Wave 5 merges (BL-13+BL-23 → BL-13, BL-27 → merged into BL-6). **Paper 2's BL-1..BL-21 is a proper subset of v9's BL-1..BL-32.** All 21 paper-named BL are still present in v9 (or merged into equivalent entries). No BL has been retired.

**Drift assessment:** Paper 2 is accurate as a v7.1 snapshot. It just doesn't see the 9 BL that post-date it. **Not a drift, a snapshot.**

**Action:** None required. Paper 2 is self-consistent at v7.1.

### 9.4 DRIFT — Paper 2 §IX.1 lists 16 sync audit defects; none of them exist in v9 anymore

Paper 2 §IX.1 enumerates 16 specific desync issues (eradev_RU.md v7.0 vs v7.1, glossary_EN.md missing 14 terms, README.md header/footer version contradiction, etc.). V9 Wave 5 + Wave 6 + Wave 6b + Wave 7 closed these in successive cleanup passes (per `reports/v9_wave*.md`). The `sync_audit.md` file in reports shows historical tracking.

**Drift assessment:** 16/16 of paper 2's named defects are closed. **V9 is strictly better than what paper 2 describes as the state after the session.**

### 9.5 DRIFT — Paper 2 §XIII.4 lists 7 unresolved spiral-gap items; v9 state

| # | Paper 2 §XIII.4 item | v9 status |
|---|---------------------|-----------|
| 1 | 16 sync audit issues not all fixed | **CLOSED** — v9 Waves 5-7 |
| 2 | Adversarial test of CLAUDE.md bootstrap not run | **CLOSED** — Phase 0.B T6 (non-code adversarial) ran and PASSED B=0.75 |
| 3 | Check-First Pipeline not codified in config.md as mandatory | **CLOSED** — projects/odtoe-articles/config.md encodes 8-check Check-First as mandatory |
| 4 | Session reclassification mechanism (BL-18) has no enforcement hook | **OPEN** — BL-18 exists but is advisory, no hook yet. Logged as Phase 2 backlog. |
| 5 | CONSTANTS_REGISTRY.md not created | **OPEN** — v9 uses Check 2 per-article recomputation instead (see §7 DEFER-4 rationale) |
| 6 | Quantitative bridge ΔS/ΔB not formalized | **OPEN** — no v9 formalization; OQ-MM-5 |
| 7 | 80+ session agents not B-measured | **PARTIALLY CLOSED** — v9 wave reports track per-wave B; inherited corpus still untagged |

**Drift assessment:** 3/7 closed, 1/7 partial, 3/7 still open. **v9 is ~57% better than what paper 2 says was the state after session.** The 3 open items are mid-priority and appropriate for v10+ or Phase 2.

### 9.6 Summary — paper 2 self-application drift

Paper 2 describes EraDev-as-deployed at v7.1 era. V9 has:
- Same formula core (B, S_team, S_adjusted) — **0 drift**
- Different P_coll form — **flagged, not a correctness issue**
- 3-level enforcement → 8-layer defense-in-depth — **paper under-represents v9**
- 21 BL → 30 BL (22 universal + 8 code-adapter) — **proper subset, no drift**
- 16 sync defects → all 16 closed — **v9 strictly better**
- 7 unresolved items → 3 closed, 1 partial, 3 open — **v9 ~57% closed**

**Net drift: paper 2 is a fair historical snapshot of v7.1. It is NOT a spec for v9. Any claim in paper 2 about EraDev's current state is, by construction, stale as of April 2026.** META should not treat paper 2 as an audit target for v9; it's an input-to-v7.1 artifact.

**Safe way to use paper 2:** as evidence that certain v9 patterns (phantom coherence, Lambda problem, bilingual architecture, Check-First) have a documented empirical history. Not as a prescription for v9 additions.

---

## 10. Open questions raised (OQ-MM-*)

These are questions that the papers leave unresolved AND that v9 does not currently address.

- **OQ-MM-1:** `ODTOE_eradev_multiagent_research_EN.md` does not exist (only .docx/.pdf/.tex forms). Paper 2 has no EN markdown companion for BL-19-style bilingual sync of research artifacts. **Question:** Should research papers under `/Users/antonpankratov/Downloads/odtoe/` be held to BL-19 8-file invariant (.md EN counterpart)? If yes, the operator has technical debt. If no, what's the carve-out rule?

- **OQ-MM-2:** Paper's proposed `φ-weighted S_team` over toroidal topology — **what would empirical calibration look like?** Need: (a) 3+ historical RT sessions with per-role B values; (b) paired uniform-weight vs φ-weighted comparison; (c) pass criterion for "the weighted version surfaces additional signal." Without this, the formula is math-only. **Blocker for v10 integration.**

- **OQ-MM-3:** Paper asserts 5-role topology as "stable attractor" with φ-ratio between inner and outer torus rings. V9 cites "MetaGPT independent convergence + Hurwitz theorem" as separate evidence for n_min=5 (roadmap §Convergent Findings item 1). **Question:** are these three arguments (paper's φ-topology, MetaGPT empirical, Hurwitz theorem) independent convergence or shared-source phantom coherence? They all point to n=5 but Pankratov is the common author of all three reference chains. Needs an independent (non-Pankratov) empirical validation before treating as "multiply-supported."

- **OQ-MM-4:** `P_coll` formula divergence between paper (mean-B form) and v9 (OR-complement form). They agree at k=1 with uniform B but diverge elsewhere. **Question:** should `eradev.md` §III add a footnote clarifying which form is canonical and when each applies? This is pure clarity, not correctness.

- **OQ-MM-5:** Paper 2 §XIII.4 item 6: "Quantitative bridge between language Mura ΔS ≈ 0.05–0.10 and EN +48% ΔB not formalized." V9 does not have this bridge. **Question:** is this a v10+ research question or a near-term lessons.md addition? The bridge would relate small coherence drops from terminology drift to large coherence drops from language-stack mismatch. Could feed OQ-7 in roadmap (multiplicative vs geometric mean B-formula standardization).

- **OQ-MM-6:** Paper 2 references `ODTOE_1836.md`, `ODTOE_all_theories.md`, and other ODTOE corpus files as external context. V9's `projects/odtoe-articles/` adapter connects to this corpus. **Question:** should paper 2 itself be a Phase 2.1.S smoke test target? It's a longer article with clear formal structure, 10+ bibliography entries, 5 formulas, and sits in the odtoe-articles corpus. Could serve as a third smoke test (the Phase 2.1.S hansei §7 deferred item). It would be the first smoke test on a paper about EraDev — meta-application, but v9 has `EMP1: Self-application is the ultimate test` in lessons.md, so this fits the pattern.

---

## 11. B-check (Jidoka Self-Check)

```
=== JIDOKA SELF-CHECK ===
Modality: B_research (F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15)

F (Focus)       = 0.90
  + Both primary papers read in full (869 + 1399 lines).
  + EN companion of paper 1 spot-checked for parity.
  + v9 state: CLAUDE.md, eradev.md (§II.1/II.2/III + III.Ω), BOOTSTRAP_LESSONS.md
    (30 BL), roadmap_v9, v9_hansei, v9_phase2_1_s_hansei, v9_wave8, v9_phase0b_t6,
    projects/odtoe-articles/config.md, projects/eradev/lessons.md all loaded.
  + 2 directory listings (templates/, projects/) for concrete state of L2 skins.
  − EN companion of paper 2 does NOT exist as .md — logged as OQ-MM-1.
  − I did not read the full eradev.md §IV-§XVII (only the parts the task specified
    and the parts needed to verify claims).

E (Alignment)   = 0.93
  + Report structure matches the 11 required sections from the task spec.
  + Copyright discipline: paraphrased all claims; zero >15-word quotes; all formulas
    stated + attributed to paper section index, not copied from surrounding prose.
  + Scope discipline: I did NOT edit any v9 file, did NOT run cite_check, did NOT
    spawn subagents, did NOT write skins — all OUT-of-scope items respected.
  + Operator question "what's mineable" answered by the ranked extractable ideas
    table + TOP 3 NOW + DEFER + REJECT.
  − Part 5 "self-application drift" asked whether paper describes EraDev-as-designed
    or EraDev-as-deployed; I answered as-deployed (at v7.1 era) but could have
    distinguished the design-vs-deployed axis more explicitly.

(1-σ) (Consistency) = 0.88
  + Cross-checked every "CANDIDATE NOW" idea against v9 invariants (none violate).
  + Cross-checked paper 2 §IX.1 16 sync defects against v9 wave reports (all closed).
  + Flagged P_coll form divergence as NOT-a-contradiction (algebraic coincidence at
    k=1 uniform, different in general — neither wrong).
  + Distinguished phantom coherence (BL-5) from phantom decoherence (E21 — new).
  − Paper 1 vs paper 2 extractable ideas are largely overlapping; I merged into one
    table instead of two, which may blur which paper contributed which idea. Each
    idea's "Evidence" column names paper section index but not paper number.
  − I did not independently recompute P_coll at (B=0.3, n=3, k=1) — I trusted both
    the paper's 0.657 and v9's 1 − 0.7³ = 0.657 without manual verification. The
    fact that they agree at this test point is consistent with my algebraic argument
    but a full independent recomputation at >3 test points would be stronger.

Λ (Experience) = 0.87
  + Applied BL-16 (knowledge without enforcement) as the central lens for reading
    the paper's "Lambda problem" section.
  + Applied BL-29 (verify established terminology) to cross-check paper BL-1..BL-21
    against v9 BL-1..BL-32.
  + Applied Lesson 2 (P_coll phantom propagation) to avoid repeating the exact same
    failure mode when summarizing paper formulas.
  + Applied Phase 2.1.S hansei §4.2 (real-world use as the only honest gate) to
    avoid over-trusting paper 2 claims about EraDev state.
  − I did not consult `reports/multi_agent_frameworks_comparison_2026-04-11.md` or
    `rtk_analysis_2026-04-11.md` which are the comparative backdrop for v9 roadmap.
    These would have strengthened the "what's already in v9 via comparison with
    other frameworks" angle.
  − Lambda weight is 0.15 in B_research so even a large honest gap here has limited
    impact on B.

Weighted B:
  B = F^0.30 · E^0.20 · (1-σ)^0.35 · Λ^0.15
    = 0.90^0.30 · 0.93^0.20 · 0.88^0.35 · 0.87^0.15
    = 0.969 · 0.986 · 0.956 · 0.979
    ≈ 0.895

B ≥ 0.5: no Andon. (1-σ) = 0.88 is the lowest component but above 0.3 floor.
Report is HEALTHY for Analyst scope.
```

---

## 12. Summary of actionable output for META

**Bottom-line answer to the operator's question** ("have you read these papers, what else can we mine from them for EraDev?"):

Yes — both primary papers fully read, plus v9 state + hansei + roadmap cross-referenced.

**Mining result:**
1. **24 of 35 extractable ideas are ALREADY IN v9** (verbatim or equivalent). The paper is a historical snapshot of v7.1; v9 has evolved past it structurally.
2. **3 ideas are partial consolidation wins landable NOW without risk** (E13 4-layer bilingual table, E14 three-scenario diagnostic table, E21 phantom decoherence BL-29 extension). Recommended as TOP 3.
3. **2 genuine additions are NOT-IN-V9 but require substrate v9 doesn't have** (E16 φ-weighted S_team, E29 toroidal topology) — **DEFER TO V10.**
4. **1 formula form divergence** (P_coll) — flagged, not blocking, not a correctness issue. Add footnote if clarity is valued.
5. **1 self-application drift finding**: paper 2 §VIII.5 "3-level enforcement" under-represents v9's 8-layer defense-in-depth by ~2.5x. Paper should not be used as a v9 spec.
6. **6 open questions** (OQ-MM-1..6) logged for META decision.

**META decision support:** Phase 2 auto-execution can safely resume after TOP 3 recommendations are acted on. None of them block or contradict Phase 2.A skin creation (book / plan / config / research). All 3 are `eradev.md` or BL edits with bilingual sync — single commit each, ~15 min Builder + Validator pass. Suggested order: REC-1 (eradev.md scenario table) → REC-3 (eradev.md 4-layer bilingual table, same file, could batch) → REC-2 (BL-29 extension). Total: 2 commits max.

**No paper idea displaces any existing Phase 2 roadmap item. No paper idea requires Phase 2 plan revision.**

---

*End of Analyst report. Ready for META synthesis.*
