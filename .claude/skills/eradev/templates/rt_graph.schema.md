# Declarative RT Graph Schema (v10)

> Version: 1.0
> Status: schema-only (no execution engine in v10)
> Purpose: structural reference for META agent RT coordination
> Source: v10 Theoretical Research, Item 5 (Declarative RT Graph)

---

## 1. Schema Definition

An RT graph is a YAML document describing the full Round Table lifecycle for a task. META reads this graph at session start and uses it as a lookup table for spawning decisions. In v10, META still spawns agents manually -- the graph is the source of truth for STRUCTURE, not an executable program.

### 1.1 Top-Level Fields

```yaml
rt_graph:
  version: "1.0"           # Schema version (string, semver)
  task_class: <S|M|L|XL>   # Task classification per Section X
  domain: <type>            # Domain type per Section II.1 (code|article|book|plan|research|config)
  b_modality: <modality>    # B-formula modality (text|creative|research)
  phases: <map>             # Ordered map of phase definitions (see 1.2)
```

| Field | Type | Required | Values | Default |
|-------|------|----------|--------|---------|
| `version` | string | yes | semver, currently "1.0" | -- |
| `task_class` | enum | yes | S, M, L, XL | -- |
| `domain` | enum | yes | code, article, book, plan, research, config | code |
| `b_modality` | enum | no | text, creative, research | inferred from domain |
| `phases` | map | yes | keyed phase definitions | -- |

### 1.2 Phase Definition

Each phase is a keyed entry in the `phases` map:

```yaml
phases:
  <phase_id>:
    name: <string>              # Human-readable phase name
    roles: [<role>, ...]        # Roles participating (visionary|analyst|builder|validator|coherencer)
    mode: <sequential|parallel|hybrid>  # Execution model
    gate: <string>              # Gate condition (human-readable, evaluated by META)
    depends_on: [<phase_id>, ...]  # Phases that must complete before this one starts
    optional: <bool>            # If true, phase is recommended but not mandatory
    repeat: <int>               # Max repetitions (for iterative phases like execution)
    on_fail: <string>           # Action on gate failure (andon|retry|escalate)
```

| Field | Type | Required | Values | Default |
|-------|------|----------|--------|---------|
| `name` | string | yes | descriptive label | -- |
| `roles` | list[enum] | yes | subset of 5 roles | -- |
| `mode` | enum | yes | sequential, parallel, hybrid | parallel |
| `gate` | string | yes | gate condition expression | -- |
| `depends_on` | list[string] | no | phase IDs from same graph | [] |
| `optional` | bool | no | true/false | false |
| `repeat` | int | no | 1-5 | 1 |
| `on_fail` | enum | no | andon, retry, escalate | andon |

### 1.3 Gate Expressions

Gates are human-readable conditions that META evaluates. They are NOT executable code -- META interprets them using its judgment. Standard gate vocabulary:

| Gate Expression | Meaning | Checked By |
|----------------|---------|------------|
| `all_responses_received` | All spawned agents returned output | META |
| `S_adjusted >= 0.45` | Team coherence meets threshold | Coherencer at RT |
| `B >= 0.5 AND no_andon` | Quality passes and no stop signals | Validator |
| `all_checks_pass` | All verification checks green | Validator |
| `artifact_produced` | Builder produced the deliverable | Builder |
| `central_claim_defined` | Visionary established the core thesis | Visionary |
| `unified_plan_accepted` | META synthesized and no RED flags | META |
| `fix_chain < 3` | No runaway fix loop (BL-3) | Trace Accumulator |
| `cross_check_pass` | Coherencer terminology/interface gate | Coherencer |
| `go_nogo_majority` | Majority of roles vote GO at RT-3 | META (5/5 or 4/5) |
| `apophatic_pass` | Apophatic Gate cleared (v10, Section IV) | Visionary + Coherencer |

### 1.4 Mode Semantics

| Mode | Behavior | When Used |
|------|----------|-----------|
| `parallel` | All roles spawned simultaneously. No agent sees another's output. | RT-1, RT-3 (independence prevents confirmation bias) |
| `sequential` | Roles execute in list order. Each sees previous output. | Execution (Builder then Validator on inner torus ring) |
| `hybrid` | One role broadcasts, then others assess in parallel. | RT-2 (Coherencer broadcasts, 4 roles assess) |

