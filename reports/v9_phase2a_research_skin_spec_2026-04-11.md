# EraDev v9 Phase 2.A — Research Domain Skin Specification

> Date: 2026-04-11
> Role: [ANALYST]
> Task: Phase 2.A — specify `templates/domain_skin.research.md` (L2 domain skin for standalone proofs / derivations / research notes — NOT full articles)
> Output type: Report (META type 5) — Analyst spec for Builder hand-off
> Language stack: EN (practical task — artifact design)
> Parent skin: `templates/domain_skin.article.md` (same modality — research; sibling, not replacement)

---

## Activation Operator Results

- **A_F (Focus)**: Read `roles/analyst_EN.md`, `templates/domain_skin.md.template`, `templates/domain_skin.article.md` (complete, ~645 lines), `templates/domain_skin.code.md`, `reports/v9_phase2_1_article_skin_spec_2026-04-11.md` (sections 1-5), `reports/v9_phase2_1_s_smoke_test_2026-04-11.md` (sections 1-2 — C1..C6 execution on ODTOE_measuring_B_parameter), `reports/v9_phase2_1_s_second_smoke_test_2026-04-11.md` (sections 1-3 — same C1..C6 on ODTOE_phi_fractality), `eradev.md` Section II.1 (modality registry, B_research weights), `BOOTSTRAP_LESSONS_universal.md` + `BOOTSTRAP_LESSONS_code_adapter.md` (headers + BL-1..BL-8 sample). True North: the research skin is the **little sibling** of the article skin. Same modality, same weights (research), text-discrete, verify=recompute. It exists because a project can produce standalone proofs, derivations, lemma sheets, or working notebooks that are NOT dressed as full papers. The article skin assumes the 8-file bilingual journal-submission architecture; the research skin drops that scaffolding and shifts verification emphasis from cite_check (bibliography-first) to recompute (derivation-first).
- **A_E (Alignment)**: The spec must **inherit** the article skin structurally wherever possible and call out the deltas explicitly. META's request ("все остальное делаем") places this in parallel with book/plan/config spec work. Honesty about overlap is a stated scope constraint. The deliverable is Builder-ready: a concrete list of what changes and what's inherited verbatim, not a rewrite of every section.
- **A_σ (Consistency)**: No conflict with Phase 0.A schema (`research` is already listed in the `domain.type` enum alongside `code|article|book|config|plan`). No conflict with Phase 2.1 article skin — the two are **siblings in the same modality** and can co-exist in the same project (a project can have `domain.type: research` OR run per-task classification where one task is `article` and another is `research`). No conflict with eradev.md Section II.1 — both skins pin `B_modality: research` with identical weights. One TENSION resolved here: the article skin's verify method is `cite_check`; the research skin's verify method is `recompute`. Both are legitimate research-modality methods because they weight the same components but emphasize different failure surfaces (article: citation + consistency; research: derivation + consistency). The skin file must be explicit that these are two lenses on the same modality, not two competing modalities.
- **A_Λ (Experience)**: Consulted the article skin's smoke tests. Two findings directly inform the research skin:
  1. **Skin-DEF-f (formula provenance C6b)** — added to article skin in cleanup v2 after second smoke test found an asserted formula with no derivation chain. The research skin promotes this from C6b to **RC7 (Formula Provenance)** as a primary check, because research artifacts are derivation-first.
  2. **Skin-DEF-e (self-citation quantitative ladder)** — less relevant for research notes (which rarely have the self-citation problem; they have 3-10 sources total and no "establish the author's brand" pressure). Research skin INHERITS the ladder but demotes C5 to a footnote because it is rarely triggering.
  BL-17 (Check-First = prevention) remains critical: research artifacts are derivation-first, so the Check-First for research demands reading the axiom set BEFORE writing any proof step. BL-19 (bilingual sync) applies to research projects that publish in both languages (ODTOE-style) but is OPTIONAL at the skin level — many research notes are monolingual and should not be blocked on a missing RU/EN pair.

---

## Inverted IFR (past tense, measurable)

> "The `templates/domain_skin.research.md` file was written by a single Builder in ~40 minutes using this spec. The file is ~300-400 lines (smaller than article skin because it inherits rather than duplicates). It has YAML frontmatter matching article skin's header pattern except for three pinned fields (`Type: research`, `verify.method: recompute`, `Sibling: templates/domain_skin.article.md`). The vocabulary table has 22 rows, 18 inherited from article skin and 4 specialized for standalone-derivation work (proof_step, axiom_set, derivation_chain, provenance_tag). Per-role focus overrides exist for all 5 roles with recompute-first language replacing cite-first language. The verification protocol defines 8 RC (recompute) checks RC1..RC8, where RC1..RC5 are derivation-integrity, RC6 is notation consistency, RC7 is formula provenance (promoted from C6b), and RC8 is contradiction detection. Three examples demonstrate Validator finding a missing proof step (RC1/RC2), a circular reasoning failure (RC4), and a notation collision (RC6 / Coherencer). The BL inheritance section carries all 22 universal BL unchanged, handles the 8 code-adapter BL with 4 research equivalents (BL-R1..R4) and 2 N/A, and adds 0 new research-specific BL (the 4 BL-R entries are the equivalents themselves, reusing the article skin's BL-A pattern). Acceptance criteria include an explicit co-existence clause: article skin and research skin are sibling modalities; a project using either can also use the other on a per-task basis."

## Acceptance Criteria

