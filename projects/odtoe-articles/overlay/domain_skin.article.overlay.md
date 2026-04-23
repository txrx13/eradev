# ODTOE Article Skin Overlay

> Type: domain_skin overlay
> Base skin: `templates/domain_skin.article.md`
> Project: `projects/odtoe-articles/`
> Last updated: 2026-04-23
> Upstream role files: `roles/{role}_EN.md` (EN stack) or `roles/{role}.md` (RU stack)
> Upstream BL: `BOOTSTRAP_LESSONS_universal.md` (22 universal BL) — inherited via the base article skin
> **To activate this overlay:** add `domain.overlay: overlay/domain_skin.article.overlay.md` to `projects/odtoe-articles/config.md` `domain:` block.

## Purpose

This overlay is a DELTA on top of `templates/domain_skin.article.md`. It encodes the ODTOE-specific specializations that were removed from the universal article skin during the v10 universality refactor. When an agent works on an ODTOE article task, it reads the universal skin AND this overlay; the overlay rules apply in addition to (and override where applicable) the universal skin.

Non-ODTOE article projects MUST NOT load this overlay — its rules (ODTOE filename prefix, 8-file RU+EN mandate, XeLaTeX/tectonic/BibTeX stack, Pankratov self-citation, Rybakov evidence markers, 46-term ODTOE glossary) are project-scoped.

---

## 1. Filename & corpus conventions (ODTOE-specific)

- **Gold-standard format reference:** `ODTOE_article.tex` (located in the ODTOE working directory `/Users/antonpankratov/Downloads/odtoe/`). Every new article MUST match its preamble, title block, and section structure.
- **Filename convention:** all ODTOE article filenames use the `ODTOE_{topic}` prefix (RU source), with EN mirror `ODTOE_{topic}_EN` (e.g., `ODTOE_phi_fractality.tex` + `ODTOE_phi_fractality_EN.tex`).
- **Unicode reference article:** `ODTOE_phi_fractality.tex` — correct Unicode usage throughout; use as secondary format reference when checking Unicode rendering.
- **Existing corpus:** 160+ articles in `.tex` format in the working directory. Analyst's "3 nearest neighbours" read (universal skin, Analyst role override) uses this corpus.
- **Working directory:** `/Users/antonpankratov/Downloads/odtoe/`. All 8 artifact files for an article live in this single directory — NOT in separate subfolders.

## 2. 8-file RU+EN bilingual mandate (ODTOE-specific BL-19 instantiation)

The universal skin's `build` vocabulary says "project-defined artifact set (typically 1–8 files)". For ODTOE articles the set is **always exactly 8**:

| # | Filename pattern | Purpose |
|---|---|---|
| 1 | `ODTOE_{topic}.tex` | RU LaTeX source |
| 2 | `ODTOE_{topic}.pdf` | RU compiled PDF |
| 3 | `ODTOE_{topic}.docx` | RU for reviewers (pandoc output) |
| 4 | `ODTOE_{topic}.md` | RU clean markdown |
| 5 | `ODTOE_{topic}_EN.tex` | EN LaTeX source |
| 6 | `ODTOE_{topic}_EN.pdf` | EN compiled PDF |
| 7 | `ODTOE_{topic}_EN.docx` | EN for reviewers |
| 8 | `ODTOE_{topic}_EN.md` | EN clean markdown |

**Enforcement:** Builder must NOT mark Done until all 8 files exist. Coherencer BLOCKS commit if fewer than 8 files exist OR if size divergence between RU and EN exceeds 50% for any format. NEVER produce RU without EN or vice versa. NEVER update one without the other — atomic 8-file commits only (`one commit = one section's bilingual 8-file update` per BL-24 ODTOE adaptation).

**Builder section-by-section rhythm override:** within a single Builder session, the ODTOE rhythm is: draft section I in RU `.tex` → immediately draft section I in EN `.tex` (BL-19) → compile both (`tectonic ODTOE_{topic}.tex && tectonic ODTOE_{topic}_EN.tex`) → annotate evidence markers → next section. Defer EN to "later" is STRICTLY forbidden.

## 3. LaTeX/tectonic/pandoc stack (ODTOE-specific)

The universal skin leaves `compile` engine-neutral. ODTOE pins the stack:

- **Engine:** `tectonic` (XeLaTeX-compatible).
- **Tectonic path:** `/opt/homebrew/Cellar/tectonic/0.15.0_5/bin/tectonic`
- **Pandoc path (for .docx generation):** `/opt/homebrew/Cellar/pandoc/3.9/bin/pandoc`
- **Compile command (both languages):** `tectonic ODTOE_{topic}.tex && tectonic ODTOE_{topic}_EN.tex`
- **DOCX generation:** `sed 's/\\tag{\([^}]*\)}/\\quad\\quad\\quad \\text{(\1)}/g' FILE.tex | pandoc -f latex -t docx -o FILE.docx`
- **MD generation:** `python3 tex2md.py` (or manual conversion with `fix_md.py` cleanup). Output placed NEXT TO the `.tex`/`.pdf`/`.docx` in the odtoe root.

