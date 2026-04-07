# EraDev v7.1 + v8 META-Orchestration

## What is EraDev

EraDev is a multi-agent development framework based on ODTOE (Observer-Dependent Theory of Everything) and Toyota Production System principles. Five specialized roles (Visionary, Analyst, Builder, Validator, Coherencer) work through the Round Table protocol, ensuring collective coherence above the individual level.

**v8 additions:**

- **3-layer enforcement:** CLAUDE.md (auto-bootstrap) + PreToolUse hook (blocks direct Edit/Write from META) + memory persistence (identity survives across sessions)
- **5 output types:** Agent calls, Decisions, Synthesis, Lessons, Reports. Anything else = VIOLATION.
- **Report Funnel:** Builder (full artifact) -> Validator (Structured Verdict, 7 lines) -> Coherencer (Cycle Brief, 10 lines) -> META. Each level compresses; META never reads raw output.

Each agent's quality is measured by `B = F * E * (1-sigma) * Lambda` -- zeroing any component zeroes the entire result.

---

## Bootstrap

### Automatic (CLAUDE.md -- already deployed)

When CLAUDE.md exists at project root, Claude Code loads it automatically at session start. No manual prompt needed.

CLAUDE.md enforces: META identity, 5-step loading sequence, session entry checklist, invariants, KILL-TEST, language stack detection.

### For New Projects (DEPLOY_PROMPT.md)

Paste `templates/DEPLOY_PROMPT.md` into a new Claude Code session at the project root. It executes 8 steps:

1. **Clone/pull** EraDev into `eradev/`
2. **AGENTS.md** -- universal entry point (Codex, Jules, Cursor, Windsurf, Aider)
3. **CLAUDE.md** -- copy from template, adapt paths
4. **.cursorrules** -- copy AGENTS.md for Cursor
5. **Enforcement hooks** -- `.claude/hooks/` + `settings.json` + `.windsurf/hooks.json`
6. **Project skeleton** -- `projects/{name}/config.md` + `lessons.md`
7. **Memory persistence** -- META identity + LOAD sequence written to MEMORY.md
8. **Confirmation** -- checklist output

### Manual Prompt (universal, no automation)

```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code, edit files, or run commands directly.
Your ONLY tool for work is the Agent tool -- you spawn and coordinate role-agents.

5 OUTPUT TYPES (nothing else):
  Agent calls | Decisions | Synthesis | Lessons | Reports
KILL-TEST: first action MUST be Agent call. edit/write/code = VIOLATION.
PERSIST: verify META identity in MEMORY.md at session start.

LOAD (read these files first):
1. eradev/eradev.md -- core framework
2. eradev/meta.md -- your operating protocol
3. eradev/BOOTSTRAP_LESSONS.md -- cold-start Lambda

THEN: Classify the task (S/M/L/XL per Section X).
THEN: For M+ tasks, launch RT-1 -- spawn 5 parallel Agent calls:
  Visionary, Analyst, Builder, Validator, Coherencer.

INVARIANT: You MUST NOT skip RT-1 and jump to implementation.
FAILURE MODE: Reading the framework, acknowledging it, then ignoring it
and acting as solo Builder. This is the Lambda problem (knowledge != application).

Task: [task description]
```

### With Project Context

Append to manual prompt before the Task line:

```
4. eradev/projects/{project}/config.md -- project specifics
5. eradev/projects/{project}/lessons.md -- project memory
```

---

## File Structure

```
eradev/
├── README.md                    # Entry point (RU)
├── README_EN.md                 # Entry point (EN) -- this file
├── CLAUDE.md                    # Auto-bootstrap for Claude Code sessions
├── LOADING_PROTOCOL.md          # Agent file loading sequence
├── BOOTSTRAP_LESSONS.md         # 30 cold-start lessons (BL-1..BL-32, gaps at 23/27)
├── eradev.md                    # Core constitution (EN): ODTOE, TPS, Round Table
├── eradev_RU.md                 # Core constitution (RU)
├── glossary.md                  # Bilingual glossary (44 terms)
├── glossary_EN.md               # Glossary (EN)
├── interfaces.md                # Role Interface Contracts (5 handoff schemas)
├── visionary.md / _EN.md        # Role: Visionary
├── analyst.md / _EN.md          # Role: Analyst
├── builder.md / _EN.md          # Role: Builder
├── validator.md / _EN.md        # Role: Validator
├── coherent.md / _EN.md         # Role: Coherencer
├── meta.md / meta_RU.md         # Meta-Agent: spiral memory, self-modification
├── CHECKLIST.md / _EN.md        # Universal verification checklist
├── MEMORY_TEMPLATE.md / _EN.md  # Project memory template
├── .claude/
│   ├── hooks/enforce-delegation.sh  # PreToolUse hook (blocks META from Edit/Write)
│   └── settings.json                # Hook wiring config
├── templates/
│   ├── CLAUDE.md.template       # CLAUDE.md template for new projects
│   ├── CLAUDE.md.universal      # Universal variant (no project paths)
│   └── DEPLOY_PROMPT.md         # 8-step deploy prompt for new projects
├── reports/
│   ├── HANSEI_TEMPLATE.md       # Structured Hansei reflection template
│   └── *.md                     # Round Table and analytical reports
└── projects/
    ├── README.md / _EN.md       # Project structure description
    ├── {name}/                  # External projects (config.md + lessons.md)
    └── eradev/                  # EraDev self-improvement project
```

