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

## Purpose / When META Loads This Skin

META loads this skin when a project's `config.md` declares `domain.type: research` and `domain.skin: templates/domain_skin.research.md`. When loaded, the skin is passed to every spawned role agent in addition to `roles/{role}_EN.md`. It does NOT replace the role file — it provides vocabulary, focus overrides, verification expansion, RT adjustments, examples, and a BL table specific to standalone-derivation work (proofs, lemma sheets, mathematical notebooks, preprint fragments).

**Little sibling to `templates/domain_skin.article.md`.** Both skins pin `B_modality: research` with identical weights. They diverge on WHICH verification surface is primary: article skin leads with `cite_check` (bibliography-first), research skin leads with `recompute` (derivation-first). See Section 10 for the co-existence clause.

---

## Vocabulary Mapping

This skin overrides the abstract role-file vocabulary for research tasks. 22 rows — 18 inherited from article skin (semantics unchanged, marked `[INHERIT]`), 4 new research-specific rows.

| # | Abstract term | Research meaning | Source |
|---|---|---|---|
| 1 | **artifact** | a proof / derivation / lemma sheet / mathematical notebook / standalone theorem statement — NOT a full-paper architecture | `[INHERIT article row 1]`, scoped narrower |
| 2 | **function** | theorem / lemma / proposition / corollary — the addressable unit is a named mathematical statement; labelled equations are secondary | specialized from `[article row 2]` |
| 3 | **module** | proof section (`\section*{...}` or notebook cell) containing one named statement and its proof | `[INHERIT article row 3]`, narrower scope |
| 4 | **compile** | typeset math / render LaTeX; for notebook-style research, execute the notebook end-to-end without errors | specialized from `[article row 4]` |
| 5 | **test / tests pass** | proof verification / independent recomputation — Validator walks every step without the author's narrative | `[article row 5]` — recompute PROMOTED to primary; cite_check DEMOTED |
| 6 | **verify** | independent recomputation / proof walk-through — every claim must be independently derivable or cited to an axiom | `[article row 6]` specialized |
| 7 | **validate** | run the 8 RC checks RC1..RC8 (Section 5) | `[article row 7]` — "8 RC" replaces "8 verification" |
| 8 | **build** | produce derivation_chain from axiom_set to claim with provenance tags on every formula | `[article row 8]` specialized |
| 9 | **runtime** | reader's proof-following time — how long an expert reader spends walking the proof | `[INHERIT article row 9]` |
| 10 | **spec / specification** | problem statement / research question — what is being proved, what is being conjectured, what is OUT of scope | specialized from `[article row 10]` |
| 11 | **feature / feature flag** | contribution / claim — a new lemma, proposition, or theorem added to the artifact | `[INHERIT article row 11]`, narrower scope |
| 12 | **API / API endpoint** | axiom_set / foundational reference — the proof's external contract is the axioms it depends on | `[article row 12]` — "axiom_set" replaces "DOI entry" (research artifacts often have 0 citations) |
| 13 | **bug** | unproven claim / circular reasoning / invalid derivation step / notation collision / unstated axiom | `[article row 13]` — shifts from "citation gap" to "derivation gap" |
| 14 | **refactor** | restructure proof chain — reorder lemmas, change strategy (induction → contradiction) without changing the result | `[article row 14]` specialized |
| 15 | **code review** | peer math review — another mathematician walks the proof independently | `[article row 15]` specialized |
| 16 | **PR / pull request** | submission to a preprint server / handoff to a reviewer / proposed addition to a derivation notebook | `[INHERIT article row 16]`, narrower scope |
| 17 | **commit** | signed-off change to a proof step, with Jidoka gate passed (derivation integrity + notation consistency) | `[INHERIT article row 17]` |
| 18 | **deploy / push to prod** | submit to preprint / share with peer reviewer / commit to main branch of research notebook | `[INHERIT article row 18]` |
| 19 | **production** | published version (on arXiv, in a research journal, or as a load-bearing lemma in the corpus) | `[INHERIT article row 19]` |
| 20 | **smoke test** | sanity check — read the theorem statement and the first proof step, verify claim and method are matched | `[INHERIT article row 20]` |
| 21 | **glossary / canonical terms** | notation table — the artifact-local symbol→meaning mapping (α = phase, β = coupling, etc.) | `[article row 21]` — artifact-local, not corpus-wide |
| 22 | **symbol collision** | two sections of the same artifact using the same symbol with different meanings | `[INHERIT article row 22]` |
| 23 | **proof_step** | **NEW.** A single addressable derivation move with justification: "from eq(4) and eq(5) by substitution → eq(6)". Cites a lemma, axiom, previous step, or algebraic identity | NEW — research artifacts are chains of proof_steps |
| 24 | **axiom_set** | **NEW.** The explicit list of postulates / axioms / foundational assumptions the proof depends on. The proof's "external API contract" | NEW — public interface to the rest of mathematics |
| 25 | **derivation_chain** | **NEW.** Full sequence of proof_steps from axiom_set to theorem claim. A chain with a missing link = proof INCOMPLETE, not WIP | NEW — unit of provenance |
| 26 | **provenance_tag** | **NEW.** Visible marker on every formula stating its origin: **Derived** / **Cited** / **Axiomatic** / **Conjectured** | NEW — parallels article's Skin-DEF-f (promoted to first-class vocabulary) |

