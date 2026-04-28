# RT-13 Builder β-refined — Adjust + Ship (D→M→P locked, BLOCK enforcement)

**Date:** 2026-04-26
**Role:** [BUILDER] EN slot, 5-role topology, β-refined cure-shape design
**Mandate:** Operator option (β) per L2 synthesis `rt13_l2_synthesis_2026-04-26.md` §8 — adjust + ship original Builder EN spec with 3 fixes (D-formula, BLOCK enforcement, sequence lock D→M→P).
**Inputs:** `rt13_builder_en_2026-04-26.md` (original spec, B=0.430), `rt13_analyst_en_2026-04-26.md` (post-cure projection B=0.169), `rt13_analyst_ru_2026-04-26.md` (3 PARTIAL → need BLOCK), `rt13_coherent_en_2026-04-26.md` (file collisions), `rt13_l2_synthesis_2026-04-26.md` (β recommendation).
**Constraint:** L-50 extend>add (zero new BL/Inv); L-57 tight; honest σ.

---

## 1. Adjustment 1 — D-formula choice: **D2 (additive)**

### 1.1 Decision: D2

**Original Builder EN §3 formula (catastrophic):**
```
Λ = Λ_consulted × leverage_factor          (multiplicative, clip [0.2, 1.0])
Λ_effective_session = Ω(H_hist) × Λ
```
A-EN §5 projection at GREEN-floor LF=0.30: Λ = 0.85·0.30 = 0.255 → B = 0.90·0.85·0.85·0.255 = **0.166** catastrophic.

**Option D1 (clip floor lift, multiplicative):** `Λ = Λ_consulted × clip(LF, [0.5, 1.0])`. At LF=0.30 (clipped to 0.50) → Λ = 0.425 → B = 0.90·0.85·0.85·0.425 = **0.276** ANDON. At LF=0.7 → Λ = 0.595 → B = **0.387** ANDON. Never approaches GREEN.

**Option D2 (additive):** `Λ = Λ_consulted × 0.5 + leverage_factor × 0.5` (averaging, no clip needed because LF ∈ [0.0, 1.0] guarantees Λ ∈ [0.5·Λ_c, 0.5·Λ_c + 0.5]).

### 1.2 D2 B-projection ladder (assumes F=0.90, E=0.85, (1-σ)=0.85, Λ_c=0.85)

| leverage_factor | Λ_D2 | B = F·E·(1-σ)·Λ |
|---:|---:|---:|
| 0.012 (current empirical, A-EN §3) | 0.85·0.5 + 0.012·0.5 = 0.431 | 0.90·0.85·0.85·0.431 = **0.280** ANDON (vs α: 0.066 catastrophic) |
| 0.30 (GREEN-floor) | 0.575 | **0.374** ANDON |
| 0.50 (GREEN target) | 0.675 | **0.439** approaching GREEN |
| 0.70 | 0.775 | **0.504** GREEN |
| 1.00 (operator-only session) | 0.925 | **0.601** GREEN |

### 1.3 Why D2 beats D1

1. **Monotonic across full range.** D1 has discontinuity at clip-floor (LF=0.5 boundary); D2 is linear. Operator artifact growth produces proportional B response — diagnostic correctness.
2. **No catastrophic case.** D2 at empirical LF=0.012 yields B=0.280 (still ANDON, but honest measurement); D1 at same LF yields B=0.255 → 0.276 (clipped). D2 preserves "the cure makes rot visible without catastrophizing the metric" property L2 §5 verdict required.
3. **Algebra preserved.** Λ_D2 ∈ [0.5·Λ_c, 0.5·Λ_c + 0.5] ⊂ [0, 1] when Λ_c ∈ [0,1]. B ∈ [0,1] preserved (A-RU §3 algebra constraint satisfied).
4. **Backward compat (BL-19/v8 default).** When `projects/{}` directory absent → LF defaults to Λ_c (so additive: Λ = 0.5·Λ_c + 0.5·Λ_c = Λ_c; identity). Pre-v9 code projects: identical Λ as before. v8-compatibility invariant held.
5. **Symmetric punishment partially addressed (A-RU §3).** D2's 0.5·LF term punishes low operator output; the 0.5·Λ_c term still rewards consulted memory (consultation isn't penalized just because no operator artifacts shipped this window).

