# Domain Skin: article

> Type: article
> Modality: research
> Applies to projects where `config.md` contains `domain.type: article`
> Parent BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)
> Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md
> Last updated: 2026-04-11
> Upstream roles: roles/{role}_EN.md
> Upstream math: eradev.md Section II.1 (B_research weights)
> Live reference project: projects/odtoe-articles/

---

## Purpose / When META Loads This Skin

META loads this skin when a project's `config.md` declares:
- `domain.type: article`
- `domain.skin: templates/domain_skin.article.md`

When loaded, the skin is passed to every spawned role agent in addition to the base role file `roles/{role}_EN.md`. It does NOT replace the role file — it provides a vocabulary map, focus overrides, verification expansion, RT adjustments, examples, and an inherited-vs-overridden BL table specific to scientific-article work. The skin targets theorem/proof/derivation articles (ODTOE-style corpus work), NOT review papers, position papers, or narrative essays — see "Known Out-of-Scope" below.

---

## Vocabulary Mapping

This skin overrides the abstract role-file vocabulary for article tasks. When an agent sees these generic terms in `roles/{role}_EN.md`, it reads them as the domain-specific meanings below.

| # | Abstract term (role file / BL) | Article meaning | Where used (evidence) |
|---|---|---|---|
| 1 | **artifact** | section of an article, or a full `.tex` source file, or a compiled PDF, or a theorem block with its proof | `analyst_EN.md` line 7 ("An 'artifact' is any discrete element..."); `builder_EN.md` line 7 |
| 2 | **function** | claim, theorem, lemma, or labelled equation (addressable unit) | Analogous to `builder_EN.md` "the smallest addressable unit of code" |
| 3 | **module** | section (`\section*{I. NAME}`) or subsection (`\subsection*{I.1. name}`) | `odtoe-articles/config.md` lines 195-200 |
| 4 | **compile** | typeset / render PDF (`tectonic FILE.tex`) | `odtoe-articles/config.md` line 15 |
| 5 | **test / tests pass** | cite_check passes + recomputation matches + 7 verification checks PASS | `odtoe-articles/config.md` lines 201-281 (all 7 checks) |
| 6 | **verify** | cite_check (bibliography resolves, DOIs valid, internal refs resolve, factual consistency) | `analyst_EN.md` line 24; expanded in Section 4 below |
| 7 | **validate** | run the 8 verification checks (Validator owns all 8 per `odtoe-articles/config.md` role mapping) | `validator_EN.md` line 7; `odtoe-articles/config.md` line 290 |
| 8 | **build** | produce the 8-file bilingual artifact set (.tex, .pdf, .docx, .md in RU+EN) | `odtoe-articles/config.md` lines 80-90 |
| 9 | **runtime** | reader time (how long a reader spends on the paper) — NOT a runtime check, but a blast-radius proxy | Builder's "blast radius" vocabulary; `builder_EN.md` Key Rules 4 |
| 10 | **spec / specification** | call for papers, journal scope, or the prior Analyst plan for the article | `analyst_EN.md` "Implementation Plan" output format |
| 11 | **feature / feature flag** | contribution / claim / new section added to the article | `builder_EN.md` Key Rules 6 ("Feature flags / staged rollouts = release event") |
| 12 | **API / API endpoint** | reference database entry (DOI, arXiv ID, bibliography entry pointing to an external resolvable identifier) | code-adapter `BL-22` ("PRE-FLIGHT Gate for External APIs") — article-equivalent is "PRE-FLIGHT bibliography resolution" |
| 13 | **bug** | unsupported claim / citation gap / factual error / unresolved cross-reference / DOI 404 | `validator_EN.md` line 20 ("B-diagnostics of defects") |
| 14 | **refactor** | restructure argument, reorder sections, rewrite a proof for clarity without changing result | `builder_EN.md` Key Rules 7 (analogous to protocol change) |
| 15 | **code review** | peer review (pre-submission reviewer read-through) | `visionary_EN.md` line 51 Example 2 |
| 16 | **PR / pull request** | submission to a journal, preprint upload to arXiv, or a proposed section added for RT review | `builder_EN.md` Decision-Point Checklist ("Before a tracked change is published") |
| 17 | **commit** | signed-off change to the `.tex` source with Jidoka gate passed | `odtoe-articles/config.md` line 106 ("Commit all 8 files together") |
| 18 | **deploy / push to prod** | submit to journal / publish to arXiv / hand to editor | Analogous to `builder_EN.md` Key Rules 1 ("VERIFY BEFORE ACT") |
| 19 | **production** | published version (post-peer-review, cannot be retracted without cost) | `validator_EN.md` Key Rules 4 ("Revert = postmortem") |
| 20 | **smoke test** | abstract read + TOC scan + render of first PDF page (sanity check before full render) | Analogous to `validator_EN.md` Key Rules 5 ("Stale output detection") |
| 21 | **glossary / canonical terms** | the 46-term ODTOE glossary — canonical terminology set that every article must align with | `odtoe-articles/config.md` line 48, line 265 |
| 22 | **symbol collision** | two corpus artifacts using the same LaTeX symbol (e.g., `\Lambda`) with different meanings | `analyst_EN.md` Example 2 |
| 23 | **numerical consistency / factual check** | C6 factual consistency across the article — every numerical claim (N, δB/B, Profile values, constants to 50 digits) must agree across abstract, body, tables, figure captions, and conclusion; Validator recomputes independently and cross-references all occurrences | body Section "Verification Protocol (cite_check expanded)" — C6 row in Section "The six cite_check checks"; didactic case = Example 3 ("Numerical inconsistency abstract vs table"); config.md Check 2 (full recomputation) and Check 7 (no internal contradictions) |

**Unified with `odtoe-articles/config.md` — CRITICAL note:**
The config.md contains an "EraDev Role Mapping for Articles" table (lines 283-290). That table assigns check ownership per role. The vocabulary table above is consistent with that mapping. If any agent detects a contradiction between this skin's Role Focus Overrides (Section below) and that table, **the config.md table WINS** and the agent must escalate to META before proceeding.

---

## Modal B-formula (research weights)

This skin pins `B_modality: research`. The article Builder/Validator/Coherencer use the research weights:

| Component | Weight | Rationale |
|---|---|---|
| F (Focus) | **0.30** | Literature scan + preamble/gold-standard read is the dominant gate — an article Builder who hasn't read the 3 nearest corpus neighbors produces drift. Second-dominant component. |
| E (Alignment) | **0.20** | Alignment to operator intent matters but is constrained by physical/logical correctness — you cannot be "aligned" with an incorrect theorem. Lowered relative to creative work. |
| (1-σ) (Consistency) | **0.35** | **Dominant.** A single logical inconsistency in a proof chain falsifies the entire result. Corpus consistency (glossary, symbols, cited formulas) is the load-bearing property. |
| Λ (Experience) | **0.15** | Lowest weight. Memory helps but a fresh corpus sweep can cold-start a new article; Λ is a facilitator, not a gate. |

**Rationale (from Phase 0.A Visionary Deliverable 1):** Scientific articles in the ODTOE corpus are theorem/proof/derivation work, not narrative. `odtoe-articles/config.md` line 20 explicitly declares `B_modality: research` and justifies: "article generation is theorem+proof work, not narrative." Check 2 in that config ("Every formula recomputed independently to verify accuracy") is a Consistency check; Check 1 ("Bibliography: every [N] reference ... DOI exists, verify publisher/year/volume/pages") is a Focus check. This B-weight profile is PINNED — it is not a placeholder.

