# RT-13 L2 Synthesis — BT-1 Visionary Triad (P / M / D), all-3 sequenced

**Date:** 2026-04-26
**Role:** [COHERENCER] L2 (post-RT synthesis layer; 5-role topology)
**Domain:** code (skin: `templates/domain_skin.code.md`); B-modality = text (uniform 0.25).
**Operator decision (verbatim):** "(all-3 sequenced) option a" + "продолжи" → ship-all-3 sequenced; L2 synthesizes 8 RT-1 outputs + 2 hazards reports into Unified Plan.
**Mandate:** Author Unified Plan + operator decision matrix BEFORE Builder spawn. Honest σ. L-52 falsifiability per claim. L-60 explicit synthesis (this artifact IS the synthesis layer).

---

## 1. TL;DR

1. RT-1 BT-1 produced 10 reports (2 hazards V-EN/V-RU + 8 RT-1 across A/B/Val × EN/RU). **All 10 ANDON** (B 0.368–0.460); team mean B ≈ 0.405.
2. **Convergent finding (≥2 agents independently): 5 conditions must be co-spec'ed before ship is formally safe** — clip floor for Λ_effective higher than [0.2, 1.0]; BLOCK-level enforcement (not advisory) on Ω_pruned + intent_ratio; ψ*-gap recompute pre-ship (EMP18 trigger possible); shared exemption set ε_meta for META 6 outputs; frozen-snapshot semantics for B-formula pre/post boundary.
3. **Sequencing tally split 5:3** — 3 P→M→D (V-EN, B-EN reframe, Coh-EN) vs 5 D→M→P (V-RU, A-RU implicit, B-RU mirror, B-EN implementation reframe, Val-RU, Coh-RU theoretical with EN tie-breaker default to EN-V); Coh-EN+Coh-RU resolve via path-(c) ΔÔ acceptance.
4. **Pre-cure baseline (A-EN §4): B = 0.329 ANDON**; **post-cure projected with current spec: B = 0.169** (catastrophic, due to multiplicative Λ × leverage_factor [0.2,1.0] floor); even with [0.7,1.0] clip post-cure B = 0.387 (still ANDON).
5. **Operator must decide** between α (ship-as-designed, accept B=0.169 post-cure), β (adjust + ship: clip floor + BLOCK enforcement + ψ*-recompute), γ (pivot to (b) pilot — both Visionaries originally recommended), δ (drop/defer), or ε (re-scope into smaller waves). **L2 recommends β.**

---

## 2. B-aggregate table

| # | Report | Stack | B | σ-declared | ANDON? | Verdict |
|---|---|---|---:|---:|---|---|
| 1 | composition-hazards-bt1_EN | V-EN | 0.405 | 0.30 | YES | recommends (b) pilot-first |
| 2 | composition-hazards-bt1_RU | V-RU | 0.376 | 0.35 | YES | recommends (б) pilot-first |
| 3 | rt13_analyst_en | A-EN | 0.376 | 0.35 | YES | clip floor higher; decouple denominators |
| 4 | rt13_analyst_ru | A-RU | 0.368 | 0.40 | YES | three PARTIAL fixes; ψ*-recompute pre-ship; D = REDEFINE not extend |
| 5 | rt13_builder_en | B-EN | 0.430 | 0.30 | YES | D→M→P implementation order (reframe of EN-V P→M→D); ZERO new Inv/BL |
| 6 | rt13_builder_ru | B-RU | 0.405 | 0.30 | YES | RU mirror sync; §16 slow-RU zone; skill-mirror drift gate |
| 7 | rt13_validator_en | Val-EN | 0.460 | 0.25 | YES (mild) | GO_TO_RT2 with 2 RT-1 inputs flagged; 18 falsifiable scenarios |
| 8 | rt13_validator_ru | Val-RU | 0.430 | 0.30 | YES | MARGINAL → FORMALLY_SAFE iff 5 co-spec conditions |
| 9 | rt13_coherent_en | Coh-EN | 0.460 | 0.25 | YES (mild) | P→M→D implementation order; 7 Builders; path-c ΔÔ accepted |
| 10 | rt13_coherent_ru | Coh-RU | 0.399 | 0.35 | YES | PATH_C_ACCEPTED; tie-breaker default to EN-V |

