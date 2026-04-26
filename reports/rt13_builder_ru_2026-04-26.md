# RT-13 BT-1 — Builder RU slot — bilingual sync plan (option a, sequenced P→M→D)

**Date:** 2026-04-26
**Role:** [BUILDER] (5-role topology, RU slot — bilingual mirror plan)
**Domain:** code (skin: `templates/domain_skin.code.md`); B-modality = text (uniform 0.25).
**Mandate:** RU-side sync plan for the all-3 sequenced wave proposed in `composition-hazards-2026-04-26-bt1_{EN,RU}.md`. **DESIGN only — no code.**
**Sources:** EN hazards (cure shapes P/M/D, lines 14-20) + RU hazards (formal nature D→M→P, line 84-103). Note: EN sequences P→M→D; RU sequences D→M→P. RU Builder treats EN sequence as the operator's selected order (option a) and plans bilingual mirrors against it.

---

## 1. Bilingual sync — three legs

### P-cure RU side (retirement protocol + Ω_pruned scalar)

EN cure (per EN hazards §1, line 14): introduce (i) `retirement-pass-<date>.md` Hansei subtype with `net_lines_delta ≤ 0` over rolling 4-session window; (ii) auxiliary scalar `Ω_pruned = items_archived ÷ items_added` printed in bootstrap §9; (iii) lessons.md template entry "Retired this pass: [list]". Extend, do not add.

**EN files touched:** `meta.md` §14 (bootstrap §9 print), `meta.md` §16 (Hansei trigger taxonomy), `eradev.md` §III.Ω if Ω_pruned co-located with Ω(H_hist), `BOOTSTRAP_LESSONS.md` (BL-34 amendment, EN-only — see §3 below). The retirement-pass template likely lands in `templates/` (new file or extension to existing Hansei template).

**RU mirrors required (BL-19 hard pairs):**
- `meta.md` ↔ `meta_RU.md` — §14 bootstrap §9 print line + §16 Hansei trigger taxonomy + §13 Lambda enforcement (retirement criterion). RU §14 is currently structurally synced with EN (verified: lines 262-410 contain RT-12 prune block); the Ω_pruned print line slots into the existing always-print §9 entry without restructuring.
- `eradev.md` ↔ `eradev_RU.md` — §III.Ω cross-domain memory multiplier IF Ω_pruned definition co-locates there (recommend it does — same notation family). Both files at 1172 lines (verified bilingual parity); insertion symmetric.
- `templates/domain_skin.code.md` ↔ `templates/domain_skin.code_RU.md` — checklists section if retirement-pass added to post-generation checklist. Likely no edit if retirement is META-level not Builder-level.

**Skill mirror updates:**
- `.claude/skills/eradev/core/eradev.md` ↔ `.claude/skills/eradev/core/eradev_RU.md` — same §III.Ω diff propagated. Skill mirror is canonical-tracked — must update same commit.
- `.claude/skills/eradev/meta/meta.md` ↔ `.claude/skills/eradev/meta/meta_RU.md` — same §14/§16/§13 diff.
- `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` — EN-only mirror (no RU twin in skill mirror), update once with BL-34 amendment.

**RU LOC estimate (P):** ~25-35 lines RU side (mirror of ~30 EN lines: bootstrap §9 print + Hansei subtype block + III.Ω scalar definition + 1 BL-19 sync line). Symmetric with EN.

**BL-19 compliance:** EN diff and RU diff MUST land in the same commit per the `.githooks/bl19-bilingual-sync.sh` rule (BL-19 in `BOOTSTRAP_LESSONS.md` line 162). All three pairs above (`eradev`, `meta`, `domain_skin.code`) are inside the hook's coverage list — hook will block commit if either side missing. Override path (`BL19_OVERRIDE=1`) MUST NOT be used.

### M-cure RU side (KILL-TEST extension + intent-vs-action ratio)

EN cure (per EN hazards §1, line 17): (i) two-phase output discipline — META first emits intent declaration ("I will spawn N agents for X") before any tool call; deny-list hook validates first tool call after intent is Agent spawn; (ii) bootstrap §9 print `Intent-vs-action ratio: M:N`. Extend KILL-TEST + Inv 1, no new invariant.

