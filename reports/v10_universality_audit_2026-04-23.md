# v10 Universality Audit — 2026-04-23

**Role:** [ANALYST]
**Scope:** framework core files outside `projects/` and `reports/` (read-only audit)
**Task:** empirically verify (or refute) Iron Rule #7 + EMP8 claim of universality
**Operator question:** "Насколько framework универсален и не привязан к конкретным версиям книг, статей, их формату?"
**Modality:** text-discrete (framework-level audit — uniform B weights 0.25)

---

## 1. Activation Operator log

| Gate | Action | Result |
|------|--------|--------|
| A_F (Focus) | Read analyst_EN.md (activation); full inventory of non-project, non-report `.md` files; read each of 6 skins (head), 5 role files (example block + output), CLAUDE.md, meta.md header, BL-19 entry, cross_harness_requirements, AGENTS.md.template, CLAUDE.md.template, CLAUDE.md.universal, glossary.md header, eradev.md Section II.2, eradev/config.md, odtoe-articles/config.md | Pass — scope = 20 core files + 6 skins + 10 role files |
| A_E (Alignment) | Operator asks for empirical verification, not opinion. Iron Rule #7 is the claim being tested. This report checks it against evidence | Pass — empirical audit, not advocacy |
| A_sigma (Consistency) | Read-only. No conflicts with writing in `reports/`; no lock collisions | Pass |
| A_Lambda (Experience) | v9 Phase 2.1.S hansei + roadmap_v9 explicitly stated "ODTOE math is universal — only the wording in role files is code-coupled". That claim needs re-testing because role files AND article skins were written AFTER that statement, and coupling can have crept back | Pass — history flagged same risk; re-verify |

**B-check (Activation):** F=0.85 E=0.95 (1-σ)=0.90 Λ=0.80 → B = 0.581. PASS.

---

## 2. Per-dimension findings

