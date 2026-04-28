# v10 Team-Composition Rules Audit — 2026-04-24

> Role: [ANALYST] (EN stack, role file `roles/analyst_EN.md`)
> Scope: read-only audit of "how many agents of each role, when, why" across the framework
> Trigger: operator question — "проверь — учтено ли у нас условие сколько билдеров сколько валидаторов запускать сколько аналитиков и когерентов и определены понятные условия когда что как?"
> Deliverable: this report + 5 dimensions + ranked gaps

---

## 0. Activation Operator Log

- **A_F (Focus):** Read `eradev.md` (Sections V/VI/X/III.2/III.3/VI.1), `meta.md` (§§1a/8/9/10/14 + μ-check), `CLAUDE.md` (Invariants 1-17 + KILL-TEST), `BOOTSTRAP_LESSONS.md` (BL-26/28/29/33/34/35), `templates/unified_plan.md.template`, `templates/rt_graph.schema.md`, `.claude/hooks/*.sh`, `roles/analyst_EN.md` + `roles/coherent_EN.md`, all 6 domain skins for Builder-count exceptions, plus session reports from 2026-04-24 Bundle A/B/C/D (the practice exhibit).
- **A_E (Alignment):** Operator intent = decide whether to ship clarifying BLs/gates or accept current state. Answer "CLEAR / PARTIAL / FRAGMENTED / MISSING" with concrete file:line citations per axis.
- **A_σ (Consistency):** Ran cross-reference grep for Builder/Validator/Analyst/Coherent counts across all framework surfaces + skills mirror (`.claude/skills/eradev/`). Found `.claude/skills/eradev/reference/README_EN.md:148` mirrors `eradev.md:796` — no drift on the table, but skills copy is a second source of truth (see Gap G4 below).
- **A_Λ (Experience):** BL-26 (delegation), BL-28 (prompt context), BL-29 (parallel Builder terminology drift), BL-34 (composition hazards), BL-35 (rework discipline) are the lessons that have shaped composition rules. BL-33 enforcement-tier ladder (T1 > T2 > T3 > T4) is the audit lens for rigor assessment.

Status: all 4 GREEN.

---

## 1. Dimension 1 — Per task-size composition

### 1.1 What the framework says, verbatim

**`eradev.md:933-940` (Section X table — canonical source):**

| Size | Criterion | Min Agents | Min RT |
|------|-----------|-----------|--------|
| S | ≤3 lines, 1 file, no logic | **2 (Builder + Validator)** | 0 |
| M | 1 module, clear task | **5 (full team)** | 1 |
| L | 2-3 modules | **5-8 (team + extra Builders)** | 3 |
| XL | 4+ modules, architecture change | **10+ (multiple teams + L2)** | 3 + L2 |

Scaling formula (`eradev.md:940`): `N_teams = ceil(N_modules / 3)`.

**`meta.md:179-186` (Section 9 mirror):**

| Size | Agents | RT cycles | Coherent | Inertia I(C) |
|------|--------|-----------|----------|--------------|
| S | **2** | 0 | — | <5 |
| M | **5** | 1 | L1 | 5-20 |
| L | **5-8** | 3 | L1+L2 | 20-50 |
| XL | **10+** | 3+L2 | L1+L2+L3 | >50 |

Scaling formula: `N_teams = ceil(N_modules / 3)`, `I(C) = files * coupling * legacy_factor`.

**`CLAUDE.md:70` (Invariant 1):** "S-tasks: Builder + Validator agents. M+: full 5-role team. NO exceptions. (BL-26)"

**`CLAUDE.md:101-103` (KILL-TEST):** "M+ tasks: 'Spawn 5 Agent calls for RT-1'. S tasks: 'Spawn Builder + Validator agents'."

### 1.2 Per-role breakdown

| Role | S | M | L | XL |
|------|---|---|---|----|
| **Visionary** | 0 (implicit) | 1 (explicit RT-1) | 1 | 1 per team? UNCLEAR |
| **Analyst** | 0 (implicit) | 1 | 1 | 1 per team? UNCLEAR |
| **Builder** | **1** (explicit) | 1 | "extra Builders" — **N unspecified** | Multiple, via `N_teams = ceil(N_modules/3)` |
| **Validator** | **1** (explicit) | 1 | Parallel per Builder? Inferred from `eradev.md:796` | Parallel per Builder (inferred) |
| **Coherent** | 0 | 1 (L1) | 1 L1 + 1 L2 | 1 L1 per team + 1 L2 + 1 L3 when `N_teams ≥ 5` |

### 1.3 Verdict Dimension 1

