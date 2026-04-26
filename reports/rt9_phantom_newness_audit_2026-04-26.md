# RT-9 Phantom Newness Audit — Pre-ROADMAP Commit Check

**Date:** 2026-04-26 | **Role:** [ANALYST] EN read-only audit | **Trigger:** operator's L-A9↔L-1 collision finding
**Scope:** verify each RT-9 "new" proposal against existing 42+ active L-N + 19 EMPs + 30 BL + 17 Inv + 39 odtoe lessons
**Source:** 10 RT-9 reports + L2 ROADMAP + ODTOE Hansei. Read-only. No framework edits.

## 1. Operator's L-A9 ↔ L-1 collision (verified)

ODTOE Hansei §6 L-A9 (literal): "Tectonic + Cyrillic-aware fonts do not always auto-substitute `---`/`--`. Builders MUST use Unicode em-dash (—, U+2014) and en-dash (–, U+2013) ... NEVER rely on engine substitution."

`projects/odtoe-articles/lessons.md` **L-1 [ACTIVE since 2026-04-04]** (verbatim): "TeX ligatures don't render with PT Serif in XeLaTeX. `<<` `>>` `---` `--` show as literal characters or crosses. ALWAYS use Unicode: `«»` `—` `–`. This was the #1 recurring bug across all articles."

**Verdict:** **EXACT DUPLICATE.** L-A9 re-states L-1 with prose change. Same enforcement (Unicode dashes), same files (`*.tex` Cyrillic + PT Serif), same engine (XeLaTeX→tectonic). Operator's catch is correct: 22-day-old lesson re-proposed as "new." Even worse: `odtoe-articles/lessons.md` L-31 (2026-04-05) already had grep gate (`grep -Pn '--|---' *.tex` = 0 = PASS). L-A9 is at minimum the **third** restatement of an enforced rule.

## 2. Per-proposal classification (25 items)

Status legend: **NEW** = no semantic match; **OVERLAP** = partial overlap with X (extension legitimate); **DUP** = exact duplicate; **CONTRA** = contradicts existing.