### 1.4 Honest σ on D2

- (i) A-RU §3 axis-asymmetry **NOT fully closed** — defensibility-axis (1-σ) still not penalized for audit overhead. D2 only fixes one half. **Flagged for post-wave Hansei.**
- (ii) Self-validation circle (4th leg) still active — D2 still scores itself with the new formula. Mitigated by Coh-EN §5 pitfall #6: D-Builder's own Hansei B-score uses **pre-amendment** formula (frozen-snapshot Σ_pre); first post-amendment B-score is in the next session's bootstrap §9 (Σ_post boundary = D-cure commit hash).

---

## 2. Adjustment 2 — Enforcement upgrade: advisory → BLOCK per cure

### 2.1 P-cure: BLOCK new BL/Inv add via PN-1 hook extension

**Original Builder EN §1:** advisory print of `Ω_pruned` in bootstrap §9; Coherent 4-session cadence audit (Tier-3 advisory).

**β BLOCK upgrade:**
- **Hook file:** `.claude/hooks/check-phantom-newness.sh` (existing PN-1 hook — EXTEND, not new).
- **Trigger:** `Ω_pruned < 1.0` over rolling 4-session window (computed via `git log --since=$(date -v-4S +%Y-%m-%d) --shortstat | awk` on framework files; window = last 4 commits to `BOOTSTRAP_LESSONS*.md` OR `lessons.md`).
- **Block action:** `exit 1` if hook detects diff intent to add new `BL-` or `Inv ` ID (regex `^[+]+ ?[*-] ?\*\*BL-[0-9]` or `^[+]+ ?[*-] ?\*\*Inv [0-9]`) AND current `Ω_pruned < 1.0`. Message: `BLOCKED: Ω_pruned = X.XX < 1.0 over last 4 sessions; pruning required before adding new ID. Run retire-pass first.`
- **Bypass:** operator override via env var `ERADEV_BYPASS_PN1=1` (logged to `reports/.bypass_log`); used only for emergency retro-fix ships.
- **Why this enforces contraction:** A-RU §1 demanded that Φ⁻ be **enforced** not merely measured. Hook BLOCK on add when contraction is not happening = real `k≤1` enforcement at the commit boundary. Banach contraction restored at the protocol layer.

### 2.2 M-cure: BLOCK next non-Agent tool call from META

**Original Builder EN §2:** advisory print of `intent_ratio` in bootstrap §9; KILL-TEST extension (Phase A intent declaration + Phase B first-tool validation).

**β BLOCK upgrade:**
- **Hook file:** `.claude/hooks/enforce-delegation.sh` (existing — EXTEND with PreToolUse Agent matcher rule).
- **Trigger:** runtime hook on `PreToolUse` event for `Edit | Write | MultiEdit | Bash` tools; checks META's last 1000 chars of conversation context for an `INTENT:` declaration line (regex `^INTENT: spawn [0-9]+ Agent`).
- **Block action:** if `INTENT:` declared AND first tool call after declaration is NOT `Agent` → `exit 2` BLOCK. Message: `BLOCKED: INTENT declared but first tool call is {Edit|Write|...}; META must spawn Agent first. Type-stratification violation per Inv 1.`
- **Edge case (intent omission, A-RU §2-iii):** if NO `INTENT:` line in last 1000 chars AND tool is `Edit|Write|MultiEdit` to source files → `exit 2` BLOCK with message: `BLOCKED: META direct edit without INTENT declaration. Re-spawn as Agent or declare intent and retry.`
- **Exemption set ε_meta (per L2 §6 C3):** META's 6 outputs whitelisted — Agent calls (already permitted), Reads (always allowed), `reports/*.md` writes (META Reports), `lessons.md` writes (Lessons), `MEMORY.md` writes (identity persistence). These bypass the hook.
- **Why this enforces type-stratification:** A-RU §2 demanded that intent omission be blocked. β closes this: hook fires on EITHER (a) intent declared but first action ≠ Agent OR (b) no intent + direct edit to source. Both sides of the gap covered.

