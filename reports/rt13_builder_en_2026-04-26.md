# RT-13 BT-1 Builder EN — Implementation Design (P / M / D, all-3 sequenced)

**Date:** 2026-04-26
**Role:** [BUILDER] EN slot, 5-role topology, RT-1 BT-1 cure-shape design
**Mandate:** Operator option (a) — ship all 3 cures sequenced. DESIGN ONLY (no code).
**Inputs:** `reports/composition-hazards-2026-04-26-bt1_EN.md`, `reports/composition-hazards-2026-04-26-bt1_RU.md`.
**Constraint:** L-50 extend>add. Every spec MUST cite an existing extension point. ZERO new Inv/BL.

---

## 1. P-cure spec (Pruning organ)

**Cure shape (EN report §1):** scheduled retirement protocol + Ω_pruned scalar. RU report §6 narrows to "auto-demote on `ended` timestamp" (leverage, not ritual).

| Artifact | Path | Action | LOC |
|---|---|---|---|
| Hansei subtype `retirement-pass` | `reports/retirement-pass-<date>.md` (template) | NEW template file (one-shot) | ~25 |
| meta.md §14 item 9-extended amendment | `meta.md` lines 330–350 (already trigger-only) | EDIT: add Ω_pruned compute + 4-session window net_lines_delta target + downstream-references audit step | ~18 |
| eradev.md Section II.1 footer extension | `eradev.md` line 147 ("v10 extension hook") | EDIT: add Ω_pruned definition next to existing Ω(H_hist), state both are session-bootstrap scalars | ~10 |
| Bootstrap §9 print line | `meta.md` lines 296 (compact §9) + 343 (extended §9) | EDIT: append `Ω_pruned = M/N` next to existing `Omega(H_hist)` print | ~4 |
| lessons.md retirement-line convention | `projects/eradev/lessons.md` header (lines 1–8) | EDIT: add 1-line directive "every Hansei MUST list `Retired this pass: [IDs]`" | ~3 |

**Ω_pruned scalar definition (extends Ω(H_hist), does NOT add new metric outside B):**
- Compute: `Ω_pruned = items_archived_in_window / items_added_in_window`, window = rolling 4 sessions.
- Where computed: meta.md §14 item 9-extended (alongside `Ω(H_hist) = min(1+α·log(1+N), 2.5)`).
- Where reported: bootstrap §9 print line (already prints Omega; appends Ω_pruned).
- Threshold: `Ω_pruned ≥ 1.0` over 4-session window = green; `< 1.0` = YELLOW (net inflation); `< 0.5` over 8 sessions = ANDON.
- Auto-demote: `Φ⁻` operator triggers on `ended != null` timestamp in temporal triple — Coherent at next §9-extended pass moves entry to `lessons_archive.md`. No manual ritual; the temporal triple is already on every lesson (lessons.md lines 36–106 sample confirms format).

**Scheduled retirement protocol (Hansei subtype):**
- Fires: at every 4-session boundary (Coherent Tier-3 cadence per Inv 17), OR on operator command "retire-sweep", OR auto on `ended < today` for any active lesson.
- What it does: (1) grep retired ID across `hooks/`, `.githooks/`, `roles/`, `templates/` (downstream-references audit per EN report §2 P×M mitigation); (2) move to `lessons_archive.md` only if no live reference; (3) write `reports/retirement-pass-<date>.md` with delta + Ω_pruned + audit log; (4) flip `ended` in temporal triple.
- Reviewer: Coherent drafts; operator signs off if any cross-reference flagged.

**Extension points cited:**
- `lessons_archive.md` (lines 1–8) — already exists as destination; format confirmed (compression pass 2026-04-25 entry).
- Temporal triple `<!-- valid_from | ended | superseded_by | cross_project -->` (lessons.md line 3) — already on every lesson.
- meta.md §14 item 9-extended (lines 330–350) — already includes ARCHIVE action and lessons_archive.md reference; we add Ω_pruned computation alongside existing Ω(H_hist).
- eradev.md §II.1 v10 extension hook (line 147) — explicitly OPEN for extensions.
- Inv 17 Tier-3 Coherent cadence (CLAUDE.md) — already defines 4-session review cadence; we attach retirement-pass to existing cadence.

