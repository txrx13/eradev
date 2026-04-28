# Domain Skin: article

> Type: article
> Modality: research
> Applies to projects where `config.md` contains `domain.type: article`
> Parent BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)
> Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md
> Last updated: 2026-04-26
> Upstream roles: roles/{role}_EN.md
> Upstream math: eradev.md Section II.1 (B_research weights)
> Overlay: if project requires corpus-specific specializations (filename conventions, preamble, glossary, bilingual mandate, specific citation idiom), add `domain.overlay: <path>` to `config.md` and create an overlay file — see `templates/domain_skin.md.template` for overlay schema

---

## Purpose / When META Loads This Skin

META loads this skin when a project's `config.md` declares:
- `domain.type: article`
- `domain.skin: templates/domain_skin.article.md`

When loaded, the skin is passed to every spawned role agent in addition to the base role file `roles/{role}_EN.md`. It does NOT replace the role file — it provides a vocabulary map, focus overrides, verification expansion, RT adjustments, examples, and an inherited-vs-overridden BL table specific to scientific-article work. The skin targets theorem/proof/derivation articles and empirical research articles with a proof chain or derivation backbone, NOT review papers, position papers, or narrative essays — see "Known Out-of-Scope" below.

**Universality:** This skin is corpus-agnostic. It does NOT bake in a specific filename prefix, a specific typesetting engine, a specific bibliography format, a specific glossary, or a specific bilingual mandate. Projects supply those specializations via `domain.overlay:` (see Overlay escape in `config.md`).

---

## Vocabulary Mapping

This skin overrides the abstract role-file vocabulary for article tasks. When an agent sees these generic terms in `roles/{role}_EN.md`, it reads them as the domain-specific meanings below.

| # | Abstract term (role file / BL) | Article meaning | Notes |
|---|---|---|---|
| 1 | **artifact** | section of an article, or a full source file (e.g., `.tex`, `.md`, `.docx`), or a compiled PDF, or a theorem block with its proof | see `analyst_EN.md` line 7 ("An 'artifact' is any discrete element…") |
| 2 | **function** | claim, theorem, lemma, or labelled equation (addressable unit) | analog of `builder_EN.md` "smallest addressable unit" |
| 3 | **module** | section or subsection (e.g., `\section*{…}`, `## …`, `§3`) | project-defined numbering scheme |
| 4 | **compile** | typeset / render the paper to its published form (engine varies: `tectonic`, `pdflatex`, `xelatex`, `pandoc`, `typst`, `quarto`, `rmarkdown`, etc.) | project config names the exact engine |
| 5 | **test / tests pass** | cite_check passes + recomputation matches + project-defined verification checks PASS | number of checks is project-defined; see project `config.md` |
| 6 | **verify** | cite_check (bibliography resolves, identifiers valid, internal refs resolve, factual consistency) | expanded in Section "Verification Protocol" below |
| 7 | **validate** | run the project's full set of verification checks (Validator owns all of them) | `validator_EN.md` line 7 |
| 8 | **build** | produce the project-defined artifact set (typically 1–8 files depending on bilingual requirement, output formats, and supplementary material policy) | project config defines the exact set |
| 9 | **runtime** | reader time (how long a reader spends on the paper) — NOT a runtime check, but a blast-radius proxy | Builder's "blast radius" vocabulary; `builder_EN.md` Key Rules 4 |
| 10 | **spec / specification** | call for papers, journal scope, or the prior Analyst plan for the article | `analyst_EN.md` "Implementation Plan" output format |
| 11 | **feature / feature flag** | contribution / claim / new section added to the article | `builder_EN.md` Key Rules 6 |
| 12 | **API / API endpoint** | reference database entry (DOI, arXiv ID, ISBN, URL, or other resolvable identifier) | code-adapter BL-22 — article-equivalent is "PRE-FLIGHT bibliography resolution" |
| 13 | **bug** | unsupported claim / citation gap / factual error / unresolved cross-reference / broken identifier (DOI 404, missing URL target) | `validator_EN.md` line 20 |
| 14 | **refactor** | restructure argument, reorder sections, rewrite a proof for clarity without changing result | `builder_EN.md` Key Rules 7 |
| 15 | **code review** | peer review (pre-submission reviewer read-through, or a beta reader / advisor read) | `visionary_EN.md` line 51 Example 2 |
| 16 | **PR / pull request** | submission to a journal, preprint upload, or a proposed section added for RT review | `builder_EN.md` Decision-Point Checklist |
| 17 | **commit** | signed-off change to the source with Jidoka gate passed; atomic unit is project-defined (one section per commit is typical) | `builder_EN.md` Key Rules 1 |
| 18 | **deploy / push to prod** | submit to journal / publish to preprint server / hand to editor | `builder_EN.md` Key Rules 1 |
| 19 | **production** | published version (post-peer-review, cannot be retracted without cost) | `validator_EN.md` Key Rules 4 |
| 20 | **smoke test** | abstract read + TOC scan + render of first page (sanity check before full render) | `validator_EN.md` Key Rules 5 |
| 21 | **glossary / canonical terms** | project-specific glossary of load-bearing terms (if the project maintains one — see `projects/{PROJECT}/glossary.md`) | glossaries are project artifacts, not skin artifacts |
| 22 | **symbol collision** | two corpus artifacts using the same symbol (e.g., `\Lambda`, `\sigma`) with different meanings | `analyst_EN.md` Example 2 |
| 23 | **numerical consistency / factual check** | C6a factual consistency across the article — every numerical claim must agree across abstract, body, tables, figure captions, and conclusion; Validator recomputes independently and cross-references all occurrences | Verification Protocol C6a below; didactic case = Example 3 |

**Unification rule:** If a project `config.md` contains a role-mapping table, terminology table, or check ownership table that contradicts this skin's Role Focus Overrides or Verification Protocol, **the project `config.md` WINS** and the agent must escalate to META before proceeding. Skins are defaults; projects override.

---

## Modal B-formula (research weights)

This skin pins `B_modality: research`. The article Builder/Validator/Coherent use the research weights:

| Component | Weight | Rationale |
|---|---|---|
| F (Focus) | **0.30** | Literature scan + preamble / gold-standard read is the dominant gate — an article Builder who hasn't read the nearest corpus neighbours produces drift. Second-dominant component. |
| E (Alignment) | **0.20** | Alignment to operator intent matters but is constrained by physical/logical correctness — you cannot be "aligned" with an incorrect theorem. Lowered relative to creative work. |
| (1-σ) (Consistency) | **0.35** | **Dominant.** A single logical inconsistency in a proof chain falsifies the entire result. Corpus consistency (glossary, symbols, cited formulas) is the load-bearing property. |
| Λ (Experience) | **0.15** | Lowest weight. Memory helps but a fresh corpus sweep can cold-start a new article; Λ is a facilitator, not a gate. |

**Rationale:** Scientific articles in the theorem/proof/derivation scope are predominantly consistency-gated. A bibliography check is a Focus check; an independent recomputation of every formula is a Consistency check. This B-weight profile is PINNED — it is not a placeholder.

**Variant clause (out of scope for this skin):** Review articles or position papers are closer to creative weighting because their load-bearing property is argument arc rather than proof chain. Route such work to a `creative` skin (deferred) or reject.

---

## Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` **unchanged**. The skin adds DOMAIN-SPECIFIC focus anchors, artifact definitions, failure modes, and Jidoka specializations.

### Visionary (article focus)

