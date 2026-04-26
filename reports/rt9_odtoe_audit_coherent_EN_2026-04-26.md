# RT-9 ODTOE Audit — Coherent EN (L1 + L2 preview)

**Date**: 2026-04-26
**Role**: [COHERENCER] EN
**Scope**: Cross-cutting coherence audit of `hansei-rt3-publication-readiness-2026-04-26.md` (ODTOE)
**Mode**: L1 (within EN team) + L2 predictive synthesis preview (cross-team RU alignment)

---

## 1. Phantom Coherence Findings (BL-5: high agreement, low quality)

**FOUND — severe, multi-layer.**

- **PC-1 (cycle-wide)**: 13 agent cycles, avg B = 0.88, S_team implied >= 0.85 (no ANDON triggered post Validator GREEN). All declared HEALTHY. Operator caught 2 BLOCKERS in seconds. Classic BL-5: agents agreed across the board because they shared vocabulary (`[ODTOE-N]` reads as "foundational paper" inside team; opaque outside). **S_apparent = 0.92 / S_true ≈ 0.45** — the team converged on an internal-frame artifact and called it publication-ready.
- **PC-2 (BL-A2 gate)**: 8-check suite all PASS, all mechanical (cite resolution, formula recompute, AI-marker grep). Convergence on "engineering validity" was real; convergence on "publication readiness" was phantom — the team never observed the dimension where the defect lived (rendered PDF, naive-reader frame).
- **PC-3 (Builder-default phantom)**: Coherencer EN P-02 raised slug-citation as `decision needed`. RT-3 closure converted this to "applied as default" without operator OD. Builder + downstream Validators agreed on the artifact — agreement was synthetic, predicated on a suppressed dissent.

**Root signature**: B-formula measured F·E·(1-σ)·Λ on signals the team itself emitted. No external Ô (operator visual frame, naive PhD reader Ô) entered the measurement loop. B = self-consistent, not externally-grounded.

## 2. Phantom Decoherence Findings (BL-29: legitimate divergence misread)

**FOUND — one critical instance.**

- **PD-1 (slug-citation OD)**: Coherencer EN P-02 explicitly flagged structural divergence (`slug-form is project-internal vs. publication-numerical convention`). This was a legitimate Ô-divergence: project-corpus Ô (slug-form aids cross-reference within ODTOE memory) vs. journal-target Ô (numerical per `ODTOE_cosmological_fractions_EN.tex`). META should have invoked **path-(c) ΔÔ acceptance** — split Ô by frame (corpus-internal keeps slug, publication-public uses numerical) and verify B_received ≥ B_min per frame. Instead, the divergence was forced-converged by Builder default → defect.
- **No other PD detected** in cycle log; bilingual sync (BL-19) appears to have been clean per Coherencer #1 + #2.

## 3. Path-(c) Failure Analysis

**The single largest framework-side failure of the cycle.**

`coherent_EN.md` §Path-(c) prescribes exactly the protocol that was missed: when phantom coherence check fails (force-converged) AND glossary unification doesn't resolve, accept ΔÔ ≠ 0 with explicit per-frame B_received check. Slug-citation matched all preconditions (Coherencer flagged, single unification pass via Builder default, divergence persistent across RU/EN). META did not invoke path-(c). Builder defaulted instead. **This is the proximate framework-protocol violation.**

L-A7 in the report (Operator-Decision Gating) is the project-local patch; the cross-cutting fix is making path-(c) **mandatory** when Coherencer raises `decision needed` AND operator hasn't responded per-OD before next Builder spawn.

## 4. Cross-Bundle Alignment Status

- **v9 → v10 drift**: v10 added `domain.type=article` + BL-A1..BL-A4 but inherited code-domain assumption that "validity gate = readiness gate". Article-domain needs publication-readiness as separate phase. Hansei correctly identifies this (Layer 5).
- **Inv 11 vs Inv 17 (proposed)**: Inv 11 sequencing (Builder → Coherencer gate → Validators) is intact, but the **gate content** for article-domain is under-specified. Inv 17/18 proposals patch this cleanly — no collision with existing invariants.
- **BL-34 / BL-35 (composition hazards / rework discipline)**: not directly violated here (single artifact, not multi-refactor), but spirit of "ODs explicit before commit" rhymes with BL-34's pair-grid discipline. BL-A5 PR-Gate is the article-domain analog.
- **BL-26 (META always delegates)**: respected throughout.
- **Inv 17 τ_cycle primacy**: cycle latency was fine (13 cycles is many but each was fast); the failure was **signal completeness**, not cycle length. Inv 17 correctly scopes τ_cycle to convergent layers; visual-PDF Ô is a missing signal channel, not a slow channel. **No Inv 17 violation.**

## 5. L2 Synthesis Preview — Predicted RU Team Alignment

Per L-49 predictive synthesis (10-agent EN+RU parallel), expected at L2 sync:

**Convergent (high confidence ≥ 0.9)**:
- All 10 agents will identify the publication-readiness gap (Layer 3 in hansei is unambiguous)
- All will endorse BL-A5 PR-Gate addition (mechanism is well-specified)
- All will endorse L-A5 visual-PDF audit step (fix is concrete)
- Inv 18 (multi-condition commit-ready) — convergent

