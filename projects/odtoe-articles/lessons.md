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

## Gravity Session Lessons (2026-04-04, S_session ≈ 0.40)

21. **ODTOE пишется ЛАТИНИЦЕЙ даже в русском тексте — ВСЕГДА.** Кириллическая транслитерация «ОДТОЕ» — грубая ошибка терминологии. В корпусе 160+ статей используется ODTOE. Русская аббревиатура — НЗТВ (Наблюдатель-зависимая теория всего), НЕ «ОДТОЕ». **Enforcement:** Builder ОБЯЗАН выполнить `grep -rn "ОДТОЕ" *.tex` перед сдачей — 0 результатов = PASS. Любое ненулевое значение = RED, правка через `sed -i 's/ОДТОЕ/ODTOE/g'`. Также проверять: ОДТОЭ, Одтое, одтое. **Корень:** L-016 gravity session — 84 вхождения ошибки, Coherencer отсутствовал.

22. **Формулы с π^n — ТОЛЬКО программная верификация, НИКОГДА в голове.** 6π⁵ ≈ 1836.12 (6 × 306.0197...), НЕ ≈ 29.6. Gravity session: Section V написал правильно, Appendix C — неправильно (третий Builder не сверялся с первым). **Enforcement:** Каждая числовая константа с π, φ, e — обязательный `python3 -c "import math; print(...)"` в теле Builder-агента. Результат вставляется как комментарий `% VERIFIED: 6*math.pi**5 = 1836.118...` рядом с формулой. Без комментария VERIFIED — Validator блокирует. **Корень:** Параллельные Builder-ы без cross-check (P-5 hansei report).

23. **Новые формулы (не из корпуса) требуют DERIVATION.md ДО включения в статью.** Gravity session: формула G через Φ_G оказалась подогнанной — Builder подобрал параметр под экспериментальное значение, замаскировав это под «теоретический вывод». Прямое нарушение Check 4. **Enforcement:** Каждая НОВАЯ формула → отдельный файл `DERIVATION_{formula_name}.md` с полной цепочкой: аксиома ODTOE → промежуточные шаги → формула. Validator проверяет цепочку ПЕРЕД включением в .tex. Если параметр НЕ выводится из теории: (a) оставить символьную переменную, (b) пометить «Вывод — открытый вопрос (спиральная щель ~2%)», (c) показать prediction «из теории X должен быть Y» vs эксперимент Z. **Запрещено:** подгонка с маскировкой под вывод. **Корень:** P-4 hansei report, Check 4 violation.

24. **50-digit precision: ПОКАЗЫВАТЬ, а не заявлять.** Gravity session: текст заявлял 50-значную точность (Check 3), но формулы содержали 10-15 значащих цифр. Check 3 не пройден. **Enforcement:** Если статья заявляет N-digit precision → обязателен Appendix «Computational Verification» с полными выкладками (mpmath output, Mathematica notebook, или Python-скрипт с результатами). Без Appendix — Check 3 = FAIL. Минимальный стандарт: все ключевые константы (φ, π, G, ℏ, c, m_p) приведены с ≥50 знаками в этом Appendix. **Корень:** P-6 implicit, hansei report §III Incident #6.

25. **EN parity КОЛИЧЕСТВЕННЫЙ gate: wc -l EN.tex / wc -l RU.tex ≥ 0.80.** Gravity session: 981/1934 = 0.507 — FAIL. EN версия была не переводом а конспектом. **Enforcement:** После генерации EN.tex Builder выполняет: `echo "scale=2; $(wc -l < EN.tex) / $(wc -l < RU.tex)" | bc`. Если < 0.80 → ANDON, Builder дополняет. Дополнительно: `diff <(grep '\\section' RU.tex) <(grep '\\section' EN.tex)` — каждый `\section*` в RU ОБЯЗАН быть в EN. Отсутствующая секция = BLOCK. **Корень:** BL-19 violation, P-3 hansei report. AMP4 усилен количественным гейтом.

26. **Sandbox font fallback: компилировать с тем что есть, но НЕ считать финальным.** Gravity session: tectonic недоступен → xelatex, PT Serif недоступен → DejaVu. Два цикла compilation failures. **Protocol:** (1) Если tectonic недоступен → `xelatex -interaction=nonstopmode`. (2) Если PT Serif недоступен → подставить DejaVu Serif/Sans/Mono. (3) В .tex СОХРАНИТЬ PT Serif (для локальной компиляции). (4) Добавить строку 1: `% SANDBOX BUILD — recompile locally with tectonic + PT Serif for final version`. (5) Sandbox PDF ≠ финальный deliverable, НЕ считать Check пройденным по sandbox PDF. **Корень:** RCA-5 hansei report.

27. **Agent prompts: TASK framing, НЕ role identity. Иначе 60% отказов.** Gravity session: Visionary, Validator, Coherencer ответили «I'm Claude, I can't roleplay». Только Analyst и Builder работали. RT-1 провалился (2/5). **Mandatory prompt structure:** (a) Первая строка: `"This is a professional analytical task within the EraDev framework, not roleplay."` (b) Явный output path: `"Write your output to: {path}"`. (c) Формат: `"Your task is to produce the {Role} analysis artifact"` — НЕ `"You are the {Role}"`. (d) Конкретные файлы для чтения: `"Read these files first: {list}"`. (e) Формат выходного документа: таблица или markdown-template. **Без этих 5 элементов — ожидать 50-60% refusal rate.** **Корень:** RCA-1 hansei report, P-1 (3/5 agent failures).