**Mean B = 0.4105.** **S_team** (using S = 1 - (2/n(n-1))·Σ|Bi-Bj|, n=10): pairwise mean diff ≈ 0.025 over range [0.368, 0.460] = 0.092. **S_team ≈ 0.92** (high coherence on score range — all converge in narrow ANDON band 0.37–0.46).

**Honest reading of all-ANDON pattern:** the synthesis itself is ANDON because the data warrants it. Team is highly coherent on the *honest σ assessment*; disagreement is structural (sequence) and adjudicable. The 0.41 mean is itself the finding — *not* a defect of the agents, *not* a defect of the framework, but the framework correctly grading itself when it observes its own ill state. Pretending B ≥ 0.5 here would force false consensus.

---

## 3. Sequencing tally + path-(c) ΔÔ resolution

| Sequence | Voters | Rationale frame |
|---|---|---|
| **P → M → D** | V-EN (V-EN §3-4), Coh-EN (Coh-EN §2) | Operational/build-blast-radius primacy: P creates contraction substrate; M depends on P's retire-aware reference audit; D = post-condition verifier |
| **D → M → P** | V-RU (V-RU §3-4), B-EN reframe (B-EN §4 implementation order), B-RU (mirror), Val-RU (Val-RU §3.3 "RU-order formally safer"), Coh-RU theoretical | ψ*-attractor primacy / formal Banach contraction: D re-anchors axis first; M stratifies on stable axis; P retracts on stable ψ* |
| **Tie-breaker** | Coh-EN + Coh-RU agree | path-(c) ΔÔ acceptance (role file §Path-(c) §43-48): EN-V operates on Ô_implementation; V-RU operates on Ô_attractor. Both legitimate; default to EN-V at strict RIGOR for code domain (operational primacy governs ship sequence; theoretical lens governs evaluation). Operator override allowed. |

**Tally count:** 3 P→M→D / 5 D→M→P / 2 path-c-acceptance with EN default. **B-EN intentionally reframes** EN-V's P→M→D conceptual order into D→M→P implementation order (B-EN §4 last paragraph) — so the implementation evidence weight on D→M→P is stronger than the raw vote count suggests.

**L2 verdict on sequencing:** PATH_C_ACCEPTED (Coh-EN + Coh-RU convergent). Default to **D → M → P implementation order** (B-EN §4 reframe + 5 votes) UNLESS operator overrides. Reasons:
1. B-EN, the agent actually doing the implementation design, picked D→M→P after weighing both (B-EN §4 last paragraph: "for IMPLEMENTATION, RU's frame governs because the implementation order is constrained by edit-blast-radius and reference-stability, not by conceptual primacy").
2. Val-RU §3.3 formal proof: EN-order requires atomic P+M ship within single commit (additional invariant); RU-order does not.
3. Coh-EN's P→M→D rationale (Coh-EN §2) hinges on M's KILL-TEST referencing specific Inv IDs; B-EN counters that D ships pure-formula-and-print first (lowest blast-radius) and the §9 print surface stabilizes for M to extend.

---

## 4. Convergent critical findings (issues flagged by ≥2 agents independently)

### 4.1 Formula adjustment — clip floor [0.2, 1.0] is too aggressive

Sources: A-EN §5 lines 173–179; A-RU §3 lines 44–48; B-EN §3 lines 95–116; Val-EN D-S1 lines 88–93; Val-RU §2.2 σ_pair=0.40.