- **S and M rows:** CLEAR. Absolute counts (2, 5) stated, and `CLAUDE.md` Invariant 1 + KILL-TEST enforce them with blocking rhetoric.
- **L row "5-8 (team + extra Builders)":** PARTIAL. The range is stated but no rule says how to pick 5 vs 8, and "extra Builders" is singular noun without count. Operator must infer from `N_teams = ceil(N_modules/3)` scaling formula that's written for XL.
- **XL row "10+ (multiple teams + L2)":** PARTIAL. `N_teams = ceil(N_modules/3)` gives team count but not agents-per-team. If a team = 5 (full quintet), then N_modules=4 → 2 teams → 10 agents — consistent. But the Visionary/Analyst/Coherent count per team is never explicitly stated (e.g., do you spawn 1 Visionary for the whole task or 1 per team? — see Gap G1).

---

## 2. Dimension 2 — Parallel vs Sequential conditions

### 2.1 Canonical rules

**`eradev.md:788-796` RT Phase Protocols table:**

| Phase | Model | Protocol |
|-------|-------|----------|
| RT-1 (understanding) | Parallel 5 | All 5 simultaneously, META synthesises |
| RT-2 (correction) | Hybrid | Coherent broadcasts → 4 roles parallel → Coherent re-synthesises |
| RT-3 (acceptance) | Parallel 5 | Independent go/no-go, META counts verdicts |
| Execution M | Sequential pairs | Builder → Validator → iterate (inner torus ring) |
| Execution S | Sequential pair | Builder fixes → Validator verifies |
| Execution L/XL | Parallel + gate | **N Builders parallel → Coherent cross-check gate → Validators parallel** |

Justification at `eradev.md:798-801`:
- Parallel RT-1/RT-3 → independent perspectives prevent confirmation bias (`S_team=0.97 / S_adjusted=0.33` sequential-anchoring evidence).
- Hybrid RT-2 → shared frame exists from RT-1.
- Sequential M execution → fast Builder→Validator feedback on inner torus.
- Parallel+gate L/XL → speed of parallel + Coherent sync gate.

**`CLAUDE.md:80` Invariant 11 (Execution Order):** "Builder COMPLETES first, THEN Validator starts. Never parallel. For L/XL: all Builders complete → Coherent gate → then Validators." — **UNIVERSAL**, blocking.

**`CLAUDE.md:82` Invariant 13 (Parallelization):** "Independent tasks/agents MUST be spawned simultaneously with `run_in_background: true`. Sequential only when there is a real dependency." — **UNIVERSAL**.

**`meta.md:157` (agent prompt template):** "Parallelization rule: Independent agents MUST be spawned simultaneously... Coherent syncs results when all complete."

### 2.2 Where the documentation is weak

- **"When is the same role allowed to be spawned in parallel?" — IMPLICIT.** Invariant 13 says "independent tasks", and `eradev.md:796` says "N Builders parallel" for L/XL. But no rule explicitly answers: "can I spawn 2 parallel Analysts? 3 parallel Validators?" — see Gap G2. The answer is "yes, if independent" per Invariant 13, but the framework never names N Analysts or N Validators outside Builder context.
- **Thresholds for N Builders (2 vs 4 vs 8):** NOT defined in framework core. The only numeric rule is `N_teams = ceil(N_modules/3)` which says N_teams, not N_builders-per-team. Since one team = 1 Builder in the Section V "Minimum Viable Team" definition, N_teams ≈ N_Builders — but the framework never closes this loop explicitly.
- **Domain skins give MORE specific rules than core.** E.g.:
  - `templates/domain_skin.article.md:314`: "For an XL article (>8000 words, >4 sections), Analyst MAY split work across two Builders by section ownership. File Ownership applies. Coherent gate is MANDATORY between Builder completion and Validator start."
  - `templates/domain_skin.config.md:321`: "Single Builder for S/M/L configs. Exception: XL multi-tool configs — Analyst may split work across two Builders by tool boundary."
  - `templates/domain_skin.plan.md:298`: "Exception (XL only): >10 phases OR >2 weeks OR >3 named owners — two Builders by phase ownership."
  - `templates/domain_skin.research.md:239`: "Exception (L/XL only): For multi-proof notebooks (>3 independent proofs), two Builders may own different proofs in parallel."
  - `templates/domain_skin.book.md:310` and `domain_skin.code.md:110`: mention multi-Builder pattern.
  - These exceptions are DOMAIN-LOCAL: they never appear in `eradev.md` or `CLAUDE.md`. A session working outside a domain skin (e.g., framework-level work like v10 Bundle A/B/C/D) has no rule to point at for why 4 parallel Builders is OK.

### 2.3 Verdict Dimension 2