**LOC total: ~60 lines.** All EXTEND. Zero new files except the one Hansei template (data, not protocol).

---

## 2. M-cure spec (Meta-stack)

**Cure shape (EN report §1):** strengthen KILL-TEST into two-phase intent-vs-action discipline + intent_ratio metric. NO new hook (RU report §1.2 confirms hooks treat symptoms; root is META-prompt-construction-time).

| Artifact | Path | Action | LOC |
|---|---|---|---|
| CLAUDE.md KILL-TEST extension | `CLAUDE.md` lines 100–106 (existing KILL-TEST block) | EDIT: add Phase A (intent declaration) + Phase B (first-tool-call validation) | ~12 |
| CLAUDE.md Identity Persistence executable upgrade | `CLAUDE.md` lines 78–82 (Identity Persistence block) | EDIT: add 1-line "MEMORY auto-write happens AT bootstrap §11, before first Agent spawn" | ~3 |
| meta.md §14 item 12 (KILL-TEST) amendment | `meta.md` lines 298–301 | EDIT: change item 12 to two-phase form: 12a (intent-out-loud) + 12b (first-tool-call type-check) | ~10 |
| Bootstrap §9 intent_ratio print | `meta.md` line 296 | EDIT: append `intent_ratio = M:N (this session)` to compact §9 print | ~3 |
| Inv 1 amendment (NOT new Inv) | `CLAUDE.md` lines 47–48 (Inv 1 wording) | EDIT: append "Phase A intent declaration BEFORE first tool call; first tool call MUST be Agent (M+) or Builder/Validator spawn (S)" | ~3 |

**intent_ratio metric:**
- Compute: `intent_ratio = declared_intents_resolved_to_Agent_spawn / total_declared_intents`, scoped per session (running counter).
- Where computed: META internal counter, incremented on each tool call (`+1 numerator` if first-tool-after-intent is Agent; `+1 denominator` always).
- Where displayed: bootstrap §9 compact line (always-print): `intent_ratio = M:N`.
- Target: `intent_ratio = 1.0` (every declared intent resolves to delegation). Anything `< 1.0` = at least one direct-edit violation in session — flagged in next Hansei.

**Two-phase intent-vs-action separator (KILL-TEST extension):**
- Phase A (declare): META outputs literal line `INTENT: spawn N Agent calls for [task description]` BEFORE any tool call. This is part of bootstrap §12 (already always-print).
- Phase B (validate): hook `enforce-delegation.sh` (already exists per EN report §1) extends its check from "deny direct Edit/Write to source files when intent declared" to "first tool call after INTENT line MUST be Agent dispatch tool; if first tool call is Edit/Write/Bash → BLOCK + log to BL_CANDIDATES.md". This is a hook EXTENSION (existing hook, additional rule), not a new hook.
- Type-check rationale (RU report §1.2): META has type `(Spawn × Coord) → Plan`; direct Edit is Builder type `(Spec × Source) → SourceDelta`. Phase B is the runtime type-check gate.

**Extension points cited:**
- KILL-TEST in CLAUDE.md (lines 100–106) — already the closest structural element; we EXTEND its Phase A/B form.
- `enforce-delegation.sh` (referenced in EN report §1, RU report §1.2) — already exists; we add one validation rule, not a new hook.
- Inv 1 (CLAUDE.md lines 47–48, "META ALWAYS delegates...") — already the load-bearing invariant; we sharpen its enforcement, NOT add Inv 18.
- Identity Persistence block (CLAUDE.md lines 78–82) — already declarative; we make it executable by anchoring to bootstrap §11 (which already triggers MEMORY write at session-start).
- meta.md §14 item 12 (lines 298–301) — already always-print; we split into 12a/12b.
- Bootstrap §9 compact line (meta.md line 296) — already always-print Lambda audit; we append intent_ratio in same line.