**EN files touched:** `CLAUDE.md` (KILL-TEST section, lines ~85-95 in current file), `meta.md` §14 (bootstrap §9 print extended with intent-ratio line), `.claude/hooks/B4-enforce-delegation.sh` (intent-declaration validator extension).

**RU mirrors required:**
- `meta.md` ↔ `meta_RU.md` — §14 bootstrap §9 print intent-ratio line. RU §14 already mirrors EN structurally; insertion is symmetric.
- `CLAUDE.md` — **EN-only at top level** (no `CLAUDE_RU.md` exists; verified). KILL-TEST is rendered in English only. **No RU twin update needed for CLAUDE.md proper** — but if KILL-TEST text appears anywhere in `meta_RU.md` quoting, that quoted block must sync (verified: meta_RU.md §14 line ~298-303 contains KILL-TEST translation; this RU snippet MUST extend to match the new two-phase intent-declaration phrasing).

**Skill mirror updates:**
- `.claude/skills/eradev/meta/meta.md` ↔ `.claude/skills/eradev/meta/meta_RU.md` — same §14 intent-ratio diff.
- `.claude/skills/eradev/SKILL.md` — likely EN-only (verified: single file in skill root). Check if it embeds KILL-TEST quote; if so, sync with new phrasing.

**RU LOC estimate (M):** ~12-18 lines RU side. Smaller than P because `CLAUDE.md` is EN-only and KILL-TEST RU snippet inside `meta_RU.md` §14 is the only true mirror touchpoint.

**BL-19 compliance:** Critical gap — `CLAUDE.md` is OUTSIDE `.githooks/bl19-bilingual-sync.sh` coverage (verified: hook covers `eradev.md`, `meta.md`, `LOADING_PROTOCOL.md`, `roles/*`, `templates/domain_skin.*`; CLAUDE.md and BOOTSTRAP_LESSONS.md are excluded). M-cure CLAUDE.md edits will commit without RU mirror — this is **architecturally accepted** (CLAUDE.md is the bootstrap entry, English-only by design). The KILL-TEST RU snippet inside `meta_RU.md` is the BL-19-covered surface that must stay synced.

### D-cure RU side (B-formula amendment + leverage_factor)

EN cure (per EN hazards §1, line 20): redefine Λ as `Λ = Λ_consulted × leverage_factor`, where `leverage_factor = operator_domain_artifacts_in_window ÷ framework_self_artifacts_in_window` clipped to [0.2, 1.0]; mandatory bootstrap §9 leverage-ratio print; scheduled "leverage audit" at every 4-session boundary; if ratio < 0.3 over 4 sessions → ANDON the framework.

**EN files touched:** `eradev.md` §II.1 (B-formula component definition — Λ amendment), `meta.md` §14 (bootstrap §9 print) + §16 (Lambda Audit trigger — extend the existing 4-session cadence to include leverage-ratio gate), `BOOTSTRAP_LESSONS.md` (BL-19 or new BL? — per L-50 should be amendment to existing).

**RU mirrors required:**
- `eradev.md` ↔ `eradev_RU.md` — §II.1 B-formula. Verified RU twin is at lines 113-152. The `leverage_factor` definition formula MUST appear identically in both languages (math notation universal — `leverage_factor = operator_domain_artifacts_in_window ÷ framework_self_artifacts_in_window`, clip [0.2, 1.0]). Russian narrative around the formula needs ~8-12 lines RU prose explaining why Λ now multiplies by leverage_factor (re-anchor toward operator-domain output). The B_text uniform-0.25 backwards-compat invariant (RU eradev_RU.md line 127, "B_text(v9) ≡ B(v8)") MUST extend to a similar v10 invariant: "Λ_old ≡ Λ_consulted × 1.0 при leverage_factor=1.0" — backward compat for projects without operator-domain telemetry.
- `meta.md` ↔ `meta_RU.md` — §14 bootstrap leverage-ratio print line + §16 4-session leverage-audit trigger.
- `templates/domain_skin.code.md` ↔ `templates/domain_skin.code_RU.md` — §B-weight Adjustment table footnote (no weight change for code, but Λ component definition narrative extends — verify RU twin mirrors).