- **Invariant 11 + 13:** CLEAR. Blocking, universal, and `CLAUDE.md`-level. No operator can miss them.
- **N Builders for L/XL:** PARTIAL. Formula exists (`N_teams = ceil(N_modules/3)`) but the domain-level rules (`domain_skin.*`) carry the concrete thresholds; framework core has only vague "extra Builders" language.
- **N Analysts / N Validators parallel:** IMPLICIT. Invariant 13 generalises but no table lists these.

---

## 3. Dimension 3 — RT Phase composition

### 3.1 Canonical rules

**`eradev.md:736-745` — RT-1 / RT-2 / RT-3 general:**
- "Every non-trivial task passes through RT-1, RT-2, RT-3."
- "All 5 roles see the original task SIMULTANEOUSLY (parallel, not pipeline)."
- RT-1: Visionary + Analyst + Builder + Validator + Coherent (5 sentences each, 5 distinct questions).

**`eradev.md:788-796`:** table locks RT-1 = parallel 5, RT-2 = hybrid (Coherent-broadcast + 4 parallel + Coherent resynth), RT-3 = parallel 5.

**`eradev.md:803-844` FLUX RT Protocol (v10 Bundle D):**

| Phase | BIM (strict/structured) | FLUX (exploratory/emergent) |
|---|---|---|
| RT-0 Visionary solo | IFR past-tense with measurable AC | IFR as DIRECTION with experiential criteria |
| RT-1 parallel 5-agent | All 5 roles, full Output Formats | **Visionary + Analyst (voice guide + glossary seed) + Builder assignment; Validator + Coherent DELAYED to post-draft** |
| μ-check | BLOCKING via `doc_alignment` | ADVISORY via `flux_check` |
| Build | Short cycles, Jidoka during | **Single agent, free-flow, Jidoka AFTER** |
| RT-2 | Mid-point sync | Post-segment synthesis |
| RT-3 | A3 + S_session + prediction delta | A3 + consolidation of emergent findings |

### 3.2 RT-0 (Apophatic Gate)

`eradev.md:640-655`: "Gate location: after RT-0 (Visionary solo) and before RT-1. Gate owner: Visionary (primary) + Coherent (tie-breaker probe)." → RT-0 = 1 agent (Visionary). Clear.

### 3.3 RT-1 Composition Hazards Gate

`eradev.md:749-765` + `CLAUDE.md:84` Invariant 15: "When the task plan lists ≥2 independent refactors... Visionary MUST author a composition-hazards grid BEFORE Coherent synthesizes Unified Plan." — blocks Unified Plan synthesis without grid.

### 3.4 Verdict Dimension 3

- **RT-0 / RT-1 / RT-2 / RT-3 core composition:** CLEAR — table at `eradev.md:788-796` is authoritative, plus RT-0 is covered at `eradev.md:640-655` (Apophatic Gate).
- **FLUX RT Protocol:** CLEAR — `eradev.md:819-829` table gives the exact per-phase composition for exploratory/emergent.
- **RT-1 Composition Hazards Gate (BL-34):** CLEAR with hook enforcement (`rt1-composition-gate.sh:42-79`).

---

## 4. Dimension 4 — Multi-Builder specific conditions

### 4.1 What rules exist

**`eradev.md:947-952` File Ownership Protocol:**
```
When 2+ Builders work in parallel, Analyst MUST assign files:
- Builder-A: [list of files]
- Builder-B: [list of files]
- Shared files: assigned to ONE Builder only.
- File overlap = Andon (stop).
```

**`roles/analyst_EN.md:20-21` Responsibility 4:** "Dependency analysis — determine what to parallelize, what to sequence; Artifact Ownership when 2+ Builders are involved." — Analyst owns the "who does what" assignment.

**`meta.md:203-210` Cross-Builder Consistency Check (XL tasks):**
```
When 2+ Builders work in parallel on the same task:
1. After Build phase, Coherent runs a cross-check: do outputs use the same terminology, conventions, and assumptions?
2. Validator spot-checks shared variables, formulas, and interfaces across Builder outputs.
3. Any inconsistency = YELLOW. Contradictory outputs = RED (Andon).
```
Evidence citation (`meta.md:210`): "Three parallel Builders in the gravity session produced conflicting notation and a formula error (6π⁵) that propagated across sections. File Ownership (existing rule) prevents merge conflicts but not semantic divergence."

**`BOOTSTRAP_LESSONS.md:201-216` BL-29:** "Before generating any artifact... grep/read the project's existing outputs to identify established terminology... The cost of reading existing conventions first is seconds; the cost of harmonizing divergent terminology after generation is hours." — driven by the same 3-Builder gravity session.

**Domain-skin rules (already listed in §2.2):** article/config/plan/research skins each specify the XL-or-L/XL trigger for splitting to 2 Builders. Book and code skins reference multi-Builder pattern without explicit count.

### 4.2 What rules DO NOT exist

