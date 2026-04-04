# ODTOE Articles -- Project Configuration

## Purpose
Formatting, verification, and publication of scientific articles for the ODTOE (Observer-Dependent Theory of Everything) research corpus.

## Check-First Pipeline (MANDATORY — execute BEFORE writing any .tex)

```
=== PRE-GENERATION CHECKLIST ===
[ ] 1. FORMAT: Read ODTOE_article.tex (full preamble + first section) — gold standard format
[ ] 2. FORMULAS: List ALL formulas. Recompute each independently to 50 digits. Do NOT copy from other articles.
[ ] 3. CONSTANTS: Prepare 50-digit values for π, φ, (π−3)² and all derived constants needed.
[ ] 4. SOURCES: List ALL bibliography entries. Verify each: DOI exists, publisher/year correct, page numbers match.
[ ] 4b. SOURCE REGISTER: For every key assertion, create mapping {Section | Claim | Source | Trust: T1/T2/T3/T4} where T1=peer-reviewed with DOI, T2=ODTOE corpus (verified in prior articles), T3=preprint/conference, T4=novel claim (requires DERIVATION.md per L-23). If >30% claims are T3/T4, flag for additional review.
[ ] 5. STRUCTURE: Define section plan (Roman numerals). Verify no overlap with existing corpus articles.
[ ] 6. CONSISTENCY: Check terminology matches ODTOE glossary (46 terms). No contradictions with corpus.
[ ] 7. LANGUAGE: Confirm both RU and EN versions will be produced simultaneously (BL-19).
=== CHECKLIST COMPLETE — PROCEED TO GENERATION ===
```

**Why this exists (BL-17):** Pre-generate verification is prevention. Post-generation checking is rework costing 2-3x more effort.

## Output Formats and File Placement

ALL output files live in the SAME directory as the source `.tex`:
```
/Users/antonpankratov/Downloads/odtoe/
  ODTOE_{topic}.tex        -- RU LaTeX source
  ODTOE_{topic}_EN.tex     -- EN LaTeX source
  ODTOE_{topic}.pdf        -- RU compiled PDF
  ODTOE_{topic}_EN.pdf     -- EN compiled PDF
  ODTOE_{topic}.docx       -- RU for reviewers
  ODTOE_{topic}_EN.docx    -- EN for reviewers
  ODTOE_{topic}.md          -- RU clean markdown
  ODTOE_{topic}_EN.md       -- EN clean markdown
```

**IMPORTANT:** `.md` files are placed NEXT TO `.tex`/`.pdf`/`.docx` in the odtoe root directory, NOT in a separate folder. All versions of one article live together.

## Bilingual Sync Rule (BL-19)
Each article MUST be produced in ALL versions simultaneously:
- **RU** `.tex` → `.pdf` → `.docx` → `.md`
- **EN** `_EN.tex` → `_EN.pdf` → `_EN.docx` → `_EN.md`

NEVER create RU without EN or vice versa. NEVER update one without the other.
If any version is missing, the article is INCOMPLETE.

**ENFORCEMENT (BL-19 + BL-22 gate):** The article task is NOT DONE until ALL 8 files exist:
1. `ODTOE_{topic}.tex` (RU source)
2. `ODTOE_{topic}.pdf` (RU compiled)
3. `ODTOE_{topic}.docx` (RU for reviewers)
4. `ODTOE_{topic}.md` (RU markdown)
5. `ODTOE_{topic}_EN.tex` (EN source)
6. `ODTOE_{topic}_EN.pdf` (EN compiled)
7. `ODTOE_{topic}_EN.docx` (EN for reviewers)
8. `ODTOE_{topic}_EN.md` (EN markdown)

Builder MUST produce EN version in the SAME session as RU. Do NOT defer EN to "later".

## Full Pipeline for One Article
```
1. Check-First (8 items above)
2. Write ODTOE_{topic}.tex (RU)
3. Compile: tectonic ODTOE_{topic}.tex → .pdf
4. Write ODTOE_{topic}_EN.tex (EN translation)
5. Compile: tectonic ODTOE_{topic}_EN.tex → _EN.pdf
6. Generate DOCX (both):
   sed 's/\\tag{\([^}]*\)}/\\quad\\quad\\quad \\text{(\1)}/g' FILE.tex | pandoc -f latex -t docx -o FILE.docx
7. Generate MD (both):
   python3 tex2md.py (or manual conversion with fix_md.py cleanup)
   Output: ODTOE_{topic}.md and ODTOE_{topic}_EN.md in the SAME directory
8. Apply 7 Verification Checks (see below)
9. Commit all 8 files together
```

## LaTeX Stack

### Compilation
- Engine: **tectonic** (XeLaTeX-compatible)
- Path: `/opt/homebrew/Cellar/tectonic/0.15.0_5/bin/tectonic`
- Pandoc path: `/opt/homebrew/Cellar/pandoc/3.9/bin/pandoc`