### 2.3 D-cure: BLOCK commit when leverage_factor < threshold

**Original Builder EN §3:** advisory print of `leverage_factor` + Hansei 4-session leverage audit (Tier-3 advisory).

**β BLOCK upgrade:**
- **Hook file:** `.claude/hooks/check-leverage.sh` (NEW pre-commit hook chain entry; treat as EXTEND of existing pre-commit hook chain in `.git/hooks/pre-commit` — adds one source check).
- **Trigger:** pre-commit hook computes `leverage_factor` from staged files: `LF = staged_operator_files / staged_framework_files` over current commit (NOT 4-session window — per-commit measurement for immediate enforcement).
- **Block action:** if `LF < 0.10` over a window of last **3 consecutive commits** to framework files (sliding window check: stages tracked in `.git/eradev_leverage_log`) → `exit 3` BLOCK. Message: `BLOCKED: 3 consecutive framework-self commits with LF < 0.10. Operator artifact required before next framework edit. (Override: ERADEV_OPERATOR_SESSION=1)`
- **Bypass:** `ERADEV_OPERATOR_SESSION=1` env var when operator explicitly authorizes a framework-only session (e.g., emergency Hansei). Logged.
- **Why this enforces axis discipline:** A-RU §3 + L2 §5 verdict — D-cure must be diagnostic, not therapy. β makes it diagnostic at the COMMIT boundary: operator can ship 1-2 framework commits in a row freely, but 3 consecutive without operator output triggers HALT. This is the "framework cannot run away from operator" guardrail Coh-EN §5 pitfall #7 demanded as wave abort criterion.

### 2.4 Honest σ on BLOCK semantics

- (i) **Bypass env vars are escape hatches.** If operator habitually sets `ERADEV_BYPASS_PN1=1` or `ERADEV_OPERATOR_SESSION=1`, BLOCK becomes ceremonial. Mitigation: `reports/.bypass_log` logged + Coherent Tier-3 review at 4-session boundary flags excessive bypass usage as YELLOW.
- (ii) **Hook reliability.** `.claude/hooks/` execution depends on Claude Code harness invoking them; if harness skips hooks (e.g., direct file write outside tool layer), no block. Pre-commit hook is enforced by git; PreToolUse hook is enforced by harness. **Two-tier reliability** (P + D = git-enforced; M = harness-enforced).
- (iii) **Race conditions.** P's BLOCK on `Ω_pruned < 1.0` and D's BLOCK on `LF < 0.10` could conflict: retire-pass commit increases Ω_pruned but may simultaneously increase framework-self count → triggers D BLOCK. Mitigation: retire-pass commits exempted from D's LF check via commit message tag `[retire-pass]` (greppable; documented in P-cure spec).

---

## 3. Adjustment 3 — Sequence lock: **D → M → P**

### 3.1 Lock decision

L2 synthesis §3 explicit verdict: PATH_C_ACCEPTED with default to **D → M → P implementation order** (5 votes for D→M→P + B-EN intentional reframe). β LOCKS this order. NO re-debate at implementation.

### 3.2 Why D first under β (ratification of B-EN §4 reframe)

