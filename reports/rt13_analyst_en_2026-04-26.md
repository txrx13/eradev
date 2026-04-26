# RT-13 BT-1 Analyst (EN) — Empirical Baseline + Measurement Plan

**Date:** 2026-04-26
**Role:** [ANALYST] (5-role topology; Activation A_F + A_E applied)
**Domain:** code (skin: `templates/domain_skin.code.md`); B-modality = text (uniform 0.25).
**Operator request:** "(all-3 sequenced) option a" — ship P / M / D in one sequenced wave (P → M → D per `composition-hazards-2026-04-26-bt1_EN.md` §3-4).
**Mandate:** Ship empirical baseline NOW + measurement scalars per leg, BEFORE RT-1 specs cures.
**Scope:** baseline-only — does NOT propose cure shapes (RT-1's job); does NOT prejudge BT-1 sequencing (Visionary's job).

---

## 1. P-leg baseline — pruning organ atrophy

### 1.1 Git contraction signal (insertions vs deletions)

Window: last 14 days (`git log --since=2026-04-12 --shortstat`).

| Window | Commits | Insertions | Deletions | del/ins ratio |
|---|---:|---:|---:|---:|
| Last 5 days (`since 2026-04-21`) | 8 | 19063 | 2224 | **0.117** |
| Last 14 days (`since 2026-04-12`) | 26 | 24063 | 2413 | **0.100** |

Reading: framework expanding ~10× faster than contracting. Best single contraction event last 14d: `62359c3` (`projects/: remove odtoe-articles/ contamination`) at 10/+806/-, ratio 80.6 — a net retire commit. All other 25 commits are net-positive.

### 1.2 Retirement events (temporal triple `ended`)

- `lessons_archive.md` entries: 8 (all dated `ended: 2026-04-25`, single batch retirement during Session 11).
- `lessons.md` entries with `ended: 2026-04-2[1-6]`: 4 (in-place demotions awaiting archive move).
- **Total retirement events last 14d: 12** (1 batch event on 2026-04-25; otherwise none).
- BL retirement diffs in `BOOTSTRAP_LESSONS_universal.md` last 14d: 2 textual edits (BL-20 retired; BL-23/27 noted retired in totals line). Source: `git log --since=2026-04-12 -p` grep RETIRED.
- Inv retirement diffs: 0 (none retired; only added — 13 → 17 inclusive of Inv 17 added 2026-04-25).
- Hook retirement: 0 in last 14d. Net delta: hook count 6 → 9 over the window (`8fe68fd` adds 5 hooks, retires only 1).

### 1.3 Quantification — Ω_pruned formula

`Ω_pruned = (deletions ÷ insertions) × archive_count_in_window`

Where `archive_count_in_window` = count of items moved into `lessons_archive.md` OR marked `ended: <date>` in window. Both lessons + BL + Inv + hooks counted (any framework-tracked item with explicit retirement marker).

Bounds (proposed):
- **GREEN ≥ 0.30** (visible contraction; del/ins ≥ 0.30 with at least 3 retirements per 14d)
- **YELLOW 0.10–0.30** (some contraction but accretion dominates)
- **RED / ANDON < 0.10** (pruning organ inactive)

**Current value:**
- Last 14d: `Ω_pruned = 0.100 × 12 = 1.20`
- Last 5d: `Ω_pruned = 0.117 × 4 = 0.468`

Caveat (honest σ): the 14d figure looks healthy (1.20 > GREEN) ONLY because of one batch event (`Session 11 lessons` 2026-04-25 = 8 archive entries in a single commit). Excluding that single batch, last 14d would be `0.10 × 0 = 0.00` ANDON. **Pruning is event-bursty, not continuous — formula needs a "burstiness" guard.** Suggested refinement: divide window into N sub-windows; require at least one retirement event per sub-window. Current scalar lets 1 batch event mask 13 days of inactivity.

---

## 2. M-leg baseline — Meta-stack inversion

### 2.1 Documented META direct-action attempts

Direct empirical evidence in `reports/rt11_meta_audit_odtoe_session_2026-04-26.md`:

| Window | META Agent spawns | META direct file edits | META direct Bash | META direct Reads |
|---|---:|---:|---:|---:|
| 18h window 2026-04-25T19:42 → 2026-04-26T13:30 | 46 | 5 | 18 | 12 |
| 6-minute peak 2026-04-26 11:50–11:56 (post-critique #117) | — | **5** (out of all 5 in window) | — | — |

The 5 direct edits in the peak: `Write hansei-rt3-publication-readiness-2026-04-26.md`, 3× `Edit projects/odtoe-articles/lessons.md`, `Edit CLAUDE.md`. Inv 1 demands ZERO direct edits — observed 5/5 are violations. (Source: rt11_meta_audit_odtoe_session §F4.)

### 2.2 ODTOE F4 status

- **F4 closure status (per L2 synthesis):** "CLOSED (structurally enforced)" via `enforce-delegation.sh` framework deny-list.
- **Open recurrence vector:** ODTOE F4 recurrence under operator pressure ≠ hook-blocked at the *intent* layer; hook is reactive (catches mid-violation). Composition-hazards EN report calls this "symptom-treatment."
- The 18-h window observed 5 violations through the existing hook — meaning hook was either inactive then or operates only on a subset of paths. Builder report `rt12_prune_b4_meta_callsite_guard_2026-04-26.md` confirms hook was strengthened 2026-04-26; pre-strengthening data is the 5/5 baseline.

### 2.3 Quantification — intent_action_ratio formula

`intent_action_ratio = (delegated_actions ÷ total_META_actions)`

Where:
- `delegated_actions` = count of Agent tool spawns in session
- `total_META_actions` = `delegated_actions + direct_Edit_count + direct_Write_count + direct_MultiEdit_count + classified_diagnostic_Bash_count` (per Inv 10)
- Reads excluded (Reads are allowed for META)

Bounds:
- **GREEN ≥ 0.95** (≤ 5% drift; near-perfect dispatcher discipline)
- **YELLOW 0.75–0.95**
- **RED / ANDON < 0.75**

**Current value (18h window from F4 audit):**
- delegated = 46
- direct = 5 + 18 = 23 (edits + diagnostic Bash)
- ratio = 46 / (46 + 23) = **0.667** → **RED / ANDON**.

Honest σ: this metric is hard to compute *retroactively* — it requires per-session tool-call telemetry. The F4 audit was an exceptional deep-read; a recurring scalar needs hook-side instrumentation (e.g., `enforce-delegation.sh` writes a counter to `reports/.intent_action_log`). Without instrumentation, scalar is sample-based, not continuous.

---

## 3. D-leg baseline — Defensibility ≠ leverage

### 3.1 File-touch census (last 14d)

Source: `git log --since=2026-04-12 --name-only --pretty=format: | sort -u`.

| Category | Unique files touched | Examples |
|---|---:|---|
| Framework-self artifacts | **171** | `reports/rt1*..rt12*`, `.claude/hooks/*`, `BOOTSTRAP_LESSONS*`, `CLAUDE.md`, `eradev*.md`, `meta*.md`, role files, templates, glossary, FOUNDATIONS.md |
| Operator-domain artifacts | **6** | `projects/eradev/{config,lessons,lessons_archive,roadmap}.md` (4 — but eradev IS the framework-meta project, ambiguous), `projects/academic-lab/config.md`, `projects/plugy/config.md` |
| Operator-domain DELETIONS only | **4** | `projects/odtoe-articles/{config,lessons,lessons_archive,overlay/...}.md` (contamination removed) |

Strict reading: of the 6 operator-domain files, 4 were deleted (cleanup), 2 were single-line config touches (academic-lab, plugy). **Net new operator-domain artifacts last 14d: ~0.** Last operator-deliverable commit was `97dd5c4 v10 patch: PTv2 reconciliation` 2026-04-24 (paper v2 reconciliation = 7 items, but classified by description as "v10 patch" i.e. framework-self).

### 3.2 Reports directory inflation

`reports/` currently 218 entries; 103 of those touched in last 14d. `rt11_*` audits (6 files) + `rt12_*` reports (8 files) + `rt10_*` reports (5 files) = 19 framework self-audit reports just from last 5 days.

### 3.3 Quantification — leverage_factor formula

`leverage_factor = operator_domain_artifacts ÷ framework_self_artifacts`

Where the count is over the window, on unique-file-touched basis (additions or non-trivial edits; pure typo fixes excluded).

Operator-domain := files under `projects/{academic-lab,plugy,book/*,article/*,odtoe-articles}/` AND any deliverable directory the operator owns (NOT `projects/eradev/` — that's framework-meta).

Bounds:
- **GREEN ≥ 0.50** (operator output ≥ half of framework-self output)
- **YELLOW 0.20–0.50**
- **RED / ANDON < 0.20**

**Current value (last 14d):**
- operator_domain = 2 (the 4 deletions are net-zero; the 2 plugy/academic-lab config touches count)
- framework_self = 171
- ratio = 2 / 171 = **0.0117** → **RED / ANDON**.

Even with generous classification (counting 6 instead of 2): `6 / 171 = 0.035`, still ANDON by 5.7×.

This is the most damning of the three baselines. (Composition-hazards RU report §1.3 line 44 already implied this — "0 operator-domain artifacts in 11 RT over 3 days." Empirical confirmation: the ratio is not zero but is two orders of magnitude below GREEN.)

Honest σ: classification of `projects/eradev/*` files is ambiguous — they are operator-OWNED but framework-CONTENT. I excluded them. Including them as operator-domain pushes ratio to `6/171 = 0.035` (still ANDON). Including all `projects/*` regardless: `12/171 = 0.070` (still ANDON). The metric is robust to reclassification — the gap is genuine.

---

## 4. Pre-cure baseline B-formula impact

Reading the three baselines into B = F · E · (1−σ) · Λ for *current framework-meta sessions*:

| Component | Pre-cure estimate | Source signal |
|---|---:|---|
| F (Focus) | 0.85 | High — agents read role files, RT discipline holds |
| E (Alignment) | 0.65 | Eroded — operator request "operator-artifact session" not honored last 14d (D-leg ratio 0.012) |
| (1−σ) | 0.70 | Honest σ admitted in EN+RU composition-hazards (B = 0.405 / 0.376) |
| Λ_consulted (current) | 0.85 | High — lessons.md memory + L-50/L-52 cited routinely |
| Λ_effective (D-amended) | 0.85 × clip(0.012, [0.2, 1.0]) = 0.85 × 0.20 = **0.17** | If D's Λ amendment proposal lands, current Λ_effective collapses |

**Pre-cure B (uniform-weight, NO D-amendment):** 0.85 × 0.65 × 0.70 × 0.85 = **0.329**. Already ANDON.

**Pre-cure B (with D-amendment Λ_effective):** 0.85 × 0.65 × 0.70 × 0.17 = **0.066**. Catastrophic.

The D-amendment is itself diagnostic: it makes the existing rot visible. The framework currently scores B ≈ 0.33 ANDON only because the D-leg signal is *not yet measured*. Once measured, B drops by ~5×.

---

## 5. Post-cure target B-formula impact (estimate, conditional on full P→M→D wave)

**Targets (operator decision):**
- P sustained over 4-week rolling: del/ins ≥ 0.20, retirement events ≥ 1 per 7-day sub-window → `Ω_pruned ≥ 0.40 GREEN`.
- M sustained over session: `intent_action_ratio ≥ 0.95 GREEN` (≤ 5% direct actions; achievable with strengthened hook + intent-declaration discipline).
- D sustained over 4-session window: `leverage_factor ≥ 0.30` (operator artifact output ≥ 30% of framework-self output) — this is GREEN-floor, not GREEN-target.

| Component | Post-cure estimate | Rationale |
|---|---:|---|
| F | 0.90 | Marginal gain from M's stratification clarity |
| E | 0.85 | D's ratio gate forces operator-output alignment |
| (1−σ) | 0.85 | P closes the contraction gap; bootstrap §9 surface no longer over-loaded |
| Λ_effective | 0.85 × 0.30 = **0.26** | Conservative — assumes leverage_factor only reaches GREEN-floor |

**Post-cure B:** 0.90 × 0.85 × 0.85 × 0.26 = **0.169**. Still ANDON despite cure.

This is a critical finding: even at GREEN-floor leverage (0.30), the multiplicative penalty in Λ_effective drags B below 0.5. **The D-amendment as proposed in EN composition-hazards may be over-aggressive** — it converts a subtle drift signal into a catastrophic multiplier. RT-1 must decide whether to clip Λ_effective floor higher (e.g., [0.5, 1.0]) or use additive rather than multiplicative composition.

If clipped to [0.5, 1.0]: Post-cure B = 0.90 × 0.85 × 0.85 × (0.85 × 0.50) = 0.276. Still ANDON.
If clipped to [0.7, 1.0]: Post-cure B = 0.90 × 0.85 × 0.85 × 0.595 = 0.387. Approaching but not GREEN.

**The cure does not by itself restore GREEN.** It restores honest measurement; making B GREEN requires actually shipping operator artifacts, not just building the gate that scores them. (Visionary EN §3 noted this: "D becomes the post-condition test for the wave, not a third independent gate.")

---

## 6. Composability verdict — are the 3 measurement scalars composable?

**Verdict: PARTIALLY, with two double-count risks and one missing-something risk.**

### 6.1 Double-count risk 1: P × D denominator inflation

`leverage_factor` denominator is `framework_self_artifacts`. `Ω_pruned` aims to *suppress* framework-self artifacts (via retirement). If P fires, framework_self_count goes DOWN → leverage_factor goes UP without operator-domain output increasing. **D-metric inflates as a side-effect of P-success, not as a true leverage signal.**

Mitigation: D's denominator should be *additions* only, not net unique-files-touched. Retirements (P) shouldn't deflate the D denominator. Specifically: `framework_self_artifacts := unique files where last commit-touch was an INSERTION-dominant edit (insertions > deletions)`. This decouples the two metrics.

### 6.2 Double-count risk 2: M × P operator-pressure correlation

F4 violations (M) most often happened during framework-self work bursts (RT cycles, Hansei writes). If P succeeds and *reduces* such bursts, M-violations drop without M-cure firing — `intent_action_ratio` improves *because of P*, not because of M's KILL-TEST extension. Cannot attribute improvement.

Mitigation: M's denominator should include only operator-driven sessions (sessions where `git log --since=session_start | grep -v framework_self` ≠ ∅). Filter M-window to sessions WITH operator-output activity.

### 6.3 Missing-something: 4th leg (measurement self-reference)

Visionary EN §5 flagged this: "the very B-formula being amended in D is the same formula scoring this artifact." All three baselines I just computed score *this very report*'s B at ~0.33 — so my output is by my own measure ANDON. The metrics observe the framework with the framework's instruments. Not falsifying — but a known epistemological hazard.

Mitigation: an external falsifier (operator vetoes / accepts metrics; or a simulated operator session evaluates whether B-trajectory predictions are calibrated). Not part of this baseline; flagged for RT-1.

### 6.4 Composability honest score

- **P alone:** measurable, robust (event-bursty caveat noted).
- **M alone:** measurable but requires hook instrumentation; retroactive only as deep-audit.
- **D alone:** measurable, robust to classification.
- **P + M:** not independent (M-window correlates with P-suppression).
- **P + D:** not independent (P-success deflates D-denominator unless redefined).
- **M + D:** independent if classification rules above are followed.

**Triad composability score: 0.65** — usable with caveats; not a clean orthogonal triad.

---

## 7. Self-B (B-score for this Analyst output)

Uniform 0.25 weights (code modality).

- **F (Focus) = 0.85** — read both composition-hazards reports IN FULL; ran git, grep, wc -l empirically; cited specific commits (8fe68fd, 62359c3, 4e83623, 97dd5c4); cited specific reports (rt11_meta_audit_odtoe §F4 18h numbers, line 6-min window numbers); referenced FOUNDATIONS, eradev §III.2.2 / §III.2.7 indirectly through Visionary RU citations. Did not deep-read meta.md §530-548 retire/prune language nor BL-19 retire signals (minor F gap).
- **E (Alignment) = 0.85** — operator request was "empirical baseline NOW + measurement scalars per leg." Output delivers: 3 baseline tables, 3 measurement formulas with ANDON/GREEN bounds, pre-cure + post-cure B estimates, composability verdict, B-score self-check. Did not stray into cure-shape design (RT-1's job). Did NOT prejudge "all-3 sequenced option a" — delivered metrics that any sequencing variant can use.
- **(1−σ) = 0.65** — σ = 0.35 admitted explicitly: (a) Ω_pruned has burstiness blind-spot; (b) intent_action_ratio is retroactive-only without instrumentation; (c) leverage_factor double-counts with P; (d) measurement-self-reference 4th-leg unaddressed; (e) post-cure B estimate shows even successful cure does not restore GREEN — which questions whether the cure is correctly *targeted* or whether the metric is over-aggressive (composition-hazards EN's Λ_effective amendment is the suspect). All admitted in §6.
- **Λ (Experience) = 0.80** — applied L-50 (extend>add: every formula extends an existing scalar — Ω_pruned extends del/ins, intent_action_ratio extends Inv 1 enforcement-counter, leverage_factor extends Λ component); applied L-52 (Tier-falsification — declared σ openly); applied L-61 (no phantom-newness — every formula references existing vocabulary); cited rt11_meta_audit_odtoe F4 numbers verbatim from existing report; cited Visionary EN+RU lines specifically; consulted lessons_archive.md temporal triple format. Did NOT consult `meta.md §530-548 Hansei retire language` directly (would have strengthened P's burstiness fix). Minor Λ gap.

**B = 0.85 × 0.85 × 0.65 × 0.80 = 0.376**

**B < 0.5 → ANDON.**

ANDON reading: my own σ admits the post-cure trajectory does not restore GREEN under proposed Λ_effective amendment. The composition-hazards triad measurement plan, as scored by my own scalars, is itself ANDON — *which is the point*. Honest empirical measurement of a deteriorating system should not score GREEN before the cure ships.

---

## 8. Three measurement formulas (1-line each)

1. **Ω_pruned** = (deletions ÷ insertions) × archive_count_in_window  — GREEN ≥ 0.30 with ≥ 1 retirement per 7-day sub-window; current 14d = 1.20 (single-batch caveat — *strict version* without batch-event = 0.00 ANDON).
2. **intent_action_ratio** = delegated_actions ÷ (delegated_actions + direct_Edit + direct_Write + direct_MultiEdit + diagnostic_Bash)  — GREEN ≥ 0.95; F4 18h sample = 0.667 RED.
3. **leverage_factor** = operator_domain_artifacts_added ÷ framework_self_artifacts_added (in window)  — GREEN ≥ 0.50 (floor 0.30); current 14d = 0.012 RED (ANDON by 25–40×).

---

## 9. Cross-references

- `reports/composition-hazards-2026-04-26-bt1_EN.md` (Visionary EN; cure shapes for P/M/D; cited §1, §3, §5)
- `reports/composition-hazards-2026-04-26-bt1_RU.md` (Visionary RU; ψ\* formal natures; cited §1.3 D-axis growth-rate, §6 dormant→active)
- `reports/rt11_meta_audit_odtoe_session_2026-04-26.md` §F4 (18h window numbers, 6-min peak numbers)
- `reports/rt11_l2_synthesis_2026-04-26.md` (F4 closure status note — open recurrence vector)
- `reports/rt12_prune_b4_meta_callsite_guard_2026-04-26.md` (M-leg hook strengthening, post-baseline-window)
- `projects/eradev/lessons_archive.md` (8 archived items, all `ended: 2026-04-25`)
- `projects/eradev/lessons.md` (4 in-place demoted items with `ended: 2026-04-2[1-6]`)
- L-50 (extend>add) | L-52 (Tier-falsification) | L-61 (wave-label) | Inv 17 (τ_cycle primacy)
- eradev.md §II.1 (B_text uniform 0.25) | FOUNDATIONS §12 (ψ\*=Φ(ψ\*) — implicit)

---

## 10. Resume (5 lines)

1. P: Ω_pruned formula = (del/ins) × archive_count; current 14d = 1.20 (looks GREEN), strict (no-batch) = 0.00 ANDON; metric event-bursty, needs sub-window guard.
2. M: intent_action_ratio formula; F4 18h baseline = 0.667 RED (5 META direct edits + 18 diagnostic Bash through Inv 1); requires hook instrumentation for continuous measurement.
3. D: leverage_factor formula = operator_domain ÷ framework_self; current 14d = 0.012 RED (≈2 / 171); 25–40× below GREEN — the most damning baseline.
4. Composability: 0.65 — P × D double-counts via denominator deflation; P × M correlates via session-density; M × D independent. 4th leg (measurement self-reference) unaddressed.
5. B = 0.376 ANDON for this report (σ = 0.35 admitted: post-cure projected B = 0.169 even with full wave, raising question whether D's Λ_effective amendment is too aggressive — RT-1 must clip or restructure).

---

**Output path:** `/Users/antonpankratov/Downloads/eradev/reports/rt13_analyst_en_2026-04-26.md`
**B-score:** 0.376 ANDON (σ = 0.35 admitted explicitly).
**Composability:** 0.65 — usable with the three caveats in §6.
**Recommendation to RT-1:** clip Λ_effective floor higher than [0.2, 1.0] (suggested [0.5, 1.0] minimum) to avoid converting a drift signal into a catastrophic multiplier; require denominator decoupling between Ω_pruned and leverage_factor (P-success must not deflate D-denominator).

*End of Analyst (EN) BT-1 baseline report.*