**Count:** 22 inherited or specialized + 4 new = 26 rows. Within the spec's ±3 budget. Unified with `templates/domain_skin.article.md`: any collision is resolved in favor of the artifact class — standalone proof/notebook → this table; full paper → article skin. Both skins can coexist in a session via per-task classification (Section 10).

---

## Modal B-formula (research weights — identical to article skin)

This skin pins `B_modality: research`. Weights from `eradev.md` Section II.1 (identical to article skin):

| Component | Weight | Research skin rationale |
|---|---|---|
| F (Focus) | **0.30** | Second-dominant. Writing a proof without reading the axiom_set and adjacent lemmas produces work orphaned from the corpus. Axiom scanning replaces article skin's literature scanning as the dominant Focus gate. |
| E (Alignment) | **0.20** | Alignment to operator intent matters but is subordinate to logical correctness. You cannot be "aligned with" an invalid proof. |
| (1-σ) (Consistency) | **0.35** | **Dominant.** A single contradiction falsifies the entire proof. See "(1-σ) tolerance convention" below. |
| Λ (Experience) | **0.15** | Lowest weight. Memory accelerates but a fresh corpus sweep can cold-start a new derivation. |

Divergence from article skin is in verification surface (Section 5), not in modal weights.

### (1-σ) zero-tolerance convention (research specialization — stricter than article)

Research skin emphasizes (1-σ) **by convention**, even though the numerical weight is identical (0.35).

- Articles tolerate minor inconsistencies (orphan biblio entry, table rounding error, `--` vs `—`) — article Validator can report "PASS WITH NOTES."
- A standalone proof does NOT tolerate a single contradiction. If proof P uses both "X" and "¬X" as hypotheses at different steps, the entire proof collapses. There is no graceful degradation.

**Practical consequence:** Research Validator's Jidoka (1-σ) score is binary-ish. Any detected contradiction in the derivation_chain → (1-σ) = 0 → B = 0 → Andon. This is STRICTER than article skin's graded tolerance. The convention does not change the formula — it changes the tolerance threshold: research = zero, article = graded.

---

## Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` **unchanged**. The skin adds DOMAIN-SPECIFIC focus anchors, artifact definitions, failure modes, and Jidoka specializations with **derivation-first** language (not bibliography-first). Each role's primary failure mode is research-specific — unproven assertions, not citation gaps.

### Visionary (research focus)

- **FIRST attention anchor (A_F override):** Name the **central claim** + enumerate what is **OUT of scope** explicitly. True North = *"this artifact proves X under axiom_set A; it does NOT prove Y, Z, or variants outside A."*
- **Artifact definition:** The theorem statement + its scope declaration. Not the proof, not the LaTeX, not the notebook — the *argument's claim and boundaries*.
- **Primary failure mode:** Approving a proof attempt whose scope is not articulated — Builder then drafts a proof that silently expands scope mid-chain.
- **Secondary failure mode:** Treating a **conjecture** as a **theorem**. Conjectures require explicit labeling (`provenance_tag: Conjectured`) and no proof obligation; theorems require a closed derivation_chain.
- **Jidoka self-check:** Q1 theorem-or-conjecture? / Q2 scope OUT enumerated? / Q3 axiom_set has known gaps or corpus collisions? / Q4 claim falsifiable or philosophical (→ OOD)?
- **Upstream reference:** `visionary_EN.md` strategic-question pattern. Research adds the **scope declaration** as a hard pre-Builder gate not found in the base role file.

### Analyst (research focus)