**Skill mirror updates:**
- `.claude/skills/eradev/core/eradev.md` ↔ `.claude/skills/eradev/core/eradev_RU.md` — same §II.1 leverage_factor diff. Critical: skill mirror tracked separately, must NOT drift from canonical.
- `.claude/skills/eradev/meta/meta.md` ↔ `.claude/skills/eradev/meta/meta_RU.md` — §14/§16 leverage-audit diff.
- `.claude/skills/eradev/templates/domain_skin.code.md` ↔ `.claude/skills/eradev/templates/domain_skin.code_RU.md` — §B-weight footnote diff.

**RU LOC estimate (D):** ~30-40 lines RU side (mirror of ~35-40 EN lines: §II.1 Λ redefinition + leverage_factor formula box + bootstrap §9 print + §16 leverage-audit trigger + backwards-compat invariant statement + 1 BL amendment line).

**BL-19 compliance:** All RU pairs (`eradev`, `meta`, `domain_skin.code`) inside the hook coverage. Same-commit mandate. The math formula `leverage_factor = ... ÷ ..., clip [0.2, 1.0]` MUST be byte-identical across EN and RU files — operator's explicit instruction, confirmed by L-57 (tight prose) — narrative around the formula varies, formula does not.

---

## 2. File-pair table

| Leg | EN canonical | RU mirror | Skill EN mirror | Skill RU mirror | Hook coverage |
|---|---|---|---|---|---|
| P | `meta.md` §14/§16 | `meta_RU.md` §14/§16 | `.claude/skills/eradev/meta/meta.md` | `.claude/skills/eradev/meta/meta_RU.md` | YES (BL-19) |
| P | `eradev.md` §III.Ω | `eradev_RU.md` §III.Ω | `.claude/skills/eradev/core/eradev.md` | `.claude/skills/eradev/core/eradev_RU.md` | YES (BL-19) |
| P | `BOOTSTRAP_LESSONS.md` BL-34 | (none — EN-only) | `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` | (none) | NO |
| M | `meta.md` §14 (intent-ratio print) | `meta_RU.md` §14 | `.claude/skills/eradev/meta/meta.md` | `.claude/skills/eradev/meta/meta_RU.md` | YES |
| M | `CLAUDE.md` KILL-TEST | (RU snippet inside `meta_RU.md` §14) | (no skill mirror for CLAUDE.md verified) | n/a | NO (CLAUDE.md outside hook) |
| M | `.claude/hooks/B4-enforce-delegation.sh` | n/a (executable, English-only) | n/a | n/a | NO |
| D | `eradev.md` §II.1 (Λ redefinition) | `eradev_RU.md` §II.1 (lines 113-152) | `.claude/skills/eradev/core/eradev.md` | `.claude/skills/eradev/core/eradev_RU.md` | YES |
| D | `meta.md` §14/§16 (leverage print + audit) | `meta_RU.md` §14/§16 | `.claude/skills/eradev/meta/meta.md` | `.claude/skills/eradev/meta/meta_RU.md` | YES |
| D | `templates/domain_skin.code.md` (B-weight footnote) | `templates/domain_skin.code_RU.md` | `.claude/skills/eradev/templates/domain_skin.code.md` | `.claude/skills/eradev/templates/domain_skin.code_RU.md` | YES |

**Hook gap:** `CLAUDE.md` and `BOOTSTRAP_LESSONS.md` are outside BL-19 hook. M-cure CLAUDE.md edits will not block commit on missing RU mirror — by-design (CLAUDE.md is bootstrap entry, English-only). For BOOTSTRAP_LESSONS.md, every BL change is EN-only at top level + skill mirror EN-only. No RU duplication needed for these two files.

---

## 3. BL-19 compliance check per leg

| Leg | Files touched (canonical+skill) | Pairs requiring sync (EN+RU same commit) | Hook will block missing RU? |
|---|---|---|---|
| P | meta + eradev + BL34 + skill | 2 pairs (meta, eradev) × 2 mirrors = 4 file edits | YES for meta/eradev pairs; NO for BOOTSTRAP_LESSONS (out of coverage) |
| M | meta + CLAUDE + hook + skill | 1 pair (meta) × 2 mirrors = 2 file edits | YES for meta pair; NO for CLAUDE.md (out of coverage by design) |
| D | meta + eradev + skin + skill | 3 pairs (meta, eradev, domain_skin.code) × 2 mirrors = 6 file edits | YES for all three pairs |

