# EraDev v9 Phase 2.1 — Article Domain Skin Specification

> Date: 2026-04-11
> Role: [ANALYST]
> Task: Phase 2.1 — specify `templates/domain_skin.article.md` (first concrete L2 domain skin)
> Output type: Report (META type 5) — Analyst spec for Builder hand-off
> Language stack: EN (practical task — artifact design)
> Zone: Pull with Resonance flavor (specific target + cross-domain bridge code→article)

---

## Activation Operator Results

- **A_F (Focus)**: Read `roles/analyst_EN.md`, `templates/domain_skin.md.template`, `reports/v9_phase0a_visionary_2026-04-11.md`, `reports/v9_phase0a_analyst_2026-04-11.md`, `projects/odtoe-articles/config.md` (FULL file, 299 lines — authoritative live reference), all 5 role files (`visionary_EN.md`, `analyst_EN.md`, `builder_EN.md`, `validator_EN.md`, `coherent_EN.md`), `BOOTSTRAP_LESSONS_universal.md` (22 BL), `BOOTSTRAP_LESSONS_code_adapter.md` (8 BL). True North: produce a spec rigorous enough that a Builder writes the skin file in one shot without design decisions.
- **A_E (Alignment)**: The spec must be a BRIDGE, not a replacement. Role files already carry article examples (Visionary Ex.2, Analyst Ex.2, Builder Ex.2, Validator Ex.2, Coherent Ex.2) — they are partially abstract. The skin adds *focus overrides*, not reruns. And `odtoe-articles/config.md` already contains a full Check-First pipeline, 8 verification checks, 8-file bilingual rule, and role→check mapping table. The skin must UNIFY with these, not contradict or duplicate them. Intent: first concrete L2 skin that serves as a template-in-practice for the 4 other skins (code, book, config, plan, research) to follow.
- **A_σ (Consistency)**: No conflict with L0 (ODTOE core untouched — skin is pure L2 metadata). No conflict with Phase 0.A schema (`domain.skin` field already exists). No conflict with `odtoe-articles/config.md` (this spec explicitly mirrors its Check-First pipeline and 8-check structure). No conflict with Phase 1 role files (all 5 role files are vocabulary-abstract — this skin layers on top). One TENSION noted: the config.md "EraDev Role Mapping for Articles" table assigns Validator to OWN all 8 checks (final gate), while other roles OWN specific checks. The skin must respect this ownership map — and will by referencing it explicitly.
- **A_Λ (Experience)**: Consulted BL-17 (Check-First = prevention, not rework — directly informs the Pre-Generation Checklist section), BL-19 (bilingual RU+EN — directly informs the BL-19-in-article rule), BL-21 (format-first — directly informs the Example 2 story about cold-first reference-reading), BL-28 (agent prompt must include explicit context — directly informs why the skin file itself cannot be "excerpted" in prompts; either the prompt references the skin path OR the agent reads it; no truncation), BL-29 (terminology before generating — informs Coherent's drift-detection section of the skin), BL-32 (grep after BL merge — informs my BL-A1 for articles: "grep after terminology change"). Phase 0.A Visionary report establishes that scientific article with theorems/proofs → `research` modality (weights F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15), not `creative`. I will apply this.

---

## Inverted IFR (past tense, measurable)

> "The `templates/domain_skin.article.md` file was written by a single Builder in ~60 minutes using this spec. The file has YAML frontmatter that parses cleanly, a vocabulary table with 20 mappings, per-role focus overrides for all 5 roles that reference their upstream role files rather than replacing them, a cite_check verification protocol expanded to 6 concrete checks mapped to Validator L1/L2, 3 examples that each include the role catching the issue + phase + fix, a BL inheritance table that preserves all 22 universal BL unchanged and provides article-equivalents for 6 of 8 code-adapter BL (marking 2 as N/A), and 3 article-specific BL-A1..BL-A3. When `projects/odtoe-articles/config.md` is loaded with `domain.skin` already pointing at this file, META routes all 5 roles through the skin overrides without breaking the existing Check-First pipeline. How did we get there? This Analyst spec was concrete enough that every Builder decision was pre-made. No design calls surfaced during write."

## Acceptance Criteria

- **[AC-1]** Spec contains all 8 required sections with no placeholder text
- **[AC-2]** Vocabulary mapping has 20 ± 5 term pairs grounded in article-project practice (drawn from role files + odtoe-articles/config.md)
- **[AC-3]** Per-role focus overrides cover all 5 roles with: FIRST focus anchor, "artifact" definition, primary failure mode, Jidoka self-check
- **[AC-4]** Verification protocol enumerates at least 6 concrete cite_check elements split across Validator L1 (per-section / per-commit) and L2 (full-article / pre-submission)
- **[AC-5]** 3 examples each name the catching role, phase, and fix
- **[AC-6]** BL inheritance: all 22 universal BL listed with article-specific applicability note; all 8 code-adapter BL handled individually (each either N/A or article-equivalent); new article-specific BL added in BL-A1..BL-A{N} namespace (separate budget)
- **[AC-7]** The spec is backward-compatible: `projects/odtoe-articles/config.md` is NOT required to change; its existing `domain.skin: templates/domain_skin.article.md` line already routes correctly once the skin file exists
- **[AC-8]** Hand-off section names the exact file path, expected size (lines), template sections to copy from `templates/domain_skin.md.template`, and flags which spec items are FLEXIBLE vs FIXED for Builder discretion

## Failure Pre-mortem

- **[FM-1]** Spec is too abstract → Builder has to invent vocabulary mid-write → Mitigation: every vocabulary term grounded in a role file or config.md quote, with source cited
- **[FM-2]** Spec contradicts `odtoe-articles/config.md` (e.g., different check count, different owner role) → Mitigation: explicit "unified with config.md" note per section; spec cites the config.md check numbers verbatim
- **[FM-3]** Spec bloats the BL budget (>30) → Mitigation: article-specific BL live in BL-A namespace (separate from main 30-cap)
- **[FM-4]** Builder misreads "research modality" as "creative modality" because `article` sounds close to `book` → Mitigation: Section 1 states the modality choice with justification referencing the odtoe-articles "theorem+proof work" label
- **[FM-5]** `B_modality: research` creates tension with templates/domain_skin.md.template which has `Modality: text | creative | research` — template is permissive, but spec must pin the value → Mitigation: Section 1 explicitly pins `Modality: research` and quotes the template placeholder to show the pin

---

# SECTION 1 — Domain Identification

| Field | Value | Justification |
|---|---|---|
| `domain.type` | `article` | Matches Phase 0.A schema enum; matches `projects/odtoe-articles/config.md` line 10 |
| `domain.B_modality` | **`research`** | See justification below |
| `domain.ood_scope` | `text-discrete` | Articles are discrete text artifacts with measurable boundaries (file exists, word count, section count, citation count) and objective verification (cite_check, compile, bibliography resolution). Passes v9 AND-gate per Phase 0.A Deliverable 3. |
| `domain.verify.method` | `cite_check` (primary) | See Section 4 for what cite_check concretely entails. Matches `odtoe-articles/config.md` line 14. |
| `domain.parent_bl` | `BOOTSTRAP_LESSONS_universal.md` (22 universal BL) | Articles do NOT inherit `BOOTSTRAP_LESSONS_code_adapter.md`. Section 7 provides per-code-BL treatment. |

### 1.1 Modality choice: `research`, not `creative`

**Rationale:** Per Phase 0.A Visionary Deliverable 1 (modal B-formula):
- **B_creative** weights: w_F=0.20, w_E=0.30, w_{1-σ}=0.30, w_Λ=0.20 — dominant on Alignment and Consistency. Appropriate for *narrative* long-form where alignment with reader + internal voice consistency are the two load-bearing properties.
- **B_research** weights: w_F=0.30, w_E=0.20, w_{1-σ}=0.35, w_Λ=0.15 — dominant on Consistency (proof chain) and Focus (literature scan). Appropriate for *theorem/proof* work where a single logical inconsistency falsifies the entire result.

Scientific articles in the ODTOE corpus (the live reference project) are:
- Theorem + proof + derivation + formula-recomputation work — not narrative.
- `odtoe-articles/config.md` line 20 already asserts `B_modality: research` and justifies: "article generation is theorem+proof work, not narrative."
- Check 2 in that config explicitly says "Every formula recomputed independently to verify accuracy" — this is a Consistency check, the dominant component of B_research.
- Check 1 explicitly says "Bibliography: every [N] reference ... DOI exists, verify publisher/year/volume/pages" — this is a Focus check (literature scan), the second-dominant component.

Result: the DEFAULT article skin modality is **research**. This is PINNED in the skin file, NOT left as a placeholder.

**Variant clause (for future, NOT for v9 implementation):** A *review article* or *position paper* may be closer to creative weighting because its load-bearing property is argument arc rather than proof chain. If a project needs this, it should create a second skin file (e.g., `templates/domain_skin.article_review.md`) with `B_modality: creative`. This is **DEFERRED to v10** — v9 ships with the single `research`-weighted article skin, because ODTOE-style theorem articles are the only live case.

### 1.2 Header block for the skin file

The Builder must produce a file starting exactly like this (copy from `templates/domain_skin.md.template` lines 1-7, filling placeholders):

```markdown
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
```

**FIXED (Builder must not alter):** `Type: article`, `Modality: research`, the "does NOT inherit code_adapter" line, the live-reference-project line.
**FLEXIBLE:** wording of the "Applies to projects" sentence, formatting of the `> ` block.

---

# SECTION 2 — Vocabulary Mapping

This is the fastest bridge from abstract role file to domain action. The skin file must include a 20-row vocabulary table. Every row below is GROUNDED: the "where used" column cites where the abstract term appears in a role file or the code-adapter BL list. Builder must preserve all 20 rows; Builder MAY add 1-5 more from their own reading but must NOT delete any.

| # | Abstract term (role file / BL) | Article meaning | Where used (evidence) |
|---|---|---|---|
| 1 | **artifact** | section of an article, or a full `.tex` source file, or a compiled PDF, or a theorem block with its proof | `analyst_EN.md` line 7 ("An 'artifact' is any discrete element..."); `builder_EN.md` line 7 |
| 2 | **function** | claim, theorem, lemma, or labelled equation (addressable unit) | Analogous to `builder_EN.md` "the smallest addressable unit of code" |
| 3 | **module** | section (`\section*{I. NAME}`) or subsection (`\subsection*{I.1. name}`) | `odtoe-articles/config.md` lines 195-200 |
| 4 | **compile** | typeset / render PDF (`tectonic FILE.tex`) | `odtoe-articles/config.md` line 15 |
| 5 | **test / tests pass** | cite_check passes + recomputation matches + 7 verification checks PASS | `odtoe-articles/config.md` lines 201-281 (all 7 checks) |
| 6 | **verify** | cite_check (bibliography resolves, DOIs valid, internal refs resolve, factual consistency) | `analyst_EN.md` line 24; expanded in Section 4 |
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

**FLEXIBLE:** Builder MAY add rows 21-25 with additional mappings from `odtoe-articles/config.md` (e.g., `\Lambda` → "lambda-dynamics symbol"; the 46-term glossary → "canonical terminology set"). Builder MUST NOT delete any of rows 1-20.

**Unified with `odtoe-articles/config.md` — CRITICAL note for Builder:**
The config.md contains an "EraDev Role Mapping for Articles" table (lines 283-290). That table assigns check ownership per role. The vocabulary table above is consistent with that mapping. If Builder detects any contradiction between this spec's Section 3 (role focus overrides) and that table, the config.md table WINS and Builder must escalate to META before proceeding.

---

# SECTION 3 — Per-Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` unchanged. The skin adds DOMAIN-SPECIFIC focus anchors. The Builder must produce a sub-section for each of the 5 roles.

### 3.1 Visionary

- **FIRST focus anchor (A_F override)**: Read the `thesis` and `abstract` of the proposed article. Read the corpus TOC (for ODTOE: `projects/odtoe-articles/config.md` "Reference Files" section + existing 160+ `.tex` files in the corpus). True North = *what scientific claim does this article add, and does the ODTOE corpus already cover it?*
- **What the role considers "the artifact"**: The article's central claim + its placement in the corpus. Not the text, not the PDF — the *argument*. At RT-0 Visionary speaks at the level of "this article proves X using Y, which complements/contradicts article Z in the corpus."
- **Primary failure mode in article work**: Approving a thesis that duplicates or contradicts an existing corpus article WITHOUT explicit acknowledgment. This is the "corpus collision" failure. Mitigation: Visionary must enumerate the 3 nearest neighbors in the corpus before greenlighting the thesis.
- **Jidoka self-check specialization (article)**:
  - Q1: "Is this claim NEW, or does corpus article N cover it already?"
  - Q2: "Is the thesis falsifiable in a checkable way (research paper AND-gate), or is it speculative (FAILS OOD — escalate to OOD Registry)?"
  - Q3: "Does the proposed section structure match the ODTOE corpus gold standard (`ODTOE_article.tex`)?"
- **Section 1 reference for Builder**: `visionary_EN.md` Example 2 (Λ-dynamics section) already contains the article-domain flavor. The skin adds the *corpus-collision check* which is NOT in the base role file.

### 3.2 Analyst

- **FIRST focus anchor (A_F override)**: Read the article's *prior Check-First pipeline output* (8 items from `odtoe-articles/config.md` lines 40-51). If Check-First has not been run, STOP — demand Check-First before proceeding. Then read the 3 nearest neighbor articles in the corpus for terminology + notation alignment (BL-29 enforcement for articles).
- **What the role considers "the artifact"**: A section-level decomposition of the article: each section has a list of *claims*, each claim has a *source requirement* (which cite) and a *derivation requirement* (which prior result from the corpus or which postulate). The Analyst output is a table, not prose.
- **Primary failure mode**: Skipping the Check-First gate because "the article is simple." This is BL-17 violation applied to articles. Mitigation: Check-First is STRUCTURALLY REQUIRED before any Analyst plan is produced; Analyst's Jidoka A_F score is 0.0 (ANDON) if Check-First was not read.
- **Jidoka self-check specialization (article)**:
  - Q1: "Has the 8-item Check-First been completed? If NO → A_F=0.0 → Andon."
  - Q2: "For each claim in the plan, is the source requirement specified (DOI or corpus reference) or the derivation requirement specified (postulate chain)?"
  - Q3: "Are there resource conflicts with the existing corpus — same symbol with different meaning (the `\Lambda` collision pattern from `analyst_EN.md` Ex.2)?"
  - Q4: "Is the EN translation in the plan? (BL-19 enforcement — bilingual sync must be planned from Step 1, not added later.)"
- **Deliverable template for Analyst (article-specific)**:
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

### 3.3 Builder

- **FIRST focus anchor (A_F override)**: Read `ODTOE_article.tex` (gold-standard format — `odtoe-articles/config.md` line 296 names it). Read the 3 nearest corpus neighbor articles to extract terminology + notation (BL-29). Read the exact preamble from `odtoe-articles/config.md` lines 116-164 — it is the mandatory preamble for any ODTOE article. Do NOT start drafting prose until all three reads are complete. BL-17 + BL-21 are ACTIVE enforcement gates for article Builders.
- **What the role considers "the artifact"**: All 8 bilingual files simultaneously. The artifact is NOT "an RU .tex file"; the artifact is the 8-file set `{RU,EN} × {.tex,.pdf,.docx,.md}`. Builder must NOT mark Done until all 8 exist. This is BL-19 applied to articles. An RU `.tex` without its EN counterpart is INCOMPLETE, not WIP.
- **Primary failure mode**: Drafting prose directly into the `.tex` source without having the outline + claims table + source requirement table from the Analyst. Result: a section that "reads well" but has unsupported claims, missing cites, and `\Lambda` collisions. Mitigation: Builder's Activation Operator requires reading the Analyst plan verbatim BEFORE writing any prose.
- **Second failure mode**: Drafting RU first, "we'll do EN later." This is BL-19 violation. Mitigation: Section-by-section bilingual drafting (write section I in RU, immediately translate to EN, move on).
- **Third failure mode** (article-specific, not in base role file): Evidence-marker omission. Every substantive claim MUST be annotated in the `.tex` source with `% [FACT: source]`, `% [DERIVATION: axiom/postulate]`, `% [HYPOTHESIS: testable via X]`, or `% [OPEN: reason]`. This is Check 8 from `odtoe-articles/config.md` lines 272-281. The markers are LaTeX comments — invisible in the compiled PDF but auditable in `.tex` source.
- **Jidoka self-check specialization (article)**:
  - Q1: "Have I read `ODTOE_article.tex` preamble and 3 nearest neighbors? (F)"
  - Q2: "Does my draft match the outline+claims table from Analyst exactly, or have I slipped in unsupported claims? (E)"
  - Q3: "Are there any `\Lambda`-style collisions with the corpus? Terminology drift from the glossary? (1-σ)"
  - Q4: "Have I annotated every substantive claim with [FACT]/[DERIVATION]/[HYPOTHESIS]/[OPEN]? (L per L-23)"
  - Q5: "Have I drafted BOTH RU and EN for this section before moving to the next section? (Λ per BL-19)"

### 3.4 Validator

- **FIRST focus anchor (A_F override)**: Read the Analyst plan + the Builder's 8-file set (or whichever files exist — 8 files is the expected state; any missing file is defect 1). Read the 7 verification checks from `odtoe-articles/config.md` lines 201-281. Validator owns the final gate for all 8 checks (per the role-mapping table in that config). Validator does NOT partially validate.
- **What the role considers "the artifact"**: The full bilingual 8-file set IN ITS FINAL FORM — the same thing a journal reviewer would see. Validator simulates the reviewer at the highest-stakes moment: pre-submission.
- **Primary failure mode**: Running cite_check alone and saying PASS while the article has factual inconsistencies NOT caught by cite_check (e.g., "abstract says N=120, Table 2 says N=118" — see Example 3 in Section 6). Cite_check catches bibliography issues; it does NOT catch numerical/factual inconsistencies. Validator must run ALL 8 checks, not just cite_check. This is the distinction between `verify.method: cite_check` (the PRIMARY gate) and the FULL validation gate (all 8 checks). BL-17 + the 8-check structure together prevent this failure.
- **Secondary failure mode (article-specific)**: Trusting Builder's evidence markers. A claim tagged `[DERIVATION: postulate P3]` might actually be a post-hoc fit — Check 4 violation (see `odtoe-articles/config.md` Check 4). Validator must AUDIT marker accuracy, not accept them.
- **Jidoka self-check specialization (article)**:
  - Q1: "Have I run all 8 checks, not just cite_check?"
  - Q2: "For each claim tagged [FACT], did I confirm the citation resolves AND the cited source actually supports the claim?"
  - Q3: "For each claim tagged [DERIVATION], did I confirm the derivation chain is explicit AND complete (not a jump)?"
  - Q4: "Are the numbers in the abstract, body, tables, and figures INTERNALLY CONSISTENT? (Check 7 + factual-consistency subcheck)"
  - Q5: "Are both RU and EN versions validated (not just one)?"

### 3.5 Coherent

- **FIRST focus anchor (A_F override)**: Read the full bilingual 8-file set. Read the ODTOE glossary (46 canonical terms — `odtoe-articles/config.md` line 48). Read the 3 nearest neighbor articles from the corpus. Coherent cares about *this article's fit with the corpus*, not the article in isolation.
- **What the role considers "the artifact"**: The corpus + this article = new corpus. Coherent checks that (old corpus) ∪ (this article) remains coherent. This is L2 Coherent work (cross-team coherence, per `coherent_EN.md` Levels).
- **Primary failure mode**: "Glossary drift" — a term that the glossary defines as X is used in the new article with meaning Y. Or the `\Lambda` symbol collision. Or a formula that appears in article A with one value and in this article with a slightly different value. These are ALL (1-σ) failures at the corpus level.
- **Secondary failure mode** (article-specific): Phantom coherence between RU and EN. Both versions "agree" because they were generated in the same session, but actually introduce the same error in both — so cross-language check doesn't catch it. Mitigation: Coherent must perform independent verification of a sample of formulas and citations, not just diff RU↔EN.
- **Jidoka self-check specialization (article)**:
  - Q1: "Does the new article use every technical term exactly as the 46-term glossary defines it? (BL-29)"
  - Q2: "Are there any symbol collisions with existing corpus articles? (`\Lambda`-style check)"
  - Q3: "If this article cites a formula from corpus article N, does it match article N verbatim?"
  - Q4: "Are RU and EN versions byte-equivalent in structure (same section count, same formula count, same citation count, same figure count)?"
  - Q5: "Independent spot-check: pick 3 formulas from the new article, recompute them without reading the article's computation. Do my results match?"
- **Bilingual sync rule (BL-19) specialization**: Coherent is the ENFORCER of the 8-file rule. Commit is BLOCKED if fewer than 8 files exist. Commit is BLOCKED if file sizes diverge by >50% (suggests one version is incomplete).

---

# SECTION 4 — Verification Protocol (cite_check expanded)

The skin file's verification section maps directly to `domain.verify.method: cite_check` in `projects/odtoe-articles/config.md`. The skin must expand `cite_check` into 6 concrete checks, split across Validator L1 (per-section / per-commit) and Validator L2 (full-article / pre-submission).

### 4.1 The six cite_check checks

| # | Check | Who runs it | L1 (per-commit) or L2 (pre-submission) | Enforcement mechanism |
|---|---|---|---|---|
| **C1** | **Bibliography completeness** — every in-text `[N]` citation has a matching bibliography entry; every bibliography entry is cited at least once in the text | Validator | **L1** (per-commit: can miss a new `[N]`) | Structural check — grep-based |
| **C2** | **Citation attribution** — claim X that cites `[Smith2020]` is actually supported by Smith2020 (not just mentioned by it) | Validator | **L2** (pre-submission: requires reading the cited paper) | Human + LLM assisted — best-effort |
| **C3** | **DOI / arXiv ID syntactic validity** — each DOI matches the DOI regex; each arXiv ID matches the arXiv regex | Validator | **L1** | Pure regex check, automated |
| **C4** | **Internal cross-references** — `§3.2`, `\ref{thm:main}`, `\ref{fig:curve}`, `\eqref{eq:main}` all resolve to real section/theorem/figure/equation inside the same `.tex` file | Validator | **L1** (LaTeX's own warnings cover this; Validator must READ the warnings) | Rendering/parser — automated |
| **C5** | **Self-citation sanity** — if author cites own prior work, the citation is load-bearing (not padding); at least one sentence explains what the prior work contributes | Validator + Coherent | **L2** | Human judgment + Coherent review |
| **C6** | **Factual consistency** — numbers reported in abstract match numbers in body; figures match tables; abstract N = body N = table N | Validator | **L2** | Cross-reference scan — requires reading all occurrences of each numeric claim |

### 4.2 Relationship to the 7+1 verification checks in `odtoe-articles/config.md`

`odtoe-articles/config.md` lines 201-281 define 7 verification checks plus Check 8 (evidence classification). The skin's 6 cite_checks are a SUBSET + EXTENSION of that list:

| Skin check | Corresponds to config.md check | Notes |
|---|---|---|
| C1 (bibliography completeness) | Check 1 ("bibliography: every [N] reference ... must have a matching entry") | Unified — same requirement |
| C2 (citation attribution) | Check 1 ("every bibliography entry must be REAL: verify DOI ... publisher/year/volume/pages") | Unified — adds attribution check |
| C3 (DOI/arXiv syntax) | Check 1 ("verify DOI resolves") | Syntactic subset — C3 is purely mechanical; live DOI resolution is manual |
| C4 (internal cross-refs) | Check 7 ("Table/figure references must resolve correctly") | Unified — same requirement |
| C5 (self-citation sanity) | Check 6 ("Self-plagiarism check") | Related — different angle |
| C6 (factual consistency) | Check 7 ("No contradictions WITHIN the article") | Unified — skin formalizes the "N=120 vs N=118" sub-case |

**NOT covered by the 6 cite_checks (but still REQUIRED by Validator per config.md role mapping):**
- Check 2: Mathematical apparatus — full recomputation of every formula
- Check 3: 50-digit precision
- Check 4: No fitting — all parameters derived from theory
- Check 5: No AI markers, hidden characters, tone inconsistencies
- Check 6: Plagiarism prevention (>90% originality)
- Check 8: Evidence classification audit

These 6 checks are NOT cite_check in the narrow sense, but ARE required for the article's validation gate. The skin file must state this explicitly so Validators do not interpret `verify.method: cite_check` as "only run the 6 cite_checks and skip the rest." The skin's verification section is PARTIAL — it covers only cite_check specifically; the full article validation gate includes all 8 checks from config.md.

### 4.3 Block for the skin file (under "Verification Protocol")

The Builder must produce a block matching this structure (filling in the commands):

```
[method name]: cite_check
[command]: N/A for automated cite_check alone; full validation uses
          `tectonic ODTOE_{topic}.tex && tectonic ODTOE_{topic}_EN.tex`
          plus the 8-check protocol from projects/odtoe-articles/config.md lines 201-281
[success criteria]: all 6 cite_check checks PASS (Section 4.1 of this skin) AND
                    all 8 config.md checks PASS AND
                    all 8 bilingual files present (BL-19) AND
                    PDF compiles cleanly for both RU and EN versions
[failure recovery]: specific per check —
                    C1 fail → add missing bibliography entry OR add missing in-text cite
                    C2 fail → re-read cited source; if it doesn't support the claim, remove the claim or find a real source
                    C3 fail → correct the DOI/arXiv syntax
                    C4 fail → fix the internal reference (or remove the dangling ref)
                    C5 fail → either explain the self-citation's load-bearing role or remove it
                    C6 fail → re-verify the authoritative value and align all occurrences
[independence check]: Validator must INDEPENDENTLY recompute a sample of formulas
                      (Check 2) rather than reading Builder's computations. This is
                      the direct analog of code projects' "run tests, don't just read
                      the code" principle. Phantom coherence detection (BL-5) applied
                      to articles: if Builder and Validator agree on a formula's value
                      but neither recomputed independently, flag PHANTOM.
```

---

# SECTION 5 — RT Phase Protocol Adjustments

Code projects use the canonical phase protocol from `eradev.md` Section VI:
Visionary (direction) → Analyst (design) → Builder (implement) → Validator (test) → Coherent (integrate)

Articles need adjustments because the work profile is different. The skin file must specify:

### 5.1 When is the RT run?

**Three RT invocation points for articles:**

1. **RT-0 (optional, Visionary solo): thesis/corpus-collision check.** Before any RT-1. Runs when the operator proposes a new article. Visionary alone evaluates: is this thesis new, does it fit the corpus, is it falsifiable (OOD check)? A YES from Visionary unlocks RT-1.
2. **RT-1 (mandatory, full 5-role): outline + claims + plan.** Before any drafting. Produces the Analyst deliverable template from Section 3.2. Builder does NOT start writing until RT-1 approves a plan.
3. **RT-2 (mandatory, pre-submission): full gate.** Before the article is submitted to a journal / uploaded to arXiv / committed as a "final" version. Runs all 8 verification checks + the 6 cite_checks + BL-19 8-file check.

**No RT between RT-1 and RT-2 for single-section articles.** For multi-section articles (>4 sections), an intermediate RT-1.5 may be run after each section's draft, but this is OPTIONAL.

### 5.2 "Builder for an article" — single or split?

**Decision: single Builder, with section-by-section rhythm.**

The article Builder is a SINGLE agent (not "outliner + drafter" split). Within that single Builder session, the rhythm is:
- For each section I in the outline:
  1. Draft section I in RU `.tex`
  2. Immediately draft section I in EN `.tex` (BL-19 enforcement)
  3. Compile both (`tectonic` pass — catches LaTeX errors early)
  4. Annotate evidence markers for all substantive claims (Check 8)
  5. Move to section I+1

This is a *loop*, not a split. One Builder agent, multiple sections per Builder session.

**Rationale for NOT splitting outliner + drafter:** Outline + draft live in the same mental model of the argument. Splitting them into two agents would cause the drafter to lose the context that the outliner had — increasing |B_outliner − B_drafter| and decreasing S_team. Keeping them unified is consistent with the v9 principle that role is a focus, not a specialization.

**Exception (L/XL only):** For an XL article (>8000 words, >4 sections), the Analyst plan may split work across *two Builders* by section ownership (Builder A owns sections I-III, Builder B owns sections IV-VI). File Ownership rule from `analyst_EN.md` Responsibilities 4 applies. Coherent gate is MANDATORY between Builder completion and Validator start.

### 5.3 Pre-RT "Visionary solo" phase?

**Yes — RT-0 (Visionary solo) is recommended for articles, optional for code.**

Articles need a pre-RT Visionary pass because:
- The central claim (thesis) must be stable before Analyst plans the decomposition. A wobbling thesis wastes Analyst effort.
- Corpus-collision risk is real — the ODTOE corpus has 160+ articles. Approving a thesis without scanning for collisions is BL-29 violation.
- OOD check — the task description might look like "scientific article" but actually be "speculative philosophy essay" (Phase 0.A Edge Case 2). Visionary is the role that catches this at RT-0.

**RT-0 output:** A single-paragraph decision:
- "APPROVED: thesis is new; closest corpus neighbor is article N which covers X, leaving room for Y; falsifiable via Z; proceed to RT-1."
- OR "REJECTED: thesis collides with article N; propose a different angle."
- OR "OUT-OF-SCOPE: thesis is speculative, no discrete verification possible; defer to v10."

### 5.4 Pipeline block for the skin file

```
Article pipeline (FIXED):
RT-0 (Visionary solo, optional) → thesis/corpus-collision approval
RT-1 (full 5-role) → outline + claims table + Analyst plan
Builder loop per section:
  draft RU .tex → draft EN .tex → compile both → evidence markers → next section
Coherent gate (after all sections drafted)
RT-2 (full 5-role) → 6 cite_checks + 8 config.md checks + BL-19 8-file check
Commit all 8 files together (per `odtoe-articles/config.md` line 106)
Submission / preprint / journal → outside EraDev scope (manual operator action)
```

---

# SECTION 6 — Examples (3 concrete)

The skin file must include 3 examples matching the template at `templates/domain_skin.md.template` lines 88-99 but expanded to include catching role + phase + fix per this spec. Below are the exact 3 examples Builder must include (Builder MAY refine prose; Builder MUST preserve the structural elements).

### Example 1: Unsupported claim (C2 failure)

- **Input**: "Add section III to the article on Λ-dynamics, including a claim that the Lyapunov exponent λ_L > 0 for all ODTOE observer states."
- **Scenario**: Builder writes the section, cites [Smith2020] for the λ_L > 0 claim, and moves on. At RT-2, Validator runs C2 (citation attribution) by reading Smith2020.
- **What Validator finds**: Smith2020 actually proves λ_L > 0 for *a specific sub-class* of observer states (those with measurable phase space), not for ALL states. The cited claim is stronger than what the source supports.
- **Catching role**: **Validator** (C2 is L2, requires reading the source).
- **Phase**: **RT-2** (pre-submission gate).
- **Fix**: Builder must either (a) weaken the claim to match Smith2020 ("for measurable-phase-space observer states, λ_L > 0 per [Smith2020]"), or (b) find a source that actually proves the stronger claim, or (c) provide an independent derivation. This is a Check 4 (no fitting) concern: if no source exists, the claim MUST be derived from ODTOE postulates or removed.
- **Why cite_check alone would miss this**: C1 (bibliography completeness) would say PASS — the citation is in the bibliography. C3 (DOI syntax) would say PASS — the DOI is valid. Only C2 (reading the cited source) catches it. This is why the skin's verification protocol distinguishes L1 (mechanical) from L2 (interpretive) checks.

### Example 2: Outline contradiction between sections (Coherent σ failure)

- **Input**: "Draft outline for an 8-section article 'Dualities in ODTOE observer geometry.'"
- **Scenario**: Analyst plan lists Section III as "Observer-dependent metric" with the definition "the metric is a functional of the observer's information state" and lists Section V as "Bulk metric reconstruction" with the definition "the bulk metric is objective and independent of any observer." At RT-1, both section sketches pass Builder's Jidoka (each is internally consistent).
- **What Coherent finds**: The two sections are mutually contradictory — Section III says metric is observer-dependent, Section V says it is observer-independent. If the article were drafted as-is, Section V would silently overwrite Section III's assertion.
- **Catching role**: **Coherent** (this is the canonical Coherent failure-mode — divergent meanings of the same term across parallel work).
- **Phase**: **RT-1** (outline review, before Builder starts drafting). Coherent's σ (contradiction rate) spikes because Sections III and V disagree on a foundational term.
- **Fix**: Coherent invokes Phantom Coherence Check (`coherent_EN.md` Key Rules 2) and asks each role individually: "Is the metric observer-dependent or objective?" The divergence forces a RT-1.5 where Visionary clarifies which definition is the article's load-bearing one, and the outline is rewritten so that either (a) Section V redefines "bulk metric" as an information-theoretic construct compatible with Section III, or (b) Section V is removed entirely.
- **How the skin's vocabulary maps this**: "observer-dependent metric" vs "observer-independent metric" = a SYMBOL COLLISION (`\Lambda`-style pattern from `analyst_EN.md` Ex.2 line 45). Vocabulary mapping #2 (function → claim) and #3 (module → section) apply. Coherent's drift detection (Section 3.5 Q1-Q2 above) catches this by running the "does the new article use every technical term exactly as the glossary defines it?" query.

### Example 3: Numerical inconsistency abstract vs table (C6 failure, cite_check blind spot)

- **Input**: "Add an empirical section reporting results from a simulation of 120 ODTOE observers."
- **Scenario**: Builder drafts section IV. The abstract says "We ran 120 simulations." The section IV body says "We ran N=120 trials." Figure 4's caption says "N=120 observers." Table 2's header row says "Results over 118 observers." Builder compiles, the PDF looks clean, submits to Validator.
- **What Validator finds**: When running C6 (factual consistency), Validator notes the discrepancy: abstract/body/figure all say 120, Table 2 says 118. One of them is wrong. Reading the raw simulation output: actually 120 simulations were RUN, but 2 were excluded for data quality reasons, so the TABLE represents 118. Neither the abstract nor the body nor the figure caption mentions the exclusion.
- **Catching role**: **Validator** (C6 is L2; requires cross-reference scan of every numerical claim across the article).
- **Phase**: **RT-2** (pre-submission).
- **Fix**: Either (a) update abstract/body/figure to explain the exclusion: "120 simulations run; 118 analyzed after QC filtering," or (b) re-run the simulations so N=120 is consistent, or (c) re-examine the exclusion criterion.
- **Why cite_check alone (C1-C5) is insufficient**: None of C1-C5 touch numerical facts inside the article. C1 is about bibliography entries. C2 is about attribution. C3 is about DOI syntax. C4 is about internal reference resolution (which might be OK — figure 4 and table 2 both resolve). C5 is about self-citation. C6 is the ONLY cite_check variant that catches this. And C6 is intentionally placed in the skin's verification protocol (Section 4.1) precisely to make visible that "cite_check" in the article domain is a FAMILY of checks, not just "do citations resolve." This example is the didactic case for WHY the skin must expand cite_check into 6 sub-checks and NOT treat it as monolithic.

---

# SECTION 7 — BL Inheritance and Overrides

The article skin inherits all 22 universal BL unchanged and handles each of the 8 code-adapter BL individually. New article-specific BL are added in a separate `BL-A` namespace that does NOT count against the main 30-BL budget.

### 7.1 Universal BL (22 entries — all inherited, each 1-line applicability note for articles)

| BL | Title | Applicability to article work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Applies unchanged — a fresh article project starts with Λ=0.5; accumulates as articles land in the corpus |
| BL-4 | S_adjusted = S_team × B_mean | Applies unchanged — Coherent at RT-2 computes S_adjusted from the 5 role B scores |
| BL-5 | Phantom Coherence Detection | Applies unchanged — article-specific manifestation is "RU and EN both contain the same formula error" (see Section 3.5 secondary failure) |
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
| BL-20 | Adversarially Test Bootstrap | Applies unchanged — test the article skin file itself against a trial article before deployment |
| BL-21 | Format Specifications Are Inputs | **Critical for articles** — preamble in `odtoe-articles/config.md` lines 116-164 is the mandatory format spec read BEFORE any draft |
| BL-26 | META Always Delegates | Applies unchanged — META never drafts article prose directly |
| BL-28 | Agent Prompt Must Include Explicit Context | Applies unchanged — article-task agent prompts must name the skin file path AND role file path |
| BL-29 | Verify Established Terminology Before Generating | **Critical for articles** — article Builder must scan corpus for terminology before drafting (the 46-term ODTOE glossary) |
| BL-30 | Defense-In-Depth | Applies unchanged — article validation has layers: Builder Jidoka + Coherent gate + Validator 8-checks |
| BL-31 | Constrain Output Types | Applies unchanged — Builder's output is the 8-file set, not prose explanations |
| BL-32 | Grep After BL Merge | Applies unchanged — if article glossary terms are renamed, grep the whole corpus for orphan references |

### 7.2 Code-adapter BL (8 entries — treated individually)

| BL | Title | Verdict for articles | Article equivalent (if not N/A) |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | **Article equivalent: BL-A1** | Submission/publication changes require PRE-FLIGHT (preprint first, full journal later). See BL-A1 below. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Applies unchanged** (article equivalent is "3+ consecutive revisions of the same section = STOP, re-spec the claim"). No new BL-A needed; BL-3 transfers cleanly. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | **Article equivalent: BL-A2** | Before committing a `.tex` change, Builder must run `tectonic` compile AND `cite_check` AND BL-19 8-file check. See BL-A2 below. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **N/A for articles** | Articles have no feature flags. Publication state (draft / preprint / submitted / accepted / published) is a gradient but has no toggle mechanism. |
| **BL-14** | Rollback Plan Before Deploy | **Article equivalent: BL-A3** | Before submitting to a journal, Builder must document the retraction plan. See BL-A3 below. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Article equivalent: BL-A4** | Before Analyst RT-1, every DOI/arXiv reference must be verified syntactically (C3 above) and, for novel references, the cited source must be accessible. See BL-A4 below. |
| **BL-24** | Single-Responsibility Commits | **Applies unchanged** (article equivalent is "one commit = one section's bilingual 8-file update"). No new BL-A needed; BL-24 transfers cleanly. |
| **BL-25** | Error Path Coverage Matrix | **N/A for articles** | Articles do not have "happy path / error path / timeout path" runtime paths. The analog would be "what if the paper is rejected" but that's BL-A3 (retraction plan), not a 5-path matrix. |

Summary: 2 code-adapter BL apply unchanged (BL-3, BL-24); 4 have article equivalents (BL-2→A1, BL-6→A2, BL-14→A3, BL-22→A4); 2 are N/A (BL-8, BL-25).

### 7.3 New article-specific BL (BL-A namespace — separate budget)

These 4 BL live in the article skin file ONLY. They do NOT add to the main 30-BL budget. They are loaded by the article domain adapter layer, not by META-Orchestrator's universal bootstrap.

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
- **Source:** Adapted from BL-14 for the article domain.
- **Rule:** Before an article is submitted to a journal or uploaded as a preprint, Builder MUST document the retraction procedure: who to contact, what the retraction notice would say, and what the corpus-level rollback looks like (e.g., "remove from corpus, mark as retracted in index, note in changelog"). If you cannot describe how to undo a submission, you do not have permission to submit.
- **Why:** Post-submission pressure (editor deadlines, reviewer hostility, public visibility) is when cognitive load peaks. A pre-written retraction plan executes mechanically when needed.
- **Applies to:** Visionary (approve retraction plan), Builder (write it), Coherent (store in MEMORY).

**BL-A4: Bibliography PRE-FLIGHT (article adaptation of BL-22)**
- **Source:** Adapted from BL-22 for the article domain.
- **Rule:** Before RT-1 begins on any article task, Analyst MUST verify every DOI/arXiv reference the article will cite: (a) DOI/arXiv syntax is valid (C3), (b) for novel references (T3/T4 in the Source Register — `odtoe-articles/config.md` line 46), the source is accessible to the author AND at least one key fact from each source is confirmed. Produce a VERIFIED REFERENCES artifact (a small table: DOI | cited claim | confirmed true/not-checked). Unverified references = Builder BLOCK (RED on A_F) at RT-1, Validator BLOCK at RT-2.
- **Why:** Hallucinating that a paper says X is the top F=0 failure in article work. The article skin's C2 (citation attribution) is the L2 version; BL-A4 is the L1 pre-flight that prevents the worst cases before drafting starts.
- **Applies to:** Analyst (RT-1), Validator (RT-2 re-verification), Builder (block without artifact), META (enforce gate).

### 7.4 BL budget summary for the article skin

- Universal BL inherited: **22** (unchanged)
- Code-adapter BL that apply unchanged: **2** (BL-3, BL-24)
- Code-adapter BL with article equivalents: **4** (BL-2, BL-6, BL-14, BL-22 → BL-A1..A4)
- Code-adapter BL that are N/A for articles: **2** (BL-8, BL-25)
- Article-specific BL (BL-A namespace, separate budget): **4** (BL-A1..A4)

Total BL an article agent carries: 22 universal + 2 transferred code-adapter + 4 BL-A = **28 BL**.
(The 2 N/A code-adapter BL are NOT loaded; agents do not "know" about them.)

---

# SECTION 8 — Acceptance Criteria for the Skin File

The Builder must produce `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.article.md` satisfying ALL of the following:

### 8.1 Structural acceptance

- **[AS-1]** File exists at `templates/domain_skin.article.md`
- **[AS-2]** YAML-style frontmatter block (lines 1-10 approximately) matches the structure in Section 1.2 of this spec
- **[AS-3]** All 10 skin-template sections from `templates/domain_skin.md.template` are present:
  1. Header block
  2. Vocabulary Mapping
  3. Role Focus Overrides (5 sub-sections — one per role)
  4. Verification Protocol
  5. Checklists (Pre-Generation + Post-Generation)
  6. Examples (3 entries)
  7. Domain-Specific Bootstrap Lessons
  8. Known Out-of-Scope (OOD)
  9. B-weight Adjustment
  10. Footer (last updated, upstream roles, upstream math)
- **[AS-4]** Vocabulary table has at least 15 rows (all 20 from Section 2 of this spec, plus 0-5 Builder additions)
- **[AS-5]** Role Focus Overrides has all 5 sub-sections (Visionary, Analyst, Builder, Validator, Coherent), each with FIRST focus anchor, artifact definition, primary failure mode, Jidoka specialization
- **[AS-6]** Verification Protocol section contains: (a) the block matching Section 4.3, (b) the 6 cite_check table (C1-C6), (c) a note clarifying that cite_check is a SUBSET of the full 8-check protocol in `projects/odtoe-articles/config.md`
- **[AS-7]** Examples section has all 3 examples from Section 6 of this spec (unsupported claim, outline contradiction, numerical inconsistency) with catching role + phase + fix clearly labeled
- **[AS-8]** Domain-Specific Bootstrap Lessons section references BOTH the 22 universal BL (inherited) AND the BL-A1..A4 additions, with a clear budget note
- **[AS-9]** Known Out-of-Scope section explicitly mentions: free-verse poetry (FAILS on verification), speculative philosophy essays (FAILS on objective verification), real-time author interviews (FAILS on discreteness)
- **[AS-10]** B-weight Adjustment section lists the `research` weights (F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15) with rationale cross-referencing Phase 0.A Visionary Deliverable 1

### 8.2 Routing / operator acceptance

- **[AO-1]** When an operator loads `projects/odtoe-articles/config.md` (which already has `domain.skin: templates/domain_skin.article.md`), META must route all 5 spawned agents through the skin overrides. This is an OPERATOR test, not a Builder test — but the Builder's skin file must SUPPORT this routing (i.e., the skin file must be legible to META's loader).
- **[AO-2]** Backward compat: `projects/odtoe-articles/config.md` MUST NOT require any edit as a result of this skin being written. Re-running the v9 Phase 1.C CLAUDE.md loader on that config must produce the same session-bootstrap behavior as before PLUS the skin overrides.
- **[AO-3]** Pure-L1 fallback: a project WITHOUT `domain.skin` in its config must continue to work identically to before. The skin file's existence must not affect projects that don't reference it.

### 8.3 Quality acceptance

- **[AQ-1]** No contradictions with `projects/odtoe-articles/config.md`. If Builder detects a contradiction, Builder ESCALATES to META instead of silently resolving.
- **[AQ-2]** No contradictions with the 5 role files. The skin adds focus, not replacement.
- **[AQ-3]** Every vocabulary row cites its source (role file line or config.md line) in the table.
- **[AQ-4]** Every BL-A1..A4 entry has Source / Rule / Why / Applies to fields (matching universal BL format).
- **[AQ-5]** File is syntactically valid Markdown (parses cleanly, no broken headers, no incomplete tables).
- **[AQ-6]** File is EN-only (this is the EN skin; an RU mirror is deferred to BL-19 follow-up task).

### 8.4 Size acceptance

- **[ASZ-1]** Total file length: 400-700 lines (enough to be concrete, short enough to be loadable in agent context). This spec is ~900 lines; the skin file should be noticeably more compact because it is the PRODUCT, not the SPEC.

---

# Hand-off Section — For the Builder

**Target file:** `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.article.md`

**Expected size:** 400-700 lines of Markdown (see AS-1 through ASZ-1 above).

**Structure to copy from `templates/domain_skin.md.template`:** The 10-section skeleton (header, Vocabulary, Role Focus Overrides, Verification, Checklists, Examples, BL, OOD, B-weight, Footer). Keep section order. Keep heading levels (# for top-level, ## for skin sections, ### for role sub-sections within Role Focus Overrides).

**What this spec GIVES you (do not re-invent):**
- Section 1 → fills the skin's header block exactly
- Section 2 → fills the skin's Vocabulary Mapping table exactly (all 20 rows)
- Section 3 → fills the skin's Role Focus Overrides (5 sub-sections with prescribed content)
- Section 4 → fills the skin's Verification Protocol (the block in 4.3 + the table in 4.1)
- Section 5 → fills the RT phase protocol adjustments (skin's Checklists section becomes the Pre-Generation + Post-Generation checklists derived from the 5.4 pipeline)
- Section 6 → fills the skin's Examples section (3 entries verbatim from 6.1/6.2/6.3 but prose polished)
- Section 7 → fills the skin's Domain-Specific Bootstrap Lessons section (22 universal + 2 transferred + 4 BL-A)
- Section 8 → is the acceptance test for YOUR output (not content to copy, but the rubric you must pass)

**What is FLEXIBLE (Builder discretion, within bounds):**
- **Vocabulary table: rows 21-25.** Builder MAY add 1-5 more rows if they find more article-specific terms in the role files or config.md. Builder MUST NOT delete or renumber rows 1-20.
- **Prose tone in the Role Focus Overrides.** The Jidoka Q1-Q5 lists in Section 3 are structured; Builder may reformat them as bullets or a table as long as all questions are preserved.
- **Pre-Generation Checklist and Post-Generation Checklist wording.** Builder must derive these from the 5.4 pipeline + the Check-First 8 items from `odtoe-articles/config.md`. Builder MAY combine or reorder, but MUST cover all items.
- **Examples prose.** Builder may edit the wording of Section 6 examples for readability, as long as: (a) the catching role, (b) the phase, and (c) the fix are preserved verbatim.
- **Known Out-of-Scope section.** Builder MUST include the 3 items from AS-9 but MAY add 1-2 more borderline cases (e.g., "review papers — DEFERRED to v10 article_review skin").

**What is FIXED (Builder MUST preserve exactly):**
- `Type: article` / `Modality: research` / `Parent BL: BOOTSTRAP_LESSONS_universal.md` / `Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md`
- Section 3 overrides: each role's primary failure mode verbatim
- Section 4 cite_check table (C1-C6) with exact L1/L2 assignments
- Section 6 examples: catching role + phase + fix verbatim
- Section 7 BL table: the 22 universal BL list unchanged; the 4 BL-A entries with their Source/Rule/Why/Applies to fields
- `B_research` weights: F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15

**Builder pre-write checklist:**
1. Read `templates/domain_skin.md.template` (reference structure)
2. Read this spec (full — you already did if you're here)
3. Read `projects/odtoe-articles/config.md` — this is the live project the skin must unify with
4. Read the 5 EN role files if not already in context (Analyst did; Builder must do so independently because skin REFERENCES them)
5. Verify the 22 universal BL list matches `BOOTSTRAP_LESSONS_universal.md` before copying Section 7.1 table — do NOT rely on this spec alone (BL-29 enforcement)

**Builder post-write checklist:**
1. Run through AS-1..ASZ-1: is every item satisfied?
2. `markdown-lint templates/domain_skin.article.md` (Builder's BL-A2 equivalent: render-before-commit)
3. Read the file end-to-end once: do all sections flow, are all tables complete, are all references to other files correct?
4. Jidoka self-check per `roles/builder_EN.md`

**Do NOT do (out of scope for Builder):**
- Do NOT modify `projects/odtoe-articles/config.md` (it's already set up with `domain.skin`)
- Do NOT create `templates/domain_skin.code.md` or other skins (this task is article ONLY)
- Do NOT modify any role file
- Do NOT modify `BOOTSTRAP_LESSONS_universal.md` or `BOOTSTRAP_LESSONS_code_adapter.md`
- Do NOT run cite_check on an actual article (Validator work, separate task)
- Do NOT create an RU mirror of the skin file (BL-19 follow-up task, not this one)

---

# Open Questions (Spiral Gap)

- **OQ-P21-1**: Should the article skin's Section 4 (Verification Protocol) explicitly call out that `cite_check` is INCOMPLETE without the 8 checks from `odtoe-articles/config.md`, or should the `domain.verify.method: cite_check` enum value be REDEFINED to mean "full validation gate" (which would rename it to something like `verify.method: article_full_gate`)? Current proposal: keep `cite_check` as the narrow label but have the skin file explicitly state that cite_check is a subset. Risk: operator might assume `cite_check` is the whole story. Defer to v9 trial; revisit if operators get confused.

- **OQ-P21-2**: The skin assigns 5 Jidoka Q's per role in Section 3. Is this too many (role file has no fixed Q-count — each role has an abstract Jidoka)? Current proposal: 5 is fine because it's OPTIONAL specialization over the base Jidoka, not replacement. But if operators find it unwieldy, reduce to 3.

- **OQ-P21-3**: BL-A budget namespace — should BL-A1..A4 eventually be PROMOTED to the main BL budget (as BL-33..36), or should they stay namespaced forever? Current proposal: namespaced indefinitely. If a BL-A entry proves universal (all domains benefit), it can be promoted later — but start conservative.

- **OQ-P21-4**: The skin does NOT include an RU mirror (`templates/domain_skin.article_RU.md`). This is technically BL-19 violation. Current proposal: accept the violation for v9 Phase 2.1 specifically (this is the FIRST skin; BL-19 mirror can be batched across all skins in a single follow-up task). Log the violation, do not close it.

- **OQ-P21-5**: Is the spec's Section 5.2 decision (single Builder, not split outliner+drafter) universally correct, or is it an ODTOE-specific decision that might not generalize to other article projects? Unknown. Defer to Phase 2.2 if a second article project (e.g., a journal-style review paper) lands.

---

# Jidoka Self-Check (B-diagnostics)

```
=== JIDOKA SELF-CHECK — [ANALYST] Phase 2.1 ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.92 — Read all required inputs: analyst_EN.md, domain_skin.md.template,
                          Phase 0.A Visionary report, Phase 0.A Analyst report,
                          odtoe-articles/config.md (FULL), all 5 role files, both BL files.
                          One minor gap: did NOT open the 160+ actual ODTOE article .tex files
                          to verify terminology samples. Not necessary for a spec, but lowers F slightly.
  E (Alignment):   0.94 — All 8 required spec sections produced with the prescribed structure.
                          Each section maps directly to a template section in
                          templates/domain_skin.md.template that the Builder will fill.
                          Hand-off section tells Builder exactly where to put what.
                          No padding, no "future work" digressions.
  (1-sigma):       0.88 — No contradictions with L0 (eradev.md untouched), with
                          odtoe-articles/config.md (explicitly unified — Section 4.2 table),
                          with the 5 role files (skin adds focus, not replacement),
                          with Phase 0.A deliverables (research modality chosen with
                          rationale citing Deliverable 1), with BL files (22 universal
                          inherited, 8 code-adapter handled individually).
                          One tension: OQ-P21-1 (cite_check naming) is unresolved.
                          Acceptable — it's an OPEN question, not a contradiction.
  Lambda (Experience): 0.88 — Applied BL-17, BL-19, BL-21, BL-28, BL-29, BL-32 explicitly.
                              Applied Phase 0.A Visionary modal B weights, Phase 0.A Analyst
                              schema, and odtoe-articles/config.md Check-First + 8-check
                              structure as the live reference. Did NOT consult Phase 1.C
                              Universal CLAUDE.md (which is the loader that routes
                              domain.skin at runtime) — that's the enforcement side,
                              not the spec side. Acceptable for this task.

  B = F^0.30 · E^0.20 · (1-σ)^0.35 · Λ^0.15
    = 0.92^0.30 · 0.94^0.20 · 0.88^0.35 · 0.88^0.15
    = 0.9757 · 0.9877 · 0.9566 · 0.9810
    = 0.9044

  (Note: using B_research weights since this spec is FOR an article-domain skin,
   and v9 modality is session-sticky once chosen. Per Phase 0.A Visionary Section 1.4,
   META selects modality at session bootstrap; this Analyst agent has implicitly
   inherited the research modality by working on an article-skin task.)

Weak link: (1-σ) at 0.88 (lowest of the 4). Acceptable — no RED component.
No component < 0.3 → no Andon.
B = 0.904 > 0.5 → GREEN, no Andon.
Banality score: 8/10 — spec is specific, cites line numbers, pins fixed vs flexible,
                      provides explicit Builder hand-off rubric. Not a template.
```

## B-check (Output Format per `roles/analyst_EN.md`)

```
## Implementation Plan (for Builder)
Task inertia: M (single file, 400-700 lines, all 10 sections pre-designed)
Artifacts: templates/domain_skin.article.md (NEW file, absolute path above)
Dependencies: This spec (you are reading it). templates/domain_skin.md.template (structure).
              projects/odtoe-articles/config.md (unification target).
              The 5 role files (referenced but not modified).
              BOOTSTRAP_LESSONS_universal.md (22 BL table).
Artifact Ownership: Single Builder (S-or-M task — do NOT split into parallel Builders).
Pipeline: read this spec → read template → read config.md → read role files →
          draft the skin file → markdown-lint → Jidoka self-check → commit
Resource conflicts: None with existing files (new file, new path). No bilingual mirror required
                    in this task (BL-19 follow-up deferred — see OQ-P21-4).
System dependencies: markdown-lint (or equivalent parser) for AS-4 verification.
B-check: F=0.92 E=0.94 (1-σ)=0.88 Λ=0.88 → B=0.904
```

---

*Analyst spec complete. B=0.904 (B_research weights). Hand-off to next [BUILDER] for skin-file creation. OQ-P21-1..5 logged for follow-up.*

*Phase 2.1 closing note:* This is the FIRST concrete L2 skin in v9. The patterns established here (8-section spec structure, Fixed-vs-Flexible hand-off, BL-A namespace, unification with live config.md, cite_check-as-subset-of-full-gate) should be reused by subsequent Phase 2.2+ skins (code, book, config, plan, research). Phase 2.1's success is measured by how easily Phase 2.2 reuses these patterns. If Phase 2.2 finds the patterns insufficient, Hansei at that point — not now.
