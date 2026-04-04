# Proposals from Plugy Session 2026-04-04

> These items were produced during RT-1 + RT-2 coherence check in the plugy project.
> They are NOT yet in core eradev/ files. To be reviewed and merged in a dedicated eradev session.

---

## Accepted by RT-2 but NOT yet in remote core

### 1. BL Budget Cap (BOOTSTRAP_LESSONS.md header)
**Status:** Accepted by RT-2, not in remote
**Change:** Add note to header:
```
> Budget cap: maximum 30 BL entries. Adding BL-N (N>30) requires merging or retiring existing entries first.
```
**Rationale:** Validator flagged prompt overload (~1400 lines loaded before work). Discipline mechanism.

### 2. BL-18: Graduated Thresholds
**Status:** Accepted by RT-2, not in remote
**Change:** In BL-18 Rule, after "STOP and formally reclassify" add:
```
Graduated: 1.5x = YELLOW (log warning, continue with monitoring), 2x = RED (mandatory stop and reclassify).
```
**Rationale:** 2x threshold is too late. 1.5x gives early warning.

### 3. BL-26: Cross-reference to L-016
**Status:** Accepted by RT-2, not in remote
**Change:** Append to BL-26 Why paragraph:
```
Confirmed by L-016: META coded directly for 2.5 hours in session 2026-04-02/03 despite reading the framework.
```
**Rationale:** Empirical confirmation of BL-26. Strengthens the lesson.

---

## Rejected from core by RT-2 (project-specific)

### Rate Limit Heuristic Counter (L-019/L-020)
**Reason:** Technology-specific (depends on API provider, tier, model). Not universal.
**Lives in:** projects/plugy/lessons.md as L-019, L-020

### S_session < 0.5 = Mandatory Process Freeze
**Reason:** Threshold arbitrary. Existing S_session < 0.15 RED in eradev.md suffices.

---

## Deferred

### Structural decomposition: eradev.md → eradev_core.md + eradev_ops.md
**Reason:** L-size refactoring, needs separate RT-1. eradev.md = 470+ lines, Validator flagged attention degradation.

---

## Session Metrics
- S_session (Cycle 2) = 0.586 (YELLOW)
- 13 agents spawned, GREEN zone
- Full RT-1 (5 roles) + RT-2 Coherencer filter applied
- Validator: GO on all 7 implemented changes