**Risk of partial sync (BL-19 false-pass):** D-cure has the largest sync surface (3 pairs × 2 mirrors = 6 files). If skill-mirror gets edited but canonical does not (or vice-versa), the BL-19 hook still passes because hook checks the canonical pair, not skill-mirror co-update. **Recommend: include skill-mirror sync as a Validator post-condition (RT-2 gate), not relying on BL-19 hook alone.** This is a known gap (skill-mirror sync drift was an L-43 lesson — verify in lessons.md).

---

## 4. Total LOC budget — RU side

| Leg | RU LOC (canonical + skill mirror combined) |
|---|---|
| P | ~25-35 (meta_RU §14/§16 + eradev_RU §III.Ω + skill copies) |
| M | ~12-18 (meta_RU §14 intent-ratio snippet + KILL-TEST translation update + skill copy) |
| D | ~30-40 (eradev_RU §II.1 leverage_factor + meta_RU §14/§16 + domain_skin.code_RU + skill copies) |
| **Total RU** | **~67-93 lines** |

EN-side estimate (back-of-envelope from EN hazards cure shapes, no EN Builder report yet): **~70-95 EN canonical lines** (similar order). Skill-mirror EN copies adds another ~50-70. **EN total ≈ 120-165**. **RU/EN ratio for canonical only: ~0.85-1.05 (target ~1.0 satisfied)**.

If EN Builder reports significantly higher EN LOC (>140 canonical), RU should match — bilingual parity is the contract per BL-19, not a "translate the gist" license.

---

## 5. Risk: slow-RU pattern

Empirical evidence in the codebase:
- `meta.md` 553 lines vs `meta_RU.md` 512 lines — **41-line gap**. Spot-check (verified): RU §14 has the RT-12 prune content, so the gap is elsewhere (likely §15 META I/O Protocol or §16 Meta-Reflection Triggers). Slow-RU pattern is real but localized, not catastrophic.
- `eradev.md` 1172 vs `eradev_RU.md` 1172 — **byte-parity-adjacent**. Strong sync discipline.

**Predicted slow-RU risk per leg:**
- **P leg:** LOW — touches §14 (synced) and §III.Ω (synced area, eradev parity). Hansei subtype trigger in §16 is the riskiest spot (§16 in meta has the 41-line gap territory).
- **M leg:** LOW — §14 is in-sync; CLAUDE.md is EN-only by-design (not a sync risk, an architectural fact).
- **D leg:** MEDIUM — §II.1 in eradev is byte-synced (good); domain_skin.code RU exists and is sized similarly (verified `templates/` listing); §16 leverage-audit trigger is in the 41-line gap zone (the same area where slow-RU is empirically observed).

**Mitigation:** Builder RU MUST verify line-count delta of `meta.md` vs `meta_RU.md` BEFORE editing §16. If gap is in §16, opening the leverage-audit edit there will compound the slow-RU pattern. Pre-edit `diff -u meta.md meta_RU.md | head -200` is mandatory, not optional.

**Latent risk: skill-mirror drift.** Skill mirror has its own copies; BL-19 hook does NOT check skill mirror against canonical (verified by reading hook coverage list). Skill-mirror could silently diverge. **Recommendation:** Validator post-condition for the wave commit: `diff eradev.md .claude/skills/eradev/core/eradev.md` exit 0; same for meta.md, meta_RU.md, eradev_RU.md, domain_skin.code{,_RU}.md. If diff non-empty, RT-2 gate fails.

---

## 6. Critical bilingual sync points (operator's attention)

1. **D-cure formula identity.** `leverage_factor = operator_domain_artifacts_in_window ÷ framework_self_artifacts_in_window, clip [0.2, 1.0]` MUST appear byte-identically in `eradev.md` §II.1 AND `eradev_RU.md` §II.1 AND both skill mirrors. Math notation is universal; do not "translate" the formula. Narrative around it is RU prose; formula box is invariant.
2. **CLAUDE.md is EN-only by-design.** M-cure KILL-TEST edits to CLAUDE.md do NOT have a CLAUDE_RU.md mirror to update — but the KILL-TEST RU translation embedded in `meta_RU.md` §14 (lines ~298-303 verified) MUST be updated to match the new two-phase intent-declaration phrasing. This is the BL-19-covered RU surface for M-cure.
3. **BOOTSTRAP_LESSONS.md is EN-only.** P/D may amend BL-34 or add a BL-19-extension; no RU duplication required. Skill mirror EN copy must update same commit.
4. **§16 slow-RU zone.** P-cure Hansei subtype trigger and D-cure leverage-audit cadence both land in `meta.md` §16 — empirical gap zone. Pre-edit diff verification mandatory.
5. **Skill-mirror drift gap.** BL-19 hook does not police skill mirror; Validator must run canonical-vs-skill diff as RT-2 post-condition.