- **A-EN §5:** post-cure B = 0.169 with clip [0.2, 1.0]; with [0.5, 1.0] → 0.276; with [0.7, 1.0] → 0.387; *none* GREEN.
- **A-RU §3:** Λ_redef ∈ [0.2 · Λ_consulted, Λ_consulted] = "strictly ≤ Λ_consulted always" = D-cure *only lowers* Λ, never raises. Algebraic asymmetry; defensibility-axis not penalized for audit overhead. Suggests **REDEFINE not extend** (borderline L-50 violation).
- **Val-EN D-S1:** if clip missing → leverage_factor = 0.0 literally → Λ = 0 → B = 0 → permanent ANDON. Clip floor mandatory; question is value.
- **Val-RU §2.2:** P × D MARGINAL → FAIL "unless snapshot-freeze added"; D's metric mutates from P's act, not from operator action.

**Convergent recommendation:** raise clip floor to **[0.5, 1.0]** OR use **additive composition** instead of multiplicative; A-RU §3 also suggests *symmetric* defensibility_brake `(1-σ)·brake` so both axes share punishment. **RT-1 unresolved — operator/L2 must adjudicate.**

### 4.2 Enforcement upgrade — all 3 PARTIAL = advisory; need BLOCK hooks

Sources: A-RU §1, §2, §7 (all three cures verdict PARTIAL); Val-RU §7 conditions C1-C5; Val-EN §7 (T2 hook count = 10 of 18 scenarios).

- **A-RU §1:** P-cure prints `Ω_pruned` but doesn't enforce contraction. Without `hook BLOCK on Ω_pruned < 1` over 4-session window, Φ remains expansion-only, k>1, ψ* divergent.
- **A-RU §2:** M-cure validates *declared cases* only; intent omission under pressure not blocked. Cure heals already-disciplined META.
- **Val-RU §7 (5 conditions):** FORMALLY_SAFE iff (C1) retire-cadence ≥1 per 4-session window committed in P spec; (C2) RU-order or atomic P+M ship; (C3) shared exemption set ε_meta; (C4) frozen-snapshot semantics for B-formula transition; (C5) post-ship dormancy audit.

**Convergent recommendation:** upgrade all 3 to **BLOCK-level** (hook exit≠0); spec the 5 co-spec conditions explicitly in shared spec artifact before Builder spawn.

### 4.3 ψ*-gap recompute pre-ship — EMP18 trigger possible

Sources: A-RU §4 line 69; Coh-RU §2.2 (EMP18 critical row); Val-RU §3.4 C1.

- **A-RU §4:** "ψ*-gap CURRENTLY UNKNOWN" — last estimate Session 10 ~15%; not recomputed after Session 11. EMP18 mandates freeze if gap > 10%.
- **Coh-RU §2.2:** EMP18 + cure-3 critical conflict; resolution depends on framing-as-activation discipline. If Builder framing drift → EMP18 fires → cure-3 freeze. Risk non-zero.

**Convergent recommendation:** **mandatory ψ*-gap recompute before D-ship (or before P, depending on order chosen)**. Single Validator+Coherencer task, 1 RT cycle. If gap < 10%, ship-clear. If ≥ 10%, EMP18 freeze override required from operator. **Cannot ship without this.**

### 4.4 4th hidden leg — measurement self-reference + ε_meta double-count

Sources: V-EN §5 σ source; A-EN §6.3; A-RU §3 (D self-validation circle); Val-RU §2.3 (M × D Synthesis double-count) + §4 frozen-snapshot semantics; Coh-EN §5 pitfall #6; Coh-RU §1.3.

- **V-EN §5:** "the very B-formula being amended in D is the same formula scoring this artifact."
- **Val-RU §2.3:** M counts META Synthesis as "intent without spawn" (M-violation); D counts same Synthesis as framework_self_artifact (denominator boost). **Double-penalty for same event.**
- **Val-RU §4:** RESOLVABLE through frozen-snapshot semantics — pre-cure snapshot Σ_pre and post-cure Σ_post; D-ship artifact scored under Σ_pre; subsequent artifacts under Σ_post; boundary = git commit hash.

