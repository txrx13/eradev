# How to Create a New Project in EraDev

> **NOTE:** Project instances live at `<host-repo>/projects/{name}/`, NOT here.
> This directory contains seed templates and per-project documentation only.
> Each instance's `config.md` and `lessons.md` are tracked in the host repo's
> `projects/{name}/` directory, not in this framework subrepo.

## 1. Project Directory Structure

Create a directory `projects/<project-name>/` with the following structure:

```
projects/<project-name>/
  MEMORY.md            # Project memory (from MEMORY_TEMPLATE.md)
  spiral_log.md        # Spiral memory: Meta-Agent iterations
  config.md            # Stack, ports, nodes, project specifics
  checklists/
    pre-commit.md      # Pre-commit checklist (from CHECKLIST.md, adapt)
    pre-deploy.md      # Pre-deploy checklist (adapt to infrastructure)
    security.md        # Security baseline (from CHECKLIST.md, extend)
  a3/                  # Directory for A3 templates (postmortem)
  roles/               # Role overrides, if needed (optional)
```

---

## 2. Initializing MEMORY.md

1. Copy `eradev/MEMORY_TEMPLATE.md` to `projects/<project-name>/MEMORY.md`.
2. Fill in the "Iron Rules" section -- minimum 5, maximum 10.
3. Leave the "Patterns" and "Metrics" sections empty -- they are populated during the process.
4. Record the first entry in the Decision Log: "Project initialization."

---

## 3. Initializing spiral_log.md

Format: each iteration has a heading + date, task, result, new patterns, metrics.
Iteration 0 = "Initialization." Each subsequent one is appended at the END. Previous entries are not edited.

```markdown
## Iteration 0 -- Initialization
- **Date**: YYYY-MM-DD
- **Result**: Structure created
- **Metrics**: B=N/A, S_team=N/A
```

---

## 4. Filling in config.md

Move ALL project-specific details here. Role prompts MUST NOT contain:
- Project name (hardcoded)
- IP addresses and ports
- Technology stack (Go/TS/Rust/Python)
- Paths to project files

config.md format: name, stack, repository, nodes/ports (if applicable), specifics.

---

## 5. Transferring Patterns from the Core

The EraDev core contains universal patterns (eradev/CHECKLIST.md).
For the project:

1. Copy relevant sections from `eradev/CHECKLIST.md` to `checklists/`.
2. Adapt to the stack: replace generic items with specific commands.
3. Add project-specific items (ports, endpoints, DNS).
4. In MEMORY.md, reference checklists: "see checklists/pre-deploy.md."

Do not duplicate checklists in multiple places. Single source of truth.

## 6. Adapting Roles

By default, the 5 roles from the EraDev core are used. For adaptation:

**Small project (1 person + AI):**
- S-tasks: Builder + Validator (2 agents).
- M-tasks: all 5 roles.

**Medium project (team):**
- Standard 5 roles. If needed -- add a DevOps role.

**Large project (multiple teams):**
- Coherent hierarchy: L1 (within team), L2 (between teams).
- Builder specialization: Frontend Builder, Backend Builder, Infra Builder.

If a role is overridden -- create a file in `projects/<project-name>/roles/`.
Format: brief prompt (up to 150 lines), no duplication of the core.

---

## 7. Project Readiness Checklist

Before starting work, verify:

- [ ] `MEMORY.md` created and contains at least 5 iron rules
- [ ] `spiral_log.md` created with iteration 0
- [ ] `config.md` filled in (stack, repo, specifics)
- [ ] `checklists/` contains adapted checklists
- [ ] `a3/` directory created (empty)
- [ ] Role prompts DO NOT contain hardcoded project details
- [ ] Decision Log contains an initialization entry