### Preamble (mandatory — match ODTOE_article.tex EXACTLY)
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

NOTE: Preamble must have comment group headers (% Fonts, % Language, % Math packages, etc.) with blank lines between groups — matching ODTOE_article.tex exactly. Packages listed separately (not comma-joined on one line).

### Critical LaTeX Rules
- **Unicode characters ONLY**: `«»` not `<<>>`, `—` not `---`, `–` not `--`
- **No TeX ligatures**: PT Serif + XeLaTeX does not render them correctly
- **No \d{h} or combining marks**: PT Serif lacks U+0323. Use plain ASCII transliteration
- **longtable columns**: use `p{...}` only, no `>{\raggedright}`
- **\cmrsideswitch fix**: always include in preamble
- **Formulas**: use `\begin{equation*}...\tag{N.M}\end{equation*}`, NOT `$$...\tag{...}$$`
- **No \hrule** between sections — clean transitions only
- **UDC**: `\noindent\textbf{УДК ...}` OUTSIDE the center block, after `\vspace{1em}`
- **Keywords**: `\noindent\textbf{Ключевые слова: text...}` (text inside \textbf)
- **EN Abstract**: `\section*{ABSTRACT}` plain (no `\begin{english}` wrapper on section header)

### EN Version Differences
- `\setmainlanguage{english}`, `\setotherlanguage{russian}`
- Remove all `\begin{english}...\end{english}` wrappers
- Decimal dots (0.5) not commas (0,5)
- Wrap Russian text in `\begin{russian}...\end{russian}`
- Bibliography: keep EN entries unwrapped, translate RU entries

## Article Structure (ODTOE standard — match ODTOE_article.tex)

1. Title block: `{\Large\bfseries TITLE}\\[0.3em]` then `{\large (EN translation)}\\[0.5em]` then `{\small\itshape subtitle}`
2. Author: `{\bfseries Панкратов Антон Сергеевич}` / `Pankratov Anton Sergeevich`
3. Affiliation: Независимый исследователь, г. Казань, Россия
4. Email: anton.s.pankratov@gmail.com
5. ORCID: 0009-0002-4870-2995
6. `\vspace{1em}` then `\noindent\textbf{УДК ...}` (OUTSIDE center block)
7. `\section*{АННОТАЦИЯ}` then `\noindent\textbf{Ключевые слова: ...}`
8. `\section*{ABSTRACT}` then `\noindent\textbf{Keywords: ...}`
9. Sections: `\section*{I. НАЗВАНИЕ}` with Roman numerals IN the section name
10. Subsections: `\subsection*{I.1. Название}`
11. Bibliography: `\begin{enumerate}\item...\end{enumerate}` with [N] references in text

## Seven Verification Checks (MANDATORY — applied to EVERY article)

### Check 1: Formula correctness, proof consistency, and bibliography verification
- **Recompute** every formula independently from first principles — do NOT copy results from other articles
- Verify logical derivation chain: each formula must follow from axioms, postulates, or prior results
- Check for internal contradictions between formulas within the article
- Bibliography: every [N] reference in text must have a matching entry in the bibliography
- Every bibliography entry must be REAL: verify DOI resolves, verify publisher/year/volume/pages
- Assign Trust Index to each entry: T1 (peer-reviewed + DOI), T2 (ODTOE corpus internal), T3 (preprint/conference), T4 (novel claim this article). Count distribution — if >30% of cited claims rely on T3/T4, article requires additional review
- No dangling references, no phantom citations
- Study the relevant theories for any corrections being made — all must be scientifically grounded

### Check 2: Mathematical apparatus — full recomputation
- Every formula recomputed independently to verify accuracy
- All intermediate steps verified — show the work
- If an error is found: (a) recompute again to confirm the error, (b) fix the formula, (c) trace ALL dependent results through the article and update them, (d) update ALL conclusions that relied on the incorrect value
- Cross-check with other ODTOE corpus articles for consistency of shared formulas

### Check 3: 50-digit precision for ALL computations
All constants computed to 50 decimal places:

| Constant | Value (50 digits) |
|----------|-------------------|
| π | 3.14159265358979323846264338327950288419716939937510 |
| φ | 1.61803398874989484820458683436563811772030917980576 |
| φ² | 2.61803398874989484820458683436563811772030917980576 |
| 1/φ | 0.61803398874989484820458683436563811772030917980576 |
| 1/φ² | 0.38196601125010515179541316563436188227969082019424 |
| (π−3)² | 0.02004847955059918805863070019913383013068301099015 |
| π−3 | 0.14159265358979323846264338327950288419716939937510 |

ALL substitutions into formulas use these 50-digit values. ALL intermediate computations maintain this precision. ALL final results presented with this precision where applicable.