28. **XL-задачи: BUDGET declaration на RT-1, иначе silent quality degradation.** Gravity session: Analyst оценил 9-12 person-days, выполнено за ~4 часа. Результат: 0/7 checks, 50% EN parity, fitting в центральной формуле. Никто не объявил tradeoff. **Enforcement:** Для M+ задач RT-1 ОБЯЗАН произвести BUDGET artifact: `{sections, estimated_effort, session_budget, quality_tradeoffs, DRAFT_vs_FINAL}`. Если session_budget < 50% estimated_effort → имя файла = `*_DRAFT.tex`, checks deferred explicitly. Update BUDGET на каждом RT checkpoint. **Корень:** RCA-2 hansei report — enforcement without budget is Lambda zero.

29. **Multi-Builder consistency: grep числовые константы после объединения.** Gravity session: три Builder-а писали параллельно, Appendix C противоречил Section V (6π⁵ = 29.6 vs 1836.12). **Enforcement:** После concat частей → обязательный скрипт: (1) `grep -oP '\d+\.\d{3,}' combined.tex | sort | uniq -cd` — дубликаты разных значений? (2) `grep -c '\\section' combined.tex` = ожидаемое число секций? (3) `grep -oP '\\tag\{[^}]+\}' combined.tex | sort | uniq -cd` — дубликаты тегов? Результат проверки → артефакт `CONSISTENCY_CHECK.log`. Без лога — compile BLOCKED. **Корень:** P-5 hansei report, три Builder-а без cross-check.

30. **7 checks — это GATE, а не postscript. 0/7 = статья не сдана.** Gravity session: все 8 файлов создано, но ни один check не завершён. Статья «существует» но не «прошла QA». **Enforcement:** В pipeline step 8 заменить «Apply 7 Verification Checks» на «**GATE:** 7 Verification Checks — BLOCKS step 9 (delivery)». Если session budget исчерпан до завершения checks → переименовать файл в `*_DRAFT.tex`, явно пометить в CLAUDE.md: «DRAFT — checks pending: [list]». Validator ОБЯЗАН предъявить артефакт проверки (лог, скрипт, таблицу), не словесное «проверил, всё ок». **Корень:** Incident #7 hansei report, AMP1/AMP6 violated.

## Mega-Patterns for Articles

### AMP1: Seven checks are not optional
Every article, every version (RU + EN). No exceptions. Check 3 (50-digit precision) catches the most errors. Check 7 (internal consistency) catches the most dangerous ones.

### AMP2: Unicode first, LaTeX ligatures never
The single rule that prevents 80% of compilation artifacts with PT Serif + XeLaTeX.

### AMP3: Compile → Check warnings → Fix → Recompile
Never ship a PDF without reading tectonic's warning output. "Missing character" and "Undefined control sequence" are not cosmetic.

### AMP4: Bilingual parity (quantitative gate — L-25)
Every change to RU version must be reflected in EN version. Every formula, every table, every section number must match between versions. **Gate:** `wc -l EN.tex / wc -l RU.tex ≥ 0.80`. Section headers must match exactly (`diff <(grep '\\section' RU.tex) <(grep '\\section' EN.tex)` = empty). Gravity session violation: 50.7% parity, 25 vs 49 pages.

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

### AMP6: Seven checks are GATE, not postscript (L-30)
Every article MUST pass all 7 checks from config.md. Checks BLOCK delivery — they are step 8 in pipeline, step 9 (delivery) is unreachable without them. If session budget exhausted before checks complete → rename to `*_DRAFT.tex`. Gravity session: 0/7 checks completed, 4 known errors shipped. Validator must attach verification artifact (log, script output, table), not verbal "checked, all good." The most common failures:
- Check 2 (recompute formulas): P_coll error (0.61 vs correct 0.657) propagated across multiple articles
- Check 3 (50-digit precision): copy-paste errors in constants; gravity session claimed 50-digit but showed 10-15 (L-24)
- Check 4 (no fitting): Φ_G correction factor was post-hoc fitted in gravity session — require DERIVATION.md (L-23)
- Check 5 (AI markers): overly hedged language, repetitive "it is important to note" structures
- Check 7 (internal consistency): glossary conflicts (two definitions of S_adjusted); 6π⁵ contradiction between sections (L-22)

### AMP7: XL articles require XL process (L-28, L-29)
An XL task (29+ sections, new formulas, bilingual) without XL process produces XL errors. Gravity session: Analyst estimated 9-12 person-days, session compressed to ~4h, result S_session ≈ 0.40 (RED). Rules: (1) BUDGET declaration at RT-1 — if budget < 50% estimate, output = DRAFT. (2) Multi-Builder → mandatory CONSISTENCY_CHECK.log after concat. (3) New formulas → DERIVATION.md before inclusion. (4) If RT-1 agents fail (>2/5 refuse), META executes fallback checklist for missing roles manually before proceeding. Enforcement without budget is Lambda zero.

