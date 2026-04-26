# Composition Hazards — BT-1 Visionary Structural Triad (P / M / D)

**Date:** 2026-04-26
**Author:** [VISIONARY] (5-role topology)
**Scope:** Inv 15 (BL-34) composition-hazards grid for BT-1 Pareto-prune wave addressing RT-11 §3 strategic triad. Operational lens, not philosophy.
**Source legs:** RT-11 Visionary report, lines 42-44 (R1/R2/R3), corroborated by lines 49-58 (lost/gained reading).
**Mandate:** Author BEFORE RT-1 per Inv 15. Three independent refactors → 3 pairs + 1 three-way required.

---

## 1. Triad reframe — operational lens (cure shapes per leg)

**P — Pruning organ atrophy** (RT-11 line 42, R1).
Cure shape: **scheduled retirement protocol + measurement scalar**, NOT a new role or new BL. Existing extend-points: (a) `lessons_archive.md` already exists as destination, (b) lessons.md temporal triple `<!-- valid_from | ended | superseded_by -->` is already the format primitive, (c) meta.md §530-548 Hansei already names "retire obsolete" but has no enforcement. Concrete artifact-class: **(i)** quarterly Coherencer-driven `retirement-pass-<date>.md` Hansei subtype with hard delta target (`net_lines_delta ≤ 0` over rolling 4-session window); **(ii)** new B-formula auxiliary scalar Ω_pruned (count of items moved-to-archive ÷ count of items added in same window) reported in bootstrap §9 alongside Ω(H_hist); **(iii)** lessons.md template entry "Retired this pass: [list]" required at every Hansei. No new BL number — this is BL-34/Inv 15 plus existing temporal triple, made operational. **Extend, don't add.**

**M — Meta-stack inversion** (RT-11 line 43, R2).
Cure shape: **structural separator at META prompt construction time**, NOT another deny-list hook. Per-call hooks (B4 enforce-delegation.sh) are symptom-treatment — they catch META mid-violation. Root cause is META mistaking "act on artifact" for "act on agent dispatch." Existing extend-points: (a) Inv 1 already says "META ALWAYS delegates," (b) hook `enforce-delegation.sh` exists, (c) the KILL-TEST in CLAUDE.md is the closest existing structural element. Concrete artifact-class: **(i)** strengthen KILL-TEST into a **two-phase output discipline** — META first emits an *intent declaration* ("I will spawn N agents for X") BEFORE any tool call, and the deny-list hook validates that the FIRST tool call after intent is an Agent spawn (not Edit/Write); **(ii)** new bootstrap §9 line "Intent-vs-action ratio: this session = M:N" — tracks how many declared intents resolved to Agent spawns vs direct edits. Treats inversion as a measurable, not a binary. **Extend the KILL-TEST and Inv 1 — do not add a new invariant.**

**D — Defensibility ≠ leverage** (RT-11 line 44, R3).
Cure shape: **B-formula amendment to score Λ_effective with operator-domain output denominator**, NOT a new gate or new role. Existing extend-points: (a) `B_modality` weight tables already exist, (b) Λ component in B-formula already names "experience," (c) the `eradev/lessons.md` and `roadmap.md` already track session-by-session deliverables. Concrete artifact-class: **(i)** redefine Λ in B-formula as `Λ = Λ_consulted × leverage_factor`, where `leverage_factor = operator_domain_artifacts_in_window ÷ framework_self_artifacts_in_window` (clipped to [0.2, 1.0]); **(ii)** mandatory bootstrap §9 leverage-ratio print; **(iii)** scheduled "leverage audit" at every 4-session boundary — if ratio < 0.3 over 4 sessions, ANDON the framework (not the operator). Honest re-anchor: Λ should *reward* outward-facing work, not just memory-consultation. **Extend B-formula — do not add a new metric outside it.**

---

## 2. Pair grid (3 pairs) — conflict / reinforce / independent

