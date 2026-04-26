# RT-13 Coherencer Report (EN slot) — Implementation Composition Map for BT-1 (all-3 sequenced)

**Date:** 2026-04-26
**Role:** [COHERENCER] L1 (within-team) + L2 (between EN/RU)
**Domain:** code (skin: `templates/domain_skin.code.md`)
**Operator decision:** option (a) — ship all 3 (P, M, D) sequenced in single wave
**Inputs read:** `composition-hazards-2026-04-26-bt1_EN.md` (V-EN), `composition-hazards-2026-04-26-bt1_RU.md` (V-RU). Other RT-13 reports (A/B/Val × EN/RU) not yet present at start time — they remain advisory; this map will be re-checked by the L2 synthesis pass.
**Scope:** IMPLEMENTATION composition only — design-level sequencing, file-touch matrix, Builder count, skill mirror, pitfalls. NO code authored here.
**Mandate:** L-50 extend>add — confirm zero new BL/Inv IDs (cures EXTEND existing structure per both Visionaries). L-57 tight (concise, ≤90 lines). Honest σ on unresolved collisions.

---

## 1. File-touch matrix (artifact × cure)

Cell legend: **C** = collision (multi-cure same file/section, ordering required) · **D** = disjoint · **R** = reinforce-via-shared-section.

| File / surface | P (Φ⁻ retire protocol) | M (KILL-TEST + intent-decl) | D (Λ_eff leverage-factor) | Collision class |
|---|---|---|---|---|
| `meta.md` §14 Session Entry (item 9 / bootstrap §9 print) | edit — add `Ω_pruned` print | edit — add `Intent:Action ratio` print | edit — add `leverage_factor` print | **C (3-way, same section)** |
| `meta.md` §15 Hansei (retire/prune language) | edit — add quarterly retire-pass cadence | — | edit — add 4-session leverage audit | **C (P+D)** |
| `eradev.md` §II.1 B-formula (Λ definition) | — | — | edit — `Λ = Λ_consulted × leverage_factor` | D |
| `eradev_RU.md` §II.1 mirror | — | — | edit — RU mirror of Λ amendment | D (paired with EN above; BL-19) |
| `CLAUDE.md` Invariants (no new ID; Inv 1 + KILL-TEST extension) | — | edit — strengthen KILL-TEST into 2-phase (intent → spawn) | — | D |
| `CLAUDE.md` Identity Persistence (executable, per V-RU) | — | edit — make MEMORY auto-write executable not declarative | — | R (M-RU enrichment of M-EN cure) |
| `projects/eradev/lessons.md` (temporal triple auto-demote) | edit — add `auto_demote_on_ended: true` field; per-Hansei "Retired this pass" entry | — | — | D |
| `projects/eradev/lessons_archive.md` | edit — receive moved items at retire-pass; preserve supersede-link | — | — | D |
| `.claude/hooks/` deny-list / `enforce-delegation.sh` | edit — downstream-references audit for retired IDs (P-M reinforce mitigation) | edit — validate FIRST tool-call after intent declaration is Agent | — | **C (P+M, same hook surface)** |
| `templates/domain_skin.code.md` B-weight Λ rationale row | — | — | edit — note leverage-factor amendment | D |
| **Skill mirrors** (5 files, see §4) | mirrors P edits | mirrors M edits | mirrors D edits | C (every Builder triple-writes) |

**Critical collisions:**
1. `meta.md` §14 bootstrap §9 — all 3 cures add a print line. Confirms V-EN §2 P×M reinforce-on-bootstrap finding. Single Builder per language must own §9 across the wave (§3 build sequence enforces this).
2. `.claude/hooks/` — P needs reference-audit; M needs intent-validator. Same hook surface, different validators. Must merge cleanly.
3. `meta.md` §15 Hansei — P inserts retire-pass cadence; D inserts leverage audit. Adjacent sections, not same line; low risk if Builder is sequential.

**σ-flag (honest):** V-RU σ=0.35 (M+P possibly composite; potential 5th leg "dormant→active"). I do NOT resolve this here — operator chose (a), and the L2 synth + Validator gate at end-of-wave is the falsification venue. If Validator post-wave detects M-fix achieving zero behavioral effect over 2 sessions while P retires nothing real, the composite hypothesis is confirmed and the wave is rolled forward via Hansei (not back).

---

## 2. Build sequence under (a) — recommendation

