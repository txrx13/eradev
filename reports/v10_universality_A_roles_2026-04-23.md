# v10 Universality Refactor — Builder A Report

**Role:** [BUILDER] A
**Scope:** Generify Example 2 across all 10 role files in `roles/` to remove ODTOE-specific references.
**Date:** 2026-04-23
**Operator request:** "да делаем все твои пункты здравые - спицифика всегда выносится в project" — universality fix #1.
**Iron Rule enforced:** `projects/eradev/config.md` #7 — Core framework files MUST NOT reference specific external projects by name.

## Activation Operator Log
- **A_F (Focus):** Read all 10 role files in full. Read task spec. Read `BOOTSTRAP_LESSONS.md` to confirm BL-4/BL-7/BL-17 are UNIVERSAL (not ODTOE-specific) — keep them.
- **A_E (Alignment):** Intent = universality refactor, not just filename swap. Replaced domain-specific physics concepts (Λ-dynamics, P_coll, S_A/S_adj notation) with generic pedagogical placeholders while preserving example structure.
- **A_sigma (Consistency):** grep sweep for `ODTOE|pankratov|rybakov|1836` across `roles/` — zero matches post-edit. Also swept for `Λ-dynamics|section_lambda|lambda_curve` — zero matches. EN/RU placeholder pool unified (`article-draft.tex`, `research-paper-v1.tex`, `\Theta`, `section_theorem.tex`, `theorem_figure.svg`, `S_1 vs S_2`).
- **A_Lambda (Experience):** BL-24 one-commit-one-phase respected — scope is roles/ only, skill mirror excluded per task spec. BL-17 Check-First references kept intact (universal). BL-4 reference retained in validator.md (universal).

## Modified Artifacts (10 files)

| File | Example 2 change | Lines before → after |
|------|------------------|----------------------|
| `roles/visionary_EN.md` | `Λ-dynamics` / ODTOE → `new theorem section` + `article-draft.tex` | 86 → 86 |
| `roles/visionary.md` (RU) | `ODTOE_article` → `article-draft.tex` | 92 → 92 |
| `roles/analyst_EN.md` | `Λ-dynamics section`, `section_lambda.tex`, `lambda_curve.svg`, `\Lambda` → `new theorem section`, `section_theorem.tex`, `theorem_figure.svg`, `\Theta`; `article-draft.tex` added | 79 → 79 |
| `roles/analyst.md` (RU) | `ODTOE_article.tex` → `article-draft.tex` | 85 → 85 |
| `roles/builder_EN.md` | `Λ-dynamics` + `ODTOE_article.tex` + `section_lambda.tex` + `\Lambda` → `new theorem section` + `article-draft.tex` + `section_theorem.tex` + `\Theta` | 98 → 98 |
| `roles/builder.md` (RU) | `ODTOE_1836.tex` → `research-paper-v1.tex`; `ODTOE_article.tex` (gold standard) → `article-draft.tex` | 98 → 98 |
| `roles/validator_EN.md` | `Λ-dynamics section` + `section_lambda.tex` + `\Lambda` → `new theorem section` + `section_theorem.tex` + `\Theta` | 89 → 89 |
| `roles/validator.md` (RU) | `ODTOE_1836.tex` → `research-paper-v1.tex`; `P_coll фикс 0.657` → `ключевая константа / зафиксировано значение с 3 знаками точности` | 95 → 95 |
| `roles/coherent_EN.md` | `Λ-dynamics section` + `\Lambda` → `new theorem section` + `\Theta` | 97 → 97 |
| `roles/coherent.md` (RU) | `ODTOE_1836.tex` → `research-paper-v1.tex`; `S_A vs S_adj` → `S_1 vs S_2` | 103 → 103 |

**Total line count delta: 0.** Generification was in-place with no structural collapse — placeholder strings matched character widths closely.

## Generification Scheme Applied

### Artifact placeholders (task-mandated)
- `ODTOE_article.tex` → `article-draft.tex`
- `ODTOE_1836.tex` → `research-paper-v1.tex`

### Physics-concept placeholders (task-mandated)
- `Λ-dynamics` pedagogical framing → `new theorem section` / `theorem section`
- `section_lambda.tex` → `section_theorem.tex`
- `lambda_curve.svg` → `theorem_figure.svg`
- `\Lambda` LaTeX symbol → `\Theta` (picked to avoid collision with standard LaTeX commands)
- `P_coll фикс 0.657` → `ключевая константа / зафиксировано значение с 3 знаками точности`
- `S_A vs S_adj` (ODTOE notation) → `S_1 vs S_2` (generic notation-divergence placeholder)