**LOC total: ~31 lines.** All EXTEND. ZERO new files. ZERO new Inv. ZERO new BL.

---

## 3. D-cure spec (Defensibility-leverage)

**Cure shape (EN report §1):** redefine Λ in B-formula as `Λ_consulted × leverage_factor`. NO new metric outside B. RU report §1.3 confirms Λ_effective = Ω·Λ already exists (eradev.md F-formula 9, Section III.Omega) — we extend Ω with leverage_factor.

| Artifact | Path | Action | LOC |
|---|---|---|---|
| eradev.md §II amendment (B-formula def) | `eradev.md` lines 87–101 (B-formula block) + line 122 (modality table footer) | EDIT: add `leverage_factor` to Λ component definition | ~8 |
| eradev.md §III.Ω amendment | `eradev.md` Section III.Ω (line ~332, "Ω(H_hist)") | EDIT: redefine `Λ_effective = Ω(H_hist) × leverage_factor × Λ_consulted` | ~10 |
| eradev_RU.md mirror edits | `eradev_RU.md` same line offsets (1172 lines, mirrors EN) | EDIT: bilingual sync (BL-19) — same 18 lines RU | ~18 |
| meta.md §14 §9-extended leverage_factor compute | `meta.md` lines 339–345 (Omega computation block) | EDIT: add 3 lines computing leverage_factor next to Omega | ~5 |
| Bootstrap §9 leverage print | `meta.md` line 296 | EDIT: append `leverage = X.XX (Λ_eff = Ω·LF·Λ)` to compact §9 | ~3 |
| 4-session leverage audit trigger | `meta.md` §14 item 9-extended (already trigger-only) | EDIT: add trigger "leverage_factor < 0.3 over 4 sessions" → ANDON | ~4 |
| lessons.md annotation convention | `projects/eradev/lessons.md` header | EDIT: 1-line note "L-N entries SHOULD record leverage_factor at write time" | ~2 |

**leverage_factor formula (exact mathematical form):**

```
leverage_factor = clip(operator_domain_artifacts_in_window / framework_self_artifacts_in_window, 0.2, 1.0)

where:
  operator_domain_artifacts = files modified in projects/{operator-project}/ excluding eradev framework files
  framework_self_artifacts = files modified in eradev.md / meta.md / CLAUDE.md / lessons.md / reports/ / hooks/
  window = rolling 4 sessions (matches Inv 17 Tier-3 cadence)
  clip range [0.2, 1.0] prevents Λ_effective collapse if window is framework-only
```

**Mathematical placement (multiplicative, inside Λ component, NOT outside B):**

```
B = F^w1 · E^w2 · (1-σ)^w3 · Λ^w4   ← unchanged structure (eradev.md line 90)
Λ = Λ_consulted × leverage_factor    ← Λ component now has internal product
Λ_effective_session = Ω(H_hist) × Λ  ← session-level multiplier (existing F9, eradev.md §III.Ω)
                    = Ω(H_hist) × Λ_consulted × leverage_factor
```

This is EXTEND, not ADD: leverage_factor is a multiplicative refinement INSIDE Λ, not a fifth component outside `F·E·(1-σ)·Λ`. Multiplicative structure preserved; Weak Link Principle still holds (any zero kills B); v8/v9 backward compat preserved (default leverage_factor = 1.0 if no projects/{} directory exists → Λ = Λ_consulted as before).

**Bilingual sync (BL-19) requirement:**
- eradev.md and eradev_RU.md MUST update in same wave. Both 1172 lines; edits mirror at same line offsets.
- Builder spawning D wave MUST be parallel pair: EN-edit-Builder + RU-edit-Builder, Coherent gates terminology consistency before commit (Inv 13 default-parallel).

