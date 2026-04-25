# Agent Loading Protocol

> Defines the order and budget for loading EraDev files into agent context.
> Derived from A/B experiment (EN-Analyst proposal, RT-5).

---

## Motivation

An agent that loads the entire framework (~1700 lines) wastes context and violates Muri (overload). An agent that loads nothing works blind (F=0, therefore B=0). The Loading Protocol resolves this contradiction by defining a minimal, ordered sequence that maximizes B within a fixed context budget.

---

## Loading Sequence

### Step 1: Core -- `eradev.md` (~250 lines)

The universal constitution. Loads ODTOE formulas, TPS principles, Round Table protocol, Activation Operator, Andon, Jidoka Self-Check, role definitions, task classification, and the file map.

**Every agent loads this file. No exceptions.**

### Step 2: Role Prompt -- `roles/{role}.md` (~70 lines)

The agent's specialized observation operator O_hat. One of:
- `roles/visionary.md` -- strategy, True North, Zone Detection
- `roles/analyst.md` -- decomposition, File Ownership, pipeline
- `roles/builder.md` -- implementation, Security Checklist, patterns
- `roles/validator.md` -- verification, feedback, dissonance scale
- `roles/coherent.md` -- synchronization, L1/L2/L3, Kill-Switch

**Each agent loads exactly ONE role file matching their assigned role.**

### Step 3: Project Config -- `projects/{name}/config.md` (~30 lines)

Project-specific context: True North, tech stack, architecture, node map, constraints. Keeps project details out of the core and role files (DRY).

**Loaded when a project context is active.**

### Step 4: Project Memory -- `projects/{name}/lessons.md` (~50 lines)

Spiral memory: incidents, mega-patterns, lessons learned. Feeds the Lambda component of B. Without it, Lambda=0 and past mistakes repeat.

**Loaded when project memory exists. Feeds A_Lambda (Activation Operator Step 4).**

---

## Context Budget

Context budget: determined by model capabilities. Claude Opus 4.6 (1M tokens) has no practical limit. Load what is needed for the task.

---

## Overflow Andon

If a task requires reading 20+ files, decompose it. Not because of token limits, but because focus degrades with too many unrelated files (Muri).

1. **Decompose** the task into sub-tasks, each with a focused set of relevant files.
2. **Classify** using the task size table (S/M/L/XL) from eradev.md Section X.
3. **Assign** sub-tasks to separate agents or sequential rounds, each loading only what they need.

---

## META-Orchestrator Loading Path

The META-Orchestrator (Level 9) has a DIFFERENT loading sequence from role agents. Canonical source: root `CLAUDE.md` section "Mandatory Loading Sequence" (v9 adds step 6 — domain skin conditional load):

| Step | File | Purpose |
|------|------|---------|
| 1 | `eradev.md` | Core framework (ODTOE + TPS + Round Table) |
| 2 | `meta.md` | **META operating protocol** (Section 14 = 13-item Session Entry checklist including DOMAIN at item 5b) |
| 3 | `BOOTSTRAP_LESSONS.md` | Cold-start Lambda (split in v9 into `BOOTSTRAP_LESSONS_universal.md` + `BOOTSTRAP_LESSONS_code_adapter.md`; aggregate file still loads) |
| 4 | `projects/{PROJECT}/config.md` | Project context INCLUDING `domain:` block (v9). Absence of block = default `type=code`, `B_modality=text`, `ood_scope=text-discrete`. |
| 5 | `projects/{PROJECT}/lessons.md` | Project memory |
| 6 | `templates/domain_skin.{type}.md` | **Conditional** — loaded ONLY if `domain.skin` is set in the project config. v9 L2 domain overlay (vocabulary + focus). See `templates/domain_skin.md.template` for schema. |

The META-Orchestrator then spawns role agents. Each role agent follows the standard 4-step sequence above (or 5-step if META passes `domain.skin` path per v9 Domain Awareness — the skin is a lightweight overlay, not a role-file replacement).

---

## What NOT to Load (for role agents)

- `glossary.md` -- reference only, not needed for task execution
- `meta.md` -- **META-Orchestrator only**, not for role agents
- `CHECKLIST.md` / `CHECKLIST_EN.md` -- loaded on demand at deploy/review time
- `MEMORY_TEMPLATE.md` -- template, not operational content
- `reports/` -- historical, loaded only when Hansei or Prediction Delta analysis is needed

---

## Loading as Activation Operator

The Loading Protocol maps directly to the Activation Operator (eradev.md Section IV):

| Activation Step | Loading Step | What It Ensures |
|-----------------|-------------|-----------------|
| A_F (Focus) | Steps 1-3 | Agent has all relevant files, nothing extra |
| A_E (Alignment) | Step 3 | Agent knows project True North and IFR |
| A_sigma (Consistency) | Steps 1-2 | Agent knows core rules and role constraints |
| A_Lambda (Experience) | Step 4 | Agent has access to verified lessons |

---

*EraDev v10 | Agent Loading Protocol | META 6-step path + role-agent 4-step path, aligned to root CLAUDE.md*
