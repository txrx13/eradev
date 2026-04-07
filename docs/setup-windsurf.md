# EraDev Setup: Windsurf (Codeium)

Windsurf reads `.windsurfrules` or `.windsurf/rules/*.md` and supports hooks via `.windsurf/hooks.json`.

## Deploy (new project)

Paste this prompt into your first Windsurf session:

```
Deploy EraDev ({PROJECT} = basename of current directory):

1. Spawn [BUILDER] agent:
   - git clone https://github.com/txrx13/eradev.git eradev (or git pull if exists)
   - mkdir -p .claude/hooks .windsurf .githooks
   - Copy eradev/.claude/hooks/*.sh to .claude/hooks/, make executable
   - Copy eradev/.githooks/pre-commit to .githooks/pre-commit, make executable
   - Run: git config core.hooksPath .githooks
   - Read eradev/templates/AGENTS.md.template, save as ./AGENTS.md (replace {PROJECT})
   - Copy AGENTS.md to .windsurfrules
   - Create .windsurf/hooks.json with PreToolUse hooks (Edit|Write|Bash → enforce-delegation.sh, Agent → agent-role-tag.sh + agent-context-check.sh)
   - Create projects/{PROJECT}/config.md (True North, Architecture, Iron Rules)
   - Create projects/{PROJECT}/lessons.md with header

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: прочитай .windsurfrules, eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, eradev/projects/{PROJECT}/config.md и lessons.md. Сверь 6 output types. Выведи SESSION BOOTSTRAP checklist. Report: PASS/BLOCK.

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
   - cd eradev && git pull origin main && cd ..
   - Copy eradev/.claude/hooks/*.sh to .claude/hooks/, make executable
   - Copy eradev/.githooks/pre-commit to .githooks/pre-commit, make executable
   - Update AGENTS.md from eradev/templates/AGENTS.md.template (replace {PROJECT})
   - Copy AGENTS.md to .windsurfrules

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: прочитай .windsurfrules, eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, eradev/projects/{PROJECT}/config.md и lessons.md. Сверь 6 output types. Выведи SESSION BOOTSTRAP checklist. Report: PASS/BLOCK.

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
