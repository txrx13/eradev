# EraDev Self-Project — Configuration

## True North
EraDev is a self-improving multi-agent framework that applies its own principles to its own development. The framework evolves through the same Round Table, 5-role, and ODTOE coherence mechanisms it prescribes for other projects.

## Architecture
- **Core files** (eradev.md, meta.md, role files) — universal, project-agnostic
- **Templates** (templates/CLAUDE.md.*) — auto-bootstrap for Claude Code
- **Projects** (projects/{name}/) — project-specific configs and lessons
- **Reports** (reports/) — Round Table analytical outputs
- **Bilingual pairs** — every file exists in RU and EN variants

## Tech Stack
- Language: Markdown (.md)
- Hosting: GitHub (txrx13/odtoe, private)
- Platform: Claude Code (Anthropic, Claude Opus 4.6)
- Agent tool for multi-agent orchestration

## Bilingual Architecture (BL-19)
Every file in the framework exists in two language variants:
- EN (primary for agents): `eradev.md`, `{role}_EN.md`, `glossary_EN.md`, `meta.md`
- RU (for theoretical depth): `eradev_RU.md`, `{role}.md`, `glossary.md`, `meta_RU.md`

**Iron Rule:** Creating or updating ANY file without its bilingual counterpart is INCOMPLETE work. Both versions must be updated in the same operation.

## Versioning
- Current: v7.1
- Version bumps: Section 0 header in eradev.md + eradev_RU.md
- Changelog: git commit messages

## Iron Rules

1. **Self-application:** EraDev applies its own processes to itself. Framework changes go through RT-1/RT-2/RT-3 with 5 roles.
2. **No duplication:** Content lives in ONE canonical location. Other files reference it, not copy it. (DRY)
3. **Bilingual sync:** Every change to EN file = same change to RU counterpart in the same commit. (BL-19)
4. **Check-First for articles:** Read reference format BEFORE generation. 7 checks BEFORE writing .tex. (BL-17, BL-21)
5. **Bootstrap tested:** Any change to CLAUDE.md templates or README bootstrap prompts must be adversarially tested before deployment. (BL-20)
6. **Scope reclassification:** If work exceeds 2x initial estimate, formally reclassify task size. (BL-18)
7. **Core isolation:** Core framework files (outside projects/) MUST NOT reference specific external projects by name. Use `{name}` as placeholder. External project data lives ONLY in `projects/{name}/`.

## Key Metrics
- S_team across framework files (sync audit): target > 0.9
- Bilingual sync completeness: target 100% (no orphan files)
- Bootstrap effectiveness: tested via A/B experiments
- Context budget: determined by model capabilities, no artificial line limits
