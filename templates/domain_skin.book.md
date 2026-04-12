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

## Purpose / When META Loads This Skin

META loads this skin when a project's `config.md` declares:
- `domain.type: book`
- `domain.skin: templates/domain_skin.book.md`

When loaded, the skin is passed to every spawned role agent in addition to the base role file `roles/{role}_EN.md`. It does NOT replace the role file — it provides a vocabulary map, focus overrides, verification expansion, RT adjustments, examples, and an inherited-vs-overridden BL table specific to book-length non-fiction work. The skin targets textbooks, academic monographs, and non-fiction long-form (how-to, history, popular science) — NOT novels, NOT poetry, NOT pure personal memoirs framed as subjective narrative. See "Known Out-of-Scope" below for the full OOD list.

Backward compatibility: introducing this skin does NOT require any change to existing projects. Code projects without `domain.skin` continue to behave as before. Article projects using `templates/domain_skin.article.md` continue to behave as before.

---

## Vocabulary Mapping

This skin overrides the abstract role-file vocabulary for book tasks. When an agent sees these generic terms in `roles/{role}_EN.md`, it reads them as the book-specific meanings below.

| # | Abstract term (role file / BL) | Book meaning | Where used (evidence) |
|---|---|---|---|
| 1 | **artifact** | a chapter of the book, a section inside a chapter, a full manuscript draft, or a published PDF/EPUB/print edition | `roles/analyst_EN.md:7` ("a chapter of a book, a configuration..."); `roles/builder_EN.md:7`; `roles/validator_EN.md:7`; `roles/visionary_EN.md:7`; `roles/coherent_EN.md:7` |
| 2 | **function** | a chapter section — the smallest addressable unit inside a chapter (typically numbered §3.2.1 or named "3.2 Consistency Gate") | `roles/analyst_EN.md:7` ("a function, a paragraph, a stanza, a config key...") |
| 3 | **module** | a chapter or a part — a multi-chapter group (e.g., "Part I: Foundations"); book structure is hierarchical parts → chapters → sections | Book convention; `roles/analyst_EN.md:29` "Rolling update is mandatory -- never design an update of all nodes, all sections, or all chapters simultaneously" |
| 4 | **compile** | typeset the book / build the PDF / build the EPUB / assemble the print-ready file (e.g., `pandoc book.md -o book.pdf`, `tectonic book.tex` for LaTeX books, `vivliostyle book.yml` for web-standards books) | `roles/builder_EN.md:30` ("ARTIFACT CONTENT GATE"); analogous to article skin row #4 |
| 5 | **test / tests pass** | readability pass (Flesch grade within target band) + continuity pass (σ check across chapters) + outline-fidelity pass (every drafted chapter matches the outline's promise for it) | Analogous to article skin row #5; mapped to R1/R2/R4 in Section 4 below |
| 6 | **verify** | readability pass + structural coherence pass (R1-R6 sub-checks; see Section 4) | `roles/analyst_EN.md:24`; `domain.verify.method: readability` |
| 7 | **validate** | run all 6 R-checks on the full manuscript; Validator owns the final gate | `roles/validator_EN.md:7` |
| 8 | **build** | produce the full manuscript set — outline + all drafted chapters + glossary + (optional) bibliography + front-matter + back-matter | Book convention; analogous to article skin row #8 |
| 9 | **runtime** | reader's reading time — how long a reader spends on the book (the blast-radius proxy for books). Readers of a 300-page book commit 10-20 hours of their life; a wasted chapter costs them more than a wasted article costs a reader | `roles/builder_EN.md:26` "BLAST RADIUS DICTATES PROCESS" |
| 10 | **spec / specification** | book outline / chapter plan / table of contents — the structured promise made to the reader | `roles/analyst_EN.md:7` ("the smallest addressable element inside that artifact") |
| 11 | **feature / feature flag** | a new chapter added to the manuscript, or a new section added to an existing chapter (a "feature" of the book the reader will encounter) | `roles/builder_EN.md:28` "Feature flags / staged rollouts = release event — releasing a preview chapter" |
| 12 | **API / API endpoint** | character sheet / concept registry / glossary entry — the stable interface between chapters where a term, a character, or a concept is formally defined once and referenced everywhere else | `roles/coherent_EN.md:7` "voice for narrative" (Coherencer's concept) |
| 13 | **bug** | contradiction across chapters — a claim in Ch.3 that contradicts a claim in Ch.7, a definition drift, a character-fact drift, a numerical drift, a tone drift | `roles/validator_EN.md:20` ("B-diagnostics of defects") |
| 14 | **refactor** | restructure the book outline — move sections between chapters, merge two chapters into one, split one chapter into two, reorder parts, without changing the central claim of the book | `roles/analyst_EN.md:29` Key Rules 6 (rolling update) |
| 15 | **code review** | editor's review / developmental edit / peer read — a full manuscript read by an editor or beta reader who gives structural feedback (not copy-edit; structural) | `roles/visionary_EN.md:51` Example 2 |
| 16 | **PR / pull request** | manuscript submission to a publisher, a chapter submitted for beta-reader review, or a proposed chapter added for RT review | `roles/builder_EN.md:57` Decision-Point Checklist ("Before a tracked change is published") |
| 17 | **commit** | a signed-off chapter revision (one commit = one chapter's complete revision pass — see BL-24 book adaptation in Section 7) | Book convention; `roles/builder_EN.md:57` |
| 18 | **deploy / push to prod** | hand the manuscript to the publisher / upload to KDP / publish to a self-publishing platform — the point after which the book is visible to general readers and rollback is reputationally expensive | Analogous to article skin row #18; `roles/builder_EN.md:23` Key Rules 1 |
| 19 | **production** | published edition — the version readers actually buy or read. Cannot be retracted without cost (errata sheets, new editions, refunds). The analog of production-grade code | `roles/validator_EN.md` Key Rules 4 (analog to "revert = postmortem") |
| 20 | **smoke test** | first-chapter read-aloud + TOC scan + glossary sanity check + first-paragraph hook test — the minimal sanity check before committing to a full read | Analogous to article skin row #20; `roles/validator_EN.md` Key Rules 5 ("Stale output detection") |
| 21 | **interface / contract** | chapter-to-chapter hand-off / cold open / cliffhanger — the structured transition a reader encounters between one chapter and the next | `roles/analyst_EN.md:19` "chapter-to-chapter hand-off" |
| 22 | **scope creep is muda** | adding characters, subplots, or concepts not in the outline — even if they "feel right" in the moment | BL-11 applied to books; dominant M→XL inflation pattern |
| 23 | **blast radius** | a central metaphor change affects every chapter that references it — mandatory grep before commit | `roles/builder_EN.md:26` already cites "a chapter's central metaphor" as high-blast-radius |
| 24 | **glossary drift** | the book-specific manifestation of BL-29 phantom decoherence — same concept, different names or different meanings across chapters | BL-29 applied to books; see Example 1 in Section 6 |

**CRITICAL note (unification rule):** If a live book project exists with its own `config.md` (none in the repo today; this is the first book skin — v9 Phase 2.A), and that config contains a table that contradicts this skin's Role Focus Overrides (Section 3) or Verification Protocol (Section 4), **the project `config.md` table WINS** and the Builder (or any future agent) must escalate to META before proceeding. Skins are defaults; projects override.

---

## Modal B-formula (creative weights)

This skin pins `B_modality: creative`. The book Builder/Validator/Coherencer use the creative weights:

| Component | Weight | Rationale |
|---|---|---|
| F (Focus) | **0.20** | Background reading + reference-book scan matters, but a book can stand partly on its own authority — it does not need to scan a 160-article corpus before drafting Chapter 5. Lowest-tier gate, but not zero. |
| E (Alignment) | **0.30** | **Dominant (tied with 1-σ).** The book must deliver on the promise made in the outline / back-cover / preface. A chapter that "reads well" but does not deliver the promised content is a FAIL on E. First load-bearing component. |
| (1-σ) (Consistency) | **0.30** | **Dominant (tied with E).** Cross-chapter terminology, cross-chapter claims, and character/concept continuity are the dominant failure mode. A Ch.3 definition that contradicts Ch.7 is a σ failure that a reader will catch and a reviewer will punish. Second load-bearing component. |
| Λ (Experience) | **0.20** | Book project memory accumulates slowly (one book = one long project), so Λ is a facilitator, not a gate. But patterns learned in early chapters must transfer to later chapters within the same session. Matches F as a facilitator-tier component. |

**Rationale (from Phase 0.A Visionary Deliverable 1, confirmed via `eradev.md` Section II.1 line 118):** Non-fiction books in the target scope are primarily alignment-driven (deliver the promise) and consistency-driven (cross-chapter coherence), and only secondarily focus-driven or experience-driven. `B_creative` weights are PINNED — this is not a placeholder.

**Variant clauses (NOT for v9 implementation):**
- A **novel** or short-story collection is pure narrative — load-bearing property is voice + emotional arc. It would need its own `narrative` modality. Deferred to v10.
- A **free-verse poetry collection** lacks objective verification. Deferred to v10.
- A **pure personal memoir** with no factual-check obligation is closer to novel work; if the memoir has a factual backbone (dates, places, named people), R3 glossary consistency and R2 continuity still apply.
- A **reference book** (encyclopedia, dictionary, handbook) may want closer to `B_text` weights (lookup-table-style, no narrative arc). Such projects can override the skin via the project-level B-weight override mechanism documented in `templates/domain_skin.code.md` Section "B-weight Adjustment".

---

## Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` **unchanged**. The skin adds DOMAIN-SPECIFIC focus anchors, artifact definitions, failure modes, and Jidoka specializations.

### Visionary (book focus)

- **FIRST attention anchor (A_F override):** Read the proposed book's central claim / thesis and the target reader profile. Read the 3-chapter arc sketch (typically the first 3 chapters, or Ch.1 + middle + last). If the project has background reading — 1-3 reference books in the same genre — read their TOC (not full text) to confirm the proposed book isn't redundant. True North = *what change does this book make in the reader's thinking, and does a comparable book already make it?*
- **Artifact definition:** The book's central claim + its 3-chapter arc. Not the manuscript, not the PDF — the *argument the book makes over its full length*. At RT-0 Visionary speaks at the level of "this book argues X via structure Y for reader profile Z, adding to the genre by W."
- **Primary failure mode in book work:** Approving a book thesis that is already well-covered by existing books in the genre WITHOUT explicit differentiation. This is the **"genre collision"** failure (analog of the article skin's "corpus collision"). Mitigation: Visionary must enumerate at least 2 nearest-neighbor books in the genre before greenlighting the thesis and state what THIS book adds over each one.
- **Secondary failure mode:** Approving a thesis that is too big for a book — "explain everything about quantum mechanics in 300 pages." Books have reader-time budget (a non-fiction book = ~10-20 hours of reader commitment). A thesis that needs 30+ chapters to develop is OUT-OF-SCOPE or needs to be split into a series. Visionary must check thesis scale before RT-1.
- **Jidoka self-check (book specialization):**
  - Q1: "Is this book thesis differentiated from the 2-3 nearest existing books in the genre? If NO → identify differentiation or reject."
  - Q2: "Is the thesis falsifiable *in a reader-experience sense* — can a reader come away with a clearly wrong understanding of the book's claim? If the book is so vague that no reader can be 'wrong,' it FAILS OOD."
  - Q3: "Does the 3-chapter arc actually deliver the thesis, or does it meander? (This is the R6 'target reader coverage' check at the thesis level.)"
  - Q4: "Is the reader-time budget defensible — is the book ~8-20 hours of read, or is it trying to be 40 hours?"
- **Upstream reference:** `roles/visionary_EN.md:7` already names "a chapter of a book" as a canonical artifact example. The skin adds the *genre-collision check* and the *reader-time-budget check*, which are NOT in the base role file.

### Analyst (book focus)

- **FIRST attention anchor (A_F override):** Read the outline (parts → chapters → sections), the glossary of key terms (if the project has one; if not, DEMAND that the Builder produces one as a pre-condition — BL-29 enforcement for books), and the chapter-to-chapter dependency graph. Then read the target reader profile from Visionary. Do NOT proceed to decomposition until the outline-glossary-dependencies triad is complete.
- **Artifact definition:** A per-chapter decomposition table: each chapter has a list of *claims to establish*, a list of *terms it defines* (glossary additions), a list of *terms it depends on* (glossary references), a list of *prior-chapter facts it builds on*, and a *length budget* (target word count). The Analyst output is a **table**, not prose.
- **Primary failure mode in book work:** Skipping the dependency graph step — the Analyst produces a chapter-list but does not check that Ch.5 only depends on concepts introduced in Ch.1-4. If the Builder drafts Ch.5 first and it depends on a concept from Ch.7, the reader is blocked. This is the book-specific manifestation of BL-17 (Check-First = prevention).
- **Secondary failure mode:** Underestimating the glossary's importance — the Analyst produces an outline without a glossary, which means the Builder is free to invent synonyms for the same concept across chapters. This is a σ failure waiting to happen and the top Coherencer failure mode at RT-2.
- **Jidoka self-check (book specialization):**
  - Q1: "Has the outline-glossary-dependencies triad been read? If NO → A_F=0.0 → Andon."
  - Q2: "For each chapter, is the dependency edge to prior chapters explicit? If Ch.5 depends on Ch.3, does my plan say so?"
  - Q3: "For each chapter, is the length budget stated? A 50,000-word book with 10 chapters = ~5,000 words/chapter — is each chapter's budget in that range, or do I have a 20,000-word Ch.3 and a 1,000-word Ch.7?"
  - Q4: "Does the glossary cover every key term that appears in >1 chapter? Terms appearing in only 1 chapter don't need glossary entries."
  - Q5: "Is there a rolling-update strategy per Analyst Key Rule 6? The outline must NOT promise 'rewrite all chapters simultaneously' — it must promise a chapter-by-chapter sweep."
- **Deliverable template (book-specific):**
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

### Builder (book focus)

- **FIRST attention anchor (A_F override):** Read the Analyst plan verbatim (all parts → chapters → sections → dependencies → glossary). Read the style guide and 1-2 reference books in the same genre (not cover-to-cover — read the preface, the first chapter, and the back-matter; this is BL-21 "format-first" applied to books). Read previously drafted chapters in the same book if any exist (BL-29 — terminology consistency across chapters). Do NOT start drafting prose until all three reads are complete.
- **Artifact definition:** One chapter at a time, drafted in full as a single addressable unit. The Builder does NOT draft multiple chapters in parallel unless the Analyst plan explicitly assigns chapters to separate Builder instances (L/XL exception below). Within a chapter, the draft MUST cover the full length budget; a 1,000-word draft of a 5,000-word chapter is WIP, not a commit.
- **Primary failure mode in book work:** Drafting a chapter without verifying backwards-consistency with prior chapters — the Builder drafts Ch.5 and inadvertently uses a term in a way that contradicts Ch.3, or references a fact that Ch.3 introduced with a different value. Mitigation: Builder's Activation Operator (A_σ) requires a **backwards-consistency scan** — grep prior chapters for every key term and every numerical value the new chapter uses.
- **Secondary failure mode:** Outline drift — the drafted chapter doesn't deliver what the outline promised. Example: outline says Ch.5 covers "technique A with case study B"; Builder drafts Ch.5 with technique A only, case study B dropped. This is an E failure (alignment to the plan). Mitigation: Builder's Jidoka must verify each drafted chapter against the outline's promise for that chapter before committing.
- **Third failure mode (book-specific, not in base role file):** Length-budget drift — the Builder drafts a chapter 2-3× over the budget because "there's so much to say." This breaks the reader-time budget and forces a painful revision pass. Mitigation: Builder's Jidoka must confirm the draft is within ±20% of the length budget before committing.
- **Fourth failure mode (book-specific):** Glossary drift WITHIN a single Builder session — the Builder uses "agent" in Ch.3 to mean "LLM subprocess" and in Ch.7 to mean "autonomous decision-maker" because the session grew across days and the Builder forgot the earlier definition. Mitigation: Builder must re-read the glossary at the start of each chapter-drafting session (BL-29 enforcement; see Example 1 in Section 6).
- **Jidoka self-check (book specialization):**
  - Q1: "Have I read the Analyst plan + style guide + 1-2 reference books in the same genre? (F)"
  - Q2: "Does this chapter deliver what the outline promised — all claims, all case studies, all glossary additions? (E)"
  - Q3: "Did I grep prior chapters for every key term this chapter uses and confirm consistent meaning? (1-σ)"
  - Q4: "Is the draft length within ±20% of the budget? (E + Λ — reader-time budget)"
  - Q5: "Did I re-read the glossary at the start of this session and use every glossary term with the canonical meaning? (Λ)"
  - Q6: "For bilingual books (project opt-in): did I also draft the equivalent chapter in the paired language? (Λ per BL-19 conditional)"

### Validator (book focus)

- **FIRST attention anchor (A_F override):** Read the full drafted manuscript (or all drafted chapters so far if not yet complete) and the Analyst outline + glossary. Do NOT partially validate — Validator reads the whole thing, because **continuity failures are cross-chapter by nature**. Then read the 6 R-checks from Section 4 below. Validator owns the final gate for all R-checks.
- **Artifact definition:** The full manuscript in final form — the same thing an editor would see at developmental-edit time, or a beta reader would see at first-read time. Validator simulates the reviewer at the highest-stakes moment.
- **Primary failure mode in book work:** Checking only per-chapter properties and missing cross-chapter continuity — Validator runs R1 (readability) per chapter, R3 (glossary consistency) per chapter, and declares PASS while a reader flipping from Ch.3 to Ch.7 would immediately notice that the definition of "agent" drifts. Mitigation: Validator MUST run R2 (structural continuity) and R3 (glossary consistency) as **manuscript-wide sweeps**, not per-chapter.
- **Secondary failure mode:** Trusting the compiled PDF — the Validator looks at the PDF, it "looks like a book," so Validator stamps PASS. But R1 (Flesch) is a numerical check that requires running the metric, not visual inspection. R4 (outline-to-draft fidelity) requires reading the outline and cross-checking each chapter. Mitigation: each R-check has a concrete command or concrete reading protocol; Validator MUST produce the numeric output or the reading-protocol evidence.
- **Tertiary failure mode (book-specific):** Missing length-budget violations — the outline says Ch.5 is 5,000 words; the draft is 12,000 words. Validator does not catch this because "the chapter reads well." But it breaks the reader-time budget and unbalances the book. Mitigation: Validator runs a length-ledger check (R4 sub-check — each chapter against its budget).
- **Jidoka self-check (book specialization):**
  - Q1: "Have I run all 6 R-checks (R1-R6), not just the 'reads well' gut check?"
  - Q2: "For R1 (readability), do I have a numeric Flesch score per chapter AND a whole-book Flesch variance?"
  - Q3: "For R2 (continuity), did I perform a cross-chapter contradiction scan — for each claim made in Ch.N, did I confirm Ch.>N does not contradict it?"
  - Q4: "For R3 (glossary), did I extract every technical term used in >1 chapter and confirm it's used with the canonical meaning in every chapter?"
  - Q5: "For R4 (outline fidelity), did I cross-check every chapter against the outline's promise for that chapter AND check the length ledger?"
  - Q6: "For R6 (target reader coverage), did I ask for each chapter: 'does this chapter serve the target reader declared in the outline?' If a chapter is aimed at a different reader profile, I FAIL."
  - Q7 (conditional on bilingual): "For projects declaring `domain.bilingual: true`, did I validate BOTH language versions (not just one)?"

### Coherencer (book focus)

- **FIRST attention anchor (A_F override):** Read the full drafted manuscript plus the glossary. Read the outline. Read any previously published books in the same series (if this is book N in a series — cross-book continuity is the highest level of coherence work and only applies to series). Coherencer cares about *the manuscript's internal coherence as a single artifact*.
- **Artifact definition:** The book as a coherent whole — every chapter in relation to every other chapter. Coherencer at RT-2 is the role that catches "Ch.3 and Ch.7 contradict on a term" BEFORE Validator runs the R-checks, so Validator's R-check failures are clean signals and not pile-ons.
- **Primary failure mode in book work:** **Glossary drift** — a key term (e.g., "agent", "consciousness", "observer", "system") is used with different meanings in different chapters. This is BL-29 phantom decoherence applied to books. See Example 1 in Section 6.
- **Secondary failure mode:** Cross-chapter reference invalidation — Ch.7 says "as we established in Ch.3, X is Y" but Ch.3 actually says X is Z. The reference is stale because one of the chapters was revised without the other.
- **Tertiary failure mode (book-specific):** Phantom coherence within a manuscript — all chapters AGREE with each other because they were generated in the same session, but they all introduce the same error. This is BL-5 applied to books. Mitigation: Coherencer must perform at least one **independent spot-check** — pick a claim that appears in 2+ chapters and independently verify it, rather than trusting that agreement across chapters means correctness.
- **Jidoka self-check (book specialization):**
  - Q1: "Does the manuscript use every glossary term exactly as the glossary defines it, in every chapter? (BL-29)"
  - Q2: "Are there any cross-chapter references ('as established in Ch.N') that are now stale because Ch.N was revised?"
  - Q3: "Are there any silent symbol collisions — same word, two meanings — that Ch.1 reader would miss until Ch.7?"
  - Q4: "Are RU and EN versions (if bilingual) structurally parallel — same chapter count, same glossary count, same word count within ±10%? (BL-19 conditional)"
  - Q5: "Independent spot-check: pick 2 claims that appear in ≥2 chapters. Verify them independently of the manuscript text. Do my findings match the manuscript's claims?"
- **Yokoten rule for books (BL-13 + BL-32 applied):** When a glossary term is updated (e.g., "agent" is renamed or redefined), Coherencer MUST grep the entire manuscript for every occurrence of the OLD term and update each one in the SAME revision pass. A split update (Ch.3 updated, Ch.5 forgotten) is a BL-32 violation.
- **Bilingual sync rule (BL-19 conditional):** If the project declares `domain.bilingual: true`, Coherencer becomes the ENFORCER of the paired-language rule. Commit is BLOCKED if the paired-language version of a new chapter is missing. Commit is BLOCKED if chapter word counts between paired languages diverge by >50% (suggests one version is incomplete). If the project does NOT declare `domain.bilingual: true`, this rule is INACTIVE — not a violation (BL-19's own text says "when a file has a bilingual counterpart").

---

## Verification Protocol (readability + structural coherence, expanded)

This section maps directly to `domain.verify.method: readability (primary) + structural coherence (secondary)`. The skin expands this into **6 concrete sub-checks (R1-R6)** split across Validator L1 (per-chapter / per-draft) and L2 (manuscript-wide / pre-submission).

### The six R-checks

| # | Check | Who runs it | L1 or L2 | Enforcement mechanism |
|---|---|---|---|---|
| **R1** | **Readability (Flesch-Kincaid)** — compute Flesch reading ease AND Flesch-Kincaid grade level per chapter; the whole-book average must be within the target band declared in `config.md`; per-chapter variance must not drop/spike >4 grade levels from the book average | Validator | **L1 per chapter + L2 whole-book** | Automated metric (e.g., `python -c "from textstat import flesch_reading_ease, flesch_kincaid_grade; ..."` or equivalent). The specific metric is project-declared; Flesch is the default for EN. For RU-language books, project MUST declare an RU-appropriate readability metric in `config.md` (e.g., Indeks chitaemosti by Oborneva). |
| **R2** | **Structural continuity** — every chapter references or builds on prior chapters without contradiction; every claim made in a prior chapter remains valid in all subsequent chapters; cross-chapter references ("as we saw in Ch.3") resolve to real content in the referenced chapter | Coherencer + Validator | **L2 only** (per-chapter cannot catch cross-chapter contradictions) | Semi-automated: grep prior chapters for claims + manual cross-check |
| **R3** | **Glossary consistency** — every key term is used with the same meaning across all chapters; glossary entries match usage; no shadow-synonyms (different words for the same concept) unless intentional stylistic variation is allowed by the style guide | Coherencer | **L2** | Semi-automated: extract glossary terms + grep every chapter + compare to canonical definition |
| **R4** | **Outline-to-draft fidelity + length budget** — each drafted chapter delivers what the outline promised for that chapter (all claims, all case studies, all sub-sections); each chapter's length is within ±20% of the target length budget; the chapter order matches the outline's order | Validator | **L1 per chapter + L2 for the full length ledger** | Semi-automated: outline parse + per-chapter checklist + word-count command |
| **R5** | **Citation density (CONDITIONAL — applies only if book has a bibliography)** — if `config.md` declares the book has a bibliography, check: every cited claim has a matching bibliography entry (analog of article C1), every DOI/ISBN is syntactically valid (analog of C3), citation density is within the genre norm declared in `config.md`. If the book has NO bibliography, R5 is SKIPPED — record `R5: N/A (no bibliography)`. | Validator | **L1 for syntactic checks, L2 for density** | Mechanical (grep-based for syntax) + manual (density interpretation) |
| **R6** | **Target reader coverage** — does each chapter serve the target reader declared in the outline? A chapter that drifts to a different reader profile (too technical, too simple, wrong assumed background) is a FAIL. | Visionary + Validator | **L2** (requires reading the chapter with the reader profile in mind — judgment call, informed by Flesch grade from R1) | Human judgment, informed by Flesch grade (R1) as a quantitative anchor |

### Relationship between the R-checks

**R1-R4 are the core 4** — every book project runs these. **R5 is CONDITIONAL** on the presence of a bibliography (declared in `config.md` via `domain.has_bibliography: true|false` or equivalent). **R6 is judgment** and requires the target-reader profile to have been declared in the outline (Analyst sub-section 3.2 Deliverable).

Unlike the article skin's 6 cite_checks, the book R-checks are NOT a subset of an existing 8-check list. The book skin defines R1-R6 from scratch, because books do not have the structured 7+1 check list that ODTOE articles have. A future book project MAY declare its own extended check list in its `config.md`; if so, the skin's R1-R6 are the DEFAULT and the project-specific list is a SUPERSET. Per the Vocabulary section's unification rule, the project `config.md` wins when in conflict with the skin.

### Verification block

```
[method name]: readability (primary) + structural coherence (secondary)
[command]: Per-chapter readability: `python -m textstat <chapter.md>` or equivalent.
          Whole-manuscript compile: `pandoc book.md -o book.pdf` (or project-specific
          toolchain — LaTeX via `tectonic book.tex`, Vivliostyle via `vivliostyle
          book.yml`, etc.). Structural continuity check: Coherencer's cross-chapter
          grep + manual review. Full protocol: the 6 R-checks (R1-R6) above.
[success criteria]: R1 PASS (per-chapter and whole-book Flesch within target band),
                    R2 PASS (no unresolved cross-chapter contradictions or stale refs),
                    R3 PASS (all glossary terms used consistently across all chapters),
                    R4 PASS (all chapters deliver on outline + within length budget),
                    R5 PASS (or N/A) (bibliography sanity if applicable),
                    R6 PASS (each chapter serves the declared target reader),
                    AND the manuscript compiles cleanly to PDF/EPUB.
                    For bilingual projects: all checks pass for BOTH language versions.
[failure recovery]: R1 fail → simplify chapter vocabulary/sentence length OR update
                    target reader (re-scope via Visionary);
                    R2 fail → resolve the contradiction: revise the older chapter,
                    the newer chapter, or both — Coherencer decides which is
                    load-bearing;
                    R3 fail → unify glossary: pick one meaning per term, update
                    every chapter that uses the divergent meaning, re-run R3;
                    R4 fail → either redraft the chapter to match the outline,
                    or update the outline to match reality (triggers BL-11 review
                    and a new Analyst plan gate — see Example 2 option b);
                    R5 fail → add missing bibliography entry, correct DOI/ISBN,
                    or remove the dangling in-text cite;
                    R6 fail → redraft chapter at correct reader level, OR reassign
                    chapter to a different target reader AND flag for Visionary
                    re-scope.
[independence check]: Coherencer performs an INDEPENDENT cross-chapter spot-check
                      — pick 2-3 claims that appear in multiple chapters, verify
                      them independently of the manuscript's own computations
                      (e.g., if the book says "according to the Flesch scale,
                      'easy' means 80-90", the Coherencer independently confirms
                      this against a standard reference). Phantom coherence
                      detection (BL-5) applied to books: if Builder and Validator
                      agree on a claim's value in Ch.3 and Ch.7 but neither
                      verified independently, flag PHANTOM. Sample size: 2 claims
                      per 50,000 words of manuscript minimum, 5 claims per
                      100,000+ words of manuscript.
```

### Length ledger (sub-protocol of R4)

Because length-budget drift is a dominant book-specific failure mode (see Builder 3.3 third failure mode), the skin includes a length ledger format that Builder produces and Validator verifies:

```
| Chapter | Outline target (words) | Draft actual (words) | Delta (±%) | Status |
|---------|------------------------|----------------------|------------|--------|
| Ch.1    | 5,000                  | 4,850                | −3%        | PASS   |
| Ch.2    | 6,000                  | 7,800                | +30%       | FAIL   |
| ...     | ...                    | ...                  | ...        | ...    |
| Total   | 80,000                 | ?                    | ?          | ?      |
```

**Pass thresholds:** A Chapter Ch.N is FAIL on R4 length sub-check if its delta is outside ±20%. A manuscript is FAIL on the whole-book length ledger if >20% of chapters are outside their individual budget OR if the total is >15% outside the whole-book budget.

---

## RT Phase Protocol for Books

Code projects use the canonical phase protocol from `eradev.md` Section VI. Articles use the 3-RT protocol from `templates/domain_skin.article.md` (RT-0 optional, RT-1 mandatory, RT-2 mandatory). **Books are L/XL by default**, and the RT protocol reflects that.

### Four RT invocation points for books

1. **RT-0 (Visionary solo, STRONGLY RECOMMENDED for books): thesis / genre-collision / reader-time-budget check.** Before any RT-1. Runs when the operator proposes a new book. Visionary alone evaluates: is this thesis new enough, is the reader-time budget realistic, is the target reader profile stable? A YES from Visionary unlocks RT-1. Output is a single-paragraph decision with reader-time budget stated:
   - "APPROVED: thesis adds to the genre over books A and B by offering Z; reader-time budget ~12 hours; target reader = {profile}; proceed to RT-1."
   - OR "REJECTED: thesis overlaps too heavily with book N; propose a differentiating angle."
   - OR "OUT-OF-SCOPE: thesis is too big (30+ chapter budget) — split into a series, or defer to a future book."

2. **RT-1 (mandatory, full 5-role): outline + chapter-by-chapter plan + glossary + dependencies.** Before any chapter drafting. Produces the Analyst deliverable template (Analyst sub-section above). Builder does NOT start writing chapters until RT-1 approves a plan AND a glossary. **The outline and glossary are the two load-bearing artifacts of RT-1** — an RT-1 pass without a glossary is an incomplete pass, even if every other element is present.

3. **RT-per-chapter-cluster (MANDATORY for L/XL, OPTIONAL for M): chapter drafting.** Because books are L/XL by default, drafting is chapter-by-chapter or cluster-by-cluster (e.g., "draft Part I = Ch.1-3 as one cluster"). For each cluster: Builder drafts → Validator runs R1+R4 (per-chapter checks) → Coherencer runs R2+R3 (cross-chapter sentinels, checking the new cluster against prior clusters). A FAIL blocks the next cluster. This is the book-specific analog of the article skin's "section-by-section loop" but scaled to cluster-level because each chapter is bigger than a whole article.

4. **RT-2 (mandatory, pre-submission/pre-publish): full manuscript gate.** Before the manuscript is submitted to a publisher / uploaded for self-publish / sent to an editor for developmental edit. Runs all 6 R-checks on the full manuscript + BL-19 paired-language check if bilingual.

Four RT invocation points IS more than the article skin's three. This is by design — books need the chapter-cluster sentinel because the manuscript grows over weeks/months and drift compounds. Skipping the RT-per-chapter-cluster is NOT a "simplification" — it's a direct loss of Coherencer's cross-chapter signal in the period when that signal is still cheap to act on.

### Builder configuration — single, cluster, or split?

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
  9. Commit Chapter C as one commit (BL-24 book adaptation — one commit = one chapter revision pass)
  10. Move to Chapter C+1

**L/XL exception (splitting Builder across chapters):** For an XL book (>120,000 words, >15 chapters), the Analyst plan MAY split work across 2-3 Builders by chapter ownership (Builder A owns Ch.1-6, Builder B owns Ch.7-12, Builder C owns Ch.13-18). File Ownership rule from `roles/analyst_EN.md` Responsibilities 4 applies. **Coherencer gate is MANDATORY between each Builder's completion and the Validator start** — because parallel Builders will drift on terminology unless Coherencer forces a glossary-unification pass between handoffs.

**Rationale for NOT splitting outliner+drafter at chapter level (applies to M-scale books):** Outline + draft live in the same mental model of the book's argument. Splitting them into two agents (outliner agent + drafter agent) at the per-chapter level would cause the drafter to lose the context the outliner had. This is consistent with the v9 principle that role is a focus, not a specialization.

**Exception — outline-first RT-1:** Unlike per-chapter drafting, the **outline itself** IS produced by the Analyst in RT-1, not by the Builder. The Builder takes the outline as a given and drafts chapters against it. If the Builder finds the outline is wrong DURING drafting, the Builder MUST invoke BL-11 (scope creep is muda) — log the outline issue as a SEPARATE task and return to drafting within the existing outline. Revising the outline mid-draft is a failure mode, not a feature.

### Why RT-0 is STRONGLY RECOMMENDED for books

Books need a pre-RT Visionary pass because:

- The thesis must be stable before the Analyst spends time on an outline + glossary + dependency graph. A wobbling thesis forces the Analyst to redo the full decomposition.
- Genre-collision risk is real — there are millions of published non-fiction books; approving a thesis without at least a cursory genre scan is BL-29 violation.
- Reader-time budget check — a book is 10-20 hours of reader commitment. A thesis that is too big or too small for a book must be reframed BEFORE RT-1 wastes effort on outlines.
- OOD check — the task description might say "book" but actually be "novel" or "poetry collection" or "pure memoir." Visionary catches this at RT-0.

### Pipeline block

```
Book pipeline (default, M-scale, mono-lingual):
RT-0 (Visionary solo, STRONGLY RECOMMENDED) → thesis + genre-collision + reader-time budget approval
RT-1 (full 5-role, mandatory) → outline + chapter-by-chapter plan + glossary + dependency DAG
Builder loop per chapter (in dependency order):
  re-read plan → re-read glossary → grep prior chapters → draft to budget → R1 self-check →
  R4 self-check → commit chapter → Coherencer spot-review → next chapter
RT-per-cluster (mandatory for L/XL, optional for M) → R1+R2+R3+R4 sentinel on new cluster + prior chapters
RT-2 (full 5-role, mandatory) → all 6 R-checks on full manuscript + (if bilingual) BL-19 paired-language check
Commit final manuscript (all chapters together OR per-chapter, per project config)
Submission / publisher / self-publish → outside EraDev scope (manual operator action)

Book pipeline (XL or >120,000 words):
Same as above, but RT-1 produces a Builder split plan (2-3 Builders by chapter ownership)
AND mandatory Coherencer gates between each Builder's completion and Validator.

Book pipeline (bilingual, `domain.bilingual: true`):
Same as default BUT: within each Builder chapter loop, draft chapter in language A,
then draft chapter in language B BEFORE moving to the next chapter (BL-19 conditional enforcement).
RT-2 runs all 6 R-checks on BOTH language versions.
```

---

## Checklists

### Pre-Generation Checklist (Check-First, BL-17, BL-21, BL-29)

Run BEFORE any chapter drafting begins.

- [ ] **1. OUTLINE:** Read the full book outline (parts → chapters → sections)
- [ ] **2. GLOSSARY:** Read the full glossary. If no glossary exists, STOP and DEMAND one from Analyst.
- [ ] **3. CHAPTER DEPENDENCIES:** Confirm the chapter dependency DAG is explicit; identify which chapter to draft next (in dependency order, not file order).
- [ ] **4. TARGET READER:** Re-read the target reader profile from the outline.
- [ ] **5. STYLE GUIDE:** Read the project's style guide + 1-2 reference books in the same genre (TOC + first chapter, not cover-to-cover).
- [ ] **6. LENGTH BUDGET:** Confirm the length budget for the chapter to be drafted.
- [ ] **7. BACKWARD SCAN:** For every key term the new chapter will use, grep prior chapters for that term and confirm consistent meaning (BL-29 enforcement).
- [ ] **8. BIBLIOGRAPHY (CONDITIONAL):** If the book has a bibliography, confirm BL-B4 PRE-FLIGHT has run; unverified references BLOCK drafting.
- [ ] **9. BILINGUAL (CONDITIONAL):** If `domain.bilingual: true`, confirm the paired-language toolchain and style guide are ready.

### Post-Generation Checklist (Jidoka gate, BL-B2 enforcement)

Run AFTER Builder completes a chapter draft, BEFORE committing.

- [ ] **1. R1 SELF-CHECK:** Run Flesch-Kincaid on the chapter. Confirm within target band declared in `config.md`.
- [ ] **2. LENGTH LEDGER:** Word count within ±20% of budget.
- [ ] **3. R4 SELF-CHECK:** Chapter delivers every claim the outline promised for it.
- [ ] **4. GLOSSARY USAGE:** Every glossary term used in the chapter matches the canonical definition.
- [ ] **5. COMPILE:** If the book has a compile step (pandoc, LaTeX, Vivliostyle, etc.), the chapter compiles cleanly in isolation.
- [ ] **6. CROSS-CHAPTER REFERENCES:** Any "as we saw in Ch.N" references resolve to real content in Ch.N.
- [ ] **7. BILINGUAL PAIR (CONDITIONAL):** If `domain.bilingual: true`, paired-language version of this chapter also drafted and passed its own checklist.

---

## Examples (3 concrete)

### Example 1: Glossary drift across chapters (Coherencer R3 failure, caught at RT-2)

- **Input:** "Draft a 10-chapter non-fiction book on multi-agent AI systems, target audience = technical readers with ML background. Outline specifies 'agent' as one of the 5 core terms in the glossary."
- **Scenario:** Analyst produces the outline + glossary. Glossary defines "agent" as "an LLM-based subprocess with its own context window, spawned by an orchestrator." Builder drafts Ch.1-10 over the course of a long session. In Ch.3, "agent" is used consistently with the glossary ("each orchestrator spawns several agents to handle sub-tasks"). In Ch.7, however, Builder writes about "the agent's autonomous goal-setting behavior" — a passage that reads naturally but implicitly uses "agent" in a different sense (an autonomous human-like decision-maker, closer to reinforcement-learning terminology). Validator runs R1 (readability) per chapter — PASS. Builder commits the manuscript.
- **What Coherencer finds:** At RT-2, Coherencer runs R3 (glossary consistency) as a manuscript-wide sweep. Coherencer extracts every occurrence of "agent" across all 10 chapters and tags each with its implicit meaning. Ch.1-6 + Ch.8-10 use "agent" in the glossary sense (LLM subprocess). Ch.7 uses it in the RL sense. A reader flipping between Ch.3 and Ch.7 would hit silent cognitive dissonance — same word, two meanings.
- **Catching role:** **Coherencer** (this is the canonical book Coherencer failure-mode — glossary drift across chapters).
- **Phase:** **RT-2** (manuscript-wide sweep is the first place where cross-chapter drift is catchable; per-chapter R1 and R4 checks don't see it because each chapter is internally consistent).
- **Fix:** Coherencer invokes a glossary unification pass. Either (a) revise Ch.7 to use "agent" in the glossary sense and introduce a DIFFERENT term for the RL concept (e.g., "autonomous learner"), update the glossary to add the new term, then re-run R3; or (b) update the glossary itself to make "agent" polysemous with two explicit senses, add a note in Ch.7 ("in this chapter, 'agent' is used in the RL sense; see glossary entry 2"), and re-run R3. Coherencer's Yokoten rule applies: after the fix, grep ALL chapters for "agent" one more time to catch any other silent drift.
- **Why per-chapter checks alone would miss this:** R1 (Flesch) is chapter-local. R4 (outline fidelity) is chapter-local. R6 (target reader) is chapter-local. Only R2 (continuity) and R3 (glossary consistency) are cross-chapter, and only at Validator's L2 or Coherencer's manuscript-wide sweep. This is why books need the RT-per-cluster sentinel — catching glossary drift at cluster-level is cheaper than catching it at RT-2 on the full manuscript.

### Example 2: Outline-to-draft divergence (Validator R4 failure, caught at RT-per-cluster)

- **Input:** "Draft Chapter 5 of the book. Outline says Ch.5 covers: (a) algorithm X, (b) the proof-of-correctness sketch for X, (c) case study B applying X to problem Y, with a target length of 5,500 words."
- **Scenario:** Builder drafts Ch.5. The draft covers algorithm X (1,800 words) and the proof sketch (2,200 words) but the case study B is replaced with "a worked example" that applies algorithm X to a different problem Z (1,400 words). Draft total: 5,400 words — within the length budget. Builder self-runs R1 (Flesch) — PASS. Builder commits Ch.5.
- **What Validator finds:** At RT-per-cluster, Validator runs R4 (outline fidelity). Validator cross-checks the Ch.5 outline promise (algorithm X, proof sketch, case study B with problem Y) against the actual draft. The first two match; the third does not — case study B is missing, replaced with a different example on problem Z. The reader expected problem Y (maybe because they bought the book BECAUSE the back-matter promised it); instead they get problem Z. This is an E failure (alignment to plan/promise).
- **Catching role:** **Validator** (R4 is L1 per-chapter with L2 rollup — but Validator MUST read the outline first, not just the draft).
- **Phase:** **RT-per-cluster** (checkpoint after Builder drafts Ch.5, before Ch.6 starts). Catching at RT-per-cluster is cheaper than catching at RT-2 because only Ch.5 needs revision; at RT-2 the Builder might have already drafted Ch.6-10 on the assumption that Ch.5 established problem Z as the running example.
- **Fix:** Two options, requiring Visionary arbitration:
  (a) **Redraft Ch.5** to actually cover case study B with problem Y, as the outline promised. This is the default — the outline is the promise and the draft must deliver.
  (b) **Update the outline** to officially change Ch.5's case study from problem Y to problem Z, AND cascade-check every downstream chapter to see if any of them references "problem Y as covered in Ch.5" (grep-based). If downstream references exist, they must also be updated. This is a scope-creep option and triggers BL-11 review — the Analyst plan changes, Visionary must approve the new outline, and Coherencer must verify cross-chapter consistency post-update.
- **Why this is a book-specific failure (not an article failure):** In a single article, outline drift affects at most one section. In a book, outline drift in Ch.5 potentially affects Ch.6, Ch.7, and every chapter that references Ch.5's material. The downstream blast radius is why R4 is an L1+L2 check and why the RT-per-cluster sentinel is mandatory for L/XL books.

### Example 3: Flesch grade drift between chapters (Validator R1 failure, readability variance)

- **Input:** "Draft a popular-science book on quantum computing, target audience = intelligent lay readers with high school physics background. Outline declares target Flesch-Kincaid grade level = 9-10 (ninth-grade reader)."
- **Scenario:** Builder drafts all 10 chapters over several sessions. Ch.1 is an accessible introduction — Flesch-Kincaid grade ~8. Ch.2-5 cover the foundations — grade ~9-10 (on target). Ch.6 introduces superposition — grade ~12 (slightly harder). Ch.7 introduces entanglement — grade ~14 (college sophomore). Ch.8-10 continue at grade ~13-14 because "the concepts are inherently hard." Builder runs R1 per chapter and logs the numbers but does not flag the variance. Builder commits the manuscript.
- **What Validator finds:** At RT-2, Validator runs R1 (Flesch-Kincaid) on the whole manuscript AND per chapter. Per-chapter results: Ch.1 = 8, Ch.2-5 = 9-10, Ch.6 = 12, Ch.7-10 = 13-14. Whole-book average = 11.2. Target was 9-10. **Validator FAILS the book on R1** because: (a) the whole-book average drifted 1-2 grades above target, (b) Ch.7 alone is 4 grades above target — that's a massive readability drop mid-book, (c) the Ch.1-to-Ch.7 variance spans 6 grade levels, which means a reader who could follow Ch.1 will be lost in Ch.7. The book is NOT serving the declared target reader (R6 also FAIL as a consequence).
- **Catching role:** **Validator** (R1 per-chapter numeric check is automatable; R1 whole-book variance analysis is the L2 judgment step; R6 target-reader inference requires cross-reference to the outline's target-reader declaration).
- **Phase:** **RT-2** (pre-submission full gate). In a disciplined project, this SHOULD have been caught at RT-per-cluster when Ch.7's draft was committed — but the example assumes Ch.7 cluster-check was skipped, so RT-2 is the catch point.
- **Fix:** Three options:
  (a) **Simplify Ch.6-10** — Builder revises Ch.6-10 to bring Flesch grade down to target 9-10. This may require shorter sentences, simpler words, more analogies, more pre-building of concepts. Cost: redrafting ~50% of the book. This is the default option and is the most respectful of the original target reader.
  (b) **Re-target the reader** — Visionary re-scopes the book to a more advanced target reader (e.g., "college-educated technical readers with some physics"), updates the outline's target-reader declaration, and accepts the current Flesch variance as intentional. Cost: the book is now a different book and any back-matter/marketing/reader-promise must be updated. Triggers a BL-11 scope-creep review.
  (c) **Split the book into two books** — one for lay readers covering Ch.1-5, one for advanced readers covering Ch.6-10 + additional material. Cost: biggest, requires full replanning; but it acknowledges the book was actually two different books in one manuscript. Triggers full RT-0 + RT-1 restart for each new book.
- **Why per-chapter R1 alone is insufficient:** Each chapter's R1 number is within one standard deviation of "reasonable for that concept" — but the problem is the VARIANCE, which only appears when R1 is run across all chapters and compared. This is why R1 is explicitly L1 per-chapter + L2 whole-book in the R-check table above.

---

## Domain-Specific Bootstrap Lessons

The book skin inherits all 22 universal BL from `BOOTSTRAP_LESSONS_universal.md` **unchanged**, handles each of the 8 code-adapter BL individually (2 transfer unchanged, 4 have book equivalents BL-B1..B4, 2 are N/A), and adds 4 book-specific BL in the BL-B namespace that does NOT count against the main 30-BL budget.

### Universal BL inherited (22 entries — all unchanged, 1-line applicability note each)

| BL | Title | Applicability to book work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Applies unchanged — a fresh book project starts with Λ=0.5; accumulates as chapters land in the corpus |
| BL-4 | S_adjusted = S_team × B_mean | Applies unchanged — Coherencer at RT-2 computes S_adjusted from the 5 role B scores |
| BL-5 | Phantom Coherence Detection | Applies unchanged — book-specific manifestation is "all chapters agree because they were drafted in the same session but all introduce the same error"; mitigation is independent spot-check (see Coherencer tertiary failure mode) |
| BL-7 | EN for Practical Tasks, RU for Theoretical Depth | Applies unchanged — book drafting is practical (EN role files); deep argument-structure reflection may use RU role files. For RU or EN mono-lingual books, draft in the book's language using the corresponding role file variant |
| BL-9 | Interface Contracts Between Roles | Applies unchanged — Analyst→Builder contract is the per-chapter claims table + glossary; Builder→Validator contract is the full drafted chapter + R1 self-check + length ledger entry; Validator→Coherencer contract is the R-check results |
| BL-10 | Multiplicative B Structure | Applies unchanged — weights are `creative` profile (F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20) per `eradev.md` Section II.1 line 118 |
| BL-11 | Scope Creep is Muda | **Critical for books** — a book is the artifact where scope creep is most tempting ("I have so much more to say about X"). Any mid-draft outline change is scope creep unless Visionary re-approves. See Example 2's "option (b)" trigger |
| BL-12 | Hansei Targets Process, Not People | Applies unchanged — post-submission Hansei on a book is about why the R-checks missed X, not which Builder wrote X |
| BL-13 | Yokoten — One Lesson, All Analogous Cases | **Critical for books** — BL-13's own text names "book: voice/metaphor scan across chapters" as a direct analog. A fix in Ch.3 must propagate to all chapters with the same pattern |
| BL-15 | 2% Spiral Gap | Applies unchanged — a book always ships with some open questions; those become the second edition or the next book in the series |
| BL-16 | Reading the Framework ≠ Applying It | Applies unchanged — META must delegate book work to agents, not draft chapters directly |
| BL-17 | Pre-Generate Verification = Prevention | **Critical for books** — the Pre-Generation Checklist above is the book-specific implementation of BL-17 ("read the outline + glossary + style guide BEFORE drafting a chapter") |
| BL-18 | Scope Reclassification at 2× Estimate | Applies unchanged — a 10-chapter book that grows to 20 chapters must be reclassified from L to XL and trigger a new RT-0 on scope |
| BL-19 | Bilingual Files Simultaneous | **CONDITIONAL for books** — applies ONLY if `config.md` declares `domain.bilingual: true`. Mono-lingual books skip this. The skin documents the conditional nature and does NOT impose an unconditional paired-file rule like the article skin does |
| BL-20 | Adversarially Test Bootstrap | Applies unchanged — the book skin file itself should be tested against a trial book project before wide deployment |
| BL-21 | Format Specifications Are Inputs | **Critical for books** — read the style guide + 1-2 reference books in the genre BEFORE drafting Ch.1. Books have stronger format-drift risk than articles because the format is typically defined by genre convention, not an explicit template |
| BL-26 | META Always Delegates | Applies unchanged — META never drafts book prose directly |
| BL-28 | Agent Prompt Must Include Explicit Context | Applies unchanged — book-task agent prompts must name the skin file path AND role file path; additionally, prompts must name the outline path and glossary path because those are the Analyst deliverables the Builder reads |
| BL-29 | Verify Established Terminology Before Generating | **Critical for books** — the Builder MUST re-read the glossary at the start of each chapter-drafting session. This is the dominant book Builder failure mode — glossary drift within a single long Builder session. See Example 1 |
| BL-30 | Defense-In-Depth | Applies unchanged — book validation has layers: Builder Jidoka (R1 self-check) + Coherencer spot-review (R3 per cluster) + Validator R1-R6 at RT-2 |
| BL-31 | Constrain Output Types | Applies unchanged — Builder's output is one chapter (or a cluster of chapters) + length ledger entry + R1 self-check, not free-form prose explanations |
| BL-32 | Grep After BL Merge | Applies unchanged — if a glossary term is updated, grep every chapter for the old term and update each occurrence. Same discipline as "grep for merged BL references" |

### Code-adapter BL handled individually (8 entries)

| BL | Title | Verdict for books | Notes |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | **Book equivalent: BL-B1** | Publication changes (e.g., releasing an ARC = Advance Reader Copy) are release events. See BL-B1 below. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Applies unchanged** | Book equivalent: "3+ consecutive revisions of the same chapter = STOP, re-spec the chapter via Analyst." Transfers cleanly; no new BL-B needed. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | **Book equivalent: BL-B2** | Before committing a chapter, Builder must run R1 (Flesch) + length-budget check + glossary pre-read. See BL-B2. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **N/A for books** | Books have no feature flags. "Feature toggle" analog = adding or removing a chapter, which is an outline change and already covered by BL-11 scope creep. |
| **BL-14** | Rollback Plan Before Deploy | **Book equivalent: BL-B3** | Before submitting the manuscript to a publisher OR uploading to a self-publish platform, Builder must document the erratum/retraction plan. See BL-B3. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Book equivalent: BL-B4 (CONDITIONAL)** | Applies if the book has a bibliography. Before RT-1 begins, Analyst must verify that every bibliographic reference exists and at least one key fact from each reference is confirmed. Books without bibliographies skip this. See BL-B4. |
| **BL-24** | Single-Responsibility Commits | **Applies unchanged, with book re-scoping** | Book equivalent: "one commit = one chapter's revision pass" (NOT "one commit = one phase" — the phase unit for a book is a chapter). Transfers cleanly with the re-scoping. No new BL-B needed. |
| **BL-25** | Error Path Coverage Matrix | **N/A for books** | Books do not have "happy path / error path / timeout path" runtime paths. The closest analog is "what if a reader doesn't follow Ch.5" — but that's handled by R4 (outline fidelity) + R6 (target reader coverage), not a 5-path matrix. |

Summary: **2 code-adapter BL apply unchanged** (BL-3, BL-24 with book re-scoping); **4 have book equivalents** (BL-2→B1, BL-6→B2, BL-14→B3, BL-22→B4 conditional); **2 are N/A** (BL-8, BL-25).

### Book-specific BL (BL-B namespace — separate budget)

These 4 BL live in this skin file ONLY. They do NOT add to the main 30-BL budget. They are loaded by the book domain adapter layer, not by META-Orchestrator's universal bootstrap.

**BL-B1: ARC Release is a Deployment Event (book adaptation of BL-2)**
- **Source:** Adapted from BL-2 for the book domain.
- **Rule:** Releasing an Advance Reader Copy (ARC) — beta reader distribution, preview chapter publication, or a chapter-by-chapter serial release — is a release event. It requires: preview-reader-cohort canary (10-50 beta readers before wider distribution), a 7-day reader-silence window before considering the release "stable," and a rollback plan (how to withdraw or revise a released ARC, including an updated errata sheet).
- **Why:** Book releases have unbounded reputational blast radius AND reader-time blast radius (beta readers commit their own reading time to a draft you might retract). A botched ARC release annoys the exact readers you need as advocates.
- **Applies to:** Visionary (approve release), Builder (release preparation + draft pre-check), Validator (pre-release R-check gate).

**BL-B2: Verify Before Commit — Render Validity Gate (book adaptation of BL-6)**
- **Source:** Adapted from BL-6 for the book domain.
- **Rule:** Before committing any chapter draft, Builder MUST run: (a) R1 (Flesch-Kincaid) on the chapter and confirm within target band, (b) length budget check (draft within ±20% of target), (c) glossary pre-read (confirm glossary was re-read at the start of the chapter session), (d) project-specific compile/typeset check if a compiler is declared in `config.md` (e.g., `pandoc`, `tectonic`, or `vivliostyle`). Commit is REJECTED otherwise.
- **Why:** A chapter that "reads well" to the Builder but falls outside the readability band, or runs 2× over budget, or uses glossary terms inconsistently, is the book equivalent of unverified code. Cost of the self-check: 2 minutes per chapter. Cost of a bad chapter landing in the manuscript: a full revision pass at RT-2 or worse.
- **Applies to:** Builder (mandatory pre-commit self-check), Validator (cross-check at RT-per-cluster), META (enforce gate).

**BL-B3: Errata/Retraction Plan Before Release (book adaptation of BL-14)**
- **Source:** Adapted from BL-14 for the book domain.
- **Rule:** Before a book is submitted to a publisher / uploaded to a self-publish platform / released as an ARC, Builder MUST document the errata plan: who to contact (publisher, self-publish platform support, beta readers), what an errata notice would say, what the update procedure looks like (new edition, errata sheet, silent digital update, paper insert). If the book cannot accept post-release corrections, that is itself a structural risk that must be logged.
- **Why:** Books, unlike articles, are typically released into a distribution chain where corrections are hard (printed copies in warehouses, digital copies on reader devices, reviewer copies at publications). A pre-written errata plan executes mechanically under pressure when an error is found post-release. Books have multi-year shelf lives; the errata plan is a living document.
- **Applies to:** Visionary (approve the errata plan), Builder (write it), Coherencer (store in MEMORY for multi-book series continuity).

**BL-B4: Bibliography PRE-FLIGHT (CONDITIONAL — book adaptation of BL-22)**
- **Source:** Adapted from BL-22 for the book domain.
- **Rule:** **CONDITIONAL — applies ONLY if the book has a bibliography.** Before RT-1 begins on any book task that includes bibliographic references, Analyst MUST verify every reference: (a) DOI/ISBN syntax is valid, (b) for novel references (references the author has NOT personally read cover-to-cover), the source is accessible AND at least one key fact from each source is confirmed. Produce a VERIFIED REFERENCES artifact. Unverified references = Builder BLOCK at RT-1.
- **Why:** Books with bibliographies that hallucinate references are the top F=0 failure in popular-science and academic-monograph book work. Books without bibliographies (most trade non-fiction, most how-to) skip this entirely.
- **Applies to:** Analyst (RT-1), Validator (RT-2 re-verification), Builder (block without artifact), META (enforce gate). **Skip if `config.md` declares `domain.has_bibliography: false` or equivalent.**

### BL budget summary for the book skin

- Universal BL inherited: **22** (unchanged; BL-19 is *conditional* per-project — applies iff `domain.bilingual: true`)
- Code-adapter BL that apply unchanged: **2** (BL-3, BL-24 with book re-scoping)
- Code-adapter BL with book equivalents: **4** (BL-2→B1, BL-6→B2, BL-14→B3, BL-22→B4 conditional)
- Code-adapter BL that are N/A for books: **2** (BL-8, BL-25)
- Book-specific BL (BL-B namespace, separate budget): **4** (BL-B1..B4)

**Total BL a book agent carries:** 22 universal + 2 transferred code-adapter + 4 BL-B = **28 BL**.
(The 2 N/A code-adapter BL are NOT loaded. BL-19 is carried but active only for bilingual projects. BL-B4 is carried but active only for books with bibliographies.)

---

## Known Out-of-Scope (OOD)

Tasks that LOOK like book work but FAIL v9's text-discrete AND-gate, or that map to a modality not yet implemented in v9. Agents must escalate these to Visionary RT-0 and, when confirmed OOD, defer — do NOT auto-proceed under the book skin.

- **Fiction — novels, short-story collections.** A novel is pure narrative; the load-bearing property is voice + emotional arc, not readability + structural coherence. Novels have no objective verification hook analogous to R1-R6 (a novel can be "deliberately dense" and still be great literature). FAILS on `verify.method`. Route to `templates/domain_skin.narrative.md` when it lands in v10, or reject.
- **Free-verse poetry collections.** No discrete verification — no Flesch target, no glossary obligation, no outline fidelity. Aesthetic judgment is continuous, not discrete. FAILS on objective verification. Route to a `poetry` skin (deferred to v10) or reject. Note: a sonnet or haiku collection with countable structural constraints (meter, rhyme scheme, syllable count) IS in-scope per `eradev.md` line 185 — but such a project should declare a poetry-specific skin, not this book skin.
- **Pure personal memoirs framed as subjective narrative.** A memoir with no factual-check obligation is closer to novel work; the reader-promise is emotional truth, not outlined content. FAILS on target-reader/verification gate. If the memoir has a factual backbone (dates, places, named people), R3 glossary consistency and R2 continuity still apply — in that case the project may use this book skin with a note that R4 outline fidelity is graded loosely.
- **Audiobook scripts without a reader-time budget.** Ambiguous — an audiobook script may or may not need the 6 R-checks depending on whether it is a rewrite of an existing book (this skin applies) or a script written directly for audio (closer to `narrative` modality). Escalate to Visionary RT-0.
- **Speculative philosophy books with no falsifiable claim.** The central thesis is a metaphysical position, not a checkable statement. FAILS on R6 target-reader coverage (no way to tell if the reader "got it right"). Visionary RT-0 is the gate — if the book has a falsifiable historical or empirical backbone, this skin applies; if the whole book is speculative argument, deferred to a future `philosophy` skin or rejected.

Agents should escalate these to Visionary RT-0, not auto-proceed. See `eradev.md` Section II.2 for the v9 OOD registry.

---

## Footer

*Last updated: 2026-04-11 (v9 Phase 2.A)*
*Upstream roles: roles/{role}_EN.md (all 5 roles — Visionary, Analyst, Builder, Validator, Coherencer)*
*Upstream math: eradev.md Section II.1 (B_creative weights: F=0.20, E=0.30, (1-σ)=0.30, Λ=0.20) — line 118*
*Upstream BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)*
*Does NOT inherit: BOOTSTRAP_LESSONS_code_adapter.md (8 code-adapter BL handled individually above)*
*Sibling skins: templates/domain_skin.article.md (research modality), templates/domain_skin.code.md (text modality)*
*Spec: reports/v9_phase2a_book_skin_spec_2026-04-11.md (Analyst hand-off, B=0.908)*
