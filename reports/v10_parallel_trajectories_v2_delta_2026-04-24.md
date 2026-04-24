# EraDev v10 — Delta Study of ODTOE "Parallel Trajectories" v2 vs v1

> Date: 2026-04-24
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> B-modality: B_research (weights F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15)
> Output type: Report (META output type 5 — delta audit against prior analysis)
> Scope: Compare `/Users/antonpankratov/Downloads/odtoe/ODTOE_parallel_trajectories.pdf` (current, 32 pages, 229 KB) against the v1 snapshot used for `reports/v10_parallel_trajectories_analysis_2026-04-24.md` (claimed 27 pages / 199.8 KB). Produce ADOPT/ADAPT/DEFER/REJECT verdicts ONLY for genuine deltas. Current state: v10 post-Bundle-D (Invariant 17 τ_cycle, F3/F5/F6/F7/F10/F11, RIGOR_LEVEL, FLUX, μ-check, path-(c), Four Working Habits, NFL attributed — 16 SHIP items already shipped).
> Paper reference: Панкратов А.С., «Мета-эпистемология малых групп: цикл обратной связи как первичный оператор познания в многоагентных конфигурациях» (preprint, 2026).
> Copyright discipline: paraphrase; no >15-word direct quotes.
> Scope: read-only research, no framework edits.
> META direct request (Invariant 14): "исследуй заново статью ODTOE_parallel_trajectories.pdf там были некоторые изменения, что то необходимо поменять фреймворка?"

---

## 0. Activation Operator log