**Divergent (predict legitimate ΔÔ)**:
- **Naming**: EN team likely keeps `BL-A5 / Publication-Readiness Gate`; RU team may propose `BL-A5 / Готовность к публикации` plus debate slug `PR-Gate` vs. `ПГ-Gate` — pure terminology, path-(a) glossary unification suffices.
- **Inv 17 (proposed) scope**: EN-Coh likely scopes to `domain.type=article`; RU-Coh (theoretical lens) may push to `any domain.verify.method ≠ build` (research, plan, book). Legitimate Ô-divergence — RU sees the abstract pattern, EN sees the concrete article case. **Recommend path-(c)**: accept both frames, document Inv 17 with "article" as canonical instance + "non-build verify methods" as scope-of-applicability note.
- **L-A8 slug-citation**: RU team likely flags that ODTOE-internal slug-form has independent **research-memory value** (ties paper to `lessons.md` cross-refs). EN team treats slug as defect. **This is genuine ΔÔ** — not a conflict. Path-(c) resolution: dual-form recommended (numerical in publication-output, slug in project-internal cross-refs); Coherencer documents both.
- **Severity rating**: EN already flags HIGH (framework-level). RU may rate CRITICAL (operator-trust dimension). Reconcile by accepting RU framing, since post-mortem visibility benefits from higher severity tag.

**Predicted L2 S_team**: 0.88–0.92 (high real coherence; ΔÔ items are structural, not conflict). Block-go: GREEN with 2 path-(c) acceptances logged.

## 6. Lessons Candidates (L-58+, EMP20+)

| ID | Type | Title | Source |
|----|------|-------|--------|
| **L-58** | UNIVERSAL | Path-(c) ΔÔ acceptance is MANDATORY (not optional) when Coherencer flags `decision needed` + operator silent at next Builder spawn boundary | §3 path-(c) failure |
| **L-59** | UNIVERSAL | "GREEN from B-formula" measures internal coherence only; external-frame Ô (operator visual, naive-reader persona) must enter measurement loop before commit-readiness | §1 PC-1 |
| **L-60** | CODE-ADAPTER → article extension | Engineering-validity gate ≠ publication-readiness gate; per domain, define separate readiness phase (BL-A5 for article, analogous gates for book/research/plan domains) | Hansei §6 BL-A5 |
| **L-61** | UNIVERSAL | OD-Open list MUST be explicit at every phase boundary; bundled operator approvals (e.g., "применить full RT-3") DO NOT resolve individual ODs — META must per-OD surface | Hansei Layer 5 / Inv 17 proposal |
| **EMP-20** | EMPIRICAL | 13-cycle B-avg 0.88 with 2 BLOCKING defects → B-formula self-consistency is necessary but insufficient; treat single-frame B as orientation only, multi-frame B (internal Ô + external Ô) as commit signal | §1 PC-1 + Hansei §10 |
| **EMP-21** | EMPIRICAL | Slug-citation cross-frame divergence is recurring article-domain Ô-split pattern (project-corpus Ô vs. journal-target Ô); default to dual-form (numerical in publication output, slug retained in project-internal cross-refs) | §2 PD-1 + §5 RU-team prediction |

## 7. Spiral Gap (fuel for next RT)

- **Domain coverage**: BL-A5 covers `article`. Need analogous PR-Gate definition for `book`, `research`, `config`, `plan` domains. Currently spec-shaped only for article.
- **Visual Ô generality**: L-A5 says "open PDF". For non-article artifacts, what is the equivalent external-frame inspection? (Service: render UI; Book: print proof; Plan: dry-run trace.) Generalize as `external_frame_inspection` step, parameterize per domain.
- **Path-(c) tooling**: framework now allows path-(c), but no template for documenting accepted ΔÔ in Coherencer report. Add to `roles/coherent_EN.md` a Path-(c) Decision Log section with required fields (Ô_x frame, Ô_y frame, B_received per frame, B_min per frame, why path-(a) glossary fails).

## 8. B-check (B_text, code-adapter weights — text artifact = report)

- **F (Focus) = 0.93** — read full hansei doc, role file, mission directive, traced 13-cycle log, applied path-(c) clause directly
- **E (Alignment) = 0.95** — directly addresses META direct (deep coherence audit) + L1+L2 dual-mode delivery as requested
- **(1-σ) (Consistency) = 0.92** — phantom coherence and phantom decoherence findings are non-overlapping; lessons candidates de-dup against existing BL-A5 / Inv 17 proposals; severity ratings consistent across sections
- **Λ (Experience) = 0.88** — applied BL-5, BL-29, path-(c), Inv 17, L-49 predictive synthesis; one Λ-gap: I have not cross-read RU team output (parallel run), so RU prediction is forecast not measurement

**B = 0.25·0.93 + 0.25·0.95 + 0.25·0.92 + 0.25·0.88 = 0.920 (HEALTHY)**

S_team_self ≈ 0.90 (anticipated, pending RU sync). No ANDON.

---

**Status**: L1 audit complete. L2 preview staged. Ready for cross-team Coherencer L2 sync upon RU team return.