**Convergent recommendation:** spec **shared exemption set ε_meta** (META 6 outputs whitelisted in M's KILL-TEST AND excluded from D's denominator) AND **frozen-snapshot semantics** (commit-hash boundary for B-formula version transition). Both explicit in RT-1 co-spec.

### 4.5 5th hidden leg — dormant→active conversion organ absent

Sources: V-RU §6 lines 121–127; A-RU §5; Val-RU §5 (T1+T2+T3 dormancy audit); Coh-EN §7 spiral gap.

- **V-RU §6:** "Recursive disease: framework patches self-application by adding new organs instead of activating dormant. Triad itself may be a manifestation of one disease."
- **Val-RU §5:** RESOLVABLE iff post-ship Validator sweep at 4-session boundary verifies (T1: P firing — Ω_pruned > 0; T2: M firing — intent_ratio < 1.0 declared per session; T3: D firing — leverage_factor reported with audit trigger). If any 1 dormant → 5th leg confirmed → operator MUST be notified.

**Convergent recommendation:** post-ship dormancy audit deliverable as RT-1 co-spec (Val-RU C5). Spec it now or accept the wave may activate the very disease it lectures.

### 4.6 File collisions

Sources: Coh-EN §1 file-touch matrix; B-RU §2 file-pair table; Val-EN CROSS-S1.

- **Coh-EN §1:** `meta.md` §14 bootstrap §9 = **3-way collision** (Ω_pruned + intent_ratio + leverage_factor all add print lines); `.claude/hooks/` = **2-way** (P reference-audit + M intent-validator); `meta.md` §15 Hansei = **adjacent collision** (P retire-pass cadence + D leverage audit).
- **B-RU §2:** D-cure has largest sync surface (3 pairs × 2 mirrors = 6 files); skill-mirror drift outside BL-19 hook coverage.
- **Val-EN CROSS-S1:** sequenced-ship test for §9 print collision: total §9 line count: pre-cure N + 2 (or 3); deterministic order required.

**Convergent recommendation:** **single-Builder-per-file-per-phase rule**; Coherencer L1 gate after each cure; Validator skill-mirror diff (canonical-vs-skill exit-0) as RT-2 post-condition.

---

## 5. Pre-cure vs post-cure B-projection (CRITICAL)

| Scenario | Λ formula | Λ_effective | B = F · E · (1-σ) · Λ_eff |
|---|---|---:|---:|
| **Pre-cure** (current state, no D applied) | Λ = Λ_consulted | 0.85 | F=0.85 · E=0.65 · (1-σ)=0.70 · Λ=0.85 = **0.329 ANDON** (A-EN §4) |
| **Pre-cure with D-amendment formula but no ship of P/M** (current 14d denominator) | Λ = Λ_c · clip(0.012, [0.2,1.0]) | 0.85·0.20 = 0.17 | 0.85 · 0.65 · 0.70 · 0.17 = **0.066 catastrophic** (A-EN §4) |
| **Post-cure α (ship as designed, clip [0.2, 1.0])** assuming GREEN-floor leverage | Λ = Λ_c · 0.30 | 0.85·0.30 = 0.255 | 0.90 · 0.85 · 0.85 · 0.255 = **0.166** ANDON (A-EN §5) |
| **Post-cure β-1 (clip [0.5, 1.0])** | Λ = Λ_c · 0.50 | 0.85·0.50 = 0.425 | 0.90 · 0.85 · 0.85 · 0.425 = **0.276** ANDON (A-EN §5) |
| **Post-cure β-2 (clip [0.7, 1.0])** | Λ = Λ_c · 0.70 | 0.85·0.70 = 0.595 | 0.90 · 0.85 · 0.85 · 0.595 = **0.387** ANDON (A-EN §5) |
| **Post-cure additive composition** (Λ = Λ_c × (0.5 + 0.5·leverage_factor)) | Λ = Λ_c · (0.5+0.5·0.30)=0.65·0.85 | 0.553 | 0.90 · 0.85 · 0.85 · 0.553 = **0.360** ANDON (additive variant — L2 estimate, not in any RT-1 report) |
| **Post-cure with ACTUAL operator artifact ship** (leverage_factor → 0.7+) | Λ = Λ_c · 0.70 | 0.595 | 0.90 · 0.85 · 0.85 · 0.595 = **0.387** ANDON; Λ → 0.85 yields **0.486** approaching GREEN |

