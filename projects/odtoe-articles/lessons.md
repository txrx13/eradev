# ODTOE Articles -- Project Lessons

## LaTeX Compilation Lessons

1. **TeX ligatures don't render with PT Serif in XeLaTeX.** `<<` `>>` `---` `--` show as literal characters or crosses. ALWAYS use Unicode: `«»` `—` `–`. This was the #1 recurring bug across all articles.

2. **\d{h} (combining dot below, U+0323) not in PT Serif Italic.** Egyptological transliteration causes crosses in PDF. Use plain ASCII transliteration (ankh, heka) instead of `\={\i}n\d{h}`.

3. **\cmrsideswitch undefined in longtable with polyglossia + fontspec.** polyglossia tries to invoke \cmrsideswitch when processing table rows with fontspec fonts. Fix: `\providecommand{\cmrsideswitch}{}` in preamble. Pre-apply to ALL articles.

4. **longtable >{\raggedright}p{...} causes compilation errors.** Use plain `p{...}` column specs only.

5. **Overfull \hbox warnings are cosmetic only.** Do not prevent compilation. Accept as-is unless extreme (>100pt).

## Translation Lessons (RU → EN)

6. **EN version: swap language settings.** `\setmainlanguage{english}`, `\setotherlanguage{russian}`. Remove `\begin{english}...\end{english}` wrappers. Add `\begin{russian}...\end{russian}` around Russian-only text (abstract, keywords).

7. **Decimal dots in EN, decimal commas in RU.** `0.5` not `0,5` in EN. `0{,}5` in RU LaTeX for proper spacing.

8. **Bibliography: translate Russian entries, keep English as-is.** Remove `\begin{english}` wrappers from EN bibliography.

## Markdown Conversion Lessons

9. **pandoc default markdown produces :::center, {#id .class}, <div> tags.** Use custom Python converter (tex2md.py) instead. Output: clean GFM without HTML artifacts.

10. **Curly braces from LaTeX leak into markdown.** Multi-pass cleanup needed: `\textcolor{}{}`, `\fontsize{}{}`, `\hat{}`, `\text{}` outside math. The fix_md.py script handles this.

11. **Bibliography must be numbered (1. 2. 3.), not bulleted (- - -).** Convert `- ` to `N. ` in СПИСОК ЛИТЕРАТУРЫ / REFERENCES sections.

12. **DOI should be clickable links.** Format: `DOI: [10.xxxx/yyyy](https://doi.org/10.xxxx/yyyy)`.

13. **Every .md file must start with # heading.** Many converted files start with plain text title. Prepend `# ` to first line.

## Content Quality Lessons

14. **P_coll at B=0.3, n=3, k=1 = 0.657, NOT 0.61.** This error was in eradev_old and propagated to articles. Always recompute, never copy from other documents.

15. **50-digit constants must be verified independently.** Do not trust copy-paste from previous articles. Recompute φ, π, (π−3)² each time.

16. **"без подгонок" (no fitting) is the hardest check.** Every formula parameter needs a derivation chain. If a parameter appears without justification, the article fails Check 4.

## Process Lessons

17. **Compile both RU and EN before declaring done.** Several times EN version was created but not compiled, leaving errors undiscovered.

18. **Generate DOCX after fixing all LaTeX issues.** DOCX inherits LaTeX problems (broken \tag{}, \notag in align environments). Pre-process with sed before pandoc.

19. **Check for Missing character warnings in tectonic output.** These indicate glyphs not in PT Serif. Every "Missing character" = a cross/box in the PDF.

20. **Combining 4+ source documents into one article requires image management.** Copy PNG/JPG files to main directory before \includegraphics. Paths with Unicode characters (e.g., "ODTOE + Pi + Atom + Нейтрино/") cause issues.

## Mega-Patterns for Articles

### AMP1: Seven checks are not optional
Every article, every version (RU + EN). No exceptions. Check 3 (50-digit precision) catches the most errors. Check 7 (internal consistency) catches the most dangerous ones.

### AMP2: Unicode first, LaTeX ligatures never
The single rule that prevents 80% of compilation artifacts with PT Serif + XeLaTeX.

### AMP3: Compile → Check warnings → Fix → Recompile
Never ship a PDF without reading tectonic's warning output. "Missing character" and "Undefined control sequence" are not cosmetic.

### AMP4: Bilingual parity
Every change to RU version must be reflected in EN version. Every formula, every table, every section number must match between versions.

### AMP5: Match ODTOE_article.tex format EXACTLY
The reference format (ODTOE_article.tex) defines the gold standard. Key rules discovered through format audit:
- Preamble: comments between package groups (% Fonts, % Language, % Math, etc.)
- Title: {\Large\bfseries TITLE}\\[0.3em] then {\large (EN translation)} then {\small\itshape subtitle}
- UDC: \noindent\textbf{УДК ...} OUTSIDE the center block, after \vspace{1em}
- Abstract: \section*{АННОТАЦИЯ} then \noindent\textbf{Ключевые слова:...} (keywords on same line as label)
- EN Abstract: \section*{ABSTRACT} plain (no \begin{english} wrapper on section header)
- Sections: \section*{I. НАЗВАНИЕ} with Roman numerals in the section name
- NO \hrule, NO \bigskip\hrule\bigskip between sections
- Formulas: \begin{equation*}...\tag{N.M}\end{equation*} (NOT $$...$$)
- Bibliography: \begin{enumerate}\item...\end{enumerate} with [N] references in text
- Bibliography format: ГОСТ for RU sources, standard for EN sources
- NO \begin{english}...\end{english} wrappers on bibliography items — use inline

### AMP6: Seven checks are non-negotiable enforcement
Every article MUST pass all 7 checks from config.md. The most common failures:
- Check 2 (recompute formulas): P_coll error (0.61 vs correct 0.657) propagated across multiple articles
- Check 3 (50-digit precision): copy-paste errors in constants
- Check 5 (AI markers): overly hedged language, repetitive "it is important to note" structures
- Check 7 (internal consistency): glossary conflicts (two definitions of S_adjusted)
