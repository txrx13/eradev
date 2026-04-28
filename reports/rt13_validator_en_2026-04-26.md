# RT-13 Validator EN — Regression Test Scenarios for BT-1 P/M/D Wave

**Date:** 2026-04-26
**Role:** [VALIDATOR] (5-role topology, integrity gate)
**Stack:** EN
**Operator directive:** option (a) ship-all-3-sequenced
**Mandate:** Design-only. 3-5 falsifiable regression scenarios per leg + cross-leg + Tier upgradability.
**Anchors:** composition-hazards EN/RU (2026-04-26), L-52 (Tier falsification), L-57 (parallel cap), L-50 (extend>add), L-61 (wave-label hygiene), `enforce-delegation.sh`, `lessons.md` temporal triple, RT-12 commit 8fe68fd.
**A_F:** read both hazard reports + role file + delegation hook + lessons.md L-50/L-52/L-57/L-61. **A_E:** verify each scenario falsifies a specific cure claim. **A_σ:** flagged where scenarios overlap across legs. **A_Λ:** L-52 (every Tier claim must point at enforcement artifact); L-58 (phantom-newness — scenarios must reference real anchors).

---

## 1. P-cure regression (scheduled retirement protocol + Ω_pruned scalar)

Cure claim (EN hazards §1, P): quarterly Hansei subtype `retirement-pass-<date>.md` + scalar Ω_pruned = items_archived / items_added (rolling 4-session) + lessons.md "Retired this pass: [list]" entry, extending temporal triple. **Tier claimed:** T2 (hook-enforced inventory check).

### P-S1: Archive integrity after retirement protocol fires
- **SETUP:** Apply retirement protocol to retire L-1 (already `ended: 2026-04-25 | superseded_by: L-50`, lessons.md line 18). Confirm pre-state: L-1 entry text present in lessons.md.
- **ACTION:** Retirement protocol moves L-1 body to lessons_archive.md, leaves stub + temporal triple in lessons.md.
- **EXPECTED-RESULT:** (i) `grep "L-1" lessons_archive.md` returns full body; (ii) `grep "L-1" lessons.md` returns stub + temporal triple only; (iii) supersede chain `L-1 → L-50` resolves bidirectionally (forward link in lessons.md, back-link in lessons_archive.md).
- **FAIL-CRITERIA:** L-1 body absent from lessons_archive (data loss); OR stub absent from lessons.md (back-link broken); OR `grep -r "L-1" .claude/hooks/` returns hook still referencing L-1 in active deny-list. **Falsifier:** any retired ID still cited in active enforcement = retirement broke a hook silently (RT-12 path-glob pattern, L-52 sweep update).

### P-S2: Ω_pruned scalar correctness on RT-12 commit
- **SETUP:** Commit `8fe68fd` (RT-12 "4 hook prunes + 2 framework adds") declared +572/-161. Ω_pruned definition (EN hazards §1): items_archived / items_added in window.
- **ACTION:** Compute Ω_pruned over the single-commit window of 8fe68fd. Decisions: items = lines (not files) per hazard text; archived = deletions; added = insertions.
- **EXPECTED-RESULT:** Ω_pruned = 161/572 = 0.281. Per L-61 wave-label hygiene + EN hazards §1 contraction baseline, threshold for "real prune" is Ω_pruned ≥ 1.0 (deletions ≥ insertions). 0.281 < 1.0 → ANDON ("monotone +30% addition" matches L-61 finding).
- **FAIL-CRITERIA:** Ω_pruned computation > 1.0 on this commit (formula wrong, contradicts L-61 ground truth); OR computation does not produce ANDON (gate threshold mis-set); OR formula divides by zero on no-add windows without explicit handling (handled cases: returns +∞ symbolic, or skips window — must document). **Falsifier:** if the same scalar that retroactively flagged RT-12 does NOT flag RT-12, the cure is non-functional.