- **FIRST attention anchor (A_F override):** Read the `thesis` and `abstract` of the proposed article. Read the corpus table of contents (if the project maintains one). True North = *what scientific claim does this article add, and does the corpus already cover it?*
- **Artifact definition:** The article's central claim + its placement in the corpus. Not the text, not the PDF — the *argument*. At RT-0 Visionary speaks at the level of "this article proves X using Y, which complements/contradicts article Z in the corpus."
- **Primary failure mode in article work:** Approving a thesis that duplicates or contradicts an existing corpus article WITHOUT explicit acknowledgment. This is the **"corpus collision"** failure. Mitigation: Visionary must enumerate the 3 nearest neighbours in the corpus before greenlighting the thesis.
- **Jidoka self-check (article specialization):**
  - Q1: "Is this claim NEW, or does corpus article N cover it already?"
  - Q2: "Is the thesis falsifiable in a checkable way (research paper AND-gate), or is it speculative (FAILS OOD — escalate to OOD Registry)?"
  - Q3: "Does the proposed section structure match the project's gold-standard format (if one is declared)?"
- **Upstream reference:** `visionary_EN.md` Example 2 already contains the article-domain flavor. The skin adds the *corpus-collision check* which is NOT in the base role file.

### Analyst (article focus)

- **FIRST attention anchor (A_F override):** Read the article's *prior Check-First pipeline output* (see Pre-Generation Checklist below). If Check-First has not been run, STOP — demand Check-First before proceeding. Then read the 3 nearest neighbor articles in the corpus for terminology + notation alignment (BL-29 enforcement for articles).
- **Artifact definition:** A section-level decomposition of the article: each section has a list of *claims*, each claim has a *source requirement* (which cite) and a *derivation requirement* (which prior result from the corpus or which postulate). The Analyst output is a table, not prose.
- **Primary failure mode in article work:** Skipping the Check-First gate because "the article is simple." This is BL-17 violation applied to articles. Mitigation: Check-First is STRUCTURALLY REQUIRED before any Analyst plan is produced; Analyst's Jidoka A_F score is 0.0 (ANDON) if Check-First was not read.
- **Jidoka self-check (article specialization):**
  - Q1: "Has Check-First been completed? If NO → A_F=0.0 → Andon."
  - Q2: "For each claim in the plan, is the source requirement specified (identifier or corpus reference) or the derivation requirement specified (postulate chain)?"
  - Q3: "Are there resource conflicts with the existing corpus — same symbol with different meaning (the `\Lambda` collision pattern from `analyst_EN.md` Ex.2)?"
  - Q4: "If the project mandates a bilingual set (see project config), is every language version planned from Step 1, not added later? (BL-19 enforcement)"
- **Deliverable template (article-specific):**
  ```
  ## Article Plan (Analyst output for articles)
  Thesis: [one-sentence claim]
  Target corpus position: [which gap it fills]
  Sections: I. [name] | II. [name] | ...
  Per-section claims table:
    Section | Claim | Source/Derivation | Trust index (T1-T4) | Dependency
  Formula inventory: [list with precision / recomputation requirement per project config]
  Bibliography deltas: [new entries with identifiers verified]
  Bilingual plan (if project config requires): [which language first, parity rule]
  Check-First confirmation: [PASS/FAIL with item-by-item]
  Pipeline: Check-First → draft → compile → verification checks → commit
  Resource conflicts: [symbol collisions, section numbering, terminology drifts]
  System dependencies: [typesetting engine path, converter paths, fonts, reference bib database]
  B-check: F=_ E=_ (1-σ)=_ Λ=_ → B=_
  ```

### Builder (article focus)

- **FIRST attention anchor (A_F override):** Read the project's gold-standard reference article (the one the project config names as "format gold standard"). Read the 3 nearest corpus neighbour articles to extract terminology + notation (BL-29). Read the project's mandatory preamble / template (if one is declared in project config). Do NOT start drafting prose until all reads are complete. BL-17 + BL-21 are ACTIVE enforcement gates for article Builders.
- **Artifact definition:** The full project-defined artifact set. For a bilingual project with multiple output formats this may be 4–8 files; for a single-language markdown-only project this may be 1–2 files. The project config defines the exact set; Builder must NOT mark Done until every declared file exists. For bilingual projects this is BL-19 applied to articles.
- **Primary failure mode in article work:** Drafting prose directly into the source without having the outline + claims table + source requirement table from the Analyst. Result: a section that "reads well" but has unsupported claims, missing cites, and symbol collisions. Mitigation: Builder's Activation Operator requires reading the Analyst plan verbatim BEFORE writing any prose.
- **Second failure mode (applies to bilingual projects only):** Drafting one language first, "we'll do the other later." This is BL-19 violation. Mitigation: Section-by-section bilingual drafting (write section I in language A, immediately translate to language B, move on).
- **Third failure mode (optional, project-defined):** Evidence-marker omission. If the project config declares an evidence-marker scheme (e.g., `[FACT]` / `[DERIVATION]` / `[HYPOTHESIS]` / `[OPEN]` annotations), every substantive claim MUST carry a marker in the source. See project config for the exact marker types and syntax. If the project does not declare such a scheme, this failure mode is N/A.
- **Jidoka self-check (article specialization):**
  - Q1: "Have I read the gold-standard reference + 3 nearest neighbours? (F)"
  - Q2: "Does my draft match the outline+claims table from Analyst exactly, or have I slipped in unsupported claims? (E)"
  - Q3: "Are there any symbol collisions with the corpus? Terminology drift from the project glossary (if one exists)? (1-σ)"
  - Q4: "If the project declares an evidence-marker scheme, have I annotated every substantive claim? (Λ)"
  - Q5: "If the project mandates a bilingual set, have I drafted every declared language version of this section before moving to the next? (Λ per BL-19)"

### Validator (article focus)

- **FIRST attention anchor (A_F override):** Read the Analyst plan + the Builder's full artifact set (any missing file is defect 1). Read the project's verification-check list (see project `config.md` for the exact number and ownership of checks). Validator owns the final gate for all project-declared checks. Validator does NOT partially validate.
- **Artifact definition:** The full artifact set IN ITS FINAL FORM — the same thing a journal reviewer would see. Validator simulates the reviewer at the highest-stakes moment: pre-submission.
- **Primary failure mode in article work:** Running cite_check alone and saying PASS while the article has factual inconsistencies NOT caught by cite_check (e.g., "abstract says N=120, Table 2 says N=118" — see Example 3 below). Cite_check catches bibliography issues; it does NOT catch numerical/factual inconsistencies. Validator must run ALL project-declared checks, not just cite_check. This is the distinction between `verify.method: cite_check` (the PRIMARY gate) and the FULL validation gate (all project checks).
- **Secondary failure mode (if project uses evidence markers):** Trusting Builder's evidence markers. A claim tagged `[DERIVATION: postulate P3]` might actually be a post-hoc fit. Validator must AUDIT marker accuracy, not accept them.
- **Jidoka self-check (article specialization):**
  - Q1: "Have I run ALL project-declared checks, not just cite_check?"
  - Q2: "For each claim tagged as fact/cited (per project scheme), did I confirm the citation resolves AND the cited source actually supports the claim?"
  - Q3: "For each claim tagged as derived, did I confirm the derivation chain is explicit AND complete (not a jump)?"
  - Q4: "Are the numbers in the abstract, body, tables, and figures INTERNALLY CONSISTENT? (C6a factual-consistency subcheck)"
  - Q5: "If the project mandates a bilingual set, are all language versions validated (not just one)?"
  - Q6 (Skin-DEF-f): "For each numbered formula in the article, can I locate the derivation (in-article), the external citation pointer (cite + page/section), the axiomatic label, or the conjecture marker? If none of the four, the formula fails C6b provenance."
  - Q7 (Skin-DEF-e): "Computed `self_cite_rate`. Verdict from ladder: PASS (0-30%) / NOTES (30-50%) / NOTES ESCALATED (50-70%) / FAIL (≥70%). If ≥50%, did I record the load-bearing justification for each self-cite?"