- **A_F (Focus).** Read IN FULL — current paper pages 1–32 (all of Abstract, §I–§X, Appendix A derivation status table, Appendix B 50-digit numerical verification, Appendix C twenty case vignettes, full References 1–37). Read IN FULL — `reports/v10_parallel_trajectories_analysis_2026-04-24.md` (v1 analysis, 310 lines) as the baseline snapshot. Spot-checked live framework state: `eradev.md` §II/§III/§VI (Invariant 17, F3/F5/F6/F7/F10/F11 presence), `CLAUDE.md` (17 invariants including τ_cycle primacy), `FOUNDATIONS.md` (Schön attribution for μ-check, NFL attribution). Did NOT re-read role files in full because v1 analysis documents their post-Bundle state.
- **A_E (Alignment).** Operator asks "что то необходимо поменять фреймворка?" — intent = specific yes/no answer grounded in a genuine comparison, not a re-run of v1 analysis. Deliverable: file-changed? how? what new content exists? is anything worth a Bundle E commit?
- **A_σ (Consistency).** Cross-check: paper does NOT redefine any ODTOE axiom (§II.0 reiterates "verbatim reproduction, no redefinition"); Appendix A explicitly tags every formula with status (Derived/Definition/Extension/Hypothesis/Threshold). Any delta is ADDITIVE to v10 — no reversion of Bundle A–D adopts. Cross-check against v10 OOD scope: paper §X.1 still accepts `ood_scope: continuous → REJECT` as an inherited limitation (RV-03). No invariant conflict.
- **A_Λ (Experience).** Applied L-26 (inspection ≠ use — when checking if framework is aligned with paper, compare against what SHIPPED, not what was PROPOSED); BL-33 (mirror-sync risk after any core file change); BL-16 (knowledge without enforcement = Lambda zero — don't propose additions that would duplicate shipped content); v1 analysis's own OQ-PT-3 (per-modality B_min calibration pending) as a likely candidate to revisit here.

All 4 steps GREEN. Proceeding.

---

## 1. Part 1 — Metadata delta

| Attribute | v1 snapshot (per v1 analysis) | v2 current | Δ |
|---|---|---|---|
| mtime | ≤ 2026-04-24 (v1 analysis date) | 2026-04-24 16:52 | updated same day, later |
| filesize | 199.8 KB (v1 analysis §0 "~199 KB") | **234,587 bytes (229 KB)** | **+34.7 KB (+17%)** |
| page count | 27 (v1 analysis §0 states "27 pages") | **32 pages** | **+5 pages (+18.5%)** |
| empirical corpus size cited in paper | v1 analysis treated as "36-case corpus" (quoted in shipped `eradev.md:453`) | Appendix C lists **20 cases explicitly**; §III.5 says "двадцатью наблюдательными кейсами" | **-16 cases** — v1 analysis number was inaccurate |

**Verdict: file HAS changed materially.** Continue to structure-level comparison.

---

## 2. Part 2 — Section-by-section comparison

Section numbers unchanged (I–X + Appendices). Formula numbering F1–F11 unchanged (no F12+). Prediction numbering P1–P6 unchanged (no P7+). Content shifts documented below.

| Section | v1 state | v2 state | Nature of change |
|---|---|---|---|
| Abstract | 1-para EN + RU | unchanged structure | **SAME** |
| §I Introduction | existed | unchanged | **SAME** |
| §I.0 Metaphor (recipe not transferring) | existed | unchanged | **SAME** |
| §II Theoretical basis + §II.0 symbol summary | existed | unchanged structure (same B, S_team, S_adjusted, Ô, ι, ε_spiral, Ĥ, n_min=5) | **SAME** |
| §III.1–§III.2 Relativity of knowledge | existed | unchanged | **SAME** |
| **§III.3 Knowledge as socio-dialogic construction — "Разграничение с литературой" block** | "brief treatment" (v1 analysis reports no explicit contrast block) | **EXPANDED: now contains explicit distinction against Hutchins [33], Nonaka-Takeuchi [34] SECI, Sperber-Wilson [35] relevance theory, Surowiecki [36]** — explicitly naming what THIS paper adds beyond each | **EXPANDED — literature-demarcation block is new or newly explicit** |
| §III.4 Boundary of applicability | existed | unchanged | **SAME** |
| **§III.5 Empirical base** | v1 analysis treats as "~190 transcripts / 36-case corpus" | **EXPLICITLY: twenty observational vignettes; 14 demonstrate agreement of distortions, 6 counter-argument cases where pursuit of precision harmed outcome**; formats as "observational vignettes (анонимизированные наблюдения)"; tags paper as **OBSERVATIONAL, NOT CONTROLLED-EXPERIMENTAL** — sets honest boundary | **CHANGED — claim size reduced, honesty boundary explicit** |
| **§IV.5 Six cognitive distortions as σ-operators** | v1 analysis mentions "six cognitive distortions as σ-operators (anchoring, confirmation bias, attribution, groupthink, halo, survivorship)" in BIM P3 cross-reference context | **NOW FORMALIZED SECTION** with per-distortion definition: σ_anchor, σ_conf, σ_ext, and unnamed σ for groupthink/halo/survivorship; each mapped to a specific case vignette | **MATERIALLY CHANGED — was a one-line mention in v1 analysis's mapping table, now a standalone §IV.5 subsection with operator notation** |
| §V.1–§V.5 Configuration, F2, F1, saturation, notation | existed | unchanged formulas; §V.5 explicit note that Λ_role does NOT replace \|B_i − B_j\| (paired-scalar divergence) | **SAME** |
| §VI.1–§VI.6 τ_cycle, F3, I(C), OODA/PDCA, primacy, F8 stickiness + F9 T_tip + F10 V_practical | existed | **NEW NOTE in §VI.6 F8:** normalization discussion — condition σ_stick ≤ 1 − B·e^(−t/τ_decay) makes min(1,·) clamp redundant (mathematical tightening) | **TIGHTENED — F8 normalization more rigorous** |
| §VII.1–§VII.4 Method vs configuration + NFL analogy + ensemble of configurations | existed | **§VII.2 now calls this "Hypothesis VII.2 (about C*-non-dominance)"** with explicit "not claiming strict theorem, structural argument only"; more honest epistemic status | **TIGHTENED — epistemic honesty marker added** |
| §VIII.1–§VIII.8 Three forks + F7 + micro-check | existed | **§VIII.6 ADDS: "operational B_min via blind continuation test"** — makes B_min concretely measurable, operational definition, not just a number | **NEW OPERATIONAL DEFINITION** — the "blind continuation test" is a concrete protocol |
| §IX.1–§IX.8 Six predictions + F5 + F6 | existed | **§IX.3 P3 ADDS: numerical sensitivity table** with p ∈ {0.2, 0.3, 0.4} showing N_plateau shifts from 4 → 5 → 4 depending on p; tags RV-06 | **STRENGTHENED — sensitivity analysis added** |
| §X.1–§X.6 Discussion, RV-01 through RV-08, four habits, conclusion | existed (v1 analysis mentioned RV-04–RV-08) | **RV-series renumbered and refined**: RV-01 F5 derivation, RV-02 KAM connection to τ_cycle, RV-03 continuous flows (v10 ood_scope limitation), RV-04 factor-2× derivation, RV-05 F1 correlation, RV-06 p calibration, RV-07 F8 normalization, RV-08 T_tip primary source — **8 open questions total, explicitly enumerated** | **SYSTEMATIZED — RV list enumerated with titles and scope; replaces ad-hoc "RV-04/05/06/07/08" mentions from v1** |
| **§X.4 Two-scale boundary** | v1 analysis had it as C23 "DEFER-v11+" | **NOW FULL SUBSECTION** with explicit bridge: N_carriers definition, ∇S_direction with chain-rule coupling note (derivative of product is NOT separable), three nested cognitive scales (n_min=5 atomic / Miller 7±2 working memory / Dunbar 150 social) — each "a distinct cognitive constraint, not competing" | **MATERIALLY EXPANDED — was sketched in v1, now a formal subsection with math notation about ∇ as directional marker (not a scalar-potential gradient)** |
| §X.5 Four working habits | existed | unchanged wording | **SAME** |
| §X.6 Conclusion | existed | unchanged | **SAME** |
| **Appendix A — Derivation and calibration status table** | **ABSENT from v1 analysis structure** (v1 did not mention an Appendix A) | **NEW: table mapping each F1–F11 to {Derived / Extension / Definition / Operational form / Heuristic / Hypothesis / Threshold / Composition} + calibration parameter source**; plus parameter summary table with columns Source / Derived? / Calibrated? / Open? | **NEW APPENDIX — explicit derivation-status epistemic scorecard for all 11 formulas** |
| **Appendix B — Numerical verification (50 digits)** | **ABSENT from v1** (no mention) | **NEW: 50-digit precision printout for π, φ, (π−3)², ⌈π⌉+1=5; P_reframe values for p=0.3 at N ∈ {1,3,5,7,10} with 0.657/0.30 = 2.19 ratio printed exactly; reproducible Python code with mpmath, dps=50** | **NEW APPENDIX — reproducibility block with tool-verifiable code** |
| **Appendix C — Twenty case vignettes** | v1 analysis alluded to "36-case corpus" but did not enumerate | **NOW ENUMERATED: C.1 = 14 distortion-agreement cases (Case 1.1 "needed by all", 1.2 "finplan with income delay", 1.4 "premium product", 1.5 "founder burnout cycle", 2.1 "school 200 instead of 12", 2.3 "sync vs async", 2.6 "team self-organization", 3.6 "school without successors", 3.8 "AI prompts don't work for others", 4.3 "unanimous decisions", 4.5 "three out of five, refine later", 5.1 "sterile upbringing", 5.3 "external attribution", 5.4 "twenty years of explanations"); C.2 = 6 counter-argument cases (Case A "ideal finplan", D "documents without living transmission", E "methodology transfer without medium", F "collegiality ideal", K "surgeon without long feedback", L "ideal meeting scenario")** | **NEW APPENDIX — concrete ID'd cases replacing v1 vague "~190 transcripts" claim** |
| References | v1 had refs [1]–[37] sketchy | **NOW EXPLICIT LIST [1]–[37]** with full bibliographic data + DOIs/ISBNs: self-citations [1]–[6] Pankratov 2026 preprints, external [7]–[37] including Osinga, Deming, Vygotsky, Bakhtin, Gärdenfors, Katzenbach-Smith, Hackman, Tuckman, Flood-Jackson, Schön, Kuhn, Latour, Polanyi, Kolmogorov-Arnold-Moser (KAM), Kahneman, Janis, Gladwell, Heath-Heath (2 books), Leventhal, Dunbar, Miller, Darley-Batson, Altshuller, Checkland, Wolpert-Macready, Hutchins, Nonaka-Takeuchi, Sperber-Wilson, Surowiecki, Feller | **ENUMERATED — complete bibliography** |

**Formula numbering continuity:** F1–F11 unchanged. No F12+. No formula removed. No P7+. No invariant-like statement inserted or removed at §II level.

**Net structural shifts:**
1. Paper grew by 5 pages, 35 KB — new content is additive (Appendices A/B/C, explicit §IV.5 σ-operator formalization, expanded §III.3 literature demarcation, systematized RV-01–RV-08 list, §X.4 chain-rule note on F11).
2. One **factual correction vs v1 analysis:** empirical base is **20 cases, not 36**. This propagated into shipped `eradev.md:453` as "36-case corpus" (Bundle A wording). See Part 3 / Part 5 below.
3. One **new operational protocol:** §VIII.6 **"blind continuation test"** defines B_min operationally — this is a PROTOCOL, not a formula, and it is NEW vs v1 analysis + NEW vs shipped framework.
4. One **new epistemic hygiene artifact:** Appendix A's derivation-status table gives per-formula derivation trust level (Derived < Extension < Operational < Heuristic < Hypothesis). This type-labeling is NEW and could inform how EraDev cites paper formulas.
5. One **reproducibility artifact:** Appendix B 50-digit verification is useful as a factual citation anchor but not a framework change.

---

## 3. Part 3 — NEW / CHANGED / REMOVED / UNCHANGED concept list

**Convention:** continue concept IDs from v1 analysis (v1 stopped at C26). New IDs: C27+. Changes to v1 concepts carry original ID with Δ-annotation.

### 3.1 NEW concepts in v2 (not in v1 analysis)

| # | Concept | Description (paraphrase, <15-word quote) | Section | Value | Effort | RIGOR_LEVEL scope | Conflict with v10 post-Bundle-D? | Recommendation |
|---|---|---|---|:-:|:-:|---|---|---|
| **C27** | **Six cognitive distortions as named σ-operators** | §IV.5 names σ_anchor, σ_conf, σ_ext (+ 3 unnamed for groupthink/halo/survivorship); each is a "σ-operator acting on frame_H"; each tied to a specific case vignette. Paraphrase: distortions are structural, not defects — they appear automatically at B>0 and are to be *coordinated*, not eliminated. | §IV.5 | MED | S | all (but especially *structured* / *exploratory*) | NO — complements F11 (growth direction) already shipped; complements Weak Link Principle | **ADOPT-LITE** — add as a single-line reference in `FOUNDATIONS.md` §III or an attribution footnote near the F11 note (`eradev.md` §II Weak Link Principle block). NOT as its own subsection — would bloat. |
| **C28** | **"Blind continuation test" as operational definition of B_min** | §VIII.6 paraphrase: B_min = minimum B_received such that the receiver can execute one concrete next step without re-asking the sender. Makes B_min **testable** (is the task advanceable? yes/no) rather than a bare number. | §VIII.6 | HIGH | S | strict / structured | NO — complements shipped F7 (sufficiency threshold) | **ADOPT** — add to `roles/validator_EN.md` as the μ-check scoring rule; add 1-line definition to `eradev.md` F7 block. Changes B_min from "pick a number 0.70–0.85" to "pass/fail by a concrete act." |
| **C29** | **Appendix A derivation-status scorecard** (Derived / Extension / Definition / Heuristic / Hypothesis / Threshold tagging per formula) | App.A | MED | S | research (calibration-phase) | NO — epistemic hygiene | **ADOPT-LITE** — `FOUNDATIONS.md` footnote pointing to paper App.A so anyone citing F5 knows it's "Heuristic pending P1", not "Derived". Avoids over-claiming. |
| **C30** | **Appendix B 50-digit reproducibility (Python mpmath)** | App.B | LOW | S | — | NO | **REJECT** — interesting, but not a framework change; treat as citation-only. |
| **C31** | **Twenty case vignettes, Appendix C, named and ID'd** | App.C (Cases 1.1–5.4 + A/D/E/F/K/L) | MED | S | all | NO — this is the paper's empirical base | **ADAPT** — **correct factual drift in `eradev.md:453` from "36-case corpus" to "20 case vignettes (Appendix C)".** Also propagates to mirror `.claude/skills/eradev/core/eradev.md:453`. |
| **C32** | **RV-01–RV-08 systematized as enumerated list of open questions with titles** | §X.2 | LOW | S | research | NO | **ADAPT** — if EraDev cites paper open questions anywhere (e.g., in OQ-PT-* from v1 analysis), use v2 numbering + titles. Otherwise no action. |
| **C33** | **§X.4 explicit note that F11 ∇-notation is directional marker, not scalar-potential gradient** | §X.4 | LOW | S | strict (only if someone tries to integrate ∇S) | NO — no one in v10 is integrating F11 | **ADOPT-LITE** — 1-word annotation in `eradev.md` F11 block, e.g., "(directional marker per paper §X.4, not scalar-potential gradient)". Prevents over-reading. |
| **C34** | **§III.3 explicit demarcation against Hutchins / Nonaka-Takeuchi / Sperber-Wilson / Surowiecki** | §III.3 | LOW | S | — | NO | **ADOPT-LITE** — reinforce FOUNDATIONS.md entries for these 4 authors with the specific contrast the paper draws (what this paper adds beyond each). Pure scholarly hygiene. |

### 3.2 CHANGED concepts (v1 ID, now different formulation)

| v1 ID | v1 statement | v2 statement | Delta | Recommendation |
|---|---|---|---|---|
| **C25Δ** | v1: corpus ~190 transcripts / 36 cases | v2 §III.5 + App.C: **20 observational vignettes**, 14 agreement + 6 counter-argument | Number reduced; claim made honest ("observational, not controlled experimental") | **ADAPT — fix `eradev.md:453` and mirror; replace "36-case corpus" with "20 case vignettes (App.C)"**. Essential — factual claim in shipped framework is wrong. |
| **C14Δ** (F7) | v1: "require B_received ≥ B_min, not equality; B_min/B_intended ≈ 0.70–0.85" | v2 §VIII.6: adds **"blind continuation test"** operational definition | Same formula, added operational definition | **ADOPT** — see C28. Same intent. |
| **C18Δ** (F11) | v1: ∇S_direction treated as gradient, growth toward more carriers + coordinated distortions | v2 §X.4: **explicit caveat that ∇ is directional marker**, full-scalar-potential open (RV-04) | Same formula, mathematical qualifier added | **ADOPT-LITE** — see C33. |
| **C21Δ** (NFL §VII) | v1: "No-Free-Lunch analogy, ensemble of configurations" | v2 §VII.2: re-cast as **"Hypothesis VII.2 about C*-non-dominance"** — not a strict theorem, structural argument with explicit honest epistemic status | Same content, epistemic status marker added | **ADOPT-LITE** — tone update on `FOUNDATIONS.md` NFL attribution: mark as "hypothesis with structural argument, not strict theorem". 1-line edit. |
| **C15Δ** (F8) | v1: B_persist(C,t) = B·e^(−t/τ_decay) + σ_stick·tanh(...) | v2 §VI.6: **adds normalization analysis** — σ_stick ≤ 1 − B·e^(−t/τ_decay) makes min(1,·) clamp redundant | Same formula, tighter normalization reasoning | **NO ACTION** — v10 hasn't shipped F8 (deferred in v1 as DEFER-v11). When F8 is shipped in v11, use the tightened normalization. |
| **C16Δ** (F9 T_tip) | v1: T_tip ≈ 0.15–0.25 per Gladwell | v2 §VI.6 + RV-08: same range, explicit note that it's a **literary approximation per [23], formal derivation pending** | Epistemic status marker added | **NO ACTION** — F9 was DEFER-v11+ in v1. Note the epistemic hedging when shipping. |

### 3.3 REMOVED / SUPERSEDED concepts

**None identified.** No formula, prediction, section, or attribution from v1 analysis is absent from v2. Paper is strictly additive in content.

### 3.4 UNCHANGED (not enumerated)

C1–C13, C17, C19, C20, C22, C23, C24, C26 of v1 analysis: identical content, same formulation, no delta. Do not re-verdict. v1 Bundle A/B/C/D adoption decisions remain valid.

---

## 4. Part 4 — Current framework mapping

For each v2-delta item, map to current v10 post-Bundle-D state.

### 4.1 Already covered in v10

| v2 delta | Already in v10? | Where | Action needed? |
|---|---|---|---|
| τ_cycle as primary operator | **YES — Invariant #17 in CLAUDE.md** | CLAUDE.md §Invariants #17 | none |
| F3 v_conv formula | YES | `eradev.md` §III (Bundle A) | none |
| F5 B_group heuristic | YES | `eradev.md` §III (Bundle A) | marked as "heuristic" — aligns with App.A tag |
| F6 Π_meta productivity | YES — reported at RT-3 | `eradev.md` §III + `meta.md` RT-3 reporting (Bundle A + C) | none |
| F7 sufficiency threshold | YES — numerically 0.70–0.85 | `eradev.md` §III (Bundle A) + roles/validator_EN.md | **C28 upgrade: add "blind continuation test" definition** |
| F10 inverted-U V_practical | YES | `eradev.md` §III (Bundle A), roles/analyst_EN.md Minimum Viable Scope | none |
| F11 growth direction | YES | `eradev.md` §II Weak Link Principle block (Bundle A) | **C33 upgrade: 1-word annotation "directional marker"** |
| Four Working Habits | YES | `meta.md` consolidated block (Bundle C) | none |
| μ-check | YES | `roles/validator_EN.md` + `eradev.md` §VI RT-2 (Bundle B) | **C28 ties μ-check to "blind continuation test" scoring** |
| path-(c) acceptance | YES | `roles/coherent_EN.md` + `roles/validator_EN.md` (Bundle B) | none |
| NFL / Wolpert-Macready | YES | `FOUNDATIONS.md` (Bundle A) | **C21Δ upgrade: mark as "hypothesis, not strict theorem"** |
| 6 distortions | **PARTIAL** — mentioned in BIM cross-ref context in v1 analysis; NOT shipped as a framework construct | v10 framework does not name σ_anchor / σ_conf / σ_ext | **C27 upgrade: 1-line reference in FOUNDATIONS.md or near F11 block** |
| Empirical corpus claim | **SHIPPED IN ERROR** — text says "36-case corpus" | `eradev.md:453` + mirror | **C25Δ / C31 correction: replace "36-case" with "20 case vignettes (App.C)"** |
| Derivation-status tagging per formula | NO | — | **C29: 1-line FOUNDATIONS.md reference to paper App.A** |
| RV-01–RV-08 enumeration | N/A — OQ-PT-* in v1 analysis only, never shipped to live framework | — | None unless OQ-PT-* is re-opened |

### 4.2 What is ORTHOGONAL (no EraDev mechanism, but v2 doesn't force one)

- **C30 (50-digit Python reproducibility)** — not a framework concern, reject.
- **C34 (literature demarcation in §III.3)** — lightly useful for `FOUNDATIONS.md` enrichment, not required.

### 4.3 What is a CORRECTION of something v10 got wrong

**Only one:** C25Δ / C31 — the "36-case corpus" claim in `eradev.md:453` (shipped in Bundle A wording). Paper v2 Appendix C enumerates **20 cases**. This is a factual correction, not a new direction.

### 4.4 What is a NEW DIRECTION orthogonal to current state

**None.** Every v2 delta either (a) reinforces shipped content, (b) tightens mathematical formulation, (c) makes an operational definition concrete, or (d) corrects one factual number. No new formula, no new prediction, no new axis to integrate.

---

## 5. Part 5 — Ranked delta-based improvements

Single ranked list. Scoring: value × urgency ÷ effort ÷ risk, with correction-of-shipped-error automatically promoted to MUST-DO because it fixes a live misstatement.

| Rank | Item | Origin | File:line target | Effort | Scope conflicts | Priority label |
|:-:|---|---|---|:-:|---|---|
| **1** | **Fix "36-case" → "20 case vignettes (App.C)" in shipped text** | C25Δ / C31 | `eradev.md:453` + `.claude/skills/eradev/core/eradev.md:453` (skill mirror) + any other mention of "36 case" | S (find-and-replace + diff verify) | None — pure factual correction | **MUST-DO** — framework currently asserts a wrong number |
| **2** | **Add "blind continuation test" as operational definition of B_min** | C28 | `eradev.md` §III F7 block (1 sentence); `roles/validator_EN.md` μ-check scoring rule (1 bullet); bilingual mirror | S | None — sharpens shipped F7 | **SHOULD-DO** |
| **3** | **Add "(directional marker, not scalar potential — paper §X.4)" to F11 note** | C33 / C18Δ | `eradev.md` §II WLP F11 annotation (1 phrase); bilingual mirror | S | None | **COULD-DO** |
| **4** | **Mark NFL / VII.2 in `FOUNDATIONS.md` as "hypothesis with structural argument, not theorem"** | C21Δ | `FOUNDATIONS.md` NFL attribution line | S | None | **COULD-DO** |
| **5** | **Add 1-line reference to paper §IV.5 "six cognitive distortions as σ-operators" near F11 / WLP block** | C27 | `eradev.md` or `FOUNDATIONS.md` | S | None — scholarly pointer only | **COULD-DO** |
| **6** | **Add footnote in `FOUNDATIONS.md` pointing to paper Appendix A derivation-status scorecard** | C29 | `FOUNDATIONS.md` | S | None — epistemic hygiene | **COULD-DO** |
| **7** | **Update `FOUNDATIONS.md` demarcation against Hutchins / Nonaka / Sperber-Wilson / Surowiecki per paper §III.3** | C34 | `FOUNDATIONS.md` existing entries for these 4 authors | S | None | **COULD-DO** |
| — | Appendix B 50-digit reproducibility | C30 | — | — | — | **REJECT** — not a framework concern |
| — | F8 tightened normalization | C15Δ | — | — | — | **DEFER-v11** — F8 itself is DEFER-v11 per v1 analysis; adopt tight form when shipping |
| — | F9 T_tip literary-approximation note | C16Δ | — | — | — | **DEFER-v11+** — F9 itself is DEFER-v11+ per v1 analysis |
| — | RV-01–RV-08 systematization | C32 | — | — | — | **DEFER / N/A** — nothing in v10 cites RV-* yet; only adopt if OQ-PT-* is re-opened |

**Single-commit bundling suggestion:** if any of the above ship, group items #1 + #2 (factual correction + operational definition upgrade) as a **v11-prelude micro-commit** (Bundle E-mini). Items #3–#7 are pure documentation hygiene and can be rolled into a next routine docs sweep.

### 5.1 MUST-DO count: 1.
### 5.2 SHOULD-DO count: 1.
### 5.3 COULD-DO count: 5.
### 5.4 DEFER count: 2 (F8, F9 — pre-existing v11 decisions unaffected).
### 5.5 REJECT count: 1 (Appendix B reproducibility — not a framework concern).

---

## 6. Token economy analysis

- **Item #1 correction:** net ~0 lines (find-and-replace; "36-case corpus" → "20 case vignettes (App.C)" is similar length).
- **Item #2 blind-continuation-test definition:** +2 sentences in `eradev.md` F7 block + 1 bullet in `roles/validator_EN.md` ≈ **+6 lines per language × 2 = +12 lines**.
- **Items #3–#7 annotations:** ~1–2 lines each × 5 items × 2 languages ≈ **+20 lines total**.
- **Skill mirror sync** (BL-33): `.claude/skills/eradev/core/eradev.md` + `.claude/skills/eradev/roles/validator_EN.md` duplicates → no additional content, just mirror copy.
- **Total framework token delta if ALL items shipped:** ~**+32 lines across 3–4 core files**, 0 deletions.

Well within v10 Phase 4 sizing precedent. No token-economy blocker.

---

## 7. Open questions (OQ-PTv2-*)

- **OQ-PTv2-1:** Does the correction to "20 case vignettes" in shipped `eradev.md:453` require bumping framework version (v10 → v10.1), or is it a patch-level doc fix? Suggest **patch — treat as v10 debt** because no role-file behavior changes.
- **OQ-PTv2-2:** The "blind continuation test" (C28) changes how Validator scores B_received during μ-check. Is this a Validator role-file contract change (requiring RT-1) or a documentation clarification (doc-only edit)? Suggest **documentation clarification** because the TEST is what Validator was already implicitly doing; we're just naming it and making it the explicit gate.
- **OQ-PTv2-3:** Should we propagate the "observational, not controlled-experimental" honesty marker into EraDev's own Trust Index for paper-derived claims? Currently F3/F5/F6/F7/F10/F11 are treated as axiomatic in shipped `eradev.md` §III. Suggest **no** for now — Bundle A language already qualifies these as "per paper §…", which preserves the T4 trust level implicitly.
- **OQ-PTv2-4:** Is the `σ_anchor / σ_conf / σ_ext` vocabulary worth exporting to Validator's FLUX heuristics (e.g., "Validator must check for σ_conf — cherry-picked confirmatory evidence — before marking a Builder output GREEN")? Suggest **DEFER** — tempting, but requires a separate RT-1 on Validator scoring scheme; not urgent.

---

## 8. B-check (B_research modality)

Weights per `eradev.md` §II.1: F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15. Research-audit priorities: (1-σ) dominates because claiming a delta that doesn't exist, or missing one that does, both invalidate the report.

- **F (Focus) = 0.94.** Read paper in full (pages 1–32, all sections, all appendices, full References); read v1 analysis in full (310 lines); spot-verified shipped framework state at critical anchor points (Invariant 17, `eradev.md:453` corpus claim, `FOUNDATIONS.md` Schön/NFL attributions). Did not re-read every role file because v1 analysis + Bundle A/B/C/D builder reports document their state. Gap: did not execute the skill zip rebuild to verify skill-mirror consistency — not needed for a read-only delta audit.

- **E (Alignment) = 0.93.** Operator's question is yes/no specific — "что то необходимо поменять фреймворка?". Delivered an explicit answer: **MODERATE delta — 1 MUST-DO (factual correction), 1 SHOULD-DO (blind continuation test), 5 COULD-DO (documentation hygiene), 2 DEFER (pre-existing), 1 REJECT.** No hedging, every item has a verdict and a file:line target. The report also explicitly distinguishes "already shipped (Bundle A–D)" from "new in v2" — respects the operator's context.

- **(1-σ) = 0.92.** Cross-checked every v2 delta against (a) the v1 analysis report to avoid claiming false novelty, (b) shipped framework files to avoid recommending already-implemented changes, (c) v2 paper text for page-anchored claims. Explicitly identified one factual error in the shipped framework (36→20 case count) — this is the kind of inconsistency the (1-σ) gate is designed to catch. Minor residual σ: did not verify the mirror file byte-identicality at `.claude/skills/eradev/core/eradev.md:453`; assumed same wording based on BL-33 sync discipline and v10_parallel_trajectories_integration_2026-04-24.md attesting `diff=empty` on mirror sync after Bundle A.

- **Λ (Experience) = 0.90.** Applied L-26 (real state = honest gate — check what SHIPPED, not what was proposed); BL-33 (mirror sync) — surfaced mirror-file duplication of the 36→20 error; v1 analysis OQ-PT-* — cross-checked against v2 RV-list for any that closed (none closed, structure systematized). Framework-level: recognized that "additive-only" papers demand ADAPT-style small commits, not Bundle-scale work.

**B = 0.94^0.30 · 0.93^0.20 · 0.92^0.35 · 0.90^0.15**
 ≈ 0.9816 · 0.9857 · 0.9712 · 0.9842
 ≈ **0.9246**

B ≈ 0.92 GREEN. No ANDON. No YELLOW step.

---

## 9. Explicit verdict

**MODERATE delta.** Single-commit worth of changes, bundle-able as **"v10 patch: PTv2 reconciliation"**.

- **NOT a MAJOR Bundle E:** no new formula F12+, no new prediction P7+, no new invariant, no structural redirection; all v2 additions are additive (Appendices A/B/C, tightened normalizations, explicit epistemic markers, 1 new operational definition).
- **NOT a MINOR cosmetic-only delta:** one factual statement in shipped `eradev.md` is now wrong ("36-case corpus" vs paper v2's "20 case vignettes"), and one genuinely new operational definition ("blind continuation test" for B_min) sharpens the shipped F7 / μ-check contract.
- **MODERATE — 1 MUST-DO + 1 SHOULD-DO + 5 COULD-DO**, net ~+32 lines across 3–4 core files, no deletions, no role-contract changes, bilingual-mirror + skill-mirror sync required per BL-19 / BL-33.

**Recommended commit shape:** one commit titled "v10 patch: PTv2 reconciliation (20-case corpus + blind continuation test + epistemic markers)". Touch `eradev.md`, `eradev_RU.md`, `roles/validator_EN.md`, `roles/validator.md`, `FOUNDATIONS.md`, and the four skill-mirror copies of the above. Ship MUST-DO + SHOULD-DO always; include COULD-DOs if in scope; no RT-1 needed — these are documentation refinements, not protocol changes (per OQ-PTv2-2).

**The answer to the operator's question "что то необходимо поменять фреймворка?":** Да, но немного — одна фактическая ошибка в `eradev.md:453` (36→20 кейсов) + одна формализация B_min через blind continuation test. Остальное — гигиена документации. Bundle E / новый сдвиг архитектуры НЕ требуется.

---

*End of delta report.*
*Baseline: `reports/v10_parallel_trajectories_analysis_2026-04-24.md` (v1, 310 lines, 27-page paper snapshot).*
*Target: `/Users/antonpankratov/Downloads/odtoe/ODTOE_parallel_trajectories.pdf` v2 (32 pages, 229 KB, mtime 2026-04-24 16:52).*
*Copyright discipline: paraphrased; no direct quote exceeds 15 words.*