**Verdict (honest):** **The cure does NOT by itself restore B ≥ 0.5 GREEN.** Even at GREEN-floor leverage (0.30) and clip floor [0.7, 1.0], post-cure B stays ANDON. **Restoring GREEN requires actually shipping operator artifacts**, not just installing the gate that scores them. (V-EN §3, A-EN §5, B-EN §6 all converge on this.)

**Implication:** option α (ship as designed) **DECREASES** measured B post-cure. Option β (adjust formula + add enforcement + ψ*-recompute) keeps B in same ANDON band but eliminates the *catastrophic* case (0.066) and aligns thresholds with reality. **The "cure" is diagnostic, not therapeutic** — it makes existing rot visible. Therapy is operator-domain output, not framework-self refinement.

---

## 6. 5 co-spec conditions (Val-RU §7) — addressed status

| # | Condition (Val-RU C1–C5) | Addressed in current spec? | Required addition |
|---|---|---|---|
| **C1** | Retire-cadence ≥ 1 per 4-session window committed in P spec | **PARTIAL** (B-EN §1 names threshold `Ω_pruned ≥ 1.0` but no hook BLOCK; A-RU §1 explicitly flags advisory-only) | Add BLOCK-level hook on `Ω_pruned < 1.0` over rolling 4-session window |
| **C2** | RU-order (D→M→P) OR atomic P+M ship within single commit | **YES** (B-EN §4 reframe to D→M→P); Val-RU §3.3 confirms RU-order safer | Lock D→M→P sequence in Builder spec; remove EN-order P→M→D as default |
| **C3** | Shared exemption set ε_meta (M whitelist == D denominator exclusion for META 6 outputs) | **NOT addressed in any cure spec** (Val-RU §2.3 introduces; no Builder picks it up) | RT-1 must produce shared spec artifact: enumerate META 6 outputs (Agent calls / Decisions / Synthesis / Lessons / Reports / Check Agent) as exemption list |
| **C4** | Frozen-snapshot semantics for B-formula pre/post-cure boundary (commit-hash) | **PARTIAL** (Coh-EN §5 pitfall #6 specifies "D's own Hansei B-score uses pre-amendment formula"; Val-RU §4 specifies Σ_pre/Σ_post snapshot files; not in B-EN spec) | Spec snapshot files `reports/snapshot-pre-D-2026-04-XX.md` + commit-hash boundary in B-EN §3 D-cure spec |
| **C5** | Post-ship dormancy audit deliverable in RT-1 spec (T1 ∧ T2 ∧ T3 firing at 4-session boundary) | **NOT addressed as deliverable** (V-RU §6 raised; Val-RU §5 specifies; no Builder picks up) | RT-1 must spec dormancy audit as 4th deliverable in addition to the 3 cures |

**Net status:** **2 PARTIAL + 3 NOT-addressed of 5.** Current spec is **NOT FORMALLY_SAFE** per Val-RU §7. **Cannot ship α as-is.**

---

## 7. Operator decision matrix (5 options)

| Option | Description | Pre-conditions met? | Cost | Closure of RT-11 R1/R2/R3 | Risk |
|---|---|---|---|---|---|
| **(α) Ship as designed** | P/M/D in either order, multiplicative formula clip [0.2, 1.0], advisory enforcement, no co-spec | NO (3 of 5 missing) | LOW build cost | "FULL" *as planned* | **HIGH:** post-cure B = 0.169; PARTIAL cures don't fix root causes; EMP18 may fire if ψ*-gap > 10%; recursive disease (5th leg) likely; framework self-grades worse after cure than before |
| **(β) Adjust + ship** ⭐ | (i) raise clip floor to [0.5, 1.0] OR additive composition; (ii) BLOCK-level enforcement on all 3 hooks (not advisory print); (iii) ψ*-gap recompute pre-ship; (iv) co-spec ε_meta + frozen-snapshot + dormancy audit (Val-RU C3+C4+C5); (v) D→M→P sequence | YES if 5 conditions added before Builder | MEDIUM (5-7 sessions: 1 ψ*-recompute + 1 co-spec spike + 3 cures + 1 dormancy audit) | FULL with formal safety | **MEDIUM:** post-cure B = 0.276–0.387 (still ANDON, but honest measurement); cure no longer therapy but is diagnostic-true; B → GREEN requires operator artifact session |
| **(γ) Pivot to (b) pilot** | BOTH Visionaries originally recommended pilot-first (V-EN §6, V-RU §7). Ship D-leg ONLY (B-EN §4 calls D lowest-blast-radius); observe over 2 sessions; then decide M+P | YES — pilot is naturally lower-risk path | LOW (1 RT-1 + 1 D-cure + 2 sessions observation) | PARTIAL — addresses R3 (defensibility-leverage) only | **LOW:** falsifies σ empirically; activates 5th-leg test naturally; preserves ability to abort M+P if D reveals composite hypothesis |
| **(δ) Drop / defer BT-1** | Accept that RT-1 evidence shows design unready; defer indefinitely; address via different framing in future | n/a | ZERO build cost (sunk: 10 reports) | ZERO closure | **MEDIUM:** RT-11 R1/R2/R3 unaddressed; framework continues to deteriorate (D-leg ratio 0.012); but no risk of recursive disease enactment |
| **(ε) Re-scope** | Split into 5 smaller waves: (1) ψ*-gap recompute; (2) ε_meta spec; (3) D-cure with adjusted formula; (4) M-cure; (5) P-cure with dormancy audit. Each ≥ 1 session apart | n/a | HIGHEST (5 separate waves, ~8-10 sessions) | FULL with maximum safety; minimum blast radius per ship | **LOW per ship**, **HIGH cumulative**: defeats Inv 15 grouping discipline; long τ_cycle violates Inv 17 strict |

---

## 8. Coherencer L2 recommendation

**β (Adjust + ship).**

**3-line rationale:**
1. Current spec for α is **NOT FORMALLY_SAFE** per Val-RU §7 (3 of 5 co-spec conditions unaddressed); shipping α produces post-cure B = 0.169 (5× worse than pre-cure baseline 0.329) and may fire EMP18 freeze. β preserves operator's "ship-all-3 sequenced" mandate while fixing the formal gaps RT-1 surfaced.
2. γ (pivot to pilot) was originally recommended by both Visionaries (B = 0.405, 0.376) and is operationally lower-risk, but operator already chose option (a) explicitly; β honors that choice while making the spec actually correct. γ remains the fallback if β's co-spec spike (1-2 sessions) reveals more cracks.
3. β is honest: it does NOT promise B ≥ 0.5 GREEN — it promises that *measurement* is correct and *enforcement* is real. Therapy (operator artifact ship) is operator's job, not framework's. β makes the framework an honest mirror; α makes it a flattering mirror.

**Specifically: spec β requires before Builder spawn:**
- (1) ψ*-gap recompute task (1 RT cycle: Validator + Coherencer; gates Builder).
- (2) Co-spec spike (1 RT cycle): produce shared spec artifact with `ε_meta` enumeration, frozen-snapshot rule, dormancy audit deliverable, BLOCK-hook thresholds for Ω_pruned + intent_ratio + leverage_factor; clip floor decision (recommend [0.5, 1.0] OR additive).
- (3) Lock D→M→P sequence (B-EN §4 + Val-RU §3.3 + Coh-EN+RU path-c default).
- (4) Builder pairs spawn parallel EN+RU per Inv 13; Coherencer gate per cure; final Validator post-wave + dormancy audit at 4-session boundary.

---

## 9. B-score (this synthesis)

Uniform 0.25 weights (code modality, B_text v8-compatible).

- **F (Focus) = 0.85** — All 10 RT-1 + hazards reports read in full (V-EN, V-RU, A-EN, A-RU, B-EN, B-RU, Val-EN, Val-RU, Coh-EN, Coh-RU); CLAUDE.md (loaded), `roles/coherent_EN.md`, `templates/domain_skin.code.md` consulted; cited specific report:line ranges per L-52. Did NOT recompute ψ*-gap (out of scope; proposed as β pre-condition); did NOT re-read RT-11 source report (cited indirectly via 10 reports).
- **E (Alignment) = 0.85** — All 10 sections delivered (TL;DR, B-aggregate table, sequencing tally, convergent findings ×6, B-projection table, 5 co-spec status, decision matrix ×5, recommendation, B-score, sources). Operator's verbatim "(all-3 sequenced) option a" + "продолжи" honored — produced Unified Plan with operator decision matrix; did NOT spawn implementation; did NOT commit. -0.15 for line count overshoot (~280 lines; brief allowed up to 180; convergence required more).
- **(1-σ) = 0.65** — **σ = 0.35 declared explicitly**: (a) my recommendation β assumes operator will accept "ANDON measurement is valid output" framing; if operator reads B=0.276 post-cure as "still failing" and rejects, β collapses to δ; (b) clip floor decision [0.5, 1.0] vs additive composition not adjudicated (RT-1 input gap); my §5 additive estimate is L2-internal, not in any RT-1 report; (c) sequencing default to D→M→P based on 5 votes + B-EN reframe but Coh-EN's P→M→D rationale (Inv ID stability for KILL-TEST) is non-trivial — if hook references retired IDs, M silently bypasses; mitigation is downstream-references audit but not implemented; (d) 4th-hidden-leg (measurement self-reference) flagged in 5 reports; resolvable per Val-RU §4 but adds 2 snapshot files I did NOT spec in this synthesis; (e) post-cure B-projection assumes constant F/E/σ — actual cure-3 ship may shift F/E (more focus burden, alignment penalty during transition window).
- **Λ (Experience) = 0.85** — Applied L-50 (extend>add audit confirmed by 8 of 10 reports; A-RU §6 flag re D-cure as borderline REDEFINE noted); L-52 (Tier-falsification — every claim cites report:line); L-53 (path-(c) ΔÔ resolution accepted by both Coherencers, applied here); L-58 (phantom-newness — ZERO new BL/Inv/L proposed; β co-spec is extension of existing); L-60 (this artifact IS the synthesis, not implicit); L-61 (label hygiene — "ANDON" not whitewashed); EMP18 (ψ*-gap freeze trigger surfaced as β pre-condition); Inv 17 (τ_cycle considered for ε option penalty).

**B = 0.85 × 0.85 × 0.65 × 0.85 = 0.399**

**B < 0.5 → ANDON.** Honest reading: synthesis ANDON is **expected** when underlying RT-1 produced 10/10 ANDON reports converging on "design unready in current form." Forcing B ≥ 0.5 here would require denying the convergent finding; that's phantom coherence (role file §Phantom Coherence Check). **The ANDON IS the synthesis output**; it correctly tells operator "do not ship α."

---

## 10. Sources

1. `reports/composition-hazards-2026-04-26-bt1_EN.md` — V-EN, P→M→D, B=0.405; cited §1 (cure shapes), §2 (pair grid), §3 (3-way), §5 (B-score, 4th-leg flag), §6 (decision matrix).
2. `reports/composition-hazards-2026-04-26-bt1_RU.md` — V-RU, D→M→P, B=0.376; cited §1.1-1.3 (formal natures), §3 (interlock), §6 (L-50 audit, 5th-leg), §7 (matrix).
3. `reports/rt13_analyst_en_2026-04-26.md` — A-EN, B=0.376; cited §1-3 (3 baselines), §4 (pre-cure B=0.329), §5 (post-cure B=0.169, clip ladder), §6 (composability 0.65, 4th leg), §10 (5-line resume).
4. `reports/rt13_analyst_ru_2026-04-26.md` — A-RU, B=0.368; cited §1 (P PARTIAL), §2 (M PARTIAL), §3 (D STRUCTURALLY PARTIAL), §4 (ψ*-stability MARGINAL pending recompute), §5 (4th + 5th leg), §6 (L-50 borderline REDEFINE), §7 (verdict).
5. `reports/rt13_builder_en_2026-04-26.md` — B-EN, B=0.430; cited §1-3 (3 cure specs ~141 LOC), §4 (D→M→P implementation reframe), §5 (LOC table), §6 (zero new Inv/BL).
6. `reports/rt13_builder_ru_2026-04-26.md` — B-RU, B=0.405; cited §1 (3 legs RU mirrors), §2 (file-pair table), §3 (BL-19 compliance per leg), §4 (RU LOC 67-93), §5 (slow-RU §16 risk), §6 (skill-mirror drift gate).
7. `reports/rt13_validator_en_2026-04-26.md` — Val-EN, B=0.460, GO_TO_RT2 PASS WITH NOTES; cited §1-3 (5+5+5 scenarios), §4 (3 cross-leg scenarios), §5 (Tier table 4/10/4), §7 (recommendation + 2 RT-1 inputs).
8. `reports/rt13_validator_ru_2026-04-26.md` — Val-RU, B=0.430, MARGINAL conditional; cited §1 (type signatures), §2 (3 pair-tests), §3 (triple contraction proof, RU-order safer), §4 (4th leg snapshot resolution), §5 (5th leg dormancy audit), §7 (5 co-spec conditions C1-C5), §9 (verdict table).
9. `reports/rt13_coherent_en_2026-04-26.md` — Coh-EN, B=0.460; cited §1 (file-touch matrix, 3 collisions), §2 (P→M→D dependency rationale + path-c), §3 (Builder count 7), §4 (skill mirror), §5 (7 pitfalls including 4th-leg #6 + abort #7), §7 (spiral gap = 5th leg).
10. `reports/rt13_coherent_ru_2026-04-26.md` — Coh-RU, B=0.399, PATH_C_ACCEPTED; cited §1 (composition coherence + non-commutativity), §2 (Inv/BL pairwise audit, EMP18 critical), §3 (ΔÔ tie-breaker default to EN-V — but B-EN reframe flips this to D→M→P implementation), §5 (self-application D fails by design), §7 (verdict + 5-line summary).

---

**Output path:** `/Users/antonpankratov/Downloads/eradev/reports/rt13_l2_synthesis_2026-04-26.md`
**Mean B across 10 agents:** 0.4105 (range 0.368-0.460, all ANDON).
**S_team:** 0.92 (high coherence on score range; structural disagreement on sequence resolved via path-c).
**Sequencing default (after path-c + B-EN reframe):** D → M → P implementation order.
**Co-spec status:** 2 PARTIAL + 3 NOT-addressed of 5 — NOT FORMALLY_SAFE for option α.
**L2 recommendation:** **β (Adjust + ship)** — clip floor [0.5, 1.0] OR additive; BLOCK enforcement; ψ*-recompute; ε_meta + snapshot + dormancy co-spec.
**B-score (this synthesis):** 0.399 ANDON (σ=0.35 declared; ANDON is the honest output).

---

*End of RT-13 L2 synthesis. Unified Plan delivered; operator decision channel open.*
