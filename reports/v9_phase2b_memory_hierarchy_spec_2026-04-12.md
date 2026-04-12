# v9 Phase 2.B — Memory Hierarchy Specification

> Date: 2026-04-12
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> Task type: design / specification / framework infrastructure
> B-modality: **B_text** (uniform weights 0.25 each — framework infrastructure, not creative or research)
> Output type: Report (META output #5) — spec for Builder implementation
> Scope: Memory Hierarchy for EraDev v9 (spec only, no implementation)
> Preceded by: roadmap_v9_2026-04-11.md Phase 2.B definition + v9_hansei_2026-04-11.md deferral + v9_odtoe_multiagent_mining_2026-04-11.md MemPalace verdict ("paper does NOT contribute to Phase 2.B")

---

## 0. Activation Operator Log

- **A_F (Focus):** Read in full: `roles/analyst_EN.md` (mission + activation + jidoka); `CLAUDE.md` (14 invariants, domain awareness, 6-step loading); `BOOTSTRAP_LESSONS.md` (30 BL, budget cap reached); `projects/eradev/lessons.md` (32 lessons + 11 EMPs across 3 sessions + extension); `eradev.md` Sections 0, II, III, III.Omega (cross-domain memory multiplier, Omega formula, three OQs deferred to v10); `meta.md` Section 14 (13-item session bootstrap checklist, items 2/9/11 memory-related); `reports/roadmap_v9_2026-04-11.md` (Phase 2.B definition: Closet/Drawer + temporal triples + tiered loading); `reports/v9_hansei_2026-04-11.md` Section 7 (Phase 2.B deferred from v9 GA to post-GA Phase 2); `reports/v9_phase2_1_s_hansei_2026-04-11.md` (report accumulation as waste, 7-step pipeline for abstraction validation); `reports/v9_odtoe_multiagent_mining_2026-04-11.md` Section 4.2 (verdict: ODTOE papers do NOT contribute to Phase 2.B); current MEMORY.md (4 entries, 3 drawer files); current `memory/` directory (3 files: user_identity.md, feedback_meta_identity.md, reference_load_sequence.md); `reports/` directory listing (90 files total). Also read `templates/domain_skin.md.template` (frontmatter pattern useful for drawer file schema); `projects/odtoe-articles/lessons.md` (first 50 lines, 19 lessons — none tagged cross_project, proving cross-project transfer does not exist yet).

- **A_E (Alignment):** META's task: produce a specification concrete enough for a Builder to implement in one pass. The spec addresses 5 scaling problems (flat MEMORY.md, append-only lessons, BL budget cap, unindexed reports, absent cross-project transfer). Intent is infrastructure, not new formalism. The output must be actionable files/schemas/protocols, not theoretical memory models. Phase 2.B is framework infrastructure — same domain as eradev.md itself — so B_text (uniform weights) is correct.

- **A_sigma (Consistency):** Checked for conflicts:
  - MEMORY.md path: Claude Code stores it at `~/.claude/projects/{hash}/memory/MEMORY.md`, NOT in the project repo. The memory hierarchy must respect this Claude Code ownership — we design within this constraint, not against it.
  - `lessons.md` lives inside `projects/{name}/` in the repo. Temporal triples add metadata without changing file location.
  - `reports/` lives in the repo root. INDEX.md and archive/ are additive — no conflict with existing reports.
  - `BOOTSTRAP_LESSONS.md` lives at repo root. Compression protocol adds process, not files.
  - `eradev.md` Section III.Omega already defines Omega(H_hist) with `N_relevant` — our cross-project scan feeds this existing formula.
  - `meta.md` Section 14 items 2/9/11 reference memory loading — will need updating.
  - No conflict with Phase 2.A skins (already committed) or Phase 2.C (background extraction, independent).

- **A_sigma (second pass):** Memory hierarchy involves TWO storage locations: Claude Code's `~/.claude/projects/*/memory/` (operator-scoped, cross-session) and the project repo's `projects/*/` (version-controlled, shared). The spec must be explicit about which tier lives where.

- **A_Lambda (Experience):** Applied:
  - BL-16: knowledge without enforcement = Lambda zero. Memory tiers that exist but are never loaded = dead weight. Every tier must have a loading trigger in meta.md or CLAUDE.md.
  - BL-30: defense-in-depth. Memory should not have a single point of failure (MEMORY.md today is a single point).
  - BL-11: scope creep is Muda. The memory hierarchy must solve the 5 stated problems and nothing more. Resist v10 features (Omega cross-project numerical scoring, temporal decay, model-per-role memory) leaking into v9.
  - BL-3: fix chain > 3 = structural problem. Applied to lessons.md — the append-only pattern is the structural problem; temporal triples + compression are the structural fix.
  - Lesson 14 (BL budget requires active merge, not just append) — directly informs Section 4 of this spec.
  - EMP4 (enforcement must live where it fires) — memory loading protocol must be in meta.md Section 14 (where META fires), not in eradev.md (where everyone reads but META enforces).
  - EMP6 (enforcement without mechanism is Lambda zero, recursively) — every protocol in this spec must name its enforcement mechanism, not just its rule.

All 4 Activation Operator steps GREEN. Proceeding with specification.

---

## 1. Architecture Overview

### 1.1 Three Tiers

```
T1 ANCHORS (always loaded, <= 200 lines total, cold-start safe)
  Purpose: identity, critical rules, active constraints
  Lives in: MEMORY.md (Claude Code auto-loaded) + CLAUDE.md (repo auto-loaded)
  Loaded by: Claude Code session init (automatic, no agent action)
  Budget: MEMORY.md <= 200 lines; CLAUDE.md already capped by readability

T2 SESSION (loaded on demand, per-session relevance)
  Purpose: current project context, active lessons, in-flight decisions
  Lives in: projects/{PROJECT}/lessons.md + projects/{PROJECT}/config.md + memory/{category}/*.md (drawer files)
  Loaded by: META Section 14 checklist items 2, 5b, 9 (explicit agent action)
  Budget: no hard line cap, but JIT loading — only load drawers relevant to current task

T3 WISDOM (loaded via search, long-term archive)
  Purpose: historical lessons (ended), archived reports, cross-project patterns
  Lives in: projects/{PROJECT}/lessons_archive.md + reports/archive/ + cross-project scan results
  Loaded by: Coherencer Lambda Audit (item 9) or explicit META decision when agent signals Lambda gap
  Budget: no cap, but never auto-loaded. Pull, never push.
```

### 1.2 Tier Boundary Rules

| From | To | Trigger | Who |
|------|-----|---------|-----|
| T2 -> T1 | Promotion | A lesson or memory is referenced >= 5 times across sessions AND names a universal failure mode | Coherencer (at Hansei) |
| T1 -> T2 | Demotion | A T1 entry hasn't been referenced in 5+ sessions, OR is project-specific | META (at session start, item 11) |
| T2 -> T3 | Archival | Lesson gets `ended` date; report loses all active references and is > 7 days old | Coherencer (at compression pass) |
| T3 -> T2 | Recall | Agent signals Lambda gap + Coherencer finds relevant archived lesson via cross-project scan | Coherencer (at Lambda Audit) |

**Constraint:** T1 promotion is rare and intentional. Most memory lives at T2. T3 is the archive, not the trash — anything in T3 can be recalled if needed.

### 1.3 Loading Sequence (updated meta.md Section 14)

Current items 2 and 9 need updating:

```
[ ] 2. LOADED: eradev.md + meta.md + BOOTSTRAP_LESSONS.md + projects/{PROJECT}/config.md + projects/{PROJECT}/lessons.md
       MEMORY.md (T1) is auto-loaded by Claude Code.
       Drawer files (T2) loaded JIT when task context requires them.
       T3 wisdom NOT loaded unless Lambda Audit requests it.
...
[ ] 9. LAMBDA AUDIT: Coherencer reads projects/{PROJECT}/lessons.md (T2 active entries only)
       and announces 3 relevant lessons + 2 mega-patterns.
       If Lambda gap detected: Coherencer searches T3 (lessons_archive.md, cross-project scan).
       If cross_project: true entries found in other projects, load into session context.
```

---

## 2. Closet/Drawer Split

### 2.1 MEMORY.md Becomes the Closet (Index)

Current state (4 entries, ~6 lines of content): already nearly index-shaped. The change is structural: MEMORY.md becomes a pure index file that points to drawer files, with a strict 200-line budget.

**New MEMORY.md format:**

```markdown
# Memory Index (Closet)

> Budget: <= 200 lines. This file is the TABLE OF CONTENTS.
> Each entry points to a drawer file with full content + metadata.
> Format: - [{name}]({relative_path}) -- {1-line description}

## User
- [User identity](user/user_identity.md) -- Anton Pankratov, EraDev creator, GitHub txrx13

## Feedback
- [META identity enforcement](feedback/meta_identity.md) -- Claude = META L9, 6 output types, delegation constraint

## Reference
- [LOAD sequence](reference/load_sequence.md) -- CLAUDE.md auto -> eradev.md, meta.md, BL, config, lessons

## Project
- [eradev active decisions](project/eradev_decisions.md) -- v9 Phase 2.B in progress, memory hierarchy

## Session
(populated per-session, cleared at session end)
```

### 2.2 Drawer Files

Each memory entry becomes a file in `memory/{category}/{name}.md` with full content and frontmatter metadata.

**Categories:**

| Category | Purpose | Examples |
|----------|---------|----------|
| `user/` | Operator identity, preferences, language | `user_identity.md` |
| `feedback/` | Behavioral corrections, enforcement records | `meta_identity.md` |
| `reference/` | Load sequences, framework reference | `load_sequence.md` |
| `project/` | Active project decisions, in-flight context | `eradev_decisions.md` |

**Note on storage location:** Claude Code manages `~/.claude/projects/{hash}/memory/`. The drawer file paths are relative to that memory root. The Builder must create subdirectories under the existing memory directory.

### 2.3 Drawer File Schema (Frontmatter)

Every drawer file begins with YAML frontmatter:

```yaml
---
name: "META identity enforcement"
type: feedback              # user | feedback | reference | project
tier: T1                    # T1 | T2 | T3
description: "Claude = META-Orchestrator L9, 6 output types, delegation constraint"
valid_from: "2026-04-07"    # ISO date when this memory was created
ended: null                 # ISO date when superseded, or null if active
superseded_by: null         # path to newer drawer file, or null
related_projects:
  - eradev
source_report: null         # path to report that spawned this memory, if any
---

[Full content here -- the actual memory content that was previously inline in MEMORY.md]
```

**Field definitions:**

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| `name` | yes | string | Human-readable name (unique within category) |
| `type` | yes | enum | `user`, `feedback`, `reference`, `project` |
| `tier` | yes | enum | `T1`, `T2`, `T3` |
| `description` | yes | string | 1-line summary shown in MEMORY.md index |
| `valid_from` | yes | ISO date | When this memory was created |
| `ended` | no | ISO date or null | When this memory was superseded |
| `superseded_by` | no | path or null | Pointer to replacement drawer file |
| `related_projects` | no | string[] | Which projects this memory is relevant to |
| `source_report` | no | path or null | Audit trail to originating report |

### 2.4 MEMORY.md Budget Enforcement

- Hard cap: 200 lines for MEMORY.md.
- Each index entry is 1 line (link + description).
- At 200 lines, new entries require either (a) archiving an old entry to T3 or (b) merging two related entries into one drawer file with a combined index line.
- Enforcement: META checks line count at session start (item 11). If > 200: spawn Coherencer to compress before proceeding.

---

## 3. Temporal Triples for Lessons

### 3.1 Current State

`projects/eradev/lessons.md`: 32 lessons + 11 EMPs. No dates, no expiry, no lifecycle. Every lesson is eternally active. `projects/odtoe-articles/lessons.md`: 19 lessons. Same problem.

### 3.2 New Lesson Entry Format

Each lesson gains 3 metadata fields added as inline YAML in a comment block at the top of each entry:

```markdown
### L-33: {title} [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: false -->

**Source:** {source}
**Rule:** {rule}
**Why:** {why}
**Applies to:** {roles}
```

**Field definitions:**

| Field | Type | Description |
|-------|------|-------------|
| `valid_from` | ISO date | When this lesson was learned |
| `ended` | ISO date or null | When this lesson was superseded (null = active) |
| `superseded_by` | string or null | ID of the lesson that replaced this one (e.g., "L-45") |
| `cross_project` | boolean | true if this lesson names a failure mode that could recur in ANY project |

**Lifecycle tag** in the heading: `[ACTIVE]`, `[SUPERSEDED]`, `[ARCHIVED]`.

### 3.3 Lesson Lifecycle

```
Created [ACTIVE]
  |
  v (newer lesson covers same failure mode)
Superseded [SUPERSEDED]
  |  - ended date set
  |  - superseded_by points to the new lesson
  |  - kept in lessons.md for audit trail until compression
  |
  v (compression pass moves it out)
Archived [ARCHIVED]
  - moved to projects/{PROJECT}/lessons_archive.md
  - retains all metadata
  - still searchable via T3 recall
```

### 3.4 Compression Protocol

**Trigger:** When `lessons.md` exceeds 50 active entries (counting only `[ACTIVE]` entries, not superseded or archived ones).

**Process (Coherencer):**

1. Count active entries. If count <= 50, STOP.
2. Identify merge candidates: pairs of lessons that (a) share the same failure mode, (b) apply to overlapping role sets, (c) were learned within the same session cluster (close `valid_from` dates).
3. For each merge candidate pair:
   a. Create a new lesson that covers both (keep the more general phrasing).
   b. Mark both originals as `[SUPERSEDED]`, set `ended` date, set `superseded_by` to new lesson ID.
4. Move all `[SUPERSEDED]` entries older than 2 sessions to `lessons_archive.md`.
5. Re-number remaining active entries if gaps exceed 10 (optional, not required).
6. Commit compression as a single atomic change (one commit per BL-24).

**Constraint:** Never delete a lesson. Archival = move to `lessons_archive.md`, not removal. The audit trail from `superseded_by` chains is permanent.

### 3.5 Retroactive Dating

Existing 32 lessons in `projects/eradev/lessons.md` need `valid_from` dates. Builder should:
- Session 1 lessons (1-10): `valid_from: 2026-04-04` (framework rebuild date per lesson headers)
- Session 2 lessons (11-15): `valid_from: 2026-04-07` (v8 META-orchestration per lesson headers)
- Session 3 lessons (16-25): `valid_from: 2026-04-11` (v9 universalization per lesson headers)
- Session 3 extension lessons (26-32): `valid_from: 2026-04-11` (Phase 2.1.S per lesson headers)
- All EMPs: `valid_from` = date of the session that produced them
- All existing lessons: `ended: null`, `superseded_by: null`, `cross_project: false` (default; Coherencer reviews and may promote some to `cross_project: true` in a subsequent pass)

---

## 4. BL Budget Management

### 4.1 Current State

30 BL at budget cap. Split into 22 `[UNIVERSAL]` + 8 `[CODE-ADAPTER]` (two files since Phase 1.D). New insights can only enter via merge with existing BL.

### 4.2 BL Compression Protocol

**Trigger:** Every 5 new BL candidates accumulated (tracked in a `BL_CANDIDATES.md` staging file at repo root).

**Process (Coherencer):**

1. Read `BL_CANDIDATES.md`. If fewer than 5 candidates, STOP.
2. Read current `BOOTSTRAP_LESSONS.md` (or the split files if in split mode).
3. For each candidate, check: does an existing BL already cover this failure mode?
   - If yes: merge the candidate's insight into the existing BL as an amendment or example. No new BL number.
   - If no: identify the weakest existing BL (least referenced, most domain-specific, narrowest applicability) for potential merge.
4. For each proposed merge: identify BL pairs that cover the same failure mode from different angles. Merge them into one BL that covers both angles. Free one slot.
5. After merge: run BL-32 (grep for all old BL-N references, update them).
6. Cap stays at 30. No exceptions.

**Staging file format (`BL_CANDIDATES.md`):**

```markdown
# BL Candidates (staging)

> These are candidate BL entries awaiting the next compression pass.
> Compression triggers when count >= 5.
> Current count: N

### CAND-1: {title}
**Source:** {report or session}
**Proposed rule:** {rule}
**Overlap check:** Does BL-{N} already cover this? Y/N
**Date:** {ISO date}
```

### 4.3 BL Archival (Staleness Detection)

BLs tagged `[CODE-ADAPTER]` that meet ALL of these criteria are candidates for archival:
- Not referenced by any `[ACTIVE]` lesson in any project's `lessons.md`
- Not referenced by any report in the last 3 reports
- Tagged `[CODE-ADAPTER]` (universal BLs are never archived)

**Archival process:**
1. Coherencer identifies stale BL candidates at Hansei.
2. Propose archival to operator (META does NOT auto-archive BL — BL-32 audit trail risk).
3. If approved: move to a `## Archived` section at the bottom of `BOOTSTRAP_LESSONS_code_adapter.md`. Do NOT delete.
4. Archived BLs do NOT count against the 30 cap.
5. Archived BLs can be recalled if a new code project triggers the same failure mode.

### 4.4 BL Numbering After Merge

When two BL entries merge (e.g., BL-13 + BL-23 -> BL-13), the surviving BL keeps the lower number. The higher number becomes a redirect comment: `### BL-23: [MERGED into BL-13]`. This preserves the audit trail for grep and prevents orphan references.

---

## 5. Reports Cleanup Protocol

### 5.1 Current State

90 files in `reports/`. No index. No status tracking. No cleanup. Reports from the initial v7 rebuild (April 4) sit alongside v9 Phase 2 reports (April 11-12). The `HANSEI_TEMPLATE.md` is a template, not a report.

### 5.2 Report Lifecycle

```
Active (recently created, referenced by other active artifacts)
  |
  v (no active references, > 7 days old)
Stale (candidate for archival)
  |
  v (archival pass moves it)
Archived (in reports/archive/, preserved for audit trail)
```

### 5.3 reports/INDEX.md

A table maintained by META (or Coherencer at Hansei) listing all reports:

```markdown
# Reports Index

> Last updated: 2026-04-12
> Total: 90 (78 active + 12 archived)
> Sorted by: date descending

| Report | Date | Status | Summary | Source |
|--------|------|--------|---------|--------|
| v9_phase2b_memory_hierarchy_spec_2026-04-12.md | 2026-04-12 | active | Memory hierarchy spec for Phase 2.B | Phase 2.B |
| v9_wave9_odtoe_mining_2026-04-11.md | 2026-04-11 | active | ODTOE paper mining for v9 gaps | Wave 9 |
| ... | ... | ... | ... | ... |
| rt1_visionary.md | 2026-04-04 | stale | v7.1 RT-1 Visionary report | Session 1 RT-1 |
```

**Columns:**
- `Report`: filename (not path — all in `reports/` or `reports/archive/`)
- `Date`: ISO date from filename or file mtime
- `Status`: `active` | `stale` | `archived` | `template`
- `Summary`: 1-line description (max 80 chars)
- `Source`: which wave/phase/session produced it

### 5.4 Archival Rules

**A report becomes `stale` when ALL of:**
1. No other `active` report references it by filename
2. No `[ACTIVE]` lesson in any `projects/*/lessons.md` references it
3. No BL entry in `BOOTSTRAP_LESSONS*.md` references it as `Source:`
4. Report date is > 7 days old

**A `stale` report becomes `archived` when:**
1. Coherencer runs archival pass (triggered at report count > 80 or at quarterly Hansei)
2. Move file to `reports/archive/`
3. Update INDEX.md status to `archived`

**Critical preservation rule:** Reports referenced by lessons.md entries or BL source attributions MUST NEVER be archived as long as the referencing lesson/BL is `[ACTIVE]`. This is the audit trail per BL-32.

### 5.5 Archival Pass Process

**Trigger:** Report count > 80 in `reports/` (excluding `archive/` subdirectory) OR quarterly Hansei.

**Process (Coherencer):**

1. Build reference graph: for each report, grep all `projects/*/lessons.md`, `BOOTSTRAP_LESSONS*.md`, and other `reports/*.md` for its filename.
2. Mark reports with zero incoming references AND age > 7 days as `stale`.
3. Move `stale` reports to `reports/archive/`.
4. Update `reports/INDEX.md`.
5. Commit as single atomic change.

**Exception:** `HANSEI_TEMPLATE.md` is always `template` status, never archived.

---

## 6. Cross-Project Memory (Omega(H_hist) Feed)

### 6.1 Problem

Currently, 4 projects exist: `eradev`, `plugy`, `odtoe-articles`, `academic-lab`. Each has its own `lessons.md`. No lessons from `odtoe-articles` are visible to an agent working on `eradev`. The Omega(H_hist) formula in eradev.md Section III.Omega exists but has no H_hist corpus to compute on.

### 6.2 Cross-Project Tag

A lesson earns `cross_project: true` when it names a failure mode that could recur in ANY project, not just its origin project. Criteria (ALL must hold):

1. The failure mode is about **process** (how work is done), not **content** (what artifact-specific thing went wrong).
2. The lesson does NOT reference project-specific file paths, tools, or domain concepts that don't translate.
3. At least one role named in "Applies to" is a universal role (all 5 are universal — this is a sanity check, not a real gate).

**Examples:**
- `cross_project: true` — "Compile both RU and EN before declaring done" (odtoe-articles L-17). Process lesson about bilingual verification. Applies to any bilingual project.
- `cross_project: false` — "TeX ligatures don't render with PT Serif in XeLaTeX" (odtoe-articles L-1). Content lesson about a specific LaTeX engine. Only applies to LaTeX projects.
- `cross_project: true` — "P_coll at B=0.3, n=3, k=1 = 0.657, NOT 0.61" (odtoe-articles L-14). Process lesson about formula verification. Applies whenever P_coll is computed.

### 6.3 Cross-Project Scan Protocol

**When:** Coherencer Lambda Audit (meta.md Section 14, item 9).

**Process:**

1. Read `projects/{CURRENT_PROJECT}/lessons.md` — extract active lessons (standard Lambda Audit).
2. For each OTHER project directory in `projects/`:
   a. Read `projects/{OTHER}/lessons.md`.
   b. Filter for entries with `cross_project: true` AND `ended: null` (active only).
   c. Collect into a cross-project lesson set.
3. Present to META: "Found N cross-project lessons from {list of projects}. Loading into T2 session context."
4. META decides which are relevant to the current task (JIT loading, not bulk loading).

### 6.4 Feeding Omega(H_hist)

The cross-project scan produces `N_relevant` — the count of cross-project lessons loaded into T2 context. This feeds directly into the existing formula from eradev.md Section III.Omega:

```
Omega(H_hist) = 1 + alpha * log(1 + N_relevant)
Lambda_effective = Omega * Lambda (per-agent)
S_total = S_adjusted * Omega (per-team, reported at RT-3)

where:
  alpha = 0.15 (calibration constant, from eradev.md)
  N_relevant = count of cross-project lessons loaded for this session
```

**Constraint:** N_relevant counts only lessons actually loaded into T2 context for the current session, not all cross-project lessons in existence. This keeps Omega grounded in actual memory leverage, not theoretical availability.

### 6.5 v9 vs v10 Boundary

**v9 (this spec):** Cross-project scan is manual (Coherencer at Lambda Audit). Simple grep-based discovery. No numerical Omega reporting yet.

**v10 (deferred):**
- Temporal decay on cross-project lessons (OQ-Omega-1 from eradev.md)
- Automatic Omega computation and reporting at RT-3 (OQ-Omega-2)
- Alpha calibration per modality (OQ-Omega-3)
- Bidirectional lesson transfer (current session writes back to source project)

---

## 7. Implementation Plan

### 7.1 Files to Create

| File | Location | Size | Purpose |
|------|----------|------|---------|
| `memory/user/user_identity.md` | Claude Code memory dir | S | Migrate from current `memory/user_identity.md`, add frontmatter |
| `memory/feedback/meta_identity.md` | Claude Code memory dir | S | Migrate from current `memory/feedback_meta_identity.md`, add frontmatter |
| `memory/reference/load_sequence.md` | Claude Code memory dir | S | Migrate from current `memory/reference_load_sequence.md`, add frontmatter |
| `memory/project/` | Claude Code memory dir | S | Create empty directory for project-scoped drawers |
| `reports/INDEX.md` | Repo | M | Initial index of all 90 reports |
| `reports/archive/` | Repo | S | Create empty directory for archived reports |
| `BL_CANDIDATES.md` | Repo root | S | Empty staging file for BL candidates |
| `projects/eradev/lessons_archive.md` | Repo | S | Empty archive file (header + schema only) |
| `projects/odtoe-articles/lessons_archive.md` | Repo | S | Empty archive file |
| `projects/plugy/lessons_archive.md` | Repo | S | Empty archive file |
| `projects/academic-lab/lessons_archive.md` | Repo | S | Empty archive file |

### 7.2 Files to Modify

| File | Location | Size of change | Description |
|------|----------|----------------|-------------|
| `MEMORY.md` | Claude Code memory dir | S | Restructure to Closet format (index with category headers, relative links to drawer files) |
| `projects/eradev/lessons.md` | Repo | M | Add temporal triples to all 32 lessons + 11 EMPs. Add lifecycle tags. |
| `projects/odtoe-articles/lessons.md` | Repo | M | Add temporal triples to all 19+ lessons. Tag cross_project candidates. |
| `meta.md` Section 14 | Repo | S | Update items 2, 9, 11 for tiered loading, cross-project scan, memory budget check |
| `CLAUDE.md` | Repo | S | Add memory hierarchy reference to loading sequence (step 6 or note under existing steps) |

### 7.3 Files NOT Modified (Explicit Scope Exclusion)

| File | Why not |
|------|---------|
| `eradev.md` | Section III.Omega already defines the formula. No changes needed. |
| `BOOTSTRAP_LESSONS.md` | No new BL added. Compression protocol is process, not file change. |
| Role files (`roles/*.md`) | Memory hierarchy is META infrastructure, not role-level. |
| Domain skins (`templates/domain_skin.*.md`) | Memory is orthogonal to domain skins. |

### 7.4 Implementation Sequence

```
Wave 1: Closet/Drawer migration (S, 1 Builder)
  1a. Create memory/{category}/ subdirectories
  1b. Move existing 3 drawer files to category subdirs, add frontmatter
  1c. Rewrite MEMORY.md as Closet index
  1d. Verify Claude Code still loads MEMORY.md correctly (manual check)

Wave 2: Temporal triples (M, 1 Builder + 1 Validator)
  2a. Add temporal metadata to all projects/eradev/lessons.md entries
  2b. Add temporal metadata to all projects/odtoe-articles/lessons.md entries
  2c. Add lifecycle tags [ACTIVE] to all entries
  2d. Create empty lessons_archive.md files in all 4 projects
  2e. Tag cross_project candidates (Coherencer review)

Wave 3: Reports infrastructure (S, 1 Builder)
  3a. Create reports/archive/ directory
  3b. Generate reports/INDEX.md from current reports/ listing
  3c. Mark obviously stale reports (v7 RT cycle reports from April 4)

Wave 4: BL staging + meta.md update (S, 1 Builder)
  4a. Create BL_CANDIDATES.md (empty staging file)
  4b. Update meta.md Section 14 items 2, 9, 11
  4c. Update CLAUDE.md loading sequence reference

Wave 5: Validation (S, 1 Validator)
  5a. Verify MEMORY.md <= 200 lines
  5b. Verify all drawer files have valid frontmatter
  5c. Verify all lessons.md entries have valid_from dates
  5d. Verify reports/INDEX.md exists and matches reports/ contents
  5e. Verify BL count still <= 30
  5f. Verify cross-project scan protocol is documented in meta.md
```

**Dependencies:** Wave 1 is independent. Wave 2 is independent. Wave 3 is independent. Waves 1-3 can run in parallel (3 Builders). Wave 4 depends on Waves 1-3 (meta.md references all three). Wave 5 depends on all previous waves.

### 7.5 Migration Path

**Backward compatibility:**

1. Projects WITHOUT temporal triples on lessons: treated as `valid_from: unknown`, `ended: null`, `cross_project: false`. All existing behavior preserved.
2. Projects WITHOUT `lessons_archive.md`: compression pass creates it on first trigger. No error if absent.
3. Reports WITHOUT INDEX.md entry: still functional, just not indexed. INDEX.md is advisory, not gating.
4. MEMORY.md WITHOUT Closet format: Claude Code still auto-loads it as flat text. The Closet format is cosmetic improvement, not breaking change.
5. `BL_CANDIDATES.md` absent: compression protocol simply has no candidates. No error.

**Zero-regression guarantee:** Every new file/format is additive. No existing file's semantics change. A v9 session that ignores the memory hierarchy entirely behaves identically to pre-2.B.

---

## 8. Acceptance Criteria

| AC | Description | Measurement | PASS criteria |
|----|-------------|-------------|---------------|
| AC-1 | Memory index respects budget | `wc -l MEMORY.md` | <= 200 lines |
| AC-2 | Every drawer file has frontmatter | Parse YAML frontmatter of every `memory/{category}/*.md` file | All required fields present: name, type, tier, description, valid_from |
| AC-3 | lessons.md entries have valid_from | Grep for `valid_from:` in all `projects/*/lessons.md` | Every lesson entry has a `valid_from` date |
| AC-4 | reports/INDEX.md exists and is populated | `wc -l reports/INDEX.md` + spot-check 5 random entries | >= 80 entries, all match existing report files |
| AC-5 | BL count stays <= 30 | Count `### BL-` headers in `BOOTSTRAP_LESSONS*.md` | Count <= 30 (excluding `[MERGED]` redirects) |
| AC-6 | Cross-project scan protocol documented | Read `meta.md` Section 14 item 9 | Protocol for cross-project lesson discovery is explicitly stated |
| AC-7 | lessons_archive.md exists in all projects | `ls projects/*/lessons_archive.md` | File exists in all 4 project directories |
| AC-8 | BL_CANDIDATES.md exists | `ls BL_CANDIDATES.md` | File exists at repo root with staging header |
| AC-9 | Temporal lifecycle tags present | Grep `\[ACTIVE\]` in `projects/eradev/lessons.md` | All non-EMP entries have lifecycle tag |
| AC-10 | No data loss from migration | Diff old MEMORY.md content against new drawer files | All content from old flat entries preserved in new drawer files |

---

## 9. Risks and Failure Modes

### R1: Over-Engineering (MEDIUM)

**Risk:** The memory hierarchy becomes more complex than the framework it serves. Drawer files, frontmatter, temporal triples, compression protocols, cross-project scans — the operational overhead exceeds the value of organized memory.

**Mitigation:** Every component is opt-in / additive. A session that ignores the hierarchy entirely works identically to pre-2.B. The hierarchy adds value only when it's used. If overhead > value in practice, the Hansei will catch it and recommend simplification.

**Signal to watch:** If agents spend > 10% of their token budget on memory management (reading/updating frontmatter, running compression, updating INDEX.md), the system is over-engineered.

### R2: Data Loss (LOW)

**Risk:** Archiving removes something that's needed later. A lesson is marked `[SUPERSEDED]` but the replacement lesson is less precise.

**Mitigation:** Nothing is ever deleted. `[SUPERSEDED]` lessons move to `lessons_archive.md`, not to /dev/null. Reports move to `reports/archive/`, not trash. The `superseded_by` chain is always preserved. Recall from T3 is always possible.

### R3: Staleness (MEDIUM)

**Risk:** Temporal triples are added at migration but never updated afterward. `valid_from` dates become decorative noise. `ended` is never set because no one runs the compression pass.

**Mitigation:** Compression is triggered mechanically (count > 50 active entries), not on a schedule. The trigger is embedded in the Coherencer's Lambda Audit protocol (meta.md item 9), which already fires every session. BL-16 applies: if the rule exists but never fires, it's Lambda zero.

**Signal to watch:** If `lessons.md` grows past 60 entries and no compression has occurred, the protocol is not firing. META should escalate.

### R4: Scope Creep into v10 (HIGH)

**Risk:** Phase 2.B bloats into full Omega numerical scoring, temporal decay, bidirectional transfer, auto-instinct extraction — all v10 features.

**Mitigation:** This spec explicitly defers:
- Numerical Omega reporting at RT-3 (v10, OQ-Omega-2)
- Temporal decay on lessons (v10, OQ-Omega-1)
- Alpha calibration per modality (v10, OQ-Omega-3)
- Bidirectional lesson transfer (v10)
- Background instinct extraction (Phase 2.C, separate spec)
- Model-per-role memory optimization (Phase 2.D, DEFERRED per operator)

v9 Phase 2.B delivers: tiered loading, Closet/Drawer split, temporal triples, BL compression protocol, reports INDEX, simple cross-project scan. No more.

### R5: Claude Code Memory Path Constraints (MEDIUM)

**Risk:** Claude Code manages `~/.claude/projects/{hash}/memory/` with its own semantics. Creating subdirectories (user/, feedback/, reference/, project/) might conflict with Claude Code's expectations.

**Mitigation:** Builder must test subdirectory creation under `~/.claude/projects/{hash}/memory/` and verify Claude Code still auto-loads MEMORY.md correctly. If subdirectories break Claude Code: fall back to flat file names with category prefixes (e.g., `user__identity.md`, `feedback__meta_identity.md`).

**Contingency:** Flat naming scheme is the fallback. The Closet/Drawer split works with either directory structure or prefix naming.

---

## 10. Open Questions

### OQ-2B-1: Claude Code Subdirectory Support
Does Claude Code's memory system support subdirectories under `memory/`? If not, use flat files with category prefixes. Builder must test this as Wave 1 step 1d.

### OQ-2B-2: Cross-Project Scan Performance
With 4 projects, scanning all `lessons.md` files is trivial. At 20+ projects (v10 scale), this could become expensive. Should the scan be cached? Deferred to v10.

### OQ-2B-3: EMP Temporal Triples
Should Mega-Patterns (EMPs) have temporal triples? EMPs are generalizations that should never expire. Proposal: EMPs get `valid_from` but never `ended` (they are promoted to immortal T1-equivalent within lessons.md). Builder should implement this as the default.

### OQ-2B-4: reports/INDEX.md Auto-Maintenance
Should INDEX.md be auto-generated (script/hook) or manually maintained by Coherencer? Auto-generation is more reliable but requires a script. Manual maintenance is simpler but risks staleness. Recommendation: start manual, add script if staleness becomes a problem.

### OQ-2B-5: Lessons Numbering Stability
When compression merges or archives lessons, the remaining lesson numbers become sparse (L-1, L-2, L-5, L-8, ...). Should we re-number? Risk: stale references to old numbers in reports. Recommendation: do NOT re-number. Sparse numbering is acceptable. New lessons get the next highest number, never reuse old numbers.

### OQ-2B-6: Project-Specific vs Global MEMORY.md
Claude Code creates separate memory directories per project hash. The Closet/Drawer split applies to each project's memory independently. But some drawers (user_identity.md) should be shared across projects. Currently Claude Code handles this internally. This OQ asks: should we add an explicit "global memory" tier? Deferred to v10 (when multi-project orchestration becomes a real use case).

---

## 11. Hand-off to Builder

### Target Files (ordered by implementation wave)

**Wave 1 (Closet/Drawer migration):**
- `~/.claude/projects/-Users-antonpankratov-Downloads-eradev/memory/user/user_identity.md` — migrate from `memory/user_identity.md`, add frontmatter. Size: S.
- `~/.claude/projects/-Users-antonpankratov-Downloads-eradev/memory/feedback/meta_identity.md` — migrate from `memory/feedback_meta_identity.md`, add frontmatter. Size: S.
- `~/.claude/projects/-Users-antonpankratov-Downloads-eradev/memory/reference/load_sequence.md` — migrate from `memory/reference_load_sequence.md`, add frontmatter. Size: S.
- `~/.claude/projects/-Users-antonpankratov-Downloads-eradev/memory/project/` — create empty directory. Size: S.
- `~/.claude/projects/-Users-antonpankratov-Downloads-eradev/memory/MEMORY.md` — rewrite as Closet index. Size: S.

**Wave 2 (Temporal triples):**
- `projects/eradev/lessons.md` — add temporal metadata to 32 lessons + 11 EMPs. Size: M.
- `projects/odtoe-articles/lessons.md` — add temporal metadata to 19+ lessons. Size: M.
- `projects/eradev/lessons_archive.md` — create with header. Size: S.
- `projects/odtoe-articles/lessons_archive.md` — create with header. Size: S.
- `projects/plugy/lessons_archive.md` — create with header. Size: S.
- `projects/academic-lab/lessons_archive.md` — create with header. Size: S.

**Wave 3 (Reports infrastructure):**
- `reports/INDEX.md` — generate from current listing (90 entries). Size: M.
- `reports/archive/` — create empty directory. Size: S.

**Wave 4 (BL staging + meta update):**
- `BL_CANDIDATES.md` — create staging file with header. Size: S.
- `meta.md` — update Section 14 items 2, 9, 11. Size: S.
- `CLAUDE.md` — add memory hierarchy note to loading sequence. Size: S.

**Wave 5 (Validation):**
- No files created. Validator checks AC-1 through AC-10.

### Expected Sizes

| Category | Count | Avg size | Total |
|----------|-------|----------|-------|
| New files (S) | 12 | 10-30 lines | ~200 lines |
| New files (M) | 1 (INDEX.md) | ~100 lines | ~100 lines |
| Modified files (S) | 2 (meta.md, CLAUDE.md) | 5-15 lines changed | ~20 lines |
| Modified files (M) | 3 (MEMORY.md, 2x lessons.md) | 30-100 lines changed | ~200 lines |
| **Total new content** | | | **~520 lines** |

### Sequencing

Waves 1, 2, 3 are independent and can be parallelized (3 Builders, per Invariant 13). Wave 4 depends on all three. Wave 5 depends on Wave 4.

If only 1 Builder: execute sequentially 1 -> 2 -> 3 -> 4 -> 5. Estimated total: S-to-M task per wave, 5 waves = M+ overall.

---

## 12. B-Check

```
=== JIDOKA SELF-CHECK (Analyst) ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.90 -- Read all existing artifacts: MEMORY.md (current), lessons.md (2 projects), BOOTSTRAP_LESSONS.md (full), eradev.md Section III.Omega, meta.md Section 14, roadmap Phase 2.B definition, 3 reference reports, reports/ directory listing (90 files), domain_skin.md.template, Claude Code memory directory structure. Did NOT read: plugy/lessons.md, academic-lab/lessons.md (empty or minimal, low risk), meta_RU.md (bilingual mirror, not load-bearing for spec).
  E (Alignment):   0.92 -- Spec addresses exactly the 5 stated problems (flat MEMORY, append-only lessons, BL cap, unindexed reports, no cross-project transfer). Each section maps to a problem. Implementation plan is file-level granular. Backward compat explicitly guaranteed.
  (1-sigma):       0.88 -- Checked for conflicts with Claude Code memory path, existing eradev.md Omega formula, meta.md Section 14, CLAUDE.md loading sequence, Phase 2.A skins. One risk identified (R5: Claude Code subdirectory support, mitigation: flat naming fallback). No conflict with Phase 2.C or 2.D.
  Lambda:          0.85 -- Applied BL-16, BL-30, BL-11, BL-3, BL-32, Lesson 14, EMP4, EMP6. Cross-referenced against odtoe-articles lessons for cross-project examples. Used Phase 2.1.S Hansei pattern (7-step pipeline) as validation model.
  B = 0.90 * 0.92 * 0.88 * 0.85 = 0.619 (uniform weights, B_text)

  min(F,E,1-sigma,Lambda) = 0.85 (Lambda) -- above 0.3 threshold.
  B = 0.619 -- above 0.5 threshold. No Andon required.
```

---

*Spec ready for META review and Builder hand-off.*
*Phase 2.B implementation estimated at M+ task (5 waves, parallelizable to 3 Builder + 1 Validator).*