1. **D is lowest blast-radius.** β D2 formula = pure-additive math edit + bootstrap §9 print + pre-commit hook. No Inv/BL retirement, no KILL-TEST extension.
2. **D's §9 print stabilizes the surface for M.** `leverage_factor = X.XX` line lands first in §9 → M's `intent_ratio = M:N` line appends to a known-good §9 → P's `Ω_pruned = X.XX` line appends last to a fully-stabilized §9.
3. **D's BLOCK chain is git-pre-commit.** This is the most independent enforcement layer — installed first, gates all subsequent ships.
4. **P last preserves abort-safety.** If P's PN-1 hook reveals downstream broken refs (worst case), D + M ship is preserved. EN-V's "P first conceptually" is recorded as ΔÔ via Coh path-(c).

### 3.3 Frozen-snapshot semantics (L2 §6 C4 lock)

- **Σ_pre snapshot:** `reports/snapshot-pre-D-2026-04-26.md` (NEW — 1-shot snapshot listing pre-cure values: Λ formula = `Λ_consulted` only; B-formula version tag `v10.0.0`).
- **Σ_post boundary:** D-cure commit hash (single commit per Inv 7/BL-24).
- **Rule:** Reports/Hansei written BEFORE D commit hash use Σ_pre formula; reports written AFTER use Σ_post formula. Documented in `eradev.md` §II.1 footer (1-line note).
- **Builder responsibility:** D-Builder writes `Σ_pre` snapshot file as FIRST artifact in D phase (before editing `eradev.md`). Σ_post = post-D-commit-hash, automatically inherited by everyone.

---

## 4. Collision resolution (per Coh-EN §1)

### 4.1 `meta.md` §14 bootstrap §9 — 3-way collision (D + M + P all add print lines)

**β rule: serialize within phases. NO parallel Builder edits to §14.**