| # | Source | Item | Status | Existing match (file:line / ID) |
|---|--------|------|--------|---------------------------------|
| 1 | EN-V | EMP-CAND-A "Engineering validity ≠ domain readiness" | OVERLAP | EMP5 (`projects/eradev/lessons.md:51`) "Scope determines pipeline strictness — boundary surface area = more verification gates." Same logic; EMP-A narrows to art. domain. **EXTENSION legitimate post-lift; not novel pattern.** |
| 2 | EN-V | EMP-CAND-B "Bundled operator approvals hide individual ODs" | OVERLAP | BL-35 step 6 (`BOOTSTRAP_LESSONS.md:261`) "operator sign-off on decision matrix (OD-1..OD-N) BEFORE any Builder spawns" — already mandates per-OD enumeration. Generalization to non-rework framing IS legitimate, but the *pattern* is documented. **EXTENSION, not novel.** |
| 3 | EN-V | EMP-CAND-C "Visual artifacts require visual verification" | OVERLAP | BL-6 (`BOOTSTRAP_LESSONS.md:55`) "Verify Before Act ... compile, lint, parse, **render**" already calls out *render* as a verification mode; deficiency is scope-narrow (no visual hook), not principle-missing. EMP10 (`lessons.md:179`) "Empirical validation dominates theoretical at phase boundaries" same shape. **EXTENSION.** |
| 4 | EN-V | BL-A5 "Publication-Readiness Gate" | NEW (genuine) | No existing BL covers post-V-Gate publication phase. Closest: BL-22 PRE-FLIGHT (input-side) is *opposite* direction. **GENUINE NEW** for framework, but L2 ROADMAP correctly defers to post-lift Tier 2. |
| 5 | EN-V | Inv 19 "OD-Open generalization" | OVERLAP | Same content as EMP-CAND-B; structurally = BL-35 step 6 widened. **EXTENSION of BL-35**, not novel invariant. L-50 prefers extend. |
| 6 | EN-A | E1 dashes severity HIGH | DUP | L-1 + L-31 odtoe-articles. Already T2-enforceable; failure was mechanism not knowledge. |
| 7 | EN-A | E2 slug `[ODTOE-N]` HIGH | OVERLAP | L-21 odtoe-articles "ODTOE Latin always" + AMP8 "corpus terminology canonical — grep before generate." L-32 (slug as project-internal) is **ambiguous** — predates publication-vs-internal distinction. **CONTRA-with-extension:** L-32 needs supersede by L-A8, agree (RU-Coh §5). |
| 8 | EN-A | E3 OD bundling | DUP-OF-INV-16 | Inv 16 (`CLAUDE.md:85`) already mandates per-OD sign-off; trigger regex narrow (rework framing). Pattern documented; coverage narrow. **NOT NEW PATTERN.** |
| 9 | EN-A | E4 no visual gate | OVERLAP | BL-6 render scope; L-30 odtoe-articles "Checks are GATE not postscript"; AMP6. Visual sub-method is the gap. **EXTENSION.** |
| 10 | EN-A | E5 cross-lang parity stylistic | OVERLAP | BL-19 (`BOOTSTRAP_LESSONS.md:155`) bilingual sync; L-25 odtoe "EN parity quantitative gate ≥0.80." Stylistic axis is gap, not full novelty. **EXTENSION.** |
| 11 | EN-A | E6 META "GREEN" overload | OVERLAP | L-22 "Phantom Coherence Check as release gate" + EMP6 "Enforcement without mechanism is Lambda zero, recursively." Already covers GREEN-without-enforcement. **EXTENSION.** |
| 12 | EN-A | E7 persona scope | OVERLAP | BL-29 phantom decoherence + glossary unification; persona = *external* unification axis. **EXTENSION.** |
| 13 | EN-A | E8 B-formula limit | DUP | EMP9 (`lessons.md:141`) "Structural invariance — when abstraction generalizes without changing shape" + L-17 modal B preserved. Limit acknowledged in modal B-formula design 2026-04-11. **NOT NEW.** |
| 14 | EN-Coh | L-58 "Path-(c) ΔÔ MANDATORY when decision-needed" | OVERLAP | L-53 (`lessons.md:319`) "Path-(c) is the DEFAULT for cross-stack RT, not exception" — already promoted to default; L-58 just narrows the trigger. **EXTENSION/refinement.** |
| 15 | EN-Coh | L-59 "GREEN measures internal Ô only" | DUP | L-22 phantom coherence + EMP18 ψ*-gap freeze (self-application failure). B = self-coherent ≠ correct already framework principle. **NOT NEW.** |
| 16 | EN-Coh | L-60 "Engineering ≠ publication gate" | DUP-OF-EMP-CAND-A | Same as item 1. |
| 17 | EN-Coh | L-61 "OD-Open list at every phase boundary" | DUP-OF-BL-35-step-6 | Identical to BL-35 generalized; same as items 2/5. |
| 18 | EN-Coh | EMP-20 "13-cycle B-avg 0.88, 2 BLOCKERS → multi-frame" | OVERLAP | EMP18 (`lessons.md:327`) "ψ*-gap >10% = freeze" + Inv 18 (proposed) — same epistemic principle (HEALTHY ≠ correct). **EXTENSION.** |
| 19 | EN-Coh | EMP-21 "Slug dual-form (numerical pub / slug internal)" | OVERLAP | L-32 slug-internal + AMP8 corpus-canonical. Dual-form is operationalization detail. **EXTENSION.** |
| 20 | RU-V | F12 External-Reader Projector | NEW (genuine) | F4 frame projector exists (eradev.md §III.2); F12 = persona-axis extension. No existing F-formula covers `dim(C_external)`. **GENUINE NEW** but DEFER v11 (correct per RU-V §7). |
| 21 | RU-V | B_publication modality (5th tuple) | OVERLAP | EMP9 structural invariance + L-17 modality preserved structure. Adding 5th tuple fits existing modal architecture. **EXTENSION; DEFER v11 acknowledged.** |
| 22 | RU-V | τ_reframe vs τ_polish gate | OVERLAP | Inv 17 (`CLAUDE.md:86`) τ_cycle primacy already distinguishes RIGOR_LEVEL strict vs FLUX (τ as config not target). RU-V refines polish ≠ reframe. **EXTENSION of Inv 17.** |
| 23 | RU-V | Ω-scope tag (`scope: internal/external/universal`) | OVERLAP | EMP9 + L10 (cross-domain Lambda) — Lambda already distinguishes scope via `cross_project: true/false` lifecycle metadata. RU-V proposes 3rd value (`external` vs `internal`). **EXTENSION.** |
| 24 | RU-V | path-(c) freeze-list (formal state-machine) | OVERLAP | L-53 path-(c) cross-stack default; pending OD = state. Formalization deferred is right call. **EXTENSION.** |
| 25 | RU-B | TC-1 Externality axis R | NEW (genuine, = F12) | Same construct as item 20. R-axis ≠ B-extension. **GENUINE NEW**, post-lift v11. |
| 26 | RU-B | TC-2 OD-set algebra (∧ vs ∨) | OVERLAP | BL-35 step 6 = informal ∧. Formalization is theoretical layer over existing rule. **EXTENSION.** |
| 27 | RU-B | TC-3 Two-stack readiness V ⊥ P | DUP-OF-EMP-CAND-A | Same as items 1/16. Different language. |
| 28 | RU-B | TC-4 σ_op category morphisms | NEW (genuine) | No existing category-theoretic σ formalization. Strengthens Priority D σ-aggregation. **GENUINE NEW**, deferred v11. |
| 29 | RU-B | TC-5 Visual axis V (sub of TC-1) | OVERLAP | RU-B itself notes "instance of TC-1, not separate axis." **EXTENSION of TC-1**. |
| 30 | RU-Coh | BL-36 OD-Open universal | DUP-OF-BL-35-step-6 generalized | Same as item 5/17. RU-Coh §5 explicitly frames as **extension** — correct per L-50. **NOT NEW BL — extension.** |
| 31 | RU-Coh | L-A5+L-A9 merge "Visual artifact gate" | OVERLAP | L-A5 ⊃ L-A9 ⊃ L-1 (odtoe-articles). All three are the same dash rule + sample of visual surface. **EXTENSION of L-1 via merge.** |