| Pair | Relation | Concrete failure mode if shipped same wave |
|---|---|---|
| **P × M** | **Reinforce, with shared dependency on bootstrap §9** | Both cures co-locate new prints in bootstrap §9 (Ω_pruned for P; Intent-ratio for M). If shipped uncoordinated, two PRs touch the same META section → merge conflict + bootstrap-checklist line-count blooms again (the very thing P is trying to suppress). **Reinforcement risk:** P retires items but M's KILL-TEST still references retired BL/Inv numbers in the deny-list. **Failure:** retirement of an Inv that the KILL-TEST or `enforce-delegation.sh` references → hook fails open, M's structural separator silently bypassed. Mitigation: P's retirement protocol MUST include a "downstream-references audit" (grep for retired ID across hooks/, .githooks/, role files) before flipping `ended` to non-null. |
| **P × D** | **Conflict** | P prunes "ornamental" items (RT-11 line 79, "imagined failures"); D's leverage-factor formula judges items by operator-domain output. **Failure mode:** P retires an Invariant/BL on age criterion; D's leverage audit later finds the retired item WAS load-bearing for an operator-artifact pattern that has not yet manifested in this 4-session window. P's retirement is irreversible (archive + supersede) within the prune cadence; D's leverage signal is post-hoc. **Concrete:** P retires Inv 14 (remote/dangerous ops) on low-recent-firing; next session operator requests SSH ops → D detects leverage gap but cure (re-instate Inv 14) is now a NEW Invariant, restarting accretion. Mitigation: P's retirement criterion MUST include "leverage_factor projection check" — only retire if both fire-frequency AND projected operator-domain leverage are low. |
| **M × D** | **Independent (low coupling)** | M operates on META's tool-call sequence (intent → Agent dispatch); D operates on session-boundary scoring. They touch different surfaces: M = per-call structural; D = per-window measurement. No direct coupling. **Latent coupling:** both modify bootstrap §9 print surface — but the two prints don't compete (Intent-ratio is per-session-running-counter, leverage-factor is rolling-4-session). Safe to ship independently. **Caveat:** if shipped without P first, leverage-factor will reward META that delegates 100× to spawn 100× lessons.md additions — D rewards expansion if P hasn't capped it. So while M×D is technically independent, the FULL value of D requires P to suppress framework-self artifact inflation. |

**Pair grid summary:** P-D is the genuine conflict; P-M reinforces but shares a conflict surface (bootstrap §9 + downstream-reference integrity); M-D is independent in mechanism but D's metric is inflated by missing P. **No pair is truly orthogonal — the three legs are coupled through bootstrap §9 and through what counts as a "framework-self" artifact.**

---

## 3. Three-way combination (P × M × D) — interlock sequence required

Per Inv 15, the three legs cannot ship as a parallel menu. Specify sequence:

**Recommended order: P → M → D**

Dependency rationale (not arbitrary preference):

1. **P first.** P installs the *substrate* both M and D need: a measurable inventory delta (Ω_pruned). M's intent-declaration discipline is moot if META can still trivially add invariants (M will be drowned by the very expansion M is trying to discipline). D's leverage-factor will report misleadingly high if framework-self artifact count is unbounded (denominator inflation). P creates the contraction baseline.
2. **M second.** Once P is suppressing inflation at session-boundary, M can attack the per-call inversion without fighting an inflating substrate. M's KILL-TEST extension and intent-vs-action ratio benefit from a lower-volume baseline. Critically: M depends on P's "downstream-references audit" being live, because M's KILL-TEST references specific Inv/BL numbers — those numbers must be stable (or retirement-aware) before M tightens.
3. **D last.** D measures leverage. Leverage-factor is only meaningful AFTER P caps the denominator (framework-self artifacts) AND M caps the per-call drift. If D ships first, leverage-factor reads as a complaint metric (always low) without operator-actionable cure. If D ships last, it functions as a *verifier* that P + M actually moved the needle. D becomes the post-condition test for the wave, not a third independent gate.

**Single-point-of-failure check:**

- If **P fails to ship** (retirement protocol gets blocked by Coherencer / operator vetoes archive criterion): M and D both ship into an inflating substrate; net effect is *negative* — more hooks, more metrics, more accretion, no contraction. **Abort wave; re-scope.**
- If **M fails after P ships:** P alone is partially valuable (contraction without inversion fix). D can still ship, but its leverage-factor will be noisy (per-call META violations distort what counts as a framework-self artifact vs. operator artifact). **Continue with D-as-monitor only; defer M to next wave.**
- If **D fails after P + M ship:** acceptable. P + M together address two of three R-class risks; D is the leverage-confirmation that the wave was net-positive. Without D, wave succeeds but un-measured. **Ship as P + M, add D in retrospective wave.**

**Conclusion:** The wave is fragile at P. P is the load-bearing first step. If P cannot ship cleanly, do not ship M or D — they will *deepen* the deterioration RT-11 named.

---

## 4. Sequencing recommendation

**Recommended order: P → M → D, sequenced (not parallel).**

Rationale (3 lines):
- P creates the contraction substrate that M and D both implicitly require — without it, the other two legs amplify the very inflation RT-11 named (R1 deepens, not closes).
- M depends on P's retirement-aware reference audit; shipping M before P risks KILL-TEST referencing retired IDs (silent hook bypass).
- D is a verification metric for the wave's net effect; it must observe P + M outcomes to mean anything — shipping it earlier makes leverage-factor a noise signal, not a verdict.