---

## 7. B-score

Uniform 0.25 weights (code modality, B_text v8-compatible default).

- **F = 0.85** — Both EN and RU hazards reports read in full; eradev.md/eradev_RU.md/meta.md/meta_RU.md/CLAUDE.md/BOOTSTRAP_LESSONS.md/BL-19 hook coverage all inspected; skill mirror layout listed; RU §14 content verified; line-count deltas measured. Gap: did not read `.claude/hooks/B4-enforce-delegation.sh` content (M-cure dependency, but design-only — no concrete change needed in this report).
- **E = 0.85** — Output answers exactly the brief: 3 bilingual sync specs, file-pair table, BL-19 compliance check per leg, total LOC budget, slow-RU risk, B score. ~155 lines (slightly over the 70-90 target but operator asked "5 строк summary + critical points" which adds; main report core is ~120 lines, summary at end). Minor E penalty for length.
- **(1-σ) = 0.70** — **σ = 0.30 declared**: (i) EN/RU hazards disagree on sequence (EN: P→M→D; RU: D→M→P). I plan against EN (option a was operator's choice, EN-side sequence). If operator switches to RU sequence, the LOC distribution shifts (D-cure goes first, larger initial RU surface). (ii) Did not verify that `.claude/skills/eradev/SKILL.md` is genuinely EN-only — listed once, not inspected. If it has KILL-TEST quote or B-formula reference, M and D scope expand by ~5-8 RU LOC. (iii) The "RU/EN ratio ~0.85-1.05" estimate assumes EN Builder produces canonical-only EN diff in similar size; EN Builder may include longer narrative (English tends shorter for math-heavy sections) shifting ratio higher.
- **Λ = 0.80** — Applied: BL-19 (bilingual sync hook), L-50 (extend>add, every cure shape extends existing), L-52 (Tier-falsification — declared σ honestly), L-57 (tight prose — formula identity invariant), L-43 if it exists (skill-mirror sync drift gap flagged). Did not consult full lessons.md depth — would strengthen Λ but stays within design-only scope.

**B = 0.85 × 0.85 × 0.70 × 0.80 = 0.405**

**B < 0.5 → ANDON.**

ANDON reading: low B is honest σ (EN/RU sequence disagreement is real; SKILL.md not fully verified; RU/EN ratio is estimate not measurement). Pretending these are resolved would inflate B. The report is shippable as design-only — RT-1 / operator decision resolves σ before Builder spawn for actual implementation.

---

## 5-line summary

1. **All 3 cures map to BL-19-covered RU mirror pairs** (eradev↔eradev_RU, meta↔meta_RU, domain_skin.code↔domain_skin.code_RU) plus skill-mirror copies; BOOTSTRAP_LESSONS and CLAUDE.md are EN-only by-design, no RU twin needed.
2. **Total RU LOC ≈ 67-93** (P: 25-35; M: 12-18; D: 30-40); EN canonical estimate ≈ 70-95; **RU/EN ratio ≈ 0.85-1.05 (target ~1.0 met)**.
3. **D-cure formula `leverage_factor = ... clip [0.2, 1.0]` MUST be byte-identical** across both languages and skill mirror — math notation universal, narrative localized.
4. **Slow-RU risk: MEDIUM in §16** (empirically the 41-line meta EN/RU gap zone — both P Hansei subtype trigger and D leverage-audit cadence land there). Pre-edit `diff meta.md meta_RU.md` mandatory.
5. **Skill-mirror drift is OUT OF BL-19 hook coverage** — Validator RT-2 post-condition must include `diff canonical vs skill-mirror` exit-0 check, otherwise sync false-passes.

**B = 0.405 ANDON (σ=0.30 declared). Total RU LOC budget: 67-93. Critical sync points: D formula byte-identity, §16 slow-RU zone, skill-mirror drift gate.**

---

*End of RT-13 BT-1 Builder RU report. Cures NOT proposed for implementation here — RT-1 will spec; RT-2 will execute with Validator gate.*