---

## 3-Layer Enforcement

| Layer | Mechanism | What it does |
|-------|-----------|--------------|
| **CLAUDE.md** | Auto-loaded by Claude Code at session start | Installs META identity, loading sequence, invariants, KILL-TEST |
| **PreToolUse hook** | `.claude/hooks/enforce-delegation.sh` | Blocks Edit/Write calls from main session (non-agent). Forces delegation. |
| **Memory persistence** | MEMORY.md entries | META identity + LOAD sequence survive across sessions. Checked at each start. |

Without all three layers, META drifts back to solo Builder behavior within 2-3 tasks (BL-16: knowledge without enforcement = Lambda zero).

---

## Update EraDev in Existing Project

Paste this prompt into your active project session:

```
Update eradev instructions:
1. cd eradev && git pull origin main && cd ..
2. Sync hooks: cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
3. Sync settings: cp eradev/.claude/settings.json .claude/settings.json
4. Read eradev/CLAUDE.md — verify 6 output types and 10 invariants
5. Read eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md
6. Read eradev/projects/{PROJECT}/config.md and lessons.md
7. Output SESSION BOOTSTRAP checklist from meta.md Section 14 (12 items)
8. Save META identity (6 output types + Bash classification) to memory

Continue with current tasks.
```

Replace `{PROJECT}` with your project name.

---

## Quick Start (for humans)

### 1. Project Initialization
Create `projects/{name}/config.md` with: technology stack, True North, known constraints.

### 2. Define True North
Not a goal but a direction. Formulate as the ideal state the project strives toward.

### 3. Launch Round Table (RT-1)
All five roles receive the same task simultaneously. Each agent runs the Activation Operator:
1. **A_F (Focus)** -- load relevant files
2. **A_E (Alignment)** -- verify task against IFR
3. **A_sigma (Consistency)** -- check for conflicts
4. **A_Lambda (Experience)** -- read project memory

### 4. Task Classification

| Size | Criteria | Teams | Agents |
|------|----------|-------|--------|
| S | <=3 files, 1 module | 1 | 2 (Builder + Validator) |
| M | 1 module, multiple files | 1 | 5 (full quintet) |
| L | 2-3 modules | ceil(N_modules/3) | 5 * N_teams |
| XL | 4+ modules | ceil(N_modules/3) | 5 * N_teams + L2/L3 Coherencers |

### 5. RT Phase Protocols

| Phase | Model | Protocol |
|-------|-------|----------|
| **RT-1** (understanding) | Parallel 5 | All agents receive raw task simultaneously. No agent sees another's output. META synthesizes. |
| **RT-2** (correction) | Hybrid | Coherencer broadcasts RT-1 synthesis -> 4 roles assess in parallel -> re-synthesis. |
| **RT-3** (acceptance) | Parallel 5 | Independent go/no-go from each role. No groupthink. META counts verdicts. |
| **Execution M** | Sequential pairs | Builder -> Validator -> iterate. |
| **Execution L/XL** | Parallel + gate | N Builders parallel -> Coherencer cross-check -> Validators parallel. |

### 6. Development Cycle

```
RT-1 (expansion) -> Build (compression) -> RT-2 (expansion) -> Build (compression) -> RT-3 (fixation)
```

Golden ratio proportion: Round Table ~38%, Build ~62%.

### 7. Cycle Completion (RT-3)
- Fill A3 crystallization template
- Record 3-5 key distinctions
- Update project lessons.md
- Leave spiral gap ~2% -- open questions for next iteration

---

## Core File References

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Auto-bootstrap: META identity, loading sequence, invariants, KILL-TEST |
| `eradev.md` | Framework constitution: ODTOE, TPS, Round Table, formulas, protocols |
| `meta.md` | Meta-Agent protocol: Sec 1a (Output Spec), Sec 15 (I/O Protocol), Sec 16 (Reflection Triggers) |
| `visionary.md` | Visionary: strategy, True North, Zone Detection |
| `analyst.md` | Analyst: decomposition, File Ownership, pipeline |
| `builder.md` | Builder: implementation, Security Checklist, patterns |
| `validator.md` | Validator: verification, feedback, dissonance scale |
| `coherent.md` | Coherencer: synchronization, L1/L2/L3, Kill-Switch |
| `glossary.md` | Bilingual glossary (44 terms, canonical forms) |
| `interfaces.md` | Role Interface Contracts (5 handoff schemas with YAML) |
| `LOADING_PROTOCOL.md` | Agent loading sequence (4 steps, 400-line budget) |
| `BOOTSTRAP_LESSONS.md` | 30 cold-start lessons (BL-1..BL-32) for Lambda bootstrap |
| `templates/DEPLOY_PROMPT.md` | 8-step deploy prompt for new projects |
| `reports/HANSEI_TEMPLATE.md` | Structured Hansei reflection template |

---

## Principles

- **Multiplicativity**: B = F * E * (1-sigma) * Lambda. Zero in any component = zero output.
- **Andon**: right and obligation to stop upon discovering a problem.
- **Hansei**: reflect on process, not result. Not "code is bad" but "why did the process produce bad code."
- **Yokoten**: lesson from one incident generalized to all analogous cases.
- **Spiral gap**: each cycle leaves ~2% openness that feeds the next iteration.

---

*EraDev v7.1 + v8 META-Orchestration | 2026-04-07*