### Coherent (article focus)

- **FIRST attention anchor (A_F override):** Read the full artifact set. Read the project glossary (if one exists — `projects/{PROJECT}/glossary.md`). Read the 3 nearest neighbour articles from the corpus. Coherent cares about *this article's fit with the corpus*, not the article in isolation.
- **Artifact definition:** The corpus + this article = new corpus. Coherent checks that (old corpus) ∪ (this article) remains coherent. This is L2 Coherent work (cross-team coherence, per `coherent_EN.md` Levels).
- **Primary failure mode in article work:** "Glossary drift" — a term that the project glossary defines as X is used in the new article with meaning Y. Or a symbol collision. Or a formula that appears in article A with one value and in this article with a slightly different value. These are ALL (1-σ) failures at the corpus level.
- **Secondary failure mode (if project is bilingual):** Phantom coherence between language versions. Both versions "agree" because they were generated in the same session, but actually introduce the same error in both — so cross-language check doesn't catch it. Mitigation: Coherent must perform independent verification of a sample of formulas and citations, not just diff language A ↔ language B.
- **Jidoka self-check (article specialization):**
  - Q1: "Does the new article use every technical term exactly as the project glossary defines it, if one exists? (BL-29)"
  - Q2: "Are there any symbol collisions with existing corpus articles?"
  - Q3: "If this article cites a formula from corpus article N, does it match article N verbatim?"
  - Q4: "If the project mandates a bilingual set, are language versions byte-equivalent in structure (same section count, same formula count, same citation count, same figure count)?"
  - Q5: "Independent spot-check: pick 3 formulas from the new article, recompute them without reading the article's computation. Do my results match?"
- **Bilingual sync rule (BL-19) specialization:** If the project config declares `bilingual: true`, Coherent is the ENFORCER of the language-parity rule. Commit is BLOCKED if the declared artifact set is incomplete or if language-version sizes diverge by >50% (suggests one version is incomplete).

---

## Verification Protocol (cite_check expanded)

This section maps directly to `domain.verify.method: cite_check` in the project `config.md`. The skin expands `cite_check` into 7 concrete sub-checks split across Validator L1 (per-section / per-commit) and Validator L2 (full-article / pre-submission).

### The seven cite_check checks

| # | Check | Who runs it | L1 or L2 | Enforcement mechanism |
|---|---|---|---|---|
| **C1** | **Bibliography completeness** — every in-text citation has a matching bibliography entry; every bibliography entry is cited at least once in the text | Validator | **L1** (per-commit: can miss a new cite) | Structural check — grep-based |
| **C2** | **Citation attribution** — claim X that cites source S is actually supported by S (not just mentioned by it) | Validator | **L2** (pre-submission: requires reading the cited paper) | Human + LLM assisted — best-effort |
| **C3** | **Identifier syntactic validity** — each DOI matches the DOI regex; each arXiv ID matches the arXiv regex; each URL is well-formed; other identifier types match their specs | Validator | **L1** | Pure regex check, automated |
| **C4** | **Internal cross-references** — `§3.2`, `\ref{thm:main}`, `\ref{fig:curve}`, `\eqref{eq:main}`, markdown anchor links, or the project's reference idiom — all resolve to real section/theorem/figure/equation inside the same source | Validator | **L1** (the compile/render step surfaces unresolved refs; Validator must READ the warnings) | Rendering/parser — automated |
| **C5** | **Self-citation sanity** — if author cites own prior work, the citation is load-bearing (not padding); at least one sentence explains what the prior work contributes. **Quantitative ladder:** 0-30% PASS / 30-50% NOTES / 50-70% NOTES ESCALATED / ≥70% FAIL — see C5 L2 judgment block below | Validator + Coherent | **L2** | Human judgment + Coherent review + `self_cite_rate` threshold |
| **C6a** | **Factual consistency** — numbers reported in abstract match numbers in body; figures match tables; abstract N = body N = table N | Validator | **L2** | Cross-reference scan — requires reading all occurrences of each numeric claim |
| **C6b** | **Formula provenance** — every numbered formula is Derived / Cited-with-pointer / Axiomatic / Conjectured with a visible marker. Asserted-without-derivation = FAIL. | Validator | **L2** | Per-formula provenance classification; mechanical aid + manual bucketing |

### Relationship to project-level verification checks

The 7 cite_checks above are a SUBSET + EXTENSION of whatever check list the project defines in its `config.md`. Typically a project declares additional checks beyond the 7 cite_checks (e.g., recomputation checks, precision checks, no-fitting checks, plagiarism checks, AI-marker scans). The skin states this explicitly so Validators do not interpret `verify.method: cite_check` as "only run the 7 cite_checks and skip the rest." The skin's verification section is PARTIAL — it covers the cite_check family specifically; the full article validation gate includes all project-declared checks.

If the project declares an evidence-marker scheme, the Validator must also audit marker accuracy (see Validator role override above and project config for the exact marker types).

### Verification block

```
[method name]: cite_check
[command]:     hybrid — L1 (C1/C3/C4) is grep/regex automatable,
               L2 (C2/C5/C6a/C6b) is Validator judgment.
               Compile step: project-defined (tectonic / pdflatex / xelatex / pandoc /
               typst / quarto / rmarkdown / etc. — see project config).
               Full protocol: reference implementation below + project-defined
               full-check set from project config.
[success criteria]: all 7 cite_check checks PASS (C1/C2/C3/C4/C5/C6a+C6b above)
                    AND all project-declared checks PASS AND every artifact declared
                    in the project config is present (BL-19 applies iff project is
                    bilingual) AND the document compiles cleanly in every declared
                    output. C5 verdict uses the quantitative ladder: PASS /
                    PASS WITH NOTES / PASS WITH NOTES ESCALATED / FAIL.
[failure recovery]: C1 → add missing biblio entry OR missing in-text cite;
                    C2 → re-read source, remove claim or find supporting source;
                    C3 → correct identifier syntax;
                    C4 → fix internal reference (or remove dangling ref);
                    C5 → if >30% explain load-bearing role for each self-cite
                         and consider balancing with external cites; if ≥70%
                         restructure or attach Coherent co-signed justification;
                    C6a → re-verify authoritative value and align all occurrences;
                    C6b → add in-article derivation, or add explicit pointer
                          into the cited source (page/section), or label as
                          postulate/axiom, or mark as conjecture/hypothesis.
[independence check]: Validator INDEPENDENTLY recomputes a sample of formulas
                      (project-defined check) — the article analog of "run tests,
                      don't just read the code." Phantom coherence detection (BL-5):
                      if Builder and Validator agree but neither recomputed
                      independently, flag PHANTOM. Sample size: see
                      "Sample-size contract" subsection below.
```

### cite_check reference implementation (C1/C3/C4 L1 automation, C2/C5/C6a/C6b L2 judgment)

Adapt the regexes below to the project's citation idiom (numeric `~[N]`, BibTeX `\cite{key}`, markdown `[@key]` or `[^N]`, APA inline `(Author, Year)`). `SRC` is the source file.

