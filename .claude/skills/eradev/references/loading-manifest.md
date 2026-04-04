# EraDev Loading Manifest

> Machine-readable inventory of all framework files.
> Used by META-Orchestrator and role agents to determine what to load and when.

---

## Tier 1: Always Loaded by META

These files are loaded at every session start, unconditionally.

| File | Path | Purpose | Loading Order |
|------|------|---------|---------------|
| Universal Core | `eradev.md` | ODTOE formulas, TPS principles, RT protocol, Activation Operator, role definitions, task classification | 1 |
| META Protocol | `meta.md` | META-Orchestrator operating protocol, Session Entry (Section 14), prompt evolution, prediction delta | 2 |
| Bootstrap Lessons | `BOOTSTRAP_LESSONS.md` | Cold-start Lambda (BL-01 to BL-27), universal lessons for when project memory is empty | 3 |

META also loads `meta_RU.md` when operating in RU or BOTH stack.

---

## Tier 2: Loaded Per-Project

These files are loaded when a project context is active.

| File | Path Pattern | Purpose | Loading Order |
|------|-------------|---------|---------------|
| Project Config | `projects/{name}/config.md` | True North, tech stack, architecture, node map, constraints | 4 |
| Project Lessons | `projects/{name}/lessons.md` | Spiral memory: incidents, mega-patterns, project-specific Lambda | 5 |

Known projects:
- `projects/academic-lab/` -- Academic lab project
- `projects/odtoe-articles/` -- ODTOE research articles
- `projects/eradev/` -- EraDev self-improvement (meta-project)
- `projects/plugy/` -- Plugy project

---

## Tier 3: Loaded by Role Agents

Each role agent loads exactly ONE role file matching their assignment and the selected language stack.

### EN Stack (practical tasks: implement, fix, deploy, test, build, debug, refactor)

| Role | File | Path |
|------|------|------|
| Visionary | `visionary_EN.md` | `visionary_EN.md` |
| Analyst | `analyst_EN.md` | `analyst_EN.md` |
| Builder | `builder_EN.md` | `builder_EN.md` |
| Validator | `validator_EN.md` | `validator_EN.md` |
| Coherencer | `coherent_EN.md` | `coherent_EN.md` |

### RU Stack (theoretical tasks: derive, prove, formula, ODTOE, conceptual, theorem)

| Role | File | Path |
|------|------|------|
| Visionary | `visionary.md` | `visionary.md` |
| Analyst | `analyst.md` | `analyst.md` |
| Builder | `builder.md` | `builder.md` |
| Validator | `validator.md` | `validator.md` |
| Coherencer | `coherent.md` | `coherent.md` |

---

## Support Files (Loaded On Demand)

These files are NOT loaded at session start. They are loaded when specific conditions trigger them.

| File | Path | Trigger |
|------|------|---------|
| Loading Protocol | `LOADING_PROTOCOL.md` | Reference for agent context loading sequence |
| Checklist (EN) | `CHECKLIST_EN.md` | Deploy or review time |
| Checklist (RU) | `CHECKLIST.md` | Deploy or review time (RU stack) |
| Memory Template (EN) | `MEMORY_TEMPLATE_EN.md` | Creating A3 entries |
| Memory Template (RU) | `MEMORY_TEMPLATE.md` | Creating A3 entries (RU stack) |
| Glossary (EN) | `glossary_EN.md` | Term disambiguation |
| Glossary (RU) | `glossary.md` | Term disambiguation (RU stack) |
| Interfaces | `interfaces.md` | Interface contract definition |
| Core (RU) | `eradev_RU.md` | RU/BOTH stack -- theoretical counterpart of eradev.md |
| META (RU) | `meta_RU.md` | RU/BOTH stack -- META protocol in Russian |

---

## Reports (Historical / Analytical)

Located in `reports/`. Loaded only for Hansei, Prediction Delta analysis, or retrospectives.

---

## Templates

| File | Path | Purpose |
|------|------|---------|
| CLAUDE.md Universal | `templates/CLAUDE.md.universal` | Auto-bootstrap template for Claude Code sessions |

---

## Role Agent Loading Sequence

Each role agent spawned by META follows this 4-step sequence:

```
Step 1: eradev.md                    (Universal Core -- ALWAYS)
Step 2: {role}_EN.md or {role}.md    (Role prompt -- exactly ONE)
Step 3: projects/{name}/config.md    (Project config -- if exists)
Step 4: projects/{name}/lessons.md   (Project memory -- if exists)
```

META-Orchestrator follows a different 5-step sequence (see Tier 1 + Tier 2 above).

---

## Stack Selection Rule

Determined BEFORE loading, per eradev.md Section 0:

| Task signals | Stack | Role files used |
|-------------|-------|-----------------|
| implement, fix, deploy, test, build, debug, refactor | EN | `{role}_EN.md` |
| derive, prove, formula, ODTOE, conceptual, theorem | RU | `{role}.md` |
| Mixed L/XL | BOTH | Parallel EN + RU agents, Coherencer syncs at RT |
| Ambiguous | EN (default) | `{role}_EN.md` |