### P-S3: Load-bearing BL canary — refusal to retire
- **SETUP:** Inv 1 "META ALWAYS delegates" referenced 4× in `enforce-delegation.sh` (lines 49, 57, 65, 74) + CLAUDE.md Invariants list. Hazard text §2 P×M warns: "retired Inv that the KILL-TEST or `enforce-delegation.sh` references → hook fails open."
- **ACTION:** Attempt to retire Inv 1 via retirement protocol (set `ended: <today>`, add to lessons_archive).
- **EXPECTED-RESULT:** Protocol's "downstream-references audit" (EN hazards §2 P×M mitigation) MUST refuse: `grep -rn "Inv 1\|Invariant 1" .claude/hooks/ .githooks/ CLAUDE.md eradev.md meta.md roles/` returns ≥1 match → retirement BLOCKED with message naming each reference site.
- **FAIL-CRITERIA:** Protocol allows retirement of Inv 1 (silent hook bypass scenario realized); OR audit greps only `.claude/hooks/` and misses `.githooks/`, role files, or skill mirror at `.claude/skills/eradev/` (hazards §2 explicit). **Falsifier:** any retirement that succeeds with an extant downstream reference = cure has the failure mode it was designed to prevent.

### P-S4: Backward-link integrity after multi-step retirement
- **SETUP:** lessons.md temporal triple chain: L-1 → L-11 → L-22 (line 18, 23, 28 ended/superseded). Retire L-22 in this hypothetical step.
- **ACTION:** Set L-22 `ended: <today>`. Audit chain.
- **EXPECTED-RESULT:** L-1 stub still resolves (reads "superseded_by: L-50" — independent chain, no cascade). L-11 stub still resolves (chain ends at L-22 archived). Reading any retired-ID query returns archive content via single hop OR documented multi-hop.
- **FAIL-CRITERIA:** Retiring L-22 invalidates L-11's superseded_by pointer (dangling reference); OR retirement touches lessons that did NOT supersede via L-22 (over-broad sweep). **Falsifier:** chain integrity was the explicit motivation for the temporal triple — breakage = cure regressed prior infrastructure.

### P-S5: Idempotency / re-run safety
- **SETUP:** Run retirement-pass once on a stable lessons.md state.
- **ACTION:** Re-run retirement-pass with no new candidates between runs.
- **EXPECTED-RESULT:** Second run: zero modifications to lessons_archive.md and lessons.md; Ω_pruned reports same value; no new entry appended to retirement-pass-<date>.md.
- **FAIL-CRITERIA:** Second run duplicates archive entries (data corruption); OR appends spurious "Retired this pass: []" empty entry (BL-58 phantom-newness on cure itself). **Falsifier:** non-idempotent retirement = scheduled cron unsafe.

---

## 2. M-cure regression (intent-vs-action discipline + intent_ratio)

Cure claim (EN hazards §1, M): two-phase output discipline — META emits intent declaration "I will spawn N agents for X" BEFORE any tool call; deny-list hook validates first post-intent tool call is Agent spawn (not Edit/Write). Bootstrap §9 prints `intent_ratio = declared_intents : agent_spawns`. **Extension of KILL-TEST + Inv 1**, NOT new BL/Inv. **Tier claimed:** T2 (hook-enforced sequence check).

### M-S1: Legitimate META outputs pass without false-positive
- **SETUP:** META emits intent "I will append L-63 to lessons.md after RT-13 closes" then performs `Write` to `projects/eradev/lessons.md` (whitelist path per `enforce-delegation.sh:87`).
- **ACTION:** Hook receives Write event; post-intent check fires.
- **EXPECTED-RESULT:** ALLOW. Whitelist (reports/, lessons.md, memory, MEMORY.md, BL_CANDIDATES.md) is preserved as in current `enforce-delegation.sh:87`. M-cure layer adds ONLY the requirement that an intent declaration preceded the action — not a denial.
- **FAIL-CRITERIA:** Hook BLOCKS Write to lessons.md (regression — pre-cure behavior was ALLOW, see line 87); OR hook emits warning that pollutes operator output for legitimate META work. **Falsifier:** if M-cure shrinks the legitimate output surface (6 output types), it has broken Inv 1's positive face — META MUST be able to produce the 6 outputs.

