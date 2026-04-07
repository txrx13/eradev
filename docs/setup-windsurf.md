# EraDev Setup: Windsurf (Codeium)

Windsurf reads `.windsurfrules` or `.windsurf/rules/*.md` and supports hooks via `.windsurf/hooks.json`.

## Deploy (new project)

Paste this prompt into your first Windsurf session:

```
Setup EraDev for this project ({PROJECT} = basename of current directory):
1. git clone https://github.com/txrx13/eradev.git eradev (or git pull if exists)
2. Read eradev/templates/AGENTS.md.template, save as ./.windsurfrules — replace {PROJECT}
3. Read eradev/templates/AGENTS.md.template, save as ./AGENTS.md — replace {PROJECT}
4. Create .claude/hooks/ directory, copy all .sh files from eradev/.claude/hooks/, make executable
5. Create .windsurf/ directory, create hooks.json with PreToolUse hooks matching Edit|Write|Bash and Agent (see eradev/.claude/settings.json for format)
6. Create projects/{PROJECT}/config.md with sections: True North, Architecture, Iron Rules
7. Create projects/{PROJECT}/lessons.md with header
8. Copy eradev/.githooks/pre-commit to ./.githooks/pre-commit, make executable, run: git config core.hooksPath .githooks
9. Read .windsurfrules, output SESSION BOOTSTRAP checklist (6 items)

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
1. cd eradev && git pull origin main && cd ..
2. cp eradev/templates/AGENTS.md.template .windsurfrules
3. cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
4. Прочитай .windsurfrules — сверь 6 output types
5. Прочитай eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md
6. Прочитай eradev/projects/{PROJECT}/config.md и lessons.md
7. Выведи SESSION BOOTSTRAP checklist (6 items)

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
