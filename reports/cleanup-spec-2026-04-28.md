# Article Cleanup Spec — 2026-04-28

> **Trigger**: operator three critiques on `ODTOE_hyletic_extension` (Validator-RT-2 false-positive PASS B=0.946), plus operator directive 2026-04-28: "нужно еще проверить все статьи за 27 апреля на эту консистентность и сразу запустить все исправления".
> **Authorization**: operator explicit — "сразу запустить все исправления".
> **Scope**: 4 known files (hyletic_extension RU+EN + dynamic_attractor RU+EN) + corpus-wide April-27 discovery sweep.
> **Locked decisions** (META synthesis from RT-1 V/A/B/Val/C, Auto mode default-pick on operator-implicit):

## Locked decisions

### Q1 — Bibliography restructure strategy: **Strategy A (Visionary)**

Insert new bibliography entries at L-35 first-citation position; minimal shift of existing entries.

For `ODTOE_hyletic_extension.{tex,EN.tex}`:
- **Insert** `Bugaev N.V. (1893). Foundations of Evolutionary Monadology // Voprosy Filosofii i Psikhologii. Kn. 17. P. 26–44.` at first-citation position (line 87 RU / 90 EN — currently overloaded onto `~[14, цит. по §I]`).
- **Insert** `Pankratov A.S. The Unified Operator of ODTOE. Preprint (2026).` at first-citation position (line 100 RU / 103 EN — currently `~[11]` collision with Maldacena).
- **Insert** `Pankratov A.S. Operator-Dependent Framework for System Coherence (ODTOE). Preprint (2026).` at first-citation position (line 181 RU / 184 EN — currently `~[1\textsubscript{ODTOE}]` placeholder).
- **Delete** orphan entry [4] DeWitt-Graham (never cited in body).
- Subsequent entries renumber +1 / +2 / +3 / −1 per insertion/deletion as appropriate.
- Body cite remap: `~[11, §IV.x]` (unified_operator semantic) → keep at new [11]; original `~[11]` Maldacena → shift to next available index. `~[1_ODTOE]` → new ODTOE_article index. `~[14, цит. по §I]` etc → new Bugaev index.

Final hyletic biblio entry count: **22** (20 original − 1 DeWitt + 3 inserted).

For `ODTOE_dynamic_attractor.{tex,EN.tex}`:
- **No biblio restructure**. Only drop `[Slug: \texttt{ODTOE\_*}]` suffixes from 5 Pankratov entries (lines 406, 407, 410, 411, 412 RU / 407, 408, 411, 412, 413 EN).

### Q2 — DeWitt-Graham [4]: **DELETE** (orphan, decorative; consensus Analyst + Builder).

### Q3 — DERIVATION cross-refs: **option (c) — drop with body sketch retention**

For each `\texttt{DERIVATION\_hyletic\_extension.md} §X` body reference (6 RU + 6 EN sites at lines 257/260, 288/291, 337/340, 354/357, 489/492, 593/596):
- Drop the `\texttt{DERIVATION_*}` filename slug entirely.
- Keep the existing in-body proof sketch / Lemma statement (proofs are NOT removed; Lemma definitions stay).
- Where the body sentence reads "Полное доказательство — в \texttt{DERIVATION...md} §X", replace with one of:
  - "Полное доказательство сводится к композиции лемм L1–L3" (if the Lemmas are stated above)
  - "Доказательство опирается на стандартные приёмы (см. лемму L1, замечание~II.0)" (generic gloss)
  - drop the sentence entirely if the proof sketch in body is self-contained
- Do NOT add `\appendix` block in this cleanup pass (out of scope for "сразу" directive; reserve for separate task if operator requests).

## Per-file edit specs

### File 1 — `/Users/antonpankratov/Downloads/odtoe/ODTOE_hyletic_extension.tex` (RU)

**Class A1** — filename slug refs in body → `~[N]` cites (after biblio rebuild). Lines:
- 58 (subtitle): `\texttt{ODTOE\_dynamic\_attractor}` → `статьи о динамическом аттракторе`
- 71, 71, 78, 78, 96, 100, 100, 100, 103, 119, 194, 197, 257, 288, 309, 337, 354, 392, 475 (heading), 477 (heading), 480, 484, 489, 497, 566 (heading), 569, 579, 584, 593: each `\texttt{ODTOE\_*}` or `\texttt{DERIVATION\_*}` → bare `~[N]` cite or section reference
- 388 (subsection title): drop `(mpmath dps$=$60)` parenthetical
- 392: `\texttt{/tmp/hyletic\_v6\_verify.py}` → drop, replace with "(скрипт верификации, 60 значащих цифр)"