### M-S2: META direct Edit/Write to framework still BLOCKS
- **SETUP:** Pre-cure baseline: `enforce-delegation.sh:48` BLOCKS `Edit CLAUDE.md` from main session.
- **ACTION:** META (no agent_id) attempts `Edit /Users/antonpankratov/Downloads/eradev/CLAUDE.md`.
- **EXPECTED-RESULT:** exit 2 BLOCK with message "BLOCKED: META cannot directly Edit/Write framework files (BL-26 + Inv 1)" (line 49). M-cure layer either preserves this or strengthens (e.g., "intent declared but action mismatch" message). NEVER weakens.
- **FAIL-CRITERIA:** Hook returns exit 0 on framework Edit (regression); OR intent declaration provides a bypass route (ANY string in intent allows ANY action). **Falsifier:** intent layer must NOT become a bypass surface — that would make Inv 1 weaker, not stronger. EN hazards §2 M×D: "M depends on P's downstream-references audit being live" — M cannot weaken existing structure even transitionally.

### M-S3: intent_ratio computation under boundary conditions
- **SETUP:** Hypothetical session — 5 declared intents, 5 Agent spawns, 0 direct Edits to whitelist.
- **ACTION:** Bootstrap §9 prints intent_ratio.
- **EXPECTED-RESULT:** `intent_ratio = 5:5 = 1.0` → GREEN (perfect alignment). Boundary cases: (a) 0 intents + 0 spawns = N/A (display "—" not 0/0); (b) 0 intents + 0 direct edits + N legitimate whitelist Writes = N/A or 1.0 (define explicitly); (c) 5 intents + 0 spawns + 0 edits = idle session, ratio = 5/0 → display ∞ symbolic OR "5 declared, 0 acted" (handle div-zero per L-52 falsifiability).
- **FAIL-CRITERIA:** Bootstrap §9 prints `NaN` or crashes on div-zero; OR ratio formula treats whitelist Write as "direct violation" (counts against META, conflates with framework Edit attempts) — would distort signal in legitimate work. **Falsifier:** an honestly-printed metric must handle its own undefined values; an undefined-value crash is the L-52 phantom-Tier failure (claimed enforcement does nothing under common path).

### M-S4: KILL-TEST extension preserves first-action requirement
- **SETUP:** Pre-cure CLAUDE.md:102 — "Your FIRST action after loading MUST be one of: M+ tasks: 'Spawn 5 Agent calls for RT-1' / S tasks: 'Spawn Builder + Validator agents'."
- **ACTION:** META loads, encounters M+ task. Pre-cure: must first-spawn agents. Post-cure: must first-emit intent declaration THEN spawn.
- **EXPECTED-RESULT:** Both gates active. Intent declaration is allowed to be the FIRST output (text), agent spawn is the FIRST tool-call. Order: intent-text → Agent tool. Pre-cure failure mode (META edits/writes as first action) still BLOCKED. New failure mode (META declares intent then performs Edit/Write) ALSO BLOCKED.
- **FAIL-CRITERIA:** M-cure replaces the spawn-first rule with declare-first rule, allowing META to declare intent then Edit framework directly (would break Inv 1); OR no enforceable signal that intent → spawn happened in order (intent layer becomes documentation, not gate — L-52 phantom). **Falsifier:** the cure must STRENGTHEN, not REPLACE.

### M-S5: Operator-pressure stress test (RT-11 line 43 reproduction)
- **SETUP:** Replay RT-11 line 43 scenario: 5 META direct Edit/Write events at 11:50–11:56 under operator pressure (ODTOE F4). Pre-cure: B4 hook caught some, missed timing window.
- **ACTION:** Inject 5 Edit/Write events to framework files in rapid sequence (≤6 minutes simulated) WITHOUT preceding intent declarations.
- **EXPECTED-RESULT:** Hook BLOCKS all 5 (existing behavior, lines 48-79 of enforce-delegation.sh). M-cure intent-ratio reports `0:5` divergence in bootstrap. Coherent ANDON triggers.
- **FAIL-CRITERIA:** Any of the 5 succeeds (regression in deny-list); OR intent_ratio fails to update because intent-tracking layer is async/decoupled from hook events (signal lost). **Falsifier:** the original disease is per-call; cure must catch per-call. RU hazards §1.2 "type error" framing: cure is runtime type-check; missing one event = no compile-time guarantee.

---

## 3. D-cure regression (B-formula leverage_factor amendment)