- **FIRST attention anchor (A_F override):** Read the proof strategy choices (induction, contradiction, construction, contrapositive) + the axiom_set + adjacent lemmas. If any axiom is unstated, STOP and demand axiom declaration before producing a plan.
- **Artifact definition:** A proof decomposition: (1) proof strategy, (2) lemma hierarchy DAG, (3) axiom dependencies, (4) per-step justification requirement. Analyst output is a **proof outline table**, not prose.
- **Primary failure mode:** Skipping axiom declaration. A plan that says "apply standard real analysis" without naming which axioms are used is research skin's BL-17 violation.
- **Jidoka self-check:** Q1 strategy named? / Q2 each step justified (axiom/lemma/identity)? / Q3 axiom_set minimal? / Q4 notation collisions with adjacent lemmas? / Q5 lemma hierarchy acyclic?
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
  System dependencies: [LaTeX packages, math software, reference manager]
  B-check: F=_ E=_ (1-σ)=_ Λ=_ → B=_
  ```

### Builder (research focus)

- **FIRST attention anchor (A_F override):** Read the axiom_set + Analyst proof outline + notation table + any adjacent lemmas to be cited. Do NOT start writing proof steps until all four are loaded. Research-specific enforcement of BL-17 + BL-21.
- **Artifact definition:** The full derivation_chain from axiom_set to theorem claim, **with every step carrying a provenance_tag**. A proof without provenance tags is INCOMPLETE, not WIP.
- **Primary failure mode:** Hand-waving justifications ("as is well known," "by standard argument," "trivially"). Research skin's equivalent of an unsupported claim — RC1 violations. Mitigation: every step must cite an axiom, lemma, previous step, or be labelled as a reduction Validator must verify.
- **Second failure mode:** Copying a formula from an external source without a visible provenance_tag — quoting `[3]` without a page/section pointer is exactly article skin's DEF-5. Mitigation: every externally-attributed formula must include a concrete pointer (`[3] Theorem 2.4` or `[3] §5, eq. (12)`).
- **Third failure mode (research-specific):** Silent scope expansion — starting a proof for "X holds under A" and mid-chain concluding "X holds in general." Mitigation: Builder's Jidoka Q3 (scope-drift check).
- **Jidoka self-check:** Q1 axiom_set + notation table + outline + adjacent lemmas read (F)? / Q2 each proof step justified (E)? / Q3 scope constant, no drift (1-σ)? / Q4 every numbered formula has provenance_tag (Λ, promoted from C6b)? / Q5 notation consistent with table (1-σ)?

### Validator (research focus)

- **FIRST attention anchor (A_F override):** Read the theorem statement + axiom_set + derivation_chain. Then close the Analyst's outline and walk the proof **INDEPENDENTLY** — Validator simulates a peer math reviewer who receives the proof with no author context. Validator runs all 8 RC checks; Validator does NOT trust Builder's Jidoka as a substitute.
- **Artifact definition:** The derivation_chain IN ITS FINAL FORM — exactly what a journal math reviewer would see. Validator's job is to break the proof if it can be broken.
- **Primary failure mode:** Reading the proof with the author's context ("I see what they're doing") and missing the gap. Independent recomputation from only the axiom_set + theorem statement is the antidote.
- **Secondary failure mode:** Trusting Builder's provenance tags without verifying. A tag `[DERIVED: from eq (4)]` might claim eq(4) implies the result when actually eq(4) is necessary but not sufficient. Validator AUDITS every tag against the formal derivation.
- **Tertiary failure mode:** Missing a **circular** derivation where proof of A uses corollary B which depends on A (often via a long intermediate chain). RC4 is the dedicated check.
- **Jidoka self-check:** Q1 all 8 RC checks run? / Q2 RC1 every lemma has a proof? / Q3 RC2 every step cites a previous step/lemma/axiom? / Q4 RC3 independent walk completed? / Q5 RC4 dependency graph acyclic? / Q6 RC5 axiom_set minimal? / Q7 RC6 notation consistent? / Q8 RC7 every formula has verified provenance_tag? / Q9 RC8 no formal contradictions?

### Coherencer (research focus)

- **FIRST attention anchor (A_F override):** Read the research artifact + adjacent corpus artifacts (notation tables of neighboring proofs, axiom_sets of related theorems). Coherencer cares about *this proof's fit with the neighboring corpus*.
- **Artifact definition:** (old corpus) ∪ (this proof) = new corpus. Coherencer checks that the new corpus remains coherent. This is L2 Coherencer work (cross-team coherence, `coherent_EN.md` Levels).
- **Primary failure mode:** Notation collision across proofs in the same artifact — the classic `α` example (see Example 3). Different proofs silently redefining the same symbol breaks reader continuity.
- **Secondary failure mode:** Axiom set drift — proof A uses "Axiom X = choice" and proof B in the same artifact uses "Axiom X = replacement" without declaring they are different.
- **Tertiary failure mode:** Cross-proof dependency silently broken. Proof B cites Lemma 4.2, but Lemma 4.2 in proof A has a slightly different formulation — citation resolves but semantics fail. Coherencer checks that cross-proof references match verbatim.
- **Jidoka self-check:** Q1 symbols consistent with corpus notation table? / Q2 axiom collisions with adjacent artifacts? / Q3 cross-proof lemma citations match verbatim? / Q4 independent spot-check on 2-3 proof steps?
- **Bilingual sync (BL-19) specialization:** **OPTIONAL for research.** Unlike article skin where BL-19 enforces the 8-file rule, research skin makes bilingual drafts OPTIONAL. A research notebook may be monolingual; commit is NOT blocked on missing RU/EN pair unless the project declares `bilingual: required` in `config.md`.

---

## Verification Protocol (recompute + provenance)

This section maps directly to `domain.verify.method: recompute`. The skin expands `recompute` into **8 RC checks** split across Validator L1 (per-step / mechanical) and L2 (pre-submission / interpretive).

### The eight RC checks

| # | Check | Who runs it | L1 or L2 | Enforcement mechanism |
|---|---|---|---|---|
| **RC1** | **Proof existence** — every theorem / lemma / proposition has a proof. No "as is well known," "by standard argument," "trivially." | Validator | **L2** (interpretive — requires reading the proof text) | Manual read; grep for forbidden phrases as pre-filter |
| **RC2** | **Step attribution** — every proof step cites a previous step, a lemma, or an axiom. No unattributed algebraic jumps. | Validator | **L2** (interpretive — requires understanding each step) | Per-step manual audit; grep for `\begin{proof}` blocks and inspect |
| **RC3** | **Independent recomputation** — Validator walks the proof from axiom_set to claim WITHOUT the author's narrative. | Validator | **L2** (requires fresh walk-through) | Manual; Validator re-derives on scratch paper |
| **RC4** | **No circular reasoning** — build a dependency graph of lemmas used; proof of A does NOT implicitly depend on A. | Validator | **L2** (requires graph construction) | Manual graph build + cycle check |
| **RC5** | **Axiom set minimality** — every axiom listed in the axiom_set is actually used in the proof; unused axioms are removed or justified. | Validator | **L2** (requires full proof scan) | Manual audit |
| **RC6** | **Notation consistency** — same symbol means the same thing throughout the document. | Coherencer + Validator | **L1** (mechanical grep for symbol re-use) + L2 manual collision inspection | `grep -n '\\alpha'` pre-filter; manual inspection |
| **RC7** | **Formula provenance** — every numbered formula has a visible provenance_tag: **Derived** (in-artifact derivation) / **Cited** (external source with concrete pointer) / **Axiomatic** (explicit postulate label) / **Conjectured** (explicit conjecture label). No asserted-without-derivation. | Validator | **L2** (per-formula classification) | `grep -B3 -A1 '\\tag{'` pre-filter; manual bucketing |
| **RC8** | **Contradiction detection** — no two statements in the document are formally inconsistent. Consequence of (1-σ) = 0 tolerance: a single contradiction = Andon. | Validator + Coherencer | **L2** (requires logical scan) | Manual; Coherencer checks across the corpus |

**L1 vs L2 split:** Research skin is HEAVIER on L2 than article skin — derivation integrity cannot be reduced to grep. Only RC6 is reliably L1 (symbol re-use is mechanically detectable); RC1, RC2, RC3, RC4, RC5, RC7, RC8 all require reading the proof. This is **by design**: research artifacts are derivation-first, so the gate is interpretive. At least RC1, RC4, RC7 MUST remain L2 (per spec AC-4).

### Relationship to article skin's cite_check C1..C6

**Article's C1..C6 run as SECONDARY checks** only when the research artifact has external citations:

| When cite_check applies to research | Which checks |
|---|---|
| Artifact cites 0 sources | None — skip all C1..C6 |
| Artifact cites ≥1 source | C1, C3, C4 — L1 automated |
| Artifact cites ≥3 sources | + C2 (L2 interpretive) |
| Artifact cites ≥10 sources or has a full bibliography | ALL of C1..C6 — at this density reclassify as `type=article` |

**RC7 PROMOTES article's C6b.** Article skin's C6b (formula provenance, Skin-DEF-f) becomes RC7 — a primary check — because research artifacts have the highest density of formulas whose provenance matters. Promotion from secondary L2 check to first-class RC-series check.

**C5 DEMOTES to a footnote.** Article skin's C5 (self-citation quantitative ladder, Skin-DEF-e) moves to a footnote under the cite_check secondary section. Research notes rarely trigger self-citation red flags (usually standalone, no author brand). The 0-30 / 30-50 / 50-70 / ≥70 ladder is inherited verbatim from article skin's "C5 quantitative thresholds" section for completeness, not as a primary gate.

**C6a (numerical consistency) is inherited as L2 secondary** when the artifact contains numerical claims appearing in >1 location. For proofs without empirical components, C6a is effectively replaced by RC8 (contradiction detection).

### Verification block

```
[method name]: recompute
[command]: Primary — independent re-derivation of every proof step + RC1..RC8 manual audit.
           Secondary (if artifact has citations) — cite_check C1..C6 from article skin.
           LaTeX: `tectonic FILE.tex`; notebook: execute end-to-end.