### Audience placeholder
- `skeptical physicist` → `skeptical expert reader` (preserves the "hostile-reviewer" pedagogical point without tying it to a physics discipline)

## Pedagogical Invariants Preserved
- **3-example structure** (code / article / book) — all 10 files retain exactly 3 examples.
- **A_F/A_E/A_σ/A_Λ log format** — preserved verbatim in every EN Example 2 flow.
- **B-check pattern** — untouched (all files still show F/E/(1-σ)/Λ dials).
- **Role interaction pattern** — each example still demonstrates the same failure mode (terminology collision in article, voice drift in book, flicker bug in code).
- **Blast Radius classification** — MEDIUM retained for article example (it was/is a tracked change to publishable corpus).
- **Generic placeholders survive domain transposition** — a user running a literature review, a legal brief, a code config, or a math proof can still read the article example without mental translation.

## Verification Results

### Iron Rule #7 compliance
```
grep -l "ODTOE\|pankratov\|rybakov\|1836\|Λ-dynamics\|section_lambda\|lambda_curve" roles/*.md
```
**Result: 0 matches.** All role archetype files are now project-agnostic.

### Replacement presence
```
grep -n "article-draft.tex\|research-paper-v1.tex" roles/*.md
```
**Result: 9 matches across 9 files** (coherent_EN.md intentionally uses "new theorem section" without filename — the original EN also had no filename, preserving pre-existing structure).

### Bilingual parity
- EN/RU pairs use the same placeholder pool: `article-draft.tex`, `research-paper-v1.tex`, `\Theta`, `section_theorem.tex`.
- Pre-existing EN/RU structural asymmetries preserved (not all EN examples named the parent `.tex`; original RU always did — this was pre-v10 and is out of scope for this pass).

### Example 1 (code) and Example 3 (book) scan
Checked for project-specific references. Found:
- Example 1 uses generic archetypes: `settings.tsx`, `theme-context.ts`, `parseConfig`, `auth/`, `config/` → ALL GENERIC, no edits needed.
- Example 3 uses generic archetypes: `chapter_01_opening.md`, `voice_guide.md`, `scene_list.md`, "книга-квест" → ALL GENERIC, no edits needed.

## Scope Discipline (BL-11 Minimum Viable Scope)
- **In scope:** 10 role files in `roles/`.
- **Out of scope (NOT touched):** skill mirror copies at `~/.claude/plugins/...`, `eradev.md`, `meta.md`, `CLAUDE.md`, `BOOTSTRAP_LESSONS.md`, hooks, project configs, templates, skins.
- **Scope creep rejected:** EN/RU pre-existing structural differences (some EN examples name the parent paper, some don't; all RU examples always did) — not repaired here. These predate v10 and are a separate pass.

## Security / Integrity Checklist
```
Running service:                  N/A (documentation file edits only)
Published text:                   [x] No leaked private info / personal data (pankratov/rybakov removed)
                                  [x] All BL citations resolve (BL-4, BL-7, BL-17, BL-24 verified in BOOTSTRAP_LESSONS.md)
                                  [x] No libel, no misattribution
                                  [x] No accidental spoilers — example structure preserved
Configuration:                    [x] Backwards compat: role files remain drop-in compatible (same section order, same prompts that META spawns)
```

## Blast Radius: LOW
- Role archetype docs. Downstream consumers = META + all 5 role agents loading these at activation.
- No behavioral change — examples pedagogically equivalent, just project-agnostic.
- Backwards compatible: agents self-loading these files will get the same role specification; only example surface text changed.

## B-check
F = 0.95 — Read all 10 files in full + BL file + task spec. One pedagogical choice (Λ → Θ) could have been Φ / Ω / Ξ; acceptable.
E = 0.95 — Solved the Iron Rule #7 violation at the root (all project-specific refs in roles/); preserved pedagogical value.
(1-σ) = 0.95 — Zero project-specific references remain; EN/RU use a shared placeholder pool; no terminology collision with standard LaTeX or math notation.
Λ = 0.90 — Respected BL-11 (no scope creep), BL-24 (one phase one commit — roles/ only), BL-17 (verified BL references resolve before completing).

**B = 0.95 × 0.95 × 0.95 × 0.90 = 0.77**

B above 0.5 threshold, min component 0.90 above 0.3 threshold → no ANDON.

## Output Summary
- 10 role files generified. 0 project-specific references remain. Pedagogical structure intact. Bilingual parity maintained.
- Skill mirror NOT synced (out of scope — flagged for later task per spec).
- META can now ship this change independently; subsequent tasks will handle skill mirror sync.