**Variant clause (NOT for v9):** A review article or position paper would be closer to creative weighting because its load-bearing property is argument arc rather than proof chain. If such a project lands, it should create a second skin file (`templates/domain_skin.article_review.md`) with `B_modality: creative`. Deferred to v10.

---

## Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` **unchanged**. The skin adds DOMAIN-SPECIFIC focus anchors, artifact definitions, failure modes, and Jidoka specializations.

### Visionary (article focus)

- **FIRST attention anchor (A_F override):** Read the `thesis` and `abstract` of the proposed article. Read the corpus TOC (for ODTOE: `projects/odtoe-articles/config.md` "Reference Files" section + existing 160+ `.tex` files in the corpus). True North = *what scientific claim does this article add, and does the ODTOE corpus already cover it?*
- **Artifact definition:** The article's central claim + its placement in the corpus. Not the text, not the PDF — the *argument*. At RT-0 Visionary speaks at the level of "this article proves X using Y, which complements/contradicts article Z in the corpus."
- **Primary failure mode in article work:** Approving a thesis that duplicates or contradicts an existing corpus article WITHOUT explicit acknowledgment. This is the **"corpus collision"** failure. Mitigation: Visionary must enumerate the 3 nearest neighbors in the corpus before greenlighting the thesis.
- **Jidoka self-check (article specialization):**
  - Q1: "Is this claim NEW, or does corpus article N cover it already?"
  - Q2: "Is the thesis falsifiable in a checkable way (research paper AND-gate), or is it speculative (FAILS OOD — escalate to OOD Registry)?"
  - Q3: "Does the proposed section structure match the ODTOE corpus gold standard (`ODTOE_article.tex`)?"
- **Upstream reference:** `visionary_EN.md` Example 2 (Λ-dynamics section) already contains the article-domain flavor. The skin adds the *corpus-collision check* which is NOT in the base role file.

### Analyst (article focus)

- **FIRST attention anchor (A_F override):** Read the article's *prior Check-First pipeline output* (8 items from `odtoe-articles/config.md` lines 40-51). If Check-First has not been run, STOP — demand Check-First before proceeding. Then read the 3 nearest neighbor articles in the corpus for terminology + notation alignment (BL-29 enforcement for articles).
- **Artifact definition:** A section-level decomposition of the article: each section has a list of *claims*, each claim has a *source requirement* (which cite) and a *derivation requirement* (which prior result from the corpus or which postulate). The Analyst output is a table, not prose.
- **Primary failure mode in article work:** Skipping the Check-First gate because "the article is simple." This is BL-17 violation applied to articles. Mitigation: Check-First is STRUCTURALLY REQUIRED before any Analyst plan is produced; Analyst's Jidoka A_F score is 0.0 (ANDON) if Check-First was not read.
- **Jidoka self-check (article specialization):**
  - Q1: "Has the 8-item Check-First been completed? If NO → A_F=0.0 → Andon."
  - Q2: "For each claim in the plan, is the source requirement specified (DOI or corpus reference) or the derivation requirement specified (postulate chain)?"
  - Q3: "Are there resource conflicts with the existing corpus — same symbol with different meaning (the `\Lambda` collision pattern from `analyst_EN.md` Ex.2)?"
  - Q4: "Is the EN translation in the plan? (BL-19 enforcement — bilingual sync must be planned from Step 1, not added later.)"
- **Deliverable template (article-specific):**
  ```
  ## Article Plan (Analyst output for articles)
  Thesis: [one-sentence claim]
  Target corpus position: [which gap it fills]
  Sections: I. [name] | II. [name] | ...
  Per-section claims table:
    Section | Claim | Source/Derivation | Trust index (T1-T4) | Dependency
  Formula inventory: [list with 50-digit recomputation requirement]
  Bibliography deltas: [new entries with DOIs verified]
  Bilingual plan: [EN draft when — BEFORE RU compile or AFTER?]
  Check-First confirmation: [PASS/FAIL with item-by-item]
  Pipeline: Check-First → RU .tex → compile → EN .tex → compile → DOCX → MD → 7 checks → commit all 8 files
  Resource conflicts: [symbol collisions, section numbering, terminology drifts]
  System dependencies: [tectonic path, pandoc path, fonts, reference bib database]
  B-check: F=_ E=_ (1-σ)=_ Λ=_ → B=_
  ```

### Builder (article focus)

- **FIRST attention anchor (A_F override):** Read `ODTOE_article.tex` (gold-standard format — `odtoe-articles/config.md` line 296 names it). Read the 3 nearest corpus neighbor articles to extract terminology + notation (BL-29). Read the exact preamble from `odtoe-articles/config.md` lines 116-164 — it is the mandatory preamble for any ODTOE article. Do NOT start drafting prose until all three reads are complete. BL-17 + BL-21 are ACTIVE enforcement gates for article Builders.
- **Artifact definition:** All 8 bilingual files simultaneously. The artifact is NOT "an RU .tex file"; the artifact is the 8-file set `{RU,EN} × {.tex,.pdf,.docx,.md}`. Builder must NOT mark Done until all 8 exist. This is BL-19 applied to articles. An RU `.tex` without its EN counterpart is INCOMPLETE, not WIP.
- **Primary failure mode in article work:** Drafting prose directly into the `.tex` source without having the outline + claims table + source requirement table from the Analyst. Result: a section that "reads well" but has unsupported claims, missing cites, and `\Lambda` collisions. Mitigation: Builder's Activation Operator requires reading the Analyst plan verbatim BEFORE writing any prose.
- **Second failure mode:** Drafting RU first, "we'll do EN later." This is BL-19 violation. Mitigation: Section-by-section bilingual drafting (write section I in RU, immediately translate to EN, move on).
- **Third failure mode (article-specific, not in base role file):** Evidence-marker omission. Every substantive claim MUST be annotated in the `.tex` source with `% [FACT: source]`, `% [DERIVATION: axiom/postulate]`, `% [HYPOTHESIS: testable via X]`, or `% [OPEN: reason]`. This is Check 8 from `odtoe-articles/config.md` lines 272-281. The markers are LaTeX comments — invisible in the compiled PDF but auditable in `.tex` source.
- **Jidoka self-check (article specialization):**
  - Q1: "Have I read `ODTOE_article.tex` preamble and 3 nearest neighbors? (F)"
  - Q2: "Does my draft match the outline+claims table from Analyst exactly, or have I slipped in unsupported claims? (E)"
  - Q3: "Are there any `\Lambda`-style collisions with the corpus? Terminology drift from the glossary? (1-σ)"
  - Q4: "Have I annotated every substantive claim with [FACT]/[DERIVATION]/[HYPOTHESIS]/[OPEN]? (Λ per Check 8)"
  - Q5: "Have I drafted BOTH RU and EN for this section before moving to the next section? (Λ per BL-19)"

### Validator (article focus)