```bash
# C1 — Bibliography completeness (adjust regex to project citation idiom)
grep -oE '~\[[0-9]+(,\s*[0-9]+)*\]' "$SRC" | grep -oE '[0-9]+' | sort -u > /tmp/cites.txt
grep -oE '\\item\[\{\[[0-9]+\]\}\]' "$SRC" | grep -oE '[0-9]+' | sort -u > /tmp/biblio.txt
comm -23 /tmp/biblio.txt /tmp/cites.txt > /tmp/c1_orphans.txt
comm -13 /tmp/biblio.txt /tmp/cites.txt > /tmp/c1_dangling.txt
wc -l /tmp/c1_orphans.txt /tmp/c1_dangling.txt   # both 0 = PASS

# C3 — Identifier syntactic validity (DOI/arXiv shown; add ISBN/ORCID/Handle as project needs)
DOI_RX='10\.[0-9]{4,9}/[^[:space:]"}]+'
ARXIV_RX='(arXiv:)?[0-9]{4}\.[0-9]{4,5}(v[0-9]+)?'
grep -oE '(doi\.org/|DOI:?\s*)[^"[:space:]]+' "$SRC" | sed -E 's|.*doi\.org/||; s|^DOI:?\s*||' | grep -vE "$DOI_RX" > /tmp/c3_dois_invalid.txt
grep -oE "arXiv:[^[:space:]]+" "$SRC" | sed 's|^arXiv:||' | grep -vE "$ARXIV_RX" > /tmp/c3_arxiv_invalid.txt
wc -l /tmp/c3_dois_invalid.txt /tmp/c3_arxiv_invalid.txt   # both 0 = PASS

# C4 — Internal cross-references (compile/render log surfaces unresolved refs)
"$COMPILER" "$SRC" 2>&1 | tee /tmp/c4_build.log
grep -cE 'undefined|multiply.defined|Citation .* undefined|could not find|undefined reference' /tmp/c4_build.log   # 0 = PASS
```

#### C2, C5, C6a/C6b (L2, judgment protocol) + sample-size contract

**C2 — Citation attribution.** Per citation: (1) source lookup (if inaccessible → NOT-CHECKABLE, escalate to BL-A4); (2) quote the bearing sentence; (3) does the source support that SPECIFIC claim, not just the general topic? Over-generalization ("Source X is about HRV" → "supports the +30% HRV claim") is the canonical C2 failure. Coverage: EVERY T3/T4 citation in the Analyst Source Register; spot-check T1/T2 per sample-size contract below.

**C5 — Self-citation sanity.** Article must contain a sentence stating what the cited prior work CONTRIBUTES; decorative (non-load-bearing) = FAIL.

**C5 quantitative thresholds** (calibrated on smoke tests). Compute `self_cite_rate = count(in-text citations where author matches primary author of the current article) / count(total in-text citations)`. Verdict ladder:

- **0–30% → PASS.** Normal for single-author academic articles.
- **30–50% → PASS WITH NOTES.** Elevated. Flag for editorial review — for each self-cite, ask: replaceable by a primary source or more recent external cite?
- **50–70% → PASS WITH NOTES ESCALATED.** Substantial. Builder MUST justify: "each self-cite contributes a load-bearing result that cannot be sourced elsewhere." Validator records justification and flags for Coherent at RT-2.
- **≥70% → FAIL.** Echo chamber. Require restructure OR Validator justification with Coherent co-sign at RT-2.

**Basis:** Empirical norm for peer-reviewed physics ~30%; single-author research corpora can run higher by construction. Projects with intentionally higher self-cite profiles (e.g., a single-author research programme building on its own prior results) may shift these thresholds via overlay — see project overlay file if declared.

**C6a — Factual / numerical consistency.** Per numerical claim appearing in >1 location (abstract / body / table / figure caption / conclusion): (1) extract every occurrence (`grep -nE '[0-9]+[.,][0-9]+' "$SRC"` as starting point); (2) cross-check for silent shifts (abstract "120" vs table "118", per Example 3); (3) for formulas, recompute per sample-size contract. EXHAUSTIVE for cross-occurrence numbers; single-occurrence numbers → sample-size.

**C6b — Formula provenance.** For every numbered/tagged formula, Validator verifies one of four visible provenance labels:

1. **Derived** — in-article derivation chain with ≥1 intermediate step.
2. **Cited** — external source with concrete pointer (cite key PLUS section/page reference inside the source, not just the cite key alone).
3. **Axiomatic / postulated** — explicit label ("Postulate P4", "Axiom 3", or project evidence-marker equivalent).
4. **Conjectured / hypothesized** — explicit label ("Conjecture 1", "Hypothesis H-2", or project evidence-marker equivalent).

**Failure mode:** "Load-bearing formula X asserted without derivation, citation, axiomatic label, or conjecture marker." **L2 mechanical aid:** `grep -B3 -A1 '<formula-tag-pattern>' "$SRC"` extracts per-formula local context; Validator manually buckets each. L2 because grep alone cannot distinguish "derived with visible chain" from "asserted".

**Temporal exception:** If the project config introduces an evidence-marker scheme mid-corpus (i.e., older articles lack markers because they predate the scheme), C6b still applies via in-text presentation — an article without comment-style markers can PASS C6b if provenance is visible in the compiled prose (numbered Postulate block, Conjecture label, proof sketch paragraph). C6b demands visible provenance in whatever form the article uses; it does not retroactively require project-specific markers.

**Sample-size contract** — single source for C6 recomputation depth AND the `[independence check]` "sample of formulas" phrase:

```
total_formulas = count numbered-formula blocks in the source
sample_size    = max( 3, ceil( sqrt(total_formulas) ) )    # 9→3, 22→5, 50→8, 100→10
```

Floor of 3 keeps tiny articles meaningful; √N = BL-17 Check-First pattern. **Selection is DETERMINISTIC, not random.** Mandatory inclusions: (1) one formula from the **abstract** if it cites any — catches abstract/body drift (Example 3); (2) one from **main results** — catches load-bearing recomputation failure; (3) one from **appendix / late section** if present. Remaining slots (if `sample_size > 3`) fill unrepresented sections; if `sample_size ≤ 3`, the 3 mandatory inclusions ARE the sample.

---

## PR-Gate (Publication Readiness, BL-A5 extension of Inv 17 publication-layer)

PR-Gate fires AFTER V-Gate (engineering validity, BL-A1..A4) but BEFORE
declaring артефакт «ready». BL-A5 = sequencing rule: V-Gate ≠ PR-Gate.

V-Gate = the cite_check + BL-A1..A4 set above (engineering validity: bibliography, render, retraction plan, identifier PRE-FLIGHT). V-Gate GREEN means the artifact is structurally sound. It does NOT mean publication-ready. PR-Gate is the second gate that checks the publication surface — typography, visual artifact, naive-reader decodability, stylistic parity, decision-log audit. Sequencing rule (BL-A5): V-Gate ≠ PR-Gate; both must pass; META MUST not declare "ready" on V-Gate alone.

### PR-1 Visual artifact inspection (Validator MUST open rendered PDF)
- Validator opens rendered PDF (or equivalent visual output), не только text source
- Checks: typography ligatures correct (em/en-dashes, smart quotes), figures render,
  cross-references resolve, citation slugs not literal
- Tier: T3 checklist + T2-upgradable visual diff hook
- Failure: ANDON, return to Builder for typography fix