---

## 2. Example RT Graphs

### 2.1 S-Task Graph (Builder + Validator only)

Minimal graph for small tasks (<=3 lines, 1 file, no logic). No RT cycle -- direct execution with mandatory validation.

```yaml
rt_graph:
  version: "1.0"
  task_class: S
  domain: code
  b_modality: text

  phases:
    apophatic_gate:
      name: "Apophatic Pre-Screen"
      roles: [visionary]
      mode: sequential
      gate: "apophatic_pass"
      optional: true
      on_fail: escalate

    execution:
      name: "Builder Execution"
      roles: [builder]
      mode: sequential
      gate: "artifact_produced AND fix_chain < 3"
      depends_on: [apophatic_gate]
      repeat: 3
      on_fail: andon

    validation:
      name: "Validator Gate"
      roles: [validator]
      mode: sequential
      gate: "B >= 0.5 AND all_checks_pass"
      depends_on: [execution]
      on_fail: retry
```

### 2.2 M-Task Graph (Full RT Cycle)

Standard graph for medium tasks (1 module, clear task). Full 5-role Round Table with all three synchronization points.

```yaml
rt_graph:
  version: "1.0"
  task_class: M
  domain: article
  b_modality: creative

  phases:
    rt_0:
      name: "Visionary Solo (Pre-RT)"
      roles: [visionary]
      mode: sequential
      gate: "central_claim_defined"
      optional: true

    apophatic_gate:
      name: "Apophatic Gate"
      roles: [visionary]
      mode: sequential
      gate: "apophatic_pass"
      depends_on: [rt_0]
      on_fail: escalate

    rt_1:
      name: "Full Round Table -- Understanding"
      roles: [visionary, analyst, builder, validator, coherencer]
      mode: parallel
      gate: "all_responses_received AND S_adjusted >= 0.45"
      depends_on: [apophatic_gate]

    execution:
      name: "Builder Execution"
      roles: [builder]
      mode: sequential
      gate: "artifact_produced AND fix_chain < 3"
      depends_on: [rt_1]
      repeat: 3
      on_fail: andon

    validation:
      name: "Validator Gate"
      roles: [validator]
      mode: sequential
      gate: "B >= 0.5 AND no_andon"
      depends_on: [execution]
      on_fail: retry

    rt_2:
      name: "Midpoint Course Correction"
      roles: [visionary, analyst, builder, validator, coherencer]
      mode: hybrid
      gate: "S_adjusted >= 0.45"
      depends_on: [validation]
      optional: true

    rt_3:
      name: "Final Acceptance"
      roles: [visionary, analyst, builder, validator, coherencer]
      mode: parallel
      gate: "go_nogo_majority AND all_checks_pass"
      depends_on: [rt_2]
```

### 2.3 L/XL-Task Graph (Multi-Round with RT-per-Cluster)

Complex graph for large tasks (2+ modules, architecture changes). Multiple Builder teams with Coherencer cross-check gates between them.

```yaml
rt_graph:
  version: "1.0"
  task_class: L
  domain: code
  b_modality: text

  phases:
    rt_0:
      name: "Visionary Solo"
      roles: [visionary]
      mode: sequential
      gate: "central_claim_defined"

    apophatic_gate:
      name: "Apophatic Gate"
      roles: [visionary, coherencer]
      mode: sequential
      gate: "apophatic_pass"
      depends_on: [rt_0]
      on_fail: escalate

    rt_1:
      name: "Full RT -- Understanding + Decomposition"
      roles: [visionary, analyst, builder, validator, coherencer]
      mode: parallel
      gate: "all_responses_received AND S_adjusted >= 0.45 AND unified_plan_accepted"
      depends_on: [apophatic_gate]

    execution_parallel:
      name: "Parallel Builder Execution (N_teams clusters)"
      roles: [builder]
      mode: parallel
      gate: "all_clusters_artifact_produced"
      depends_on: [rt_1]
      repeat: 3
      on_fail: andon

    coherencer_cross_check:
      name: "Coherencer Cross-Check Gate"
      roles: [coherencer]
      mode: sequential
      gate: "cross_check_pass"
      depends_on: [execution_parallel]
      on_fail: retry

    validation_parallel:
      name: "Parallel Validator Gate"
      roles: [validator]
      mode: parallel
      gate: "all_clusters_B >= 0.5 AND no_andon"
      depends_on: [coherencer_cross_check]
      on_fail: retry

    rt_2:
      name: "Midpoint Course Correction"
      roles: [visionary, analyst, builder, validator, coherencer]
      mode: hybrid
      gate: "S_adjusted >= 0.45"
      depends_on: [validation_parallel]

    execution_round_2:
      name: "Builder Round 2 (corrections)"
      roles: [builder]
      mode: sequential
      gate: "artifact_produced AND fix_chain < 3"
      depends_on: [rt_2]
      repeat: 3
      on_fail: andon

    validation_round_2:
      name: "Validator Round 2"
      roles: [validator]
      mode: sequential
      gate: "B >= 0.5 AND all_checks_pass"
      depends_on: [execution_round_2]
      on_fail: retry

    rt_3:
      name: "Final Acceptance"
      roles: [visionary, analyst, builder, validator, coherencer]
      mode: parallel
      gate: "go_nogo_majority AND all_checks_pass AND S_adjusted >= 0.45"
      depends_on: [validation_round_2]
```

