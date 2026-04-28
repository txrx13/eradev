# EraDev v9 Phase 2.A — Book Domain Skin Specification

> Date: 2026-04-11
> Role: [ANALYST]
> Task: Phase 2.A — specify `templates/domain_skin.book.md` (L2 domain skin for books — textbooks, academic monographs, non-fiction long-form)
> Output type: Report (META type 5) — Analyst spec for Builder hand-off
> Language stack: EN (practical task — artifact design)
> Zone: Pull with Resonance flavor (specific target + cross-domain bridge article→book)
> Modal B tuple for THIS analyst run: `B_creative` (F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20) — pinned because the product of this spec IS the creative-modality skin; Analyst stays inside the modality of the artifact it is planning, per Phase 0.A Visionary Section 1.4.

---

## Activation Operator Results

- **A_F (Focus)**: Read `roles/analyst_EN.md` (full — 79 lines), `templates/domain_skin.md.template` (full — 138 lines), `templates/domain_skin.article.md` (full — 644 lines — structural template), `templates/domain_skin.code.md` (full — 172 lines — identity skin reference), `reports/v9_phase2_1_article_skin_spec_2026-04-11.md` (full — 662 lines — the reference Analyst spec that produced the article skin), `eradev.md` Section II.1 (B_creative weights confirmed: F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20), `BOOTSTRAP_LESSONS_universal.md` (22 BL), `BOOTSTRAP_LESSONS_code_adapter.md` (8 BL). Grepped all 5 role files for "chapter", "book", "readability" — every role file already uses "chapter of a book" as one of its canonical example artifacts (`roles/analyst_EN.md:7`, `roles/builder_EN.md:7`, `roles/validator_EN.md:7`, `roles/visionary_EN.md:7`, `roles/coherent_EN.md:7`). This is a crucial anchor: the base role files ALREADY carry a light book-flavor; the skin elevates it to a first-class overlay. True North: produce a spec rigorous enough that a Builder writes `templates/domain_skin.book.md` in one shot without design decisions.

- **A_E (Alignment)**: The spec is a BRIDGE from the article skin — same 10-section structure, same Fixed-vs-Flexible discipline, same BL-A namespace — adapted to the BOOK work profile. Key differences from article: (1) **scale** is 5-30× larger (150-500 pages vs 15-30 pages); (2) **structure** is hierarchical (parts → chapters → sections) vs flat (sections); (3) **continuity** is the load-bearing property — characters/concepts/terminology must persist coherently across chapters; (4) **modality is `creative`** (F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20), NOT `research`, because non-fiction book authoring is alignment-and-consistency dominant, not proof-chain dominant. The skin targets textbooks, academic monographs, and non-fiction books — NOT novels (fiction has no verification hook and defers to v10 `narrative` skin), NOT poetry collections (defers to v10 `poetry` skin), NOT author memoirs framed as pure personal narrative (defers to v10). See "Known Out-of-Scope" below for the full OOD list.

- **A_σ (Consistency)**: No conflict with L0 (`eradev.md` untouched — skin is pure L2 metadata). No conflict with Phase 0.A schema (`domain.type: book` is already enumerated). No conflict with the 5 role files (each already cites "chapter of a book" as an example artifact — the skin only elevates this from example to overlay). No conflict with `templates/domain_skin.article.md` (sibling skin at the same abstraction layer — they do NOT share content or vocabulary rows). No conflict with `templates/domain_skin.code.md` (the identity skin for the default code modality). One structural difference from the article skin to call out explicitly: **BL-19 (bilingual files simultaneous) applies only to projects that choose bilingual authoring**. Unlike ODTOE articles which are structurally bilingual (8-file rule baked into `odtoe-articles/config.md`), books are typically mono-lingual authored with translation as a separate downstream project. The skin treats BL-19 as OPTIONAL per-project (config declares bilingual intent; if declared, enforce; if not declared, skip). This is NOT a BL violation — it is a correct reading of BL-19 which says "when a file has a bilingual counterpart"; a book that has no counterpart is not in BL-19's scope.

