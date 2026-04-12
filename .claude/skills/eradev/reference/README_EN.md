# EraDev v9 — META-Orchestration

## What is EraDev

EraDev is a multi-agent development framework based on ODTOE (Observer-Dependent Theory of Everything) and Toyota Production System principles. Five specialized roles (Visionary, Analyst, Builder, Validator, Coherencer) work through the Round Table protocol, ensuring collective coherence above the individual level.

**v9 essentials:**

- **3-layer enforcement:** CLAUDE.md (auto-bootstrap) + PreToolUse hook (blocks direct Edit/Write from META) + memory persistence (identity survives across sessions)
- **4-layer architecture (v9):** L0 IMMUTABLE (ODTOE core) / L1 Universal roles / L2 Domain skins / L3 Project instances
- **6 output types:** Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent. Anything else = VIOLATION.
- **Report Funnel:** Builder (full artifact) -> Validator (Structured Verdict, 7 lines) -> Coherencer (Cycle Brief, 10 lines) -> META. Each level compresses; META never reads raw output.

Each agent's quality is measured by `B = F * E * (1-sigma) * Lambda` -- zeroing any component zeroes the entire result.

---

## Quick Start by Agent

| Agent | Guide | Hooks | Config file |
|-------|-------|-------|------------|
| **Claude Code** | [docs/setup-claude.md](docs/setup-claude.md) | Full (Edit/Write/Bash block) | `CLAUDE.md` |
| **Cursor** | [docs/setup-cursor.md](docs/setup-cursor.md) | Text-only | `.cursorrules` |
| **Codex / Jules** | [docs/setup-codex.md](docs/setup-codex.md) | Text-only | `AGENTS.md` |
| **Windsurf** | [docs/setup-windsurf.md](docs/setup-windsurf.md) | Hooks support | `.windsurfrules` |

**Universal prompt** (for any agent without specific setup):

```
You are the META-ORCHESTRATOR (EraDev Level 9).
You ALWAYS delegate ALL work via agent calls.

6 OUTPUT TYPES: Agent calls | Decisions | Synthesis | Lessons | Reports | Check Agent

LOAD: eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md,
      eradev/projects/{PROJECT}/config.md, eradev/projects/{PROJECT}/lessons.md

RULES: S-tasks = Builder+Validator. M+ = 5-role RT-1. Bash: operational direct, diagnostic delegate.
KILL-TEST: first action = agent call.

Task: [task description]
```

Detailed instructions in guides above. For new project deploy: `docs/setup-{agent}.md` guides.

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
├── roles/
│   ├── visionary.md / _EN.md    # Role: Visionary
│   ├── analyst.md / _EN.md      # Role: Analyst
│   ├── builder.md / _EN.md      # Role: Builder
│   ├── validator.md / _EN.md    # Role: Validator
│   └── coherent.md / _EN.md     # Role: Coherencer
├── meta.md / meta_RU.md         # Meta-Agent: spiral memory, self-modification
├── CHECKLIST.md / _EN.md        # Universal verification checklist
├── MEMORY_TEMPLATE.md / _EN.md  # Project memory template
├── .claude/
│   ├── hooks/enforce-delegation.sh  # PreToolUse hook (blocks META from Edit/Write)
│   └── settings.json                # Hook wiring config
├── docs/
│   ├── setup-claude.md          # Claude Code setup guide
│   ├── setup-cursor.md          # Cursor setup guide
│   ├── setup-codex.md           # Codex/Jules setup guide
│   └── setup-windsurf.md        # Windsurf setup guide
├── templates/
│   ├── CLAUDE.md.template       # CLAUDE.md template for new projects
│   ├── CLAUDE.md.universal      # Universal variant (no project paths)
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
| `roles/visionary.md` | Visionary: strategy, True North, Zone Detection |
| `roles/analyst.md` | Analyst: decomposition, File Ownership, pipeline |
| `roles/builder.md` | Builder: implementation, Security Checklist, patterns |
| `roles/validator.md` | Validator: verification, feedback, dissonance scale |
| `roles/coherent.md` | Coherencer: synchronization, L1/L2/L3, Kill-Switch |
| `glossary.md` | Bilingual glossary (44 terms, canonical forms) |
| `interfaces.md` | Role Interface Contracts (5 handoff schemas with YAML) |
| `LOADING_PROTOCOL.md` | Agent loading sequence (4 steps, 400-line budget) |
| `BOOTSTRAP_LESSONS.md` | 30 cold-start lessons (BL-1..BL-32) for Lambda bootstrap |
| `reports/HANSEI_TEMPLATE.md` | Structured Hansei reflection template |

---

## Principles

- **Multiplicativity**: B = F * E * (1-sigma) * Lambda. Zero in any component = zero output.
- **Andon**: right and obligation to stop upon discovering a problem.
- **Hansei**: reflect on process, not result. Not "code is bad" but "why did the process produce bad code."
- **Yokoten**: lesson from one incident generalized to all analogous cases.
- **Spiral gap**: each cycle leaves ~2% openness that feeds the next iteration.

---

*EraDev v9 | 2026-04-11*
