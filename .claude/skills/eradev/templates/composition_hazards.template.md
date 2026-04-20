# Composition Hazards Grid — {PROJECT} {DATE}

> Authored by: Visionary
> Triggered by: >=2 refactors in one release window (BL-34)
> Release window: {dates}
> Refactors enumerated: R1 {name} / R2 {name} / ... / RN {name}

## Pair Grid (N*(N-1)/2 pairs)

| Pair | Impact | Precondition | Mitigation | Sequencing constraint |
|------|--------|--------------|------------|-----------------------|
| R1 x R2 | [HIGH/MED/LOW + what breaks] | [state/config/data needed] | [specific action] | [R1 before R2 / parity window / shadow mode / kill-switch] |
| R1 x R3 | ... | ... | ... | ... |
| ...  | ... | ...          | ...        | ...                   |

## Three-way combinations (N-choose-3, only if N >= 3)

| Triple | Impact | Mitigation |
|--------|--------|------------|
| R1 x R2 x R3 | ... | ... |
| ...          | ... | ... |

## Interlocked Sequence (DAG, NOT menu)

Week 1: R_a (prerequisite for all)
Week 2: R_b (depends on R_a parity window >= 7 days, parity metric = 0)
Week 3: R_c (depends on R_a AND R_b)
...

## Kill-Switches

- Per-feature flag: {how to roll back each refactor independently}
- Shadow-mode windows: {>=7 days parity-metric=0 for each}
- Parity metrics per refactor: {metric_name, target=0}

## Operator Decision Matrix (if applicable)

| OD | Decision | Default if no answer | Blocks |
|----|----------|---------------------|--------|
| OD-1 | ... | ... | ... |
| OD-2 | ... | ... | ... |

## B-self-check (Visionary, Jidoka)

F / E / (1-σ) / Λ / B = ___
S_team (if cross-role input): ___
Fix chain: 0 (this is a grid, not a patch)
