# EraDev Setup: Windsurf (Codeium)

Windsurf reads `.windsurfrules` or `.windsurf/rules/*.md` and supports hooks via `.windsurf/hooks.json`.

## Deploy (new project)

First, clone the framework in your terminal:

```bash
cd your-project-root
# HTTPS:
git clone https://github.com/txrx13/eradev.git eradev
# SSH:
git clone git@github.com:txrx13/eradev.git eradev
```

Then paste this prompt into your first Windsurf session:

```
Deploy EraDev ({PROJECT} = basename of current directory):

1. Spawn [BUILDER] agent:
   - Verify eradev/ directory exists (if not, ask operator to run: git clone https://github.com/txrx13/eradev.git eradev)
   - Run: mkdir -p .claude/hooks .windsurf .githooks projects/{PROJECT}
   - Run: cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
   - Run: cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit
   - Run: git config core.hooksPath .githooks (if blocked, note in report)
   - Read eradev/templates/AGENTS.md.template, replace all {PROJECT} with actual project name, save as ./AGENTS.md
   - Run: cp AGENTS.md .windsurfrules
   - Create .windsurf/hooks.json with PreToolUse hooks (Edit|Write|Bash → enforce-delegation.sh, Agent → agent-role-tag.sh + agent-context-check.sh)
   - Create projects/{PROJECT}/config.md (True North, Architecture, Iron Rules)
   - Create projects/{PROJECT}/lessons.md with header

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: verify deploy artifacts (.windsurfrules and AGENTS.md exist with no literal {PROJECT}, hooks executable, .windsurf/hooks.json valid, git hooksPath configured). Report: PASS/BLOCK.

3. AFTER [VALIDATOR] PASS — META loads framework: Read eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, projects/{PROJECT}/config.md, projects/{PROJECT}/lessons.md. Output SESSION BOOTSTRAP checklist. Save META identity to memory. Apply Language Stack routing from eradev.md Section 0 for all subsequent tasks.

Далее общаемся на русском.
```

## Enforcement

Same hook scripts as Claude Code (shared `.claude/hooks/` directory):
- Edit/Write/diagnostic Bash blocked for META session
- [ROLE] tag validation on Agent calls
- Advisory prompt context check
- Text-based rules in `.windsurfrules`

## Update (existing project)

```
Обнови eradev:

1. Spawn [BUILDER] agent:
   - Verify eradev/ directory exists, then run: cd eradev && git pull origin main && cd .. (if git pull blocked, ask operator to pull manually)
   - Run: cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
   - Run: cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit
   - Read eradev/templates/AGENTS.md.template, replace all {PROJECT} with actual project name, save as ./AGENTS.md
   - Run: cp AGENTS.md .windsurfrules

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: verify deploy artifacts (.windsurfrules matches AGENTS.md, hooks executable, no literal {PROJECT}). Report: PASS/BLOCK.

3. AFTER [VALIDATOR] PASS — META loads framework: Read eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, projects/{PROJECT}/config.md, projects/{PROJECT}/lessons.md. Output SESSION BOOTSTRAP checklist. Apply Language Stack routing from eradev.md Section 0 for all subsequent tasks.

Далее продолжаем работу.
```

## Files Created

```
project/
├── .windsurfrules             # Windsurf reads this (copy of AGENTS.md)
├── AGENTS.md                  # Universal (Codex/Jules)
├── .claude/hooks/             # Shared hook scripts (Windsurf reuses)
│   ├── enforce-delegation.sh
│   ├── agent-role-tag.sh
│   └── agent-context-check.sh
├── .githooks/
│   └── pre-commit             # Fix chain >= 3 detection (BL-3)
├── .windsurf/
│   └── hooks.json             # Windsurf hook configuration
└── eradev/                    # Framework (git clone)
```