### PR-2 Naive-reader test
- Persona: external reader НЕ knowing project-internal slugs
- Reads abstract + intro: can decode без looking up project glossary?
- Failure mode: «slug citations in abstract» (e.g., [L-32], [BL-A2]) instead of
  full names + journal-style references
- Tier: T3 checklist (operator-side)

### PR-3 Stylistic parity (across language variants)
- If domain.bilingual: true — RU/EN versions match in citation style, dash type,
  paragraph structure
- Tier: T2 hook (extends BL-19 bilingual sync)

### PR-4 Decision-log audit
- Each Builder default (e.g., choosing slug citation form) MUST be logged
- Coherent reviews log при PR-Gate; flags «buried OD» (per Inv 16 OD-discipline
  extension to non-rework decisions)
- Tier: T3 checklist (Coherent responsibility)

### PR-Gate verdict
- All 4 PR-checks MUST pass before «publication ready» declaration
- B-score GREEN на V-Gate ≠ ready (see meta.md GREEN ≢ ready amendment)
- META MUST not declare ready без explicit PR-Gate PASS

---

## RT Phase Protocol for articles

Code projects use the canonical phase protocol from `eradev.md` Section VI:
Visionary (direction) → Analyst (design) → Builder (implement) → Validator (test) → Coherent (integrate).

Articles need adjustments because the work profile is different. **Three RT invocation points** apply:

1. **RT-0 (Visionary solo, RECOMMENDED for articles): thesis / corpus-collision check.** Before any RT-1. Runs when the operator proposes a new article. Visionary alone evaluates: is this thesis new, does it fit the corpus, is it falsifiable (OOD check)? A YES from Visionary unlocks RT-1. Output is a single-paragraph decision:
   - "APPROVED: thesis is new; closest corpus neighbour is article N which covers X, leaving room for Y; falsifiable via Z; proceed to RT-1."
   - OR "REJECTED: thesis collides with article N; propose a different angle."
   - OR "OUT-OF-SCOPE: thesis is speculative, no discrete verification possible."
2. **RT-1 (mandatory, full 5-role): outline + claims + plan.** Before any drafting. Produces the Analyst deliverable template (Analyst sub-section above). Builder does NOT start writing until RT-1 approves a plan.
3. **RT-2 (mandatory, pre-submission): full gate.** Before the article is submitted to a journal / uploaded to a preprint server / committed as a "final" version. Runs all project-declared checks + the 7 cite_checks + bilingual set check (if project is bilingual).

**No RT between RT-1 and RT-2 for single-section articles.** For multi-section articles (>4 sections), an intermediate RT-1.5 may be run after each section's draft, but this is OPTIONAL.

### Single Builder with section-by-section rhythm

The article Builder is a **SINGLE agent** (not "outliner + drafter" split). Within that single Builder session, the rhythm is:
- For each section I in the outline:
  1. Draft section I in the primary source language
  2. (If project is bilingual) Immediately draft section I in the secondary language (BL-19 enforcement)
  3. Compile/render all declared output formats (catches source errors early)
  4. Annotate evidence markers for all substantive claims (if project declares such a scheme)
  5. Move to section I+1

Outline + draft live in the same mental model of the argument. Splitting them into two agents would cause the drafter to lose the context that the outliner had — increasing |B_outliner − B_drafter| and decreasing S_team. Keeping them unified is consistent with the v9 principle that *role is a focus, not a specialization*.

**Pre-drafting language-purity gate (per L-40 + L-46 ODTOE):**
Before drafting RU section content, verify META spec contains NO bare English content words in the spec body (excluding math/code/L-21 KEEP). If detected, ANDON: this is META prompt-design failure, not Builder issue. Don't paper over by translating on the fly — ANDON forces upstream fix per L-46 inheritance rule.

**Exception (L/XL only):** For an XL article (>8000 words, >4 sections), the Analyst plan may split work across *two Builders* by section ownership (Builder A owns sections I-III, Builder B owns sections IV-VI). File Ownership rule from `analyst_EN.md` Responsibilities 4 applies. Coherent gate is MANDATORY between Builder completion and Validator start.

### Pipeline block

```
Article pipeline (FIXED):
RT-0 (Visionary solo, optional) → thesis/corpus-collision approval
RT-1 (full 5-role) → outline + claims table + Analyst plan
Builder loop per section:
  draft primary language → (draft secondary language if bilingual) →
  compile/render declared outputs → evidence markers (if project declares) →
  next section
Coherent gate (after all sections drafted)
RT-2 (full 5-role) → 7 cite_checks + project-declared checks +
  bilingual set check (if applicable)
Commit all declared artifacts together
Submission / preprint / journal → outside EraDev scope (manual operator action)
```

---

## Checklists

### Pre-Generation Checklist (Check-First, BL-17, BL-21)

Run BEFORE any source writing begins. Projects may extend this list via overlay or via project `config.md`.

- [ ] **1. FORMAT:** Read the project's gold-standard reference article (full preamble / template + first section) — the format to match
- [ ] **2. FORMULAS:** List ALL formulas. Recompute each independently to the precision the project config requires. Do NOT copy from other articles.
- [ ] **3. CONSTANTS:** Prepare the required-precision values for all constants the formulas use (π, φ, e, or project-specific constants).
- [ ] **4. SOURCES:** List ALL bibliography entries. Verify each: identifier exists, publisher/year correct, page numbers match.
- [ ] **4b. SOURCE REGISTER:** For every key assertion, create mapping `{Section | Claim | Source | Trust: T1/T2/T3/T4}` where T1=peer-reviewed with resolvable identifier, T2=corpus-internal (verified in prior articles), T3=preprint/conference, T4=novel claim (requires derivation artifact per project scheme). If >30% claims are T3/T4, flag for additional review.
- [ ] **5. STRUCTURE:** Define section plan. Verify no overlap with existing corpus articles.
- [ ] **6. CONSISTENCY:** Check terminology matches the project glossary (if one exists). No contradictions with corpus.
- [ ] **7. LANGUAGE:** If the project is bilingual, confirm every declared language version will be produced simultaneously (BL-19).
- [ ] **8. RT-0 CORPUS-COLLISION:** Visionary has confirmed the thesis does not duplicate an existing corpus article.

### Post-Generation Checklist (Jidoka gate)

Run AFTER Builder completes section-by-section drafting and BEFORE Validator starts RT-2.

- [ ] **1. ARTIFACT SET:** Every artifact the project config declares is present (apply BL-19 if project is bilingual).
- [ ] **2. COMPILE:** Every declared output format compiles/renders cleanly (exit 0, no critical warnings).
- [ ] **3. NO WARNINGS:** No unresolved internal references; no overfull/underfull warnings in changed sections (if typesetting engine reports them).
- [ ] **4. EVIDENCE MARKERS:** Every substantive claim annotated per the project's evidence-marker scheme, if the project declares one — **SEE TEMPORAL EXCEPTION** for articles authored before the scheme's introduction.
- [ ] **5. CITE_CHECK C1–C7:** All 7 cite_check sub-checks PASS.
- [ ] **6. PROJECT CHECKS:** All project-declared verification checks PASS.
- [ ] **7. BILINGUAL PARITY:** If bilingual, every language version has the same section count, formula count, citation count, figure count.
- [ ] **8. GLOSSARY ALIGNMENT:** If the project maintains a glossary, every canonical term is used with the correct meaning.

#### Temporal exception for mid-corpus scheme introduction