- **No rule on the UPPER BOUND of parallel Builders.** Session practice ran 4 parallel Builders (Bundle A: math `v10_bundleA_math_builder_2026-04-24.md`, Bundle B: protocol `v10_bundleB_protocol_builder_2026-04-24.md`, Bundle C: discipline `v10_bundleC_discipline_builder_2026-04-24.md`, Bundle D: unified integration `v10_bundleD_unified_integration_2026-04-24.md`). All 4 cite file-level disjointness. But framework never says "3 Builders = need L2 Coherent, 5 Builders = need L3, >8 Builders = split into teams." The `N_teams = ceil(N_modules / 3)` formula implies at ≥4 Builders you should be in XL territory with L2 Coherent active. It's there, just not highlighted as a ceiling rule.
- **No rule for "2 parallel Analysts" or "3 parallel Validators".** Session practice ran multiple parallel Analysts (4 distinct analyses ran on 2026-04-24 day: `v10_conditional_bim_deep_research`, `v10_parallel_trajectories_analysis`, `v10_bim_creativity_tension`, `v10_bim_planning_audit`) — each authorised by "independent inquiry task" operator framing, not by a rule.
- **No rule for "N Validators per N Builders".** `eradev.md:796` says "Validators parallel" for L/XL, but doesn't close the count: 1 Validator reviews all N Builder outputs, or each Builder gets its own Validator?  Session practice matched 1:1 (Bundle A Validator, Bundle B Validator, Bundle C Validator, Bundle D Validator — all as separate reports), but this was inferred, not rule-driven.

### 4.3 Verdict Dimension 4

- **File Ownership + Cross-Builder Consistency Check + BL-29:** CLEAR — trio of rules that activate when N_Builders ≥ 2. Enforcement at Analyst (assignment) + Coherent (terminology gate) + Validator (consistency audit).
- **Upper bound on N_Builders + "how many parallel Validators":** MISSING. Session ran 4 Builders + 4 Validators without a framework rule specifically authorising it; the implicit authority is Invariant 13 ("maximize parallelization for independent tasks") + domain-level overrides.
- **"When is multi-Builder allowed?":** PARTIAL — domain skins carry the criteria (file count, section count, phase count, proof count) but `eradev.md` / `CLAUDE.md` only reference them via the `N_teams = ceil(N_modules/3)` formula.

---

## 5. Dimension 5 — RIGOR_LEVEL conditional composition

### 5.1 RIGOR_LEVEL axis definition

**`eradev.md:520-525` (RIGOR_LEVEL table):**

| RIGOR_LEVEL | BIM application |
|---|---|
| strict | FULL BIM — μ-check BLOCKING, Cross-Layer Contracts mandatory, F7 hard threshold, τ_cycle primacy |
| structured | PARTIAL BIM — Unified Plan required; μ-check BLOCKING with N/A-tolerance; F7 COMMIT target |
| exploratory | BIM OFF (IFR+RT-0 stay) — μ-check ADVISORY; FLUX protocol; Voice Guide; Validator ADVISORY; long cycles permitted |
| emergent | NO PLANNING GATE — no mandatory RT-1 synthesis; RT-1 consolidates findings only at end; no μ-check |

### 5.2 Implications for team composition

**`eradev.md:803-829` (FLUX RT Protocol) — the ONLY RIGOR_LEVEL-conditional composition statement.**

- `eradev.md:814`: "FLUX segments can have a **SINGLE agent** as voice-keeper (typically Builder). `Λ_role = 0` is PERMITTED when voice coherence is load-bearing. ... **Multi-Builder parallel work on a single voice-unit is FORBIDDEN under FLUX** (opposite of structured/strict where parallelism is encouraged)."
- `eradev.md:808`: "Visionary has MORE authority — creative intent is primary; Analyst's spec is loose."
- `eradev.md:817`: "Validator's role is ADVISORY: emits `[FLUX ADVISORY: findings]`, does not block commit. Coherent catches GENUINE incoherence (voice drift, glossary contradictions, narrative contradictions across segments) but ALLOWS legitimate divergence."
- `eradev.md:824` FLUX RT-1 row: "Visionary + Analyst + Builder assignment; **Validator + Coherent DELAYED to post-draft**" — i.e., RT-1 agent count drops from 5 to 3 for FLUX.

**`meta.md:354-365` μ-check modality branch:**
- strict → μ-check BLOCKING
- structured → μ-check BLOCKING with N/A-tolerance
- exploratory → μ-check ADVISORY
- emergent → μ-check N/A (Voice Guide may substitute Unified Plan)

### 5.3 What's explicit, what's absent