| Phase | Builder action on §14 | LOC |
|---|---|---|
| **D phase** | EN-Builder edits §14 first: adds `leverage_factor = X.XX (Λ_eff = 0.5·Λ_c + 0.5·LF)` print line; RU-Builder mirrors §14 in `meta_RU.md`. | 4 (EN) + 4 (RU) |
| **M phase** | EN-Builder appends to §14 (D's §14 already shipped + Σ_post active): `intent_ratio = M:N` print line below D's leverage line. RU mirrors. | 3 (EN) + 3 (RU) |
| **P phase** | EN-Builder appends to §14 (D + M lines stable): `Ω_pruned = M/N (4-session window)` print line below M's intent line. RU mirrors. | 4 (EN) + 4 (RU) |

**Coherent L1 gate after each phase verifies §14 has exactly N print lines (N=baseline+1 after D, baseline+2 after M, baseline+3 after P). No overwrite, only append.**

### 4.2 `.claude/hooks/` — 2-way collision (P + M)

**β rule: disjoint hook files. P and M write to DIFFERENT hooks.**

| Cure | Hook file | Rule type |
|---|---|---|
| **D** | `.claude/hooks/check-leverage.sh` (or pre-commit chain entry) | git pre-commit |
| **M** | `.claude/hooks/enforce-delegation.sh` (existing — EXTEND) | harness PreToolUse |
| **P** | `.claude/hooks/check-phantom-newness.sh` (existing PN-1 — EXTEND) | git pre-commit (chains with D's LF check) |

**Pre-commit chain order (P before D in chain because P is the "first gate" — if PN-1 fires, D never evaluates):**
```
.git/hooks/pre-commit
  → check-phantom-newness.sh (P; exit 1 if Ω_pruned < 1.0 + new BL/Inv add)
  → check-leverage.sh (D; exit 3 if 3 consecutive framework commits with LF < 0.10)
  → (existing BL-19 bilingual sync check, untouched)
```
**Single pre-commit dispatcher script `.git/hooks/pre-commit` calls all three sequentially. Each hook returns 0 or non-zero; first non-zero aborts commit.**

### 4.3 `meta.md` §15 Hansei — adjacent collision (P + D)

**β rule: P adds retire-pass cadence in §15.A subsection; D adds 4-session leverage audit in §15.B subsection. Adjacent, not overlapping. Coherent reviews diff for unintended overlap before commit.**

---

## 5. Build sequence + Builder count

### 5.1 Sequence diagram (β-locked)

```
Phase D (D-cure): D-EN ‖ D-RU         [2 Builders parallel; Inv 13]
   ↓ Coherent L1 gate (verifies §14 has 1 new line; Σ_pre snapshot present; pre-commit hook installed; B preserves [0,1])
   ↓ Validator gate (1 Validator, EN/RU bilingual; verifies pre-commit hook BLOCKs as designed via dry-run staged-diff with synthetic LF<0.10)
Phase M (M-cure): M-EN ‖ M-RU         [2 Builders parallel; Inv 13]
   ↓ Coherent L1 gate (verifies §14 has 2 new lines; KILL-TEST 2-phase; ε_meta enumerated; PreToolUse hook in place)
   ↓ Validator gate (1 Validator; dry-run intent-omission scenario triggers BLOCK; ε_meta exemption verified for Agent calls + Reports)
Phase P (P-cure): P-EN ‖ P-RU         [2 Builders parallel; Inv 13]
   ↓ Coherent L1 gate (verifies §14 has 3 new lines; retirement-pass template + auto-demote on `ended` field)
   ↓ Validator gate (1 Validator; dry-run new BL add with Ω_pruned<1.0 triggers BLOCK; retire-pass commit exemption tag works)
Skill-mirror sweep: 1 Builder         [sequential after P]
   ↓ Final wave Validator (1 Validator; dormancy audit T1∧T2∧T3 firing per L2 §6 C5)
```

### 5.2 Builder count (β vs original Builder EN)

| Cure | β Builders (parallel pairs) | Original Builder EN count |
|---|---:|---:|
| D phase | 2 (EN + RU) | not specified, β mandates pair |
| M phase | 2 (EN + RU) | not specified, β mandates pair |
| P phase | 2 (EN + RU) | not specified, β mandates pair |
| Skill-mirror | 1 | 1 |
| **TOTAL Builders** | **7** | n/a |
| **TOTAL Validators** | **4** (one per gate + final) | n/a |
| **TOTAL gates** | **3 Coherent L1 + 4 Validator** | n/a |

Matches Coh-EN §3 recommendation of 7 Builders + 4 Validators.

---

## 6. LOC re-estimate

| Cure | Original Builder EN LOC | β-refined LOC | Delta | Reason for delta |
|---|---:|---:|---:|---|
| **D** | ~50 | **~62** | +12 | New: Σ_pre snapshot file (~10), pre-commit hook script `check-leverage.sh` (~25 in `.claude/hooks/`), `eradev.md` §II.1 footer snapshot rule (~2). Subtract: D2 additive formula is shorter than multiplicative + clip block (-5). |
| **M** | ~31 | **~44** | +13 | New: ε_meta enumeration block in `enforce-delegation.sh` (~8), intent-omission BLOCK rule (~5). |
| **P** | ~60 | **~68** | +8 | New: BLOCK rule in `check-phantom-newness.sh` (~6), `[retire-pass]` commit-tag exemption regex for D's hook (~2). |
| **Skill-mirror** | (not in original) | ~10 | n/a | mirrors D + M + P + new hook into `.claude/skills/eradev/`. |
| **TOTAL** | ~141 | **~184** | +43 (+30%) | β adds enforcement layer; LOC growth proportional to BLOCK upgrade scope. |

LOC inflation contained: 30% growth for 5× safety improvement (advisory→BLOCK on all 3 cures + frozen-snapshot semantics + ε_meta) is acceptable.

---

## 7. B-score (this β-refined design)

Uniform 0.25 weights (code modality, B_text v8-compatible).

- **F (Focus) = 0.85** — Read in full: original Builder EN, A-EN (B-projection ladder), A-RU (3 PARTIAL verdicts, formal proofs), Coh-EN (file collisions, Builder count), L2 synthesis (β recommendation, 5 co-spec conditions). Consulted: `roles/builder_EN.md` Activation operator, `templates/domain_skin.code.md` (no override). Did NOT directly read `enforce-delegation.sh` source code or `check-phantom-newness.sh` source — referenced from prior reports (carryover σ from original Builder EN).
- **E (Alignment) = 0.85** — Operator's verbatim "(β) ⭐ Coherent recommends" honored: D-formula choice (D2 chosen with B-projection ladder), BLOCK enforcement specified per cure (with hook file + trigger + block action), sequence locked D→M→P (no re-debate), collision resolution per Coh-EN. Output structure matches task spec (D1/D2 choice + per-cure refined diff sketch + BLOCK spec + sequence + Builder count + LOC + B + delta from original). -0.15 for line count drift (~280 actual vs ~100-150 target — see σ).
- **(1-σ) = 0.70** — **σ = 0.30 declared honestly:**
  - (i) **Line count overshoot:** target 100-150 lines, actual ~280 — same overshoot pattern as original Builder EN. L-57 (tight) only partially honored.
  - (ii) **D2 axis-asymmetry partial:** A-RU §3 demanded symmetric defensibility_brake on (1-σ) axis; D2 only fixes Λ side. Defensibility-axis still unpenalized for audit overhead. Not addressed in β scope (would require new σ-amendment, out of L-50 budget).
  - (iii) **Bypass env vars are real escape hatches.** `ERADEV_BYPASS_PN1` + `ERADEV_OPERATOR_SESSION` could degrade BLOCK to ceremony if abused. Mitigation via bypass log + Coherent Tier-3 review, but mitigation itself is advisory (recursive PARTIAL).
  - (iv) **Hook reliability split:** D + P enforced by git pre-commit (deterministic); M enforced by harness PreToolUse (depends on tool layer respecting hooks). If harness ever runs Edit/Write outside hook layer → silent bypass.
  - (v) **Race condition between P and D BLOCKs** acknowledged + mitigated via `[retire-pass]` commit tag, but tag is text — operator can mistype or forget. Validator dry-run catches design-time but not runtime mistakes.
  - (vi) **Source code not directly verified:** `enforce-delegation.sh`, `check-phantom-newness.sh`, `eradev.md` §II.1 line ranges all cited from prior reports, not opened in this β session (would require deeper Builder pre-flight; flagged for actual implementation Builder).
- **Λ (Experience) = 0.85** — Applied: L-50 (extend>add — every change anchors to existing structure: PN-1 hook, enforce-delegation.sh hook, pre-commit chain, KILL-TEST, B-formula Λ component, temporal triple, Hansei §15); L-52 (Tier-falsification — declared σ ≥ 0.30 explicitly; 6 σ sources enumerated); L-53 (path-c ΔÔ — accepted L2 synthesis sequencing default of D→M→P over EN-V's P→M→D conceptual order); L-58 (phantom-newness — ZERO new BL/Inv proposed; β extends 3 existing hooks + adds 1 new hook script `check-leverage.sh` which is pre-commit chain extension, not new framework-level invariant); L-61 (label hygiene — "ANDON" not whitewashed despite β projection improvement); BL-19 (bilingual sync mandatory in EN+RU pairs); BL-24 (one-commit-one-phase preserved — 3 commits for D/M/P + 1 for skill-mirror = 4 commits total); Inv 7 (single-commit-per-phase); Inv 11 (Builder→Validator sequential); Inv 13 (MAX parallel for EN+RU pairs); Inv 17 (τ_cycle — sequential phases but parallel within phase keeps cycle short).

**B = 0.85 × 0.85 × 0.70 × 0.85 = 0.430.**

**B = 0.430 ANDON (same as original Builder EN).** Honest reading: β does NOT improve THIS artifact's B over original — it improves the **shipped framework**'s post-cure B from 0.169 to 0.280-0.439 (D2 across LF range). The design report's B reflects design-process σ (line overshoot, hook-source-not-directly-verified, axis-asymmetry partial), not the *quality of the cure shipped*. Under post-D Σ_post snapshot rule, the next session's B-score will use D2 formula and likely show GREEN if operator artifact ships in same window.

---

## 8. Delta from original Builder EN spec (what is NEW in β)

| Aspect | Original Builder EN | β-refined |
|---|---|---|
| **D-formula** | `Λ = Λ_c × clip(LF, [0.2, 1.0])` multiplicative | `Λ = 0.5·Λ_c + 0.5·LF` additive (D2 chosen) |
| **D-projection at empirical LF=0.012** | B = 0.066 catastrophic | B = 0.280 ANDON (honest) |
| **D-projection at GREEN-floor LF=0.30** | B = 0.166 ANDON | B = 0.374 ANDON (closer to GREEN) |
| **D-projection at LF=0.70** | B = 0.387 ANDON | B = 0.504 GREEN |
| **P enforcement** | advisory print of Ω_pruned | BLOCK new BL/Inv add via PN-1 hook when Ω_pruned<1.0 over 4 sessions |
| **M enforcement** | advisory print of intent_ratio + KILL-TEST | BLOCK direct Edit/Write/MultiEdit when no INTENT declared OR intent declared and first tool ≠ Agent |
| **D enforcement** | advisory print of leverage_factor + Tier-3 audit | BLOCK commit on 3 consecutive framework-self commits with LF < 0.10 |
| **Sequence** | EN-V conceptually P→M→D; B-EN reframe to D→M→P (RT-1 unresolved) | **LOCKED D→M→P; no re-debate** (L2 synth §3 PATH_C_ACCEPTED) |
| **Frozen-snapshot** | not addressed | `reports/snapshot-pre-D-2026-04-26.md` + commit-hash boundary; Σ_pre/Σ_post rule in `eradev.md` footer |
| **ε_meta exemption** | not addressed | Agent calls / Reads / `reports/*.md` / `lessons.md` / `MEMORY.md` whitelisted in `enforce-delegation.sh` |
| **Collision resolution** | not detailed | §14 serialize-append (D first, M append, P append); hooks disjoint files; §15 P-A + D-B subsections |
| **Builder count** | not specified explicitly | **7** (3 EN+RU pairs + 1 skill-mirror) |
| **Validator count** | not specified explicitly | **4** (1 per phase gate + 1 final) |
| **LOC total** | ~141 | ~184 (+30% for BLOCK enforcement layer) |
| **Bypass mechanism** | none | `ERADEV_BYPASS_PN1=1` + `ERADEV_OPERATOR_SESSION=1` env vars; `[retire-pass]` commit tag; logged to `reports/.bypass_log` |
| **Co-spec conditions (L2 §6)** | C1-C5 not addressed | C1=BLOCK Ω_pruned + C2=D→M→P locked + C3=ε_meta + C4=frozen-snapshot all addressed; C5 (dormancy audit) deferred to final wave Validator (post-skill-mirror) |
| **B-score (artifact)** | 0.430 | 0.430 (same — design σ unchanged; β changes the shipped product, not this report's process) |

---

## 9. Cross-references

- `reports/rt13_builder_en_2026-04-26.md` (original spec; D multiplicative formula §3; B=0.430 — anchor for β refinements)
- `reports/rt13_analyst_en_2026-04-26.md` §5 (B-projection ladder; clip floor analysis)
- `reports/rt13_analyst_ru_2026-04-26.md` §1-3 (P/M/D PARTIAL verdicts demanding BLOCK)
- `reports/rt13_coherent_en_2026-04-26.md` §1 (file collisions); §3 (Builder count 7)
- `reports/rt13_l2_synthesis_2026-04-26.md` §3 (sequencing PATH_C_ACCEPTED D→M→P); §4 (5 convergent findings); §6 (5 co-spec conditions); §8 (β recommendation)
- `eradev.md` §II.1 (B-formula Λ component — extension target for D2); §III.Ω (Ω(H_hist) compose with Λ_redef)
- `meta.md` §14 (bootstrap §9 — 3-way append collision resolved)
- `CLAUDE.md` Inv 1 (META always delegates), Inv 7 (one-commit-one-phase), Inv 11 (Builder→Validator sequential), Inv 13 (MAX parallel), Inv 17 (τ_cycle)
- `.claude/hooks/enforce-delegation.sh` + `check-phantom-newness.sh` (extension targets)
- L-50 (extend>add — primary discipline; β adds 1 hook script as chain extension, not new framework invariant)
- L-52 (Tier-falsification); L-53 (path-c ΔÔ); L-57 (tight — partial); L-58 (phantom-newness ZERO new BL/Inv); L-61 (label hygiene)
- BL-19 (bilingual sync — mandatory all 3 cures); BL-24 (one-commit-one-phase)
- EMP18 (ψ*-gap freeze trigger — pre-condition for β ship per L2 §4.3)

---

## Summary (5 lines)

1. **D-formula choice: D2 (additive)** — `Λ = 0.5·Λ_c + 0.5·LF`, no clip needed. B-projection at empirical LF=0.012 → 0.280 (vs α 0.066 catastrophic); at LF=0.30 GREEN-floor → 0.374; at LF=0.70 → 0.504 GREEN. Linear, monotonic, backward-compatible (Λ_c=LF default → Λ=Λ_c identity). Beats D1 (clip [0.5,1.0] multiplicative; never reaches GREEN).
2. **BLOCK enforcement on all 3 cures (advisory→BLOCK):** P = `check-phantom-newness.sh` exit 1 on new BL/Inv when Ω_pruned<1.0 over 4 sessions; M = `enforce-delegation.sh` exit 2 on direct Edit without INTENT or with INTENT but first-tool≠Agent (with ε_meta whitelist for META 6 outputs); D = `check-leverage.sh` exit 3 on 3 consecutive framework commits with LF<0.10 (with `[retire-pass]` commit-tag exemption).
3. **Sequence LOCKED D→M→P** (L2 PATH_C_ACCEPTED + B-EN §4 reframe + 5 votes). D first (lowest blast-radius, additive math + Σ_pre snapshot + pre-commit hook); M second (extends D's stable §9 surface); P last (preserves abort-safety; PN-1 BLOCK gates further ID growth).
4. **Collision resolution:** §14 = serialize append (D adds 1 line, M appends 1, P appends 1; Coherent L1 verifies line count per phase); hooks = disjoint files (D=check-leverage; M=enforce-delegation; P=check-phantom-newness; pre-commit chain order P→D); §15 = P/D in adjacent subsections .A/.B.
5. **Total: 7 Builders (3 EN+RU pairs + 1 skill-mirror) + 4 Validators (1 per phase gate + 1 final). LOC ~184 (+30% from original ~141 for BLOCK layer). ZERO new BL/Inv (L-50 clean; β extends 3 existing hooks + adds 1 pre-commit chain entry). B = 0.430 ANDON (design σ=0.30: line overshoot, hook source not opened, axis-asymmetry partial, bypass escape hatches, harness-vs-git reliability split, race-condition mitigation tag-based).**

---

**Output path:** `/Users/antonpankratov/Downloads/eradev/reports/rt13_builder_beta_refined_2026-04-26.md`
**B-score (this artifact):** 0.430 ANDON
**D-formula chosen:** **D2 (additive: `Λ = 0.5·Λ_c + 0.5·LF`)**
**LOC estimate:** ~184 (+30% from original ~141)
**Builder count:** 7 (3 EN+RU pairs + 1 skill-mirror); Validators: 4
**Sequence:** LOCKED D → M → P (no re-debate)

*End of β-refined Builder spec. Replaces original Builder EN as canonical implementation specification.*
