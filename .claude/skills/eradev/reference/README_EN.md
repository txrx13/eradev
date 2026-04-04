# EraDev v7.1

## What is EraDev

EraDev is a multi-agent development framework based on ODTOE (Observer-Dependent Theory of Everything) and Toyota Production System principles. Five specialized roles (Visionary, Analyst, Builder, Validator, Coherencer) work in parallel through the Round Table protocol, ensuring collective coherence above the individual level. Each agent's quality is measured by the formula B = F * E * (1-sigma) * Lambda, where zeroing any component zeroes the entire result.

---

## Bootstrap -- Starting Prompt for Agent

### Universal (no project)

```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code, edit files, or run commands directly.
Your ONLY tool for work is the Agent tool — you spawn and coordinate role-agents.

LOAD (read these files first):
1. eradev/eradev.md — core framework
2. eradev/meta.md — your operating protocol
3. eradev/BOOTSTRAP_LESSONS.md — cold-start Lambda

THEN: Classify the task (S/M/L/XL per Section X).
THEN: For M+ tasks, launch RT-1 — spawn 5 parallel Agent calls:
  Visionary, Analyst, Builder, Validator, Coherencer.
  Each Agent gets: its role file + project config + the task.

INVARIANT: You MUST NOT skip RT-1 and jump to implementation.
FAILURE MODE: Reading the framework, acknowledging it, then ignoring it
and acting as solo Builder. This is the Lambda problem (knowledge ≠ application).

Task: [task description]
```

### With project context

```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code, edit files, or run commands directly.
Your ONLY tool for work is the Agent tool.

LOAD:
1. eradev/eradev.md — core framework
2. eradev/meta.md — your operating protocol
3. eradev/projects/{project}/config.md — project specifics
4. eradev/projects/{project}/lessons.md — project memory
5. eradev/BOOTSTRAP_LESSONS.md — cold-start Lambda

THEN: Classify (S/M/L/XL). For M+: launch RT-1 with 5 roles via Agent tool.
INVARIANT: No implementation before RT-1. No solo Builder work for M+ tasks.

Task: [task description]
```

### Examples for existing projects

**Academic Lab** (decentralized web3 platform, 7 nodes, Go/Next.js/Erachain):
```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code, edit files, or run commands directly.
Your ONLY tool for work is the Agent tool.

LOAD:
1. eradev/eradev.md
2. eradev/meta.md
3. eradev/projects/academic-lab/config.md
4. eradev/projects/academic-lab/lessons.md
5. eradev/BOOTSTRAP_LESSONS.md

Classify → RT-1 (5 roles) → Build (delegated) → RT-2 → RT-3.

Task: [task description]
```

**ODTOE Articles** (scientific articles, LaTeX, 50-digit precision):
```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code or edit files directly. Use Agent tool only.

LOAD:
1. eradev/eradev.md
2. eradev/meta.md
3. eradev/projects/odtoe-articles/config.md
4. eradev/projects/odtoe-articles/lessons.md
5. eradev/BOOTSTRAP_LESSONS.md

Classify → RT-1 (5 roles) → Build (delegated) → RT-2 → RT-3.

Task: [task description]
```

---

## File Structure

```
eradev/
├── README.md                    # Entry point (RU)
├── README_EN.md                 # Entry point (EN) -- this file
├── LOADING_PROTOCOL.md          # Agent file loading sequence
├── BOOTSTRAP_LESSONS.md         # 15 cold-start lessons (Lambda bootstrap)
├── eradev.md                    # Core constitution (EN): ODTOE, TPS, Round Table, formulas
├── eradev_RU.md                 # Core constitution (RU)
├── glossary.md                  # Bilingual glossary ODTOE -> EraDev (44 terms)
├── glossary_EN.md               # Glossary (EN, 44 terms)
├── interfaces.md                # Role Interface Contracts (5 handoff schemas)
├── visionary.md / _EN.md        # Role: Visionary
├── analyst.md / _EN.md          # Role: Analyst
├── builder.md / _EN.md          # Role: Builder
├── validator.md / _EN.md        # Role: Validator
├── coherent.md / _EN.md         # Role: Coherencer
├── meta.md / meta_RU.md         # Meta-Agent: spiral memory, self-modification
├── CHECKLIST.md / _EN.md        # Universal verification checklist
├── MEMORY_TEMPLATE.md / _EN.md  # Project memory template
├── projects/
│   ├── README.md / _EN.md       # Project structure description
│   ├── academic-lab/            # Web3 platform project
│   │   ├── config.md
│   │   └── lessons.md
│   └── odtoe-articles/          # Scientific articles project
│       ├── config.md
│       └── lessons.md
└── reports/                     # Round Table analytical reports
```

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

### 5. Development Cycle

```
RT-1 (expansion) -> Build (compression) -> RT-2 (expansion) -> Build (compression) -> RT-3 (fixation)
```

Golden ratio proportion: Round Table ~38%, Build ~62%.

### 6. Cycle Completion (RT-3)
- Fill A3 crystallization template
- Record 3-5 key distinctions
- Update project lessons.md
- Leave spiral gap ~2% -- open questions for next iteration

---

## Core File References

| File | Purpose |
|------|---------|
| `eradev.md` | Framework constitution: ODTOE, TPS, Round Table, formulas, protocols |
| `visionary.md` / `_EN.md` | Visionary: strategy, True North, Zone Detection |
| `analyst.md` / `_EN.md` | Analyst: decomposition, File Ownership, pipeline |
| `builder.md` / `_EN.md` | Builder: implementation, Security Checklist, patterns |
| `validator.md` / `_EN.md` | Validator: verification, feedback, dissonance scale |
| `coherent.md` / `_EN.md` | Coherencer: synchronization, L1/L2/L3, Kill-Switch |
| `meta.md` / `meta_RU.md` | Meta-Agent: spiral memory, Prediction Delta, self-modification |
| `glossary.md` | Bilingual glossary (44 terms, canonical forms) |
| `interfaces.md` | Role Interface Contracts (5 handoff schemas with YAML) |
| `LOADING_PROTOCOL.md` | Agent loading sequence (4 steps, 400-line budget) |
| `BOOTSTRAP_LESSONS.md` | 15 cold-start lessons for Lambda bootstrap |

---

## Principles

- **Multiplicativity**: B = F * E * (1-sigma) * Lambda. Zero in any component = zero output.
- **Andon**: right and obligation to stop upon discovering a problem.
- **Hansei**: reflect on process, not result. Not "code is bad" but "why did the process produce bad code."
- **Yokoten**: lesson from one incident generalized to all analogous cases.
- **Spiral gap**: each cycle leaves ~2% openness that feeds the next iteration.

---

*EraDev v7.1 | 2026-04-02*
