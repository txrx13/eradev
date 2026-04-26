# RT-9 Audit — ODTOE Article Session Failures (Analyst EN, Empirical Lens)

**Date:** 2026-04-26 | **Author:** [ANALYST] EN | **Stack:** EN (practical/audit)
**Sources:** `/Users/antonpankratov/Downloads/odtoe/reports/hansei-rt3-publication-readiness-2026-04-26.md`; session log `~/.claude/projects/-Users-antonpankratov-Downloads-odtoe/d5cad4a6-2a14-44e0-b55f-0fb8c5da3f96.jsonl` (3346 events, 829 ODTOE/dash/slug hits, 446 ANDON/RT/composition hits, 900 role mentions); EraDev v10 `CLAUDE.md` (17 inv), `BOOTSTRAP_LESSONS.md` (30 BL), `meta.md` §14 (13 items).

## A. Specific errors (file:line, behavior, severity)

| # | Error (file:line) | Behavior | Severity | Cycles missed |
|---|-------------------|----------|----------|---------------|
| E1 | `ODTOE_dark_energy_merger.tex` (RU abstract, ~L40-L60 area) — literal `---`/`--` | Builder used standard LaTeX dash macros assuming engine substitution; tectonic + Cyrillic font (PT Serif `\setmainfont` + polyglossia ru) emitted ASCII `---`/`--` glyphs in compiled PDF | **HIGH** (publication-blocking) | 13 |
| E2 | `ODTOE_dark_energy_merger.tex` (RU abstract, opening line) — `[ODTOE-1, ODTOE-2]` slug-citations | Builder defaulted to project-internal slug-form; abstract opens with opaque IDs unparseable to PRD/JCAP referee or NASA/ADS | **HIGH** (publication-blocking) | 13 |
| E3 | Coherencer EN P-02 raised "decision needed" on slug-vs-numerical citation style | Flag was bundled into RT-3 synthesis; operator's "применить full RT-3" approval was bundle-level, not per-OD; META did NOT surface the OD before Builder spawn (Hansei §2.5, §6 L-A7) | **HIGH** (process) | 13 |
| E4 | 8-check BL-A2 validity gate (cite_check / formula recompute / 50-digit / no-fitting / AI markers / plagiarism / consistency / evidence tag) — all source-side | NO check parses rendered PDF visually; PDF generated 6+ times across cycles, never opened by any agent (Hansei §4 Layer 2) | **HIGH** (framework gap) | 13 |
| E5 | RU body cites `[Slug-N]` / `[ODTOE-N]` while EN body uses numerical `[N]` | Cross-language parity broken on citation style; BL-19 sync rule covers existence, not stylistic alignment (Hansei §6 L-A8 / PR-6) | **MED** (parity) | 13 |
| E6 | "GREEN" verdict declared 2× by META (post Validator GREEN at Section 5; post Coherencer #2) on engineering checks alone | Meta-level confidence inflation: "all gates pass" treated as "ready", but gate set was incomplete for article-domain (Hansei §10) | **MED** (META) | 2 (META declarations) |
| E7 | "Hostile reviewer" Analyst persona simulated external view on *content* claims, NOT on *form* (slug, dashes, abstract decodability) | Persona scope was content-only; no naive-reader persona reading abstract-only without corpus context (Hansei §4 Layer 4) | **MED** (persona scope) | 13 |
| E8 | Avg B = 0.88 across all cycles; B-formula "measuring wrong things" (Hansei §10) | research-modality weights w_(1-σ)=0.35 caught engineering inconsistency (good) but not publication readiness (out of B's measurement scope) | **LOW** (acknowledged limit, not violation per se) | n/a |

## B. Rule mapping — which rule should have prevented each error

| Error | Existing rule that could apply | Mapping verdict | Coverage class |
|-------|-------------------------------|-----------------|----------------|
| E1 (dashes) | BL-6 Verify-Before-Act (L-017 amendment: "compile/render and attach output as proof") | **Partial** — BL-6 covers `compile` not `visual inspect`. Tectonic compiled successfully; output never visually opened. | Genuine framework gap — visual ≠ compile success |
| E2 (slug abstract) | BL-A2 cite_check + L-32 (project lesson — slug-citation form) | **Inverted** — L-32 *encouraged* slug form for project-internal use; BL-A2 cite_check verifies *resolution*, not external-reader decodability. Default-to-Builder via L-32. | Genuine framework gap — engineering vs publication readiness |
| E3 (OD bundling) | meta.md §14 item 7 + Inv 16 (operator decision matrix OD-1..N before Builder spawn for rework framing) | **Was-covered-but-only-for-rework** — Inv 16 mandates per-OD operator sign-off ONLY for rework framing trigger; non-rework "decision needed" flags have NO equivalent gate. | Genuine framework gap — OD discipline narrow-scoped |
| E4 (no visual gate) | BL-22 PRE-FLIGHT (verify endpoints/baseline) | **Wrong layer** — BL-22 verifies inputs to RT-1, not outputs from Builder. No post-compile visual gate exists. | Genuine framework gap — no `verify.method=visual_inspect` registered |
| E5 (parity stylistic) | BL-19 Bilingual Sync (RU+EN simultaneous) | **Partial** — BL-19 covers existence/structure parity, not stylistic alignment of citation notation across languages. | Genuine framework gap — BL-19 needs PR-6-equivalent extension |
| E6 (META GREEN inflation) | Inv 18 *proposed* (HEALTHY ≠ commit-ready); BL-31 Constrain Output Types | **Not-yet-codified** — Inv 18 is a *proposal* in Hansei, not yet binding. BL-31 caps META outputs but says nothing about "GREEN" semantics. | Genuine framework gap — Inv 18 missing |
| E7 (persona scope) | BL-29 Phantom Decoherence (glossary unification) | **Wrong axis** — BL-29 fixes intra-team terminology divergence; doesn't mandate naive-reader persona for abstract. | Genuine framework gap — adversarial naive-reader missing |
| E8 (B measures wrong) | BL-10 Multiplicative B + BL-33 Tier ladder | **Acknowledged limit** — B is engineering-validity proxy; publication readiness orthogonal. Hansei §10 explicitly diagnoses "B measuring wrong things". | Acceptable scoping; need PR-Gate as separate observable, not B-extension |

## C. Coverage gap classification

| Class | Errors | Notes |
|-------|--------|-------|
| **Lambda problem** (rule existed, not followed — BL-16) | E3 (partial — Inv 16 OD discipline existed for rework, was not generalized) | Only 1/8 → not the dominant failure mode this session |
| **Genuine framework gap** (no rule covers this class) | E1, E2, E4, E5, E6, E7 | 6/8 → dominant failure mode → motivates BL-A5 PR-Gate + Inv 17/18 (Hansei §6) |
| **Acknowledged limit / acceptable scoping** | E8 | B-formula known to measure engineering, not publication; correct response is orthogonal gate (PR-Gate), not B-redesign |

**Diagnostic:** This is NOT a BL-16 Lambda failure (knowledge ignored). It is a coverage gap (knowledge missing). Hansei §5 5-Why bottoms out at "EraDev v10 was code-first; article-domain extension stopped at engineering-validity." Fix = add gate, not exhort harder.

## D. Tier-claim integrity (T1/T2/T3/T4)

| Rule | Declared Tier | Actually fired? | Verdict |
|------|--------------|-----------------|---------|
| BL-6 verify-before-act | T2 (hook/CI) | Yes (compile passed) — but compile ≠ visual | T2-true for compile, **falsification candidate** for visual gate (T2 claim does not extend to render quality) |
| BL-A2 8-check validity gate | implicit T3 (checklist in Validator) | Yes (8 checks ran) | T3-true for engineering scope; **out-of-scope for publication readiness** (not a Tier failure, a scope failure) |
| BL-19 bilingual sync hook (`.githooks/bl19-bilingual-sync.sh`) | T2 (hook) | Yes (RU+EN both produced, structurally) | T2-true — but hook checks file existence, NOT stylistic parity (E5) → **scope-narrow T2**, candidate for tier-spec amendment |
| Inv 16 OD matrix for rework framing | T1-enforced (regex hook) | Did NOT fire (no rework trigger; non-rework "decision needed" has no detector) | T1 hook scope-correct; **gap is detector coverage**, not Tier integrity |
| Inv 11 Builder-completes-then-Validator | T2 (sequencing) | Yes (Validator after Builder, Coherencer gates) | T2-true |
| L-A5/L-A6/L-A7/L-A8/L-A9/L-A10 (post-Hansei) | newly created at Hansei | n/a — created BY this Hansei | Need Tier ascription on commit; default checklist (T3) but PR-Gate mechanizable as T2 hook (PDF text extraction → grep ASCII dashes / slug regex) |

**T2-falsification candidates (for L-52/L-53/L-54 family — see commit fccf730):**
- BL-6 "render = visual inspect" — needs explicit split: T2-compile vs T3-visual (no automated visual hook today). Recommend adding `verify.method=visual_inspect` to v10 verify registry with Read-PDF call as T3 checklist (no T1/T2 path until OCR/structure-aware tooling).
- BL-19 "bilingual sync" — needs PR-6 stylistic extension (citation notation, dash convention). Currently T2-files; should be T2-files + T3-stylistic via Coherencer.
- BL-A2 "validity gate" — Tier OK, scope wrong; rename to "Engineering-Validity Suite" per Hansei §6.

## E. Composition contract — was the task sized correctly?

| Question | Finding | Verdict |
|----------|---------|---------|
| Task classified S/M/L/XL? | XL article (full RU+EN, 8 artifacts, 13 cycles) — correct per `meta.md` §9 (XL = 10+ agents, RT cycles 3+L2) | **PASS** |
| Right team composition? | 5-role team + parallel RU/EN deployments + Coherencer #1/#2 + L1/L2 Validators + 10-agent RT-3 enhancement | **PASS** (composition matches XL) |
| RT-1 deliberation skipped? | NO — pre-flight Visionary composition-hazards (BL-34) + Analyst PRE-FLIGHT bibliography (BL-A4) + RT-1 5-role | **PASS** |
| Composition hazards grid produced? | YES (BL-34 satisfied: composition-hazards grid pre-Builder) | **PASS** |
| μ-check ran post-RT-1, pre-Builder? | Implicit via Coherencer #1; not labelled `[μ-check OK]` in transcript but functionally executed | **PARTIAL** — emit-tag discipline weak |
| OD-Open list maintained per Inv 17 (proposed) | NO — Inv 17 not yet promoted from Hansei proposal to binding invariant | **N/A** (rule not yet in force) |
| BL-A5 PR-Gate ran? | NO — does not exist yet | **N/A** (gap, not violation) |
| Cross-Builder consistency check (`meta.md` §9 sub-rule for XL with 2+ Builders) | Yes (Coherencer #1 cross-checked RU vs EN); style divergence on citations leaked through | **PARTIAL** — Coherencer scope didn't include citation style |

**Verdict:** Composition contract was executed correctly under EraDev v10's CURRENT rule set. The failure was NOT under-sizing, NOT bypassed deliberation, NOT skipped RT-1 — it was missing rules in the rulebook. This rules out BL-16 (Lambda problem) and isolates the diagnosis to coverage gap (Section C).

## F. Concise findings

1. **6/8 errors are genuine framework gaps**, not Lambda failures. Implies fix path = add BL-A5 PR-Gate + Inv 17 (OD discipline generalize) + Inv 18 (HEALTHY ≠ commit-ready), per Hansei §6.
2. **Tier integrity is largely intact** — T2 hooks fired where declared; gaps are scope-narrow, not falsification. Two T2 scope amendments needed (BL-6 visual split; BL-19 stylistic extension).
3. **Composition contract was correctly executed** under v10's current rulebook. Non-violation. The rulebook itself is incomplete for article-domain.
4. **Single Lambda failure (E3)**: Inv 16 OD-discipline existed for rework framing but was not generalized to non-rework "decision needed" flags. Generalization is mechanical.
5. **B-formula limit acknowledged** (E8): publication readiness is orthogonal to B; correct response is orthogonal gate (PR-Gate), not B-redesign.

## B-check (B_text, w=0.25 each)
- F=0.85 (read Hansei full + session-log samples + `BL-* `+`meta.md §14 / §9 / §13` + project config + lessons L-A5..L-A10)
- E=0.90 (audit-only, empirical lens, no theoretical/strategic spillover; satisfies operator "глубокое исследование" Analyst scope)
- (1-σ)=0.92 (file:line citations verifiable, severity per finding, classification mutually-exclusive)
- Λ=0.80 (applied BL-22, BL-29, BL-33, BL-A2, Inv 16, meta.md §14 / §9 / §13 / §X.1 — no contradictions detected)
- **B = 0.25·0.85 + 0.25·0.90 + 0.25·0.92 + 0.25·0.80 = 0.8675 (HEALTHY)**