**Build order: P → M → D (matches V-EN operational order).**

V-RU's theoretical D→M→P order is correct in ψ\*-attractor terms (axis re-anchor before stratification before contraction-operator install), but **for implementation correctness** the dependency graph in code-edit space points the opposite way:

```
P installs Ω_pruned print + retirement protocol + downstream-reference audit
   ↓ (P's reference-audit hook is a precondition for M)
M extends KILL-TEST referencing stable Inv/BL IDs (post-P, retire-aware)
   ↓ (M's intent-vs-action ratio uses post-P framework-self-artifact denominator)
D amends B-formula Λ; leverage_factor uses post-P, post-M denominator
```

**Dependency-graph rationale:**
- M's KILL-TEST contains specific Inv IDs (Inv 1, Inv 14, Inv 17). If P ships after M, P retires an Inv, M's hardcoded reference goes stale → silent hook-bypass (V-EN §2 P-M failure mode, line 28 verbatim). P-first guarantees M operates on a retire-aware ID space.
- D's leverage_factor denominator counts "framework-self artifacts." If D ships before P, the denominator is unbounded (P hasn't capped inflation yet) → leverage_factor reads as constant complaint (V-EN §3, line 46). D-last makes leverage_factor a **post-condition verifier** for the wave, which is what the operator-decision-matrix needs.
- D-EN ↔ D-RU bilingual sync (`eradev.md` + `eradev_RU.md` §II.1) is the largest BL-19 cost in the wave; deferring it to the end localizes the bilingual-batch and avoids re-syncing every step.

**V-RU theoretical order accepted as ΔÔ (Coherencer path-c, role file §Path-(c) ΔÔ acceptance):** V-EN operates on Ô_implementation (file-edit dependency); V-RU operates on Ô_attractor (ψ\*-stability under self-application). Both deliverables clear because B_received ≥ B_min for their respective layers — V-EN's order is correct for the build, V-RU's order would be correct if the wave were a runtime transformation of an already-deployed framework. Implementation wave = build, so V-EN wins, V-RU's framing recorded as L3 reference (potential lesson on theoretical-vs-implementation order mismatch).

---

## 3. Per-cure Builder spawn count

**Total Builders for implementation wave: 7** (sequenced — but EN/RU pairs within each cure go parallel per Inv 13 MAX parallelism).

| Cure | EN Builder(s) | RU Builder(s) | Parallel? | Total |
|---|---|---|---|---|
| **P** (retirement protocol) | 1 — `meta.md` §14+§15 + `lessons.md` field + `lessons_archive.md` + hook reference-audit | 1 — `meta_RU.md` §14+§15 mirror | EN ‖ RU | 2 |
| **M** (KILL-TEST + Identity executable) | 1 — `CLAUDE.md` KILL-TEST + Identity Persistence + hook intent-validator | 1 — `CLAUDE.md` mirror block + MEMORY auto-write executable | EN ‖ RU | 2 |
| **D** (B-formula Λ amendment) | 1 — `eradev.md` §II.1 + `domain_skin.code.md` row | 1 — `eradev_RU.md` §II.1 mirror | EN ‖ RU | 2 |
| **Skill mirror sweep** (final, after P+M+D) | 1 — mirrors all 3 cures into `.claude/skills/eradev/...` + zip rebuild | (same Builder handles RU mirrors — single mirror tree) | sequential after D | 1 |

Sequencing: P-EN ‖ P-RU → (Coherencer gate) → M-EN ‖ M-RU → (gate) → D-EN ‖ D-RU → (gate) → Skill mirror Builder.

**Validator placement:** one Validator per cure-gate (3) + one final wave Validator = 4 Validator agents, sequential after their respective Builder pair completes (Inv 11). EN/RU Validator pairing per cure if bilingual divergence suspected; otherwise single bilingual Validator.

---

## 4. Skill mirror sync plan

Every framework file edited above has a mirror under `.claude/skills/eradev/`. Single Builder, sequential after D ships.

