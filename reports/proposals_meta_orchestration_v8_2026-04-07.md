# Proposals: META-Orchestration Architecture v8.0

> Date: 2026-04-07
> Source: META-META research session (context pollution + delegation enforcement analysis)
> Scope: meta.md, eradev.md, BOOTSTRAP_LESSONS.md, project config templates
> Status: PROPOSAL — requires implementation as M-task with full RT
> Classification: L-task (8 proposals across 4+ files, architectural change)

---

## Problem Statement

### 3 Structural Deficits in Current Architecture

**Deficit 1: No Positive Definition of META Output**
Current instructions say what META must NOT do ("never write code"). They do not define what META MUST produce. Without a positive role definition, the negative constraint loses to Claude's default attractor ("helpful solo assistant"). Negation is weaker than definition.

**Deficit 2: No Context Separation Protocol**
META and Builder share the same context window. When META reads code, diffs, error logs — it starts "helping" with implementation. Delegation via Agent tool = physical context separation (agent subprocess has its own context). But current protocol has no mechanism for compressed information flow back to META. META either reads raw output (context pollution) or gets nothing (blind management).

**Deficit 3: No Ascending Channel META → META-META**
Lessons are written to projects/{name}/lessons.md. But there is no formalized channel for "here is what should change in the eradev instruction itself." META-META (user + Claude improving the framework) must currently discover improvements by manually reading project files. The ascending channel should be structured and triggered.

### Evidence

| Session | Delegation | S_session | Outcome |
|---------|-----------|-----------|---------|
| Pluggy (2026-04-02) | 0% (95% solo Builder) | UNMEASURED | CRITICAL FAILURE |
| Gravity (2026-04-04) | Partial (3/5 agents refused) | ~0.40 | FAILURE |
| Session 2026-04-02/03 | Mixed (META coded 2.5h) | 0.586 | YELLOW |
| EraDev Rebuild (25 agents) | Full RT protocol | ~0.53 | SUCCESS |
| Plugy RT-1 Fixed | Full RT-1 | 0.586 | SUCCESS |

Pattern: When delegation is enforced → success. When META codes directly → failure. 100% correlation across 5 sessions.

---

## Proposal 1: Positive Definition of META Output

**File:** `meta.md` → new Section 1b (after Mission)
**Current state:** Line 4 says "You NEVER write code or edit project files directly." No definition of what META DOES produce.

### Proposed Addition: META Output Specification

META-Orchestrator produces EXACTLY 5 types of output:

| Output Type | Format | When |
|-------------|--------|------|
| **Agent calls** | Agent tool with role-specific prompt (BL-28 prefix) | Every task, no exceptions |
| **Decisions** | Task classification, team composition, priority assignment | Before each RT cycle |
| **Synthesis** | Unified Plan from RT outputs; ROADMAP updates | After RT-1, RT-2, RT-3 |
| **Lessons** | projects/{name}/lessons.md entries | After each completed task |
| **Reports** | reports/ artifacts (Hansei, proposals, analysis) | At meta-reflection triggers |

META does NOT produce: code, file edits, bash commands (except git), test runs, build outputs, debug sessions. These are Builder/Validator outputs.

**The definitive test:** Before every action, META asks: "Am I producing one of the 5 output types?" If no → VIOLATION. Spawn an agent instead.

**Cost:** ~15 lines added to meta.md.
**Relevant BLs:** BL-16 (reading != applying), BL-26 (META zero quick-fix rule).

---

## Proposal 2: Remove S-Task Exception

**File:** `meta.md` → Section on delegation; `BOOTSTRAP_LESSONS.md` → BL-26
**Current state:** BL-26 says "If time pressure demands a quick fix, classify it S and scope it to S (<=3 lines, 1 file)." This creates a loophole: META can reclassify anything as S to code it directly.

### Proposed Change

**Old BL-26 text:** "...classify it S and scope it to S (<=3 lines, 1 file). Anything larger goes through the pipeline."
**New BL-26 text:** "META ALWAYS delegates, regardless of task size. For S-tasks: spawn 1 Builder agent. For M-tasks: spawn full 5-role team. S-tasks are fast to delegate (one Agent call) — the overhead is seconds, not minutes. The cost of delegation is always lower than the cost of context pollution."

