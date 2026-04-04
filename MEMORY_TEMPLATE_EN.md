# MEMORY.md -- TEMPLATE
# Copy to projects/<project>/MEMORY.md and fill in for the specific project.

---

## 1. Iron Rules

> Format: numbered list. Each rule is a single sentence.
> Rules DO NOT duplicate checklists; these are invariants whose violation = Andon stop.

1. [RULE]: ...
2. [RULE]: ...
<!-- Recommended range: 5-10 rules. More than 10 = Muri. -->
<!-- Each rule must specify WHO it applies to and WHAT to do upon violation. -->

---

## 2. Patterns

> Format: P<number> + role tags + description + checklist.
> Role tags: [Builder], [Validator], [Analyst], [Visionary], [Coherent], [Meta], [ALL].
> Severity: BLOCK | WARN | INFO.

### P1 [Builder][Validator] -- Pattern Name
- **Severity**: BLOCK
- **Context**: when and why it occurs
- **Checklist**:
  - [ ] verification item 1
  - [ ] verification item 2
- **Source**: iteration N, incident X

<!-- Categories: build/deploy, security, production, migration, process. -->
<!-- At 10+ patterns -- add an index table at the beginning of this section. -->
<!-- On conflict: new supersedes old, state explicitly. -->

---

## 3. Mega-Patterns

> Generalizations from multiple patterns. Format: MM<number>.

### MM1 -- Mega-Pattern Name
- **Generalizes**: P3, P7, P12
- **Statement**: ...

---

## 4. Metrics

> Computed after each RT-3 or on Meta-Agent request.

| Metric | Formula | Current Value | Threshold |
|--------|---------|---------------|-----------|
| B(agent) | F^w1 * E^w2 * (1-sigma)^w3 * Lambda^w4 | -- | > 0.5 |
| S_team | 1 - 2/(n(n-1)) * Sum\|Bi-Bj\| | -- | > 0.7 |
| P_coll | 1 - prod(1 - Bi^k) | -- | > 0.8 |
| fix rate | fix commits / total commits | -- | < 0.3 |
| fix chain | consecutive fixes in a row | -- | < 3 (otherwise BLOCK) |

> B components: F = focus (were the relevant files read), E = alignment with the task,
> sigma = inconsistency, Lambda = application of accumulated experience.
> k in P_coll must be specified explicitly. Default k=1.
> n in T(C) must be specified explicitly when calculating configuration lifetime.

---

## 5. Decision Log

> Format: date + decision + rationale + author + status.
> Status: ACTIVE | SUPERSEDED | REVERTED.

| Date | Decision | Rationale | Author | Status |
|------|----------|-----------|--------|--------|
| YYYY-MM-DD | Brief description | Why this approach | Role/Person | ACTIVE |

<!-- On SUPERSEDED -- include a reference to the new decision. -->
<!-- On REVERTED -- mandatory postmortem (link to A3). -->

---

## 6. A3 Templates (Links)

> After each RT-3 with a revert or critical incident -- fill in an A3.
> Files: projects/<project>/a3/A3_YYYY-MM-DD_<topic>.md

| Date | Topic | File |
|------|-------|------|
| -- | -- | -- |

---

## 7. Quick Start (for the Agent)

1. Read this file (MEMORY.md) FIRST.
2. Read your role prompt.
3. Read spiral_log.md (last 3 entries).
4. Begin working on the task.
5. After completion -- update metrics and Decision Log.

<!-- Reading order is fixed. Do not change without a Decision Log entry. -->