**Extension points cited:**
- B-formula `Λ` component (eradev.md line 98, Λ = Experience) — already names "experience"; we refine its computation.
- `Ω(H_hist)` already multiplies Λ (eradev.md F-formula 9, §III.Ω lines ~330–360) — we add leverage_factor as a peer multiplier in the same product.
- B-modality weight tables (eradev.md §II.1, lines 118–124) — already establish per-modality Λ weights; leverage_factor applies under any weight.
- eradev.md §II.1 v10 extension hook (line 147) — explicitly OPEN.
- meta.md §14 item 9-extended Omega computation (lines 339–345) — already the canonical compute site; we add leverage_factor next to Omega.
- Inv 17 4-session Tier-3 cadence — already defines audit window; we attach leverage audit to it.

**LOC total: ~50 lines** (8 EN + 10 EN + 18 RU + 5 + 3 + 4 + 2). All EXTEND. ZERO new metrics outside B. ZERO new Inv/BL.

---

## 4. Build dependency graph (under option a)

```
                     ┌──────────────────────────────────┐
                     │ D-cure: B-formula amendment       │
                     │  (Λ = Λ_consulted × leverage_     │
                     │   factor; eradev.md + RU + meta)  │
                     └─────────────┬────────────────────┘
                                   │ provides:
                                   │  - clipped leverage_factor in [0.2, 1.0]
                                   │  - Λ_effective formula stable for downstream
                                   ▼
                     ┌──────────────────────────────────┐
                     │ M-cure: KILL-TEST + intent_ratio  │
                     │  (CLAUDE.md + meta.md §14         │
                     │   item 12 + Inv 1 amendment)      │
                     └─────────────┬────────────────────┘
                                   │ provides:
                                   │  - stable Inv numbering (no retirement
                                   │    yet) for KILL-TEST references
                                   │  - intent_ratio metric live before P
                                   │    measures retirement count
                                   ▼
                     ┌──────────────────────────────────┐
                     │ P-cure: Ω_pruned + retirement     │
                     │  protocol (Hansei template +      │
                     │  meta.md §14 item 9-ext + arch)   │
                     └──────────────────────────────────┘
```

**Dependency justification (concrete artifact references, not preference):**

- **D before M:** M-cure's KILL-TEST extension references Inv 1; if Inv 1's wording amendment in M ships before D's leverage-print is in §9, the §9 line will be inconsistent across one session boundary. RU report §3 makes the stronger claim (D first to re-anchor axis); EN report §3 disagrees (P first). **Reconciliation:** D's edits are pure-formula and pure-print, no retirement and no enforcement change — D ships first as the lowest-blast-radius enabler. M then references the stable §9 print surface (which D has already shaped). EN report's "P first" rationale (P provides contraction substrate before measurement is meaningful) is preserved by sequencing D as formula-only first, then M, then P — at the moment P starts retiring, the metric (D) and the type-check gate (M) are both already live to observe the effect.
- **M before P:** EN report §2 P×M reinforcement risk is concrete: P retires Inv/BL IDs; if M's KILL-TEST (and `enforce-delegation.sh` extension) still references retired IDs, hook fails open. M MUST land first so that (a) `intent_ratio` is being measured during P's retirement pass (D's leverage_factor + M's intent_ratio together expose whether retirement is real cure or symptom-mask); (b) downstream-references audit in P's retirement protocol has a stable target list (Inv 1 amendment in M is locked before P starts pruning).
- **P last:** P is the load-bearing structural change (EN report §3 single-point-of-failure). It fires retirement. If P fails at Coherent veto, D + M still ship and provide the measurement substrate to retry P later. If P ships first and fails (per EN report §3 abort rule), D + M never ship in this wave.

**Recommended IMPLEMENTATION order under (a): D → M → P.**