---

## 5. B-formula score (this composition-hazards artifact)

Uniform weights 0.25 each (code modality, v8-compatible default).

- **F (Focus):** 0.85 — RT-11 §3 read in full; current invariant inventory (CLAUDE.md), hook inventory (.claude/hooks/, .githooks/), and existing extend-points (lessons_archive.md, temporal triple, Hansei §530-548) all consulted before drafting cure shapes.
- **E (Alignment):** 0.85 — artifact serves Inv 15 / BL-34 mandate exactly; addresses the operator's explicit BT-1 scope (structural fixes, not tactical); does not stray into RT-1's responsibility (no new BL/Inv numbers proposed).
- **(1-σ):** 0.70 — honest declaration: the "three independent legs" framing is partially false. P-D conflict is real; P-M shares bootstrap §9 surface; M-D coupling via the leverage-factor denominator is non-trivial. The legs are not three orthogonal surgeries — they are one nested intervention with a fragile P-foundation. I am also aware of a possible **fourth hidden leg**: *measurement self-reference* (the very B-formula being amended in D is the same formula scoring this artifact — the framework grading itself with the metric it is also revising). Not addressed in this triad; flagged for RT-1.
- **Λ (Experience):** 0.80 — L-50 (extend>add) applied to every cure shape; existing scaffolding cited (lessons_archive, temporal triple, hooks/, KILL-TEST); RT-11 line ranges referenced; consistent with BL-34 grid format.

**B = 0.85 × 0.85 × 0.70 × 0.80 = 0.405**

**B < 0.5 → ANDON.**

ANDON reading: the artifact's own honest σ-value (0.30) reports that the triad-as-independent-legs framing — the framing the operator set up — is itself partially false. The composition is more entangled than "3 pairs + 1 three-way" admits. The 4th-leg flag (measurement self-reference) is the σ source. This low B is the finding, not a defect of the artifact: a clean B ≥ 0.5 here would require pretending the legs are more independent than RT-11 evidence supports.

---

## 6. Operator decision matrix

| Option | Description | When to choose | Risk |
|---|---|---|---|
| **(a) ship-all-3-now-sequenced** | P → M → D in order, single wave | If operator prioritizes full closure of RT-11 R1/R2/R3 in one window AND has session budget for 3-step sequence (~3-5 sessions) AND is willing to abort whole wave if P fails | High cost; abort rule must be enforced — partial ship into inflating substrate makes things worse |
| **(b) ship-pilot-first** ⭐ | Ship P alone; observe Ω_pruned over 2 sessions; THEN decide M and D | If operator prioritizes correctness of cure-shape over speed of closure; if uncertainty about whether P's retirement protocol will hit Coherencer veto; if 4th-hidden-leg (measurement self-reference) needs surfacing before D ships | Slower closure of R2/R3; window for new accretion during pilot |
| **(c) re-scope** | Split into smaller waves: BT-1a = P only; BT-1b = M only; BT-1c = D only; gap sessions between | If operator wants minimum-blast-radius per ship AND has reason to believe one leg is materially riskier than the other two | Three-times the spec/RT overhead per leg; defeats Inv 15's purpose (which is to prevent un-coordinated incremental adds, the very pattern that produced this triad) |

**Recommendation: (b) ship-pilot-first.**

P is load-bearing for the wave; its independent ship lets us observe whether the contraction substrate actually holds before M and D commit to it. Pilot also creates space to address the 4th-hidden-leg flag (measurement self-reference) — if D's revised B-formula needs Visionary RT-0 before shipping, the pilot window provides that. (a) is too brittle (P-failure blast radius too large); (c) defeats Inv 15.

---

## Cross-references

- RT-11 Visionary report §3, lines 42-44 (R1/R2/R3 — the triad source)
- RT-11 Visionary report lines 49-58 (lost/gained delta-window reading — supports leverage-factor design in D)
- CLAUDE.md Inv 15 (BL-34 composition-hazards mandate)
- CLAUDE.md Inv 17 (τ_cycle primacy — relevant to D's leverage-factor temporal scope)
- meta.md §530-548 (Hansei retire/prune language — extend point for P)
- projects/eradev/lessons.md temporal triple format (extend point for P)
- L-50 (extend>add — applied to all three cure shapes)
- BL-34 (the invariant invoking this artifact)

---

*End of composition-hazards artifact. Cures NOT proposed for implementation here — RT-1 will spec them.*