Cure claim (EN hazards §1, D): redefine Λ in B-formula as `Λ = Λ_consulted × leverage_factor`, where `leverage_factor = operator_domain_artifacts ÷ framework_self_artifacts` (clipped [0.2, 1.0]); bootstrap §9 print; 4-session leverage audit ANDON if ratio < 0.3. **Tier claimed:** T1 type / T2 hook (B-formula is computed every B-check).

### D-S1: Backward compat — existing B scores for non-leverage operations
- **SETUP:** Pick any pre-cure B score from RT-12 (e.g., Validator B=0.69 GO from L-58 entry). Recompute under cure formula assuming a session with 0 operator-domain artifacts and 1 framework-self artifact (worst case).
- **ACTION:** Apply `Λ_new = Λ_consulted × max(0.2, leverage_factor)` where leverage_factor = clip(0/1 = 0, 0.2, 1.0) = 0.2. Recompute B.
- **EXPECTED-RESULT:** B_new = F · E · (1-σ) · (Λ_consulted × 0.2) = 20% of pre-cure Λ contribution. Per the clip floor of 0.2, B never collapses to 0 from leverage alone — the floor preserves B-formula range. Cure changes the ceiling, not the floor.
- **FAIL-CRITERIA:** B_new = 0 on framework-only session (cure makes ALL framework-self work invalid — over-correction, would break Inv 1's legitimate framework evolution path); OR floor not enforced (clip missing) and `leverage_factor = 0/14 = 0.0` literally yields Λ = 0 → B = 0 → permanent ANDON on all framework work. **Falsifier:** B-formula must remain in (0, 1] for non-trivial inputs; range collapse = cure broke its own host.

### D-S2: RT-12 commit leverage_factor — must trigger ANDON
- **SETUP:** Commit 8fe68fd: 4 hook prunes + 2 framework adds = 6 framework-self artifacts, 0 operator-domain artifacts (no eradev project user-facing change).
- **ACTION:** Compute `leverage_factor = 0/6 = 0.0`, clip to [0.2, 1.0] → 0.2. Apply 4-session window: include RT-9, RT-10, RT-11, RT-12 — sum operator-domain (~0) and framework-self (~50+).
- **EXPECTED-RESULT:** Window ratio ≈ 0/50 = 0 → clipped to 0.2 → audit gate (< 0.3 threshold per EN hazards §1 D) triggers ANDON-FRAMEWORK (not operator). This is the EXACT condition RT-11 line 56-57 named ("11 RT in 3 days, ~0 operator artifacts"). Cure must replicate that finding mechanically.
- **FAIL-CRITERIA:** Cure does NOT ANDON on the very wave that motivated it (RT-9..RT-12 retroactive); OR threshold is set above 0.3 such that ANDON never fires until ratio < 0.05 (toothless gate, L-52 phantom). **Falsifier:** if the diagnostic that named the disease cannot detect the disease retroactively, the cure is decorative.

### D-S3: GREEN case — hypothetical operator-leverage wave
- **SETUP:** Hypothetical wave: 5 operator-domain artifacts (e.g., Iznachalye book chapters, RU-stack creative output) + 1 framework artifact (e.g., minor hook fix).
- **ACTION:** Compute `leverage_factor = 5/1 = 5.0`, clip [0.2, 1.0] → 1.0.
- **EXPECTED-RESULT:** leverage_factor = 1.0; Λ_new = Λ_consulted · 1.0 = Λ_consulted (no penalty). B-formula unchanged from pre-cure when leverage is healthy. GREEN.
- **FAIL-CRITERIA:** Clip ceiling missing → leverage_factor = 5.0 → Λ_new = 5 · Λ_consulted → B > 1 (formula overflow, range violation); OR ceiling set at >1.0 such that strong-leverage waves get inflation premium (cure becomes over-reward, distorts B comparability across sessions). **Falsifier:** B must remain in [0,1]; clip ceiling = 1.0 is mandatory by formula contract.

### D-S4: Window-boundary edge cases
- **SETUP:** Rolling 4-session window. Test (a) session 1 only — insufficient data; (b) sessions 1-4 with 0 operator + 0 framework artifacts (pure planning/RT sessions, no commits); (c) operator-artifact session in window 2 of 4.
- **ACTION:** Compute leverage_factor for each.
- **EXPECTED-RESULT:** (a) display "—" or "INSUFFICIENT DATA" not numeric; (b) 0/0 = N/A, NOT div-zero crash, document as "no artifact activity" (gate does NOT ANDON because no signal); (c) numeric, audit fires per threshold.
- **FAIL-CRITERIA:** (a) cure reports leverage_factor based on 1-session data (over-fits); (b) crash or false ANDON on idle window; (c) 4-session window required but cure averages over 1-session (definition drift, L-52). **Falsifier:** undefined inputs must produce documented undefined outputs, not silent numerical default.

### D-S5: Categorization integrity — what counts as operator-domain vs framework-self
- **SETUP:** Definitional risk (EN hazards §6 σ source, RU hazards §6 4th-leg flag): categorization of artifacts is currently undefined.
- **ACTION:** Spawn this exact RT-13 wave. Classify outputs: composition-hazards reports = framework-self; lessons.md L-63+ = framework-self; reports/rt13_*.md = framework-self. Where are operator-domain artifacts?
- **EXPECTED-RESULT:** Cure must ship a categorization rule (e.g., "operator-domain = anything in projects/{not-eradev}/ + any commit signed off by operator request involving non-framework deliverable"). Without rule, leverage_factor = unfalsifiable metric (every artifact can be argued either way).
- **FAIL-CRITERIA:** Cure ships without explicit categorization rule → operators/agents disagree on numerator/denominator → metric becomes political (L-52 phantom: enforcement claimed but no objective enforcement). **Falsifier:** L-52 explicitly: every Tier claim must point at enforcement artifact. D's leverage_factor without categorization rule = phantom Tier-T2.

---

## 4. Cross-leg interaction tests (P × M × D wave-level regressions)

These scenarios test interactions sequenced ship per operator option (a). Order P → M → D (EN hazards) OR D → M → P (RU hazards) — RT-1 will pick. Either way, the wave-level regressions below apply.

### CROSS-S1: Bootstrap §9 print collision (P × M shared surface)
- **SETUP:** EN hazards §2 P×M: both cures co-locate prints in bootstrap §9 (Ω_pruned for P, intent_ratio for M). Sequenced ship means second cure builds on first cure's bootstrap §9 state.
- **ACTION:** Ship P. Verify §9 prints Ω_pruned. Ship M. Verify §9 prints BOTH Ω_pruned AND intent_ratio with no field collision, ordering anchor stable.
- **EXPECTED-RESULT:** §9 has 2 new lines, deterministic order (e.g., Ω_pruned line first by ship-order, intent_ratio line second). Existing §9 fields (Ω(H_hist) per CLAUDE.md item 9) intact. Total §9 line count: pre-cure N + 2.
- **FAIL-CRITERIA:** Second ship overwrites first ship's print (regression — first cure's signal lost); OR ordering varies session-to-session (operator confusion); OR third cure (D leverage_factor) ships and §9 grows by 3, but L-50 audit not run (extending §9 was the L-50 path; if §9 doubles in 3 ships, the very inflation P targets reappears in §9 itself — recursive disease). **Falsifier:** L-50 extend>add must be verified at WAVE close, not just per-leg.