**Class A2** — bibliography `[Slug: \texttt{...}]` annotations. Lines 635, 637, 638, 640: drop `[Slug: \texttt{...}]` suffix from each Pankratov entry.

**Class B** — internal-document voice + LaTeX scaffolding:
- Line 89: drop `% [FACT: Bolotova archive 2026-04-27 ...]`
- Line 91: rewrite paragraph — drop "В апреле 2026 года в архиве Bolotova появились" + drop inline metadata `(Вопросы философии, № 8, С. 168–175, ISSN 0042-8744)`. Replace with:
  ```
  В.~Б.~Кудрин в работах~[N_kudrin_2005, N_kudrin_2026] формулирует следующие центральные тезисы: (i)... (ii)... (iii)... (iv)...
  ```
  (where N_kudrin_* are bibliography indices post-rebuild)
- Line 106: drop "представлены ... в виде skeleton stubs с метками \texttt{[OPEN: Session~2/3 deferred]} ... согласно бюджету~[L-28, L-30]" — replace with brief structural overview without project-management vocabulary
- Line 194: drop "META D4" tag, drop "(проверено grep по \texttt{ODTOE\_dynamic\_attractor.tex}; см. также комментарий в \texttt{DERIVATION\_hyletic\_extension.md} §2~D1)" parenthetical, rewrite remark heading to "Замечание о соглашении по $\mu_B$"
- Line 197: drop "META D5" tag, rewrite to "Замечание о $S_{\mathrm{rec}}$ vs $S_{\min}$"
- All `\textbf{Status:} OPEN` lines (564, 569, 574, 579, 584): replace with "Полное рассмотрение/доказательство выходит за рамки настоящей работы."
- All ~70 `% [FACT:|DERIVATION:|HYPOTHESIS:|OPEN:]` LaTeX scaffolding comments: DELETE every line matching grep `^%\s*\[(FACT|DERIVATION|HYPOTHESIS|OPEN):`

**Class C1** — body-inline metadata leak (separate from above Class B paragraph rewrite):
- Line 144: drop `(Annals of Mathematics 41, 1940, С.~394–423; DOI: 10.2307/1969012)` after Chevalley `~[9]`
- Line 154: drop `(Fortschritte der Physik 61, 2013, С.~781–811; arXiv:1306.0533)` after Maldacena `~[N_maldacena_new]`
- Line 503: drop `(Cool horizons for entangled black holes, Fortschritte der Physik 61, 2013, arXiv:1306.0533)` after Maldacena
- Body should retain `~[N]` only; metadata lives in bibliography entry.

**Class C — biblio restructure** (Strategy A, see Locked Q1):
- Insert 3 new entries at first-citation positions
- Delete orphan [4]
- Renumber as needed
- Body cite remap per Strategy A

**Class C7** — heading-level slug exposures:
- Line 475: `\section*{VII. ГОЛОГРАММА-ПАМЯТЬ: ЗАКРЫТИЕ §VII.1 \texttt{ODTOE\_dynamic\_attractor}}` → `\section*{VII. ГОЛОГРАММА-ПАМЯТЬ: ЗАКРЫТИЕ ОТКРЫТОЙ ЗАДАЧИ §VII.1 РАБОТЫ~[N_dyn_attr]}`
- Line 477: `\subsection*{VII.1. Открытая задача §VII.1 \texttt{dynamic\_attractor}}` → `\subsection*{VII.1. Открытая задача §VII.1 предшествующей работы}`
- Line 566: `\subsection*{IX.2. Онтологический коллапс при $B \to 0$ (§VII.3 \texttt{dynamic\_attractor})}` → `\subsection*{IX.2. Онтологический коллапс при $B \to 0$ (§VII.3 работы~[N_dyn_attr])}`

### File 2 — `/Users/antonpankratov/Downloads/odtoe/ODTOE_hyletic_extension_EN.tex` (EN)