**Rationale:** Every "just this once" S-task that META does directly trains the pattern of direct execution. Context pollution from one S-task is small, but the behavioral precedent is catastrophic. The pluggy session started with "just fix this small thing" and ended with 2.5 hours of solo coding.

**Cost:** ~3 lines modified in BL-26, ~2 lines added to meta.md.

---

## Proposal 3: RT Launch Protocol Matrix

**File:** `eradev.md` → Section VI (Round Table), new subsection
**Current state:** Line 238 says "All 5 roles see the original task SIMULTANEOUSLY (parallel, not pipeline)." This covers RT-1 only. No protocol for RT-2, RT-3, or execution phase.

### Proposed Addition: Launch Protocol Matrix

| Phase | Model | Protocol |
|-------|-------|----------|
| **RT-1** (understanding) | Parallel 5 | All 5 agents receive raw task simultaneously. No agent sees another's output. META synthesizes. |
| **RT-2** (correction) | Hybrid | Coherent broadcasts RT-1 synthesis → 4 roles assess in parallel → Coherent re-synthesizes |
| **RT-3** (acceptance) | Parallel 5 | All 5 agents independently produce go/no-go. No groupthink. META counts verdicts. |
| **Execution M** | Sequential pairs | Builder builds chunk → Validator checks → iterate. Inner ring of torus. |
| **Execution L/XL** | Parallel + cross-check | N Builders parallel → Coherent cross-check gate (terminology, interfaces) → continue or sync → Validators parallel |

**Why Parallel for RT-1/RT-3:** Independent perspectives prevent confirmation bias. Evidence: EraDev rebuild — Validator found formula errors that would have been masked if it had seen Visionary's positive assessment first. Parallel produces genuine S_team; sequential produces phantom coherence (S_team=0.97, S_adjusted=0.33).

**Why Hybrid for RT-2:** By RT-2, a shared frame exists (RT-1 synthesis). Agents need this frame to assess deviation. But assessment itself should be parallel.

**Why Sequential for M Execution:** Fast feedback loop. Builder-Validator iterate on inner ring of torus topology.

**Why Parallel+Gate for L/XL Execution:** Speed of parallel + coordination via Coherent gate. Gravity session lesson: 3 parallel Builders without cross-check → 6pi^5 = two different numbers.

**Cost:** ~20 lines added to eradev.md Section VI.
**Relevant BLs:** BL-28 (agent context), BL-29 (terminology consistency).

---

## Proposal 4: Report Funnel Protocol

**File:** `meta.md` → new Section 8b (after Agent Prompt Template)
**Current state:** No defined information compression pipeline. META reads raw agent outputs, polluting context.

### Proposed Addition: Report Funnel (Context Separation Protocol)

```
Builder (full artifact)
    ↓
Validator → Structured Verdict (fixed format, max 10 lines)
    ↓
Coherent → Cycle Brief for META (max 20 lines)
    ↓
META reads ONLY the Cycle Brief
    ↓
If doubt → Check Agent (disposable, specific questions only)
```

#### Structured Verdict Format (Validator → Coherent)
```
TASK: [task-id]
VERDICT: PASS | PARTIAL | FAIL
MATCH: [0-10] alignment with task spec
DRIFT: NONE | LOW | MEDIUM | HIGH
SUMMARY: [1-2 sentences]
GAPS: [bullets if any]
NEXT: [what should happen next]
```

#### Cycle Brief Format (Coherent → META)
```
CYCLE: [id]
COMPLETED: [N] tasks — [ids]
PARTIAL: [N] — [id + 1-line gap each]
FAILED: [N] — [id + 1-line reason each]
ESSENCE: ALIGNED | DRIFTING | MISALIGNED + 1 sentence
METRICS: S_session=_ B_mean=_ fix_rate=_
NEXT: [max 3 recommendations for META]
```

#### Check Agent Pattern (exception only)
When META suspects a problem, spawn a disposable Check Agent with specific yes/no questions. Agent reads raw output, answers questions, dies. META never reads raw output itself.

**The Level Separation Rule:** Each orchestration level reads ONLY structured output from the level directly below. META reads Cycle Briefs, never code. META-META reads Hansei Reports, never Cycle Briefs.

**Cost:** ~25 lines added to meta.md.
**Relevant BLs:** BL-16 (enforcement), BL-28 (agent context).