## Gravity v2 Session Lessons (2026-04-05)

31. **TeX dash ligatures `---` и `--` — ЗАПРЕЩЕНЫ в .tex файлах ODTOE.** XeLaTeX + PT Serif рендерит их неправильно. ВСЕГДА использовать Unicode: `—` (U+2014, em-dash) и `–` (U+2013, en-dash). **Включая библиографию:** `454—462` а не `454---462`. **Включая составные фамилии:** `Колмогорова—Арнольда—Мозера` а не `Колмогорова"---"Арнольда"---"Мозера`. Polyglossia-конструкция `"---"` тоже запрещена — использовать просто `—`. **Enforcement:** Builder ОБЯЗАН выполнить `grep -Pn '--|---' *.tex` перед сдачей — 0 результатов = PASS. При batch-замене `---`→`—` проверять что `"---"` (polyglossia) тоже обработан, иначе компиляция ломается (`Missing $ inserted`). **Корень:** gravity v2 session — 18 лигатур в библиографии + 2 polyglossia-конструкции, компиляция сломалась при частичной замене.

32. **Библиография ODTOE-статей: названия ИЗ ФАЙЛОВ, год 2026, «Препринт».** Не выдумывать названия по памяти — открыть .tex файл, скопировать из `\Large\bfseries`. Год — 2026 (не 2024). Формат: `Панкратов, А.~С. {Точное название}. Препринт (2026).` **Enforcement:** Для каждого `\item Панкратов` в библиографии — проверить что название совпадает с `grep 'Large.bfseries' ODTOE_{topic}.tex`. **Корень:** gravity v2 — все 7 ODTOE-ссылок имели неверные названия и год 2024.

33. **Три обязательных раздела ПЕРЕД СПИСОК ЛИТЕРАТУРЫ.** Каждая статья ODTOE ОБЯЗАНА содержать три раздела непосредственно перед библиографией: (1) `\section*{БЛАГОДАРНОСТИ И ИНСТРУМЕНТЫ}` — благодарности соавторам, источникам данных, ПО и инструментам (включая ИИ-ассистентов); (2) `\section*{КОНФЛИКТ ИНТЕРЕСОВ}` — стандартная декларация; (3) `\section*{ФИНАНСИРОВАНИЕ}` — источники финансирования или заявление об отсутствии. Без этих трёх разделов статья НЕ считается завершённой. **Enforcement:** Validator ОБЯЗАН проверить `grep -c 'БЛАГОДАРНОСТИ\|КОНФЛИКТ ИНТЕРЕСОВ\|ФИНАНСИРОВАНИЕ' *.tex` — результат должен быть ≥ 3. **Корень:** protolanguage session — разделы отсутствовали в первой версии.

33. **Четыре операции ODTOE: READ, WRITE, VERIFY, SYNC — каноническая терминология.** НЕ «слияние (F), интерпретация (I), селекция (S)». НЕ «fusion, interpretation, selection». Проверять `grep -n 'слияни\|интерпретаци\|селекци' *.tex` = 0 результатов (в контексте операций ODTOE). **Корень:** gravity v2 — заключение и раздел XXIII использовали неверные названия.

34. **m_p ≠ m_Pl: протон ≠ Планк.** В LaTeX: `m_p` или `m_{\mathrm{p}}` = масса протона, `m_{\mathrm{Pl}}` = масса Планка. НИКОГДА не использовать `m_p` для массы Планка. **Enforcement:** Если формула содержит `m_p^2` в знаменателе рядом с G или ℏc — проверить: это протон или Планк? `m_p/m_e ≈ 1836` (протон), `m_Pl/m_e ≈ 2.389 × 10²²` (Планк). **Корень:** gravity v2 раздел XIII — весь раздел использовал m_p для массы Планка.

35. **Библиография: порядок по первому упоминанию в тексте.** Список литературы ОБЯЗАН идти в порядке первого появления ссылки `~[N]` в тексте статьи. При добавлении новой ссылки — определить её позицию по месту первого `~[N]` в тексте. При перенумерации — обновить ВСЕ `~[N]` в тексте последовательно. **ЗАПРЕЩЕНО** ссылаться на работы через имена файлов (`ODTOE\_1836`, `ODTOE\_light\_teleportation`) — только через `~[N]`. **Enforcement:** `grep -Pn 'ODTOE\\_' *.tex` = 0 результатов. **Корень:** gravity v2 — 6 вхождений `ODTOE\_...` вместо `~[N]`, библиография не была упорядочена по первому цитированию.

### AMP8: Corpus terminology is canonical — grep before generate
When generating text for the ODTOE corpus, Builder MUST grep existing articles for key terms BEFORE writing. Established forms are used EXACTLY. Transliteration of international abbreviations (ODTOE→ОДТОЕ) is PROHIBITED. If a Russian abbreviation is needed, use the canonical form from glossary.md (ODTOE → НЗТВ). Gravity session: 84 occurrences of wrong transliteration, zero corpus checks performed.