[success criteria]: all 8 RC checks PASS AND (if citations present) C1..C6 PASS
                    AND derivation_chain closed from axiom_set to claim AND notation
                    consistent AND every numbered formula has a provenance_tag AND
                    (1-σ) tolerance is zero — no contradictions.
[failure recovery]: RC1 → write missing proof OR cite lemma/axiom;
                    RC2 → add explicit step justification;
                    RC3 → re-derive (independent walk failure = proof wrong, not Validator);
                    RC4 → restructure lemma hierarchy to break the cycle;
                    RC5 → remove unused axioms OR justify them;
                    RC6 → rename one colliding symbol + update cross-refs;
                    RC7 → add in-artifact derivation OR external pointer OR axiomatic/conjecture label;
                    RC8 → identify the two inconsistent statements, remove or reconcile.
[independence check]: Validator walks the proof with only axiom_set + theorem statement
                      visible — author's narrative closed. Divergence at any step → flag
                      step as non-obvious, demand more explicit justification (BL-5).
```

### Sample-size contract (inherits article skin pattern)

`sample_size = max(3, ceil(sqrt(total_proof_steps)))`. Selection is **DETERMINISTIC**: (1) first step (axiom grounding), (2) middle step (chain integrity), (3) final step (closure onto claim); remaining slots fill unrepresented proof sub-sections. For `total_proof_steps ≤ 5`, Validator recomputes EVERY step — sampling is only for long derivation_chains.

---

## RT Phase Protocol for research

Research artifacts adjust the canonical RT protocol because the work profile differs from code AND article.

### Three RT invocation points

1. **RT-0 (Visionary solo, RECOMMENDED): claim + scope declaration.** Before any RT-1. Visionary evaluates: theorem (proof obligation) or conjecture (label only)? What is IN scope, what is OUT? Is the axiom_set known? Output is one of:
   - "APPROVED: theorem T with axiom_set A_1..A_k; scope = X, out-of-scope = Y, Z; proceed to RT-1."
   - "APPROVED (CONJECTURE): labelled as Conjecture C; no proof obligation; documented as open question."
   - "OUT-OF-SCOPE: claim not falsifiable / axiom_set undefined; defer."

2. **RT-1 (mandatory, full 5-role): proof outline + strategy + plan.** Before any proof-step drafting. **Sequential role execution within the round** (Analyst → Builder → Validator → Coherencer), not parallel — a proof step depends on the previous step, so parallel execution creates inconsistency. For each step i: Analyst plans, Builder drafts, Validator RC-checks, Coherencer notation-checks. Repeat until derivation_chain reaches the claim. **Stricter than canonical RT and stricter than article skin's section-parallel rhythm.**

3. **RT-2 (mandatory, pre-submission): full gate.** Before the artifact is committed "final" or shared externally:
   - Validator L2 **full re-derivation** (small proofs ≤5 steps recompute everything; larger proofs follow sample-size contract).
   - Coherencer **axiom minimality check** (RC5) across the full artifact.
   - Coherencer **cross-proof notation audit** (RC6) across neighboring corpus artifacts.

### Single Builder with sequential rhythm

The research Builder is a **SINGLE agent** drafting proof steps **in dependency order** — no parallel splits; a step cannot be drafted before the step it depends on. Unlike article skin's section-by-section bilingual rhythm.

**Exception (L/XL only):** For multi-proof notebooks (>3 independent proofs), two Builders may own different proofs in parallel. Coherencer gate between Builder completion and Validator is MANDATORY to catch cross-proof notation collisions.

### Pipeline block

```
Research pipeline (FIXED):
RT-0 (Visionary solo)    → claim + scope + axiom_set approval
RT-1 (full 5-role,       → proof outline + strategy + first draft
 sequential within round)  For each proof step i:
                              Analyst (next-step plan) → Builder (draft step i)
                              → Validator (RC check step i) → Coherencer (notation check)
                            Until derivation_chain reaches the claim