If the project introduces a new scheme (evidence markers, glossary update, typesetting rule) AFTER some articles were authored, the older articles are LEGACY INFO, not FAIL:

```bash
git log --diff-filter=A --format=%at -1 -- "$SRC"   # preferred: first-add commit
stat -f %m "$SRC"  # macOS fallback  |  stat -c %Y "$SRC"  # GNU fallback
# Compare vs project-declared TEMPORAL_CUTOFF.
```

**Validator verdict labels** (report MUST include authoring date):
- **Case A** — scheme violation, authored ≥ cutoff → **FAIL** (content defect).
- **Case B** — scheme violation, authored < cutoff → **LEGACY INFO** (NOT a check pass; scope declaration; once revised post-cutoff, inherits the rule).
- **Partial scheme adoption, same split:** ≥ cutoff → **FAIL (partial)**; < cutoff → **PARTIAL LEGACY**.

---

## Examples (3 concrete)

### Example 1: Unsupported claim (C2 failure)

- **Input:** "Add section III to the article, including a claim that the Lyapunov exponent λ_L > 0 for all observer states."
- **Scenario:** Builder writes the section, cites `[Smith2020]` for the λ_L > 0 claim, and moves on. At RT-2, Validator runs C2 (citation attribution) by reading Smith2020.
- **What Validator finds:** Smith2020 actually proves λ_L > 0 for *a specific sub-class* of observer states (those with measurable phase space), not for ALL states. The cited claim is stronger than what the source supports.
- **Catching role:** **Validator** (C2 is L2, requires reading the source).
- **Phase:** **RT-2** (pre-submission gate).
- **Fix:** Builder must either (a) weaken the claim to match Smith2020 — "for measurable-phase-space observer states, λ_L > 0 per [Smith2020]"; or (b) find a source that actually proves the stronger claim; or (c) provide an independent derivation. This is also a "no fitting" concern: if no source exists, the claim MUST be derived from the project's theoretical framework or removed.
- **Why cite_check alone would miss this:** C1 (bibliography completeness) would say PASS — the citation is in the bibliography. C3 (identifier syntax) would say PASS — the DOI is valid. Only C2 (reading the cited source) catches it. This is why the skin's verification protocol distinguishes L1 (mechanical) from L2 (interpretive) checks.

### Example 2: Outline contradiction between sections (Coherent σ failure)

- **Input:** "Draft outline for an 8-section article 'Dualities in observer geometry.'"
- **Scenario:** Analyst plan lists Section III as "Observer-dependent metric" with the definition "the metric is a functional of the observer's information state" and lists Section V as "Bulk metric reconstruction" with the definition "the bulk metric is objective and independent of any observer." At RT-1, both section sketches pass Builder's Jidoka (each is internally consistent).
- **What Coherent finds:** The two sections are mutually contradictory — Section III says metric is observer-dependent, Section V says it is observer-independent. If the article were drafted as-is, Section V would silently overwrite Section III's assertion.
- **Catching role:** **Coherent** (this is the canonical Coherent failure-mode — divergent meanings of the same term across parallel work).
- **Phase:** **RT-1** (outline review, before Builder starts drafting). Coherent's σ (contradiction rate) spikes because Sections III and V disagree on a foundational term.
- **Fix:** Coherent invokes Phantom Coherence Check (`coherent_EN.md` Key Rules 2) and asks each role individually: "Is the metric observer-dependent or objective?" The divergence forces a RT-1.5 where Visionary clarifies which definition is the article's load-bearing one, and the outline is rewritten so that either (a) Section V redefines "bulk metric" as an information-theoretic construct compatible with Section III, or (b) Section V is removed entirely.
- **How the skin's vocabulary maps this:** "observer-dependent metric" vs "observer-independent metric" = a **symbol collision** (vocabulary row 22). Vocabulary row 2 (function → claim) and row 3 (module → section) apply. Coherent's drift detection catches this by running the "does the new article use every technical term exactly as the glossary defines it?" query.

### Example 3: Numerical inconsistency abstract vs table (C6a failure, cite_check blind spot)

- **Input:** "Add an empirical section reporting results from a simulation of 120 observers."
- **Scenario:** Builder drafts section IV. The abstract says "We ran 120 simulations." The section IV body says "We ran N=120 trials." Figure 4's caption says "N=120 observers." Table 2's header row says "Results over 118 observers." Builder compiles, the PDF looks clean, submits to Validator.
- **What Validator finds:** When running C6a (factual consistency), Validator notes the discrepancy — abstract/body/figure all say 120, Table 2 says 118. One of them is wrong. Reading the raw simulation output: actually 120 simulations were RUN, but 2 were excluded for data quality reasons, so the TABLE represents 118. Neither the abstract nor the body nor the figure caption mentions the exclusion.
- **Catching role:** **Validator** (C6a is L2; requires cross-reference scan of every numerical claim across the article).
- **Phase:** **RT-2** (pre-submission).
- **Fix:** Either (a) update abstract/body/figure to explain the exclusion — "120 simulations run; 118 analyzed after QC filtering"; or (b) re-run the simulations so N=120 is consistent; or (c) re-examine the exclusion criterion.
- **Why cite_check alone (C1–C5) is insufficient:** None of C1–C5 touch numerical facts inside the article. C1 is about bibliography entries. C2 is about attribution. C3 is about identifier syntax. C4 is about internal reference resolution (which might be OK — figure 4 and table 2 both resolve). C5 is about self-citation. C6a is the ONLY cite_check variant that catches this. C6a is placed in the skin's verification protocol precisely to make visible that "cite_check" in the article domain is a FAMILY of checks, not just "do citations resolve." This example is the didactic case for WHY the skin expands cite_check into 7 sub-checks and does NOT treat it as monolithic.

---

## Domain-Specific Bootstrap Lessons

The article skin inherits all 22 universal BL from `BOOTSTRAP_LESSONS_universal.md` **unchanged**, handles each of the 8 code-adapter BL individually (2 transfer unchanged, 4 have article equivalents BL-A1..A4, 2 are N/A), and adds 5 article-specific BL in the BL-A namespace (BL-A1..A5).

### Universal BL inherited (22 entries — all unchanged, 1-line applicability note each)