- **FIRST attention anchor (A_F override):** Read the Analyst plan + the Builder's 8-file set (or whichever files exist — 8 files is the expected state; any missing file is defect 1). Read the 7 verification checks from `odtoe-articles/config.md` lines 201-281. Validator owns the final gate for all 8 checks (per the role-mapping table in that config). Validator does NOT partially validate.
- **Artifact definition:** The full bilingual 8-file set IN ITS FINAL FORM — the same thing a journal reviewer would see. Validator simulates the reviewer at the highest-stakes moment: pre-submission.
- **Primary failure mode in article work:** Running cite_check alone and saying PASS while the article has factual inconsistencies NOT caught by cite_check (e.g., "abstract says N=120, Table 2 says N=118" — see Example 3 below). Cite_check catches bibliography issues; it does NOT catch numerical/factual inconsistencies. Validator must run ALL 8 checks, not just cite_check. This is the distinction between `verify.method: cite_check` (the PRIMARY gate) and the FULL validation gate (all 8 checks). BL-17 + the 8-check structure together prevent this failure.
- **Secondary failure mode (article-specific):** Trusting Builder's evidence markers. A claim tagged `[DERIVATION: postulate P3]` might actually be a post-hoc fit — Check 4 violation (see `odtoe-articles/config.md` Check 4). Validator must AUDIT marker accuracy, not accept them.
- **Jidoka self-check (article specialization):**
  - Q1: "Have I run all 8 checks, not just cite_check?"
  - Q2: "For each claim tagged [FACT], did I confirm the citation resolves AND the cited source actually supports the claim?"
  - Q3: "For each claim tagged [DERIVATION], did I confirm the derivation chain is explicit AND complete (not a jump)?"
  - Q4: "Are the numbers in the abstract, body, tables, and figures INTERNALLY CONSISTENT? (Check 7 + C6a factual-consistency subcheck)"
  - Q5: "Are both RU and EN versions validated (not just one)?"
  - Q6 (Skin-DEF-f): "For each `\tag{}` formula in the article, can I locate the derivation (in-article), the external citation pointer (cite `[N]` + page/section), the axiomatic label, or the conjecture marker? If none of the four, the formula fails C6b provenance."
  - Q7 (Skin-DEF-e): "Computed `self_cite_rate`. Verdict from ladder: PASS (0-30%) / NOTES (30-50%) / NOTES ESCALATED (50-70%) / FAIL (≥70%). If ≥50%, did I record the load-bearing justification for each self-cite?"

### Coherencer (article focus)

- **FIRST attention anchor (A_F override):** Read the full bilingual 8-file set. Read the ODTOE glossary (46 canonical terms — `odtoe-articles/config.md` line 48). Read the 3 nearest neighbor articles from the corpus. Coherencer cares about *this article's fit with the corpus*, not the article in isolation.
- **Artifact definition:** The corpus + this article = new corpus. Coherencer checks that (old corpus) ∪ (this article) remains coherent. This is L2 Coherencer work (cross-team coherence, per `coherent_EN.md` Levels).
- **Primary failure mode in article work:** "Glossary drift" — a term that the glossary defines as X is used in the new article with meaning Y. Or the `\Lambda` symbol collision. Or a formula that appears in article A with one value and in this article with a slightly different value. These are ALL (1-σ) failures at the corpus level.
- **Secondary failure mode (article-specific):** Phantom coherence between RU and EN. Both versions "agree" because they were generated in the same session, but actually introduce the same error in both — so cross-language check doesn't catch it. Mitigation: Coherencer must perform independent verification of a sample of formulas and citations, not just diff RU↔EN.
- **Jidoka self-check (article specialization):**
  - Q1: "Does the new article use every technical term exactly as the 46-term glossary defines it? (BL-29)"
  - Q2: "Are there any symbol collisions with existing corpus articles? (`\Lambda`-style check)"
  - Q3: "If this article cites a formula from corpus article N, does it match article N verbatim?"
  - Q4: "Are RU and EN versions byte-equivalent in structure (same section count, same formula count, same citation count, same figure count)?"
  - Q5: "Independent spot-check: pick 3 formulas from the new article, recompute them without reading the article's computation. Do my results match?"
- **Bilingual sync rule (BL-19) specialization:** Coherencer is the ENFORCER of the 8-file rule. Commit is BLOCKED if fewer than 8 files exist. Commit is BLOCKED if file sizes diverge by >50% (suggests one version is incomplete).

---

## Verification Protocol (cite_check expanded)

This section maps directly to `domain.verify.method: cite_check` in `projects/odtoe-articles/config.md` line 15. The skin expands `cite_check` into 6 concrete sub-checks split across Validator L1 (per-section / per-commit) and Validator L2 (full-article / pre-submission).

### The six cite_check checks