Parallel structure to File 1 with English prose. All edits mirror File 1 in EN. Particular attention to `\begin{russian}...\end{russian}` wrappers preservation around Cyrillic content.

**Cite-key [11] mismatch fix** (Strategy A):
- Body cites `~[11, §IV.4]` etc at lines 103, 211, 215, 220, 229, 284 — keep at [11], where post-rebuild [11] = `unified_operator` (newly inserted)
- Body cites `~[11]` for Maldacena at lines 157, 507 — change to new Maldacena index (post-shift)

### File 3 — `/Users/antonpankratov/Downloads/odtoe/ODTOE_dynamic_attractor.tex` (RU)

Light cleanup, 8 edits only:
- Drop `% [DERIVATION: ...]` at line 131
- Drop `% [HYPOTHESIS: ...]` at line 227
- Drop `% [FACT: ...]` at line 248
- Drop `[Slug: \texttt{ODTOE\_article}]` from line 406
- Drop `[Slug: \texttt{ODTOE\_collective\_observer}]` from line 407
- Drop `[Slug: \texttt{ODTOE\_love\_eternity}]` from line 410
- Drop `[Slug: \texttt{ODTOE\_unified\_operator}]` from line 411
- Drop `[Slug: \texttt{ODTOE\_infinite\_recursion\_unified}]` from line 412

No biblio renumber. Body cites are stable.

### File 4 — `/Users/antonpankratov/Downloads/odtoe/ODTOE_dynamic_attractor_EN.tex` (EN)

Parallel to File 3. Lines 132 (comment), 228 (comment), 249 (comment), 407, 408, 411, 412, 413 (slug suffixes).

## L-50 4-tuple post-edit verification (Builder self-check)

After applying edits, EACH Builder MUST run all 12 gates and produce 4-tuple evidence per gate:

```yaml
- name: G-35a
  command: grep -nP '\\texttt\{(ODTOE|ESSAY|ROADMAP|DERIVATION)[\\\_]' <FILE>
  stdout_excerpt: "0 hits"
  verdict: PASS — 0 hits

- name: G-35b
  command: |
    LAST_BIB_START=$(grep -n '^\\begin{enumerate}$' <FILE> | tail -1 | cut -d: -f1)
    LAST_BIB_END=$(grep -n '^\\end{enumerate}$' <FILE> | tail -1 | cut -d: -f1)
    awk -v s=$LAST_BIB_START -v e=$LAST_BIB_END 'NR>=s && NR<=e' <FILE> | grep -nP '\[Slug:\s*\\texttt'
  stdout_excerpt: "0 hits"
  verdict: PASS — 0 hits

# G-35c, G-48a..e, G-49a..d each with their own command + stdout + verdict per Validator's RT-1 design
```

ALL 12 gates MUST return 0 hits per file = PASS. ANY gate FAIL = Builder re-edit cycle (BL-3 awareness: max 2 cycles before escalation).

## BL-19 8-file regen (post-Builder + Validator PASS)

After Builder + Validator PASS for each .tex:
1. `tectonic <file>.tex` → `<file>.pdf`
2. `pandoc -f latex -t docx <file>.tex -o <file>.docx`
3. `python3 tex2md.py <file>.tex` → `<file>.md` (NOT pandoc per L-41)
4. Mirror to `для сайта/` if Inv 17 requires (operator decides)

## Commit plan

After all 4 articles cleaned + Validator-RT-2 PASS + BL-19 regen:
- Root repo: commit cleaned `.tex/.pdf/.docx/.md` × 4 articles × 2 langs = 16 files (or 32 if `для сайта/` mirror)
- Eradev repo: commit `eradev/reports/cleanup-spec-2026-04-28.md` + `eradev/reports/hansei-meta-2026-04-27-three-critiques.md` + `eradev/reports/eradev-improvement-recommendations-2026-04-27.md`
- Root repo: commit `projects/odtoe-articles/lessons.md` (L-43..L-50 + L-35 amendment)

Two commits, two repos.

---

> Authored: META-Orchestrator, 2026-04-28, after RT-1 V/A/B/Val/C synthesis with locked Q1/Q2/Q3 decisions per operator's "сразу запустить все исправления" directive.