| BL | Title | Applicability to article work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Applies unchanged — a fresh article project starts with Λ=0.5; accumulates as articles land in the corpus |
| BL-4 | S_adjusted = S_team × B_mean | Applies unchanged — Coherent at RT-2 computes S_adjusted from the 5 role B scores |
| BL-5 | Phantom Coherence Detection | Applies unchanged — bilingual-project manifestation is "both language versions contain the same formula error" (see Coherent secondary failure mode) |
| BL-7 | EN for Practical Tasks, RU for Theoretical Depth | Applies unchanged — article drafting is practical (EN role files), theorem derivation is theoretical (RU role files may be used for formula derivation) |
| BL-9 | Interface Contracts Between Roles | Applies unchanged — Analyst→Builder contract is the section-by-section claims table; Builder→Validator contract is the full artifact set + evidence markers (if project declares) |
| BL-10 | Multiplicative B Structure | Applies unchanged — weights are `research` profile (F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15) |
| BL-11 | Scope Creep is Muda | Applies unchanged — "while drafting section III, I noticed section II also needs fixing" = SEPARATE task |
| BL-12 | Hansei Targets Process, Not People | Applies unchanged — post-submission reflection is about why the pipeline missed X, not which agent wrote X |
| BL-13 | Yokoten — One Lesson, All Analogous Cases | Applies unchanged — "grep the codebase" maps to "terminology scan across the corpus" |
| BL-15 | 2% Spiral Gap | Applies unchanged — an article always ships with some open questions; those become the next article |
| BL-16 | Reading the Framework ≠ Applying It | Applies unchanged — META must still delegate article work to agents, not draft sections directly |
| BL-17 | Pre-Generate Verification = Prevention | **Critical for articles** — Check-First pipeline (Pre-Generation Checklist above) is the article-specific implementation of BL-17 |
| BL-18 | Scope Reclassification at 2× Estimate | Applies unchanged — a 1-section article that grows to 6 sections must be reclassified S→L |
| BL-19 | Bilingual Files Simultaneous | **Conditional for articles** — applies iff the project declares `domain.bilingual: true` or equivalent; then the full artifact set must include every declared language version simultaneously |
| BL-20 | Adversarially Test Bootstrap | RETIRED in main `BOOTSTRAP_LESSONS.md` 2026-04-20 (moved to `meta.md` §13 MM3); still listed in `BOOTSTRAP_LESSONS_universal.md` for backward compat. Applies unchanged — test the article skin file itself against a trial article before deployment |
| BL-21 | Format Specifications Are Inputs | MERGED into BL-17 in main `BOOTSTRAP_LESSONS.md` 2026-04-20; still listed in `BOOTSTRAP_LESSONS_universal.md` for backward compat. **Critical for articles** — the project's mandatory preamble/template is the format spec read BEFORE any draft |
| BL-26 | META Always Delegates | Applies unchanged — META never drafts article prose directly |
| BL-28 | Agent Prompt Must Include Explicit Context | Applies unchanged — article-task agent prompts must name the skin file path AND role file path; if project has an overlay, name that too |
| BL-29 | Verify Established Terminology Before Generating | **Critical for articles** — article Builder must scan corpus for terminology before drafting (the project glossary, if one exists) |
| BL-30 | Defense-In-Depth | Applies unchanged — article validation has layers: Builder Jidoka + Coherent gate + Validator project checks |
| BL-31 | Constrain Output Types | Applies unchanged — Builder's output is the declared artifact set, not prose explanations |
| BL-32 | Grep After BL Merge | Applies unchanged — if article glossary terms are renamed, grep the whole corpus for orphan references |

### Code-adapter BL handled individually (8 entries)

| BL | Title | Verdict for articles | Notes |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | **Article equivalent: BL-A1** | Submission/publication changes require PRE-FLIGHT (preprint first, full journal later). See BL-A1. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Applies unchanged** | Article equivalent is "3+ consecutive revisions of the same section = STOP, re-spec the claim." Transfers cleanly; no new BL-A needed. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | **Article equivalent: BL-A2** | Before committing a source change, Builder must run the project's compile/render step AND `cite_check` AND bilingual check (if project is bilingual). See BL-A2. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **N/A for articles** | Articles have no feature flags. Publication state (draft/preprint/submitted/accepted/published) is a gradient but has no toggle mechanism. |
| **BL-14** | Rollback Plan Before Deploy | **Article equivalent: BL-A3** | MERGED into BL-8 in main `BOOTSTRAP_LESSONS.md` 2026-04-20; still active in `BOOTSTRAP_LESSONS_code_adapter.md`. Before submitting to a journal, Builder must document the retraction plan. See BL-A3. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Article equivalent: BL-A4** | Before Analyst RT-1, every identifier (DOI/arXiv/URL) must be verified syntactically (C3) and, for novel references, the cited source must be accessible. See BL-A4. |
| **BL-24** | Single-Responsibility Commits | **Applies unchanged** | Article equivalent is "one commit = one section's declared artifact set update." Transfers cleanly; no new BL-A needed. |
| **BL-25** | Error Path Coverage Matrix | **N/A for articles** | Articles do not have "happy/error/timeout/restart/partial" runtime paths. The analog would be "what if the paper is rejected" but that's BL-A3 (retraction plan), not a 5-path matrix. |

Summary: 2 code-adapter BL apply unchanged (BL-3, BL-24); 4 have article equivalents (BL-2→A1, BL-6→A2, BL-14→A3 [BL-14 merged into BL-8 in main BOOTSTRAP_LESSONS.md 2026-04-20; BL-A3 retains code_adapter provenance], BL-22→A4); 2 are N/A (BL-8, BL-25).

### Article-specific BL (BL-A namespace — separate budget)

These 5 BL live in this skin file ONLY. They do NOT add to the main 30-BL budget. They are loaded by the article domain adapter layer, not by META-Orchestrator's universal bootstrap.

**BL-A1: Submission is a Release Event (article adaptation of BL-2)**
- **Source:** Adapted from BL-2 for the article domain.
- **Rule:** Submitting an article to a journal is a release event. It requires: preprint-first canary (preprint server upload before journal submission), a 7-day reviewer-silence window before considering the submission "stuck," and a rollback plan (withdrawal procedure documented).
- **Why:** Journal submissions have unbounded reputational blast radius. A withdrawn paper leaves a permanent trace. Canary via preprint constrains the damage surface.
- **Applies to:** Visionary (approve submission), Builder (preprint first), Validator (pre-submission gate).

**BL-A2: Verify Before Commit — Render Validity Gate (article adaptation of BL-6)**
- **Source:** Adapted from BL-6 for the article domain.
- **Rule:** Before committing any source change, Builder MUST run the project's compile/render step against every declared output format, capture the log, and confirm: (a) exit code 0, (b) no critical warnings in the changed section, (c) all internal references resolve. Commit is REJECTED otherwise.
- **Why:** A source file that "looks right" in the editor but doesn't compile/render is the article equivalent of unverified code. Cost of compile check: seconds. Cost of a broken source in the corpus: minutes of debugging per reader.
- **Applies to:** Builder, Validator, META.

**BL-A3: Retraction Plan Before Submission (article adaptation of BL-14)**
- **Source:** Adapted from BL-14 for the article domain. (Note: BL-14 merged into BL-8 in main `BOOTSTRAP_LESSONS.md` 2026-04-20 as part of deployment-event checklist; BL-A3 retains code_adapter provenance since `BOOTSTRAP_LESSONS_code_adapter.md` still defines BL-14.)
- **Rule:** Before an article is submitted to a journal or uploaded as a preprint, Builder MUST document the retraction procedure: who to contact, what the retraction notice would say, and what the corpus-level rollback looks like (e.g., "remove from corpus, mark as retracted in index, note in changelog"). If you cannot describe how to undo a submission, you do not have permission to submit.
- **Why:** Post-submission pressure (editor deadlines, reviewer hostility, public visibility) is when cognitive load peaks. A pre-written retraction plan executes mechanically when needed.
- **Applies to:** Visionary (approve retraction plan), Builder (write it), Coherent (store in MEMORY).

**BL-A4: Bibliography PRE-FLIGHT (article adaptation of BL-22)**
- **Source:** Adapted from BL-22 for the article domain.
- **Rule:** Before RT-1 begins on any article task, Analyst MUST verify every identifier the article will cite: (a) identifier syntax is valid (C3), (b) for novel references (T3/T4 in the Source Register), the source is accessible to the author AND at least one key fact from each source is confirmed. Produce a VERIFIED REFERENCES artifact (a small table: identifier | cited claim | confirmed true/not-checked). Unverified references = Builder BLOCK (RED on A_F) at RT-1, Validator BLOCK at RT-2.
- **Why:** Hallucinating that a paper says X is the top F=0 failure in article work. The article skin's C2 (citation attribution) is the L2 version; BL-A4 is the L1 pre-flight that prevents the worst cases before drafting starts.
- **Applies to:** Analyst (RT-1), Validator (RT-2 re-verification), Builder (block without artifact), META (enforce gate).