- **A_Λ (Experience)**: Consulted BL-17 (Check-First = prevention — informs the Pre-Generation Checklist for books — "read the outline before drafting any chapter"), BL-19 (bilingual sync — conditional application, see A_σ above), BL-21 (format-first — informs "read the style guide and 1-2 reference books in the same genre before drafting"), BL-28 (agent prompt explicit context — informs the requirement that book agents be spawned with both the skin path AND the role file path), BL-29 (terminology before generating — informs Coherent's glossary unification section — the dominant book failure mode), BL-32 (grep after BL merge — informs the Yokoten rule for glossary updates: changing a term in Ch.3 requires a corpus-wide scan across all drafted chapters). Applied Phase 0.A Visionary Deliverable 1 (modal B weights) to pin `B_creative` rather than `B_research` — rationale is in Section 1 below. Applied the article skin spec's 8-section structure verbatim with added Section 9 and 10 per the request (Acceptance + Hand-off). Applied the article skin's "FIXED vs FLEXIBLE" discipline. Applied the article skin's "BL-A namespace" pattern for domain-specific BL without inflating the 30-BL budget.

---

## Inverted IFR (past tense, measurable)

> "The `templates/domain_skin.book.md` file was written by a single Builder in ~70 minutes using this spec. The file has frontmatter that parses cleanly, a vocabulary table with 22 mappings (20 required + 2 Builder additions), per-role focus overrides for all 5 roles that reference their upstream role files rather than replacing them, a readability + continuity verification protocol expanded into 6 concrete checks (R1-R6) with clear L1/L2 assignment, 3 examples that each name the catching role + phase + fix, a BL inheritance table that preserves all 22 universal BL unchanged, 2 code-adapter BL transferred unchanged (BL-3, BL-24 — the latter redefined from 'one commit = one phase' to 'one commit = one chapter or one revision pass'), and 4 book-specific BL-B1..B4 in the BL-B namespace. When a project declares `domain.type: book` with `domain.skin: templates/domain_skin.book.md`, META routes all 5 spawned agents through the skin overrides, Validator reports Flesch scores per chapter and a glossary-unified set of key terms across the manuscript, and Coherent catches cross-chapter contradictions before they land in the final assembly phase. How did we get there? This Analyst spec was concrete enough that every Builder decision was pre-made. No design calls surfaced during the write."

## Acceptance Criteria (for the spec itself — rubric the Builder reads)

- **[AC-1]** Spec contains all 10 required sections with no placeholder text.
- **[AC-2]** Vocabulary mapping has 20 ± 5 term pairs grounded in book-authoring practice (drawn from role-file example anchors + the task description's examples).
- **[AC-3]** Per-role focus overrides cover all 5 roles with: FIRST focus anchor, "artifact" definition for the book context, primary failure mode, Jidoka self-check questions.
- **[AC-4]** Verification protocol enumerates at least 6 concrete sub-checks (R1-R6) split across Validator L1 (per-chapter / per-draft) and L2 (manuscript-wide / pre-submission).
- **[AC-5]** 3 examples each name catching role, phase, and fix.
- **[AC-6]** BL inheritance: 22 universal BL listed with book-specific applicability notes; 8 code-adapter BL handled individually (each either transfers unchanged, has a BL-B equivalent, or is marked N/A); new book-specific BL added in BL-B1..B{N} namespace.
- **[AC-7]** Spec is backward-compatible: introducing `templates/domain_skin.book.md` does NOT require any change to existing projects. Code projects without `domain.skin` continue to behave exactly as before. Article projects with `domain.skin: templates/domain_skin.article.md` continue to behave exactly as before.
- **[AC-8]** Hand-off section names the exact target file path, expected size (500-700 lines), template sections to copy from `templates/domain_skin.md.template`, and flags which spec items are FIXED vs FLEXIBLE for Builder discretion.
- **[AC-9]** Modality is pinned `creative`, NOT `research` — the skin file's frontmatter and B-weight table must both say `creative` with weights F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20, and cite `eradev.md` Section II.1 for the weights.
- **[AC-10]** Spec includes Open Questions (Spiral Gap per BL-15) and a Jidoka B-check.

## Failure Pre-mortem

- **[FM-1]** Spec is too abstract → Builder has to invent vocabulary mid-write → Mitigation: every vocabulary term either grounded in a role-file anchor (columns show source), or anchored in the task description's 10 pre-suggested mappings.
- **[FM-2]** Spec accidentally inherits article-skin vocabulary (e.g., "8-file bilingual rule") into book context, creating a contradiction between what the book skin says and what book projects actually produce → Mitigation: Section 2 table is written from scratch for books (0 rows copied verbatim from the article skin); Section 7 BL-19 handling is EXPLICITLY made optional per-project.
- **[FM-3]** Spec bloats the BL budget (>30) → Mitigation: book-specific BL live in BL-B namespace (separate from main 30-cap); total BL budget UNCHANGED at 30.
- **[FM-4]** Builder misreads "creative modality" as "narrative/fiction" and restricts scope to novels and poetry → Mitigation: Section 1 states the scope as "textbooks, academic monographs, non-fiction books" with a full OUT-OF-SCOPE list that explicitly excludes fiction/poetry (deferred to v10 domain_skin.narrative.md).
- **[FM-5]** Builder defaults to treating BL-19 as MANDATORY for all books, introducing friction for mono-lingual book projects → Mitigation: Section 7 (BL table) explicitly marks BL-19 as CONDITIONAL: applies iff `config.md` declares `domain.bilingual: true`; default is mono-lingual.
- **[FM-6]** Builder confuses "book" with "article" work profile and applies ODTOE-style verification (cite_check, formula recomputation) → Mitigation: Section 4 specifies `verify.method: readability` as PRIMARY with structural coherence as SECONDARY; cite_check is OPTIONAL per-project (a book with a bibliography gets an R5 citation density sub-check; a book without a bibliography skips it).

---

# SECTION 1 — Domain Identification

| Field | Value | Justification |
|---|---|---|
| `domain.type` | `book` | Matches Phase 0.A schema enum; Section 0 of task description. |
| `domain.B_modality` | **`creative`** | See justification 1.1 below. |
| `domain.ood_scope` | `text-discrete` | A book is a discrete artifact with measurable boundaries (file exists, page count, chapter count, word count) and objective verification hooks (readability score is a scalar; cross-chapter contradiction is detectable; glossary drift is detectable). Passes v9 text-discrete AND-gate per Phase 0.A Deliverable 3. |
| `domain.verify.method` | **`readability`** (primary) + **structural coherence check** (secondary) | See Section 4. Matches the task description "verify.method: readability (primary) + structural coherence check". |
| `domain.parent_bl` | `BOOTSTRAP_LESSONS_universal.md` (22 universal BL) | Books do NOT inherit `BOOTSTRAP_LESSONS_code_adapter.md`. Section 7 provides per-code-BL treatment. |
| `domain.bilingual` | **OPTIONAL** per-project (default `false`) | Unlike articles (ODTOE corpus is structurally bilingual), books are typically mono-lingual authored with translation as a downstream project. Books may declare `domain.bilingual: true` in their `config.md`, in which case BL-19 (bilingual simultaneity) becomes active enforcement for that project. Otherwise BL-19 is inactive for that project — not a violation, because BL-19's own text says "when a file has a bilingual counterpart." |

### 1.1 Modality choice: `creative`, not `research`

**Rationale:** Per Phase 0.A Visionary Deliverable 1 (modal B-formula table, confirmed via `eradev.md` Section II.1 lines 117-119):

- **B_creative** weights: w_F=0.20, w_E=0.30, w_(1-σ)=0.30, w_Λ=0.20 — **dominant on Alignment (E) and Consistency (1-σ)**. Appropriate for *narrative* long-form where alignment with reader intent + internal voice/terminology consistency are the two load-bearing properties.
- **B_research** weights: w_F=0.30, w_E=0.20, w_(1-σ)=0.35, w_Λ=0.15 — **dominant on Consistency (proof chain) and Focus (literature scan)**. Appropriate for *theorem/proof* work where a single logical inconsistency falsifies the entire result.
- **B_text** weights: 0.25 uniform — the code/config default.

Non-fiction books in the target scope (textbooks, academic monographs, how-to, history, popular science) are:

- Primarily **alignment-driven**: the book must deliver on the promise made in the outline / back-cover / preface. A chapter that "reads well" but doesn't deliver the promised content is a FAIL on E. E is the first-load-bearing component.
- Secondarily **consistency-driven**: cross-chapter terminology, cross-chapter claims, and character/concept continuity are the dominant failure mode. A Ch.3 definition that contradicts Ch.7 is a σ failure that a reader will catch and a reviewer will punish. (1-σ) is the second-load-bearing component.
- Less **focus-driven** than articles: a book can stand partly on its own authority — it does not need to scan a 160-article corpus before drafting Chapter 5. Still matters (background reading, ensuring the book adds value over prior books in the genre), but less dominant than for theorem work.
- Less **experience-driven** than code: book project memory accumulates slowly (one book = one long project), so Λ is a facilitator, not a gate. But Λ matters more than for articles because patterns learned in early chapters must transfer to later chapters within the same session.

Result: the default book skin modality is **creative**. This is PINNED in the skin file, NOT left as a placeholder.

**Variant clause (for future, NOT for v9 implementation):**
- A **novel or short-story collection** is pure narrative — load-bearing property is voice + emotional arc. It would need its own `narrative` modality (deferred to v10).
- A **poetry collection** lacks objective verification for free-verse work (sonnets / haikus are IN-scope per eradev.md line 185). Deferred to v10.
- A **pure personal memoir** with no factual-check obligation is closer to novel work; if the memoir has a factual backbone (dates, places, named people), R3 glossary consistency and R2 continuity still apply.
- A **reference book** (encyclopedia, dictionary, handbook) may want closer to `B_text` weights (lookup-table-style, no narrative arc). Covered by the current skin as "very low E, very high (1-σ)" in the project-level B-weight override mechanism documented in `templates/domain_skin.code.md` Section "B-weight Adjustment".

### 1.2 Header block for the skin file

The Builder must produce a file starting exactly like this (copy from `templates/domain_skin.md.template` lines 1-10, filling placeholders):

```markdown
# Domain Skin: book

> Type: book
> Modality: creative
> OOD scope: text-discrete
> Applies to projects where `config.md` contains `domain.type: book`
> Parent BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)
> Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md
> Verify method: readability (primary) + structural coherence (secondary)
> Bilingual: optional per-project (BL-19 conditional)
> Upstream roles: roles/{role}_EN.md
> Upstream math: eradev.md Section II.1 (B_creative weights)
> Last updated: 2026-04-11

---
```

**FIXED (Builder MUST NOT alter):** `Type: book`, `Modality: creative`, `Verify method: readability (primary) + structural coherence (secondary)`, the "does NOT inherit code_adapter" line, `Bilingual: optional per-project`.
**FLEXIBLE:** wording of the "Applies to projects" sentence, formatting of the `> ` block.

---

# SECTION 2 — Vocabulary Mapping

This is the fastest bridge from abstract role file to domain action. The skin file must include a vocabulary table with **20 rows minimum** and **25 rows maximum** (Builder may add up to 5 of their own, drawn from role file or task description). Every row below is GROUNDED: the "where used" column cites where the abstract term appears in a role file or code-adapter BL list. Builder must preserve all 20 rows below; Builder MAY add up to 5 additional rows but MUST NOT delete any.

| # | Abstract term (role file / BL) | Book meaning | Where used (evidence) |
|---|---|---|---|
| 1 | **artifact** | a chapter of the book, a section inside a chapter, a full manuscript draft, or a published PDF/EPUB/print edition | `roles/analyst_EN.md:7` ("a chapter of a book, a configuration..."); `roles/builder_EN.md:7`; `roles/validator_EN.md:7`; `roles/visionary_EN.md:7`; `roles/coherent_EN.md:7` |
| 2 | **function** | a chapter section (the smallest addressable unit inside a chapter — typically numbered §3.2.1 or named "3.2 Consistency Gate") | Analogous to `roles/analyst_EN.md:7` "the smallest addressable element inside that artifact (a function, a paragraph, a stanza, a config key...)"; task description row #1 |
| 3 | **module** | a chapter or a part (multi-chapter group, e.g., "Part I: Foundations"); structure is hierarchical parts→chapters→sections | Book convention; analogous to `roles/analyst_EN.md` Key Rules 6 "never design an update of all nodes, all sections, or all chapters simultaneously" |
| 4 | **compile** | typeset the book / build the PDF / build the EPUB / assemble the print-ready file (e.g., `pandoc book.md -o book.pdf` or `tectonic book.tex` for LaTeX books or `vivliostyle book.yml` for web-standards books) | Task description row #6 (compile → typeset / build PDF); `roles/builder_EN.md:30` ("ARTIFACT CONTENT GATE"); generalised from article skin row #4 |
| 5 | **test / tests pass** | readability pass (Flesch grade within target band) + continuity pass (σ check across chapters) + outline-fidelity pass (every drafted chapter matches the outline's promise for it) | Analogous to article skin row #5; task description R1/R2/R4 |
| 6 | **verify** | readability pass + structural coherence pass (R1-R6 sub-checks; see Section 4) | Task description verify.method; `roles/analyst_EN.md:24` |
| 7 | **validate** | run all 6 R-checks on the full manuscript; Validator owns the final gate | Task description verify.method; `roles/validator_EN.md:7` |
| 8 | **build** | produce the full manuscript set — outline + all drafted chapters + glossary + (optional) bibliography + front-matter + back-matter | Book convention; analogous to article skin row #8 |
| 9 | **runtime** | **reader's reading time** — how long a reader spends on the book (the blast-radius proxy for books). Readers of a 300-page book commit 10-20 hours of their life; a wasted chapter costs them more than a wasted article costs a reader | Task description explicit ("runtime → reader's reading time"); `roles/builder_EN.md:26` "BLAST RADIUS DICTATES PROCESS" |
| 10 | **spec / specification** | **book outline / chapter plan / table of contents** — the structured promise made to the reader | Task description row #8 (spec → outline / chapter plan); `roles/analyst_EN.md:46` Example 3 "chapter_01_opening.md, notes/voice_guide.md, notes/scene_list.md — scene list must be finalized before drafts" |
| 11 | **feature / feature flag** | a new chapter added to the manuscript, or a new section added to an existing chapter (a "feature" of the book the reader will encounter) | Analogous to article skin row #11; `roles/builder_EN.md:28` "Feature flags / staged rollouts = release event — releasing a preview chapter" |
| 12 | **API / API endpoint** | **character sheet / concept registry / glossary entry** — the stable interface between chapters where a term, a character, or a concept is formally defined once and referenced everywhere else | Task description row #3 (API → character sheet / concept registry); Coherent's concept: `roles/coherent_EN.md:7` "voice for narrative" |
| 13 | **bug** | **contradiction across chapters** — a claim in Ch.3 that contradicts a claim in Ch.7, a definition drift, a character-fact drift, a numerical drift, a tone drift | Task description row #4 (bug → contradiction across chapters); `roles/validator_EN.md:20` ("B-diagnostics of defects") |
| 14 | **refactor** | **restructure the book outline** — move sections between chapters, merge two chapters into one, split one chapter into two, reorder parts, without changing the central claim of the book | Task description row #5 (refactor → restructure book outline); `roles/analyst_EN.md` Key Rules 6 (rolling update) |
| 15 | **code review** | **editor's review / developmental edit / peer read** — a full manuscript read by an editor or beta reader who gives structural feedback (not copy-edit; structural) | Task description row #10 (code review → editor's review); `roles/visionary_EN.md:51` Example 2 |
| 16 | **PR / pull request** | **manuscript submission** to a publisher, a chapter submitted for beta-reader review, or a proposed chapter added for RT review | Task description row #9 (PR → manuscript submission); `roles/builder_EN.md` Decision-Point Checklist ("Before a tracked change is published") |
| 17 | **commit** | a signed-off chapter revision (one commit = one chapter's complete revision pass — see BL-24 book adaptation in Section 7) | Book convention; `roles/builder_EN.md:57` |
| 18 | **deploy / push to prod** | hand the manuscript to the publisher / upload to KDP / publish to a self-publishing platform — the point after which the book is visible to general readers and rollback is reputationally expensive | Analogous to article skin row #18; `roles/builder_EN.md` Key Rules 1 |
| 19 | **production** | **published edition** — the version readers actually buy or read. Cannot be retracted without cost (errata sheets, new editions, refunds). The analog of production-grade code | `roles/validator_EN.md` Key Rules 4 (analog to "revert = postmortem") |
| 20 | **smoke test** | **first-chapter read-aloud + TOC scan + glossary sanity check + first-paragraph hook test** — the minimal sanity check before committing to a full read | Analogous to article skin row #20; `roles/validator_EN.md` Key Rules 5 ("Stale output detection") |

**Builder-added rows (FLEXIBLE — up to 5 additional rows from Builder's own reading):**
- Candidate 21: **"interface / contract"** → *chapter-to-chapter hand-off / cold open / cliffhanger* (`roles/analyst_EN.md:19` "chapter-to-chapter hand-off")
- Candidate 22: **"scope creep is muda"** → *adding characters, adding subplots, adding concepts not in the outline* (BL-11 applied to books)
- Candidate 23: **"blast radius"** → *a central metaphor change affects every chapter that references it — mandatory grep before commit* (`roles/builder_EN.md:26` already cites "a chapter's central metaphor" as high-blast-radius)
- Candidate 24: **"glossary drift"** → *the book-specific manifestation of BL-29 phantom decoherence — same concept, different names across chapters*
- Candidate 25: **"release event"** → *publishing a preview chapter / releasing an ARC (Advance Reader Copy) / submitting to a reviewer* (`roles/builder_EN.md:28`)

Builder MAY include any subset of candidates 21-25 (or add their own). Builder MUST NOT delete rows 1-20.

**CRITICAL note for Builder (unification rule):**
If a live book project exists with its own `config.md` (none in the repo today; this is the first book skin — v9 Phase 2.A), and that config contains a table that contradicts this skin's Section 3 (role focus overrides) or Section 4 (verification protocol), **the project `config.md` table WINS** and the Builder (or any future agent) must escalate to META before proceeding. This mirrors the article-skin rule verbatim and is necessary for the same reason: skins are defaults; projects override.

---

# SECTION 3 — Per-Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` **unchanged**. The skin adds DOMAIN-SPECIFIC focus anchors, artifact definitions, failure modes, and Jidoka specializations. Builder must produce one sub-section per role.

### 3.1 Visionary (book context)

- **FIRST focus anchor (A_F override):** Read the proposed book's **central claim / thesis** and the **target reader profile**. Read the **3-chapter arc sketch** (typically the first 3 chapters, or Ch.1 + middle + last). If the project has background reading — 1-3 reference books in the same genre — read their TOC (not full text) to confirm the proposed book isn't redundant. True North = *what change does this book make in the reader's thinking, and does a comparable book already make it?*
- **Artifact the role considers as "the unit of work":** The **book's central claim + its 3-chapter arc**. Not the manuscript, not the PDF — the *argument the book makes over its full length*. At RT-0 Visionary speaks at the level of "this book argues X via structure Y for reader profile Z, adding to the genre by W."
- **Primary failure mode in book work:** **Approving a book thesis that is already well-covered by existing books in the genre WITHOUT explicit differentiation.** This is the "genre collision" failure (analog of the article skin's "corpus collision"). Mitigation: Visionary must enumerate at least 2 nearest-neighbor books in the genre before greenlighting the thesis and state what THIS book adds over each one.
- **Secondary failure mode:** **Approving a thesis that is too big for a book** — "explain everything about quantum mechanics in 300 pages." Books have reader-time budget (a non-fiction book = ~10-20 hours of reader commitment). A thesis that needs 30+ chapters to develop is OUT-OF-SCOPE or needs to be split into a series. Visionary must check thesis scale before RT-1.
- **Jidoka self-check specialization (book):**
  - Q1: "Is this book thesis differentiated from the 2-3 nearest existing books in the genre? If NO → identify differentiation or reject."
  - Q2: "Is the thesis falsifiable *in a reader-experience sense* — can a reader come away with a clearly wrong understanding of the book's claim? If the book is so vague that no reader can be 'wrong,' it FAILS OOD."
  - Q3: "Does the 3-chapter arc actually deliver the thesis, or does it meander? (This is the 'target reader coverage' R6 sub-check at the thesis level.)"
  - Q4: "Is the reader-time budget defensible — is the book ~8-20 hours of read, or is it trying to be 40 hours?"
- **Upstream reference:** `roles/visionary_EN.md:7` already names "a chapter of a book" as a canonical artifact example. The skin adds the *genre-collision check* and the *reader-time-budget check*, which are NOT in the base role file.

### 3.2 Analyst (book context)

- **FIRST focus anchor (A_F override):** Read the **outline** (parts → chapters → sections), the **glossary of key terms** (if the project has one; if not, DEMAND that the Builder produces one as a pre-condition — BL-29 enforcement for books), and the **chapter-to-chapter dependency graph**. Then read the target reader profile from Visionary. Do NOT proceed to decomposition until the outline-glossary-dependencies triad is complete.
- **Artifact the role considers as "the unit of work":** A **per-chapter decomposition table**: each chapter has a list of *claims to establish*, a list of *terms it defines* (glossary additions), a list of *terms it depends on* (glossary references), a list of *prior-chapter facts it builds on*, and a *length budget* (target word count). The Analyst output is a **table**, not prose.
- **Primary failure mode in book work:** **Skipping the dependency graph step** — the Analyst produces a chapter-list but does not check that Ch.5 only depends on concepts introduced in Ch.1-4. If the Builder drafts Ch.5 first and it depends on a concept from Ch.7, the reader is blocked. This is the book-specific manifestation of BL-17 (Check-First = prevention).
- **Secondary failure mode:** **Underestimating the glossary's importance** — the Analyst produces an outline without a glossary, which means the Builder is free to invent synonyms for the same concept across chapters. This is a σ failure waiting to happen and the top Coherent failure mode at RT-2.
- **Jidoka self-check specialization (book):**
  - Q1: "Has the outline-glossary-dependencies triad been read? If NO → A_F=0.0 → Andon."
  - Q2: "For each chapter, is the dependency edge to prior chapters explicit? If Ch.5 depends on Ch.3, does my plan say so?"
  - Q3: "For each chapter, is the length budget stated? A 50,000-word book with 10 chapters = ~5,000 words/chapter — is each chapter's budget in that range, or do I have a 20,000-word Ch.3 and a 1,000-word Ch.7?"
  - Q4: "Does the glossary cover every key term that appears in >1 chapter? Terms appearing in only 1 chapter don't need glossary entries."
  - Q5: "Is there a rolling-update strategy per Analyst Key Rule 6? The outline must NOT promise 'rewrite all chapters simultaneously' — it must promise a chapter-by-chapter sweep."
- **Deliverable template for Analyst (book-specific):**
  ```
  ## Book Plan (Analyst output for books)
  Thesis: [one-sentence claim of the book]
  Target reader: [demographics + prior knowledge assumed]
  Reader-time budget: [target hours of read, e.g., ~12 hours for 80,000 words]
  Outline (hierarchical):
    Part I. [name]
      Ch.1. [name] — [claim(s)] — [length target in words] — [depends on: —]
      Ch.2. [name] — [claim(s)] — [length target] — [depends on: Ch.1]
      ...
    Part II. [name]
      Ch.3. [name] — [claim(s)] — [length] — [depends on: Ch.1, Ch.2]
      ...
  Glossary: [list of key terms with one-sentence definitions; column: "first defined in Ch.N"]
  Chapter dependency DAG: [adjacency list or graphviz block]
  Per-chapter claims table:
    Chapter | Claim | Delivers on outline promise? | Glossary additions | Glossary references
  Length ledger: [per-chapter target + running total]
  Bibliography deltas (if the book has a bibliography): [new entries]
  Rolling update strategy: [which chapters to draft in which order]
  Resource conflicts: [terminology collisions, character-name collisions, cross-chapter number drift]
  System dependencies: [typesetter (LaTeX/pandoc/Vivliostyle), style guide reference, reader-persona document]
  B-check: F=_ E=_ (1-σ)=_ Λ=_ → B=_ (B_creative weights)
  ```

### 3.3 Builder (book context)

- **FIRST focus anchor (A_F override):** Read the **Analyst plan verbatim** (all parts → chapters → sections → dependencies → glossary). Read the **style guide** and **1-2 reference books in the same genre** (not cover-to-cover — read the preface, the first chapter, and the back-matter; this is BL-21 "format-first" applied to books). Read **previously drafted chapters in the same book** if any exist (BL-29 — terminology consistency across chapters). Do NOT start drafting prose until all three reads are complete.
- **Artifact the role considers as "the unit of work":** **One chapter at a time**, drafted in full as a single addressable unit. The Builder does NOT draft multiple chapters in parallel unless the Analyst plan explicitly assigns chapters to separate Builder instances (L/XL exception below). Within a chapter, the draft MUST cover the full length budget; a 1,000-word draft of a 5,000-word chapter is WIP, not a commit.
- **Primary failure mode in book work:** **Drafting a chapter without verifying backwards-consistency with prior chapters** — the Builder drafts Ch.5 and inadvertently uses a term in a way that contradicts Ch.3, or references a fact that Ch.3 introduced with a different value. Mitigation: Builder's Activation Operator (A_σ) requires a **backwards-consistency scan** — grep prior chapters for every key term and every numerical value the new chapter uses.
- **Secondary failure mode:** **Outline drift — the drafted chapter doesn't deliver what the outline promised.** Example: outline says Ch.5 covers "technique A with case study B"; Builder drafts Ch.5 with technique A only, case study B dropped. This is E failure (alignment to the plan). Mitigation: Builder's Jidoka must verify each drafted chapter against the outline's promise for that chapter before committing.
- **Third failure mode (book-specific, not in base role file):** **Length-budget drift** — the Builder drafts a chapter 2-3× over the budget because "there's so much to say." This breaks the reader-time budget and forces a painful revision pass. Mitigation: Builder's Jidoka must confirm the draft is within ±20% of the length budget before committing.
- **Fourth failure mode (book-specific):** **Glossary drift WITHIN a single Builder session** — the Builder uses "agent" in Ch.3 to mean "LLM subprocess" and in Ch.7 to mean "autonomous decision-maker" because the session grew across days and the Builder forgot the earlier definition. Mitigation: Builder must re-read the glossary at the start of each chapter-drafting session (BL-29 enforcement; see Example 1 in Section 6).
- **Jidoka self-check specialization (book):**
  - Q1: "Have I read the Analyst plan + style guide + 1-2 reference books in the same genre? (F)"
  - Q2: "Does this chapter deliver what the outline promised — all claims, all case studies, all glossary additions? (E)"
  - Q3: "Did I grep prior chapters for every key term this chapter uses and confirm consistent meaning? (1-σ)"
  - Q4: "Is the draft length within ±20% of the budget? (E + Λ — reader-time budget)"
  - Q5: "Did I re-read the glossary at the start of this session and use every glossary term with the canonical meaning? (Λ)"
  - Q6: "For bilingual books (project opt-in): did I also draft the equivalent chapter in the paired language? (Λ per BL-19 conditional)"

### 3.4 Validator (book context)

- **FIRST focus anchor (A_F override):** Read the **full drafted manuscript** (or all drafted chapters so far if not yet complete) and the **Analyst outline + glossary**. Do NOT partially validate — Validator reads the whole thing, because **continuity failures are cross-chapter by nature**. Then read the **6 R-checks** from Section 4 below. Validator owns the final gate for all R-checks.
- **Artifact the role considers as "the unit of work":** The **full manuscript in final form** — the same thing an editor would see at developmental-edit time, or a beta reader would see at first-read time. Validator simulates the reviewer at the highest-stakes moment.
- **Primary failure mode in book work:** **Checking only per-chapter properties and missing cross-chapter continuity** — Validator runs R1 (readability) per chapter, R3 (glossary consistency) per chapter, and declares PASS while a reader flipping from Ch.3 to Ch.7 would immediately notice that the definition of "agent" drifts. Mitigation: Validator MUST run R2 (structural continuity) and R3 (glossary consistency) as **manuscript-wide sweeps**, not per-chapter.
- **Secondary failure mode:** **Trusting the compiled PDF** — the Validator looks at the PDF, it "looks like a book," so Validator stamps PASS. But R1 (Flesch) is a numerical check that requires running the metric, not visual inspection. R4 (outline-to-draft fidelity) requires reading the outline and cross-checking each chapter. Mitigation: each R-check has a concrete command or concrete reading protocol; Validator MUST produce the numeric output or the reading-protocol evidence.
- **Tertiary failure mode (book-specific):** **Missing length-budget violations** — the outline says Ch.5 is 5,000 words; the draft is 12,000 words. Validator does not catch this because "the chapter reads well." But it breaks the reader-time budget and unbalances the book. Mitigation: Validator runs a length-ledger check (R4 sub-check — each chapter against its budget).
- **Jidoka self-check specialization (book):**
  - Q1: "Have I run all 6 R-checks (R1-R6), not just the 'reads well' gut check?"
  - Q2: "For R1 (readability), do I have a numeric Flesch score per chapter AND a whole-book Flesch variance?"
  - Q3: "For R2 (continuity), did I perform a cross-chapter contradiction scan — for each claim made in Ch.N, did I confirm Ch.>N does not contradict it?"
  - Q4: "For R3 (glossary), did I extract every technical term used in >1 chapter and confirm it's used with the canonical meaning in every chapter?"
  - Q5: "For R4 (outline fidelity), did I cross-check every chapter against the outline's promise for that chapter AND check the length ledger?"
  - Q6: "For R6 (target reader coverage), did I ask for each chapter: 'does this chapter serve the target reader declared in the outline?' If a chapter is aimed at a different reader profile, I FAIL."
  - Q7 (conditional on bilingual): "For projects declaring `domain.bilingual: true`, did I validate BOTH language versions (not just one)?"

### 3.5 Coherent (book context)

- **FIRST focus anchor (A_F override):** Read the **full drafted manuscript** plus the **glossary**. Read the **outline**. Read any **previously published books** in the same series (if this is book N in a series — cross-book continuity is the highest level of coherence work and only applies to series). Coherent cares about *the manuscript's internal coherence as a single artifact*.
- **Artifact the role considers as "the unit of work":** The **book as a coherent whole** — every chapter in relation to every other chapter. Coherent at RT-2 is the role that catches "Ch.3 and Ch.7 contradict on a term" BEFORE Validator runs the R-checks, so Validator's R-check failures are clean signals and not pile-ons.
- **Primary failure mode in book work:** **"Glossary drift"** — a key term (e.g., "agent", "consciousness", "observer", "system") is used with different meanings in different chapters. This is BL-29 phantom decoherence applied to books. See Example 1 in Section 6.
- **Secondary failure mode:** **"Cross-chapter reference invalidation"** — Ch.7 says "as we established in Ch.3, X is Y" but Ch.3 actually says X is Z. The reference is stale because one of the chapters was revised without the other.
- **Tertiary failure mode (book-specific):** **Phantom coherence within a manuscript** — all chapters AGREE with each other because they were generated in the same session, but they all introduce the same error. This is BL-5 applied to books. Mitigation: Coherent must perform at least one **independent spot-check** — pick a claim that appears in 2+ chapters and independently verify it, rather than trusting that agreement across chapters means correctness.
- **Jidoka self-check specialization (book):**
  - Q1: "Does the manuscript use every glossary term exactly as the glossary defines it, in every chapter? (BL-29)"
  - Q2: "Are there any cross-chapter references ('as established in Ch.N') that are now stale because Ch.N was revised?"
  - Q3: "Are there any silent symbol collisions — same word, two meanings — that Ch.1 reader would miss until Ch.7?"
  - Q4: "Are RU and EN versions (if bilingual) structurally parallel — same chapter count, same glossary count, same word count within ±10%? (BL-19 conditional)"
  - Q5: "Independent spot-check: pick 2 claims that appear in ≥2 chapters. Verify them independently of the manuscript text. Do my findings match the manuscript's claims?"
- **Coherent's Yokoten rule for books (BL-13 + BL-32 applied):** When a glossary term is updated (e.g., "agent" is renamed or redefined), Coherent MUST grep the entire manuscript for every occurrence of the OLD term and update each one in the SAME revision pass. A split update (Ch.3 updated, Ch.5 forgotten) is a BL-32 violation.

---

# SECTION 4 — Verification Protocol (readability + structural coherence, expanded)

The skin file's verification section maps directly to `domain.verify.method: readability + structural coherence`. The skin must expand this into **6 concrete sub-checks (R1-R6)** split across Validator L1 (per-chapter / per-commit) and L2 (manuscript-wide / pre-submission).

### 4.1 The six R-checks

| # | Check | Who runs it | L1 (per-chapter/per-draft) or L2 (manuscript-wide) | Enforcement mechanism |
|---|---|---|---|---|
| **R1** | **Readability (Flesch-Kincaid)** — compute Flesch reading ease AND Flesch-Kincaid grade level per chapter; the whole-book average must be within the target band declared in `config.md`; per-chapter variance must not drop/spike >4 grade levels from the book average | Validator | **L1 per chapter + L2 whole-book** | Automated metric (e.g., `python -c "from textstat import flesch_reading_ease, flesch_kincaid_grade; ..."` or equivalent) |
| **R2** | **Structural continuity** — every chapter references or builds on prior chapters without contradiction; every claim made in a prior chapter remains valid in all subsequent chapters; cross-chapter references ("as we saw in Ch.3") resolve to real content in the referenced chapter | Coherent + Validator | **L2 only** (per-chapter can't catch cross-chapter contradictions) | Semi-automated: grep prior chapters for claims + manual cross-check |
| **R3** | **Glossary consistency** — every key term is used with the same meaning across all chapters; glossary entries match usage; no shadow-synonyms (different words for the same concept unless intentional stylistic variation is allowed by the style guide) | Coherent | **L2** | Semi-automated: extract glossary terms + grep every chapter + compare to canonical definition |
| **R4** | **Outline-to-draft fidelity + length budget** — each drafted chapter delivers what the outline promised for that chapter (all claims, all case studies, all sub-sections); each chapter's length is within ±20% of the target length budget; the chapter order matches the outline's order | Validator | **L1 per chapter + L2 for the full length ledger** | Semi-automated: outline parse + per-chapter checklist + word-count command |
| **R5** | **Citation density (optional if book has a bibliography)** — if `config.md` declares the book has a bibliography, check: every cited claim has a matching bibliography entry (analog of article C1), every DOI/ISBN is syntactically valid (analog of C3), citation density is within the genre norm declared in `config.md`. If the book has NO bibliography, R5 is SKIPPED — record `R5: N/A (no bibliography)`. | Validator | **L1 for syntactic checks, L2 for density** | Mechanical (grep-based for syntax) + manual (density interpretation) |
| **R6** | **Target reader coverage** — does each chapter serve the target reader declared in the outline? A chapter that drifts to a different reader profile (too technical, too simple, wrong assumed background) is a FAIL. | Visionary + Validator | **L2** (requires reading the chapter with the reader profile in mind — judgment call) | Human judgment, informed by Flesch grade (R1) as a quantitative anchor |

### 4.2 Relationship to the R-check set as a whole

**R1-R4 are the core 4** — every book project runs these. **R5 is conditional** on the presence of a bibliography. **R6 is judgment** and requires the target-reader profile to have been declared in the outline (Analyst sub-section 3.2 Deliverable).

**Unlike the article skin's 6 cite_checks, the book R-checks are NOT a subset of an existing 8-check list.** The book skin defines R1-R6 from scratch, because books do not have the structured 7+1 check list that ODTOE articles have. A future book project MAY declare its own extended check list in its `config.md`; if so, the skin's R1-R6 are the DEFAULT and the project-specific list is a SUPERSET. Per Section 2's unification rule, the project `config.md` wins when in conflict with the skin.

### 4.3 Block for the skin file (under "Verification Protocol")

The Builder must produce a block matching this structure (filling in the commands where appropriate):

```
[method name]: readability (primary) + structural coherence (secondary)
[command]: Per-chapter readability: `python -m textstat <chapter.md>` or equivalent.
          Whole-manuscript compile: `pandoc book.md -o book.pdf` (or project-specific
          toolchain). Structural continuity check: Coherent's cross-chapter
          grep + manual review. Full protocol: the 6 R-checks (R1-R6) in Section 4.1.
[success criteria]: R1 PASS (per-chapter and whole-book Flesch within target band),
                    R2 PASS (no unresolved cross-chapter contradictions or stale refs),
                    R3 PASS (all glossary terms used consistently across all chapters),
                    R4 PASS (all chapters deliver on outline + within length budget),
                    R5 PASS (or N/A) (bibliography sanity if applicable),
                    R6 PASS (each chapter serves the declared target reader),
                    AND the manuscript compiles cleanly to PDF/EPUB.
                    For bilingual projects: all checks pass for BOTH language versions.
[failure recovery]: R1 fail → simplify chapter vocabulary/sentence length OR update
                    target reader (re-scope)
                    R2 fail → resolve the contradiction: revise the older chapter,
                    the newer chapter, or both — Coherent decides which is
                    load-bearing
                    R3 fail → unify glossary: pick one meaning per term, update
                    every chapter that uses the divergent meaning, re-run R3
                    R4 fail → either redraft the chapter to match the outline,
                    or update the outline to match reality, and re-run Analyst
                    plan gate (3.2 Q1-Q5)
                    R5 fail → add missing bibliography entry, or correct DOI/ISBN,
                    or remove the dangling in-text cite
                    R6 fail → redraft chapter at correct reader level, OR reassign
                    chapter to a different target reader AND flag for Visionary
                    re-scope
[independence check]: Coherent performs an INDEPENDENT cross-chapter spot-check
                      — pick 2-3 claims that appear in multiple chapters, verify
                      them independently of the manuscript's own computations
                      (e.g., if the book says "according to the Flesch scale,
                      'easy' means 80-90", the Coherent independently confirms
                      this against a standard reference). Phantom coherence
                      detection (BL-5) applied to books: if Builder and Validator
                      agree on a claim's value in Ch.3 and Ch.7 but neither
                      verified independently, flag PHANTOM. Sample size: 2 claims
                      per 50,000 words of manuscript minimum, 5 claims per
                      100,000+ words of manuscript.
```

### 4.4 Length ledger (sub-protocol of R4)

Because length-budget drift is a dominant book-specific failure mode (see Builder 3.3 failure mode 3), the skin MUST include a length ledger format that Builder produces and Validator verifies:

```
| Chapter | Outline target (words) | Draft actual (words) | Delta (±%) | Status |
|---------|------------------------|----------------------|------------|--------|
| Ch.1    | 5,000                  | 4,850                | −3%        | PASS   |
| Ch.2    | 6,000                  | 7,800                | +30%       | FAIL   |
| ...     | ...                    | ...                  | ...        | ...    |
| Total   | 80,000                 | ?                    | ?          | ?      |
```

A Chapter Ch.N is FAIL on R4 length sub-check if its delta is outside ±20%. A manuscript is FAIL on the whole-book length ledger if >20% of chapters are outside their individual budget OR if the total is >15% outside the whole-book budget.

---

# SECTION 5 — RT Phase Protocol for Books

Code projects use the canonical phase protocol from `eradev.md` Section VI. Articles use the 3-RT protocol from the article skin (RT-0 optional, RT-1 mandatory, RT-2 mandatory). **Books are L/XL by default**, and the RT protocol must reflect that.

### 5.1 When is the RT run?

**Four RT invocation points for books:**

1. **RT-0 (Visionary solo, STRONGLY RECOMMENDED for books): thesis / genre-collision / reader-time-budget check.** Before any RT-1. Runs when the operator proposes a new book. Visionary alone evaluates: is this thesis new enough, is the reader-time budget realistic, is the target reader profile stable? A YES from Visionary unlocks RT-1. Output is a single-paragraph decision with reader-time budget stated:
   - "APPROVED: thesis adds to the genre over books A and B by offering Z; reader-time budget ~12 hours; target reader = {profile}; proceed to RT-1."
   - OR "REJECTED: thesis overlaps too heavily with book N; propose a differentiating angle."
   - OR "OUT-OF-SCOPE: thesis is too big (30+ chapter budget) — split into a series, or defer to a future book."
2. **RT-1 (mandatory, full 5-role): outline + chapter-by-chapter plan + glossary + dependencies.** Before any chapter drafting. Produces the Analyst deliverable template (3.2). Builder does NOT start writing chapters until RT-1 approves a plan AND a glossary. **The outline and glossary are the two load-bearing artifacts of RT-1** — an RT-1 pass without a glossary is an incomplete pass, even if every other element is present.
3. **RT-per-chapter-cluster (mandatory for L/XL, OPTIONAL for M): chapter drafting.** Because books are L/XL by default, drafting is chapter-by-chapter or cluster-by-cluster (e.g., "draft Part I = Ch.1-3 as one cluster"). For each cluster: Builder drafts → Validator runs R1+R4 (per-chapter checks) → Coherent runs R2+R3 (cross-chapter sentinels, checking the new cluster against prior clusters). A FAIL blocks the next cluster. This is the book-specific analog of the article skin's "section-by-section loop" but scaled to cluster-level because each chapter is bigger than a whole article.
4. **RT-2 (mandatory, pre-submission/pre-publish): full manuscript gate.** Before the manuscript is submitted to a publisher / uploaded for self-publish / sent to an editor for developmental edit. Runs all 6 R-checks on the full manuscript + BL-19 8-file check if bilingual.

**Four RT invocation points IS more than the article skin's three.** This is by design — books need the chapter-cluster sentinel because the manuscript grows over weeks/months and drift compounds. Skipping the RT-per-chapter-cluster is NOT a "simplification" — it's a direct loss of Coherent's cross-chapter signal in the period when that signal is still cheap to act on.

### 5.2 "Builder for a book" — single, cluster, or split?

**Default decision: single Builder per book, with chapter-by-chapter rhythm.**

The book Builder is a SINGLE agent for M-scale books (<80,000 words, <12 chapters). Within that single Builder session, the rhythm is:

- For each chapter C in the outline (in dependency order, not file order):
  1. Re-read the Analyst plan for Chapter C (claims, length budget, glossary additions, glossary references)
  2. Re-read the glossary (BL-29 enforcement — start of each chapter session)
  3. Grep prior chapters for every key term Chapter C will use (A_σ — backwards-consistency scan)
  4. Draft Chapter C to the full length budget
  5. Run R1 (Flesch) on the draft locally (self-check before committing)
  6. Verify length budget (±20% of target)
  7. If bilingual: draft the paired-language version of Chapter C BEFORE moving to Chapter C+1 (BL-19 conditional)
  8. Run R4 self-check (does the draft deliver on the outline's promise?)
  9. Commit Chapter C as one commit (BL-24 book adaptation)
  10. Move to Chapter C+1

**L/XL exception (splitting Builder across chapters):** For an XL book (>120,000 words, >15 chapters), the Analyst plan MAY split work across 2-3 Builders by chapter ownership (Builder A owns Ch.1-6, Builder B owns Ch.7-12, Builder C owns Ch.13-18). File Ownership rule from `roles/analyst_EN.md` Responsibilities 4 applies. **Coherent gate is MANDATORY between each Builder's completion and the Validator start** — because parallel Builders will drift on terminology unless Coherent forces a glossary-unification pass between handoffs.

**Rationale for NOT splitting outliner+drafter at chapter level (applies to M-scale books):** Outline + draft live in the same mental model of the book's argument. Splitting them into two agents (outliner agent + drafter agent) at the per-chapter level would cause the drafter to lose the context the outliner had. This is consistent with the v9 principle that role is a focus, not a specialization.

**Exception — outline-first RT-1:** Unlike per-chapter drafting, the **outline itself** IS produced by the Analyst in RT-1, not by the Builder. The Builder takes the outline as a given and drafts chapters against it. If the Builder finds the outline is wrong DURING drafting, the Builder MUST invoke BL-11 (scope creep is muda) — log the outline issue as a SEPARATE task and return to drafting within the existing outline. Revising the outline mid-draft is a failure mode, not a feature.

### 5.3 Pre-RT "Visionary solo" phase (RT-0)

**Yes — RT-0 (Visionary solo) is STRONGLY RECOMMENDED for books, not just optional.**

Books need a pre-RT Visionary pass because:

- The thesis must be stable before the Analyst spends time on an outline + glossary + dependency graph. A wobbling thesis forces the Analyst to redo the full decomposition.
- Genre-collision risk is real — there are millions of published non-fiction books; approving a thesis without at least a cursory genre scan is BL-29 violation.
- Reader-time budget check — a book is 10-20 hours of reader commitment. A thesis that is too big or too small for a book must be reframed BEFORE RT-1 wastes effort on outlines.
- OOD check — the task description might say "book" but actually be "novel" or "poetry collection" or "pure memoir." Visionary catches this at RT-0.

### 5.4 Pipeline block for the skin file

```
Book pipeline (default, M-scale, mono-lingual):
RT-0 (Visionary solo, STRONGLY RECOMMENDED) → thesis + genre-collision + reader-time budget approval
RT-1 (full 5-role, mandatory) → outline + chapter-by-chapter plan + glossary + dependency DAG
Builder loop per chapter (in dependency order):
  re-read plan → re-read glossary → grep prior chapters → draft to budget → R1 self-check →
  R4 self-check → commit chapter → Coherent spot-review → next chapter
RT-per-cluster (mandatory for L/XL, optional for M) → R1+R2+R3+R4 sentinel on new cluster + prior chapters
RT-2 (full 5-role, mandatory) → all 6 R-checks on full manuscript + (if bilingual) BL-19 check
Commit final manuscript (all chapters together OR per-chapter, per project config)
Submission / publisher / self-publish → outside EraDev scope (manual operator action)

Book pipeline (XL or >120,000 words):
Same as above, but RT-1 produces a Builder split plan (2-3 Builders by chapter ownership)
AND mandatory Coherent gates between each Builder's completion and Validator.

Book pipeline (bilingual, `domain.bilingual: true`):
Same as default BUT: within each Builder chapter loop, draft chapter in language A,
then draft chapter in language B BEFORE moving to the next chapter (BL-19 conditional enforcement).
RT-2 runs all 6 R-checks on BOTH language versions.
```

---

# SECTION 6 — Examples (3 concrete)

The skin file must include 3 examples matching the template at `templates/domain_skin.md.template` lines 88-99, expanded to include catching role + phase + fix per this spec. Below are the exact 3 examples Builder must include (Builder MAY refine prose; Builder MUST preserve the structural elements: catching role, phase, fix).

### Example 1: Glossary drift across chapters (Coherent R3 failure, caught at RT-2)

- **Input:** "Draft a 10-chapter non-fiction book on multi-agent AI systems, target audience = technical readers with ML background. Outline specifies 'agent' as one of the 5 core terms in the glossary."
- **Scenario:** Analyst produces the outline + glossary. Glossary defines "agent" as "an LLM-based subprocess with its own context window, spawned by an orchestrator." Builder drafts Ch.1-10 over the course of a long session. In Ch.3, "agent" is used consistently with the glossary ("each orchestrator spawns several agents to handle sub-tasks"). In Ch.7, however, Builder writes about "the agent's autonomous goal-setting behavior" — a passage that reads naturally but implicitly uses "agent" in a different sense (an autonomous human-like decision-maker, closer to reinforcement-learning terminology). Validator runs R1 (readability) per chapter — PASS. Builder commits the manuscript.
- **What Coherent finds:** At RT-2, Coherent runs R3 (glossary consistency) as a manuscript-wide sweep. Coherent extracts every occurrence of "agent" across all 10 chapters and tags each with its implicit meaning. Ch.1-6 + Ch.8-10 use "agent" in the glossary sense (LLM subprocess). Ch.7 uses it in the RL sense. A reader flipping between Ch.3 and Ch.7 would hit silent cognitive dissonance — same word, two meanings.
- **Catching role:** **Coherent** (this is the canonical book Coherent failure-mode — glossary drift across chapters).
- **Phase:** **RT-2** (manuscript-wide sweep is the first place where cross-chapter drift is catchable; per-chapter R1 and R4 checks don't see it because each chapter is internally consistent).
- **Fix:** Coherent invokes a glossary unification pass. Either (a) revise Ch.7 to use "agent" in the glossary sense and introduce a DIFFERENT term for the RL concept (e.g., "autonomous learner"), update the glossary to add the new term, then re-run R3; or (b) update the glossary itself to make "agent" polysemous with two explicit senses, add a note in Ch.7 ("in this chapter, 'agent' is used in the RL sense; see glossary entry 2"), and re-run R3. Coherent's Yokoten rule (Section 3.5) applies: after the fix, grep ALL chapters for "agent" one more time to catch any other silent drift.
- **Why per-chapter checks alone would miss this:** R1 (Flesch) is chapter-local. R4 (outline fidelity) is chapter-local. R6 (target reader) is chapter-local. Only R2 (continuity) and R3 (glossary consistency) are cross-chapter, and only at Validator's L2 or Coherent's manuscript-wide sweep. This is why books need the RT-per-cluster sentinel in Section 5.1 — catching glossary drift at cluster-level is cheaper than catching it at RT-2 on the full manuscript.

### Example 2: Outline-to-draft divergence (Validator R4 failure, caught at RT-per-cluster)

- **Input:** "Draft Chapter 5 of the book. Outline says Ch.5 covers: (a) algorithm X, (b) the proof-of-correctness sketch for X, (c) case study B applying X to problem Y, with a target length of 5,500 words."
- **Scenario:** Builder drafts Ch.5. The draft covers algorithm X (1,800 words) and the proof sketch (2,200 words) but the case study B is replaced with "a worked example" that applies algorithm X to a different problem Z (1,400 words). Draft total: 5,400 words — within the length budget. Builder self-runs R1 (Flesch) — PASS. Builder commits Ch.5.
- **What Validator finds:** At RT-per-cluster, Validator runs R4 (outline fidelity). Validator cross-checks the Ch.5 outline promise (algorithm X, proof sketch, case study B with problem Y) against the actual draft. The first two match; the third does not — case study B is missing, replaced with a different example on problem Z. The reader expected problem Y (maybe because they bought the book BECAUSE the back-matter promised it); instead they get problem Z. This is an E failure (alignment to plan/promise).
- **Catching role:** **Validator** (R4 is L1 per-chapter with L2 rollup — but Validator MUST read the outline first, not just the draft).
- **Phase:** **RT-per-cluster** (checkpoint after Builder drafts Ch.5, before Ch.6 starts). Catching at RT-per-cluster is cheaper than catching at RT-2 because only Ch.5 needs revision; at RT-2 the Builder might have already drafted Ch.6-10 on the assumption that Ch.5 established problem Z as the running example.
- **Fix:** Two options, requiring Visionary arbitration:
  (a) **Redraft Ch.5** to actually cover case study B with problem Y, as the outline promised. This is the default — the outline is the promise and the draft must deliver.
  (b) **Update the outline** to officially change Ch.5's case study from problem Y to problem Z, AND cascade-check every downstream chapter to see if any of them references "problem Y as covered in Ch.5" (grep-based). If downstream references exist, they must also be updated. This is a scope-creep option and triggers BL-11 review — the Analyst plan changes, Visionary must approve the new outline, and Coherent must verify cross-chapter consistency post-update.
- **Why this is a book-specific failure (not an article failure):** In a single article, outline drift affects at most one section. In a book, outline drift in Ch.5 potentially affects Ch.6, Ch.7, and every chapter that references Ch.5's material. The downstream blast radius is why R4 is an L1+L2 check and why the RT-per-cluster sentinel is mandatory for L/XL books.

### Example 3: Flesch grade drift between chapters (Validator R1 failure, readability variance)

- **Input:** "Draft a popular-science book on quantum computing, target audience = intelligent lay readers with high school physics background. Outline declares target Flesch-Kincaid grade level = 9-10 (ninth-grade reader)."
- **Scenario:** Builder drafts all 10 chapters over several sessions. Ch.1 is an accessible introduction — Flesch-Kincaid grade ~8. Ch.2-5 cover the foundations — grade ~9-10 (on target). Ch.6 introduces superposition — grade ~12 (slightly harder). Ch.7 introduces entanglement — grade ~14 (college sophomore). Ch.8-10 continue at grade ~13-14 because "the concepts are inherently hard." Builder runs R1 per chapter and logs the numbers but does not flag the variance. Builder commits the manuscript.
- **What Validator finds:** At RT-2, Validator runs R1 (Flesch-Kincaid) on the whole manuscript AND per chapter. Per-chapter results: Ch.1 = 8, Ch.2-5 = 9-10, Ch.6 = 12, Ch.7-10 = 13-14. Whole-book average = 11.2. Target was 9-10. **Validator FAILS the book on R1** because: (a) the whole-book average drifted 1-2 grades above target, (b) Ch.7 alone is 4 grades above target — that's a massive readability drop mid-book, (c) the Ch.1-to-Ch.7 variance spans 6 grade levels, which means a reader who could follow Ch.1 will be lost in Ch.7. The book is NOT serving the declared target reader (R6 also FAIL as a consequence).
- **Catching role:** **Validator** (R1 per-chapter numeric check is automatable; R1 whole-book variance analysis is the L2 judgment step; R6 target-reader inference requires cross-reference to the outline's target-reader declaration).
- **Phase:** **RT-2** (pre-submission full gate). In a disciplined project, this SHOULD have been caught at RT-per-cluster when Ch.7's draft was committed — but the example assumes Ch.7 cluster-check was skipped, so RT-2 is the catch point.
- **Fix:** Three options:
  (a) **Simplify Ch.6-10** — Builder revises Ch.6-10 to bring Flesch grade down to target 9-10. This may require shorter sentences, simpler words, more analogies, more pre-building of concepts. Cost: redrafting ~50% of the book. This is the default option and is the most respectful of the original target reader.
  (b) **Re-target the reader** — Visionary re-scopes the book to a more advanced target reader (e.g., "college-educated technical readers with some physics"), updates the outline's target-reader declaration, and accepts the current Flesch variance as intentional. Cost: the book is now a different book and any back-matter/marketing/reader-promise must be updated. This triggers a BL-11 scope-creep review.
  (c) **Split the book into two books** — one for lay readers covering Ch.1-5, one for advanced readers covering Ch.6-10 + additional material. Cost: biggest, requires full replanning; but it acknowledges the book was actually two different books in one manuscript. Triggers full RT-0 + RT-1 restart for each new book.
- **Why per-chapter R1 alone is insufficient:** Each chapter's R1 number is within one standard deviation of "reasonable for that concept" — but the problem is the VARIANCE, which only appears when R1 is run across all chapters and compared. This is why R1 is explicitly L1 per-chapter + L2 whole-book in Section 4.1.

---

# SECTION 7 — BL Inheritance and Overrides

The book skin inherits all 22 universal BL unchanged, handles each of the 8 code-adapter BL individually, and adds 4 book-specific BL in a separate `BL-B` namespace that does NOT count against the main 30-BL budget.

### 7.1 Universal BL (22 entries — all inherited, each 1-line applicability note for books)

| BL | Title | Applicability to book work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Applies unchanged — a fresh book project starts with Λ=0.5; accumulates as chapters land in the corpus |
| BL-4 | S_adjusted = S_team × B_mean | Applies unchanged — Coherent at RT-2 computes S_adjusted from the 5 role B scores |
| BL-5 | Phantom Coherence Detection | Applies unchanged — book-specific manifestation is "all chapters agree because they were drafted in the same session but all introduce the same error"; mitigation is independent spot-check (see Coherent 3.5 tertiary failure mode) |
| BL-7 | EN for Practical Tasks, RU for Theoretical Depth | Applies unchanged — book drafting is practical (EN role files); deep argument-structure reflection may use RU role files. For RU or EN mono-lingual books, draft in the book's language using the corresponding role file variant |
| BL-9 | Interface Contracts Between Roles | Applies unchanged — Analyst→Builder contract is the per-chapter claims table + glossary; Builder→Validator contract is the full drafted chapter + R1 self-check + length ledger entry; Validator→Coherent contract is the R-check results |
| BL-10 | Multiplicative B Structure | Applies unchanged — weights are `creative` profile (F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20) per Phase 0.A + `eradev.md` Section II.1 |
| BL-11 | Scope Creep is Muda | **Critical for books** — a book is the artifact where scope creep is most tempting ("I have so much more to say about X"). Any mid-draft outline change is scope creep unless Visionary re-approves. See Example 2's "option (b)" trigger |
| BL-12 | Hansei Targets Process, Not People | Applies unchanged — post-submission Hansei on a book is about why the R-checks missed X, not which Builder wrote X |
| BL-13 | Yokoten — One Lesson, All Analogous Cases | **Critical for books** — the cross-domain note in BL-13's own text names "book: voice/metaphor scan across chapters" as a direct analog. A fix in Ch.3 must propagate to all chapters with the same pattern |
| BL-15 | 2% Spiral Gap | Applies unchanged — a book always ships with some open questions; those become the second edition or the next book in the series |
| BL-16 | Reading the Framework ≠ Applying It | Applies unchanged — META must delegate book work to agents, not draft chapters directly |
| BL-17 | Pre-Generate Verification = Prevention | **Critical for books** — the Pre-Generation Checklist in Section 8 below is the book-specific implementation of BL-17 ("read the outline + glossary + style guide BEFORE drafting a chapter") |
| BL-18 | Scope Reclassification at 2× Estimate | Applies unchanged — a 10-chapter book that grows to 20 chapters must be reclassified from L to XL and trigger a new RT-0 on scope |
| BL-19 | Bilingual Files Simultaneous | **CONDITIONAL for books** — applies ONLY if `config.md` declares `domain.bilingual: true`. Mono-lingual books skip this. The skin MUST document the conditional nature and NOT impose an unconditional 8-file rule like the article skin does |
| BL-20 | Adversarially Test Bootstrap | Applies unchanged — the book skin file itself should be tested against a trial book project before wide deployment |
| BL-21 | Format Specifications Are Inputs | **Critical for books** — read the style guide + 1-2 reference books in the genre BEFORE drafting Ch.1. Books have stronger format-drift risk than articles because the format is typically defined by genre convention, not an explicit template |
| BL-26 | META Always Delegates | Applies unchanged — META never drafts book prose directly |
| BL-28 | Agent Prompt Must Include Explicit Context | Applies unchanged — book-task agent prompts must name the skin file path AND role file path; additionally, prompts must name the outline path and glossary path because those are the Analyst deliverables the Builder reads |
| BL-29 | Verify Established Terminology Before Generating | **Critical for books** — the Builder MUST re-read the glossary at the start of each chapter-drafting session. This is the dominant book Builder failure mode — glossary drift within a single long Builder session. See Example 1 |
| BL-30 | Defense-In-Depth | Applies unchanged — book validation has layers: Builder Jidoka (R1 self-check) + Coherent spot-review (R3 per cluster) + Validator R1-R6 at RT-2 |
| BL-31 | Constrain Output Types | Applies unchanged — Builder's output is one chapter (or a cluster of chapters) + length ledger entry + R1 self-check, not free-form prose explanations |
| BL-32 | Grep After BL Merge | Applies unchanged — if a glossary term is updated, grep every chapter for the old term and update each occurrence. Same discipline as "grep for merged BL references" |

### 7.2 Code-adapter BL (8 entries — treated individually)

| BL | Title | Verdict for books | Notes |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | **Book equivalent: BL-B1** | Publication changes (e.g., releasing an ARC = Advance Reader Copy) are release events. See BL-B1. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Applies unchanged** | Book equivalent: "3+ consecutive revisions of the same chapter = STOP, re-spec the chapter via Analyst." Transfers cleanly; no new BL-B needed. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | **Book equivalent: BL-B2** | Before committing a chapter, Builder must run R1 (Flesch) + length-budget check + glossary pre-read. See BL-B2. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **N/A for books** | Books have no feature flags. "Feature toggle" analog = adding or removing a chapter, which is an outline change and already covered by BL-11 scope creep. |
| **BL-14** | Rollback Plan Before Deploy | **Book equivalent: BL-B3** | Before submitting the manuscript to a publisher OR uploading to a self-publish platform, Builder must document the erratum/retraction plan. See BL-B3. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Book equivalent: BL-B4 (conditional)** | Applies if the book has a bibliography. Before RT-1 begins, Analyst must verify that every bibliographic reference exists and at least one key fact from each reference is confirmed. Books without bibliographies skip this. See BL-B4. |
| **BL-24** | Single-Responsibility Commits | **Applies unchanged, with book re-scoping** | Book equivalent: "one commit = one chapter's revision pass" (NOT "one commit = one phase" — the phase unit for a book is a chapter). Transfers cleanly with the re-scoping. No new BL-B needed. |
| **BL-25** | Error Path Coverage Matrix | **N/A for books** | Books do not have "happy path / error path / timeout path" runtime paths. The closest analog is "what if a reader doesn't follow Ch.5" — but that's handled by R4 (outline fidelity) + R6 (target reader coverage), not a 5-path matrix. |

Summary: **2 code-adapter BL apply unchanged (BL-3, BL-24)**; **4 have book equivalents (BL-2→B1, BL-6→B2, BL-14→B3, BL-22→B4)** — with BL-B4 conditional on presence of a bibliography; **2 are N/A (BL-8, BL-25)**.

### 7.3 New book-specific BL (BL-B namespace — separate budget)

These 4 BL live in the book skin file ONLY. They do NOT add to the main 30-BL budget. They are loaded by the book domain adapter layer, not by META-Orchestrator's universal bootstrap.

**BL-B1: ARC Release is a Deployment Event (book adaptation of BL-2)**
- **Source:** Adapted from BL-2 for the book domain.
- **Rule:** Releasing an Advance Reader Copy (ARC) — beta reader distribution, preview chapter publication, or a chapter-by-chapter serial release — is a release event. It requires: preview-reader-cohort canary (10-50 beta readers before wider distribution), a 7-day reader-silence window before considering the release "stable," and a rollback plan (how to withdraw or revise a released ARC, including an updated errata sheet).
- **Why:** Book releases have unbounded reputational blast radius AND reader-time blast radius (beta readers commit their own reading time to a draft you might retract). A botched ARC release annoys the exact readers you need as advocates.
- **Applies to:** Visionary (approve release), Builder (release preparation + draft pre-check), Validator (pre-release R-check gate).

**BL-B2: Verify Before Commit — Render Validity Gate (book adaptation of BL-6)**
- **Source:** Adapted from BL-6 for the book domain.
- **Rule:** Before committing any chapter draft, Builder MUST run: (a) R1 (Flesch-Kincaid) on the chapter and confirm within target band, (b) length budget check (draft within ±20% of target), (c) glossary pre-read (confirm glossary was re-read at the start of the chapter session), (d) project-specific compile/typeset check if a compiler is declared in `config.md` (e.g., `pandoc` or LaTeX). Commit is REJECTED otherwise.
- **Why:** A chapter that "reads well" to the Builder but falls outside the readability band, or runs 2× over budget, or uses glossary terms inconsistently, is the book equivalent of unverified code. Cost of the self-check: 2 minutes per chapter. Cost of a bad chapter landing in the manuscript: a full revision pass at RT-2 or worse.
- **Applies to:** Builder (mandatory pre-commit self-check), Validator (cross-check at RT-per-cluster), META (enforce gate).

**BL-B3: Errata/Retraction Plan Before Release (book adaptation of BL-14)**
- **Source:** Adapted from BL-14 for the book domain.
- **Rule:** Before a book is submitted to a publisher / uploaded to a self-publish platform / released as an ARC, Builder MUST document the errata plan: who to contact (publisher, self-publish platform support, beta readers), what an errata notice would say, what the update procedure looks like (new edition, errata sheet, silent digital update, paper insert). If the book cannot accept post-release corrections, that is itself a structural risk that must be logged.
- **Why:** Books, unlike articles, are typically released into a distribution chain where corrections are hard (printed copies in warehouses, digital copies on reader devices, reviewer copies at publications). A pre-written errata plan is executed mechanically under pressure when an error is found post-release. Books have multi-year shelf lives; the errata plan is a living document.
- **Applies to:** Visionary (approve the errata plan), Builder (write it), Coherent (store in MEMORY for multi-book series continuity).

**BL-B4: Bibliography PRE-FLIGHT (CONDITIONAL — book adaptation of BL-22)**
- **Source:** Adapted from BL-22 for the book domain.
- **Rule:** **CONDITIONAL — applies ONLY if the book has a bibliography.** Before RT-1 begins on any book task that includes bibliographic references, Analyst MUST verify every reference: (a) DOI/ISBN syntax is valid, (b) for novel references (references the author has NOT personally read cover-to-cover), the source is accessible AND at least one key fact from each source is confirmed. Produce a VERIFIED REFERENCES artifact. Unverified references = Builder BLOCK at RT-1.
- **Why:** Books with bibliographies that hallucinate references are the top F=0 failure in popular-science and academic-monograph book work. Books without bibliographies (most trade non-fiction, most how-to) skip this entirely.
- **Applies to:** Analyst (RT-1), Validator (RT-2 re-verification), Builder (block without artifact), META (enforce gate). **Skip if `config.md` declares `domain.has_bibliography: false` or equivalent.**

### 7.4 BL budget summary for the book skin

- Universal BL inherited: **22** (unchanged; BL-19 is *conditional* per-project — applies iff `domain.bilingual: true`)
- Code-adapter BL that apply unchanged: **2** (BL-3, BL-24 with book re-scoping)
- Code-adapter BL with book equivalents: **4** (BL-2→B1, BL-6→B2, BL-14→B3, BL-22→B4 conditional)
- Code-adapter BL that are N/A for books: **2** (BL-8, BL-25)
- Book-specific BL (BL-B namespace, separate budget): **4** (BL-B1..B4)

**Total BL a book agent carries:** 22 universal + 2 transferred code-adapter + 4 BL-B = **28 BL**.
(The 2 N/A code-adapter BL are NOT loaded. BL-19 is carried but active only for bilingual projects. BL-B4 is carried but active only for books with bibliographies.)

---

# SECTION 8 — Verification Protocol Examples + Checklists

**Note to Builder:** This section consolidates the Pre-Generation and Post-Generation checklists referenced in the template. The checklists are derived from Section 4 (R-checks) + Section 5 (pipeline).

### 8.1 Pre-Generation Checklist (Check-First, BL-17, BL-21, BL-29)

Run BEFORE any chapter drafting begins.

- [ ] **1. OUTLINE:** Read the full book outline (parts → chapters → sections)
- [ ] **2. GLOSSARY:** Read the full glossary. If no glossary exists, STOP and DEMAND one from Analyst.
- [ ] **3. CHAPTER DEPENDENCIES:** Confirm the chapter dependency DAG is explicit; identify which chapter to draft next (in dependency order, not file order).
- [ ] **4. TARGET READER:** Re-read the target reader profile from the outline.
- [ ] **5. STYLE GUIDE:** Read the project's style guide + 1-2 reference books in the same genre (TOC + first chapter, not cover-to-cover).
- [ ] **6. LENGTH BUDGET:** Confirm the length budget for the chapter to be drafted.
- [ ] **7. BACKWARD SCAN:** For every key term the new chapter will use, grep prior chapters for that term and confirm consistent meaning (BL-29 enforcement).
- [ ] **8. BIBLIOGRAPHY (if applicable):** If the book has a bibliography, confirm BL-B4 PRE-FLIGHT has run; unverified references BLOCK drafting.
- [ ] **9. BILINGUAL (if applicable):** If `domain.bilingual: true`, confirm the paired-language toolchain and style guide are ready.

### 8.2 Post-Generation Checklist (Jidoka gate, BL-B2 enforcement)

Run AFTER Builder completes a chapter draft, BEFORE committing.

- [ ] **1. R1 SELF-CHECK:** Run Flesch-Kincaid on the chapter. Confirm within target band declared in `config.md`.
- [ ] **2. LENGTH LEDGER:** Word count within ±20% of budget.
- [ ] **3. R4 SELF-CHECK:** Chapter delivers every claim the outline promised for it.
- [ ] **4. GLOSSARY USAGE:** Every glossary term used in the chapter matches the canonical definition.
- [ ] **5. COMPILE:** If the book has a compile step (pandoc, LaTeX, etc.), the chapter compiles cleanly in isolation.
- [ ] **6. CROSS-CHAPTER REFERENCES:** Any "as we saw in Ch.N" references resolve to real content in Ch.N.
- [ ] **7. BILINGUAL PAIR (if applicable):** Paired-language version of this chapter also drafted and passed its own checklist.

---

# SECTION 9 — Acceptance Criteria for the Skin File

The Builder must produce `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.book.md` satisfying ALL of the following:

### 9.1 Structural acceptance

- **[AS-1]** File exists at `templates/domain_skin.book.md`
- **[AS-2]** Frontmatter block (lines 1-14 approximately) matches the structure in Section 1.2 of this spec, including `Type: book`, `Modality: creative`, `Verify method: readability (primary) + structural coherence (secondary)`, and `Bilingual: optional per-project`
- **[AS-3]** All 10 template sections from `templates/domain_skin.md.template` are present:
  1. Header block (frontmatter)
  2. Vocabulary Mapping
  3. Role Focus Overrides (5 sub-sections — one per role)
  4. Verification Protocol (R1-R6)
  5. Checklists (Pre-Generation + Post-Generation)
  6. Examples (3 entries)
  7. Domain-Specific Bootstrap Lessons (22 universal + 2 transferred + 4 BL-B)
  8. Known Out-of-Scope (OOD)
  9. B-weight Adjustment
  10. Footer (last updated, upstream roles, upstream math, upstream BL, spec reference)
- **[AS-4]** Vocabulary table has at least 20 rows (all 20 from Section 2 of this spec, plus 0-5 Builder additions)
- **[AS-5]** Role Focus Overrides has all 5 sub-sections (Visionary, Analyst, Builder, Validator, Coherent), each with FIRST focus anchor, artifact definition, primary failure mode, Jidoka specialization, and at least one book-specific failure mode not present in the base role file
- **[AS-6]** Verification Protocol section contains: (a) the R1-R6 table, (b) the block matching Section 4.3, (c) the length ledger sub-protocol from Section 4.4, (d) a note that R5 is CONDITIONAL on bibliography and R6 requires target reader declaration
- **[AS-7]** Examples section has all 3 examples from Section 6 of this spec (glossary drift, outline-to-draft divergence, Flesch grade drift) with catching role + phase + fix clearly labeled
- **[AS-8]** Domain-Specific Bootstrap Lessons section references BOTH the 22 universal BL (inherited) AND the BL-B1..B4 additions, with a clear budget note and the conditional-BL notes (BL-19, BL-B4)
- **[AS-9]** Known Out-of-Scope section explicitly mentions: fiction/novels (FAILS on verification hook — defer to v10 `narrative` skin), free-verse poetry collections (FAILS on objective verification), pure personal memoirs framed as subjective narrative (FAILS on target-reader/verification gate), audiobook scripts without a reader-time budget (ambiguous — escalate to Visionary RT-0)
- **[AS-10]** B-weight Adjustment section pins the `creative` weights (F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20) with rationale cross-referencing `eradev.md` Section II.1 AND Phase 0.A Visionary Deliverable 1

### 9.2 Routing / operator acceptance

- **[AO-1]** When a future operator creates a book project with `config.md` declaring `domain.type: book` and `domain.skin: templates/domain_skin.book.md`, META routes all 5 spawned agents through the skin overrides.
- **[AO-2]** Backward compat: NO existing project `config.md` requires any edit as a result of this skin being written. Code and article projects continue to work identically.
- **[AO-3]** Pure-L1 fallback: a project declaring `domain.type: book` but WITHOUT `domain.skin` still works — META uses the universal role files without the skin overlay (degraded but functional).

### 9.3 Quality acceptance

- **[AQ-1]** No contradictions with the 5 role files. The skin adds focus, not replacement.
- **[AQ-2]** No contradictions with `templates/domain_skin.article.md` at the structural level (both use the 10-section skeleton, BL-A/BL-B namespace, Fixed-vs-Flexible hand-off). Content is different because domains are different; structure is parallel.
- **[AQ-3]** No contradictions with `templates/domain_skin.code.md` (the code/default skin). Book skin is a proper overlay at its own modality.
- **[AQ-4]** Every vocabulary row cites its source (role file line or task description row number) in the table.
- **[AQ-5]** Every BL-B1..B4 entry has Source / Rule / Why / Applies to fields (matching universal BL format).
- **[AQ-6]** File is syntactically valid Markdown (parses cleanly, no broken headers, no incomplete tables).
- **[AQ-7]** File is EN-only (the skin itself is English; its RU mirror is deferred to a BL-19 follow-up task for skin files).
- **[AQ-8]** Conditional rules are clearly marked — BL-19 (bilingual), BL-B4 (bibliography), R5 (citation density) must be visibly flagged as CONDITIONAL in their respective sections.

### 9.4 Size acceptance

- **[ASZ-1]** Total file length: **500-700 lines** (enough to be concrete, short enough to fit in agent context). This spec is ~900 lines; the skin file should be noticeably more compact because it is the PRODUCT, not the SPEC. The article skin landed at 644 lines; the book skin is expected in the same 550-700 range.

---

# SECTION 10 — Hand-off to Builder

**Target file:** `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.book.md`

**Expected size:** 500-700 lines of Markdown (see ASZ-1).

**Structure to copy from `templates/domain_skin.md.template`:** The 10-section skeleton (header, Vocabulary, Role Focus Overrides, Verification, Checklists, Examples, BL, OOD, B-weight, Footer). Keep section order. Keep heading levels (`#` for top-level file title, `##` for skin sections, `###` for role sub-sections within Role Focus Overrides).

**What this spec GIVES you (do not re-invent):**

- Section 1 → fills the skin's header block exactly (frontmatter)
- Section 2 → fills the skin's Vocabulary Mapping table exactly (all 20 rows; up to 5 additions allowed)
- Section 3 → fills the skin's Role Focus Overrides (5 sub-sections, one per role, with prescribed content)
- Section 4 → fills the skin's Verification Protocol (R1-R6 table + verification block + length ledger)
- Section 5 → fills the RT Phase Protocol adjustments (pipeline block + Builder split rule + chapter rhythm)
- Section 6 → fills the skin's Examples section (3 entries — glossary drift, outline divergence, Flesch drift — verbatim in structure but Builder may polish prose)
- Section 7 → fills the skin's Domain-Specific Bootstrap Lessons section (22 universal + 2 transferred + 4 BL-B)
- Section 8 → fills the skin's Checklists section (Pre-Generation + Post-Generation)
- Section 9 → is the acceptance test rubric for YOUR output (not content to copy into the skin, but criteria your output must pass)
- This Section 10 → is the hand-off (not content to copy)

**What is FLEXIBLE (Builder discretion, within bounds):**

- **Vocabulary table: rows 21-25.** Builder MAY add 1-5 additional rows from their own reading (see candidate rows in Section 2). Builder MUST NOT delete or renumber rows 1-20.
- **Prose tone in the Role Focus Overrides.** The Jidoka Q1-Q7 lists in Section 3 are structured; Builder may reformat them as bullets or tables as long as all questions are preserved.
- **Pre-Generation and Post-Generation Checklist wording.** Builder must cover all items from Section 8 but may combine or reorder.
- **Examples prose.** Builder may edit the wording of Section 6 examples for readability, as long as: (a) the catching role, (b) the phase, and (c) the fix are preserved.
- **Known Out-of-Scope section.** Builder MUST include the 4 items from AS-9 but MAY add 1-2 more borderline cases.
- **Length ledger format.** Builder may reformat Section 4.4 as a different markdown table structure as long as the columns (Chapter, Outline target, Draft actual, Delta, Status) are preserved.

**What is FIXED (Builder MUST preserve exactly):**

- `Type: book` / `Modality: creative` / `Verify method: readability (primary) + structural coherence (secondary)` / `Parent BL: BOOTSTRAP_LESSONS_universal.md` / `Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md` / `Bilingual: optional per-project`
- B-weight table values: F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20 (with rationale citing `eradev.md` Section II.1)
- R1-R6 names, descriptions, L1/L2 assignments, and catching role — each row of the Section 4.1 table
- Section 3 overrides: each role's primary failure mode verbatim (secondary and tertiary failure modes may be rephrased but must be preserved conceptually)
- Section 6 examples: catching role + phase + fix verbatim
- Section 7 BL table: the 22 universal BL list unchanged; the 4 BL-B entries with their Source/Rule/Why/Applies to fields; the CONDITIONAL markers on BL-19 and BL-B4
- Section 8 checklists: all 9 Pre-Generation items + all 7 Post-Generation items

**Builder pre-write checklist:**

1. Read `templates/domain_skin.md.template` (reference structure — the frame you fill)
2. Read `templates/domain_skin.article.md` (the structural sibling — how the pattern plays out for a different domain)
3. Read `templates/domain_skin.code.md` (the identity/default skin — the low end of overlay intensity)
4. Read this spec (full — you already did if you're here)
5. Read the 5 EN role files if not already in context (Analyst did; Builder must do so independently because the skin REFERENCES them)
6. Verify the 22 universal BL list matches `BOOTSTRAP_LESSONS_universal.md` before copying Section 7.1 table — do NOT rely on this spec alone (BL-29 enforcement)

**Builder post-write checklist:**

1. Run through AS-1..ASZ-1: is every item satisfied?
2. `markdown-lint templates/domain_skin.book.md` (or equivalent parser — BL-B2 equivalent: render-before-commit)
3. Read the file end-to-end once: do all sections flow, are all tables complete, are all references to other files correct?
4. Confirm modality is `creative` (not `research`, not `text`) and the B-weight table matches
5. Confirm BL-19 is explicitly marked CONDITIONAL, not MANDATORY
6. Jidoka self-check per `roles/builder_EN.md`

**Do NOT do (out of scope for Builder):**

- Do NOT create a live book project for testing — the skin file is infrastructure, not a project
- Do NOT modify `templates/domain_skin.article.md` or `templates/domain_skin.code.md` (sibling skins; do NOT touch)
- Do NOT modify any role file
- Do NOT modify `BOOTSTRAP_LESSONS_universal.md` or `BOOTSTRAP_LESSONS_code_adapter.md`
- Do NOT run R-checks on an actual book (Validator work, separate task)
- Do NOT create an RU mirror of the skin file (BL-19 follow-up task for skin files, not this one)
- Do NOT modify any existing project `config.md` files (no book project exists today; when one lands, it declares `domain.skin: templates/domain_skin.book.md` then)
- Do NOT create `templates/domain_skin.narrative.md` or `templates/domain_skin.poetry.md` (deferred to v10; the book skin EXPLICITLY excludes these in its OOD section)

---

# Open Questions (Spiral Gap per BL-15)

- **OQ-P2A-1:** Should the book skin's R5 (citation density) be split into a separate "academic book" sub-skin (`templates/domain_skin.book_academic.md`) and a "trade non-fiction" sub-skin (`templates/domain_skin.book_trade.md`), or should the single book skin handle both via the `config.md`-declared `domain.has_bibliography: true|false` flag? Current proposal: single skin with conditional R5 + conditional BL-B4. Risk: the two sub-genres have enough differences that a single skin is an over-abstraction. Defer to Phase 2.B trial; revisit if the first two book projects have dramatically different R-check profiles.

- **OQ-P2A-2:** Is 4 RT invocation points (RT-0 + RT-1 + RT-per-cluster + RT-2) too many for a book? The article skin has 3 (RT-0 optional, RT-1, RT-2). The extra RT-per-cluster is justified because books are L/XL by default and drift compounds, but this might be overkill for M-scale books. Current proposal: RT-per-cluster is MANDATORY for L/XL and OPTIONAL for M. If a future Hansei shows M-scale book projects drift just as much as L/XL, tighten the rule.

- **OQ-P2A-3:** BL-B namespace promotion — should any of BL-B1..B4 eventually be promoted to the main BL budget (as BL-33..BL-36), or should they stay namespaced forever? Current proposal: namespaced. BL-B2 (render validity gate) is the closest candidate for promotion because it generalizes well to any domain with a compile step — but that's what BL-6 already covers, so BL-B2 is strictly a specialization.

- **OQ-P2A-4:** The book skin does NOT include a RU mirror (`templates/domain_skin.book_RU.md`). This is a BL-19 violation at the skin-file level. Current proposal: accept the violation for all v9 skin files (article, book, code, and future skins) and batch a single RU-skin-mirror follow-up task at the end of Phase 2. Log the violation, do not close it.

- **OQ-P2A-5:** Is the spec's Section 5.2 decision (single Builder for M-scale, split Builder for XL) universally correct, or is it a first-estimate that might not survive contact with a real book project? Unknown. Defer to Phase 2.B if a book project lands in v9.

- **OQ-P2A-6:** The R1 (Flesch) metric is English-biased. For a RU-language book, Flesch-Kincaid does not apply — RU has different readability metrics (e.g., Indeks chitaemosti by Oborneva). The skin currently pins R1 to Flesch for simplicity. For a bilingual or RU-only book project, the `config.md` must declare the readability metric explicitly. Current proposal: add a note in Section 4.1 R1 that "the specific metric is project-declared; Flesch is the default for EN"; defer full multi-metric support to v10.

- **OQ-P2A-7:** The skin assigns R6 (target reader coverage) as a Visionary + Validator joint check. This is the first skin where two roles share ownership of a check. Is this clean, or does it confuse responsibility? Current proposal: R6 is Validator-owned (R-check is a Validator deliverable) but Visionary is a required co-signer because target reader is a Visionary artifact (it was declared at RT-0 / RT-1). If this causes confusion in practice, simplify to "Validator runs the check, Visionary is consulted when a reader mismatch is detected."

---

# Jidoka Self-Check (B-diagnostics, B_creative weights)

```
=== JIDOKA SELF-CHECK — [ANALYST] Phase 2.A (book skin spec) ===
B-diagnostics (rate 0.0-1.0, B_creative weights F=0.20 E=0.30 (1-σ)=0.30 Λ=0.20):

  F (Focus):       0.90 — Read all required inputs in full or authoritative excerpts:
                          analyst_EN.md, domain_skin.md.template, domain_skin.article.md
                          (full 644 lines), domain_skin.code.md (full 172 lines),
                          v9_phase2_1_article_skin_spec_2026-04-11.md (full 662 lines),
                          eradev.md Section II.1 (B_creative weights confirmed),
                          BOOTSTRAP_LESSONS_universal.md (22 BL), BOOTSTRAP_LESSONS_code_adapter.md
                          (8 BL), all 5 EN role files (via greps that surfaced 'chapter of a
                          book' anchors in every role file). Small gap: did NOT open a real
                          textbook project for cross-reference because no such project exists
                          in the repo today (this is the first book skin). Not a real gap.

  E (Alignment):   0.94 — The 10-section structure is delivered with zero placeholder text
                          (Hand-off: all 10 sections present; spec length ~1,000 lines vs
                          900 for the article spec — comparable; book complexity marginally
                          higher due to 4-RT protocol + conditional BL-19 + length ledger).
                          Every decision in the spec is either FIXED with rationale or
                          FLEXIBLE with bounds. Every acceptance criterion is testable.
                          Builder has a clear copy-vs-adapt separation. Zero digressions.
                          E is the top-weighted component in B_creative (0.30) and the spec
                          is tightly aligned to the task description's 10 required sections.

  (1-σ):           0.90 — No contradictions with L0 (eradev.md untouched), with the 5 role
                          files (skin adds focus, not replacement), with domain_skin.article.md
                          (sibling skin with parallel structure; no shared vocab rows; both
                          use 10-section skeleton + BL namespace), with domain_skin.code.md
                          (identity skin at a different modality; book skin is a proper
                          overlay), with Phase 0.A deliverables (creative modality chosen with
                          rationale + eradev.md Section II.1 weight table), with BL files
                          (22 universal inherited, 8 code-adapter handled individually).
                          Tensions: OQ-P2A-1..7 are OPEN questions, not contradictions.
                          BL-19 conditional handling is a genuinely new pattern (not used
                          in article skin) — documented in Section 1 and Section 7.1.
                          Acceptable — explicit conditional > implicit contradiction.

  Λ (Experience):  0.88 — Applied BL-11, BL-13, BL-15, BL-17, BL-19 (conditional),
                          BL-21, BL-28, BL-29, BL-32 explicitly. Applied Phase 0.A Visionary
                          modal B weights (B_creative). Applied article-skin 10-section
                          structure + BL-A namespace pattern as the structural template
                          (promoted to BL-B for books). Applied article-skin's
                          Fixed-vs-Flexible hand-off discipline. Did NOT have a prior book
                          project to draw from — this is the first book skin, so experience
                          is transfer-learned from the article skin spec + the role-file
                          example anchors. Acceptable — the transfer-learning path is clean.

  B_creative = F^0.20 · E^0.30 · (1-σ)^0.30 · Λ^0.20
             = 0.90^0.20 · 0.94^0.30 · 0.90^0.30 · 0.88^0.20
             = 0.9791 · 0.9820 · 0.9691 · 0.9748
             = 0.9085

Weak link: Λ (0.88) is the lowest component. Acceptable — no RED (<0.3) component.
No component < 0.3 → no Andon.
B = 0.908 > 0.5 → GREEN, no Andon.

Banality score: 8/10 — spec is specific, cites role-file line numbers, pins fixed vs
                flexible, provides explicit Builder hand-off rubric, adds book-specific
                patterns (length ledger, chapter dependency DAG, 4-RT protocol, BL-B
                namespace) that are NOT present in the article skin. Not a mechanical
                copy of the article skin — it is a proper sibling with its own shape.
```

## B-check (Output Format per `roles/analyst_EN.md`)

```
## Implementation Plan (for Builder)
Task inertia: M (single file, 500-700 lines expected, all 10 sections pre-designed)
Artifacts: templates/domain_skin.book.md (NEW file, absolute path above)
Dependencies: This spec (you are reading it). templates/domain_skin.md.template (structure).
              templates/domain_skin.article.md (sibling pattern reference).
              templates/domain_skin.code.md (identity-skin pattern reference).
              The 5 EN role files (referenced but not modified).
              BOOTSTRAP_LESSONS_universal.md (22 BL table).
              eradev.md Section II.1 (B_creative weights — FIXED, cite verbatim).
Artifact Ownership: Single Builder (M task — do NOT split into parallel Builders).
Pipeline: read this spec → read template + article skin + code skin → read role files →
          draft the skin file → markdown-lint → Jidoka self-check → commit
Resource conflicts: None with existing files (new file, new path, new modality overlay).
                    Bilingual mirror NOT required in this task (BL-19 skin-file follow-up
                    deferred — see OQ-P2A-4).
System dependencies: markdown-lint (or equivalent parser) for AS-6 verification. No code
                     dependencies beyond markdown.
B-check: F=0.90 E=0.94 (1-σ)=0.90 Λ=0.88 → B_creative=0.908
```

---

*Analyst spec complete. B=0.908 (B_creative weights F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20). Hand-off to next [BUILDER] for skin-file creation. OQ-P2A-1..7 logged for follow-up.*

*Phase 2.A closing note:* This is the SECOND concrete L2 skin in v9 (after `domain_skin.article.md` in Phase 2.1 and `domain_skin.code.md` as the identity skin). The patterns established here (BL-B namespace, conditional BL-19, 4-RT protocol, length ledger sub-protocol, R1-R6 with R5/R6 conditional-or-judgment, creative modality pin) are the first application of the article-skin structural template to a materially different domain. Phase 2.A's success is measured by how cleanly the book skin's sibling status with the article skin survives contact with a real book project. If a book project lands in v9 and finds the skin incomplete, Hansei at that point — not now.