---

## Proposal 5: Essence Spec as Project Artifact

**File:** `meta.md` → new Section 15 (Project Essence Protocol); `templates/` → ESSENCE_SPEC.template
**Current state:** Project goals live in config.md True North. But True North is abstract ("eternal attractor"). No testable specification of what the project MUST embody.

### Proposed Addition: Essence Specification

META creates an Essence Spec at project start and updates it at major milestones.

```
ESSENCE SPEC v[N] — PROJECT: [name]
DATE: [date]

PRINCIPLES:
  P-1: [statement] — TEST: [how to verify]
  P-2: [statement] — TEST: [how to verify]
  ...

INVARIANTS:
  I-1: [thing that must always be true]
  I-2: [thing that must always be true]
  ...

ANTI-PATTERNS:
  X-1: [thing that must never happen]
  X-2: [thing that must never happen]
  ...
```

**Essence Audit** (at each RT-3 or meta-reflection):
Coherent (as Essence Auditor) checks: "Does what was built still match the Essence Spec?"
Output: `STATUS: ALIGNED | WATCH | DRIFT | VIOLATION` + 1-3 sentences + recommendation.
META reads ONLY this audit output.

**Cost:** ~15 lines in meta.md, 1 new template file.
**Relevant BLs:** BL-15 (spiral gap ~2%), BL-5 (phantom coherence detection).

---

## Proposal 6: Proactive Meta-Reflection Triggers

**File:** `meta.md` → new Section 16 (Meta-Reflection Protocol)
**Current state:** No triggers. META reflects only when user asks or when RT-3 happens. No proactive "let's step back."

### Proposed Addition: Trigger Matrix

| Trigger | Condition | Priority |
|---------|---------|----------|
| Milestone complete | Roadmap phase transitions to DONE | HIGH |
| Essence drift | Essence Auditor reports WATCH or worse | HIGH |
| Metric degradation | S_session < 0.5 for 2+ consecutive tasks | HIGH |
| Repeated failure | Same task fails validation 2+ times | HIGH |
| Context budget | >60% of context window consumed | MEDIUM |
| Task volume | 5-8 tasks completed since last reflection | LOW (backstop) |

**META must proactively say:** "We've completed [N tasks / phase X]. I recommend a meta-reflection before continuing. Switch to meta-level?"

**Meta-Reflection Output:**
```
META-REFLECTION — TRIGGER: [what triggered]
1. STATE: Where on roadmap? What's working? What's not?
2. LESSONS: New lessons (max 5). Promote/retire existing.
3. COURSE: Roadmap adjustments? Role changes? Process changes?
4. ESSENCE: Still building what we set out to build?
5. CONTEXT: Prune completed details. Reset metrics.
6. NEXT: Top 3 priorities for next cycle.
```

**Cost:** ~20 lines added to meta.md.

---

## Proposal 7: Hansei Report Format (META → META-META Channel)

**File:** `meta.md` → new Section 17 (Ascending Channel)
**Current state:** No formalized channel. Improvements to eradev discovered ad hoc.

### Proposed Addition: Ascending Channel Protocol

**Trigger:** Meta-reflection reveals that a process change affects the framework itself (not just the project). Or: explicit user request for framework review.

**Hansei Report Format (saved to reports/):**
```
HANSEI REPORT — META → META-META
PROJECT: [name] | DATE: [date] | SESSIONS: [count]

1. PROCESS METRICS
   Total tasks: [N], Pass rate: [X%]
   Delegation efficiency: [how often META spawned Check Agents]
   Essence drift events: [count + pattern]
   Context utilization: [typical % at session end]

2. WHAT WORKED (framework-level, not project-level)
   [max 5 bullets about orchestration patterns]

3. WHAT FAILED (framework-level)
   [max 5 bullets about process breakdowns]

4. PROPOSALS FOR ERADEV INSTRUCTION
   P-1: [WHAT to change] | [WHERE: file + section] | [WHY] | [EXPECTED EFFECT]
   P-2: ...

5. LESSON CANDIDATES FOR BOOTSTRAP
   [lessons that generalize beyond this project → BL candidates]
```

**Level Separation:** META-META reads Hansei Reports, never Cycle Briefs or raw output. Each level is a compression filter.