- **EXPLICIT:** FLUX (exploratory/emergent) → 3-agent RT-1 + single-Builder voice-unit forbidden from parallelism + Validator/Coherent advisory/delayed (`eradev.md:814,824`).
- **EXPLICIT:** Strict/structured → full 5-agent RT-1 + μ-check BLOCKING + N Builders allowed in parallel (default BIM pattern).
- **IMPLICIT (gap):** The core `eradev.md:933-938` Section X classification table (S/M/L/XL → 2/5/5-8/10+ agents) is RIGOR_LEVEL-AGNOSTIC. It does not say "adjust agent count for FLUX" — the FLUX override lives in Section VI.1 only. An operator reading Section X alone would apply strict/structured counts to an emergent task and over-provision.
- **IMPLICIT (gap):** `III.3.3` table `eradev.md:546-552` says RIGOR_LEVEL is "orthogonal" to task size. But the composition changes (3 vs 5 agents at RT-1) are size-like effects. No single table fuses `(size × RIGOR_LEVEL) → agent count`.

### 5.4 Verdict Dimension 5

- **FLUX composition rule:** CLEAR via Section VI.1 table.
- **Section X (S/M/L/XL) × RIGOR_LEVEL fusion:** IMPLICIT. The two axes are declared orthogonal but their composition effects are not unified in a single reference table.

---

## 6. Executive Summary

### 6.1 Rules that are CLEAR and EXPLICIT

1. **S = 2 agents (Builder + Validator).** `eradev.md:935`, `meta.md:181`, `CLAUDE.md:70,101-103`.
2. **M = 5 agents (full team).** `eradev.md:936`, `meta.md:182`, `CLAUDE.md:70,101-103`.
3. **Execution order within RT: Builder COMPLETES before Validator starts; never parallel.** `CLAUDE.md:80` Invariant 11, `eradev.md:794-795`.
4. **RT-1 = parallel 5; RT-3 = parallel 5; RT-2 = hybrid broadcast-then-parallel-then-resynthesis.** `eradev.md:788-793`.
5. **Coherent hierarchy L1/L2/L3 activation triggers.** `eradev.md:942-945`, `meta.md:167-173`: L1 always; L2 at 2+ teams; L3 at 5+ teams or phase-level.
6. **File Ownership + Cross-Builder Consistency Check + BL-29** for multi-Builder work. `eradev.md:947-952`, `meta.md:203-210`, `BOOTSTRAP_LESSONS.md:201-216`.
7. **FLUX (exploratory/emergent RIGOR_LEVEL) composition:** 3-agent RT-1 (V+A+B), single-Builder voice-unit, Validator/Coherent advisory/delayed. `eradev.md:814,824`, `meta.md:354-365`.
8. **Composition Hazards Gate (BL-34)** for plans with ≥2 parallel refactors — Visionary grid required before Unified Plan synthesis. `CLAUDE.md:84` Invariant 15, `eradev.md:749-765`, hook `rt1-composition-gate.sh`.
9. **Invariant 13 — parallelise independent agents; sequential only on real dependencies.** `CLAUDE.md:82`.
10. **Delegation absolute (BL-26).** META produces no code; every task spawns agents. `CLAUDE.md:70`, `BOOTSTRAP_LESSONS.md:183-188`, hook `enforce-delegation.sh`.

### 6.2 Rules that are IMPLICIT or AD-HOC

- **L row "5-8" and XL row "10+" roster internal breakdown** — `eradev.md:937-938`, `meta.md:183-184`. Range stated but no rule resolves 5 vs 8, and per-team per-role headcount is not explicitly stated.
- **When does a Builder get 1:1 Validator vs shared Validator?** — `eradev.md:796` says "Validators parallel" but never closes the count. Session 2026-04-24 ran 1:1 (Bundle A/B/C/D each with their own Validator report) — this is the de-facto pattern but it's not a rule.
- **Multi-Analyst parallel pattern** — Invariant 13 allows it by general principle, but no table says "2 Analysts at N_modules ≥ X" or "parallel research-Analyst + design-Analyst on L+ tasks." Session practice (4 parallel Analyst reports in one day) ran on implicit authorisation.
- **Domain skins (article/config/plan/research) carry concrete XL triggers for 2-Builder split** — `templates/domain_skin.article.md:314`, `domain_skin.config.md:321`, `domain_skin.plan.md:298`, `domain_skin.research.md:239`. These are DOMAIN-LOCAL and never surface to framework-core docs. A framework-level task (e.g., v10 Bundle A/B/C/D) has no skin to inherit from.
- **`N_teams = ceil(N_modules / 3)` → agent count** — implies N_builders-per-team = 1 (Section V minimum team is 5 but only 1 Builder per quintet), but framework never writes the derivation. Operator must re-derive each time.

### 6.3 Rules that are MISSING