**BL-A5: Publication Readiness Gate (V-Gate ≠ PR-Gate sequencing rule, extension of Inv 17 publication-layer)**
- **Source:** Post-CONSOLIDATION lift, RT-9 ODTOE Hansei (errors F1 ASCII dashes in PDF, F2 slug-citations in abstract, F4 BL-A2 GREEN-blind, F6 missing naive-reader persona). Per L-50 (extend>add) — extension of Inv 17 publication-layer, not a new framework BL.
- **Rule:** Engineering validity (cite_check + BL-A1..A4 = "V-Gate") and publication readiness ("PR-Gate") are SEPARATE gates. After V-Gate GREEN, before declaring the artifact "ready", the article MUST pass PR-Gate: PR-1 visual artifact inspection (rendered PDF, typography, slug-citations not literal), PR-2 naive-reader test (abstract decodable without project glossary), PR-3 stylistic parity (RU/EN dash type, citation style, paragraph structure if `domain.bilingual: true`), PR-4 decision-log audit (Builder defaults logged, Coherent flags "buried OD" per Inv 16 OD-discipline extension). Full PR-Gate spec: see "PR-Gate (Publication Readiness)" section above.
- **Why:** v9 framework caught engineering validity (BL-A1..A4) but NOT publication readiness — Hansei error F1 (ASCII dashes shipped to PDF), F2 (slug-citations in abstract), F4 (BL-A2 GREEN-blind to typography), F6 (no naive-reader persona). PR-Gate makes the publication surface a first-class gate; META MUST not declare "ready" on V-Gate alone (GREEN ≢ ready per meta.md amendment).
- **Applies to:** Validator (PR-1 rendered PDF inspection + PR-2 naive-reader simulation, PR-3 parity check), Builder (typography correctness, decision-log entries for PR-4), Coherent (PR-3 cross-language parity + PR-4 OD-audit), META (PR-Gate PASS gate before "ready" declaration).

### BL budget summary

- Universal BL inherited: **22** (unchanged)
- Code-adapter BL that apply unchanged: **2** (BL-3, BL-24)
- Code-adapter BL with article equivalents: **4** (BL-2, BL-6, BL-14 [merged→BL-8 in main BL, 2026-04-20], BL-22 → BL-A1..A4)
- Code-adapter BL that are N/A for articles: **2** (BL-8, BL-25)
- Article-specific BL (BL-A namespace, separate budget): **5** (BL-A1..A5)

**Total BL an article agent carries: 22 universal + 2 transferred code-adapter + 5 BL-A = 29 BL.**
(The 2 N/A code-adapter BL are NOT loaded; article agents do not "know" about them.)

### Project lessons.md integration

**Rule:** The skin inherits 22 universal BL from `BOOTSTRAP_LESSONS_universal.md` AND defers to `projects/{PROJECT}/lessons.md` for project-specific rules. On conflict, the project lessons.md **takes precedence for project-scoped concerns** — the skin encodes the article-domain invariant, the project lessons encode the project-specific enforcement patterns.

**Temporal exception clause:** rules introduced AFTER an article's file-system mtime (`git log --diff-filter=A --format=%at -1` preferred, `stat` fallback) are **LEGACY INFO, not FAIL**. Same Case A / Case B / Partial split as the temporal exception subsection in the Post-Generation Checklist above.

**Validator one-line routine:** Read `projects/{PROJECT}/lessons.md` → extract project-specific rule list → apply temporal exception per rule → supplement the 7 cite_check sub-checks + project-declared checks with project rules. Post-mtime violation = temporal N/A; pre-mtime violation = real defect.

**Applies to:** Validator (RT-2 primary reader), Coherent (cross-corpus propagation), Builder (pre-commit), Analyst (RT-1 Check-First preamble).

---

## Project-specific glossary pointer

This skin does NOT bake in a concrete glossary. If the project maintains one (a canonical term set the article Builder must align with), it lives at `projects/{PROJECT}/glossary.md` and is read by Analyst during Check-First item 6 (CONSISTENCY), by Builder during A_σ, by Validator at RT-2, and by Coherent at the corpus-integration gate.

### Generic article-writing terms (universal — not project-specific)

A small vocabulary every article agent should recognize independent of project:

| Term | Meaning |
|------|---------|
| `abstract` | summary paragraph at top of article, self-contained, contains the central claim and key numerical results |
| `corresponding author` | author responsible for correspondence with editor and readers |
| `cite key` | machine-readable identifier for a bibliography entry (e.g., `smith2020`, `[42]`, `[@smith2020]`) |
| `DOI` | Digital Object Identifier — persistent identifier for publications |
| `preprint` | pre-peer-review version uploaded to a preprint server (arXiv, bioRxiv, SSRN, etc.) |
| `gold-standard article` | the project's canonical format reference — the article a new one should match in preamble, structure, section style |
| `self-citation` | citation of the author's own prior work (see C5 for thresholds) |
| `evidence marker` | a comment-style annotation in the source tagging epistemic status of a claim — project-defined; see project config for the specific scheme |
| `corpus` | the body of articles the project has already published that the new article must remain coherent with |
| `preamble` | the top portion of a source file that declares format, fonts, packages, math macros, citation style |

For the project's **specific** canonical terms (theory-specific variables, theorem names, constants), see `projects/{PROJECT}/glossary.md`.

---

## Known Out-of-Scope (OOD)

Tasks that LOOK like article work but FAIL v9's text-discrete AND-gate. Agents must escalate these to Visionary RT-0 and, when confirmed OOD, defer to the OOD Registry — do NOT auto-proceed under the article skin.

- **Free-verse poetry.** No discrete verification — there is no cite_check, no recomputation, no glossary alignment. Aesthetic judgment is continuous, not discrete. FAILS on `verify.method`. Route to `creative` skin (deferred) or reject.
- **Speculative philosophy essays.** The central claim is a metaphysical position, not a falsifiable statement. There is no experiment, no proof chain, no numerical check. FAILS on objective verification. Visionary RT-0 is the explicit gate for catching this pattern.
- **Real-time author interviews / transcripts.** A live conversation is a continuous stream, not a discrete artifact. Even transcribed, it lacks the proof-chain structure that makes cite_check meaningful. FAILS on discreteness. Route to a separate `transcript` skin (deferred) or reject.
- **Review articles / position papers.** Load-bearing property is argument arc, not proof chain. These are closer to `creative` B-weighting than `research`. Deferred to a separate skin; for now reject with note "no review-article skin yet — use narrative modality when it lands."
- **Blog posts / op-eds.** No bibliography, no proof obligation, no formal structure. Blog posts CAN have `type=article` in name but lack the checks this skin requires. FAILS on Check-First items 2-6. Not blocked outright, but agents must verify that the operator actually wants the full research-article rigor before proceeding.

---

## Footer

*Last updated: 2026-04-26*
*Upstream roles: roles/{role}_EN.md (all 5 roles — Visionary, Analyst, Builder, Validator, Coherent)*
*Upstream math: eradev.md Section II.1 (B_research weights)*
*Upstream BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)*
*Overlay contract: see `templates/domain_skin.md.template` — projects with corpus-specific rules (filename convention, preamble, glossary, bilingual mandate, citation idiom) add `domain.overlay: <path>` to their `config.md`*
