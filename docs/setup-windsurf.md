# EraDev Setup: Windsurf (Codeium)

Windsurf reads `.windsurfrules` or `.windsurf/rules/*.md` and supports hooks via `.windsurf/hooks.json`.

## Deploy (new project)

Paste this prompt into your first Windsurf session:

```
Setup EraDev for this project ({PROJECT} = basename of current directory):

Operational steps (direct):
1. git clone https://github.com/txrx13/eradev.git eradev (or git pull if exists)
2. cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
3. cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit && git config core.hooksPath .githooks

Delegated:
4. Spawn [SETUP] agent: create these files —
   - Read eradev/templates/AGENTS.md.template, save as ./AGENTS.md (replace {PROJECT})
   - Copy AGENTS.md to .windsurfrules
   - Create .windsurf/hooks.json with PreToolUse hooks (Edit|Write|Bash → enforce-delegation.sh, Agent → agent-role-tag.sh + agent-context-check.sh)
   - Create projects/{PROJECT}/config.md (True North, Architecture, Iron Rules)
   - Create projects/{PROJECT}/lessons.md with header

Validation:
5. Spawn [VALIDATOR] agent: прочитай .windsurfrules, eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, eradev/projects/{PROJECT}/config.md и lessons.md. Сверь 6 output types, Core Rules. Выведи SESSION BOOTSTRAP checklist. Report: PASS/BLOCK.

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
2. cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
3. cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit
4. Spawn [SETUP] agent: обнови AGENTS.md из eradev/templates/AGENTS.md.template (replace {PROJECT}), скопируй в .windsurfrules
5. Spawn [VALIDATOR] agent: прочитай .windsurfrules, eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, eradev/projects/{PROJECT}/config.md и lessons.md. Сверь 6 output types, Core Rules. Выведи SESSION BOOTSTRAP checklist. Report: PASS/BLOCK.

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