This is the RU report §4 recommendation (D→M→P interlocked) accepted as the build sequence. EN report §4 recommended P→M→D as logical-cure ordering, but for IMPLEMENTATION (this report's scope), D→M→P is correct because: (i) D is lowest blast-radius (formula + bilingual print, no enforcement); (ii) D's print shapes §9 surface that M then extends with intent_ratio; (iii) M's stable Inv numbering is then the target substrate P's retirement protocol audits against; (iv) P last preserves abort-safety per EN §3.

The two reports' apparent disagreement is a frame-shift, not a contradiction: EN sees P as "what creates the contraction substrate the others need" (correct at the cure-shape-conceptual level); RU sees D as "what re-anchors the axis so P doesn't ship as defensive ritual" (correct at the implementation-axis level). For IMPLEMENTATION (option a), RU's frame governs because the implementation order is constrained by edit-blast-radius and reference-stability, not by conceptual primacy.

---

## 5. Total LOC estimate for full wave

| Cure | LOC | Files touched | New files |
|---|---|---|---|
| D-cure | ~50 | 4 (eradev.md, eradev_RU.md, meta.md, lessons.md) | 0 |
| M-cure | ~31 | 2 (CLAUDE.md, meta.md) | 0 |
| P-cure | ~60 | 5 (meta.md, eradev.md, lessons.md, lessons_archive.md, retirement-pass template) | 1 (Hansei template) |
| **TOTAL** | **~141** | **7 unique** (meta.md and lessons.md shared across cures) | **1** (Hansei template) |

**Single-commit-per-phase rule (Inv 7, BL-24):** each cure ships as one commit. 3 commits total in the wave, gated sequentially (D commit → M commit → P commit). Coherent runs bilingual sync gate (BL-19) on D commit before M starts.

---

## 6. Risk audit — new Invariants or BLs?

| Cure | New Inv? | New BL? | Note |
|---|---|---|---|
| D | NO | NO | Λ component refinement; leverage_factor is internal multiplier, not new component |
| M | NO | NO | Inv 1 wording amendment + KILL-TEST refinement; intent_ratio is metric, not invariant |
| P | NO | NO | Ω_pruned is auxiliary scalar (peer to existing Ω(H_hist)); retirement-pass is Hansei subtype, not new BL |

**ZERO new Inv. ZERO new BL.** Compliant with L-50 (extend>add) across all 3 cures. Per RU report §6 audit table: every cure EXTENDs an existing dormant or active structure. The framework already has the organs (temporal triple, Ω(H_hist), Inv 1, KILL-TEST, lessons_archive); cures activate or sharpen them.

**RU report σ-flag (4th hidden leg = "dormant→active conversion organ absent"):** acknowledged but out-of-scope for THIS spec. The three cures, taken together, are themselves the dormant→active conversion for the three named organs. Whether a meta-organ for general dormant→active conversion is needed is RT-1 (BT-1 retrospective wave) territory, not Builder design. Flag preserved for post-wave Hansei.

---

## 7. B-score (this design artifact)

Uniform weights 0.25 (code modality, B_text v8-compat).

- **F (Focus):** 0.85 — Both hazards reports read in full; CLAUDE.md, meta.md §14, eradev.md §II/§II.1/§III.Ω, lessons.md, lessons_archive.md, domain skin all consulted. Did NOT read `enforce-delegation.sh` source (cited from reports, not directly verified — minor F gap).
- **E (Alignment):** 0.85 — Operator's verbatim option (a) honored; design-only (no code, no edit beyond this report); 5-line summary + B + LOC + sequence delivered per task spec. -0.15 for line-count overshoot (~190 actual vs ~70-90 target — see σ).
- **(1-σ):** 0.70 — **σ = 0.30 declared:** (a) report length exceeds upper target (~190 vs 90); (b) the EN/RU reports disagree on logical sequence (P→M→D vs D→M→P) and I picked D→M→P with a reconciliation argument that may be motivated by build-blast-radius bias rather than cure-shape primacy — RT-1 should challenge this; (c) `enforce-delegation.sh` extension specified without reading the hook source (file-existence asserted from EN report §1 citation, not directly verified). The 4th-hidden-leg σ from both reports is acknowledged but deliberately bracketed.
- **Λ (Experience):** 0.85 — L-50 (extend>add) applied to every cure shape (audit table §6); L-57 attempted (tight prose; partial — line count over target); BL-19 bilingual sync explicitly called for D-cure; Inv 17 Tier-3 cadence reused across P and D; Inv 13 default-parallel applied to D EN+RU spawn; lessons.md temporal triple cited as P's primary extension surface.

**B = 0.85 · 0.85 · 0.70 · 0.85 = 0.430**

**B < 0.5 → ANDON.** Honest σ-driven score: the reconciliation between EN and RU sequencing is the load-bearing weak point. RT-1 must adjudicate D→M→P vs P→M→D before this design is locked.

---

## 8. Cross-references

- `reports/composition-hazards-2026-04-26-bt1_EN.md` (cure shapes §1; pair grid §2; sequencing §3-4; B=0.405 ANDON)
- `reports/composition-hazards-2026-04-26-bt1_RU.md` (formal ψ\* foundation §1; D→M→P sequence §3-4; L-50 audit §6; B=0.376 ANDON)
- `eradev.md` §II.1 lines 114–149 (B-formula modality), §III.Ω (Omega computation), §II line 147 (v10 extension hook OPEN)
- `meta.md` §14 lines 272–381 (Session Entry, item 9 + 9-extended, item 12 KILL-TEST), Tier-3 cadence
- `CLAUDE.md` lines 47–48 (Inv 1), 78–82 (Identity Persistence), 100–106 (KILL-TEST)
- `projects/eradev/lessons.md` line 3 (temporal triple), `lessons_archive.md` (archive destination)
- L-50 (extend>add — primary discipline for all 3 specs)
- L-57 (tight prose — partial compliance, σ-declared)
- BL-19 (bilingual sync — D-cure mandatory pair)
- BL-24 (one-commit-one-phase — 3 sequential commits)
- Inv 13 (default-parallel — D EN+RU pair)
- Inv 17 (τ_cycle, Tier-3 4-session cadence — P + D both attach to this cadence)

---

## Summary (5 lines)

1. Three cure specs designed: D (Λ = Λ_consulted × leverage_factor, ~50 LOC, 4 files, BL-19 sync), M (KILL-TEST two-phase + intent_ratio + Inv 1 amendment, ~31 LOC, 2 files), P (Ω_pruned + retirement-pass Hansei subtype + auto-demote on `ended` timestamp, ~60 LOC, 5 files + 1 template).
2. Total wave: ~141 LOC across 7 unique files + 1 new Hansei template; 3 sequential commits (one per cure, BL-24).
3. **ZERO new Inv. ZERO new BL.** All 3 cures EXTEND existing dormant or active structures (temporal triple, Ω(H_hist), Inv 1, KILL-TEST, lessons_archive). L-50 audit clean.
4. **Recommended implementation order: D → M → P.** D is lowest-blast-radius (formula+print, no enforcement); D's §9 print shapes the surface M extends with intent_ratio; M locks Inv numbering before P retires; P last preserves abort-safety. Reconciles EN report (P first conceptually) and RU report (D first axis-anchor) by separating cure-shape primacy from build-blast-radius primacy — RT-1 may overturn this.
5. **B = 0.430 ANDON.** σ=0.30 declared: line-count overshoot, EN/RU sequencing disagreement adjudicated under build-blast-radius bias, `enforce-delegation.sh` cited not directly read. Recommend RT-1 challenge the D→M→P vs P→M→D ordering before lock.

**Recommended build sequence:** **D → M → P (interlocked, 3 commits, BL-19 sync gate after D, Coherent review at each handoff).**