| Source file | Skill mirror |
|---|---|
| `eradev.md` | `.claude/skills/eradev/core/eradev.md` |
| `eradev_RU.md` | `.claude/skills/eradev/core/eradev_RU.md` |
| `meta.md` | `.claude/skills/eradev/meta/meta.md` |
| `meta_RU.md` (if exists) | `.claude/skills/eradev/meta/meta_RU.md` |
| `CLAUDE.md` (loading + Inv changes propagate) | `.claude/skills/eradev/meta/LOADING_PROTOCOL.md` (KILL-TEST/Identity sections) |
| `templates/domain_skin.code.md` | `.claude/skills/eradev/templates/domain_skin.code.md` |
| `projects/eradev/lessons.md` (template only — project content is not mirrored, but auto-demote field schema is a template change) | `.claude/skills/eradev/templates/cross_harness_requirements.md` (if temporal triple schema is referenced there; verify) |

**Action:** mirror Builder runs `diff` between source and mirror per file, applies forward-only merge (mirrors never lead source), then runs skill zip rebuild (`.claude/skills/eradev` → `.claude/skills/eradev.zip` if pipeline exists; else manual archive). Validator on mirror Builder confirms `git status` shows mirrors in sync with source post-edit.

---

## 5. Implementation-time pitfalls (with mitigation)

1. **Multi-Builder same file collision** — `meta.md` §14 (3-way C) and `.claude/hooks/` (2-way C). **Mitigation:** P-Builder owns §14 entirely for the P phase, hands clean file to M-Builder (which appends, not edits-in-place); D-Builder appends last. Single-Builder-per-file-per-phase rule. NO parallel Builders on the same file within a single cure.
2. **BL-19 bilingual sync gate** — every cure has EN+RU pair. **Mitigation:** EN/RU Builders for the same cure spawn in same META call (parallel), Coherencer L2 verifies parity at gate before next cure. RU Builder receives EN's diff as input to ensure terminology mirror.
3. **Universality Gate** — no `projects/eradev/` hardcodes in framework files (`eradev.md`, `meta.md`, `CLAUDE.md`, `domain_skin.code.md`). **Mitigation:** P's `lessons.md` auto-demote field is a SCHEMA change (templated in `templates/`), not a hardcoded reference to `projects/eradev/lessons.md`. Builder spec must phrase "any project's lessons.md," and Validator greps for `projects/eradev/` in framework diffs (must be zero hits).
4. **PN-1 hook (phantom-newness)** — any new BL/Inv ID triggers PN-1. Per V-EN and V-RU L-50 audits: **all 3 cures EXTEND existing structure**, ZERO new BL/Inv IDs. **Confirmation:** P extends BL-34/Inv 15 + temporal triple; M extends Inv 1 + KILL-TEST; D extends `eradev.md` §II.1 B-formula. Builders MUST NOT introduce new IDs — Validator checks PN-1 hook stays GREEN. If a Builder feels "I need a new BL," that's a signal to STOP and re-scope back through Coherencer (BL-3 fix-chain primer, before chain forms).
5. **τ_cycle primacy (Inv 17)** — sequencing 3 cures × bilingual + Validator gates risks long τ_cycle if not properly batched. **Mitigation:** Per-cure EN+RU Builders parallel (Inv 13 MAX), Coherencer gate is spec-check only (no re-RT), Validators sequential per cure but within-cure both languages can verify in parallel. Target: ≤ 2 sessions per cure, total wave ≤ 6 sessions including skill mirror.
6. **D's recursive B-scoring (V-EN 4th-leg flag, V-RU σ=0.35)** — D amends the Λ formula that scores D itself. **Mitigation:** D's own Hansei B-score uses pre-amendment formula (frozen at wave start) by Coherencer convention; post-amendment formula activates in the NEXT session's bootstrap §9. This avoids the framework-grading-itself-with-the-metric-it-revises trap. Document this convention in D-Builder spec.
7. **Wave abort criterion (V-EN §3, single-point-of-failure)** — if P fails to ship cleanly (Coherencer veto on retire criterion, or hook reference-audit reveals broken downstream refs), M and D MUST NOT proceed. Operator decision matrix says (a) is brittle at P. **Mitigation:** Coherencer gate after P is HARD — no green = no M spawn. Roll back to (b) ship-pilot-first via Hansei.

---

## 6. Jidoka B-check (this artifact)