| # | Check | Who runs it | L1 or L2 | Enforcement mechanism |
|---|---|---|---|---|
| **C1** | **Bibliography completeness** — every in-text `[N]` citation has a matching bibliography entry; every bibliography entry is cited at least once in the text | Validator | **L1** (per-commit: can miss a new `[N]`) | Structural check — grep-based |
| **C2** | **Citation attribution** — claim X that cites `[Smith2020]` is actually supported by Smith2020 (not just mentioned by it) | Validator | **L2** (pre-submission: requires reading the cited paper) | Human + LLM assisted — best-effort |
| **C3** | **DOI / arXiv ID syntactic validity** — each DOI matches the DOI regex; each arXiv ID matches the arXiv regex | Validator | **L1** | Pure regex check, automated |
| **C4** | **Internal cross-references** — `§3.2`, `\ref{thm:main}`, `\ref{fig:curve}`, `\eqref{eq:main}` all resolve to real section/theorem/figure/equation inside the same `.tex` file | Validator | **L1** (LaTeX's own warnings cover this; Validator must READ the warnings) | Rendering/parser — automated |
| **C5** | **Self-citation sanity** — if author cites own prior work, the citation is load-bearing (not padding); at least one sentence explains what the prior work contributes. **Quantitative ladder (Skin-DEF-e):** 0-30% PASS / 30-50% NOTES / 50-70% NOTES ESCALATED / ≥70% FAIL — see C5 L2 judgment block below | Validator + Coherencer | **L2** | Human judgment + Coherencer review + self_cite_rate threshold |
| **C6a** | **Factual consistency** — numbers reported in abstract match numbers in body; figures match tables; abstract N = body N = table N | Validator | **L2** | Cross-reference scan — requires reading all occurrences of each numeric claim |
| **C6b** | **Formula provenance (Skin-DEF-f)** — every `\tag{}` formula is Derived / Cited-with-pointer / Axiomatic / Conjectured with a visible marker. Asserted-without-derivation = FAIL. | Validator | **L2** | Per-formula provenance classification; `grep -B3 -A1 '\\tag{'` mechanical aid + manual bucketing |

### Relationship to the 8 verification checks in `odtoe-articles/config.md`

The 6 cite_checks are a SUBSET + EXTENSION of the config.md check list. The mapping:

| Skin check | Corresponds to config.md check | Notes |
|---|---|---|
| C1 (bibliography completeness) | Check 1 ("bibliography: every [N] reference ... must have a matching entry") | Unified — same requirement |
| C2 (citation attribution) | Check 1 ("every bibliography entry must be REAL: verify DOI ... publisher/year/volume/pages") | Unified — adds attribution check |
| C3 (DOI/arXiv syntax) | Check 1 ("verify DOI resolves") | Syntactic subset — C3 is purely mechanical; live DOI resolution is manual |
| C4 (internal cross-refs) | Check 7 ("Table/figure references must resolve correctly") | Unified — same requirement |
| C5 (self-citation sanity) | Check 6 ("Self-plagiarism check") | Related — different angle |
| C6a (factual consistency) | Check 7 ("No contradictions WITHIN the article") | Unified — skin formalizes the "N=120 vs N=118" sub-case |
| C6b (formula provenance) | Check 4 ("No fitting — all parameters derived from theory") + Check 8 (Rybakov markers, when applicable) | Unified — C6b is the "asserted-without-derivation" half that Check 4 covers from the fitting angle; C6b catches the case where a formula is quoted verbatim from an external source without a visible pointer to the derivation |

**NOT covered by the 6 cite_checks (but still REQUIRED by Validator per config.md role mapping):**
- Check 2: Mathematical apparatus — full recomputation of every formula
- Check 3: 50-digit precision
- Check 4: No fitting — all parameters derived from theory
- Check 5: No AI markers, hidden characters, tone inconsistencies
- Check 6: Plagiarism prevention (>90% originality)
- Check 8: Evidence classification audit

These 6 checks are NOT cite_check in the narrow sense, but ARE required for the article's validation gate. The skin states this explicitly so Validators do not interpret `verify.method: cite_check` as "only run the 6 cite_checks and skip the rest." The skin's verification section is PARTIAL — it covers only cite_check specifically; the full article validation gate includes all 8 checks from config.md.

### Verification block

```
[method name]: cite_check
[command]: hybrid — L1 (C1/C3/C4) is grep/regex automatable, L2 (C2/C5/C6a/C6b) is
          Validator judgment. Compile step:
          `tectonic ODTOE_{topic}.tex && tectonic ODTOE_{topic}_EN.tex`.
          Full protocol: reference implementation below + 8-check protocol
          from `projects/odtoe-articles/config.md` lines 201-281.
[success criteria]: all 6 cite_check checks PASS (C1/C2/C3/C4/C5/C6a+C6b above)
                    AND all 8 config.md checks PASS AND all 8 bilingual files
                    present (BL-19) AND PDF compiles cleanly for RU and EN
                    versions. C5 verdict uses the quantitative ladder
                    (Skin-DEF-e): PASS / PASS WITH NOTES / PASS WITH NOTES
                    ESCALATED / FAIL.
[failure recovery]: C1 → add missing biblio entry OR missing in-text cite;
                    C2 → re-read source, remove claim or find supporting source;
                    C3 → correct DOI/arXiv syntax;
                    C4 → fix internal reference (or remove dangling ref);
                    C5 → if >30% explain load-bearing role for each self-cite
                         and consider balancing with external cites; if ≥70%
                         restructure or attach Coherencer co-signed justification;
                    C6a → re-verify authoritative value and align all occurrences;
                    C6b → add in-article derivation, or add explicit pointer
                          into the cited source (page/section), or label as
                          postulate/axiom, or mark as conjecture/hypothesis.
[independence check]: Validator INDEPENDENTLY recomputes a sample of formulas
                      (Check 2) — the article analog of "run tests, don't just
                      read the code." Phantom coherence detection (BL-5): if
                      Builder and Validator agree but neither recomputed
                      independently, flag PHANTOM. Sample size: see
                      "Sample-size contract" subsection below.
```

### cite_check reference implementation (C1/C3/C4 L1 automation, C2/C5/C6 L2 judgment)

#### C1 (L1) — Bibliography completeness

ODTOE idiom: `~[N]` in text, `\item[{[N]}]` in biblio (plain-`\item` fallback:
`grep -c '^\\item' "$TEX"` = max([N]) in text). PASS = both diff files empty;
any duplicate (DEF-1: `[17]`/`[27]`) = FAIL.

```bash
grep -oE '~\[[0-9]+(,\s*[0-9]+)*\]' "$TEX" | grep -oE '[0-9]+' | sort -u \
  > /tmp/cites_in_text.txt
grep -oE '\\item\[\{\[[0-9]+\]\}\]' "$TEX" | grep -oE '[0-9]+' | sort -u \
  > /tmp/biblio_entries.txt
comm -23 /tmp/biblio_entries.txt /tmp/cites_in_text.txt > /tmp/c1_orphans.txt
comm -13 /tmp/biblio_entries.txt /tmp/cites_in_text.txt > /tmp/c1_dangling.txt
wc -l /tmp/c1_orphans.txt /tmp/c1_dangling.txt
grep -oE '\\item\[\{\[[0-9]+\]\}\]' "$TEX" | sort | uniq -cd  # dup check
```

#### C3 (L1) — DOI / arXiv ID syntactic validity

```bash
# C3 is SYNTACTIC only; live DOI HTTP resolution = BL-A4 PRE-FLIGHT.
DOI_RX='10\.[0-9]{4,9}/[^[:space:]"}]+'
ARXIV_RX='(arXiv:)?[0-9]{4}\.[0-9]{4,5}(v[0-9]+)?'
grep -oE '(doi\.org/|DOI:?\s*)[^"[:space:]]+' "$TEX" \
  | sed -E 's|.*doi\.org/||; s|^DOI:?\s*||' \
  | grep -vE "$DOI_RX" > /tmp/c3_dois_invalid.txt
grep -oE "arXiv:[^[:space:]]+" "$TEX" | sed 's|^arXiv:||' \
  | grep -vE "$ARXIV_RX" > /tmp/c3_arxiv_invalid.txt
wc -l /tmp/c3_dois_invalid.txt /tmp/c3_arxiv_invalid.txt   # both 0 = PASS
```

#### C4 (L1) — Internal cross-references

```bash
# PASS = count is 0. No-tectonic fallback: diff `\newlabel{...}` in `.aux`
# against `\ref{...}`/`\eqref{...}`/`\cite{...}` in `.tex`.
tectonic "$TEX" 2>&1 | tee /tmp/c4_build.log
grep -cE 'undefined|multiply.defined|Citation .* undefined' /tmp/c4_build.log
```

#### C2, C5, C6 (L2, judgment protocol) + sample-size contract

**C2 — Citation attribution.** Per citation `[N]`: (1) source lookup (if
inaccessible → NOT-CHECKABLE, escalate to BL-A4); (2) quote the bearing
sentence; (3) does the source support that SPECIFIC claim, not just the general
topic? Over-generalization ("McCraty 2003 is about HRV" → "supports the 62/38
= +30% HRV claim") is the canonical C2 failure (smoke-test DEF-3 / Example 1).
Coverage: EVERY T3/T4 citation in the Analyst Source Register (`odtoe-articles/
config.md` line 46); spot-check T1/T2 per sample-size contract below.

**C5 — Self-citation sanity.** Article must contain a sentence stating what the
cited prior work CONTRIBUTES; decorative (non-load-bearing) = FAIL.

**C5 quantitative thresholds** (Skin-DEF-e fix, calibrated on 2 smoke tests).
Compute `self_cite_rate = count(in-text ~[N] where author matches primary
author) / count(total in-text ~[N])`. Verdict ladder:

- **0–30% → PASS.** Normal for single-author academic articles in math physics.
- **30–50% → PASS WITH NOTES.** Elevated. Flag for editorial review — for each
  self-cite, ask: replaceable by a primary source or more recent external cite?
- **50–70% → PASS WITH NOTES ESCALATED.** Substantial. Builder MUST justify:
  "each self-cite contributes a load-bearing result that cannot be sourced
  elsewhere." Validator records justification and flags for Coherencer at RT-2.
- **≥70% → FAIL.** Echo chamber. Require restructure OR Validator justification
  with Coherencer co-sign at RT-2.

**Basis:** Calibrated on the ODTOE corpus (single-author self-cites load-bearing
by construction) against peer-reviewed physics norm ~30%. Data points: first
smoke test = 27.4% → PASS WITH NOTES; second smoke test = 55.6% → would land
at PASS WITH NOTES ESCALATED under this ladder (see
`reports/v9_phase2_1_s_second_smoke_test_2026-04-11.md` Section 3 C5 row).

**C6a — Factual / numerical consistency.** Per numerical claim appearing in >1
location (abstract / body / table / figure caption / conclusion): (1) extract
every occurrence (`grep -nE '[0-9]+[.,][0-9]+' "$TEX"`); (2) cross-check for
silent shifts (abstract "120" vs table "118", per Example 3 / DEF-4); (3) for
formulas, recompute per sample-size contract. EXHAUSTIVE for cross-occurrence
numbers; single-occurrence numbers → sample-size.

**C6b — Formula provenance** (Skin-DEF-f fix). For every `\tag{}`-numbered
formula, Validator verifies one of four visible provenance labels:

1. **Derived** — in-article derivation chain with ≥1 intermediate step.
2. **Cited** — external source with concrete pointer (cite `[N]` PLUS
   section/page reference inside `[N]`, not just `[N]` alone).
3. **Axiomatic / postulated** — explicit label ("Postulate P4", "Axiom 3",
   or Rybakov `% [DERIVATION: axiom]` when Check 8 applies).
4. **Conjectured / hypothesized** — explicit label ("Conjecture 1",
   "Hypothesis H-2", or Rybakov `% [HYPOTHESIS: ...]` when Check 8 applies).

**Failure mode:** "Load-bearing formula X asserted without derivation,
citation, axiomatic label, or conjecture marker." Canonical case: second
smoke test (`ODTOE_phi_fractality.tex` Section III.2 formula
`S(ρ_d) ∝ φ^(-|d-d_0|)` attributed to `[3]` with no in-article derivation
or page pointer — `reports/v9_phase2_1_s_second_smoke_test_2026-04-11.md`
DEF-5). **L2 mechanical aid:** `grep -B3 -A1 '\\tag{' "$TEX"` extracts
per-formula local context; Validator manually buckets each. L2 because
grep alone cannot distinguish "derived with visible chain" from "asserted".

**Temporal exception (inherits Skin-DEF-c):** For articles predating Check 8
cutoff (2026-04-04), C6b still applies via in-text presentation — an article
without `%` Rybakov markers can PASS C6b if provenance is visible in the
compiled PDF prose (numbered Postulate block, Conjecture label, proof
sketch paragraph). C6b demands visible provenance in whatever form the
article uses; it does not retroactively require Rybakov markers.

**Sample-size contract** — single source for C6 recomputation depth AND the
`[independence check]` "sample of formulas" phrase:

```
total_formulas = count \tag{...} / \label{eq:...} blocks in the .tex file
sample_size    = max( 3, ceil( sqrt(total_formulas) ) )    # 9→3, 22→5, 50→8, 100→10
```

Floor of 3 keeps tiny articles meaningful; √N = BL-17 Check-First pattern.
**Selection is DETERMINISTIC, not random.** Mandatory inclusions: (1) one
formula from the **abstract** if it cites any — catches abstract/body drift
(Example 3 / DEF-4); (2) one from **main results** — catches load-bearing
recomputation failure; (3) one from **appendix / late section** if present.
Remaining slots (if `sample_size > 3`) fill unrepresented sections; if
`sample_size ≤ 3`, the 3 mandatory inclusions ARE the sample. Precedent:
`ODTOE_measuring_B_parameter.tex` ≈ 22 `\tag{}` → 5; Validator recomputed 6 →
PASS → Skin-DEF-d now mechanical.

---

## RT Phase Protocol for articles

Code projects use the canonical phase protocol from `eradev.md` Section VI:
Visionary (direction) → Analyst (design) → Builder (implement) → Validator (test) → Coherencer (integrate).

Articles need adjustments because the work profile is different. **Three RT invocation points** apply:

1. **RT-0 (Visionary solo, RECOMMENDED for articles): thesis / corpus-collision check.** Before any RT-1. Runs when the operator proposes a new article. Visionary alone evaluates: is this thesis new, does it fit the corpus, is it falsifiable (OOD check)? A YES from Visionary unlocks RT-1. Output is a single-paragraph decision:
   - "APPROVED: thesis is new; closest corpus neighbor is article N which covers X, leaving room for Y; falsifiable via Z; proceed to RT-1."
   - OR "REJECTED: thesis collides with article N; propose a different angle."
   - OR "OUT-OF-SCOPE: thesis is speculative, no discrete verification possible; defer to v10."
2. **RT-1 (mandatory, full 5-role): outline + claims + plan.** Before any drafting. Produces the Analyst deliverable template (Analyst sub-section above). Builder does NOT start writing until RT-1 approves a plan.
3. **RT-2 (mandatory, pre-submission): full gate.** Before the article is submitted to a journal / uploaded to arXiv / committed as a "final" version. Runs all 8 verification checks + the 6 cite_checks + BL-19 8-file check.

**No RT between RT-1 and RT-2 for single-section articles.** For multi-section articles (>4 sections), an intermediate RT-1.5 may be run after each section's draft, but this is OPTIONAL.

### Single Builder with section-by-section rhythm

The article Builder is a **SINGLE agent** (not "outliner + drafter" split). Within that single Builder session, the rhythm is:
- For each section I in the outline:
  1. Draft section I in RU `.tex`
  2. Immediately draft section I in EN `.tex` (BL-19 enforcement)
  3. Compile both (`tectonic` pass — catches LaTeX errors early)
  4. Annotate evidence markers for all substantive claims (Check 8)
  5. Move to section I+1

Outline + draft live in the same mental model of the argument. Splitting them into two agents would cause the drafter to lose the context that the outliner had — increasing |B_outliner − B_drafter| and decreasing S_team. Keeping them unified is consistent with the v9 principle that *role is a focus, not a specialization*.

**Exception (L/XL only):** For an XL article (>8000 words, >4 sections), the Analyst plan may split work across *two Builders* by section ownership (Builder A owns sections I-III, Builder B owns sections IV-VI). File Ownership rule from `analyst_EN.md` Responsibilities 4 applies. Coherencer gate is MANDATORY between Builder completion and Validator start.

### Pipeline block

```
Article pipeline (FIXED):
RT-0 (Visionary solo, optional) → thesis/corpus-collision approval
RT-1 (full 5-role) → outline + claims table + Analyst plan
Builder loop per section:
  draft RU .tex → draft EN .tex → compile both → evidence markers → next section
Coherencer gate (after all sections drafted)
RT-2 (full 5-role) → 6 cite_checks + 8 config.md checks + BL-19 8-file check
Commit all 8 files together (per `odtoe-articles/config.md` line 106)
Submission / preprint / journal → outside EraDev scope (manual operator action)
```

---

## Checklists

### Pre-Generation Checklist (Check-First, BL-17, BL-21)

Derived from `odtoe-articles/config.md` lines 40-51, unified with BL-17 (pre-generate verification) and BL-21 (format-first). Run BEFORE any `.tex` writing begins.

- [ ] **1. FORMAT:** Read `ODTOE_article.tex` (full preamble + first section) — gold standard format
- [ ] **2. FORMULAS:** List ALL formulas. Recompute each independently to 50 digits. Do NOT copy from other articles.
- [ ] **3. CONSTANTS:** Prepare 50-digit values for π, φ, (π−3)² and all derived constants needed.
- [ ] **4. SOURCES:** List ALL bibliography entries. Verify each: DOI exists, publisher/year correct, page numbers match.
- [ ] **4b. SOURCE REGISTER:** For every key assertion, create mapping `{Section | Claim | Source | Trust: T1/T2/T3/T4}` where T1=peer-reviewed with DOI, T2=ODTOE corpus (verified in prior articles), T3=preprint/conference, T4=novel claim (requires DERIVATION.md per Check 8). If >30% claims are T3/T4, flag for additional review.
- [ ] **5. STRUCTURE:** Define section plan (Roman numerals). Verify no overlap with existing corpus articles.
- [ ] **6. CONSISTENCY:** Check terminology matches ODTOE glossary (46 terms). No contradictions with corpus.
- [ ] **7. LANGUAGE:** Confirm both RU and EN versions will be produced simultaneously (BL-19).
- [ ] **8. RT-0 CORPUS-COLLISION:** Visionary has confirmed the thesis does not duplicate an existing corpus article.

### Post-Generation Checklist (Jidoka gate)

Run AFTER Builder completes section-by-section drafting and BEFORE Validator starts RT-2.

- [ ] **1. BL-19 8-FILE SET:** All 8 files exist (RU+EN × .tex/.pdf/.docx/.md)
- [ ] **2. COMPILE:** Both `tectonic ODTOE_{topic}.tex` and `tectonic ODTOE_{topic}_EN.tex` exit 0
- [ ] **3. NO WARNINGS:** No overfull/underfull hboxes in changed sections; no unresolved `\ref{}`/`\cite{}`/`\eqref{}`
- [ ] **4. EVIDENCE MARKERS:** Every substantive claim annotated with `% [FACT]` / `% [DERIVATION]` / `% [HYPOTHESIS]` / `% [OPEN]` — **SEE TEMPORAL EXCEPTION BELOW** for articles authored before 2026-04-04
- [ ] **5. CITE_CHECK C1-C6:** All 6 cite_check sub-checks PASS
- [ ] **6. 8 CONFIG.MD CHECKS:** All 8 verification checks from `odtoe-articles/config.md` lines 201-281 PASS
- [ ] **7. BILINGUAL PARITY:** RU and EN have same section count, same formula count, same citation count, same figure count
- [ ] **8. GLOSSARY ALIGNMENT:** All 46 canonical ODTOE terms used with correct meaning

#### Check 8 temporal exception (pre-2026-04-04 articles)

Check 8 (Rybakov evidence markers) was added to `odtoe-articles/config.md` on
**2026-04-04** (line 280). Articles authored before that date lack
`% [FACT]` / `% [DERIVATION]` / `% [HYPOTHESIS]` / `% [OPEN]` markers — a
temporal gap, NOT a content defect. Cutoff determination:

```bash
git log --diff-filter=A --format=%at -1 -- "$TEX"   # preferred: first-add commit
stat -f %m "$TEX"  # macOS fallback  |  stat -c %Y "$TEX"  # GNU fallback
# Compare vs TEMPORAL_CUTOFF = 2026-04-04 00:00 UTC.
```

**Validator verdict labels** (report MUST include authoring date):
- **Case A** — 0 markers, authored ≥ cutoff → **FAIL** (content defect).
- **Case B** — 0 markers, authored < cutoff → **LEGACY INFO** (NOT a Check 8
  pass; scope declaration; once revised post-cutoff, inherits the rule).
- **Partial markers, same split:** ≥ cutoff → **FAIL (partial)**; < cutoff →
  **PARTIAL LEGACY**. List unmarked claims (defect / TODO respectively).
- **Smoke-test precedent:** `ODTOE_measuring_B_parameter.tex` (mtime Mar 20,
  2 weeks pre-cutoff) = Case B. See
  `reports/v9_phase2_1_s_smoke_test_2026-04-11.md` Section 3 row "Check 8".

---

## Examples (3 concrete)

### Example 1: Unsupported claim (C2 failure)

- **Input:** "Add section III to the article on Λ-dynamics, including a claim that the Lyapunov exponent λ_L > 0 for all ODTOE observer states."
- **Scenario:** Builder writes the section, cites `[Smith2020]` for the λ_L > 0 claim, and moves on. At RT-2, Validator runs C2 (citation attribution) by reading Smith2020.
- **What Validator finds:** Smith2020 actually proves λ_L > 0 for *a specific sub-class* of observer states (those with measurable phase space), not for ALL states. The cited claim is stronger than what the source supports.
- **Catching role:** **Validator** (C2 is L2, requires reading the source).
- **Phase:** **RT-2** (pre-submission gate).
- **Fix:** Builder must either (a) weaken the claim to match Smith2020 — "for measurable-phase-space observer states, λ_L > 0 per [Smith2020]"; or (b) find a source that actually proves the stronger claim; or (c) provide an independent derivation. This is also a Check 4 (no fitting) concern: if no source exists, the claim MUST be derived from ODTOE postulates or removed.
- **Why cite_check alone would miss this:** C1 (bibliography completeness) would say PASS — the citation is in the bibliography. C3 (DOI syntax) would say PASS — the DOI is valid. Only C2 (reading the cited source) catches it. This is why the skin's verification protocol distinguishes L1 (mechanical) from L2 (interpretive) checks.

### Example 2: Outline contradiction between sections (Coherencer σ failure)

- **Input:** "Draft outline for an 8-section article 'Dualities in ODTOE observer geometry.'"
- **Scenario:** Analyst plan lists Section III as "Observer-dependent metric" with the definition "the metric is a functional of the observer's information state" and lists Section V as "Bulk metric reconstruction" with the definition "the bulk metric is objective and independent of any observer." At RT-1, both section sketches pass Builder's Jidoka (each is internally consistent).
- **What Coherencer finds:** The two sections are mutually contradictory — Section III says metric is observer-dependent, Section V says it is observer-independent. If the article were drafted as-is, Section V would silently overwrite Section III's assertion.
- **Catching role:** **Coherencer** (this is the canonical Coherencer failure-mode — divergent meanings of the same term across parallel work).
- **Phase:** **RT-1** (outline review, before Builder starts drafting). Coherencer's σ (contradiction rate) spikes because Sections III and V disagree on a foundational term.
- **Fix:** Coherencer invokes Phantom Coherence Check (`coherent_EN.md` Key Rules 2) and asks each role individually: "Is the metric observer-dependent or objective?" The divergence forces a RT-1.5 where Visionary clarifies which definition is the article's load-bearing one, and the outline is rewritten so that either (a) Section V redefines "bulk metric" as an information-theoretic construct compatible with Section III, or (b) Section V is removed entirely.
- **How the skin's vocabulary maps this:** "observer-dependent metric" vs "observer-independent metric" = a **symbol collision** (vocabulary row 22, `\Lambda`-style pattern from `analyst_EN.md` Ex.2). Vocabulary row 2 (function → claim) and row 3 (module → section) apply. Coherencer's drift detection (Q1-Q2 in Coherencer focus section above) catches this by running the "does the new article use every technical term exactly as the glossary defines it?" query.

### Example 3: Numerical inconsistency abstract vs table (C6 failure, cite_check blind spot)

- **Input:** "Add an empirical section reporting results from a simulation of 120 ODTOE observers."
- **Scenario:** Builder drafts section IV. The abstract says "We ran 120 simulations." The section IV body says "We ran N=120 trials." Figure 4's caption says "N=120 observers." Table 2's header row says "Results over 118 observers." Builder compiles, the PDF looks clean, submits to Validator.
- **What Validator finds:** When running C6 (factual consistency), Validator notes the discrepancy — abstract/body/figure all say 120, Table 2 says 118. One of them is wrong. Reading the raw simulation output: actually 120 simulations were RUN, but 2 were excluded for data quality reasons, so the TABLE represents 118. Neither the abstract nor the body nor the figure caption mentions the exclusion.
- **Catching role:** **Validator** (C6 is L2; requires cross-reference scan of every numerical claim across the article).
- **Phase:** **RT-2** (pre-submission).
- **Fix:** Either (a) update abstract/body/figure to explain the exclusion — "120 simulations run; 118 analyzed after QC filtering"; or (b) re-run the simulations so N=120 is consistent; or (c) re-examine the exclusion criterion.
- **Why cite_check alone (C1-C5) is insufficient:** None of C1-C5 touch numerical facts inside the article. C1 is about bibliography entries. C2 is about attribution. C3 is about DOI syntax. C4 is about internal reference resolution (which might be OK — figure 4 and table 2 both resolve). C5 is about self-citation. C6 is the ONLY cite_check variant that catches this. C6 is placed in the skin's verification protocol precisely to make visible that "cite_check" in the article domain is a FAMILY of checks, not just "do citations resolve." This example is the didactic case for WHY the skin expands cite_check into 6 sub-checks and does NOT treat it as monolithic.

---

## Domain-Specific Bootstrap Lessons

The article skin inherits all 22 universal BL from `BOOTSTRAP_LESSONS_universal.md` **unchanged**, handles each of the 8 code-adapter BL individually (2 transfer unchanged, 4 have article equivalents BL-A1..A4, 2 are N/A), and adds 4 article-specific BL in the BL-A namespace.

### Universal BL inherited (22 entries — all unchanged, 1-line applicability note each)

| BL | Title | Applicability to article work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Applies unchanged — a fresh article project starts with Λ=0.5; accumulates as articles land in the corpus |
| BL-4 | S_adjusted = S_team × B_mean | Applies unchanged — Coherencer at RT-2 computes S_adjusted from the 5 role B scores |
| BL-5 | Phantom Coherence Detection | Applies unchanged — article-specific manifestation is "RU and EN both contain the same formula error" (see Coherencer secondary failure mode) |
| BL-7 | EN for Practical Tasks, RU for Theoretical Depth | Applies unchanged — article drafting is practical (EN role files), theorem derivation is theoretical (RU role files may be used for formula derivation) |
| BL-9 | Interface Contracts Between Roles | Applies unchanged — Analyst→Builder contract is the section-by-section claims table; Builder→Validator contract is the 8-file bilingual set + evidence markers |
| BL-10 | Multiplicative B Structure | Applies unchanged — weights are `research` profile (F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15) per Phase 0.A |
| BL-11 | Scope Creep is Muda | Applies unchanged — "while drafting section III, I noticed section II also needs fixing" = SEPARATE task |
| BL-12 | Hansei Targets Process, Not People | Applies unchanged — post-submission reflection is about why the pipeline missed X, not which agent wrote X |
| BL-13 | Yokoten — One Lesson, All Analogous Cases | Applies unchanged — "grep the codebase" maps to "terminology scan across the corpus" (the cross-domain note is already in BL-13's own text) |
| BL-15 | 2% Spiral Gap | Applies unchanged — an article always ships with some open questions; those become the next article |
| BL-16 | Reading the Framework ≠ Applying It | Applies unchanged — META must still delegate article work to agents, not draft sections directly |
| BL-17 | Pre-Generate Verification = Prevention | **Critical for articles** — Check-First pipeline in `odtoe-articles/config.md` is the article-specific implementation of BL-17 |
| BL-18 | Scope Reclassification at 2× Estimate | Applies unchanged — a 1-section article that grows to 6 sections must be reclassified S→L |
| BL-19 | Bilingual Files Simultaneous | **Critical for articles** — the 8-file rule is BL-19 applied: RU .tex + EN .tex + RU .pdf + EN .pdf + RU .docx + EN .docx + RU .md + EN .md |
| BL-20 | Adversarially Test Bootstrap | RETIRED in main `BOOTSTRAP_LESSONS.md` 2026-04-20 (moved to `meta.md` §13 MM3); still listed in `BOOTSTRAP_LESSONS_universal.md` for backward compat. Applies unchanged — test the article skin file itself against a trial article before deployment |
| BL-21 | Format Specifications Are Inputs | MERGED into BL-17 in main `BOOTSTRAP_LESSONS.md` 2026-04-20; still listed in `BOOTSTRAP_LESSONS_universal.md` for backward compat. **Critical for articles** — preamble in `odtoe-articles/config.md` lines 116-164 is the mandatory format spec read BEFORE any draft |
| BL-26 | META Always Delegates | Applies unchanged — META never drafts article prose directly |
| BL-28 | Agent Prompt Must Include Explicit Context | Applies unchanged — article-task agent prompts must name the skin file path AND role file path |
| BL-29 | Verify Established Terminology Before Generating | **Critical for articles** — article Builder must scan corpus for terminology before drafting (the 46-term ODTOE glossary) |
| BL-30 | Defense-In-Depth | Applies unchanged — article validation has layers: Builder Jidoka + Coherencer gate + Validator 8-checks |
| BL-31 | Constrain Output Types | Applies unchanged — Builder's output is the 8-file set, not prose explanations |
| BL-32 | Grep After BL Merge | Applies unchanged — if article glossary terms are renamed, grep the whole corpus for orphan references |

### Code-adapter BL handled individually (8 entries)

| BL | Title | Verdict for articles | Notes |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | **Article equivalent: BL-A1** | Submission/publication changes require PRE-FLIGHT (preprint first, full journal later). See BL-A1. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Applies unchanged** | Article equivalent is "3+ consecutive revisions of the same section = STOP, re-spec the claim." Transfers cleanly; no new BL-A needed. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | **Article equivalent: BL-A2** | Before committing a `.tex` change, Builder must run `tectonic` compile AND `cite_check` AND BL-19 8-file check. See BL-A2. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **N/A for articles** | Articles have no feature flags. Publication state (draft/preprint/submitted/accepted/published) is a gradient but has no toggle mechanism. |
| **BL-14** | Rollback Plan Before Deploy | **Article equivalent: BL-A3** | MERGED into BL-8 in main `BOOTSTRAP_LESSONS.md` 2026-04-20; still active in `BOOTSTRAP_LESSONS_code_adapter.md`. Before submitting to a journal, Builder must document the retraction plan. See BL-A3. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Article equivalent: BL-A4** | Before Analyst RT-1, every DOI/arXiv reference must be verified syntactically (C3) and, for novel references, the cited source must be accessible. See BL-A4. |
| **BL-24** | Single-Responsibility Commits | **Applies unchanged** | Article equivalent is "one commit = one section's bilingual 8-file update." Transfers cleanly; no new BL-A needed. |
| **BL-25** | Error Path Coverage Matrix | **N/A for articles** | Articles do not have "happy/error/timeout/restart/partial" runtime paths. The analog would be "what if the paper is rejected" but that's BL-A3 (retraction plan), not a 5-path matrix. |

Summary: 2 code-adapter BL apply unchanged (BL-3, BL-24); 4 have article equivalents (BL-2→A1, BL-6→A2, BL-14→A3 [BL-14 merged into BL-8 in main BOOTSTRAP_LESSONS.md 2026-04-20; BL-A3 retains code_adapter provenance], BL-22→A4); 2 are N/A (BL-8, BL-25).

### Article-specific BL (BL-A namespace — separate budget)

These 4 BL live in this skin file ONLY. They do NOT add to the main 30-BL budget. They are loaded by the article domain adapter layer, not by META-Orchestrator's universal bootstrap.

**BL-A1: Submission is a Release Event (article adaptation of BL-2)**
- **Source:** Adapted from BL-2 for the article domain.
- **Rule:** Submitting an article to a journal is a release event. It requires: preprint-first canary (arXiv preprint before journal submission), a 7-day reviewer-silence window before considering the submission "stuck," and a rollback plan (withdrawal procedure documented).
- **Why:** Journal submissions have unbounded reputational blast radius. A withdrawn paper leaves a permanent trace. Canary via preprint constrains the damage surface.
- **Applies to:** Visionary (approve submission), Builder (preprint first), Validator (pre-submission gate).

**BL-A2: Verify Before Commit — Render Validity Gate (article adaptation of BL-6)**
- **Source:** Adapted from BL-6 for the article domain.
- **Rule:** Before committing any `.tex` change, Builder MUST run `tectonic ODTOE_{topic}.tex && tectonic ODTOE_{topic}_EN.tex`, capture the compile output, and confirm: (a) both compile with exit code 0, (b) no overfull/underfull hboxes in the changed section, (c) all `\ref{}` / `\cite{}` / `\eqref{}` resolve without `?`. Commit is REJECTED otherwise.
- **Why:** A `.tex` file that "looks right" in the editor but doesn't compile is the article equivalent of unverified code. Cost of compile check: seconds. Cost of a broken `.tex` in the corpus: minutes of debugging per reader.
- **Applies to:** Builder, Validator, META.

**BL-A3: Retraction Plan Before Submission (article adaptation of BL-14)**
- **Source:** Adapted from BL-14 for the article domain. (Note: BL-14 merged into BL-8 in main `BOOTSTRAP_LESSONS.md` 2026-04-20 as part of deployment-event checklist; BL-A3 retains code_adapter provenance since `BOOTSTRAP_LESSONS_code_adapter.md` still defines BL-14.)
- **Rule:** Before an article is submitted to a journal or uploaded as a preprint, Builder MUST document the retraction procedure: who to contact, what the retraction notice would say, and what the corpus-level rollback looks like (e.g., "remove from corpus, mark as retracted in index, note in changelog"). If you cannot describe how to undo a submission, you do not have permission to submit.
- **Why:** Post-submission pressure (editor deadlines, reviewer hostility, public visibility) is when cognitive load peaks. A pre-written retraction plan executes mechanically when needed.
- **Applies to:** Visionary (approve retraction plan), Builder (write it), Coherencer (store in MEMORY).

**BL-A4: Bibliography PRE-FLIGHT (article adaptation of BL-22)**
- **Source:** Adapted from BL-22 for the article domain.
- **Rule:** Before RT-1 begins on any article task, Analyst MUST verify every DOI/arXiv reference the article will cite: (a) DOI/arXiv syntax is valid (C3), (b) for novel references (T3/T4 in the Source Register — `odtoe-articles/config.md` line 46), the source is accessible to the author AND at least one key fact from each source is confirmed. Produce a VERIFIED REFERENCES artifact (a small table: DOI | cited claim | confirmed true/not-checked). Unverified references = Builder BLOCK (RED on A_F) at RT-1, Validator BLOCK at RT-2.
- **Why:** Hallucinating that a paper says X is the top F=0 failure in article work. The article skin's C2 (citation attribution) is the L2 version; BL-A4 is the L1 pre-flight that prevents the worst cases before drafting starts.
- **Applies to:** Analyst (RT-1), Validator (RT-2 re-verification), Builder (block without artifact), META (enforce gate).

### BL budget summary

- Universal BL inherited: **22** (unchanged)
- Code-adapter BL that apply unchanged: **2** (BL-3, BL-24)
- Code-adapter BL with article equivalents: **4** (BL-2, BL-6, BL-14 [merged→BL-8 in main BL, 2026-04-20], BL-22 → BL-A1..A4)
- Code-adapter BL that are N/A for articles: **2** (BL-8, BL-25)
- Article-specific BL (BL-A namespace, separate budget): **4** (BL-A1..A4)

**Total BL an article agent carries: 22 universal + 2 transferred code-adapter + 4 BL-A = 28 BL.**
(The 2 N/A code-adapter BL are NOT loaded; article agents do not "know" about them.)

### Project lessons.md integration (Skin-DEF-g fix)

**Rule:** The skin inherits 22 universal BL from `BOOTSTRAP_LESSONS_universal.md`
AND defers to `projects/{PROJECT}/lessons.md` for project-specific rules. On
conflict, the project lessons.md **takes precedence for project-scoped
concerns** — the skin encodes the article-domain invariant, the project
lessons encode the project-specific enforcement patterns.

**ODTOE project rules that post-date this skin spec** (not encoded in BL-A1..A4;
must be read from `projects/odtoe-articles/lessons.md`):

- **L-31** (TeX dashes): `---`/`--` forbidden in `.tex` source; use Unicode
  `—`/`–`. Grep: `grep -Pn '--|---' *.tex` = 0 PASS.
- **L-32** (biblio year format): Pankratov self-cites = "Препринт (2026)"; titles
  copied verbatim from `.tex` `\Large\bfseries`, not invented.
- **L-33** (required sections before ЛИТЕРАТУРА): БЛАГОДАРНОСТИ И ИНСТРУМЕНТЫ
  + КОНФЛИКТ ИНТЕРЕСОВ + ФИНАНСИРОВАНИЕ must appear before the bibliography.
  Note: lessons.md has a numbering collision (two L-33 entries — the second
  covers READ/WRITE/VERIFY/SYNC canonical operations). Validator tolerates both.
- **L-34** (RU+EN parity) + **L-35** (biblio in first-mention order, no
  `ODTOE\_...` file-name refs in text).

**Temporal exception clause** (inherits Skin-DEF-c pattern): rules introduced
AFTER an article's file-system mtime (`git log --diff-filter=A --format=%at -1`
preferred, `stat` fallback) are **LEGACY INFO, not FAIL**. Same Case A /
Case B / Partial split as the Check 8 temporal exception subsection.
Example: `ODTOE_phi_fractality.tex` (mtime Mar 19) predates L-31
(dated 2026-04-05), so 16 EN `---` occurrences are Case B (LEGACY INFO).

**Validator one-line routine:** Read `projects/{PROJECT}/lessons.md` → extract
project-specific rule list → apply temporal exception per rule → supplement
the 6 cite_check sub-checks + 8 config.md checks with project rules.
Post-mtime violation = temporal N/A; pre-mtime violation = real defect.

**Applies to:** Validator (RT-2 primary reader), Coherencer (cross-corpus
propagation), Builder (pre-commit), Analyst (RT-1 Check-First preamble).

---

## Known Out-of-Scope (OOD)

Tasks that LOOK like article work but FAIL v9's text-discrete AND-gate. Agents must escalate these to Visionary RT-0 and, when confirmed OOD, defer to the OOD Registry — do NOT auto-proceed under the article skin.

- **Free-verse poetry.** No discrete verification — there is no cite_check, no recomputation, no glossary alignment. Aesthetic judgment is continuous, not discrete. FAILS on `verify.method`. Route to `creative` skin (deferred to v10) or reject.
- **Speculative philosophy essays.** The central claim is a metaphysical position, not a falsifiable statement. There is no experiment, no proof chain, no numerical check. FAILS on objective verification. Visionary RT-0 is the explicit gate for catching this pattern (Phase 0.A Edge Case 2).
- **Real-time author interviews / transcripts.** A live conversation is a continuous stream, not a discrete artifact. Even transcribed, it lacks the proof-chain structure that makes cite_check meaningful. FAILS on discreteness. Route to a separate `transcript` skin (deferred) or reject.
- **Review articles / position papers.** Load-bearing property is argument arc, not proof chain. These are closer to `creative` B-weighting than `research`. Deferred to v10 `templates/domain_skin.article_review.md`; for v9, reject with note "no review-article skin yet — use narrative modality when it lands."
- **Blog posts / op-eds.** No bibliography, no proof obligation, no formal structure. Blog posts CAN have `type=article` in name but lack the 8-file set, the glossary, the 50-digit precision. FAILS on Check-First items 2-6. Not blocked outright, but agents must verify that the operator actually wants the full ODTOE-style rigor before proceeding.

---

## Footer

*Last updated: 2026-04-11*
*Upstream roles: roles/{role}_EN.md (all 5 roles — Visionary, Analyst, Builder, Validator, Coherencer)*
*Upstream math: eradev.md Section II.1 (B_research weights)*
*Upstream BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)*
*Upstream project (live reference): projects/odtoe-articles/config.md*
*Spec: reports/v9_phase2_1_article_skin_spec_2026-04-11.md (Analyst hand-off, B=0.904)*