### Mandatory preamble (match `ODTOE_article.tex` EXACTLY)

```latex
\documentclass[12pt,a4paper]{article}

% Fonts (XeLaTeX/tectonic — native Unicode support)
\usepackage{fontspec}
\setmainfont{PT Serif}
\setsansfont{PT Sans}
\setmonofont{Courier New}
\newfontfamily\cyrillicfont{PT Serif}
\newfontfamily\cyrillicfontsf{PT Sans}
\newfontfamily\cyrillicfonttt{PT Serif}

% Language
\usepackage{polyglossia}
\setmainlanguage{russian}
\setotherlanguage{english}

% Math packages
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{mathtools}

% Page layout
\usepackage[top=25mm, bottom=25mm, left=25mm, right=25mm]{geometry}

% Tables
\usepackage{booktabs}
\usepackage{array}
\usepackage{longtable}

% Misc
\usepackage{hyperref}

% Paragraph spacing
\setlength{\parskip}{0.5em}

% Disable hyphenation
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000
\sloppy

% Fix polyglossia/fontspec cmrsideswitch conflict in longtable
\makeatletter
\providecommand{\cmrsideswitch}{}
\makeatother
```

Preamble must have comment group headers (`% Fonts`, `% Language`, etc.) with blank lines between groups. Packages listed separately, not comma-joined.

### Critical LaTeX rules (ODTOE idioms)

- **Unicode characters ONLY:** `«»` not `<<>>`, `—` not `---`, `–` not `--` (L-31: TeX dashes forbidden — `grep -Pn '--|---' *.tex` = 0 PASS).
- **No TeX ligatures** — PT Serif + XeLaTeX does not render them correctly.
- **No `\d{h}` or combining marks** — PT Serif lacks U+0323. Use plain ASCII transliteration.
- **longtable columns:** `p{...}` only, no `>{\raggedright}`.
- **`\cmrsideswitch` fix:** always include in preamble.
- **Formulas:** `\begin{equation*}...\tag{N.M}\end{equation*}`, NOT `$$...\tag{...}$$`.
- **No `\hrule`** between sections — clean transitions only.
- **UDC:** `\noindent\textbf{УДК ...}` OUTSIDE the center block, after `\vspace{1em}`.
- **Keywords:** `\noindent\textbf{Ключевые слова: text...}` (text inside `\textbf`).
- **EN Abstract:** `\section*{ABSTRACT}` plain (no `\begin{english}` wrapper on section header).

### EN version differences (from RU master)

- `\setmainlanguage{english}`, `\setotherlanguage{russian}`.
- Remove all `\begin{english}...\end{english}` wrappers.
- Decimal dots (0.5) not commas (0,5).
- Wrap Russian-only text in `\begin{russian}...\end{russian}` (abstract, keywords).
- Bibliography: keep EN entries unwrapped, translate RU entries.

## 4. Article structure (ODTOE standard — match `ODTOE_article.tex`)

1. Title block: `{\Large\bfseries TITLE}\\[0.3em]` then `{\large (EN translation)}\\[0.5em]` then `{\small\itshape subtitle}`.
2. Author: `{\bfseries Панкратов Антон Сергеевич}` / `Pankratov Anton Sergeevich`.
3. Affiliation: Независимый исследователь, г. Казань, Россия.
4. Email: `anton.s.pankratov@gmail.com`.
5. ORCID: `0009-0002-4870-2995`.
6. `\vspace{1em}` then `\noindent\textbf{УДК ...}` (OUTSIDE center block).
7. `\section*{АННОТАЦИЯ}` then `\noindent\textbf{Ключевые слова: ...}`.
8. `\section*{ABSTRACT}` then `\noindent\textbf{Keywords: ...}`.
9. Sections: `\section*{I. НАЗВАНИЕ}` with Roman numerals IN the section name.
10. Subsections: `\subsection*{I.1. Название}`.
11. Before `ЛИТЕРАТУРА` (per L-33): `БЛАГОДАРНОСТИ И ИНСТРУМЕНТЫ` + `КОНФЛИКТ ИНТЕРЕСОВ` + `ФИНАНСИРОВАНИЕ` sections must appear.
12. Bibliography: `\begin{enumerate}\item...\end{enumerate}` with `[N]` references in text (ODTOE idiom: `~[N]`, in first-mention order).

## 5. Eight Verification Checks (ODTOE-specific gate)

The universal skin says "project-declared checks". For ODTOE the gate is exactly 8 checks:

1. **Formula correctness + bibliography** — recompute every formula from first principles; verify DOIs, publisher/year/volume/pages; assign Trust Index T1/T2/T3/T4.
2. **Mathematical apparatus — full recomputation** — every formula recomputed independently; all intermediate steps verified; dependents traced on error.
3. **50-digit precision** for ALL computations. Constants to 50 decimals:

   | Constant | Value (50 digits) |
   |---|---|
   | π | 3.14159265358979323846264338327950288419716939937510 |
   | φ | 1.61803398874989484820458683436563811772030917980576 |
   | φ² | 2.61803398874989484820458683436563811772030917980576 |
   | 1/φ | 0.61803398874989484820458683436563811772030917980576 |
   | 1/φ² | 0.38196601125010515179541316563436188227969082019424 |
   | (π−3)² | 0.02004847955059918805863070019913383013068301099015 |
   | π−3 | 0.14159265358979323846264338327950288419716939937510 |

4. **No fitting — all parameters derived from theory.** Derivation chain: Axiom A → Postulates P1-P6 → Derived formula → Parameter value. No tuning to experimental data.
5. **No AI markers, hidden characters, tone inconsistencies** — scan zero-width spaces, soft hyphens, overly hedged phrases, repetitive transitions, generic filler.
6. **Plagiarism prevention — >90% originality** — ODTOE-original formulations; self-plagiarism check across corpus.
7. **Internal consistency — no contradictions** within article AND across corpus. Terminology matches 46-term ODTOE glossary; self-contained reader experience.
8. **Evidence classification (Rybakov markers)** — every substantive claim annotated as LaTeX comment:
   - `% [FACT: source]` — experimentally confirmed or peer-reviewed result.
   - `% [DERIVATION: from axiom/postulate]` — follows from ODTOE axioms via explicit chain.
   - `% [HYPOTHESIS: testable via X]` — testable prediction, not yet verified.
   - `% [OPEN: reason]` — open question feeding spiral gap (~2%).

   Markers are LaTeX comments (invisible in PDF, auditable in `.tex`). Validator MUST audit marker accuracy. Unmarked substantive claims = YELLOW on A_σ. `[DERIVATION]` tag that is actually a post-hoc fit = Check 4 violation (L-23 enforcement).

   **Temporal exception:** Check 8 was added **2026-04-04**. Articles authored before that date without markers = `LEGACY INFO` (Case B), not FAIL. Cutoff:
   ```bash
   git log --diff-filter=A --format=%at -1 -- "$TEX"   # preferred: first-add commit
   stat -f %m "$TEX"                                    # macOS fallback
   ```
   Validator verdict labels per universal skin's Case A / Case B / Partial split.

## 6. ODTOE Role Mapping (check ownership)

This table is the ODTOE-specific version of the universal skin's role overrides. It WINS on conflict per the universal skin's unification rule.

| Role | ODTOE Article Task | Checks Owned |
|---|---|---|
| Visionary | Thesis, structure, place in ODTOE corpus, strategic significance | Check 4 (no fitting — strategic integrity) |
| Analyst | Section decomposition, formula inventory, source requirements, dependencies | Check 1 (bibliography), Check 2 (formulas — decompose), Check 5 (AI markers) |
| Builder | Write .tex, formulas, compile PDF/DOCX/MD — Check-First BEFORE writing | Check 3 (50-digit precision), Check 8 (evidence markers during writing) |
| Validator | Post-generation verification of ALL 8 checks, formula recomputation | ALL checks (final gate) |
| Coherencer | Consistency with ODTOE corpus, terminology alignment, bilingual parity | Check 6 (plagiarism), Check 7 (consistency), BL-19 (8-file bilingual sync) |

## 7. Pankratov self-citation (C5 specialization)

The universal skin's C5 ladder (0-30% PASS / 30-50% NOTES / 50-70% NOTES ESCALATED / ≥70% FAIL) applies AS-IS for ODTOE, with the following project-specific context:

- **Author identity:** Pankratov Anton Sergeevich (primary author for all ODTOE articles). `self_cite_rate` counts any in-text `~[N]` where the bibliography entry's author is Pankratov.
- **L-32 (biblio year format):** Pankratov self-cites use the form `"Препринт (2026)"`. Titles are copied verbatim from the source article's `.tex` `\Large\bfseries` title, NOT invented.
- **Empirical data points (calibrated on 2 smoke tests):**
  - First smoke test: 27.4% → PASS WITH NOTES.
  - Second smoke test: 55.6% → PASS WITH NOTES ESCALATED.
  - See `reports/v9_phase2_1_s_second_smoke_test_2026-04-11.md` Section 3 C5 row.
- **Justification burden (≥50%):** Each self-cite must be load-bearing — contributes a result that cannot be sourced elsewhere. Validator records the per-cite justification and flags for Coherencer at RT-2. Builder's initial justification is in the Analyst Source Register.