RT-2 (full 5-role)       → RC1..RC8 full audit + (if citations present) C1..C6
                          + independent full re-derivation (small proofs) or
                            sample-size re-derivation (large proofs)
Commit the research artifact (LaTeX file / notebook / markdown)
Preprint / journal submission / corpus insertion → outside EraDev scope
```

---

## Checklists

### Pre-Generation Checklist (Check-First, BL-17, BL-21 — research specialization)

Run BEFORE any proof-step drafting begins.

- [ ] **1. AXIOM SET:** Explicit axiom list documented. No implicit "standard assumptions."
- [ ] **2. NOTATION TABLE:** Every symbol used in the proof has a declared meaning. No symbol re-use between proofs in the same artifact.
- [ ] **3. CLAIM STATEMENT:** Theorem stated formally with quantifiers and scope. Conjectures labelled separately.
- [ ] **4. PROOF STRATEGY:** Named strategy (induction / contradiction / construction / contrapositive / computation / direct). No "figure it out as you go."
- [ ] **5. LEMMA HIERARCHY:** Dependencies among supporting lemmas formed as a DAG, no cycles.
- [ ] **6. FORMAT:** For LaTeX artifacts, preamble read and notation macros defined. For notebooks, computational environment verified.
- [ ] **7. CORPUS POSITION (if applicable):** Adjacent proofs read for notation and axiom overlap.
- [ ] **8. RT-0 CONFIRMATION:** Visionary has confirmed the claim is a theorem (proof obligation), conjecture (label only), or out of scope.

### Post-Generation Checklist (Jidoka gate)

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

## Examples (3 concrete)

### Example 1: Missing proof step (RC1 / RC2 failure)

- **Input:** "Prove Lemma 4.1: for any ODTOE observer x, if F(x) > 0.7 and E(x) > 0.7, then B(x) > 0.4."
- **Scenario:** Builder writes Step 1 (F, E assumed), Step 2 (σ=0.3, Λ=0.6 given), Step 4 (B = 0.7·0.7·0.7·0.6 > 0.4). NO Step 3 — Builder jumped from assumption to evaluation without writing the B-formula substitution.
- **What Validator finds:** During RC1 + RC2, Validator reads the chain and sees Step 4 is NOT attributable to Step 2 alone. The step that formally applies B = F·E·(1-σ)·Λ with the assumed values is missing.
- **Catching role:** **Validator** (RC1 + RC2 are L2, interpretive).
- **Phase:** **RT-1** (sequential-within-round step check) or **RT-2** (full audit) — either catches it.
- **Fix:** Insert Step 3: "By B = F·E·(1-σ)·Λ with F=0.7, E=0.7, σ=0.3, Λ=0.6, we have B = 0.7·0.7·0.7·0.6." Chain closes.
- **Why cite_check would miss this:** Proof cites no external paper; C1-C6 all PASS trivially. Only RC1/RC2 catch the missing step. This is the didactic case for why **research verification is recompute-first, not cite-first**.

### Example 2: Circular reasoning (RC4 failure)

- **Input:** "Prove Theorem 5.2: phantom coherence implies low B-quality."
- **Scenario:** Builder proves Theorem 5.2 by citing Corollary 3.7 ("in phantom coherence, B_mean < 0.4"). Corollary 3.7 was itself proved earlier using Theorem 5.2. Chain: Theorem 5.2 → Corollary 3.7 → Theorem 5.2.
- **What Validator finds:** RC4 builds a dependency graph of lemmas used; cycle detected = {Theorem 5.2, Corollary 3.7}.
- **Catching role:** **Validator** (RC4 is L2 — requires graph construction).
- **Phase:** **RT-2** (pre-submission full audit) — dependency graphs are most reliably built from the full artifact.
- **Fix:** Prove Theorem 5.2 directly from BL-5 + B-formula (without Corollary 3.7), OR prove Corollary 3.7 directly from the B-formula (without Theorem 5.2). Either breaks the cycle.
- **Why cite_check would miss this:** No bibliography citations involved — intra-document cross-reference. C4 checks `\ref{}` resolution, not dependency acyclicity. Only RC4 catches circular reasoning. Research skin promotes this because it is common in notebooks drafted out of dependency order.

### Example 3: Notation collision (RC6 / Coherencer failure)

- **Input:** "Draft a research notebook with 6 proofs of ODTOE-related lemmas."
- **Scenario:** In §3 (Lemma 3.1, phase dynamics), Builder introduces `α` as "the scaling coefficient for time evolution, α ∈ (0, 1)." In §5 (Lemma 5.1, observer geometry), `α` becomes "the phase angle of the observer's quaternion, α ∈ [0, 2π)." §3 and §5 were drafted in different sessions; the notation table was not updated.
- **What Coherencer finds:** RC6 grep (`grep -n '\\alpha'`) returns ~40 occurrences; inspection shows two incompatible meanings; the notation table defines only §3's meaning; §5 uses `α` without declaration.
- **Catching role:** **Coherencer** (RC6 is Coherencer-primary, Validator-secondary) — the canonical Coherencer failure.
- **Phase:** **RT-2** pre-submission OR Builder's own Jidoka Q5 at **RT-1**.
- **Fix:** Rename one symbol (e.g., replace `α` with `β` in §5), update the notation table to include both, re-compile.
- **Parallel with article skin Example 2:** Article's `\Lambda` collision is the same pattern. Research skin inherits the pattern and makes it RC6, first-class.

---

## Domain-Specific Bootstrap Lessons

The research skin inherits all 22 universal BL from `BOOTSTRAP_LESSONS_universal.md` **unchanged**, handles each of the 8 code-adapter BL individually (2 transfer unchanged, 4 have research equivalents BL-R1..R4, 2 are N/A), and adds 4 research-specific BL in the BL-R namespace.

### Universal BL inherited (22 entries — unchanged, by reference to article skin)

The full 22-row table is identical in structure to `templates/domain_skin.article.md` Section "Universal BL inherited". BL numbers, titles, and core rules are UNCHANGED; the applicability column is rewritten for research work where relevant. Research-specific rewrites (most differ from article skin only in examples):

| BL | Title | Applicability to research work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Fresh research project starts with Λ=0.5; accumulates as proofs land in the corpus |
| BL-5 | Phantom Coherence Detection | Research manifestation: "Builder and Validator agree on a proof step but neither walked it independently" |
| BL-17 | Pre-Generate Verification = Prevention | **Critical** — Check-First (Section "Pre-Generation Checklist") is research's BL-17 |
| BL-19 | Bilingual Files Simultaneous | **OPTIONAL** — if project declares `bilingual: required`, the 8-file rule applies; otherwise monolingual artifacts are complete. DIFFERENT from article skin. |
| BL-21 | Format Specifications Are Inputs | **Critical** — LaTeX preamble / notebook environment spec read before drafting |
| BL-29 | Verify Established Terminology Before Generating | **Critical** — notation table read before drafting to avoid RC6 collisions |

**Full 22-BL list inherited by reference from article skin:** BL-1, BL-4, BL-5, BL-7, BL-9, BL-10, BL-11, BL-12, BL-13, BL-15, BL-16, BL-17, BL-18, BL-19, BL-20, BL-21, BL-26, BL-28, BL-29, BL-30, BL-31, BL-32. Agents MUST NOT omit any.

### Code-adapter BL handled individually (8 entries)

| BL | Title | Verdict for research | Notes |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | **Research equivalent: BL-R1** | Submission/publication of a research result requires PRE-FLIGHT (informal reviewer → preprint → formal submission). See BL-R1. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Applies unchanged** | Research equivalent: 3+ consecutive revisions of the same proof step = STOP, re-think proof strategy (often means the strategy is wrong, not the step). Transfers cleanly; no new BL-R. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | **Research equivalent: BL-R2** | Before committing any proof edit, Builder must run LaTeX compile AND RC1..RC5 self-audit AND (if applicable) notebook execution. See BL-R2. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **N/A for research** | Research has no feature flags. A proof either holds or does not hold — no toggle mechanism. |
| **BL-14** | Rollback Plan Before Deploy | **Research equivalent: BL-R3** | Before submitting a research result for peer review, Builder must document the retraction / withdrawal plan. See BL-R3. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Research equivalent: BL-R4** | Before RT-1, every cited axiom / external lemma must be verified: axiom stated correctly, external lemma from a trusted source, proof does not silently rely on an un-stated assumption. See BL-R4. |
| **BL-24** | Single-Responsibility Commits | **Applies unchanged** | Research equivalent: one commit = one proof OR one proof section. Transfers cleanly; no new BL-R. |
| **BL-25** | Error Path Coverage Matrix | **N/A for research** | Research does not have runtime error paths. The analog would be "what if the proof is wrong" but that is BL-R3 (retraction plan). |

Summary: 2 apply unchanged (BL-3, BL-24); 4 have research equivalents (BL-2→R1, BL-6→R2, BL-14→R3, BL-22→R4); 2 are N/A (BL-8, BL-25).

### Research-specific BL (BL-R namespace — separate budget)

These 4 BL live in this skin file ONLY. They do NOT add to the main 30-BL budget. They parallel article skin's BL-A1..A4.

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

### BL budget summary

- Universal BL inherited: **22** (unchanged)
- Code-adapter BL applied unchanged: **2** (BL-3, BL-24)
- Code-adapter BL with research equivalents: **4** (BL-2, BL-6, BL-14, BL-22 → BL-R1..R4)
- Code-adapter BL N/A for research: **2** (BL-8, BL-25)
- Research-specific BL (BL-R namespace, separate budget): **4** (BL-R1..R4)

**Total BL a research agent carries: 22 universal + 2 transferred code-adapter + 4 BL-R = 28 BL.**

Matches article skin's count — intentional parallel. Both skins carry 28 BL each, staying within the 30-BL cap because BL-A and BL-R namespaces are scoped to their own skin and do NOT compound.

### Project lessons.md integration (inherits Skin-DEF-g pattern)

Same rule as article skin: the skin inherits 22 universal BL and defers to `projects/{PROJECT}/lessons.md` for project-specific rules. On conflict, the project lessons.md takes precedence for project-scoped concerns. Temporal exception applies — rules introduced AFTER the artifact's file mtime are LEGACY INFO, not FAIL (same Case A / Case B / Partial split as the article skin's Check 8 temporal exception sub-section).

**Applies to:** Validator (RT-2 primary reader), Coherencer (cross-corpus propagation), Builder (pre-commit), Analyst (RT-1 Check-First preamble).

---

## Co-existence clause and Known Out-of-Scope

### Co-existence clause (CRITICAL — do not omit)

The research skin and article skin are **siblings in the same modality** (both pin `B_modality: research` with identical weights). They are NOT alternatives to each other; they address different artifact classes:

- **Article skin applies when:** the artifact is a full scientific paper — abstract, introduction, methods, results, discussion, conclusion, bibliography. Typical length: 2000-10000 words. Typical bibliography: 20-50 entries.
- **Research skin applies when:** the artifact is a standalone proof, a derivation chain, a lemma sheet, a mathematical notebook, a working derivation, or a preprint fragment that lacks the full paper architecture. Typical length: 300-3000 words. Typical bibliography: 0-10 entries.

**A project CAN use both skins** via per-task classification in `config.md`:

```yaml
domain:
  type: article  # primary
  skin: templates/domain_skin.article.md
  task_overrides:
    - path_pattern: "notebooks/*.tex"
      skin: templates/domain_skin.research.md
