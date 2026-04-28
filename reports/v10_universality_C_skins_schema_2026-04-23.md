# v10 Universality Refactor — Builder C Report

**Builder:** C (skins + schema + extensibility)
**Date:** 2026-04-23
**Operator request (Invariant 14):** "да делаем все твои пункты здравые - спицифика всегда выносится в project"
**Scope:** universality fix #3 — clean project name-drops from non-article skins + add `domain.languages` field + make `verify.method` extensible per-project.

---

## Builder Result

### Modified artifacts (14 files)

**Skin files generified (10 files — 5 EN + 5 RU, excluding article):**

- `templates/domain_skin.code.md` — removed `projects/plugy/config.md` reference in B-weight override hint (1 edit).
- `templates/domain_skin.code_RU.md` — same fix in RU mirror (1 edit).
- `templates/domain_skin.plan.md` — removed `projects/plugy/config.md` reference in B-weight override hint (1 edit). No other project-specific hits.
- `templates/domain_skin.plan_RU.md` — already clean (0 edits, confirmed by grep).
- `templates/domain_skin.config.md` — 6 edits: header line, 3 vocabulary-table rows (1/2/3), unification note paragraph, "vocab row 16" deploy example, BL-C1 autodeploy rationale, BL-C4 schema-evidence rationale, v10 hook paragraph, footer "Live reference configs" line. All 4 project references (`eradev`, `plugy`, `academic-lab`, `odtoe-articles`) generified to `projects/{PROJECT}/config.md` placeholder.
- `templates/domain_skin.config_RU.md` — 3 edits in RU mirror (header, 3 vocab rows, footer).
- `templates/domain_skin.book.md` — 1 edit: removed "that ODTOE articles have" phrase from R-check structural note.
- `templates/domain_skin.book_RU.md` — already clean (0 edits).
- `templates/domain_skin.research.md` — 3 edits: Example 1 input (ODTOE observer → observer in the theory under study), Example 3 input (ODTOE-related lemmas → lemmas in the target theory), Article-vs-research skin note (removed "the ODTOE case").
- `templates/domain_skin.research_RU.md` — 2 edits in RU mirror (Example 1, Example 3).

**Schema template update:**

- `templates/domain_skin.md.template` — added full "Project Config Schema (relevant fields)" section with `domain.languages` field documentation + `verify.method` extensibility registry documentation + `verify.custom_methods` sub-block schema. Updated Coherent role focus to make language sync conditional on `languages.length > 1`. Updated Verification Protocol block to reference canonical-or-custom method.

**Project configs updated (4 files — add `languages` field):**

- `projects/eradev/config.md` → `languages: [en, ru]` (bilingual EN+RU — full mirror-pair convention)
- `projects/odtoe-articles/config.md` → `languages: [en, ru]` (bilingual — 8-file set requires both)
- `projects/plugy/config.md` → `languages: [en]` (single-language; verified no `_RU.md` files exist)
- `projects/academic-lab/config.md` → `languages: [en]` (single-language; verified no `_RU.md` files exist)