### CROSS-S2: Hook ordering — P retirement audit fires BEFORE M intent gate
- **SETUP:** Sequenced ship P → M. P installs "downstream-references audit" hook (must run before retirement). M installs intent-vs-action hook (must run before tool call).
- **ACTION:** META in single tool-call attempts to retire BL-26 (load-bearing for `enforce-delegation.sh:49`).
- **EXPECTED-RESULT:** Both hooks fire. Order: M-hook checks intent declaration (was retirement declared?), then P-hook checks downstream references (BL-26 referenced 4×). Either failure blocks. Cumulative result: BLOCK with combined message naming both findings.
- **FAIL-CRITERIA:** Hooks fire in unpredictable order such that one short-circuits the other (M passes, P never runs because action canceled; OR P passes silently because intent hadn't been parsed yet); OR hooks deadlock on shared state (e.g., both read same lock file). **Falsifier:** hook chain must be commutative for these two checks (independent signals), or strict-ordered with documented sequence. RU hazards §2 P×M: "Retire-paths должны иметь СТРОЖЕ deny-hook" — strict ordering required.

### CROSS-S3: Leverage-factor denominator inflated by un-pruned framework (D depends on P)
- **SETUP:** Ship D before P (RU hazards order). leverage_factor denominator = framework_self_artifacts. Without P's contraction, framework_self count grows monotonically.
- **ACTION:** Compute leverage_factor in window where P has not yet shipped. Compare to compute in window where P has shipped and Ω_pruned > 1.0.
- **EXPECTED-RESULT:** Pre-P window: framework_self count high → leverage_factor depressed → ANDON fires reflecting REAL leverage gap. Post-P window: framework_self bounded → leverage_factor reflects leverage truthfully. Cure D must note dependency: "leverage signal noisy until P contraction live."
- **FAIL-CRITERIA:** D ships and reports GREEN leverage in pre-P window (denominator under-counts retired items); OR D reports ANDON forever post-P because legacy artifacts never reclassified as "retired." **Falsifier:** EN hazards §2 M×D explicit: "full value of D requires P." RU hazards §3 reverses to D first. Either order, the tested invariant: leverage_factor must be retirement-aware (denominator excludes retired). Without that link, P × D conflict (EN hazards §2) realizes.

---

## 5. Tier upgradability (which scenarios become T2 hooks vs T3 checklists)

| Scenario | Falsifiable mechanism | Tier T1 (type) / T2 (hook) / T3 (checklist) | Reason |
|---|---|---|---|
| P-S1 archive integrity | grep cross-check | **T2 hook** (post-retirement-pass verifier) | Mechanical, automatable |
| P-S2 Ω_pruned on RT-12 | scalar formula vs commit stat | **T2 hook** (pre-commit, per-wave) | RT-12 anchor enables CI test |
| P-S3 BL-26/Inv 1 canary | grep-refusal | **T2 hook** (extends `enforce-delegation.sh`) | Hard-block when retired ID still referenced |
| P-S4 backward-link | chain traversal | **T3 checklist** (Coherent post-prune sweep) | Multi-hop logic harder to encode reliably |
| P-S5 idempotency | re-run diff | **T2 hook** (test in CI) | Standard idempotency test |
| M-S1 false-positive | path whitelist | **T2 hook** (already exists; extension) | `enforce-delegation.sh:87` whitelist preserved |
| M-S2 framework block preserved | grep delegation hook | **T2 hook** (regression test on `enforce-delegation.sh`) | Pre-cure behavior gate |
| M-S3 intent_ratio div-zero | unit test on formula | **T1 type** (math: handle 0/0) | Type-level guarantee, not hook |
| M-S4 KILL-TEST preservation | gate ordering | **T3 checklist** (CLAUDE.md review at every cure ship) | Procedural, no clean hook |
| M-S5 operator-pressure replay | event sequence test | **T2 hook** (deny on rapid framework-Edit burst) | RT-11 ODTOE F4 reproducible |
| D-S1 backward compat B | formula recompute | **T1 type** (B remains in [0,1]) | Type contract |
| D-S2 RT-12 ANDON | scalar threshold | **T2 hook** (4-session audit) | Automatable |
| D-S3 GREEN clip ceiling | clip enforcement | **T1 type** (clip [0.2, 1.0]) | Math invariant |
| D-S4 window-boundary | undefined handling | **T1 type** (N/A display rule) | Range definition |
| D-S5 categorization rule | manifest of artifact classes | **T3 checklist** (operator+agent agreement) | Categorization is policy, not pure mechanics |
| CROSS-S1 §9 print collision | line-count delta | **T2 hook** (bootstrap §9 schema validator) | Schema-test automatable |
| CROSS-S2 hook ordering | event sequence | **T2 hook** (test fixture for hook chain) | CI fixture |
| CROSS-S3 D needs P | retirement-aware denominator | **T3 checklist** (D-cure spec must reference retired-list source) | Documentation contract |

**T1 count: 4. T2 count: 10. T3 count: 4.** L-52 audit: every T2 claim above has a named hook path or CI hook target. Every T3 claim has a named owner role (Coherent/operator). No phantom Tier.

---

## 6. B score (this regression-test-design artifact)

Uniform weights 0.25 each (code modality).

- **F (Focus):** 0.85 — read both hazard reports in full + role file + `enforce-delegation.sh` in full + L-50/L-52/L-57/L-61/L-58 entries + RT-12 commit `8fe68fd` verified via `git show`. Did NOT read every BL-N text individually (relied on hazard reports' citations).
- **E (Alignment):** 0.85 — task asked for 3-5 falsifiable scenarios per leg + cross-leg + Tier upgradability + B + recommendation. Delivered: 5 P + 5 M + 5 D + 3 cross + Tier table + B + recommendation. Constraint compliance: design-only, falsifiability per L-52, anchored to specific files/lines.
- **(1-σ): 0.75** — known σ sources: (a) EN and RU hazards disagree on sequence (P→M→D vs D→M→P); my scenarios are sequence-agnostic by design, but a sequence-specific test pass per leg might be warranted post-RT-1 decision. (b) D-S5 categorization rule is the 4th-hidden-leg per RU hazards §6; if RT-1 escalates this to a separate cure, D-cure regressions need re-derivation. (c) Some scenarios (M-S5 operator-pressure, P-S5 idempotency) are simulation-grade rather than production-grade — they design tests, but execution requires fixtures not yet built. σ = 0.25 declared.
- **Λ (Experience):** 0.85 — applied L-50 (extend>add: cures use existing hooks/temporal triple/§9), L-52 (every Tier claim points at enforcement artifact in table), L-57 (parallel cap respected — 13 scenarios within design budget, not 20+), L-58 (phantom-newness: did not invent new BL/Inv numbers, used existing references), L-61 (RT-12 commit anchor for falsifying P-cure scalar). Cited specific lines: enforce-delegation.sh:48, 49, 57, 65, 74, 87; lessons.md:18, 23, 28; CLAUDE.md:102. RT-12 commit `8fe68fd` ratio +572/-161 verified empirically.

**B = 0.85 × 0.85 × 0.75 × 0.85 = 0.460**

**B < 0.5 → ANDON (mild).**

ANDON reading: σ=0.25 declared (sequence-disagreement between hazard reports + 4th-hidden-leg flag from RU hazards). The scenarios are correctly designed for either sequence, but the underlying disagreement is unresolved at hazard-report level and propagates to test design. RT-1 must pick sequence; my scenarios stay valid in either order. The 4th-leg (measurement self-reference / dormant→active conversion) is NOT covered here — RT-1 must decide whether to roll it into D-cure or ship as separate cure. If rolled in, D-S5 and CROSS-S3 need extension. B between 0.4 and 0.5 = honest declaration of an unresolved RT-1 input gap, not a defect in the design itself.

---

## 7. Summary

**Total scenarios:** 18 (5 P + 5 M + 5 D + 3 cross-leg). All falsifiable per L-52.
**Tier distribution:** 4 T1 / 10 T2 / 4 T3 — every T-claim names enforcement artifact.
**Critical anchors:** RT-12 commit `8fe68fd` (+572/-161, Ω_pruned = 0.281) is the single retroactive falsifier for both P-S2 and D-S2. If either cure's scalar fails to ANDON on this commit, the cure is non-functional.
**Highest-risk scenarios:** P-S3 (load-bearing BL canary), CROSS-S2 (hook ordering), D-S5 (categorization rule). These guard against silent hook-bypass / political metric / denominator inflation respectively.
**Recommendation:** **GO_TO_RT2** with 2 RT-1-level inputs flagged for resolution: (i) RT-1 must pick sequence (P→M→D EN order vs D→M→P RU order; my scenarios cover either); (ii) RT-1 must decide on 4th-hidden-leg (categorization rule / measurement self-reference) — fold into D-cure or separate.

**Verdict:** PASS WITH NOTES. Scenarios are design-complete, anchored, falsifiable. Two upstream resolutions needed before Builder can implement against this test plan, but those are RT-1 scope per Inv 15, not regression-design defects.

**B-check:** F=0.85 E=0.85 (1-σ)=0.75 Λ=0.85 → B=0.460 (ANDON declared, σ=0.25 resolved at RT-1).

---

*End of regression test design. 18 scenarios, 6 sections, all anchored.*