### Check 4: No fitting — all parameters derived from theory
- Every formula parameter must have a strict logical derivation from ODTOE theory
- No parameter may be "adjusted" or "tuned" to match experimental data
- If a parameter appears without derivation, the article fails this check
- The derivation chain must be: Axiom A → Postulates P1-P6 → Derived formula → Parameter value
- Any empirical parameters must be explicitly marked as such with justification

### Check 5: No AI markers, hidden characters, or tone inconsistencies
- Scan for hidden/invisible Unicode characters (zero-width spaces U+200B, soft hyphens U+00AD, etc.)
- Scan for AI-specific language patterns:
  - Overly hedged phrases: "it is important to note that", "it should be mentioned that"
  - Repetitive transition structures: "Furthermore", "Moreover", "Additionally" in sequence
  - Generic filler: "plays a crucial role", "significant implications", "noteworthy"
  - Passive voice overuse where active is natural in scientific Russian
- Tone must match the corpus: formal scientific Russian (RU) or formal academic English (EN)
- Every sentence must carry information — no padding, no filler, no ceremonial phrasing
- Anti-plagiarism services detect AI text by: perplexity analysis (too uniform = AI), burstiness (too consistent sentence length = AI), vocabulary diversity (too narrow = AI). Vary sentence structure and length naturally.

### Check 6: Plagiarism prevention — >90% originality
- All formulations must be ORIGINAL — not paraphrases of Wikipedia, textbooks, or other articles
- Proper citation for ALL borrowed ideas, results, or formulations
- Self-plagiarism check: verify text is not copied from other ODTOE articles without attribution
- Anti-plagiarism algorithms work by: (a) n-gram matching against databases, (b) semantic similarity detection, (c) structural pattern matching. To ensure >90% originality:
  - Reformulate ideas in unique language — do not restructure existing sentences
  - Use domain-specific ODTOE terminology that is original to this theory
  - When referencing standard results (e.g., KAM theorem), cite and describe in own words
  - When describing experimental results, use specific numbers and context unique to this study

### Check 7: Internal consistency — no contradictions
- No contradictions WITHIN the article (formula in Section III must match formula in Section VII if referenced)
- No contradictions WITH other ODTOE corpus articles (if this article cites a formula from [1], verify it matches the original)
- Terminology must match the ODTOE glossary (46 canonical terms in glossary.md)
- Section numbering must be consistent (no gaps, no duplicates)
- Table/figure references must resolve correctly
- The article must be self-contained: a reader unfamiliar with ODTOE should be able to follow the argument with only the bibliography for external references

### Check 8: Evidence classification — epistemic status of every claim
- During .tex generation, Builder MUST annotate each substantive claim with an epistemic marker as a LaTeX comment:
  - `% [FACT: source]` — experimentally confirmed or published peer-reviewed result
  - `% [DERIVATION: from axiom/postulate]` — follows from ODTOE axioms/postulates via explicit derivation chain
  - `% [HYPOTHESIS: testable via X]` — testable prediction, not yet verified
  - `% [OPEN: reason]` — open question, feeds into spiral gap (~2%)
- Markers are LaTeX comments — they do NOT appear in the compiled PDF but are auditable in .tex source
- Validator MUST audit marker accuracy: a claim tagged [FACT] must have a citation or recomputation artifact; a claim tagged [DERIVATION] must have explicit steps; [HYPOTHESIS] must specify what would verify it
- Unmarked substantive claims = YELLOW on A_sigma (missing epistemic classification)
- A claim tagged [DERIVATION] that is actually a post-hoc fit = Check 4 violation (L-23 enforcement)
- Source: Rybakov Approach integration (RT-1 analysis 2026-04-04)

## EraDev Role Mapping for Articles

| Role | Article Task | Checks Owned |
|------|-------------|-------------|
| Visionary | Thesis, structure, place in ODTOE corpus, strategic significance | Check 4 (no fitting — strategic integrity) |
| Analyst | Section decomposition, formula inventory, source requirements, dependencies | Check 1 (bibliography), Check 2 (formulas — decompose), Check 5 (AI markers) |
| Builder | Write .tex, formulas, compile PDF/DOCX/MD — Check-First BEFORE writing | Check 3 (50-digit precision), Check 8 (evidence markers during writing) |
| Validator | Post-generation verification of ALL 8 checks, formula recomputation | ALL checks (final gate) |
| Coherencer | Consistency with ODTOE corpus, terminology alignment, bilingual parity | Check 6 (plagiarism), Check 7 (consistency), BL-19 (bilingual sync) |

## Working Directory
`/Users/antonpankratov/Downloads/odtoe/`

## Reference Files
- Format gold standard: `ODTOE_article.tex` (preamble, title block, section structure)
- Unicode reference: `ODTOE_phi_fractality.tex` (correct Unicode usage throughout)
- Existing corpus: 160+ articles in `.tex` format