- **(M1) Explicit per-role-per-task-size table** fusing S/M/L/XL × {Visionary, Analyst, Builder, Validator, Coherent} into a single matrix. Currently the counts are split across `eradev.md:933-940` (sizes + totals) + `eradev.md:942-945` (Coherent hierarchy) + `eradev.md:947-952` (multi-Builder file ownership) + domain skins (2-Builder exceptions). Operator has to reconstruct the matrix.
- **(M2) Upper bound on parallel Builders without L2 activation** — rule derivable from `N_teams = ceil(N_modules/3)` and Section VIII Coherent L2 at 2+ teams, but not stated explicitly: "≥2 Builders → activate L2 Coherent" is a latent rule. Session practice at 4 Builders ran without an explicit L2 Coherent (the RT-2 integration step was author-level).
- **(M3) RIGOR_LEVEL × task-size composition matrix** — Section X is rigor-agnostic; Section VI.1 (FLUX) gives the exploratory/emergent overrides but not the composed product. An operator handling an emergent XL task would need to compose Sections X + VI.1 manually.
- **(M4) "When to spawn 2 parallel Analysts" / "2 parallel Validators"** as a first-class scaling rule, not just by Invariant-13 generalisation. Session practice uses these routinely (design Analyst + research Analyst, per-Builder Validators) without a rule to cite.

---

## 7. Ranked Gaps (ordered by cost-of-inaction)

### 7.1 MUST-DO (blocks future operators — CRITICAL)

**Gap G1 — Explicit per-role-per-size matrix (fixes M1).** Operator asked exactly this question; the answer required reading 6+ files and reconstructing by inference. Ship a single table in `eradev.md` Section X (next to lines 933-945) shaped like:

| Size | V | A | B | Val | Coh-L1 | Coh-L2 | Coh-L3 |
|------|---|---|---|-----|--------|--------|--------|
| S | 0 | 0 | 1 | 1 | 0 | 0 | 0 |
| M | 1 | 1 | 1 | 1 | 1 | 0 | 0 |
| L | 1 | 1 | 1–2 | 1–2 | 1 | 1 (if N_teams ≥ 2) | 0 |
| XL | 1 | 1 | 2+ (=N_teams) | 2+ (=N_teams) | 1 per team | 1 (N_teams ≥ 2) | 1 (N_teams ≥ 5) |

One-liner caveat: per Invariant 13, independent parallel Analysts/Validators beyond the quintet baseline remain permissible — the table is the floor, not the ceiling. This fixes the operator's immediate pain point.

**Gap G2 — Parallel-role enumeration beyond Builders (fixes M4).** Add to `eradev.md:947-952` (near File Ownership) a short sub-section "Parallel per-role patterns" enumerating:
- 2+ parallel Builders → File Ownership + Cross-Builder Consistency (already present).
- 2+ parallel Validators → 1 per Builder is default; 1 shared Validator acceptable when all Builders produce a single-merge artifact.
- 2+ parallel Analysts → disjoint scopes (design vs research vs pre-flight); Coherent syncs at RT-1 synthesis.
- 2+ parallel Visionaries → FORBIDDEN (Visionary = single team-level Ô per paper §IV.1 / `eradev.md:412`). If domain inquiry needs two perspectives, they are Analysts, not Visionaries.
- 2+ parallel Coherents → only across L1/L2/L3 hierarchy; never two L1 Coherents on the same team.

### 7.2 SHOULD-DO (improves clarity)

**Gap G3 — Section X should cite Section VI.1 FLUX override (fixes M3).** One-line addition after `eradev.md:940`: "For exploratory/emergent RIGOR_LEVEL, see Section VI.1 FLUX RT Protocol — RT-1 composition drops from 5 to 3 and Validator/Coherent are delayed to post-draft." Currently Section X and Section VI.1 live independently; the operator must compose them manually.

**Gap G4 — Drift risk between `eradev.md:796` and `.claude/skills/eradev/reference/README_EN.md:148`.** Both sources copy the same RT Phase Protocols table. Any future edit must touch BOTH. Either (a) make the skill a symlink/include, or (b) add a pre-commit hook that greps both surfaces for the line "Execution L/XL" and fails on mismatch. Current approach relies on operator vigilance.

**Gap G5 — `L row "5-8"` range should name its endpoints.** `eradev.md:937` "5-8 (team + extra Builders)" should specify: 5 = single team (1 extra Builder merged back to default quintet); 6-7 = 2 Builders; 8 = 2 Builders + 2 Validators + L2 Coherent active. This removes the ambiguity about when L2 kicks in for L (vs XL-trigger).

### 7.3 COULD-DO (polish)