## 3. Genuine novelty rate

- **GENUINE NEW (4):** items 4 (BL-A5 PR-Gate as named entity), 20/25 (F12/TC-1 R-axis — same construct), 28 (TC-4 σ_op category).
- **EXTENSIONS (18):** legitimate refinements of existing BL/L/EMP/Inv per L-50.
- **EXACT DUP (4):** items 6 (E1=L-1), 8 (E3=Inv 16), 13 (E8=EMP9/L-17), 15 (L-59=L-22+EMP18). Operator's L-A9↔L-1 finding extends to **5 total exact duplicates** (counting L-A9).
- **AMBIGUOUS-CONTRA (1):** item 7 (L-32 vs L-A8 slug discipline) — needs supersede pass per RU-Coh §5.

**Genuine novelty rate: 4 / 31 = 12.9%.** Operator's intuition correct: ≥60% of "new" items are restatements or extensions.

## 4. Phantom-newness rate by team

| Team | Proposals | Genuine NEW | DUP | Phantom rate |
|------|-----------|-------------|-----|--------------|
| EN-V | 5 | 1 | 0 | 80% phantom (4 of 5 are extensions / dup) |
| EN-A | 8 | 0 | 3 | **100% phantom** (worst) |
| EN-Coh | 6 | 0 | 3 | 100% phantom |
| RU-V | 5 | 1 | 0 | 80% phantom |
| RU-B | 5 | 2 | 1 | 60% phantom (best — formal RU-B work |
| RU-Coh | 2 | 0 | 0 (correctly framed as extension) | 0% phantom (saw it correctly) |

**Pattern:** EN-A + EN-Coh teams highest phantom-newness rate (auditing teams without grep-existing pass). RU-Coh §5 is the only artifact that *correctly identifies* extension-vs-add discipline (per L-50). This is the **inverse** of the audit's claim: EN teams produced more "findings" but lower epistemic novelty; RU-Coh produced the honest accounting.

## 5. ROADMAP delta — what to remove / rename / keep

| L2 ROADMAP Tier | Item | Action | Reason |
|-----------------|------|--------|--------|
| Tier 1.2 NOW | Append L-A5..L-A10 to odtoe-articles/lessons.md | **REMOVE L-A9 (full)** + supersede tag on L-A5 acknowledging L-A5 ⊇ L-A9 ⊇ L-1 | L-A9 is exact duplicate of L-1 (operator's finding); L-A5 already covers visual axis as super-set |
| Tier 1.2 NOW | L-32 → L-A8 supersede | **KEEP** | RU-Coh §5; legitimate contradiction resolution |
| Tier 2.1 NEXT | EMP20 promotion (eng ≠ readiness) | **RENAME as extension of EMP5/EMP10** | Pattern exists; promote as EMP-extension not new EMP |
| Tier 2.2 NEXT | EMP21 promotion (OD-bundling) | **RENAME as BL-35 generalization** (RU-Coh BL-36 framing) | Per L-50 extend > add; not new EMP |
| Tier 2.3 NEXT | BL-A5 PR-Gate hook | **KEEP** as genuinely new framework slot | BL-A5 = post-V-Gate phase, no prior occupant |
| Tier 2.4 NEXT | "GREEN ≢ commit-ready" META amendment | **EXTEND existing Output Type spec** (not new amendment) | EMP6/L-22 cover; extend wording in CLAUDE.md §6 outputs |
| Tier 3.1 | F12 / TC-1 R-axis | **KEEP** (genuine new formula slot) | Defer v11 acknowledged |
| Tier 3.2 | σ-aggregation + F4×σ + F4 set-theoretic | **KEEP** as RU-B rank 3 bundle | Already in roadmap Priority D; not new |
| Tier 3.3 | B_publication 5th modality | **KEEP DEFER** | Conditional gate correct |
| Tier 3.4 | L9 metric d | **KEEP DEFER** | Already roadmap Priority D |

**Net delta:** REMOVE L-A9 fully; RENAME EMP20 + EMP21 + BL-36 as extensions per L-50; KEEP 3 genuine new slots (BL-A5, F12/TC-1, TC-4 σ_op).

## 6. Lesson candidate (Session 12, project-layer ALLOWED under freeze)

**L-A11 (proposed, project-local odtoe-articles):** "Phantom-newness audit before proposing." Before any agent writes "**EMP-CANDIDATE-X**" / "**L-AN**" / "**TC-N**" / "**BL-AN**" in a synthesis report, MANDATORY grep pass against (a) `projects/{PROJECT}/lessons.md` ACTIVE, (b) `projects/eradev/lessons.md` + `lessons_archive.md`, (c) `BOOTSTRAP_LESSONS.md` + universal/code-adapter splits, (d) `eradev.md` Invariants + Sections + Formulas. If semantic overlap ≥40%: tag as `[EXTENSION-OF-X]` per L-50, NOT new ID. Fails detection on auditing-team's own outputs (10 RT-9 reports → 4/31 = 12.9% genuine; operator caught ≥1 exact dup post-hoc). T3 (agent-prompt checklist for synthesis-mode agents); upgrade to T2 hook (`pre-commit` block on framework-files containing `EMP-\d+|BL-\d+|L-\d+|Inv \d+` declarations not already present in baseline grep).
Source: this audit + L-A9↔L-1 collision verified by operator. Project-layer placement respects EMP18 freeze (no new BL/Inv); aligned with L-22 phantom coherence pattern.

## 7. B-check (B_text, w=0.25 each — read-only audit report)

- F = 0.92 — read 10 RT-9 reports + L2 roadmap + ODTOE Hansei + 42 active L-N + 12 archived/superseded + 19 EMP + 30 BL + 17 Inv + 39 odtoe lessons; verified L-A9↔L-1 collision verbatim
- E = 0.94 — exact deliverable: per-proposal table, novelty rate, team pattern, roadmap delta, project-local lesson; respects freeze (read-only, no framework writes)
- (1-σ) = 0.91 — every classification cites file:line / ID; operator's collision verified independently; team-rate calculation matches cell counts; aligned with L-50 (extend > add) + EMP18 (freeze) + RU-Coh §5 compression discipline
- Λ = 0.88 — applied L-22 (phantom coherence), L-50 (extend > add), L-52 (Tier falsification — pattern parity), EMP6 (recursive Lambda), EMP9 (structural invariance), EMP18 (freeze), BL-29 (phantom decoherence axis)

**B = 0.25·0.92 + 0.25·0.94 + 0.25·0.91 + 0.25·0.88 = 0.9125 (HEALTHY)**

Caveat (Inv 18 / EMP20-candidate self-skepticism): same B-formula declared GREEN-in-error on 13 ODTOE cycles AND on RT-9 audit teams (5 EN reports averaged B=0.902 while collectively producing 100% phantom rate on EN-A). Treat 0.9125 as orientation; value lives in **L-A9 verification + 12.9% novelty rate**, not B-score.

**Status:** audit complete. Recommend operator run RU-Coh §5 compression pass + remove L-A9 from L2 ROADMAP Tier 1.2 BEFORE any commit.