- **F = 0.85** — both Visionary hazards reports read in full; meta.md §14/§15, CLAUDE.md KILL-TEST + Identity Persistence, eradev.md §II.1, skill mirror layout, lessons_archive presence all verified.
- **E = 0.85** — output matches operator's exact request: file-touch matrix, build sequence with rationale, Builder count + per-cure breakdown, skill mirror plan, pitfalls with mitigation, B score. No straying into proposing new BLs or doing the implementation.
- **(1-σ) = 0.75** — honest σ=0.25: V-EN/V-RU build order divergence resolved via path-(c) ΔÔ acceptance (legitimate, role-file §43-48), but V-RU's σ=0.35 4th/5th-leg flag is propagated forward not resolved. Three collisions identified (§14 3-way, hooks 2-way, §15 P+D adjacent) — mitigations specified, but unresolved-residual = the M-RU "executable Identity" framing partially overlaps M-EN "two-phase intent declaration"; merged into one M cure here, but if Validator finds them non-equivalent, M ships in two sub-steps (M1 = intent declaration; M2 = MEMORY auto-write), adding 2 Builders.
- **Λ = 0.85** — L-50 (extend>add) audited ZERO new IDs; L-53 (path-c ΔÔ) used for V-EN/V-RU order reconciliation; L-57 (concise) maintained ≤90 content lines; Inv 11 (Builder→Validator sequential), Inv 13 (MAX parallelism EN‖RU), Inv 17 (τ_cycle) all applied; BL-19 bilingual sync, BL-34 composition-hazards lineage referenced; FOUNDATIONS §12 (V-RU's ψ\*) acknowledged via path-c.

**B = 0.85 × 0.85 × 0.75 × 0.85 = 0.460.** **B < 0.5 → ANDON (advisory).**

ANDON reading: same as V-EN — the 3-cure framing is partially entangled. (1-σ)=0.75 reflects honest residual divergence between EN and RU Visionary axes (build-order vs ψ\*-order). I have given operator the implementation order (P→M→D) needed to ship; the entanglement is a meta-level σ that should be folded into the next bootstrap's Ω(H_hist) reading after the wave completes. Not a defect of the map; the ANDON IS the finding.

---

## 7. Spiral gap

V-RU's potential 5th leg ("dormant→active conversion absent" — recursive disease where framework patches self by adding new organs instead of activating dormant existing ones) is NOT addressed by this map. If true, the wave itself enacts the very disease (we are activating dormant Identity Persistence + dormant temporal triple + dormant B-formula Λ — but doing so by EDITING new content into them, not by writing pure activation hooks). Fuel for next RT-1 post-wave Hansei: did the wave activate dormant organs, or did it add new ones disguised as activations?

---

## Summary (5 lines)

1. File-touch matrix shows 3 collisions (`meta.md` §14 = 3-way; `.claude/hooks/` = 2-way; `meta.md` §15 = adjacent), all resolvable by single-Builder-per-file-per-phase + sequenced phases.
2. Build sequence: **P → M → D** (V-EN order wins for implementation; V-RU's D→M→P theoretical order accepted as ΔÔ via path-c, recorded for L3 reference).
3. Total Builder count: **7** (P-EN+P-RU, M-EN+M-RU, D-EN+D-RU = 6, plus 1 skill-mirror Builder at end); Validators: 4 (one per gate + final wave).
4. Skill mirror: 5-7 files under `.claude/skills/eradev/{core,meta,templates}/` + zip rebuild — single sequential Builder after D ships.
5. PN-1 confirmed GREEN: ZERO new BL/Inv IDs (all 3 cures EXTEND); honest σ=0.25 propagates V-RU σ=0.35 unresolved 4th/5th-leg flag forward as spiral gap fuel.

---

**B-score:** 0.460 ANDON (advisory; honest σ on inter-Visionary axis divergence + V-RU residual flag).
**Recommended build sequence:** P → M → D (sequenced cures; EN ‖ RU within each cure; skill mirror sweep last).
**Total Builder count:** 7 (6 cure-Builders in 3 EN+RU pairs + 1 skill-mirror Builder).

---

*Cross-references:* V-EN composition-hazards (P×M reinforce, P×D conflict, M×D independent) | V-RU composition-hazards (D→M→P theoretical, σ=0.35 declared) | role file §Path-(c) ΔÔ acceptance (used for V-EN/V-RU order reconciliation) | meta.md §14 (bootstrap §9) | CLAUDE.md Inv 1, 11, 13, 17 + KILL-TEST + Identity Persistence | L-50 extend>add | L-57 tight | BL-19 bilingual sync | BL-34 / Inv 15 composition-hazards lineage.

*End of Coherencer EN composition map. No code authored; design only.*