**Gap G6 — Move domain-skin 2-Builder exception triggers to a summary table** in `eradev.md` Section X or a new appendix. Right now they're scattered across 5 skins. A one-table reference lets META quickly pick "article >8000 words & >4 sections → 2 Builders" without loading the full skin.

**Gap G7 — Document upper bound on N_Builders before L3 Coherent.** Currently L3 activates at "5+ teams or phase-level" (`eradev.md:945`, `meta.md:171`). If teams average 3 modules each, 5 teams = 15 modules = ~15 Builders. State this ceiling explicitly so operators don't improvise at 10+ Builders without L3 activation.

---

## 8. Framework rules vs session practice (2026-04-24 Bundle A/B/C/D)

### 8.1 What we actually ran

Session 2026-04-24 ran the following parallel agents (from `reports/`):

- **4 parallel Builders:** Bundle A (math) `v10_bundleA_math_builder_2026-04-24.md`, Bundle B (protocol) `v10_bundleB_protocol_builder_2026-04-24.md`, Bundle C (discipline) `v10_bundleC_discipline_builder_2026-04-24.md`, Bundle D (unified integration) `v10_bundleD_unified_integration_2026-04-24.md`.
- **4 parallel Validators:** `v10_bundleA_validator_2026-04-24.md`, `v10_bundleB_validator_2026-04-24.md`, `v10_bundleC_validator_2026-04-24.md`, `v10_bundleD_validator_2026-04-24.md` (1:1 with Builders).
- **4 parallel Analyst reports (earlier phase):** `v10_conditional_bim_deep_research_2026-04-24.md`, `v10_parallel_trajectories_analysis_2026-04-24.md`, `v10_bim_creativity_tension_2026-04-24.md`, `v10_bim_planning_audit_2026-04-24.md`.

### 8.2 Rule-based authorisation check

| Observed pattern | Rule that authorises it | Authorisation strength |
|---|---|---|
| 4 parallel Builders on disjoint file scopes | Invariant 13 (parallelise independent) + File Ownership (`eradev.md:947-952`) + `N_teams = ceil(N_modules/3)` implied multi-Builder. | **IMPLICIT** — no rule states "4 parallel Builders on framework refactor with disjoint bundle scope = permitted." Inference from composition of three rules. |
| 4 parallel Validators (1:1 with Builders) | `eradev.md:796` "N Builders parallel → ... → Validators parallel" + Invariant 11 (no B/V overlap). | **IMPLICIT** — the "parallel" descriptor is there, but "1:1 mapping" is not stated. Default session interpretation. |
| 4 parallel Analyst research reports (earlier in day) | Invariant 13 general parallel-independence principle. | **WEAK** — framework has no explicit multi-Analyst table; authorisation is entirely by the independent-inquiry argument. |
| Cross-Bundle Coherent sync (`v10_bundleD_unified_integration_2026-04-24.md` acts as integrator) | `eradev.md:945` L2 Coherent at 2+ teams. With 4 parallel Builders = 4 teams, L2 should have been explicitly activated. | **PARTIAL** — L2 Coherent role was implicitly played by the Bundle D Unified Integration Builder; explicit L2 Coherent agent was not spawned. |
| No Composition Hazards Grid (`reports/composition-hazards-2026-04-24.md` does not exist) | Invariant 15 / BL-34 fires only when "≥2 independent refactors in one release window". | **BORDERLINE** — Bundle A + B + C + D were arguably ≥2 independent refactors, but they were framed as "additive layers of one coordinated release", not as independent refactors. Hook `rt1-composition-gate.sh` did not fire because no RT-1 doc had the trigger tokens. Question: does "Bundle A + B + C" count as 3 independent refactors or 1 coordinated Bundle? If independent → Invariant 15 violation. |

### 8.3 Verdict on session practice

The session ran 4B + 4V + 4A parallel pattern mostly on the **composition of Invariant 13 (parallelise) + File Ownership + `N_teams` scaling**, with no single rule pointing at the exact pattern. The framework permits the pattern but doesn't canonise it. Two concrete weaknesses emerged:

1. **No explicit L2 Coherent spawn** for the 4-team parallel work — the Bundle D integration agent implicitly played the L2 role. Should have been an explicit `[COHERENT]` agent per `eradev.md:945`. This is a mild enforcement gap.
2. **Composition Hazards Grid borderline case** — Bundle A (math F-formulas) + Bundle B (protocol + cross-layer contracts) + Bundle C (discipline habits) + Bundle D (unified integration) arguably met BL-34's "≥2 refactors" threshold, but the framing as a single coordinated release prevented the hook trigger. Retrospectively, should a Composition Hazards Grid have been authored? Probability: YES, per BL-34's literal spec. The session narrative of "one coordinated release" may have been the safety buffer that prevented hazards from materialising, but absence of the grid means we don't know that formally.