| # | Dimension | Verdict | Evidence | Violation count |
|---|-----------|---------|----------|-----------------|
| 1 | Hardcoded project names in framework files | **PARTIAL (LOCKED for article skin)** | `roles/builder_EN.md:72`, `roles/visionary.md:87`, `roles/validator.md:90`, `roles/coherent.md:98`, `roles/analyst.md:80`, `roles/builder.md:93-94` — all Example 2 scientific-article rows reference `ODTOE_article.tex`, `ODTOE_1836.tex`, `references.bib`. `templates/domain_skin.article.md` — 65+ `odtoe-articles/config.md` citations + `ODTOE_article.tex` + `ODTOE_measuring_B_parameter.tex` + `ODTOE_phi_fractality.tex` as gold-standard + Rybakov evidence-marker name. `templates/domain_skin.article_RU.md` — same pattern in Russian. `templates/domain_skin.research.md:294,314,428` — ODTOE observer/ODTOE-related lemmas in examples. `templates/domain_skin.research_RU.md:192,206` — same. `templates/domain_skin.config.md:12,29,36-38,60,465,483,529,537` — hardcoded references to all 4 live projects as examples. `templates/CLAUDE.md.template:45`, `templates/CLAUDE.md.universal:24`, `templates/AGENTS.md.template:74` — all three bootstrap templates list ODTOE in the core-framework description. `BOOTSTRAP_LESSONS_universal.md`, `BOOTSTRAP_LESSONS.md`, `glossary.md` header — ODTOE is treated as conceptual underlay, not project | ≥ 30 name-coupled lines in 18 framework files |
| 2 | Hardcoded absolute paths | **UNIVERSAL** (in-scope files) | Zero `/Users/antonpankratov` absolute paths in framework core (eradev.md, meta.md, CLAUDE.md, BOOTSTRAP_LESSONS*, roles/, templates/*.md, LOADING_PROTOCOL.md). All absolute paths live in `reports/` (historical audit trails, out-of-scope) | 0 in-scope violations |
| 3 | Format lock-in per domain skin | **PARTIAL — see §4 matrix below** | article skin hard-assumes LaTeX + tectonic + BibTeX. book skin mentions pandoc/tectonic/vivliostyle as examples (more neutral). config skin mentions YAML/TOML/JSON/INI/.env broadly (well-generalized). plan skin is markdown-native but says "or .txt, or .pdf". research skin LaTeX/notebook (mixed). code skin enumerates ".go, .py, .ts, .rs, .md, .yaml" (well-generalized) | 1 fully locked (article), 5 generalized |
| 4 | Language assumptions / BL-19 | **PARTIAL** | BL-19 labelled [UNIVERSAL] in both BL files. Default meaning in its rule text: "when a file HAS a bilingual counterpart, keep both in sync" — conditional on pair existence. `projects/eradev/config.md:51-56` Iron Rule 3 treats bilingual sync as *mandatory for the framework*. `projects/odtoe-articles/config.md:70-80` makes it mandatory for articles (BL-19 + BL-22 gate, 8-file set). book skin makes it `domain.bilingual: true` opt-in (correct generalization). A project with no RU content can set `domain.bilingual: false` and BL-19 becomes a no-op. **The RULE is conditional; the EXAMPLES treat it as mandatory.** A French-only user reading the article skin would assume RU/EN is required | 1 framing gap (examples vs rule) |
| 5 | Tool assumptions | **UNIVERSAL on shell / PARTIAL on harness** | `cross_harness_requirements.md` declares L3 vs L5+ matrix: Claude Code = L9, Cursor/Windsurf/Codex/Gemini = L3. Framework runs *only* at L9 today; other harnesses downgraded. R4 shell spec names "git, ls, cp, mkdir, wc, zip" — portable. Hooks (R6) are Claude-Code-specific (`settings.json` pre/post tool hooks). CronCreate (R7) is Claude-Code-specific. CLAUDE.md and 3 templates contain "Claude Code" in the title header. Git is everywhere (acceptable). GitHub is mentioned only in projects/eradev/config.md (not framework-level) | 1 harness-locked reality (Claude Code is the only full-stack option) |
| 6 | Version references (v9/v10) | **UNIVERSAL (mostly historical)** | eradev.md: 47 hits — most in CHANGELOG-style rows or "v9 OOD scope" rule markers (historical + rule anchors). CLAUDE.md: 5 hits — "v10" in title + version stamp. meta.md: 7 hits. BOOTSTRAP_LESSONS.md: 6 hits (merge dates). This is **version bumping discipline**, not version coupling. Users cloning main get current version. Version number is cosmetic unless they try to cherry-pick — not an obstacle | 0 blocking |
| 7 | Examples in role files + skins | **LOCKED (Example 2 in all 5 role files uses ODTOE concrete artifact)** | `roles/visionary_EN.md:53` — "ODTOE paper", `Λ-dynamics` section. `roles/builder_EN.md:72` — `ODTOE_article.tex`, `section_lambda.tex`, `tectonic ODTOE_article.tex`. `roles/analyst.md:80` — `ODTOE_article.tex`. `roles/validator.md:90` — `ODTOE_1836.tex`. `roles/coherent.md:98` — `ODTOE_1836.tex`. `roles/visionary.md:87` — `ODTOE_article`. This breaks Iron Rule #7 verbatim: "Core framework files (outside projects/) MUST NOT reference specific external projects by name." The Examples do use project names | 6 role files × 1 example = 6 locked example blocks |
| 8 | Verification method enum | **PARTIAL (6 enum values, not extensible)** | CLAUDE.md line 35: `build (code), cite_check (article), readability (book), parse (config), dry_run (plan), recompute (research)`. Enum is closed — no `statute_check` for legal, no `contraindication_scan` for medical, no `ingredient_check` for recipes. A user with a new domain must either (a) reuse a loose-fit existing method, or (b) modify CLAUDE.md + eradev.md + meta.md. Not project-level extensible. Research skin's 10.1 section acknowledges the sibling-skin pattern but not domain-extensibility at verify-method level | 1 fixed-enum limitation |
| 9 | ODTOE substrate dependency | **PARTIAL** | `glossary.md:3` declares itself "all ODTOE and EraDev terminology" — ODTOE is intrinsic to the conceptual layer. B formula `F·E·(1-σ)·Λ` uses Greek letters from ODTOE (`eradev.md:26`). `meta.md:26` Section 1 title is "ODTOE Coherence Formulas". S, P_coll, Omega are all ODTOE-originated. `BOOTSTRAP_LESSONS_universal.md:10-11` — "Principles are framework-invariant (ODTOE math, TPS, delegation...)". **A user who has never heard of ODTOE** can still use the framework because (a) the formulas are just named multiplicative products of four factors 0-1, (b) roles don't require ODTOE knowledge to execute. But they will encounter the name 20+ times. This is *conceptual branding*, not functional coupling. Roadmap_v9 line 42 explicitly claims: "ODTOE math is universal — B = F·E·(1-σ)·Λ requires only modal typing, not replacement." Empirically TRUE at math level; PARTIALLY FALSE at vocabulary level | Conceptual branding — not a blocker, but not clean |
| 10 | odtoe-articles config as live reference | **EVIDENCE OF DEEPER COUPLING** | `projects/odtoe-articles/config.md` IS the canonical article project. `templates/domain_skin.article.md` cites it by line number 25+ times. The skin was *empirically derived from* this one project (v9 Phase 2.1.S Hansei). This means the article skin is **not domain-generic** — it's an abstraction of one specific project. Any future article project must conform to ODTOE's 8-file set, 50-digit precision, Rybakov evidence markers, Russian/English bilingual mandate, `ODTOE_` filename prefix convention, 46-term glossary. A user writing `Nature`-format articles in English only with author-year citations would find the skin unusable without heavy rewrite | Skin is over-fitted to operator's corpus |

---

## 3. Hardcoded references table (framework files only)

Every file:line reference to a specific external project, path, or operator-specific string in framework files (outside `projects/` and `reports/`):

| File | Line | Content (excerpt) | Class |
|------|------|------------------|-------|
| `roles/visionary_EN.md` | 53 | "publish a section on Λ-dynamics for the ODTOE paper" | Example — ODTOE name-drop |
| `roles/visionary.md` | 87 | "заявить новую теорему в статье ODTOE_article" | Example — ODTOE name-drop |
| `roles/analyst.md` | 80 | "добавить секцию с новой теоремой в `ODTOE_article.tex`" | Example — ODTOE artifact |
| `roles/builder_EN.md` | 72 | "draft the Λ-dynamics section for ODTOE" + `ODTOE_article.tex` + `references.bib` + `tectonic ODTOE_article.tex` | Example — ODTOE + LaTeX |
| `roles/builder.md` | 93-94 | "секция IV «Доказательство» в `ODTOE_1836.tex`" + gold standard `ODTOE_article.tex` | Example — ODTOE artifact |
| `roles/validator.md` | 90 | "валидация секции «Доказательство теоремы» в `ODTOE_1836.tex`" | Example — ODTOE artifact |
| `roles/coherent.md` | 98 | "синхронизация пятёрки при работе над `ODTOE_1836.tex`" | Example — ODTOE artifact |
| `templates/domain_skin.article.md` | 11 | "Live reference project: projects/odtoe-articles/" | Structural coupling |
| `templates/domain_skin.article.md` | 21 | "targets theorem/proof/derivation articles (ODTOE-style corpus work)" | Out-of-scope definition |
| `templates/domain_skin.article.md` | 33-51 | 8 rows cite `odtoe-articles/config.md` line numbers | Vocabulary grounded in one project |
| `templates/domain_skin.article.md` | 83,89,122,128,136,139,151,181,193,211,213,243,288,307,333,342,345,362,407,417,419,423,425,434,438,440,444,461,471,476,481,491,520,524,527,559,594-612,633,643 | ≥35 additional lines reference `ODTOE_` filenames, `Rybakov`, 46-term glossary, Pankratov self-cites, config.md line numbers | Entire skin fabric is ODTOE-grounded |
| `templates/domain_skin.article_RU.md` | 11,27-49,70,73,79,84,87,93,121,162,168,180,259 | Russian mirror of above | Same lock-in in RU |
| `templates/domain_skin.research.md` | 294,314,428 | "ODTOE observer", "ODTOE-related lemmas", "ODTOE case" | Example + co-existence clause |
| `templates/domain_skin.research_RU.md` | 192,206 | "ODTOE-наблюдатель", "ODTOE-лемм" | RU mirror |
| `templates/domain_skin.code.md` | 165 | `projects/plugy/config.md` as live example of B-weight override | Project name-drop |
| `templates/domain_skin.code_RU.md` | 165 | Same | RU mirror |
| `templates/domain_skin.config.md` | 12,29,36,37,38,60,465,483,529,537 | `projects/eradev`, `plugy`, `academic-lab`, `odtoe-articles` cited as live reference configs | Project name-drop (×4) |
| `templates/domain_skin.config_RU.md` | 12,34-36,282 | Same | RU mirror |
| `templates/domain_skin.plan.md` | 526 | `projects/plugy/config.md` precedent | Project name-drop |
| `templates/CLAUDE.md.template` | 45 | "core framework (ODTOE + TPS + Round Table)" | ODTOE = core concept |
| `templates/CLAUDE.md.universal` | 24 | Same | Same |
| `templates/AGENTS.md.template` | 74 | Same | Same |
| `templates/cross_harness_requirements.md` | 37 | "ODTOE core math, RT protocol, role definitions..." | ODTOE = core concept |
| `eradev.md` | 169, 187 | OOD table example mentions ODTOE n_min | Example |
| `meta.md` | 26 | Section title "ODTOE Coherence Formulas" | Framework branding |
| `meta.md` | 197 | "from PLUGY Hansei 2026-04-20" | Project name-drop |
| `meta_RU.md` | 26, 192 | RU mirrors above | Same |
| `glossary.md` | 3 | "all ODTOE and EraDev terminology" | Framework branding |
| `README.md` | 5, 12, 34, 36, 79, 169, 178 | ODTOE as core concept | Framework branding |
| `LOADING_PROTOCOL.md` | 18, 69 | ODTOE formulas as core | Framework branding |
| `BOOTSTRAP_LESSONS_universal.md` | 10-11, 30, 38 | ODTOE math as framework invariant | Framework branding (labelled UNIVERSAL) |
| `BOOTSTRAP_LESSONS.md` | Similar | Same | Same |

**Summary counts:**
- Framework-core name-coupling: **≥60 lines across 20 files**
- Sharp violations of Iron Rule #7 (literal project name in generic file): **11 files** (role files ×5 EN+RU, CLAUDE.md templates ×3, cross_harness_requirements.md, meta.md PLUGY mention, code/config/plan skin project name-drops)
- Soft coupling (ODTOE as conceptual brand): **all framework files**

---

## 4. Format lock-in matrix (6 skins × 5 format alternatives)

Legend: ✓ = works as-is, ~ = partial (vocabulary adapts, tooling doesn't), ✗ = needs rewrite

| Skin | Primary assumption | .docx input | .rst articles | .json configs | org-mode plans | non-LaTeX book (.md / vivliostyle) |
|------|-------------------|-------------|---------------|---------------|----------------|-------------------------------------|
| `article` | **LaTeX + tectonic + BibTeX + 8-file RU/EN set** | ✗ rewrite required; no .docx compile path; .md output is placed next to .tex | ✗ no `\section*` mapping, no `~[N]` citation idiom, no tectonic for .rst | ✗ not applicable (articles) | n/a | n/a |
| `book` | **.md/.tex/.epub, pandoc or tectonic** | ✗ no .docx workflow; manuscripts assumed Markdown/LaTeX | n/a | n/a | n/a | ✓ vivliostyle & pandoc both mentioned |
| `config` | **YAML/TOML/JSON/INI/.env + Markdown-fenced yaml** | n/a | n/a | ✓ JSON explicit in scope | ✗ org-mode not mentioned | n/a |
| `plan` | **Markdown plan document** | ✗ .md/.txt/.pdf mentioned, .docx not | n/a | n/a | ✗ org-mode not supported (but adjacent classes allowed to reuse the skin) | n/a |
| `research` | **LaTeX + notebook (Jupyter)** | ✗ .docx not | ~ .rst untested | n/a | n/a | n/a |
| `code` | **any language; no format bias** | n/a | n/a | ✓ JSON/YAML/.env all in `.md` list | n/a | n/a |

**Key finding:** `.docx` workflows are uniformly unsupported — the article skin would have to be rewritten to handle a user whose publisher requires .docx submission. A user with .docx books, .rst articles, or org-mode plans cannot drop these into EraDev today.

**Article skin specifically:**
- Assumes `ODTOE_{topic}.tex` filename convention
- Assumes RU+EN bilingual 8-file set (.tex/.pdf/.docx/.md × 2)
- Assumes `~[N]` citation idiom (ODTOE-specific, not standard LaTeX)
- Assumes `\item[{[N]}]` biblio format
- Assumes 46-term glossary and `Pankratov` self-cite evaluation
- Assumes 50-digit precision for physical constants
- Assumes Rybakov evidence markers (`% [FACT:...]`, `% [DERIVATION:...]`)

**None of these are portable to a non-ODTOE article project.** The skin is effectively a project manual for `projects/odtoe-articles/` wearing the clothing of a universal skin.

---

## 5. Language sync audit (BL-19)

**Rule (BOOTSTRAP_LESSONS_universal.md:147-152):**
> "When creating or updating a file that has a bilingual counterpart (RU/EN), ALWAYS update BOTH versions in the same operation. Never create an EN file without its RU pair (or vice versa)."

**Interpretation:** conditional on the counterpart *existing*. If a project has no RU files, BL-19 never fires. OK.

**But:**
- `projects/eradev/config.md:51-56` Iron Rule 3: "Every change to EN file = same change to RU counterpart in the same commit. Creating or updating ANY file without its bilingual counterpart is INCOMPLETE work."
  - This is a PROJECT-level rule for the eradev self-project. Other projects MAY opt out.
- `projects/odtoe-articles/config.md:70-80`: "NEVER create RU without EN or vice versa. If any version is missing, the article is INCOMPLETE."
  - This is also a PROJECT-level rule.
- **`templates/domain_skin.article.md` treats the 8-file RU+EN set as a universal "build" requirement** — this leaks the project rule into the skin. A user writing English-only articles would have to delete this requirement.
- `templates/domain_skin.book.md:10` correctly marks bilingual as "optional per-project (BL-19 conditional)" using `domain.bilingual: true`. This is the right pattern.

**Verdict:** BL-19 itself is *conditional* and correctly scoped as a universal rule. Application in the `article` skin is **incorrectly scoped** — the article skin embeds ODTOE's bilingual mandate as if it were a domain requirement. A French-monolingual article project would need to patch the skin.

**Single-language project feasibility:**
- A purely English code project: works today (domain.skin=code, no bilingual assumption).
- A purely English book project: works (domain.bilingual=false).
- A purely English article project: **blocked** by the article skin's built-in 8-file mandate. Would need a fork.
- A purely French/German/Chinese project: conceptually supported (config.md can declare any language), but all framework documentation (CLAUDE.md, meta.md, role files, BL) is bilingual EN/RU only — a Chinese speaker would have to either work in English or triple-localize.

---

## 6. Overall verdict

**PARTIAL UNIVERSALITY**

The framework separates into two distinct layers with different universality properties:

**Layer B (Portable — ~70% by file count):**
- The 4-factor B formula (`F·E·(1-σ)·Λ`) is mathematically universal. Projects pick weights (`text`/`creative`/`research`) from a small menu.
- The 5-role Round Table is structural; roles don't know the domain.
- Delegation (Invariants 1, 12, 13) is harness-independent in principle.
- Most Bootstrap Lessons have universal applicability ([UNIVERSAL] tag).
- `code`, `plan`, `config`, `book` skins are *reasonably* domain-generic. Book skin models bilingual correctly (opt-in).
- CLAUDE.md and meta.md have *minimal* project-specific content (only brand references to ODTOE).

**Layer A+coupling (Locked — ~30% by file count):**
- **Article skin is over-fitted to ODTOE.** It is a Wiki for one corpus dressed as a skin. 65+ concrete ODTOE references, 8-file bilingual mandate baked in as "build", LaTeX+BibTeX+tectonic hard-coded, `Pankratov` self-cite specialization, `Rybakov` markers, 46-term glossary, `ODTOE_` filename prefix convention, 50-digit precision for constants.
- **Role files' Example 2 uniformly reference ODTOE artifacts** — literal violation of Iron Rule #7 in 6 of 10 role files (EN+RU × 5 roles, minus analyst_EN which reads as generic, plus coherent_EN/validator_EN needing re-check).
- **Framework identity is branded ODTOE.** The name appears in glossary header, meta.md Section 1 title, README, LOADING_PROTOCOL, BOOTSTRAP_LESSONS_universal.md, cross_harness_requirements.md, CLAUDE.md.template. A user adopting EraDev cannot avoid reading "ODTOE" dozens of times.
- **Claude Code harness-locked.** v10 recognizes this (cross_harness_requirements.md) but does not close the gap — all other harnesses are L3-max. Background extraction (CronCreate), hooks, and skills are Anthropic-specific infrastructure.
- **Verify-method enum is closed** (6 values). Legal / medical / culinary / other domains have no extension point.

**Iron Rule #7 verdict:** NOT SATISFIED. "Core framework files (outside projects/) MUST NOT reference specific external projects by name" is violated in ≥ 11 files: 5 role files × 2 languages have Example 2 with `ODTOE_article.tex` / `ODTOE_1836.tex`; article skin + its RU mirror reference `odtoe-articles` by name in structure; config skin lists all 4 live projects as examples; code skin, plan skin reference plugy. The rule was written AFTER the role-file examples were drafted and has not been retrofitted.

**EMP8 verdict (roadmap_v9): "ODTOE math is already universal — only the wording in role files is code-coupled":**
- **Math:** TRUE — the formula is mode-agnostic.
- **Role files:** FALSE — they are now article-coupled via Example 2, not merely code-coupled. The anti-pattern that v9 was meant to prevent (code bias) re-emerged as article bias in Phase 1.A.
- **Skin layer:** FALSE for the article skin. The skin was DERIVED from one project and carries its DNA.

**User scenario verdict:**
- A Claude Code user with a TypeScript codebase: works today, almost no friction.
- A Claude Code user with LaTeX+BibTeX+bilingual scientific articles in ODTOE style: works today, zero friction (the framework was empirically built for them).
- A Claude Code user with Markdown textbooks: works with `domain.bilingual: false`. Low friction.
- A Claude Code user with .docx/Word manuscripts: requires skin rewrite.
- A Claude Code user with .rst articles: requires skin rewrite + compile-path replacement.
- A Claude Code user with legal documents / medical protocols / recipes / game design docs: blocked at verify-method enum; needs framework modification.
- A Cursor/Windsurf/Codex user with anything: degrades to L3, loses RT/multi-agent value proposition.
- A non-EN/RU-language user (French, German, Chinese): operationally possible but framework documentation is EN/RU only.

---

## 7. Recommendations (close universality gaps)

**Priority 1 — Iron Rule #7 restoration (blocking for claim of universality):**

1. **Rewrite Example 2 in role files to be generic.** Replace `ODTOE_article.tex` with `{project_article}.tex`, `ODTOE_1836.tex` with `{corpus}_{topic}.tex`. Affects: `roles/{visionary,analyst,builder,validator,coherent}.md` (RU) and `_EN.md` (EN). Re-check: coherent_EN.md, validator_EN.md, analyst_EN.md for similar drift. Estimate: 10 file edits, one RT cycle.

2. **Strip article skin of ODTOE-specific rules or split it.** Two paths:
   - (a) **Split:** create `templates/domain_skin.article.md` (generic — theorem/proof shape, abstract citation model, arbitrary compile pipeline) + `templates/domain_skin.article.odtoe.md` (project-specific extension with 8-file set, 50-digit, Rybakov markers, 46-term glossary, ~[N] idiom). Project declares `domain.skin: templates/domain_skin.article.odtoe.md`.
   - (b) **Parametrize:** move every ODTOE-specific constant into `projects/odtoe-articles/config.md` as a schema the skin reads at load time. Skin becomes ~200 lines of meta-rules + 0 literal ODTOE references.
   - Recommendation: (b) is cleaner but (a) is cheaper. Either closes the violation.

3. **Strip article_RU skin symmetrically.**

4. **Remove live-project name-drops from config / code / plan skins.** Replace `projects/plugy/config.md` and `projects/{eradev,plugy,academic-lab,odtoe-articles}/config.md` with generic "your project's config" + pointer to `templates/domain_skin.md.template`.

5. **Update README / glossary / meta.md / BOOTSTRAP_LESSONS_universal header:** distinguish between "the research framework's roots" (historical note, acceptable) and "the framework's mandatory vocabulary" (should not require ODTOE). Consider: move ODTOE math origin story into a `docs/origins.md` and keep formulas in `eradev.md` with ODTOE attribution optional.

**Priority 2 — Format lock-in reduction:**

6. **Add .docx / .rst / org-mode as format-neutral examples** to relevant skins. The article skin does not need to endorse all formats; it needs to not forbid them.

7. **Document per-project format overrides** in `domain.skin.format:` field of config.md. A project can declare `format: docx` and the skin's compile step becomes `pandoc ... -o ...docx` instead of `tectonic ....tex`.

**Priority 3 — Language generalization:**

8. **Decouple BL-19 from the 8-file mandate.** BL-19 says "sync bilingual counterparts"; it does NOT say "every article must be bilingual". The article skin should treat bilingual as `domain.bilingual: true` opt-in (as book skin does correctly). Default `false` for new projects.

9. **Add `domain.languages: [en]` or `[en, ru]` or `[en, fr, de]` field** to config.md schema. BL-19 fires per language pair declared. Framework docs remain EN/RU (acceptable) but projects can choose freely.

**Priority 4 — Verify-method extensibility:**

10. **Make `verify.method` enum extensible per project.** Define interface: a project can add `verify.method: custom_legal_check` with `verify.command` + `verify.success_criteria`. Framework guarantees methods don't stomp each other; skin doesn't need to know.

11. **Document the extension pattern in `templates/domain_skin.md.template`.**

**Priority 5 — Harness portability (acknowledge vs close):**

12. **Accept current reality:** Claude Code is the only full-stack harness. `cross_harness_requirements.md` is accurate. This is not a framework defect; it is an industry-of-tooling defect.

13. **Soft-suggest removing "Claude Code" from the title of `CLAUDE.md` / `CLAUDE.md.template` / `CLAUDE.md.universal`** and replacing with "META-Bootstrap (any LLM agent harness)" — cosmetic, but gives visual signal of intent. Content already generalizes.

**Priority 6 — Example generification pattern:**

14. **Adopt a "3-domain rotation" rule for every Example block:** Example 1 = code, Example 2 = article/book, Example 3 = plan/config/research. Use *generic* domain labels and *parametric* artifact names, never specific project names. When a concrete example is needed, put it in `projects/{name}/examples.md`, NOT in the role file.

---

## 8. B-check (framework-level audit, text modality, uniform 0.25 weights)

| Component | Value | Rationale |
|-----------|-------|-----------|
| F (Focus) | 0.85 | Read all 10 dimensions' evidence surface. Missed: skimmed instead of deep-read the full 644-line article skin; full text of the 6 skins × hash would have been 30-min job and I sampled the load-bearing headers. Missed: did not read every role file's full Example 3 block. However every dimension has ≥ 3 evidence points. |
| E (Alignment) | 0.90 | Operator asked "is framework universal, not locked to specific versions of books/articles/formats?" — this report answers that question directly. Verdict is honest: framework has both universal (Layer B) and locked (Layer A) components. Did not advocate; did not soft-pedal. |
| (1-σ) (Consistency) | 0.85 | No internal contradictions in the report. One place to audit: dimension 4 says "PARTIAL" for language while dimension 5 says "BL-19 is conditional, correctly scoped". These are consistent — BL-19 the rule is OK, BL-19 the *application inside article skin* is not. Report body makes this distinction explicit; the header verdicts could have stated it more crisply. |
| Λ (Experience) | 0.80 | Consulted prior Hansei findings (Phase 2.1.S, roadmap_v9 EMP8). Applied BL-11 (minimum viable scope — did not expand audit into v11 futurism). Applied BL-19 conditional-scope insight to catch article skin's over-mandating. Minor gap: did not check BOOTSTRAP_LESSONS_code_adapter.md for code-specific lock-in that could equally affect other domains. |

**B = 0.85 × 0.90 × 0.85 × 0.80 = 0.520**

Above 0.5 threshold. No Andon. Verdict is releasable.

---

## 9. Appendix: final verdict for the operator

The claim of universality is **empirically half-true**:

**UNIVERSAL components:**
- ODTOE math (B, S, P_coll, Omega) — works for any domain that admits discrete+verifiable artifacts.
- 5-role Round Table protocol — domain-independent.
- Task classification S/M/L/XL — domain-independent.
- 22 universal Bootstrap Lessons — correctly tagged.
- `code`, `plan`, `config`, `book` skins — reasonably domain-generic (book skin's bilingual treatment is the gold standard for other skins to emulate).

**LOCKED components:**
- `article` skin and its RU mirror — over-fitted to ODTOE corpus. Not usable for non-ODTOE article work without rewrite.
- Role files' Example 2 blocks — reference ODTOE artifacts verbatim. Violates Iron Rule #7.
- Research skin — lighter but still uses ODTOE observer / lemmas as examples.
- Format lock-in: LaTeX/tectonic/BibTeX assumed for articles; .docx/.rst/org-mode not addressed.
- Verify-method enum: 6 fixed values, no extension pathway.
- Harness lock-in: Claude Code is L9, every alternative is L3-max. Not closable today; reality.
- ODTOE branding: framework identity is ODTOE-branded throughout. Not functional coupling, but conceptual coupling that cannot be avoided by a user.

**The good news:** most of the locked components are concentrated in 2-3 files (article skin, role-file Example 2, template headers). Priority 1 recommendations (items 1-5 above) would close the majority in an M-scale refactor: ~15 file edits, one RT cycle, zero math changes. After that, EraDev could honestly claim HIGH universality within text-discrete domains.

**Specific answer to the operator's question "are book/article versions / formats hardcoded?":**
- **Book formats:** NO serious lock-in. Book skin supports `.md`/`.tex`/`.epub` via pandoc/tectonic/vivliostyle and handles bilingual as opt-in.
- **Article formats:** YES, strong lock-in. Article skin assumes `.tex` + tectonic + BibTeX + RU+EN + 8-file set + ODTOE naming. A user with `.docx` or single-language articles would have to fork the skin.
- **Versions of specific books/articles:** framework does not reference any specific book version. It does reference specific ODTOE article files (`ODTOE_article.tex`, `ODTOE_1836.tex`, `ODTOE_measuring_B_parameter.tex`, `ODTOE_phi_fractality.tex`) in examples and skin evidence rows. These are not version-pinned (mtime-independent), but they are identity-pinned — a non-ODTOE user will see filenames that mean nothing to them.

End of report.
