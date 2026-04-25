# Q1 [BUILDER] — Composition matrix + parallel-role patterns — 2026-04-25

> Role: [BUILDER] (EN stack, `roles/builder_EN.md`)
> Scope: close gaps G1+G2+L2 in `eradev.md` §X via additive subsections + RU mirror
> META direct request (Invariant 14): "сделай все и максимально параллельно" — Q1 Builder

## Activation Operator
- **A_F**: read `roles/builder_EN.md`, audit `reports/v10_team_composition_rules_audit_2026-04-24.md`, `reports/rt1_visionary_2026-04-24.md`, `reports/rt1_coherent_2026-04-24.md`, `eradev.md` §X (lines 931-953), `eradev_RU.md` §X mirror.
- **A_E**: intent = ship Tier-A G1+G2+L2 fix as additive `### X.1` and `### X.2` subsections without disturbing existing tables.
- **A_σ**: cross-checked new rule "L2 mandatory when N_Builders >= 2" against existing "L2: Activated at 2+ teams" — additive strengthening per Visionary Tier-A3 (audit Gap M2 latent rule promoted to explicit). No contradiction.
- **A_Λ**: BL-29 (terminology drift) — adopted Coherencer's canonical term `composition_matrix`; avoided Visionary/Analyst/Builder synonyms ("registry", "table"). BL-19 (RU mirror parity) applied.

## Modified artifacts
1. `eradev.md` §X — added `### X.1 Per-role agent counts (composition contract)` (between scaling formula and Coherencer Hierarchy) + `### X.2 Parallel per-role spawn patterns` (between File Ownership Protocol and `---` separator). +23 lines, 0 deletions.
2. `eradev_RU.md` §X — bilingual mirror at same anchors. +23 lines, 0 deletions. Translated prose; preserved table cell structure verbatim (numbers, formulas, role sequence).

## Verification (all GREEN)
- `wc -l`: eradev.md = eradev_RU.md = 1135 (delta=0, well within ±5 budget).
- `grep -c "Per-role agent counts|композиция агентов"` → 1 each (≥1 each).
- `grep -c "Parallel per-role spawn|Параллельные паттерны"` → 1 each (≥1 each).
- `grep "L2 mandatory.*N_Builders|L2 обязател"` → 2 each (X.1 caveat + X.2 Coherencer bullet).
- `grep "FORBIDDEN|ЗАПРЕЩЁН"` → 2 each in eradev*.md (Visionary-parallel rule). RU uses ё form (ЗАПРЕЩЁН) per orthography.
- `git diff --numstat`: 23/0 each — pure additive, AC-1 (0 deletions) satisfied globally, not just §I-III.
- Visual inspection: §X.1 sits at lines 942-953, §X.2 at lines 967-975, no orphan separators or broken table syntax.

## Validation (end-to-end)
- §VI.1 cross-reference resolved (line 824 confirms FLUX RT-1 row exists; my "see §VI.1" anchors there).
- Invariant 13 cross-reference: anchored to `CLAUDE.md:82` semantically; "floor, not ceiling" caption preserves Invariant-13 escape per Visionary Risk R1 mitigation.
- Invariant 11 cross-reference: explicit in X.2 Validator bullet ("Builder COMPLETES first").
- Domain skin compatibility: caption explicitly says "Domain skins MAY override per project-specific needs" — preserves article/config/plan/research 2-Builder triggers per audit §2.2.

## Coherencer phantom-decoherence guard (BL-29)
Adopted Coherencer's canonical term `composition_matrix` in commentary. Within the file body, used "Per-role agent counts (composition contract)" as heading + "matrix" terminology nowhere else, avoiding "table/registry" drift flagged in `rt1_coherent_2026-04-24.md` §3.2.

## Out of scope (per spec)
NOT TOUCHED: meta.md (Q2 territory — recommendations.md log), CLAUDE.md (Q3 territory — Invariant 17/KILL-TEST), BL files, role files, templates, `.claude/skills/eradev/core/eradev*.md` mirror (Integration phase post-RT-3).

## Security & integrity checklist
- [x] No secrets, no real credentials.
- [x] Backwards compatible — additive only; existing operator workflows unchanged.
- [x] No version-disclosure or attributable PII.
- [x] Defaults safe — caveat "floor, not ceiling" + RIGOR_LEVEL override prevents brittle over-specification (Visionary Risk R1 mitigated).

## Blast Radius
LOW — additive markdown subsections, zero deletions, RU mirror preserved at parity, no behavior change for existing pipelines.

## B-check (B_text modality)
- F = 0.92 — read all 4 source artifacts + both files end-to-end at §X anchor. 0.08 deduction: did not re-read all 6 domain skins (relied on audit's citations).
- E = 0.95 — addresses literal spec (3 changes) verbatim; passes all 5 grep verifications.
- (1-σ) = 0.94 — no contradictions; "L2 mandatory at N_Builders >= 2" is additive strengthening of existing "L2 at 2+ teams" rule per Visionary Tier-A3 authorization.
- Λ = 0.90 — applied BL-29 (terminology canonicalization), BL-19 (RU parity), Invariants 11+13 (cross-reference anchors). 0.10 deduction: did not stage skill-mirror update (correctly out of scope, Integration territory).

**B = 0.92 · 0.95 · 0.94 · 0.90 ≈ 0.74 — GREEN.** No component <0.3. No ANDON.
