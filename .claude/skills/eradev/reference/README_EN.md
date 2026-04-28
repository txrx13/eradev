# EraDev v10 — META-Orchestration

## What is EraDev

EraDev is a framework for multi-agent development of text-discrete artifacts (code, scientific articles, books, plans, research, configs), synthesizing **12 theoretical foundations**:

- **Core**: ODTOE (Observer-Dependent Theory of Everything, by A. Pankratov) for coherence math (B, S_team, P_coll, Ω); Toyota Production System for operational discipline (Jidoka, Andon, Hansei, Yokoten, A3, Kaizen, Coaching Kata); Theory of Constraints (Goldratt) for bottleneck protocols; TRIZ + IFR (Altshuller) for framing tasks via contradiction resolution.
- **Mathematical substrate**: KAM theorem (Kolmogorov-Arnold-Moser) grounds `R/r = φ` as the most stable toroidal orbit; Hurwitz theorem grounds `n_min = ⌈π⌉+1 = 5` as an invariant; Hofstadter's strange loop grounds L9 self-modification via `Ψ* = Φ(Ψ*)`.
- **Multi-agent inspirations**: MetaGPT and Google's PaperOrchestra (5-role decomposition — independent convergence on the same attractor); AutoAgent (EMP7 "optimization without orientation is hill-climbing into fog"); MemPalace (memory hierarchy Wings/Rooms/Closets/Drawers -> T1/T2/T3); ECC (background instinct extraction via CronCreate); LangGraph (declarative RT schema; engine deferred to v11).

A META-Orchestrator (Level 9) coordinates five specialized roles (Visionary, Analyst, Builder, Validator, Coherent) through the Round Table protocol. The Universality Gate (v10) mechanically enforces the split: the framework stays universal, project specifics live in `projects/{PROJECT}/`.

See [FOUNDATIONS.md](./FOUNDATIONS.md) for the full genealogy of sources, named contributors, and methodological borrows.

**v10 key properties:**

- **3-layer runtime enforcement:** CLAUDE.md (auto-bootstrap) + PreToolUse hook (blocks direct Edit/Write from META) + memory persistence (identity survives across sessions)
- **4-layer file architecture (v9):** L0 IMMUTABLE (ODTOE core) / L1 Universal roles / L2 Domain skins / L3 Project instances
- **6 output types:** Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent. Anything else = VIOLATION.
- **17 invariants** tagged [UNIVERSAL] / [CODE-ADAPTER] for cross-domain adaptation (#17 — τ_cycle primacy, ODTOE_parallel_trajectories F3).
- **6-step loading sequence:** eradev.md, meta.md, BOOTSTRAP_LESSONS.md, config.md, lessons.md + conditional step 6 (domain skin).
- **13-item session bootstrap** including 5b DOMAIN (modal B-formula selection).
- **Domain skins (v9):** 6 domain types: code, article, book, config, plan, research. Each with its own B-modality and verification method.
- **Self-loading agents (v9):** Invariant 12: agents self-load their role file, META does not embed content.
- **v10 features:** Omega(H_hist) computation (cross-project Lambda amplification), temporal decay (freshness model), BL compression (auto-cleanup candidates), Apophatic Gate (pre-RT-1 checkpoint), /extract skill.
- **Report Funnel:** Builder (full artifact) -> Validator (Structured Verdict, 7 lines) -> Coherent (Cycle Brief, 10 lines) -> META. Each level compresses; META never reads raw output.

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

LOAD (6 steps):
1. eradev/eradev.md  2. eradev/meta.md  3. eradev/BOOTSTRAP_LESSONS.md
4. projects/{PROJECT}/config.md  5. projects/{PROJECT}/lessons.md
6. IF domain.skin set: eradev/templates/domain_skin.{type}.md

RULES: S-tasks = Builder+Validator. M+ = 5-role RT-1. 17 invariants ([UNIVERSAL]/[CODE-ADAPTER]).
       Bash: operational direct, diagnostic delegate. Session bootstrap: 13 items (incl. 5b DOMAIN).
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
│   └── coherent.md / _EN.md     # Role: Coherent
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

## 3-Layer Runtime Enforcement

| Layer | Mechanism | What it does |
|-------|-----------|--------------|
| **CLAUDE.md** | Auto-loaded by Claude Code at session start | Installs META identity, loading sequence, invariants, KILL-TEST |
| **PreToolUse hook** | `.claude/hooks/enforce-delegation.sh` | Blocks Edit/Write calls from main session (non-agent). Forces delegation. |
| **Memory persistence** | MEMORY.md entries | META identity + LOAD sequence survive across sessions. Checked at each start. |

**4-layer file architecture (v9):** L0 IMMUTABLE (ODTOE core) / L1 Universal roles / L2 Domain skins / L3 Project instances -- a separate concept from runtime enforcement.

Without all three runtime layers, META drifts back to solo Builder behavior within 2-3 tasks (BL-16: knowledge without enforcement = Lambda zero).

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
| XL | 4+ modules | ceil(N_modules/3) | 5 * N_teams + L2/L3 Coherents |

### 5. RT Phase Protocols

| Phase | Model | Protocol |
|-------|-------|----------|
| **RT-1** (understanding) | Parallel 5 | All agents receive raw task simultaneously. No agent sees another's output. META synthesizes. |
| **RT-2** (correction) | Hybrid | Coherent broadcasts RT-1 synthesis -> 4 roles assess in parallel -> re-synthesis. |
| **RT-3** (acceptance) | Parallel 5 | Independent go/no-go from each role. No groupthink. META counts verdicts. |
| **Execution M** | Sequential pairs | Builder -> Validator -> iterate. |
| **Execution L/XL** | Parallel + gate | N Builders parallel -> Coherent cross-check -> Validators parallel. |

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
| `roles/coherent.md` | Coherent: synchronization, L1/L2/L3, Kill-Switch |
| `glossary.md` | Bilingual glossary (44 terms, canonical forms) |
| `interfaces.md` | Role Interface Contracts (5 handoff schemas with YAML) |
| `LOADING_PROTOCOL.md` | Agent loading sequence (META 6-step + role 4-step) |
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

*EraDev v10 | 2026-04-12*