```

META loads the article skin for primary files and the research skin for files matching `notebooks/*.tex`. Both are active in the session; agents load the appropriate skin per-file.

A project MAY use ONLY the research skin (`domain.type: research`) if its output is exclusively standalone derivations, OR ONLY the article skin (the ODTOE case) if research-heavy content is packaged as full papers.

**The two skins do NOT mutually exclude.** Neither replaces the other. Per-task classification is the binding contract between project config and META routing.

### Known Out-of-Scope (OOD) for research modality

Tasks that look like research but fail v9's text-discrete AND-gate:

- **Speculative philosophy.** A claim like "consciousness is computation" has no falsifiable formulation and no proof chain. Fails on verification. Route to Visionary RT-0 for OOD classification.
- **Un-axiomatizable derivations.** If the derivation depends on assumptions that cannot be stated formally (e.g., "assume standard intuition about X"), there is no axiom_set and RC4/RC5 are meaningless. Fails on Check-First item 1.
- **Running mathematical experiments / computer-algebra sessions without a terminal proof.** If the output is a set of exploratory computations with no theorem, the artifact is a notebook in the `code` sense, not a research proof. Route to code skin.
- **Opinion essays on research practice.** A paper about "how mathematicians should write proofs" is a position paper (article skin territory, currently OOD per v9 because review/position papers are deferred to v10), not a proof. Route to Visionary RT-0.

---

## Footer

*Last updated: 2026-04-11*
*Upstream roles: roles/{role}_EN.md (all 5 roles — Visionary, Analyst, Builder, Validator, Coherencer)*
*Upstream math: eradev.md Section II.1 (B_research weights)*
*Upstream BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited by reference to article skin's table)*
*Sibling skin: templates/domain_skin.article.md (same modality, verify=cite_check)*
*Spec: reports/v9_phase2a_research_skin_spec_2026-04-11.md (Analyst hand-off, B=0.904)*