- **[AC-1]** Spec contains all 10 required sections with no placeholder text.
- **[AC-2]** Vocabulary mapping has 22 ± 3 term pairs. At least 18 inherit from article skin (marked "[INHERIT article row N]"). At least 4 are new research-specific rows (proof_step, axiom_set, derivation_chain, provenance_tag — see Section 2 below).
- **[AC-3]** Per-role focus overrides cover all 5 roles with: FIRST focus anchor (derivation-first, not bibliography-first), "artifact" definition, primary failure mode, Jidoka self-check. Each role's primary failure mode is DIFFERENT from the article skin (research failures center on unproven assertions, not citation gaps).
- **[AC-4]** Verification protocol enumerates 8 RC checks (RC1..RC8) mapped to Validator L1 (per-step) and L2 (pre-submission). At least RC1, RC4, RC7 must be L2 (interpretive) — they cannot be reduced to grep.
- **[AC-5]** 3 examples, each naming catching role, phase, and fix. Example 1 = missing proof step. Example 2 = circular reasoning. Example 3 = notation collision.
- **[AC-6]** BL inheritance: all 22 universal BL inherited unchanged (same table as article skin, applicability column rewritten for research artifacts); 8 code-adapter BL handled individually (BL-3 + BL-24 transfer unchanged; BL-2, BL-6, BL-14, BL-22 have research equivalents BL-R1..R4; BL-8, BL-25 are N/A).
- **[AC-7]** **Co-existence clause** (critical): an explicit paragraph stating that the research skin and article skin are sibling modalities — a project can use one, the other, or both. If both, per-task classification decides which skin applies. The research skin does NOT replace the article skin and the article skin does NOT replace the research skin.
- **[AC-8]** Backward compatibility: a project declaring `domain.type: research` with `domain.skin: templates/domain_skin.research.md` routes correctly through META without requiring any changes to `eradev.md` Section II.1 or the Phase 0.A schema.
- **[AC-9]** Hand-off section names the exact file path, expected size (lines, MUST be less than article skin's 645 to enforce the "inherits-not-duplicates" discipline), explicit FIXED vs FLEXIBLE fields.
- **[AC-10]** The spec is honest about overlap: every section that is "inherit from article skin verbatim" says so explicitly and does NOT re-derive the content.

## Failure Pre-mortem

- **[FM-1]** Builder duplicates article skin content instead of inheriting → skin balloons to 600+ lines, future maintenance is doubled → Mitigation: AC-9 caps line count; Section 2 explicitly marks inherited rows with "[INHERIT]".
- **[FM-2]** Spec does not articulate the co-existence clause → operators get confused whether they need to pick one skin → Mitigation: AC-7 mandates a dedicated paragraph in the skin file.
- **[FM-3]** Research skin accidentally makes cite_check subordinate when it should be complementary → a research note that DOES cite sources is blocked at Validator because "recompute is primary" is misread as "citations don't matter" → Mitigation: Section 5 verification protocol explicitly states "citations are checked when present — recompute is the dominant verification surface because research artifacts are often derivation-centric, but cite_check C1-C4 still apply when sources are listed."
- **[FM-4]** Formula provenance (Skin-DEF-f / C6b in article skin) is demoted back to secondary in research skin → research artifacts were the reason C6b was added in the first place → Mitigation: RC7 is PROMOTED to primary (dominant) check.
- **[FM-5]** Builder misinterprets "standalone proof" as "no structural discipline needed" and drops BL-17 Check-First → research notes get written without reading the axiom set → Mitigation: Section 5 Check-First is rewritten as "read the axiom set + adjacent lemmas + notation table BEFORE any proof step is written" (research-specific Check-First, not a weakened one).
- **[FM-6]** Self-citation quantitative ladder (Skin-DEF-e) is blindly inherited even though research notes rarely trip it → Validator wastes cycles computing a metric that's always 0 or very low → Mitigation: C5 is demoted to a footnote in research skin (present for completeness, not a primary gate).

---

# SECTION 1 — Domain Identification

| Field | Value | Justification |
|---|---|---|
| `domain.type` | `research` | Matches Phase 0.A schema enum; NEW type for v9 (not yet consumed by any live project at spec time — the `odtoe-articles` project uses `article`, not `research`). |
| `domain.B_modality` | **`research`** | Same as article skin. See 1.1 for why the two skins share modality. |
| `domain.ood_scope` | `text-discrete` | Theorem statements, proofs, and derivations are discrete text artifacts — a proof either reaches its claim or it doesn't, with objective verification (RC1..RC8). Passes v9 AND-gate. |
| `domain.verify.method` | **`recompute`** | PRIMARY method is independent re-derivation of every mathematical claim. Cite_check runs WHEN sources are present but is secondary because research artifacts may have 0 external citations (a proof from axioms cites no paper). |
| `domain.parent_bl` | `BOOTSTRAP_LESSONS_universal.md` (22 universal BL) | Research skin does NOT inherit `BOOTSTRAP_LESSONS_code_adapter.md`. Section 8 provides per-code-BL treatment identical in structure to article skin. |
| `domain.sibling_skin` | `templates/domain_skin.article.md` | NEW FIELD. Explicit pointer to the article skin as a sibling in the same modality. Indicates to META that a project with both kinds of artifacts may load BOTH skins for per-task classification. |

### 1.1 Modality choice: `research`, same as article — NOT a duplicate choice

**Rationale:** Both article and research artifacts are theorem/proof/derivation work, so both get `B_modality: research`. The difference is NOT in modality but in **verification surface**:

- **Article skin (`verify.method: cite_check`)** — the article is a full paper with bibliography, introduction, discussion. The load-bearing failure surface is "does every cited reference actually say what the article claims it says?" Bibliography completeness, DOI validity, citation attribution are first-order.
- **Research skin (`verify.method: recompute`)** — the artifact is a standalone proof, a derivation chain, a lemma sheet, a mathematical notebook. The load-bearing failure surface is "does the derivation chain actually close?" Re-running the proof from scratch is first-order; bibliography is thin or absent.

Both skins use B_research weights (F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15) from `eradev.md` Section II.1 because the underlying work profile is identical: theorem+proof+derivation. The skin files diverge on **which check is the primary gate**, not on modal weights.

### 1.2 Σ emphasis (research specialization)

Research skin emphasizes (1-σ) MORE than article skin **by convention**, even though the numerical weight is identical (0.35). Rationale:

- An article tolerates minor inconsistencies (one orphan biblio entry, a rounding error in a table, a stray `--` where `—` should be) without invalidating its scientific value. These are DEF-1/DEF-2/DEF-5 in the first smoke test — NOTES, not FAIL.
- A standalone proof does NOT tolerate a single contradiction. If proof P uses both "X is true" and "X is false" as hypotheses at different steps, the entire proof collapses — not just a section. There is no graceful degradation for a contradiction in a proof.

**Practical consequence:** Research skin's Validator Jidoka score for (1-σ) is binary-ish. Any detected contradiction in the derivation chain → (1-σ) = 0 → B = 0 → ANDON. This is STRICTER than article skin's Validator, which can report "PASS WITH NOTES" when minor inconsistencies exist.

This is a **convention**, not a formula change. The weights remain (F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15). What changes is the TOLERANCE for (1-σ) defects: research = zero, article = graded.

### 1.3 Header block for the skin file

The Builder must produce a file starting exactly like this:

```markdown
# Domain Skin: research

> Type: research
> Modality: research
> Applies to projects where `config.md` contains `domain.type: research`
> Parent BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)
> Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md
> Sibling skin: templates/domain_skin.article.md (same modality, different verify surface)
> Last updated: 2026-04-11
> Upstream roles: roles/{role}_EN.md
> Upstream math: eradev.md Section II.1 (B_research weights)

---
```

**FIXED (Builder must not alter):** `Type: research`, `Modality: research`, the "does NOT inherit code_adapter" line, the sibling skin line (wording MAY change, pointer must remain).
**FLEXIBLE:** wording of the "Applies to projects" sentence; formatting of the `> ` block.

---

# SECTION 2 — Vocabulary Mapping

22 rows. 18 inherited from article skin (explicitly marked `[INHERIT article row N]`), 4 new research-specific rows.

Builder preserves the 18 inherited rows VERBATIM from the article skin (copy-paste, change "article" wording to "research artifact" where it improves clarity but leave the semantic mapping intact). Builder writes the 4 new rows fresh.

| # | Abstract term | Research meaning | Source |
|---|---|---|---|
| 1 | **artifact** | a proof / derivation / lemma sheet / mathematical notebook / standalone theorem statement — NOT a full paper architecture | [INHERIT article row 1, scoped narrower: "standalone proof" instead of "article section"] |
| 2 | **function** | **theorem / lemma / proposition / corollary** (the addressable unit is a named mathematical statement) | [SPECIALIZED from article row 2 — article said "claim, theorem, lemma, or labelled equation"; research says "theorem / lemma / proposition / corollary" — named statements are primary, labelled equations are secondary] |
| 3 | **test / tests pass** | **proof verification / independent recomputation** — Validator walks every proof step without relying on the author's explanation | [SPECIALIZED from article row 5 — article said "cite_check passes + recomputation matches"; research drops cite_check to secondary and promotes recomputation to primary] |
| 4 | **verify** | **independent recomputation / proof walk-through** — every mathematical claim must be independently derivable or cited to an axiom | [SPECIALIZED from article row 6] |
| 5 | **validate** | run the 8 RC (recompute) checks RC1..RC8 | [SPECIALIZED from article row 7 — article said "run the 8 verification checks"; research says "run the 8 RC checks"] |
| 6 | **API / API endpoint** | **axiom set / foundational reference** — the external contract of the proof is which axioms it depends on | [SPECIALIZED from article row 12 — article said "reference database entry (DOI, arXiv ID)"; research says "axiom set / foundational reference" — the cited papers ARE sometimes the foundation, but more often the foundation is an explicit axiom list inside the artifact] |
| 7 | **bug** | **unproven claim / circular reasoning / invalid derivation step / notation collision** | [SPECIALIZED from article row 13 — article said "unsupported claim / citation gap / factual error / unresolved cross-reference / DOI 404"; research shifts to "unproven claim / circular reasoning / invalid derivation"] |
| 8 | **refactor** | **restructure proof chain** — reorder lemmas, rewrite a proof for clarity, change proof strategy (by induction → by contradiction) without changing the result | [SPECIALIZED from article row 14] |
| 9 | **compile** | **typeset math / render LaTeX** (for LaTeX-based research notes) — for notebook-style research, "compile" means execute the notebook end-to-end without errors | [SPECIALIZED from article row 4 — article said "typeset / render PDF via tectonic"; research says "typeset math / render LaTeX / execute notebook"] |
| 10 | **runtime** | **reader's proof-following time** — how long an expert reader spends walking the proof | [SPECIALIZED from article row 9 — similar concept, renamed] |
| 11 | **spec / specification** | **problem statement / research question** — what is being proved, what is being conjectured, what is OUT of scope | [SPECIALIZED from article row 10] |
| 12 | **code review** | **peer math review** — another mathematician walks the proof independently | [SPECIALIZED from article row 15] |
| 13 | **PR / pull request** | submission to a preprint server / handoff to a reviewer / proposed addition to a derivation notebook | [INHERIT article row 16, narrower scope] |
| 14 | **commit** | signed-off change to a proof step, with Jidoka gate passed (derivation integrity + notation consistency) | [INHERIT article row 17] |
| 15 | **deploy / push to prod** | submit to preprint / share with peer reviewer / commit to main branch of research notebook | [INHERIT article row 18] |
| 16 | **production** | published version (on arXiv, in a research journal, or as a load-bearing lemma in the corpus) | [INHERIT article row 19] |
| 17 | **smoke test** | sanity check — read the theorem statement and the first proof step, verify claim and method are matched | [INHERIT article row 20] |
| 18 | **glossary / canonical terms** | **notation table** — the research artifact's mapping of symbols to meanings (α = phase angle, β = coupling constant, etc.) | [SPECIALIZED from article row 21 — article said "46-term ODTOE glossary"; research says "notation table" — smaller, artifact-local] |
| 19 | **symbol collision** | two sections of the same research artifact using the same symbol with different meanings | [INHERIT article row 22 — this is ALREADY in the article skin] |
| 20 | **proof_step** | **NEW — research-specific.** A single addressable derivation move: "From eq(4) and eq(5) by substitution → eq(6)". Each proof_step has a justification (lemma cited, axiom applied, algebraic manipulation performed) | **NEW row** — not in article skin. Research artifacts are a chain of proof_steps. |
| 21 | **axiom_set** | **NEW — research-specific.** The explicit list of postulates / axioms / foundational assumptions the proof depends on. Equivalent to "external API contract" for code. | **NEW row** — not in article skin. A research proof's axiom_set is its public interface to the rest of mathematics. |
| 22 | **derivation_chain** | **NEW — research-specific.** The full sequence of proof_steps from axiom_set to the theorem claim. A derivation_chain that has a missing link = proof is incomplete. | **NEW row** — not in article skin. The unit of provenance. |
| 23 | **provenance_tag** | **NEW — research-specific.** A visible marker on each formula or claim stating its origin: **Derived** / **Cited** / **Axiomatic** / **Conjectured**. Equivalent to article skin's C6b formula provenance categories, promoted here to a first-class vocabulary term. | **NEW row** — parallels article's Skin-DEF-f fix. |

**Count:** 18 inherited (rows 1-19 minus the non-applicable ones) + 4 new (rows 20-23) = 22 rows. Within the ±3 AC-2 budget.

**Builder may add 1-2 more rows** (e.g., `\qed` → "end-of-proof marker"; `\square` → notation for proof termination). Builder MUST NOT delete any of the 22 specified rows.

**FLEXIBLE:** Wording of the "specialized from" parenthetical; exact phrasing of new rows.
**FIXED:** The 4 new row names (`proof_step`, `axiom_set`, `derivation_chain`, `provenance_tag`). Row count (22 ± 3).

---

# SECTION 3 — Modal B-formula (research weights, same as article)

This skin pins `B_modality: research`. Builder produces the same weight table as the article skin:

| Component | Weight | Research skin rationale |
|---|---|---|
| F (Focus) | **0.30** | Second-dominant. A research Builder who writes a proof without reading the axiom set and adjacent lemmas produces work that is orphaned from the corpus — inherits article's rationale but applied to axiom scanning rather than literature scanning. |
| E (Alignment) | **0.20** | Alignment to operator intent matters but is subordinate to logical correctness. You cannot be "aligned with" an invalid proof. |
| (1-σ) (Consistency) | **0.35** | **Dominant.** A single contradiction falsifies the entire proof. **Research convention: tolerance for (1-σ) defects is ZERO**, stricter than article skin (article tolerates minor numerical discrepancies with a NOTES verdict — research does NOT). |
| Λ (Experience) | **0.15** | Lowest weight. Memory accelerates but a fresh corpus sweep can cold-start a new derivation. |

**Rationale reference:** `eradev.md` Section II.1 lines 117-119 lists `B_research` with (0.30, 0.20, 0.35, 0.15). This is identical to article skin Section "Modal B-formula" — Builder may copy the weight table verbatim but MUST add the research-specific note: **"Convention: (1-σ) tolerance is zero. Any detected contradiction → Andon."**

**FIXED:** The four weight values. The (1-σ) tolerance convention.
**FLEXIBLE:** Narrative prose describing the rationale.

---

# SECTION 4 — Per-Role Focus Overrides

Each role retains its Activation Operator and Jidoka from `roles/{role}_EN.md` unchanged. Builder produces focus overrides for all 5 roles. Each role's primary failure mode MUST be research-specific (unproven assertions, not citation gaps).

### 4.1 Visionary (research focus)

- **FIRST focus anchor (A_F override):** Name the **central claim** of the research artifact + enumerate what is **OUT of scope** (explicitly — what is NOT being proved). True North = *"this artifact proves X under axiom set A; it does NOT prove Y, Z, or variants outside A."*
- **Artifact definition:** The theorem statement + its scope declaration. Not the proof, not the LaTeX, not the notebook — the argument's **claim and its boundaries**.
- **Primary failure mode:** Approving a proof attempt whose scope is not articulated, so the Builder drafts a proof that silently expands scope mid-chain. Mitigation: Visionary must enumerate what's IN and what's OUT before greenlighting.
- **Secondary failure mode:** Treating a **conjecture** as a **theorem**. Conjectures require explicit labeling (`provenance_tag: Conjectured`) and no proof obligation; theorems require a closed derivation chain. A research artifact that mixes conjectures and theorems without labels fails at RT-0.
- **Jidoka self-check (research specialization):**
  - Q1: "Is the claim a theorem (must be proved) or a conjecture (must be labelled)?"
  - Q2: "Have I enumerated what is OUT of scope?"
  - Q3: "Does the axiom_set I'm authorizing have any known gaps or collisions with the corpus?"
  - Q4: "Is the claim falsifiable in a checkable way, or is it philosophical (→ OOD)?"
- **Upstream reference:** `visionary_EN.md` strategic-question pattern. Research adds the **scope declaration** as a hard pre-Builder gate not found in the base role file.

### 4.2 Analyst (research focus)

- **FIRST focus anchor (A_F override):** Read the proof strategy choices (by induction, by contradiction, by construction, by contrapositive) + the axiom_set + the adjacent lemmas the proof will depend on. If any axiom is unstated, STOP and demand axiom declaration before producing a plan.
- **Artifact definition:** A proof decomposition: (1) proof strategy, (2) lemma hierarchy (dependencies among the supporting lemmas), (3) axiom dependencies, (4) per-step justification requirement (cite an axiom, cite a lemma, apply an algebraic rule). The Analyst output is a **proof outline table**, not prose.
- **Primary failure mode:** Skipping axiom declaration. A proof plan that says "apply standard real analysis" without naming which axioms of real analysis are used is an incomplete plan. Research skin's equivalent of BL-17 violation.
- **Jidoka self-check (research specialization):**
  - Q1: "Have I named the proof strategy explicitly? (by induction / by contradiction / by construction / etc.)"
  - Q2: "For each proof step in the plan, is the justification specified (axiom X / lemma Y / algebraic identity Z)?"
  - Q3: "Is the axiom_set minimal (every listed axiom is actually used)?"
  - Q4: "Are there notation collisions with adjacent lemmas — same symbol with different meaning?"
  - Q5: "Is the lemma hierarchy acyclic (no lemma depends on a lemma that depends on it)?"
- **Deliverable template (research-specific):**
  ```
  ## Research Plan (Analyst output for research)
  Theorem statement: [one-sentence claim]
  Scope (OUT): [what's NOT being proved]
  Proof strategy: [induction / contradiction / construction / contrapositive / other]
  Axiom set: [explicit list — each axiom numbered]
  Lemma hierarchy: [DAG of supporting lemmas — arrows show dependency]
  Per-step table:
    Step N | Premise(s) | Justification | Conclusion | Notation notes
  Notation table: [symbol | meaning | where first defined]
  Conjectures (if any): [explicitly labelled]
  Pipeline: axiom read → notation lock → proof steps → RC1..RC8 → commit
  Resource conflicts: [symbol collisions, axiom collisions with adjacent artifacts]
  System dependencies: [LaTeX packages, mathematical software used, reference manager]
  B-check: F=_ E=_ (1-σ)=_ Λ=_ → B=_
  ```

### 4.3 Builder (research focus)

- **FIRST focus anchor (A_F override):** Read the axiom_set + the Analyst proof outline + the notation table + any adjacent lemmas that will be cited. Do NOT start writing proof steps until all four are loaded. Research-specific enforcement of BL-17 + BL-21.
- **Artifact definition:** The full derivation_chain from axiom_set to theorem claim, **with every step carrying a provenance_tag**. A proof without provenance tags is INCOMPLETE, not WIP.
- **Primary failure mode:** Writing proof steps with hand-waving justifications ("as is well known," "it is easy to see," "by standard argument"). These are research skin's equivalent of `[FACT]` without a source — they are RC1 violations. Mitigation: every step must cite an axiom, a lemma, a previous step, or be labelled as a reduction that Validator must verify.
- **Second failure mode:** Copying a formula from an external source without a visible provenance_tag — quoting `[3]` without a page/section pointer is exactly the DEF-5 case from article skin's second smoke test. Mitigation: every formula carrying an external attribution must include a concrete pointer (`[3] Theorem 2.4` or `[3] §5, eq. (12)`).
- **Third failure mode:** Silent scope expansion. Starting a proof for "X holds under A" and mid-chain concluding "X holds in general" — the generality is never proved, only assumed. Mitigation: Builder's Jidoka Q3 below.
- **Jidoka self-check (research specialization):**
  - Q1: "Have I read the axiom_set + notation table + Analyst outline + adjacent lemmas? (F)"
  - Q2: "Does each proof step cite its justification (axiom, lemma, previous step, or algebraic identity)? (E)"
  - Q3: "Has my scope remained constant? Did I prove the claim I was asked to, not a different claim? (1-σ, scope-drift check)"
  - Q4: "Does every numbered formula have a visible provenance_tag (Derived / Cited / Axiomatic / Conjectured)? (Λ, promoted from article C6b)"
  - Q5: "Is my notation consistent with the notation table? No silent re-use of a symbol with a new meaning? (1-σ, notation collision check)"

### 4.4 Validator (research focus)

- **FIRST focus anchor (A_F override):** Read the theorem statement + axiom_set + derivation_chain. Then close the Analyst's outline and walk the proof **INDEPENDENTLY** — Validator simulates a peer math reviewer who receives the proof with no context. Validator runs all 8 RC checks; Validator does NOT trust Builder's Jidoka as a substitute.
- **Artifact definition:** The derivation_chain IN ITS FINAL FORM — exactly what a journal math reviewer would see. Validator's job is to break the proof if it can be broken.
- **Primary failure mode:** Reading the proof with the author's context ("I see what they're doing") and missing the gap. Independent recomputation — sitting with only the axiom_set and theorem statement and trying to reconstruct the proof — is the antidote.
- **Secondary failure mode:** Trusting Builder's provenance tags without verifying. A tag `[DERIVED: from eq (4)]` might be a claim that eq(4) implies the result, when actually eq(4) is a necessary but not sufficient premise. Validator must AUDIT every provenance tag against the formal derivation.
- **Tertiary failure mode:** Missing a **circular** derivation where the proof of A uses corollary B which itself depends on A (often through a long chain of intermediate results). RC4 is the dedicated check.
- **Jidoka self-check (research specialization):**
  - Q1: "Have I run all 8 RC checks?"
  - Q2: "For each theorem/lemma, is there a proof? (RC1 — no 'as is well known')"
  - Q3: "For each proof step, does it cite a previous step, a lemma, or an axiom? (RC2 — no unsupported jumps)"
  - Q4: "Have I independently walked the proof from axiom_set to claim? (RC3 — independence check)"
  - Q5: "Is there any circular reasoning? (RC4 — build a dependency graph of lemmas used; check for cycles)"
  - Q6: "Is the axiom_set minimal? (RC5 — every axiom is actually used)"
  - Q7: "Is notation consistent throughout? (RC6 — same symbol means same thing)"
  - Q8: "Does every numbered formula have a visible provenance_tag that I can verify? (RC7 — formula provenance)"
  - Q9: "Are there any two statements in the document that are formally inconsistent? (RC8 — contradiction detection)"

### 4.5 Coherencer (research focus)

- **FIRST focus anchor (A_F override):** Read the research artifact + the adjacent corpus artifacts (notation tables of neighboring proofs, axiom sets of related theorems). Coherencer cares about *this proof's fit with the neighboring corpus*.
- **Artifact definition:** The corpus's notation table + axiom set + this proof = new corpus. Coherencer checks that (old corpus) ∪ (this proof) remains coherent. If two proofs in the same notebook use `α` for different things, Coherencer intervenes.
- **Primary failure mode:** Notation collision across proofs in the same research artifact — the classic `α` example. Different proofs in the same notebook redefining `α` silently means the reader sees `α` in §3 and carries its meaning to §5 where `α` has a different meaning.
- **Secondary failure mode:** Axiom set drift — proof A uses "Axiom X = choice" and proof B in the same artifact uses "Axiom X = replacement" without declaring that they're not the same X.
- **Tertiary failure mode (research-specific):** Cross-proof dependency silently broken. Proof B cites Lemma 4.2, but Lemma 4.2 is in proof A with a slightly different formulation — so the citation technically resolves but semantically fails. Coherencer must check that cross-proof references match verbatim.
- **Jidoka self-check (research specialization):**
  - Q1: "Does the new artifact use every symbol consistently with the corpus notation table?"
  - Q2: "Are there any axiom collisions with adjacent artifacts — same axiom name, different statement?"
  - Q3: "If this artifact cites a lemma from an adjacent artifact, does the citation match verbatim?"
  - Q4: "Have I performed an independent spot-check: pick 2-3 proof steps, re-derive them without the artifact's context?"
- **Bilingual sync rule (BL-19) specialization:** **OPTIONAL for research.** Unlike article skin which makes BL-19 an enforcement gate (the 8-file rule), research skin makes bilingual drafts OPTIONAL. A research notebook may be monolingual and Commit is NOT blocked on missing RU/EN pair. If the project declares `bilingual: required` in its config.md, then the 8-file rule applies; otherwise, only the artifact in the primary language is required.

---

# SECTION 5 — Verification Protocol (recompute + provenance)

The research skin's `verify.method: recompute`. The skin expands `recompute` into **8 RC checks** split across Validator L1 (per-step) and L2 (pre-submission).

### 5.1 The eight RC checks

| # | Check | Who runs it | L1 or L2 | Enforcement mechanism |
|---|---|---|---|---|
| **RC1** | **Proof existence** — every theorem / lemma / proposition has a proof. No "as is well known," "by standard argument," "trivially." | Validator | **L2** (interpretive — requires reading the proof text) | Manual read; grep for forbidden phrases as pre-filter |
| **RC2** | **Step attribution** — every proof step cites a previous step, a lemma, or an axiom. No unattributed algebraic jumps. | Validator | **L2** (interpretive — requires understanding each step) | Per-step manual audit; grep for `\begin{proof}` blocks and inspect |
| **RC3** | **Independent recomputation** — Validator walks the proof from axiom_set to claim WITHOUT the author's narrative. | Validator | **L2** (requires fresh walk-through) | Manual; Validator re-derives on scratch paper |
| **RC4** | **No circular reasoning** — build a dependency graph of lemmas used; proof of A does NOT implicitly depend on A. | Validator | **L2** (requires graph construction) | Manual graph build + cycle check |
| **RC5** | **Axiom set minimality** — every axiom listed in the axiom_set is actually used in the proof; unused axioms are removed or justified. | Validator | **L2** (requires full proof scan) | Manual audit |
| **RC6** | **Notation consistency** — same symbol means the same thing throughout the document. | Coherencer + Validator | **L1** (mechanical grep for symbol re-use, manual inspection) | grep-based pre-filter; manual collision check |
| **RC7** | **Formula provenance** — every numbered formula has a visible provenance_tag: **Derived** (in-artifact derivation) / **Cited** (external source with concrete pointer) / **Axiomatic** (explicit postulate label) / **Conjectured** (explicit conjecture label). No asserted-without-derivation. | Validator | **L2** (per-formula classification) | `grep -B3 -A1 '\\tag{'` pre-filter; manual bucketing |
| **RC8** | **Contradiction detection** — no two statements in the document are formally inconsistent. Consequence of (1-σ) = 0 tolerance: a single contradiction = ANDON. | Validator + Coherencer | **L2** (requires logical scan) | Manual; Coherencer checks across the corpus |

**L1 vs L2 split:** Research skin is HEAVIER on L2 than article skin because derivation integrity cannot be reduced to grep. Only RC6 is reliably L1 (symbol re-use is mechanically detectable). RC1, RC2, RC3, RC4, RC5, RC7, RC8 all require reading the proof. This is **by design** — research artifacts are derivation-first, so the gate is interpretive.

### 5.2 Relationship to article skin's cite_check C1..C6

**Research skin inherits article's C1..C6 as SECONDARY checks** that run ONLY when the research artifact has external citations. If the artifact cites no external sources (proof from axioms), C1..C6 are skipped entirely. If the artifact cites 3-10 sources (typical research note), C1..C6 run as secondary gates after RC1..RC8.

| When cite_check applies to research | Which checks |
|---|---|
| Artifact cites 0 sources | None — skip all C1..C6 |
| Artifact cites ≥1 source | C1 (bibliography completeness), C3 (DOI syntax), C4 (internal cross-refs) — L1 automated |
| Artifact cites ≥3 sources | C1, C3, C4 + C2 (citation attribution) — add L2 interpretive |
| Artifact cites ≥10 sources or has a full bibliography section | ALL of C1..C6 as defined in article skin — at this point the artifact should also be cross-checked against article skin to decide if it's better classified as `type=article` |

**C6b inheritance:** Article skin's C6b (formula provenance, Skin-DEF-f) is **promoted** in research skin to **RC7** (primary check). Research artifacts are the reason C6b was added in the first place — they have the highest density of formulas whose provenance matters. RC7 is NOT a downgrade or a rename; it is a **promotion** from secondary L2 check to primary RC-series check.

**C5 demotion:** Article skin's C5 (self-citation quantitative ladder, Skin-DEF-e) is **demoted** in research skin to a **footnote** under the cite_check secondary section. Research notes rarely trigger self-citation red flags because they're usually standalone and don't establish an author brand. The ladder is inherited (0-30 / 30-50 / 50-70 / ≥70) for completeness but is not a primary gate.

### 5.3 Verification block for the skin file

```
[method name]: recompute
[command]: Primary — independent re-derivation of every proof step + RC1..RC8 manual audit.
           Secondary (if artifact has citations) — cite_check C1..C6 from article skin.
           LaTeX artifacts compile with `tectonic FILE.tex`; notebook artifacts execute end-to-end.
[success criteria]: all 8 RC checks PASS (RC1..RC8) AND (if citations present) C1..C6 PASS
                    AND derivation_chain is closed from axiom_set to theorem claim
                    AND notation is consistent AND every numbered formula has a visible provenance_tag
                    AND (1-σ) tolerance is zero — no contradictions.
[failure recovery]: RC1 → write the missing proof OR cite the lemma/axiom used;
                    RC2 → add explicit step justification;
                    RC3 → re-derive; if the independent walk fails, the proof is wrong, not the Validator;
                    RC4 → restructure the lemma hierarchy to break the cycle;
                    RC5 → remove unused axioms OR justify why they're listed;
                    RC6 → rename one of the colliding symbols (e.g., α → β) and update cross-references;
                    RC7 → add in-artifact derivation OR concrete external pointer OR axiomatic label OR conjecture marker;
                    RC8 → identify the two inconsistent statements, remove or reconcile one.
[independence check]: Validator walks the proof with only axiom_set + theorem statement visible —
                      the author's narrative is closed. If the independent walk diverges from the
                      author's chain at any step, flag that step as non-obvious and require a
                      more explicit justification (BL-5 phantom coherence avoidance).
```

**Sample-size contract** (inherits article skin's formula recomputation pattern):

```
total_proof_steps = count of numbered proof_steps in the derivation_chain
sample_size       = max( 3, ceil( sqrt(total_proof_steps) ) )
```

Floor of 3 keeps small proofs meaningful. Selection is DETERMINISTIC: (1) the first proof step (tests axiom grounding), (2) a middle step (tests chain integrity), (3) the final step (tests closure onto the claim). Remaining slots fill unrepresented proof sub-sections.

For proofs where `total_proof_steps ≤ 5`, Validator recomputes EVERY step (no sampling — the proof is small enough). Sampling is only for long derivation chains.

**FIXED:** The 8 RC checks, their L1/L2 classification. RC7 promotion. The independence check statement.
**FLEXIBLE:** Exact wording of failure recovery instructions. Narrative prose.

---

# SECTION 6 — RT Phase Protocol for research

Research artifacts adjust the canonical RT protocol because the work profile is different from code AND from article.

### 6.1 Three RT invocation points

1. **RT-0 (Visionary solo, RECOMMENDED): claim + scope declaration.** Before any RT-1. Visionary alone evaluates: is this a theorem (proof obligation) or a conjecture (label only)? What is IN scope, what is OUT? Is the axiom_set known? A YES from Visionary unlocks RT-1. Output is a single-paragraph decision:
   - "APPROVED: theorem T with axiom_set A_1..A_k; scope = X, out-of-scope = Y, Z; proceed to RT-1."
   - OR "APPROVED (CONJECTURE): labelled as Conjecture C; no proof obligation; documented as open question."
   - OR "OUT-OF-SCOPE: claim is not falsifiable / axiom set is undefined; defer."

2. **RT-1 (mandatory, full 5-role): proof outline + strategy + plan.** Before any proof-step drafting. **Sequential role execution within the round** (Analyst → Builder → Validator → Coherencer), not parallel. Rationale: a proof step depends on the previous step, so agents cannot work in parallel without creating inconsistency. Analyst produces the proof outline (strategy + lemma hierarchy + axiom dependencies); Builder drafts the first proof step; Validator verifies the step; Coherencer checks notation. Then next step. This is a **sequential-within-round** pattern and is stricter than the canonical RT.

3. **RT-2 (mandatory, pre-submission): full gate.** Before the research artifact is committed as "final" or shared externally. Runs:
   - Validator L2 **full re-derivation** of the entire proof (not a sample) — small proofs (≤5 steps) recompute everything; larger proofs follow the sample-size contract in 5.3.
   - Coherencer **axiom minimality check** (RC5) across the full artifact.
   - Coherencer **cross-proof notation audit** (RC6) across neighboring artifacts in the corpus.

### 6.2 Single Builder with sequential rhythm

The research Builder is a **SINGLE agent** writing the proof sequentially. No parallel splits. Unlike article skin which allows "single Builder, section-by-section bilingual rhythm," research skin requires Builder to draft proof steps **in dependency order** — a step cannot be drafted before the step it depends on.

**Exception (L/XL only):** For a multi-proof research notebook (>3 independent proofs), two Builders may own different proofs in parallel — Builder A owns proof 1 & 2, Builder B owns proof 3. Coherencer gate between Builder completion and Validator is MANDATORY to check for notation collisions across the parallel proofs.

### 6.3 Pipeline block

```
Research pipeline (FIXED):
RT-0 (Visionary solo) → claim + scope + axiom_set approval
RT-1 (full 5-role, sequential within round) → proof outline + strategy + first draft
  For each proof step i:
    Analyst (next-step plan) → Builder (draft step i) → Validator (RC check step i) → Coherencer (notation check)
  Until derivation_chain reaches the claim
RT-2 (full 5-role) → RC1..RC8 full audit + (if citations present) C1..C6
  + independent full re-derivation (small proofs) or sample-size re-derivation (large proofs)
Commit the research artifact (LaTeX file / notebook / markdown)
Preprint / journal submission / corpus insertion → outside EraDev scope
```

---

# SECTION 7 — Checklists

### 7.1 Pre-Generation Checklist (Check-First, BL-17, BL-21 — research specialization)

Run BEFORE any proof-step drafting begins.

- [ ] **1. AXIOM SET:** Explicit axiom list documented. No implicit "standard assumptions."
- [ ] **2. NOTATION TABLE:** Every symbol used in the proof has a declared meaning. No symbol reuse between proofs in the same artifact.
- [ ] **3. CLAIM STATEMENT:** Theorem stated formally with quantifiers and scope. Conjectures labelled separately.
- [ ] **4. PROOF STRATEGY:** Named strategy (induction / contradiction / construction / contrapositive / computation / direct). No "figure it out as you go."
- [ ] **5. LEMMA HIERARCHY:** Dependencies among supporting lemmas formed as a DAG, no cycles.
- [ ] **6. FORMAT:** For LaTeX artifacts, preamble read and notation macros defined. For notebooks, computational environment verified.
- [ ] **7. CORPUS POSITION (if applicable):** Adjacent proofs read for notation and axiom overlap.
- [ ] **8. RT-0 CONFIRMATION:** Visionary has confirmed the claim is a theorem (proof obligation), conjecture (label only), or out of scope.

### 7.2 Post-Generation Checklist (Jidoka gate)

Run AFTER Builder completes the derivation_chain and BEFORE Validator starts RT-2.

- [ ] **1. DERIVATION_CHAIN CLOSED:** Every step from axiom_set to theorem claim is explicit. No "as is well known."
- [ ] **2. COMPILE:** LaTeX typesets without errors; notebook executes end-to-end.
- [ ] **3. PROVENANCE_TAGS:** Every numbered formula has a visible provenance_tag (Derived / Cited / Axiomatic / Conjectured).
- [ ] **4. NOTATION CONSISTENCY:** Notation table matches every symbol usage in the proof.
- [ ] **5. AXIOM MINIMALITY:** Every axiom in the axiom_set is actually used.
- [ ] **6. NO CONTRADICTIONS:** No two statements in the artifact are formally inconsistent.
- [ ] **7. CITATIONS (if present):** C1-C4 PASS; C5-C6 noted for L2.
- [ ] **8. BILINGUAL (if project requires):** RU and EN versions drafted simultaneously per BL-19.

---

# SECTION 8 — Examples (3 concrete — mandatory)

### 8.1 Example 1: Missing proof step (RC1 / RC2 failure)

- **Input:** "Prove Lemma 4.1: for any ODTOE observer x, if F(x) > 0.7 and E(x) > 0.7, then B(x) > 0.4."
- **Scenario:** Builder drafts the proof:
  - Step (1): Assume F(x) > 0.7 and E(x) > 0.7 [given]
  - Step (2): Let σ(x) = 0.3 and Λ(x) = 0.6 [typical values]
  - Step (4): Therefore B(x) = 0.7 × 0.7 × 0.7 × 0.6 > 0.4 [by B-formula]
  - NO step (3). Builder jumped from step 2 to step 4 without explicitly applying the B-formula with numerical substitution.
- **What Validator finds:** During RC1 (proof existence) and RC2 (step attribution), Validator reads the chain and notes that step 4 is NOT attributable to step 2 alone. Step 3 is missing — the step that formally applies the B-formula with the assumed σ and Λ values.
- **Catching role:** **Validator** (RC1 + RC2 are L2, interpretive).
- **Phase:** **RT-1** (step-by-step Validator check) OR **RT-2** (full audit) — either catches it.
- **Fix:** Builder inserts step (3): "Step (3): By B = F × E × (1-σ) × Λ with F=0.7, E=0.7, σ=0.3, Λ=0.6, we have B = 0.7 × 0.7 × 0.7 × 0.6." The derivation_chain now closes.
- **Why article skin's cite_check would miss this:** The proof doesn't cite any external paper. C1-C6 all PASS trivially (no citations to check). Only RC1/RC2 catch the missing step. This example is the didactic case for why **research skin's verification is recompute-first, not cite-first**.

### 8.2 Example 2: Circular reasoning (RC4 failure)

- **Input:** "Prove Theorem 5.2: phantom coherence implies low B-quality."
- **Scenario:** Builder's proof strategy:
  - Theorem 5.2 states: "If S_team > 0.8 and B_mean < 0.4, then team is in phantom coherence."
  - Proof cites Corollary 3.7: "In phantom coherence, B_mean < 0.4."
  - Corollary 3.7 in turn was proved earlier using Theorem 5.2.
  - Builder's chain: Theorem 5.2 → Corollary 3.7 → Theorem 5.2.
- **What Validator finds:** During RC4 (no circular reasoning), Validator builds the dependency graph of lemmas used:
  - Theorem 5.2 depends on Corollary 3.7.
  - Corollary 3.7 depends on Theorem 5.2.
  - Cycle detected: {Theorem 5.2, Corollary 3.7}.
- **Catching role:** **Validator** (RC4 is L2 — requires graph construction).
- **Phase:** **RT-2** (pre-submission full audit) — dependency graphs are most reliably built when the full artifact is available.
- **Fix:** Builder restructures. Option A: prove Theorem 5.2 directly from BL-5 (phantom coherence detection) and the B-formula, without relying on Corollary 3.7. Option B: prove Corollary 3.7 directly from the B-formula (not from Theorem 5.2), then use it in Theorem 5.2 without cycles. Either breaks the cycle.
- **Why article skin's cite_check would miss this:** No bibliography citations involved — this is intra-document cross-reference. C4 (internal cross-refs) checks that `\ref{}` resolves, not that the dependency chain is acyclic. Only RC4 explicitly catches circular reasoning. Research skin promotes this to a first-class check because it's a common failure mode in research notebooks where lemmas are written in draft order, not dependency order.

### 8.3 Example 3: Notation collision (RC6 / Coherencer failure)

- **Input:** "Draft a research notebook with 6 proofs of ODTOE-related lemmas."
- **Scenario:** Builder drafts the notebook. In §3 (proof of Lemma 3.1 on phase dynamics), `α` is introduced as "the scaling coefficient for time evolution, α ∈ (0, 1)." In §5 (proof of Lemma 5.1 on observer geometry), `α` is used as "the phase angle of the observer's orientation quaternion, α ∈ [0, 2π)." Builder never notices the collision — §3 and §5 were drafted in different sessions and the notation table was not updated.
- **What Coherencer finds:** During RC6 (notation consistency), Coherencer greps for symbol reuse across the artifact:
  - `grep -n '\\alpha' research_notebook.tex` returns ~40 occurrences.
  - Inspection reveals `α` carries two incompatible meanings.
  - The notation table at the top of the notebook only defines the §3 meaning.
  - §5 uses `α` without declaring the new meaning.
- **Catching role:** **Coherencer** (RC6 is Coherencer-primary, Validator-secondary). This is the canonical Coherencer failure-mode — divergent meanings of the same symbol across parallel work.
- **Phase:** **RT-2** pre-submission OR Builder's own Jidoka Q5 (notation collision check) at **RT-1**. Coherencer is the enforcer but Builder should catch their own collision first.
- **Fix:** Rename one of the colliding symbols. In §5, replace `α` with `β` everywhere the phase-angle meaning is used. Update the notation table to include both `α` (§3 meaning) and `β` (§5 meaning). Re-compile and verify no remaining conflicts.
- **Parallel with article skin Example 2:** The `\Lambda` collision in article skin Example 2 is the same pattern — a symbol used with different meanings in different sections. Research skin inherits the pattern and makes it RC6, first-class.

---

# SECTION 9 — BL Inheritance

### 9.1 Universal BL (22 entries — all inherited unchanged)

Builder produces a table of 22 rows copied directly from article skin Section "Domain-Specific Bootstrap Lessons > Universal BL inherited." Each row's "Applicability" column is rewritten for research artifacts, but the BL number, title, and core rule are UNCHANGED.

Example rewrites:

| BL | Title | Applicability to research work (REWRITE from article skin) |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Applies unchanged — a fresh research project starts with Λ=0.5; accumulates as proofs land in the corpus |
| BL-5 | Phantom Coherence Detection | Applies unchanged — research-specific manifestation is "Builder and Validator agree on a proof step but neither walked it independently" |
| BL-17 | Pre-Generate Verification = Prevention | **Critical for research** — Check-First in Section 7.1 (axiom_set + notation table + strategy + lemma hierarchy before proof drafting) is the research-specific BL-17 |
| BL-19 | Bilingual Files Simultaneous | **OPTIONAL for research** — if project declares bilingual, the 8-file rule applies; otherwise monolingual research artifacts are complete with a single language (DIFFERENT from article skin where BL-19 is always enforced) |
| BL-21 | Format Specifications Are Inputs | **Critical for research** — LaTeX preamble OR notebook environment spec must be read before drafting (parallels article skin's preamble rule) |
| BL-28 | Agent Prompt Must Include Explicit Context | Applies unchanged — research-task agent prompts name the skin file path AND role file path |
| BL-29 | Verify Established Terminology Before Generating | **Critical for research** — notation table must be read before drafting to avoid RC6 collisions |

Builder MUST produce the full 22-row table. Builder MAY shorten the applicability column wording but MUST keep it informative. Builder MUST NOT omit any of the 22 BL.

### 9.2 Code-adapter BL (8 entries — handled individually)

Same structure as article skin Section "Code-adapter BL handled individually." Research-specific verdicts:

| BL | Title | Verdict for research | Notes |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | **Research equivalent: BL-R1** | Submission/publication of a research result requires PRE-FLIGHT (informal reviewer → preprint → formal submission). See BL-R1. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Applies unchanged** | Research equivalent: 3+ consecutive revisions of the same proof step = STOP, re-think proof strategy (often means the strategy is wrong, not the step). Transfers cleanly; no new BL-R. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | **Research equivalent: BL-R2** | Before committing any proof edit, Builder must run LaTeX compile AND RC1..RC5 self-audit AND (if applicable) notebook execution. See BL-R2. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **N/A for research** | Research has no feature flags. A proof either holds or does not hold — no toggle mechanism. |
| **BL-14** | Rollback Plan Before Deploy | **Research equivalent: BL-R3** | Before submitting a research result for peer review, Builder must document the retraction / withdrawal plan. See BL-R3. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Research equivalent: BL-R4** | Before RT-1, every cited axiom / external lemma must be verified: the axiom is stated correctly, the external lemma is from a trusted source, the proof does not silently rely on an un-stated assumption. See BL-R4. |
| **BL-24** | Single-Responsibility Commits | **Applies unchanged** | Research equivalent: one commit = one proof OR one proof section. Transfers cleanly; no new BL-R. |
| **BL-25** | Error Path Coverage Matrix | **N/A for research** | Research does not have runtime error paths. The analog would be "what if the proof is wrong" but that's BL-R3 (retraction plan). |

### 9.3 Research-specific BL (BL-R namespace — separate budget)

These 4 BL live in the research skin file ONLY. They do NOT add to the main 30-BL budget. They parallel article skin's BL-A1..A4.

**BL-R1: Submission is a Release Event (research adaptation of BL-2)**
- **Source:** Adapted from BL-2 for research.
- **Rule:** Submitting a research result to a reviewer, preprint server, or journal is a release event. It requires: informal peer review first (one trusted mathematician), preprint upload as canary, 7-day silence window before considering the submission "stuck," and a withdrawal plan.
- **Why:** A wrong proof circulating as "published" is harder to retract than a wrong line of code. Canary via informal peer constrains the damage.
- **Applies to:** Visionary (approve submission), Builder (informal peer first), Validator (pre-submission gate).

**BL-R2: Verify Before Commit — Derivation Integrity Gate (research adaptation of BL-6)**
- **Source:** Adapted from BL-6 for research.
- **Rule:** Before committing any proof edit, Builder MUST run: (a) LaTeX compile (`tectonic FILE.tex`) with no errors, (b) RC1 + RC2 self-audit on the edited step, (c) if the edit is a formula, the provenance_tag must be explicit. Commit is REJECTED otherwise.
- **Why:** A proof edit that "looks right" but breaks the chain is the research equivalent of unverified code. Cost of a manual RC1/RC2 pass: minutes. Cost of a broken derivation in the corpus: hours per reader.
- **Applies to:** Builder, Validator, META.

**BL-R3: Retraction Plan Before Submission (research adaptation of BL-14)**
- **Source:** Adapted from BL-14 for research.
- **Rule:** Before a research result is submitted to any external audience (preprint, reviewer, journal), Builder MUST document the retraction procedure: who to contact, what the retraction notice would say, what the corpus-level rollback looks like (e.g., "remove from corpus, mark as withdrawn, note in changelog, inform dependent proofs"). If Builder cannot describe how to undo a submission, Builder does not have permission to submit.
- **Why:** Post-submission pressure is when cognitive load peaks. A pre-written retraction plan executes mechanically.
- **Applies to:** Visionary (approve retraction plan), Builder (write it), Coherencer (store in MEMORY).

**BL-R4: Axiom & Lemma PRE-FLIGHT (research adaptation of BL-22)**
- **Source:** Adapted from BL-22 for research.
- **Rule:** Before RT-1 begins on any research task, Analyst MUST verify every axiom and every external lemma the proof will depend on: (a) axiom statement is unambiguous, (b) external lemma's source is a trusted published result, (c) the cited lemma's statement matches what the proof uses (verbatim check). Unverified dependencies = Builder BLOCK at RT-1.
- **Why:** A proof that silently relies on an unstated axiom is the research equivalent of code that silently depends on an unstated environment variable. BL-R4 is the L1 pre-flight that prevents the worst cases.
- **Applies to:** Analyst (RT-1), Validator (RT-2 re-verification), Builder (block without artifact).

### 9.4 BL budget summary

- Universal BL inherited: **22** (unchanged)
- Code-adapter BL applied unchanged: **2** (BL-3, BL-24)
- Code-adapter BL with research equivalents: **4** (BL-2, BL-6, BL-14, BL-22 → BL-R1..R4)
- Code-adapter BL N/A for research: **2** (BL-8, BL-25)
- Research-specific BL (BL-R namespace, separate budget): **4** (BL-R1..R4)

**Total BL a research agent carries: 22 universal + 2 transferred code-adapter + 4 BL-R = 28 BL.**

This matches article skin's count — intentional parallel. Both article and research skins carry 28 BL each, which stays within the 30-BL cap because BL-A and BL-R namespaces are each scoped to their own skin and do NOT compound.

### 9.5 Project lessons.md integration (inherits Skin-DEF-g pattern)

Same rule as article skin: the skin inherits 22 universal BL and defers to `projects/{PROJECT}/lessons.md` for project-specific rules. On conflict, the project lessons.md takes precedence. Temporal exception applies (rules introduced AFTER the artifact's file mtime are LEGACY INFO, not FAIL).

**Applies to:** Validator (RT-2 primary reader), Coherencer, Builder (pre-commit), Analyst (RT-1 Check-First).

---

# SECTION 10 — Co-existence clause and Hand-off to Builder

### 10.1 Co-existence clause (CRITICAL — do not omit)

The research skin and article skin are **siblings in the same modality** (both pin `B_modality: research` with identical weights). They are NOT alternatives to each other; they address different artifact classes:

- **Article skin applies when:** the artifact is a full scientific paper — abstract, introduction, methods, results, discussion, conclusion, bibliography. Typical length: 2000-10000 words. Typical bibliography: 20-50 entries.
- **Research skin applies when:** the artifact is a standalone proof, a derivation chain, a lemma sheet, a mathematical notebook, a working derivation, or a preprint fragment that lacks the full paper architecture. Typical length: 300-3000 words. Typical bibliography: 0-10 entries.

**A project CAN use both skins.** If a project has:
- `domain.type: article` AND a `notebooks/` subdirectory with standalone derivations,
the project MAY declare per-task classification in `config.md`:
```yaml
domain:
  type: article  # primary
  skin: templates/domain_skin.article.md
  task_overrides:
    - path_pattern: "notebooks/*.tex"
      skin: templates/domain_skin.research.md
```

META's per-task classification loads the article skin for files matching the primary pattern and the research skin for files matching `notebooks/*.tex`. Both skins are active simultaneously in the session; agents load the appropriate skin based on the file being edited.

**A project MAY use ONLY the research skin** if its output is exclusively standalone derivations with no full paper architecture. Such a project declares `domain.type: research` directly.

**A project MAY use ONLY the article skin** (the ODTOE case). Such projects have research-heavy content but package it as full papers.

**The two skins do NOT mutually exclude.** Builder MUST write the co-existence clause as a dedicated paragraph in the skin file — do not bury it in a footnote.

### 10.2 Known Out-of-Scope (OOD) for research modality

Tasks that look like research but fail v9's text-discrete AND-gate:

- **Speculative philosophy.** A claim like "consciousness is computation" has no falsifiable formulation and no proof chain. Fails on verification. Route to Visionary RT-0 for OOD classification.
- **Un-axiomatizable derivations.** If the derivation depends on assumptions that cannot be stated formally (e.g., "assume standard intuition about X"), there is no axiom_set and RC4/RC5 are meaningless. Fails on Check-First item 1.
- **Running mathematical experiments / computer algebra sessions without a terminal proof.** If the output is a set of exploratory computations with no theorem, the artifact is a notebook in the `code` sense, not a research proof. Route to code skin.
- **Opinion essays on research practice.** A paper about "how mathematicians should write proofs" is a position paper (article skin territory, currently OOD per v9 because review/position papers are deferred to v10), not a proof. Route to Visionary RT-0.

### 10.3 Hand-off to Builder

| Field | Value |
|---|---|
| File path | `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.research.md` |
| Expected size | **300-450 lines** (MUST be less than article skin's ~645 to enforce inherits-not-duplicates discipline). If Builder's draft exceeds 450 lines, Builder should check for duplicated article skin content and inherit via reference instead. |
| Sections to copy from article skin verbatim | Footer template; header block structure; BL-R namespace pattern (parallel to BL-A); temporal exception sub-section pattern; project lessons.md integration rule |
| Sections to rewrite for research | Section 1 (Domain Identification — `verify.method: recompute`, `Sibling: article skin`); Section 2 (Vocabulary — 18 inherited + 4 new); Section 4 (Per-role overrides — recompute-first language); Section 5 (Verification — 8 RC checks, not 6 cite_checks); Section 6 (RT protocol — sequential-within-round); Section 8 (3 research-specific examples: missing step, circular reasoning, notation collision); Section 10 (Co-existence clause — NEW, not in article skin) |
| FIXED fields (do not alter) | `Type: research`; `Modality: research`; `verify.method: recompute`; `Sibling: templates/domain_skin.article.md`; B_research weights (F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15); (1-σ) zero-tolerance convention; 4 new vocabulary row names (proof_step, axiom_set, derivation_chain, provenance_tag); 8 RC check names (RC1..RC8); BL-R1..R4 namespace; 22 universal BL count |
| FLEXIBLE fields | Narrative prose; exact wording of examples; BL applicability column rewrites; order of sections within the skin file (as long as all 10 sections are present) |
| Pre-commit check | Run `wc -l templates/domain_skin.research.md` — if > 450 lines, check for duplication from article skin and replace with inheritance references |
| Hand-off confirmation | Builder produces the skin file, runs a Jidoka self-check with B_research weights, commits with message "v9 Phase 2.A: research skin first draft (Builder from Analyst spec)" |

---

# B-check (Analyst Jidoka — research weights because this spec IS research-mode work on a research artifact)

Per eradev.md Section II.1 `B_research` weights (0.30, 0.20, 0.35, 0.15):

| Component | Score | Justification |
|---|---|---|
| **F (Focus)** | **0.90** | Read Analyst role file in full, template, complete article skin (~645 lines in chunks), code skin, article spec sections 1-5, both smoke tests, eradev.md Section II.1 weight table, BL universal header + code-adapter header. Coverage is comprehensive for the narrow task of writing a sibling skin. One minor gap: did not read `BOOTSTRAP_LESSONS_universal.md` BL-9..BL-32 in full (only sampled) — acceptable because article skin's BL table is the reference. |
| **E (Alignment)** | **0.92** | Spec directly addresses META's request: research skin is a "little sibling" of article skin with narrower artifact scope, recompute-first verification, 4 new vocabulary rows, 8 RC checks replacing 6 cite_checks, co-existence clause, all 10 required sections present, 3 examples match the requested types (missing step / circular reasoning / notation collision), BL table parallel to article skin with BL-R namespace. |
| **(1-σ) (Consistency)** | **0.92** | No conflict with article skin (siblings, explicit co-existence clause), no conflict with eradev.md Section II.1 (weights identical), no conflict with Phase 0.A schema (research already in enum), no conflict with meta.md delegation rules (skin is L2 metadata). Potential minor collision: article skin's "C5 quantitative ladder" is inherited as a footnote — this is documented but not duplicated. One tension acknowledged: (1-σ) zero-tolerance is a CONVENTION not a formula change, and the spec says so explicitly. |
| **Λ (Experience)** | **0.85** | Consulted article skin's two smoke tests to calibrate: the formula provenance gap (C6b → RC7) and the self-citation ladder (C5 → footnote) are BOTH direct lessons from the smoke test reports. BL-17 + BL-19 + BL-21 + BL-29 referenced specifically for their research-specific manifestations. Acknowledged honest overlap in Sections 2, 9.1. Could be higher if I had consulted a concrete research-notebook project, but no live research-modality project exists yet in the repo — this is a cold-start skin. |

**B = 0.30 × 0.90 + 0.20 × 0.92 + 0.35 × 0.92 + 0.15 × 0.85**
**B = 0.270 + 0.184 + 0.322 + 0.1275**
**B = 0.9035**

**Multiplicative form for cross-check (weak-link principle):**
B_mult = 0.90^0.30 × 0.92^0.20 × 0.92^0.35 × 0.85^0.15
       ≈ 0.9689 × 0.9834 × 0.9715 × 0.9758
       ≈ 0.9036

Both forms agree at B ≈ 0.90. GREEN. No component below 0.3 threshold. Minimum component is Λ=0.85 (well above Andon line).

**Verdict:** Spec is Builder-ready. Hand off to Builder for draft of `templates/domain_skin.research.md` in Phase 2.A Wave 2.

---

*End of spec. Analyst signs off. Builder may begin.*
