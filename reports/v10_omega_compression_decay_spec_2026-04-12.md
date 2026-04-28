# v10 Combined Spec: Omega Computation + BL Compression Protocol + Temporal Decay

> Date: 2026-04-12
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> Task type: design / specification / framework infrastructure
> B-modality: **B_text** (uniform weights 0.25 each -- framework infrastructure)
> Output type: Report (META output #5)
> Scope: 3 implementable v10 items that share the Memory Hierarchy substrate
> Preceded by: `reports/v9_phase2b_memory_hierarchy_spec_2026-04-12.md` (Phase 2.B infrastructure), eradev.md Section III.Omega (formula definition), meta.md Section 14 (session entry protocol)

---

## 0. Activation Operator Log

- **A_F (Focus):** Read in full: `roles/analyst_EN.md` (mission + activation + jidoka); `eradev.md` Section III.Omega (lines 281-335: formula, predicate, 4 relevance checks, RT-3 reporting format, thresholds, 3 deferred OQ-Omega items); `meta.md` (full: Section 14 session bootstrap 13-item checklist with items 2/9/11 memory-related, Section 7b Agent Prompt Template, Lambda Audit protocol); `BOOTSTRAP_LESSONS.md` (30 BL at budget cap, split into 22 UNIVERSAL + 8 CODE-ADAPTER); `BL_CANDIDATES.md` (empty, 0 candidates, process header defined with 5-step Coherent protocol); `projects/eradev/lessons.md` (37 lessons L-1 through L-37, 12 EMPs EMP1-EMP12, temporal metadata present on all entries, all [ACTIVE], none with `ended` dates); `projects/odtoe-articles/lessons.md` (39 lessons L-1 through L-39, 8 AMPs, temporal metadata present, cross_project tags on ~15 entries); `reports/v9_phase2b_memory_hierarchy_spec_2026-04-12.md` (full: T1/T2/T3 architecture, Closet/Drawer split, temporal triples schema, BL staging, reports INDEX, cross-project scan protocol, implementation plan); `CLAUDE.md` (14 invariants, domain awareness, loading sequence, language stack).

- **A_E (Alignment):** META's task: produce a combined spec for 3 closely related v10 items concrete enough for a single Builder session (~200-400 lines of modifications). The 3 items share the same data substrate (lessons.md with temporal metadata, BL_CANDIDATES.md, meta.md tiered loading). Intent is to close the 3 deferred OQ-Omega items from eradev.md and make the Phase 2.B infrastructure actually produce numerical output. This is not new formalism -- the Omega formula already exists; this spec activates it.

- **A_sigma (Consistency):** Checked for conflicts:
  - Omega formula is defined in eradev.md Section III.Omega and is NOT modified by this spec -- only activated.
  - meta.md Section 14 was already updated by Phase 2.B for cross-project scan (item 9) -- this spec adds Omega computation to that protocol.
  - BL_CANDIDATES.md exists with a process header that already defines a 5-step compression flow -- this spec formalizes the Coherent protocol that executes it.
  - Temporal decay adds freshness scoring to lessons.md but does NOT modify the lesson entry format (valid_from/ended/superseded_by already exist from Phase 2.B).
  - No conflict with Phase 2.A skins, Phase 2.C extraction, or v9 GA features.
  - Lambda_effective = Omega * Lambda changes the B-score -- but eradev.md Section III.Omega already defines this equation; the spec only adds the computational trigger.

- **A_Lambda (Experience):** Applied:
  - BL-16: knowledge without enforcement = Lambda zero. The Omega formula existed in v9 but was never computed. This spec adds the enforcement trigger.
  - BL-3: fix chain > 3 = structural problem. Applied to BL compression -- the BL-3 guard prevents compression loops.
  - BL-11: scope creep is Muda. Each of the 3 items has a bounded scope -- no new formulas, no new file formats, only protocol additions to existing files.
  - BL-30: defense-in-depth. Omega is reported at 2 points (session bootstrap + RT-3), not just one.
  - EMP4: enforcement must live where it fires. Omega computation fires at Lambda Audit (meta.md item 9), so the protocol lives there.
  - EMP12: Phase 2 is infrastructure, not features. These 3 items activate the Phase 2.B infrastructure -- they are the return on the infrastructure investment.
  - L-35: technical feasibility gates aspirational roadmap items. All 3 items are implementable with existing files and protocols -- no new tooling dependencies.

All 4 Activation Operator steps GREEN. Proceeding with specification.

---

## 1. Item 1: Cross-Project Omega(H_hist) Computation

### 1.1 Current State

eradev.md Section III.Omega defines the formula:
```
Omega(H_hist) = 1 + alpha * log(1 + N_relevant)
Lambda_effective = Omega * Lambda  (per-agent)
S_total = S_adjusted * Omega      (per-team, reported at RT-3)
```

The formula exists. The relevant lesson predicate (4 structural checks) exists. The RT-3 reporting format exists. The cross-project scan protocol exists (meta.md Section 14 item 9, Phase 2.B). What is missing: the trigger to compute Omega and report it numerically.

v9 caveat (eradev.md line 328): "v9 does NOT require Omega computation. Agents operate with Omega = 1 by default."

### 1.2 Trigger

Omega is computed at TWO points:

**Point A: Session start (Lambda Audit, meta.md Section 14 item 9).**
After the Coherent's cross-project scan (Phase 2.B protocol), count N_relevant. Compute Omega. Report in bootstrap output. This is the per-session Omega baseline.

**Point B: RT-3 (Coherence Report).**
Coherent recomputes N_relevant using the 4-predicate relevance test against the ACTUAL task that was executed (not the pre-task estimate from session start). Report Omega in the RT-3 Coherence Report (format already defined in eradev.md).

### 1.3 Computation Protocol

**Step 1: Gather cross-project lessons.**
This step already exists in meta.md Section 14 item 9 (Phase 2.B cross-project scan protocol). Read all `projects/*/lessons.md`, filter for `cross_project: true` AND `ended: null`.

**Step 2: Apply relevance predicate.**
For each cross-project lesson L, test against the current task T using the 4 predicates from eradev.md Section III.Omega:

1. **Same role invoked** -- T spawns the same agent role as the agent that generated L.
2. **Same task modality** -- T and L share `domain.type` (or T's modality inherits from L's).
3. **Same artifact type** -- T produces the same artifact class as L (e.g., both `.tex`, both YAML config).
4. **Same failure fingerprint** -- T's pre-mortem names a failure mode that L directly addresses.

A lesson satisfying ANY one predicate counts as relevant. A lesson satisfying MULTIPLE predicates still counts ONCE (phantom-coherence defense per eradev.md).

**Step 3: Compute.**
```
N_relevant = count of lessons passing >= 1 predicate
Omega = min(1 + 0.15 * ln(1 + N_relevant), 2.500)
```

**Step 4: Apply.**
- Per-agent: `Lambda_effective = Omega * Lambda` (used in B-score computation).
- Per-team at RT-3: `S_total = S_adjusted * Omega`.

### 1.4 Output Format

**At session bootstrap (after item 9 completes):**
```
=== OMEGA COMPUTATION ===
Cross-project lessons scanned: {total_cross_project}
Lessons matching current task (N_relevant): {N}
  Predicate 1 (same role): {count}
  Predicate 2 (same modality): {count}
  Predicate 3 (same artifact): {count}
  Predicate 4 (same failure): {count}
  (de-duped, each lesson counted once)
Omega: {value} (range: 1.000 - 2.500)
Effect: Lambda_effective = Omega * Lambda = {value} * Lambda for each agent
```

**At RT-3 (existing Coherence Report, new fields):**
```
=== RT-3 COHERENCE REPORT ===
S_team:       {value}
B_mean:       {value}
S_adjusted:   {value}
N_relevant:   {value}
Omega:        {value}
S_total:      {value}  ({assessment})
```

This format already exists in eradev.md Section III.Omega. No change needed to the format -- only to the enforcement (it was optional, now it is computed).

### 1.5 Implementation

**File: `meta.md` Section 14 item 9** -- add Omega computation step after cross-project scan:

Current text (Phase 2.B):
```
[ ] 9. LAMBDA AUDIT: Coherent reads projects/{PROJECT}/lessons.md (T2 active [ACTIVE] entries only)
       and announces 3 relevant lessons + 2 mega-patterns (BL-4).
       If Lambda gap detected: Coherent searches T3 (lessons_archive.md, cross-project scan).
       Cross-project scan: for each OTHER project in projects/, read lessons.md,
       filter for cross_project: true AND ended: null, load relevant ones into T2 context.
       If lessons.md active count > 50: trigger compression pass (Coherent, see spec).
```

New text (v10 addition after cross-project scan):
```
       After cross-project scan: compute Omega(H_hist).
       Apply 4-predicate relevance filter (eradev.md Section III.Omega) to task T.
       Report: N_relevant, Omega, Lambda_effective = Omega * Lambda.
       If Omega > 2.0: YELLOW -- memory dominance detected, consider fresh thinking.
       If Omega = 1.000 (no relevant cross-project lessons): log, no alarm -- backward compat with v9.
```

**File: `eradev.md` Section III.Omega** -- remove the v9 caveat paragraph (line 328):

Remove: "v9 honest caveat. Omega is a theoretical placeholder in v9 [...]"
Replace with: "v10 activation: Omega is computed at session start (Lambda Audit, meta.md item 9) and at RT-3. Projects with no cross_project lessons produce Omega = 1 (no regression from v9 default)."

Also remove or update the "Three Open Questions for v10 (deferred)" block at lines 330-333 -- OQ-Omega-1 (temporal decay) and OQ-Omega-2 (cross-project) are answered by this spec. OQ-Omega-3 (alpha calibration) remains deferred to v11 pending real Omega data.

### 1.6 Backward Compatibility

- Projects with no `cross_project: true` lessons: N_relevant = 0, Omega = 1.000. Identical to v9 default.
- Projects with no `domain:` block: default `type=code`. Relevance predicate still works (matches `type=code`).
- S tasks (no RT-3): Omega is computed at session start only. No RT-3 reporting needed for S tasks.
- The formula, thresholds, and reporting format are UNCHANGED from eradev.md. Only the trigger changes from "optional" to "computed."

---

## 2. Item 2: BL Coherent Compression Protocol

### 2.1 Current State

BL_CANDIDATES.md exists at repo root. Count = 0. The process header defines 5 steps but no Coherent agent protocol (no classification taxonomy, no PROMOTE/MERGE/DISCARD decision tree, no BL-3 guard).

Phase 2.C extraction prompt produces candidates via CronCreate or /extract skill. The pipeline feeds BL_CANDIDATES.md. But no consumer protocol exists.

### 2.2 Trigger

BL_CANDIDATES.md reaches >= 5 entries. Checked:
- By Coherent at session start (Lambda Audit, meta.md item 9).
- By extraction prompt after writing a new candidate (at :17 and :47 marks per Phase 2.C CronCreate).
- Manually by META when operator requests it.

### 2.3 Agent

Coherent role. Agent prompt includes:
1. Read `roles/coherent_EN.md`, apply Activation Operator.
2. Read `BL_CANDIDATES.md` (full).
3. Read `BOOTSTRAP_LESSONS.md` (full, currently 30 entries).
4. Read `projects/eradev/lessons.md` (scan for relevant lessons that might inform classification).
5. Execute the compression protocol below.

### 2.4 Classification Taxonomy

For each candidate in BL_CANDIDATES.md, the Coherent classifies it as one of:

| Classification | Meaning | Action |
|---------------|---------|--------|
| **PROMOTE** | Novel failure mode not covered by any existing BL | Create new BL entry (requires budget slot) |
| **MERGE** | Candidate strengthens an existing BL with new evidence | Amend existing BL's Why/Source section |
| **DISCARD** | Noise, project-specific, or already fully covered | Remove from candidates, log reason |
| **DEFER** | Plausible pattern but insufficient evidence (< 2 occurrences) | Keep in BL_CANDIDATES.md for next pass |

### 2.5 Protocol (step by step)

```
COMPRESSION PROTOCOL (Coherent)

Input: BL_CANDIDATES.md with >= 5 entries
       BOOTSTRAP_LESSONS.md (current 30 BL)

Step 1: READ
  Read all candidates. Read all BLs. Build overlap matrix:
  for each candidate C, for each BL B:
    overlap(C, B) = do C and B address the same failure mode?
  Result: overlap_matrix[C][B] = true/false

Step 2: CLASSIFY
  For each candidate C:
    IF overlap_matrix[C][*] has any TRUE:
      C.classification = MERGE
      C.merge_target = B with highest overlap
    ELSE IF C has >= 2 independent evidence sources:
      C.classification = PROMOTE
    ELSE IF C is project-specific (references specific files/tools that don't generalize):
      C.classification = DISCARD
      C.discard_reason = "project-specific, does not generalize"
    ELSE:
      C.classification = DEFER
      C.defer_reason = "insufficient evidence, keep for next pass"

Step 3: BUDGET CHECK (for PROMOTE candidates only)
  Current BL count (active, non-merged, non-archived).
  IF count < 30:
    Slot available. Proceed to Step 4.
  IF count >= 30:
    Identify weakest existing BL using staleness criteria:
    (a) Not referenced by any [ACTIVE] lesson in any project's lessons.md
    (b) Not triggered in any report from the last 3 sessions
    (c) Tagged [CODE-ADAPTER] (universal BLs are protected)
    IF weakest BL found:
      Archive weakest BL (move to ## Archived section per Phase 2.B spec).
      Freed slot. Proceed to Step 4.
    IF no archivable BL found:
      Reclassify PROMOTE -> MERGE (find closest existing BL to absorb the insight).
      Log: "BL budget full, no archivable BL found, forced merge."

Step 4: EXECUTE
  For each PROMOTE:
    Write new BL entry in BOOTSTRAP_LESSONS.md (or split file).
    Assign next BL number (never reuse old numbers, per OQ-2B-5).
    Tag [UNIVERSAL] or [CODE-ADAPTER] based on applicability.
  For each MERGE:
    Append evidence to target BL's Why section.
    Add "Amendment (v10):" prefix to distinguish merged content.
    Update Source field to include candidate's source.
  For each DISCARD:
    Log classification and reason in compression result.
  For each DEFER:
    Leave candidate in BL_CANDIDATES.md. Decrement count.

Step 5: CLEANUP
  Remove all PROMOTE, MERGE, DISCARD candidates from BL_CANDIDATES.md.
  Update BL_CANDIDATES.md header count.
  Run BL-32: grep entire repo for old BL-N references affected by any merge/archive.
  Update stale references.

Step 6: LOG
  Write compression result entry to projects/eradev/lessons.md:
    ### L-{next}: BL compression pass {date} [ACTIVE]
    <!-- valid_from: {date} | ended: null | superseded_by: null | cross_project: false -->
    Candidates processed: {N}. PROMOTE: {N}. MERGE: {N}. DISCARD: {N}. DEFER: {N}.
    BL count after: {count}/30. Merged into: {list of BL-N}. Archived: {list of BL-N}.
```

### 2.6 BL-3 Guard

If the compression protocol itself loops (e.g., PROMOTE triggers budget check, budget check archives a BL, archival breaks a reference, reference fix triggers re-evaluation):

- Iteration 1: normal.
- Iteration 2: YELLOW -- log warning, continue.
- Iteration 3: STOP. Do not attempt iteration 4. Escalate to META with:
  ```
  === COMPRESSION BL-3 GUARD ===
  Compression loop hit 3 iterations without convergence.
  Remaining unprocessed candidates: {N}
  Root cause hypothesis: {description}
  Recommendation: META review BL_CANDIDATES.md manually.
  ```

### 2.7 Output

- Updated `BOOTSTRAP_LESSONS.md` (if any PROMOTE or MERGE).
- Updated `BL_CANDIDATES.md` (remaining DEFER candidates only).
- Compression log entry in `projects/eradev/lessons.md`.
- Reference cleanup commit (if any merges affected BL-N references across repo).

### 2.8 Implementation

**File: `meta.md` Section 14 item 9** -- add compression trigger check:

After the existing Lambda Audit text, add:
```
       BL compression check: read BL_CANDIDATES.md header count.
       If count >= 5: spawn Coherent with BL compression protocol
       (see reports/v10_omega_compression_decay_spec Section 2).
       Coherent reads BL_CANDIDATES.md + BOOTSTRAP_LESSONS.md, classifies each candidate
       (PROMOTE/MERGE/DISCARD/DEFER), executes, logs result to lessons.md.
       BL-3 guard: if compression loops >= 3 iterations, STOP and escalate.
```

**File: `BL_CANDIDATES.md`** -- no structural change needed. The process header already describes the flow. Add a reference to this spec:

After the existing process header, add:
```
> Full Coherent compression protocol: reports/v10_omega_compression_decay_spec_2026-04-12.md Section 2
> Classification: PROMOTE / MERGE / DISCARD / DEFER
```

---

## 3. Item 3: Temporal Decay on Lessons

### 3.1 Current State

Every lesson in `projects/eradev/lessons.md` and `projects/odtoe-articles/lessons.md` has:
- `valid_from: YYYY-MM-DD` (set by Phase 2.B retroactive dating)
- `ended: null` (no lesson has ever been ended)
- `superseded_by: null`
- Lifecycle tag: `[ACTIVE]`

No mechanism exists to age, review, or archive lessons based on time. All 37 + 39 = 76 lessons are eternally active.

### 3.2 Decay Model

Lessons do NOT auto-delete. Instead, they gain a "freshness" score computed from their age:

```
freshness(L) = max(0, 1 - age_days / half_life_days)

where:
  age_days = (today - valid_from).days
  half_life_days = 180 (default, ~6 months)
```

**Shape:** Linear decay from 1.0 (just created) to 0.0 (at half_life). Simple, transparent, no magic constants beyond the half_life.

**Examples (with half_life = 180):**
- Lesson created today: freshness = 1.0
- Lesson 30 days old: freshness = 0.833
- Lesson 90 days old: freshness = 0.500
- Lesson 126 days old: freshness = 0.300 (REVIEW THRESHOLD)
- Lesson 180 days old: freshness = 0.000

### 3.3 Immunity Rules

Not all lessons decay equally:

| Category | Half-life | Rationale |
|----------|-----------|-----------|
| Regular lesson | 180 days | Default. ~6 months before review. |
| `cross_project: true` lesson | 360 days | Cross-project insights are harder to re-discover. 2x buffer. |
| EMP (Mega-Pattern) | Immortal | EMPs never decay. They are generalizations that transcend temporal context. |

**Detection rule:** A lesson is an EMP if its heading starts with `### EMP` or `### AMP`. All other `### L-{N}` entries are regular lessons.

### 3.4 Trigger

Temporal decay review fires at **session start** during the Lambda Audit (meta.md Section 14 item 9).

The Coherent scans `projects/{PROJECT}/lessons.md` for entries where:
- `freshness < 0.3` (i.e., older than ~126 days for regular, ~252 days for cross-project)
- Entry is NOT an EMP
- Entry has `ended: null` (still active)

If any such entries found, Coherent flags them for review.

### 3.5 Review Protocol

For each flagged lesson:

```
TEMPORAL DECAY REVIEW (Coherent)

Step 1: READ the lesson text. Understand the failure mode it describes.

Step 2: VALIDATE against current state.
  Is the failure mode still relevant?
  - For code lessons: does the codebase still have the pattern that caused the failure?
  - For process lessons: has the process changed to prevent this failure?
  - For framework lessons: does the framework still contain the mechanism the lesson addresses?

Step 3: DECIDE.
  IF still valid AND still relevant:
    Action: REVALIDATE
    Set valid_from to today's date (resets decay clock).
    Add revalidation note: "Revalidated {date}: still applies because {reason}."
    Lesson stays [ACTIVE].

  IF superseded by a newer lesson:
    Action: SUPERSEDE
    Set ended to today's date.
    Set superseded_by to the newer lesson's ID (e.g., "L-42").
    Change tag to [SUPERSEDED].
    Lesson stays in lessons.md until next compression pass moves it to archive.

  IF obsolete (failure mode no longer possible):
    Action: ARCHIVE
    Set ended to today's date.
    Change tag to [ARCHIVED].
    Move entry to projects/{PROJECT}/lessons_archive.md.
    Preserve all metadata for audit trail.

Step 4: LOG the decision.
  For each reviewed lesson, append to the review output:
    L-{N}: {title} | freshness: {value} | decision: REVALIDATE/SUPERSEDE/ARCHIVE | reason: {1 sentence}
```

### 3.6 Freshness in Omega Computation (Cross-item dependency)

When computing N_relevant for Omega (Item 1), freshness acts as a quality weight on relevance:

```
For Omega computation:
  A lesson counts as relevant ONLY IF:
    (a) it passes at least 1 of the 4 relevance predicates, AND
    (b) freshness >= 0.3 (not flagged for review)

  Stale lessons (freshness < 0.3) are EXCLUDED from N_relevant count
  until they are revalidated.
```

This prevents stale lessons from inflating Omega. A project with 50 cross-project lessons that are all 2 years old should NOT get Omega = 2.0 -- that would be the dogmatic-collapse risk that the Omega ceiling guards against.

### 3.7 Implementation

**File: `meta.md` Section 14 item 9** -- add freshness check to Lambda Audit:

After the Omega computation addition (Item 1), add:
```
       Freshness check: for each [ACTIVE] non-EMP lesson in projects/{PROJECT}/lessons.md,
       compute freshness = max(0, 1 - age_days / half_life).
       half_life = 180 days (regular) or 360 days (cross_project: true).
       EMPs are immortal -- skip freshness check.
       If any lesson has freshness < 0.3: flag for review.
       Report: "{N} lessons flagged for temporal decay review (freshness < 0.3)."
       If N > 0 AND N <= 5: Coherent reviews inline during Lambda Audit.
       If N > 5: Coherent spawns a dedicated decay review pass (separate agent, not inline).
```

**File: `eradev.md`** -- NO changes. The freshness model is a META protocol concern, not a mathematical formalism. It does not appear in the B formula or the Omega formula. It is an input filter to N_relevant, implemented in meta.md.

**File: `projects/*/lessons.md`** -- NO structural changes. The `valid_from` field already exists. Freshness is computed from it at runtime, not stored.

---

## 4. Cross-Item Dependencies

The 3 items interact through shared data and sequencing:

```
                    BL_CANDIDATES.md
                          |
                          v
              [Item 2: Compression]
                    |         |
              BOOTSTRAP_LESSONS.md    projects/*/lessons.md
                                              |
                                              v
                                   [Item 3: Temporal Decay]
                                      freshness filter
                                              |
                                              v
                                   N_relevant (filtered)
                                              |
                                              v
                                   [Item 1: Omega Computation]
                                              |
                                              v
                                   Lambda_effective, S_total
```

**Dependency chain:**
1. Item 3 (temporal decay) MUST run before Item 1 (Omega) -- because stale lessons must be filtered before N_relevant is counted.
2. Item 2 (BL compression) is INDEPENDENT of Items 1 and 3 -- it operates on BL_CANDIDATES.md, not on Omega or freshness.
3. Within a single session start, the execution order is:
   - Lambda Audit reads lessons.md (existing Phase 2.B)
   - Freshness check flags stale lessons (Item 3)
   - If stale lessons found: Coherent reviews (Item 3)
   - Cross-project scan gathers cross_project lessons (existing Phase 2.B)
   - Omega computation on filtered N_relevant (Item 1)
   - BL_CANDIDATES.md count check (Item 2 trigger, independent)

**Shared enforcement point:** All 3 items fire from meta.md Section 14 item 9 (Lambda Audit). This is the single integration point. No other files need to know about the interaction.

---

## 5. Implementation Plan

### 5.1 Files to Modify

| File | Change size | Description |
|------|-------------|-------------|
| `meta.md` Section 14 item 9 | ~30 lines added | Add 3 protocol blocks: freshness check, Omega computation, BL compression trigger |
| `eradev.md` Section III.Omega | ~10 lines changed | Remove v9 caveat, update OQ status, add v10 activation statement |
| `BL_CANDIDATES.md` | ~3 lines added | Add spec reference and classification taxonomy |
| `CLAUDE.md` | ~2 lines added | Note Omega computation in session bootstrap |

**Total estimated change: ~45 lines modified/added across 4 files.**

### 5.2 Files NOT Modified (Explicit Exclusion)

| File | Why not |
|------|---------|
| `BOOTSTRAP_LESSONS.md` | No new BL added by this spec. Compression protocol operates on it but doesn't change it until candidates arrive. |
| `projects/*/lessons.md` | No structural changes. Freshness is computed at runtime from existing `valid_from`. Revalidation updates `valid_from` but that happens during runtime, not implementation. |
| Role files (`roles/*.md`) | Omega and decay are META-level protocols, not role-level. |
| Domain skins | Orthogonal to memory management. |
| `projects/*/config.md` | No new domain fields needed. `omega_adjacent` flag can be removed (Omega is now always computed). |

### 5.3 Implementation Sequence

```
Phase 1: meta.md update (single Builder, S task)
  1a. Add freshness check protocol to item 9 (Item 3)
  1b. Add Omega computation protocol to item 9 (Item 1)
  1c. Add BL compression trigger to item 9 (Item 2)
  1d. Ensure execution ordering within item 9: freshness -> cross-project scan -> Omega -> BL check

Phase 2: eradev.md update (single Builder, S task)
  2a. Remove v9 caveat paragraph from Section III.Omega
  2b. Update OQ status (OQ-1 and OQ-2 CLOSED, OQ-3 remains deferred)
  2c. Add v10 activation statement

Phase 3: Minor file updates (single Builder, S task)
  3a. Add spec reference to BL_CANDIDATES.md
  3b. Add Omega note to CLAUDE.md loading sequence

Phase 4: Validation (single Validator, S task)
  4a. Verify meta.md item 9 contains all 3 protocol blocks
  4b. Verify eradev.md v9 caveat is removed
  4c. Verify execution ordering is correct (freshness before Omega)
  4d. Verify BL_CANDIDATES.md references this spec
  4e. Dry-run: simulate Lambda Audit on projects/eradev/lessons.md
       - Count cross_project: true entries
       - Compute freshness for each
       - Filter by freshness >= 0.3
       - Apply relevance predicates against a hypothetical task
       - Compute Omega
       - Verify Omega is in [1.000, 2.500]
```

**Parallelization:** Phases 1, 2, 3 are independent (different files). Can run 3 Builders in parallel. Phase 4 depends on all three.

### 5.4 Estimated Implementation Size

| Phase | Lines changed | Lines added | Files |
|-------|--------------|-------------|-------|
| Phase 1 (meta.md) | 5 | 25 | 1 |
| Phase 2 (eradev.md) | 10 | 5 | 1 |
| Phase 3 (BL_CANDIDATES.md, CLAUDE.md) | 2 | 5 | 2 |
| **Total** | **17** | **35** | **4** |

Total: ~52 lines of actual changes across 4 files. Well within "single Builder session" scope.

---

## 6. Acceptance Criteria

| AC | Description | Measurement | PASS criteria |
|----|-------------|-------------|---------------|
| AC-1 | Omega computation protocol in meta.md | Read meta.md item 9 | Contains: cross-project scan, relevance predicate, Omega formula, reporting format |
| AC-2 | Omega output format matches eradev.md | Compare meta.md output spec with eradev.md RT-3 format | N_relevant, Omega, S_total fields present |
| AC-3 | Freshness check protocol in meta.md | Read meta.md item 9 | Contains: half_life values (180/360), EMP immunity, review threshold (0.3) |
| AC-4 | Freshness filters N_relevant | Read meta.md Omega computation | Stale lessons (freshness < 0.3) excluded from N_relevant |
| AC-5 | BL compression trigger in meta.md | Read meta.md item 9 | Contains: count >= 5 trigger, Coherent spawn, BL-3 guard |
| AC-6 | BL classification taxonomy in BL_CANDIDATES.md | Read BL_CANDIDATES.md | Contains: PROMOTE/MERGE/DISCARD/DEFER reference |
| AC-7 | v9 caveat removed from eradev.md | Read Section III.Omega | No "theoretical placeholder" language. v10 activation statement present. |
| AC-8 | OQ-Omega-1 and OQ-Omega-2 closed | Read eradev.md OQ section | OQ-1 marked CLOSED (temporal decay), OQ-2 marked CLOSED (cross-project). OQ-3 remains open. |
| AC-9 | Backward compat: Omega = 1 for v9 projects | Dry-run on project with no cross_project lessons | N_relevant = 0, Omega = 1.000 |
| AC-10 | Execution order correct | Read meta.md item 9 | Freshness check BEFORE Omega computation |
| AC-11 | BL-3 guard documented | Read meta.md or BL_CANDIDATES.md | Compression loop limit = 3, escalation procedure present |

---

## 7. Open Questions

### OQ-v10-1: Alpha Calibration per Modality (deferred to v11)
Does `alpha = 0.15` produce sane Omega values for research and creative projects? First real data from Omega reporting in v10 sessions will inform whether modality-specific alpha is needed. Current recommendation: keep `alpha = 0.15` universal until >= 10 Omega data points exist across >= 2 modalities.

### OQ-v10-2: Freshness Half-Life Tuning
Is 180 days the right half_life? For a fast-moving codebase, 90 days might be better. For a theoretical framework (eradev itself), 360 days might be more appropriate. Consider: should half_life be a per-project config value in `projects/{PROJECT}/config.md`?

Recommendation: Start with 180/360 (regular/cross-project). Add `domain.half_life_days` to config.md schema as optional override if the defaults prove wrong. Do NOT add this field in v10 -- wait for empirical evidence from at least 2 decay review cycles.

### OQ-v10-3: Revalidation Inflation
When a Coherent revalidates a lesson (freshness < 0.3 but still valid), it resets `valid_from` to today. This means a lesson can be kept alive indefinitely through periodic revalidation. Is this desirable or does it defeat the purpose of decay?

Recommendation: Desirable. The point of decay is not to kill lessons but to force periodic review. A lesson that survives 3 revalidation cycles is STRONGLY validated -- it has been explicitly confirmed relevant on 3 separate occasions. This is more valuable than a lesson that was written once and never questioned. Track revalidation count as a quality signal, not a risk signal.

### OQ-v10-4: Compression Interaction with Decay
When lessons.md exceeds 50 active entries (Phase 2.B compression trigger), should the compression pass prefer archiving low-freshness lessons over merging high-freshness ones?

Recommendation: Yes. Compression priority order: (1) Archive lessons with freshness = 0 AND no recent references. (2) Merge lessons with overlapping failure modes. (3) Keep high-freshness lessons intact. This is a natural extension -- the Coherent already has the freshness data from the decay check that runs before compression.

---

## 8. B-Check

```
=== JIDOKA SELF-CHECK (Analyst) ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.92 -- Read all source files: eradev.md Section III.Omega (formula, predicates, thresholds, OQs),
                           meta.md (full, Section 14 13-item checklist, Lambda Audit protocol),
                           BOOTSTRAP_LESSONS.md (30 BL, budget cap, full content),
                           BL_CANDIDATES.md (empty, process header),
                           projects/eradev/lessons.md (37 lessons, 12 EMPs, all temporal metadata),
                           projects/odtoe-articles/lessons.md (39 lessons, 8 AMPs, cross_project tags),
                           reports/v9_phase2b_memory_hierarchy_spec (full Phase 2.B infrastructure),
                           CLAUDE.md (14 invariants, domain awareness).
                           Did NOT read: plugy/lessons.md, academic-lab/lessons.md (minimal/empty, low risk).

  E (Alignment):   0.93 -- Spec addresses exactly the 3 stated items. Each maps to a deferred OQ from
                           eradev.md or Phase 2.B. Implementation is bounded (~52 lines across 4 files).
                           All protocols are additive to existing meta.md item 9. No new formulas invented.
                           Cross-item dependencies mapped and sequenced. Backward compat guaranteed.

  (1-sigma):       0.90 -- Checked for conflicts: Omega formula unchanged, temporal decay does not modify
                           lesson format, BL compression does not modify BL structure. Freshness is
                           computed at runtime not stored. All 3 items fire from same meta.md item 9
                           with clear execution ordering. No conflict with Phase 2.A/2.C/2.D.
                           Risk: execution order within item 9 must be enforced (freshness before Omega).

  Lambda:          0.88 -- Applied BL-16 (enforcement), BL-3 (compression guard), BL-11 (scope),
                           BL-30 (defense-in-depth), BL-32 (reference cleanup), EMP4 (enforcement location),
                           EMP12 (infrastructure activation), L-35 (feasibility). Cross-referenced Phase 2.B
                           spec for infrastructure constraints. All 3 items are grounded in existing
                           infrastructure -- no new files, no new formats, no new dependencies.

  B = 0.92 * 0.93 * 0.90 * 0.88 = 0.677 (uniform weights, B_text)

  min(F,E,1-sigma,Lambda) = 0.88 (Lambda) -- above 0.3 threshold.
  B = 0.677 -- above 0.5 threshold. No Andon required.
```

---

*Spec ready for META review and Builder hand-off.*
*Total implementation: ~52 lines across 4 files (meta.md, eradev.md, BL_CANDIDATES.md, CLAUDE.md).*
*Parallelizable: Phases 1-3 can run as 3 independent Builders. Phase 4 (Validator) depends on all three.*