**XL extension:** XL tasks use the L graph with `multi_team: true` annotation. This means:
- `execution_parallel` spawns `N_teams = ceil(N_modules / 3)` Builder instances
- `coherencer_cross_check` activates L2 Coherencer hierarchy (cross-team terminology + interface sync)
- `validation_parallel` spawns matching Validator instances per team
- If N_teams > 3, an L3 Coherencer coordinates L2 Coherencers

---

## 3. How META Executes This Graph (v10 Protocol)

In v10, META reads the graph as a **lookup table**, not as an executable program. There is no graph execution engine. The protocol is:

1. **At session start:** META reads the appropriate graph file based on task classification (S/M/L/XL).
2. **Phase by phase:** META walks the `phases` map in order. For each phase:
   a. Check `depends_on` -- are all dependencies complete? If not, wait.
   b. Check `optional` -- if true and META judges the phase unnecessary, skip with logged reason.
   c. Spawn agents per `roles` list using the `mode` (parallel/sequential/hybrid).
   d. Collect outputs. Evaluate `gate` condition.
   e. If gate fails: apply `on_fail` action (andon/retry/escalate).
   f. If gate passes: mark phase complete, proceed to next.
3. **At RT-3:** META records the graph traversal path in the session report (which phases ran, which were skipped, which gates fired).

**What this changes from v9:** Nothing operational. META already follows this exact pattern by reading the procedural text in eradev.md Section VI. The graph makes the pattern EXPLICIT and INSPECTABLE. A future v11 execution engine could parse this YAML and automate step 2.

**What this does NOT change:** Agent spawning (META still uses Agent tool), role file loading (agents still self-load per Invariant 12), B/S computation (still per Section III formulas), gate enforcement (still per Section IV).

---

## 4. Schema Constraints

- Every graph MUST include at least one phase with `roles: [validator]` (no artifact ships unvalidated).
- Every graph with `task_class: M` or higher MUST include at least one `mode: parallel` phase (RT-1 or RT-3) to preserve independent perspectives.
- The `apophatic_gate` phase is REQUIRED for M+ tasks (v10, Section IV Apophatic Gate). It is optional for S tasks.
- `repeat` values > 5 are invalid (unbounded iteration is a fix-chain anti-pattern, BL-3).
- `depends_on` MUST NOT create cycles (the graph is a DAG).
- Gate expressions use the vocabulary from Section 1.3. Custom gates are allowed but must be documented in the graph's comments.

---

## 5. Versioning and Extension

- Schema version "1.0" covers S/M/L/XL standard patterns.
- v11+ may extend with: custom phases (e.g., `peer_review` for research domains), conditional branching (if/else on gate outcomes), sub-graphs (reusable phase groups), and execution engine bindings (LangGraph, custom).
- Non-standard phases are OUT OF SCOPE for v10. The schema supports them syntactically (any `phase_id` is valid) but no execution semantics are defined beyond the 3 standard modes.
- Backward compatibility: v10 graphs MUST be parseable by v11+ engines. New fields are additive only (AC-1).
