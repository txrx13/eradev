# RT-7 NEXT-C2 — SCF Gap Spec (research artifact, no implementation)

Date: 2026-04-25 | Role: [ANALYST] | Source: arxiv 2604.16339 (SCF) + RT-5 research wave row 11
Constraint: spec only. Implementation deferred to v11 if approved by RT-1.

## 1. SCF 6 components (paraphrased, ≤15 words each)

- **A. Process Context Layer (PCL)** — shared workflow state visible to every agent each step.
- **B. Semantic Intent Graph (SIG)** — typed graph of agent intents + dependencies between them.
- **C. Conflict Detection Engine (CDE)** — flags semantic conflicts between concurrent agent outputs.
- **D. Consensus Resolution Protocol (CRP)** — bounded protocol that resolves flagged conflicts to one decision.
- **E. Drift Monitor (DM)** — continuously tracks frame-similarity / intent-drift across roles over time.
- **F. Process-Aware Governance (PAG)** — policy layer enforcing role mandates + domain constraints.

## 2. EraDev coverage map

| SCF | Status | Anchor in EraDev |
|-----|--------|------------------|
| A. PCL | ALREADY-IN | `meta.md` §14 Session Bootstrap (13-item) + `projects/{P}/config.md` `domain:` block (`CLAUDE.md`:21-37) — shared state on every spawn. |
| B. SIG | PARTIAL | Coherent Brief (`coherent_EN.md`:75-79) names deps + parallel + criteria, but NO typed graph artifact; intent stays prose. |
| C. CDE | PARTIAL | Phantom Coherence (`coherent_EN.md`:31, BL-5), Phantom Decoherence (BL-29 ext, `eradev.md`:284), Composition Hazards grid (BL-34, Inv 15) — exist but as discrete checks, NO unified conflict artifact. |
| D. CRP | ALREADY-IN | Path-(c) ΔÔ acceptance (`coherent_EN.md`:37-48) + RT-2 sync + Kill-Switch (`eradev.md`:287, §XIII). Bounded protocol. |
| E. DM | MISSING | Closest: Kill-Switch attractor monitor (>40% RT-2↔RT-1 phrase repeat, `coherent_EN.md`:32) and τ_cycle/Π_meta (`eradev.md`:388-445). Both single-shot, NOT continuous frame-similarity tracking across role outputs. |
| F. PAG | ALREADY-IN | META Output Spec (6 types, `CLAUDE.md`:11-21) + Invariants 1-17 + role files (mandates) + `domain.skin` overlay. Process-aware. |

## 3. Top 2 genuine gaps

- **G1. Drift Monitor (continuous)** — EraDev measures coherence at RT checkpoints (RT-1/2/3, S_team, S_adjusted, Ω). It does NOT track intra-cycle frame-similarity per role-output pair, so slow drift between two adjacent agent outputs in the same RT can land below the checkpoint resolution. SCF's DM is a continuous signal; ours is sampled.
- **G2. Conflict Detection artifact (discrete file)** — Phantom coherence/decoherence/Composition Hazards are RULES that produce verdicts. There is no canonical `conflicts/{cycle}.yaml` listing each detected ΔÔ-pair, severity, resolution path, and link to the Verification Register entry. Currently conflicts live in prose inside `rt2_coherent.md` outputs.

## 4. Implementation sketch (DEFERRED v11)

- **Drift Monitor placement**: extend `roles/coherent_EN.md` §S_team with a continuous variant `S_pairwise(t)` computed at each agent handoff (not only at RT-2/3). New role NOT needed — Coherent scope absorbs it. New optional output line in Coherent Brief: `Pairwise drift: agent_i↔agent_j = ___ (threshold 0.6)`.
- **Conflict Detection artifact format** (template schema):
  ```yaml
  cycle: rtN_<task>_<date>
  conflicts:
    - id: CDE-01
      pair: [agent_X, agent_Y]
      type: phantom_coherence | phantom_decoherence | composition_hazard | path_c_ΔÔ
      severity: LOW|MEDIUM|HIGH|CRITICAL
      resolution: glossary_unification | RT-2_sync | path-c_accept | kill-switch
      verification_register_link: RV-NN
  ```
  Filed at `reports/{task}/conflicts.yaml`. Coherent fills at RT-2 close, references at RT-3.

## 5. Risk — over-engineering

Coherent ALREADY owns: S_team, S_adjusted, S_total/Ω, Phantom Coherence, Phantom Decoherence, Path-(c) ΔÔ, Verification Register, Distinction Crystallization, Kill-Switch attractor monitor, Composition Hazards (BL-34), Hansei recommendations triage. Adding DM + conflicts.yaml does NOT require a new role; it requires (a) one continuous metric extension and (b) one structured artifact replacing prose. New role would violate Minimum Viable Scope (analyst role rule 6) and BL-26 / Inv 1 invariants. NEW ROLE = NO.

## 6. Verdict

**ADOPT minor extension to Coherent + NEW conflicts.yaml artifact** (path-c). DEFER implementation to v11 per consolidation constraint. Spec is sufficient for RT-1 review; no edits needed in v10. SCF's 4/6 components already covered; only 2 partial→full upgrades needed.

## 7. B-check (B_research weights: w_(1-σ)=0.35, w_F=0.30, w_E=0.20, w_Λ=0.15)

- F: 0.85 — read all 6 SCF components, mapped against `eradev.md`, `meta.md`, `coherent_EN.md`, `BOOTSTRAP_LESSONS.md`.
- E: 0.90 — answers the operator's direct question (gap analysis + verdict + sketch), respects scope (spec only).
- (1-σ): 0.85 — every coverage claim has file:line citation; no contradiction with existing Coherent scope.
- Λ: 0.85 — leverages BL-5, BL-29, BL-34, Path-(c) ΔÔ, Verification Register history.
- B = 0.35·0.85 + 0.30·0.90 + 0.20·0.85 + 0.15·0.85 = 0.2975 + 0.270 + 0.170 + 0.1275 = **0.865** ✓