Note: `domain.skin:` line in `projects/odtoe-articles/config.md` was NOT modified (Builder B's scope — confirmed via `git diff --stat` → 1 insertion only, which is the `languages` line).

**Framework extensibility docs:**

- `eradev.md` Section II.2 — added paragraph after line 169 "v9 IN-SCOPE domains" documenting `verify.method` as an EXTENSIBLE REGISTRY with the 6 canonical methods + custom method mechanism + 4 cross-domain examples (`statute_check`, `contraindication_scan`, `ingredient_check`, `accessibility_audit`) + agent behavior ("core framework is agnostic to the method name").
- `eradev_RU.md` — identical RU translation of the same paragraph (same location after line 168).

### Verification (domain-appropriate checks)

1. **`grep -rn "ODTOE\|pankratov\|rybakov\|odtoe-articles\|iznachalye\|plugy\|academic-lab" templates/domain_skin.{code,plan,config,book,research}*.md`** → **0 matches.** All 10 in-scope skin files are clean of project-specific name-drops.

2. **`grep "domain.languages\|languages:" projects/*/config.md templates/domain_skin.md.template`** → present in all 4 project configs (eradev, odtoe-articles: `[en, ru]`; plugy, academic-lab: `[en]`) + 3 locations in `domain_skin.md.template` (schema line 37, dedicated section line 42-48, Coherent role focus line 110).

3. **`grep "custom_methods\|extensible\|registry" eradev.md eradev_RU.md templates/domain_skin.md.template`** → 4 matches in template (lines 25, 51, 56, 117), 1 long-line match in `eradev.md` line 171, 1 long-line match in `eradev_RU.md` line 170. Extensibility is documented in all 3 required locations.

4. **`grep "skin:" projects/odtoe-articles/config.md`** → line 34 `skin: "templates/domain_skin.article.md"` UNCHANGED (Builder B scope respected).

5. **`git diff --stat projects/odtoe-articles/config.md`** → `1 insertion(+)` (only the `languages: [en, ru]` line). No other modifications to that project config — Builder B's territory protected.

### Validation (end-to-end)

- **Schema coherence:** `domain.languages` field uses YAML array syntax consistent with existing list fields (`examples:`, `subdomains:`). Default value `[en]` documented in template schema AND referenced in Coherent role focus. BL-19 sync rule now conditional on `languages.length > 1` — single-language projects have NO-OP sync gates, multi-language projects retain full mirror enforcement.
- **Registry coherence:** `verify.method` extension mechanism mirrors existing `domain.B_modality` v10 extension hook pattern (open registry, project-declared extensions, core framework agnostic to names). The 4 cross-domain examples (legal/medical/culinary/accessibility) are illustrative only — not shipped, not added as enums.
- **Backward compatibility:** projects without `languages:` field default to `[en]` (per template documentation); existing bilingual projects (eradev, odtoe-articles) explicitly declare `[en, ru]` — no regression, explicit > implicit.
- **File readership:** all 10 skin files were read in full (or via representative offset ranges for the 3 files that exceed read-tool limits: config.md, book.md, config_RU.md). Grep used to locate every project-specific hit with context before editing.

### Security & Integrity checklist

- **No secrets in plaintext** — edits are structural/vocabulary; no credentials touched.
- **Backwards compatibility** — `domain.languages` field defaults to `[en]` when absent; no existing project breaks. `verify.method` custom-method mechanism is opt-in; 6 canonical methods unchanged.
- **Defaults are safe** — single-language default matches the most common case (English-only projects). Multi-language is explicit opt-in with mirror-pair commitment.
- **No accidental scope creep** — did not modify role files (Builder A), article skin (Builder B), CLAUDE.md, meta.md, BL files, hooks, or Universality Gate (Builder D). All changes confined to declared IN-SCOPE file set.

### Blast Radius: LOW

Changes are schema documentation + vocabulary generification + per-project opt-in field. No runtime semantic change for existing projects (single-language projects gain explicit `[en]` declaration; bilingual projects gain explicit `[en, ru]` that matches their prior implicit state). `verify.method` extensibility is documented but not activated — no project currently declares a custom method, so registry remains at 6 canonical.

### B-check

- **F (Focus) = 0.90** — read all 10 skin files (full where tool limits allow, offset ranges otherwise); read template schema; read 4 project configs; read eradev.md Section II.2 surroundings; read role file (builder_EN.md) in full.
- **E (Alignment) = 0.95** — output addresses all 3 subtasks in META's direct request: (1) skin generification, (2) `languages` field, (3) extensible `verify.method`. Every operator-named file edited; every verification grep passes.
- **(1-σ) = 0.90** — no conflicts with existing skins (article skin untouched); `languages` field uses same YAML conventions as existing fields; `custom_methods` mechanism mirrors existing `B_modality` extension pattern.
- **Λ (Experience) = 0.90** — applied BL-7 (no premature generalization — did not rewrite skins wholesale, only removed project references), BL-29 (verified terminology with existing schema before adding `languages`), BL-21/BL-17 (read template format BEFORE editing), BL-24 (one logical phase = one edit pass per file).
- **B = 0.90 × 0.95 × 0.90 × 0.90 = 0.69 GREEN**

---

## Known follow-ups (out of my scope)

- Builder D (Universality Gate) may want to add a grep-based sanity check to pre-commit hook: `grep -rn "ODTOE\|plugy\|academic-lab\|iznachalye" templates/domain_skin.*.md` must return 0 matches. This prevents regression.
- Project configs that later add language mirrors (e.g., `projects/plugy/README_RU.md`) must update `languages:` to `[en, ru]` as the mirror is created.
- First project to declare a custom `verify.method` will exercise the registry mechanism end-to-end — a future Hansei may surface refinements to the template schema.

---

*Upstream roles: `roles/builder_EN.md`*
*Operator request log: Invariant 14 quote embedded above*
*Builder report path: this file*