**Cost:** ~15 lines added to meta.md.

---

## Proposal 8: META Context Budget Protocol

**File:** `meta.md` → new Section 18 (Context Hygiene)
**Current state:** No guidance on what should and should not be in META's context. META accumulates implementation details until it loses strategic focus.

### Proposed Addition: Context Tiers

| Tier | Content | Lifetime | Size |
|------|---------|----------|------|
| **T1 — Anchors** | True North, constraints, role registry, protocol | Permanent | ~200 lines |
| **T2 — Session State** | Roadmap snapshot, active assignments, metrics, blockers | Per session | ~50 lines |
| **T3 — Wisdom** | Lessons (1 line each), patterns, key decisions (verdict only) | Accumulated, pruned | ~100 lines |
| **FORBIDDEN** | Raw code, diffs, error logs, test output, debug traces | NEVER enters META context | 0 |

**The Admission Test:** "Does this information change my next decision about task assignment, priority, or direction?" No → do not read it. Spawn a Check Agent if you need to verify something.

**Context Pruning:** At every meta-reflection, META:
- Archives completed task details (keep only: task-id + verdict + lesson)
- Compresses lesson log (merge duplicates, retire obsolete)
- Updates roadmap snapshot (remove completed detail, expand upcoming)
- Resets session metrics for next cycle

**Cost:** ~15 lines added to meta.md.

---

## Implementation Roadmap

### Phase 1: Core Identity (must be first — fixes the root cause)
| # | Proposal | File | Priority |
|---|----------|------|----------|
| P1 | Positive META Output Definition | meta.md | CRITICAL |
| P2 | Remove S-Task Exception | meta.md, BL-26 | CRITICAL |

### Phase 2: Information Architecture
| # | Proposal | File | Priority |
|---|----------|------|----------|
| P4 | Report Funnel Protocol | meta.md | HIGH |
| P8 | Context Budget Protocol | meta.md | HIGH |

### Phase 3: Operational Protocols
| # | Proposal | File | Priority |
|---|----------|------|----------|
| P3 | RT Launch Protocol Matrix | eradev.md | HIGH |
| P5 | Essence Spec | meta.md, templates/ | MEDIUM |

### Phase 4: Feedback Loops
| # | Proposal | File | Priority |
|---|----------|------|----------|
| P6 | Proactive Reflection Triggers | meta.md | MEDIUM |
| P7 | Hansei Report Format (META → META-META) | meta.md | MEDIUM |

### Files Affected
- `meta.md` — 7 proposals touch this file (~105 lines added, organized as new Sections 1b, 8b, 15-18)
- `eradev.md` — 1 proposal (P3, ~20 lines in Section VI)
- `BOOTSTRAP_LESSONS.md` — 1 proposal (P2, ~3 lines modified in BL-26)
- `templates/ESSENCE_SPEC.template` — 1 new file (P5)
- Skill bundle sync after all changes (12+ files)
- Zip rebuild

### Total Estimated Changes
- ~125 lines added to meta.md
- ~20 lines added to eradev.md
- ~3 lines modified in BOOTSTRAP_LESSONS.md
- 1 new template file
- Bilingual sync required (BL-19)

---

## Acceptance Criteria

- [AC-1] META Output Definition exists in meta.md with 5-type table and definitive test
- [AC-2] BL-26 has NO S-task exception — META delegates always
- [AC-3] RT Launch Protocol Matrix in eradev.md covers all 5 phases with rationale
- [AC-4] Report Funnel with Verdict and Cycle Brief formats defined in meta.md
- [AC-5] Essence Spec template exists with PRINCIPLES / INVARIANTS / ANTI-PATTERNS structure
- [AC-6] Meta-reflection trigger table in meta.md with 6+ triggers and priority levels
- [AC-7] Hansei Report format for META → META-META channel defined
- [AC-8] Context Budget tiers defined with Admission Test and Pruning protocol

## Cross-References

- 3 structural deficits: identified in research session 2026-04-07
- Evidence: plugy L-016, gravity hansei P-1/P-5, meta_hansei_session
- RT launch research: sequential vs parallel analysis (3 research agents)
- Context management research: Report Funnel + Check Agent pattern
- Existing enforcement: 14 declarative points found, 1/8 mechanisms formalized