## 8. Rybakov evidence markers (Check 8 provenance)

"Rybakov Approach" is the ODTOE-specific name for the `% [FACT]` / `% [DERIVATION]` / `% [HYPOTHESIS]` / `% [OPEN]` scheme (integration date: 2026-04-04, RT-1 analysis). The universal skin references "evidence-marker scheme" generically; this overlay names it Rybakov and fixes the exact marker syntax above (Check 8).

**C6b formula provenance — Rybakov integration:** the universal skin's C6b check (formula provenance) accepts ODTOE's Rybakov markers `% [DERIVATION: axiom]` and `% [HYPOTHESIS: ...]` as valid axiomatic and conjectured provenance labels, in addition to the generic "Postulate P4" / "Conjecture 1" labels.

**Canonical case (Skin-DEF-f):** `ODTOE_phi_fractality.tex` Section III.2, formula `S(ρ_d) ∝ φ^(-|d-d_0|)`, attributed to `[3]` with no in-article derivation or page pointer — `reports/v9_phase2_1_s_second_smoke_test_2026-04-11.md` DEF-5 — is the precedent for C6b FAIL on "asserted without marker."

## 9. ODTOE 46-term glossary

The universal skin defers to `projects/{PROJECT}/glossary.md` for the project glossary. The ODTOE glossary lives at:

- **Location:** `glossary.md` in the ODTOE working directory (`/Users/antonpankratov/Downloads/odtoe/glossary.md`) OR `glossary.md` at the eradev repo root (which declares itself "all ODTOE and EraDev terminology" per `glossary.md:3`).
- **Scope:** 46 canonical ODTOE terms — Builder MUST grep the corpus AND check this glossary BEFORE drafting any technical term (BL-29 + AMP8).
- **Russian abbreviation rule (AMP8):** `ODTOE → НЗТВ` when a Russian abbreviation is needed. Transliteration `ODTOE → ОДТОЕ` is PROHIBITED. Gravity session precedent: 84 occurrences of wrong transliteration, zero corpus checks performed — this is the exact failure mode AMP8 prevents.

## 10. Project lessons.md pointers (Skin-DEF-g integration)

The universal skin's Project lessons.md integration section defers to `projects/{PROJECT}/lessons.md`. For ODTOE these are the load-bearing post-spec rules:

- **L-31 (TeX dashes):** `---` / `--` forbidden in `.tex` source; use Unicode `—` / `–`. Grep: `grep -Pn '--|---' *.tex` = 0 PASS.
- **L-32 (biblio year format):** Pankratov self-cites = `"Препринт (2026)"`; titles copied verbatim from `\Large\bfseries`, not invented. (See Section 7 above.)
- **L-33 (required sections before ЛИТЕРАТУРА):** `БЛАГОДАРНОСТИ И ИНСТРУМЕНТЫ` + `КОНФЛИКТ ИНТЕРЕСОВ` + `ФИНАНСИРОВАНИЕ` appear before bibliography. Note: `lessons.md` has a numbering collision (two L-33 entries — the second covers READ/WRITE/VERIFY/SYNC canonical operations). Validator tolerates both.
- **L-34 (RU+EN parity):** same section count, same formula count, same citation count, same figure count across RU and EN. (Universal skin Coherencer Q4.)
- **L-35 (biblio in first-mention order, no `ODTOE_...` file-name refs in text):** citations cannot name source files directly; use author/year or `~[N]` only.

**Temporal exception** (inherits universal skin pattern): rules introduced AFTER an article's first-add mtime are LEGACY INFO, not FAIL. Example: `ODTOE_phi_fractality.tex` (mtime Mar 19) predates L-31 (dated 2026-04-05), so 16 EN `---` occurrences are Case B (LEGACY INFO).

## 11. Live reference project declaration

`projects/odtoe-articles/config.md` is the **canonical live reference** for the article domain — any future article project's config.md patterns should take ODTOE as precedent, but MUST NOT inherit ODTOE-specific fields (filename prefix, 8-file mandate, Pankratov self-cite, Rybakov markers) unless the project is itself part of the ODTOE corpus.

---

## Footer

*Last updated: 2026-04-23*
*Base skin: `templates/domain_skin.article.md` (universal)*
*Overlay file: `projects/odtoe-articles/overlay/domain_skin.article.overlay.md`*
*Activation: add `domain.overlay: overlay/domain_skin.article.overlay.md` to `projects/odtoe-articles/config.md`*
*Working directory: `/Users/antonpankratov/Downloads/odtoe/`*
*Source extraction date: 2026-04-23 (v10 universality refactor — content extracted from monolithic `domain_skin.article.md` that was ODTOE-over-fitted)*
