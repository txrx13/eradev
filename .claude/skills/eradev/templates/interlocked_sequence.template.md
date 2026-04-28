# Interlocked Sequence — {PROJECT} {DATE}

> Authored by: Coherent
> Triggered by: BL-35 rework-discipline audit (operator rework-framing detected)
> Operator directive: {verbatim quote}
> Active refactor window at trigger: {which phases were in flight}

## 1. Confirmation of BL-49 (rework-discipline audit)

[Short: why this document exists instead of parallel menu ship]

## 2. Scope re-validation — existing phases vs complaint class

| Operator symptom | Bug class | Phase that targets it | Status |
|---|---|---|---|
| ... | ... | ... | ... |

## 3. NO-GO confirmation (items rejected regardless of operator interest)

- **NO-GO A** — [item] [why rejected]
- **NO-GO B** — [item] [why rejected]
- ...

## 4. Bug/Failure class taxonomy

| Class | Pattern | Representative incidents | BD cost |
|---|---|---|---|
| ... | ... | ... | ... |

## 5. Composition hazards

[Reference the companion composition_hazards-<date>.md OR enumerate inline if <=6]

## 6. Interlocked Sequence (NOT menu)

### Month/Week 1 — Foundation (prerequisites)
- Phase X — [1 BD agent-hours | 5 BD wall-clock]
- Phase Y — [1 BD agent-hours | 3 BD wall-clock]

### Month/Week 2 — ...
- ...

Kill-switches active throughout:
- Feature flag: {db_column, values}
- Shadow mode: {phase, parity_metric, target}
- Systemd masks: {unit_list}

Shadow-mode windows:
- Phase X: >=7 days parity metric `X_parity_drift_total = 0`
- ...

## 7. Operator Decision Matrix (OD-1..OD-N)

| OD | Decision | Default if no answer | Blocks |
|----|----------|---------------------|--------|
| OD-1 | ... | ... | ... |

No Builder work starts on any refactor until the OD gating that refactor is answered or defaulted.

## 8. Expected outcome

[Class of bugs should become impossible to construct, NOT merely easier to find]

## B-self-check (Coherent, Jidoka)

F / E / (1-σ) / Λ / B = ___
S_team across RT-1 role agents: ___
Spiral gap (~2%): [open questions feeding next iteration]