---

## 9. Final Verdict

### 9.1 Overall classification

**PARTIAL.** Core rules are explicit and enforced for the S/M case and for the known-pattern multi-Builder case; gaps appear at the L/XL scaling boundary, in RIGOR_LEVEL × size composition, and in multi-Analyst / multi-Validator patterns that session practice has been using ad-hoc.

### 9.2 Single-source-of-truth test

A hypothetical new operator asks "I have an L-sized task with 2 modules and it's structured RIGOR_LEVEL. How many of each role do I spawn?"

- **S/M answer:** operator can read `CLAUDE.md:70,101-103` → spawn 2 (S) or 5 (M). Done. CLEAR.
- **L answer:** operator must compose `eradev.md:937` ("5-8 team + extra Builders") + `eradev.md:940` (`N_teams = ceil(N_modules/3)` = ceil(2/3) = 1) + `eradev.md:942-945` (L1+L2 when 2+ teams — not applicable at 1 team) + `eradev.md:947-952` (File Ownership when 2+ Builders). Conclusion: 5 agents (1V + 1A + 1B + 1Val + 1Coh-L1) for 2-module L. But the framework's "5-8" range wording lets operator over-provision to 6-7 without rationale. PARTIAL.
- **L × FLUX answer:** operator must compose the above with `eradev.md:819-829` FLUX table (RT-1 drops to 3 agents: V+A+B) + `meta.md:354-365` (μ-check advisory). No single table fuses L × FLUX. IMPLICIT.

### 9.3 Lambda assessment (BL-33 tier ladder)

Applied to the composition-rule surface:

- **T1 type-level:** None. Composition rules are not schema-enforced. Graph schema at `templates/rt_graph.schema.md` is a declarative inventory, not a validator.
- **T2 automated check:** Two hooks (`rt1-composition-gate.sh` for BL-34, `agent-role-tag.sh` for Invariant 9 + BL-28). Neither enforces counts-per-size; they enforce grid-presence and role-tag-presence.
- **T3 checklist:** Session Entry checklist `meta.md:277-337` has item 4 "CLASSIFIED: Task size is ___ (S/M/L/XL). Min agents: ___." — operator fills the blank, checklist does not auto-validate against a composition matrix.
- **T4 .md:** Everything else — `eradev.md` Section X, Section VI, Section VI.1; `meta.md` §§8, 9, 14.

Composition rules mostly live at T4 + T3 (checklist). This is acceptable for the stable S/M case (`CLAUDE.md` KILL-TEST is blocking rhetoric that behaves like T3) but is fragile for L/XL/RIGOR_LEVEL-conditional cases where the matrix is reconstructed each session.

---

## 10. B-check (B_text modality, read-only audit)

- **F (Focus):** 0.93 — read all primary sources (`eradev.md`, `meta.md`, `CLAUDE.md`, `BOOTSTRAP_LESSONS.md` BL-26/28/29/33/34/35, `templates/unified_plan.md.template`, `templates/rt_graph.schema.md`, all 4 relevant hooks, 6 domain skins for Builder-split patterns, role files). 0.07 deduction for not reading every 2026-04-24 session report end-to-end — summarised via grep-scan inventory.
- **E (Alignment):** 0.95 — deliverable answers the operator's literal question: "how many of each role, when, why, is it clear?" with file:line citations, session-practice comparison, and ranked gaps including MUST-DO Gap G1 (the per-role matrix operator implicitly requested). 0.05 deduction for inevitable interpretation of "MUST-DO" priority.
- **1-σ (Consistency):** 0.95 — no internal contradictions; all quoted text matches source files. Numerical claims (e.g., `N_teams = ceil(N_modules/3)`) reproduced verbatim. 0.05 buffer for possible drift between skill-mirror copies (`.claude/skills/eradev/reference/README_EN.md:148`) and core (flagged in Gap G4).
- **Λ (Experience):** 0.90 — applied BL-26 delegation, BL-28 prompt context, BL-29 terminology drift, BL-33 tier ladder, BL-34 composition hazards, BL-35 rework discipline as the interpretive lenses. Cross-references gravity-session Hansei (source of BL-29 and `meta.md:210` Cross-Builder Consistency Check). 0.10 deduction for not tracing every v9/v10 RT-* report that might contain earlier composition-rule proposals.

**B = F · E · (1-σ) · Λ = 0.93 · 0.95 · 0.95 · 0.90 ≈ 0.755 — GREEN.**

No component < 0.3; no ANDON trigger.

---

*Report authored by [ANALYST] under META's direct request (Invariant 14). Scope: read-only framework audit, no file edits, file:line citations throughout. B_text modality (code/framework-artifact), strict RIGOR_LEVEL. 2026-04-24.*
