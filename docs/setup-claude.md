# EraDev Setup: Claude Code

## Deploy (new project)

Paste this prompt into a new Claude Code session at your project root:

```
Setup EraDev for this project ({PROJECT} = basename of current directory):

Operational steps (direct):
1. git clone https://github.com/txrx13/eradev.git eradev (or git pull if exists)
2. cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
3. cp eradev/.claude/settings.json .claude/settings.json
4. cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit && git config core.hooksPath .githooks

Delegated steps (spawn one [SETUP] agent):
5. Spawn [SETUP] agent with task: create these files —
   - Read eradev/templates/CLAUDE.md.template, save as ./CLAUDE.md (replace {PROJECT})
   - Read eradev/templates/AGENTS.md.template, save as ./AGENTS.md (replace {PROJECT})
   - Create projects/{PROJECT}/config.md with sections: True North, Architecture, Iron Rules
   - Create projects/{PROJECT}/lessons.md with header

Verification:
6. Read eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md — verify load
7. Save META identity (6 output types + Bash classification + LOAD sequence) to memory
8. Output deploy confirmation with [x] checkmarks for all created files

Далее общаемся на русском.
```

## Enforcement Layers

| Layer | File | What it does |
|-------|------|-------------|
| 1. Auto-bootstrap | `CLAUDE.md` | Loads META identity at every session start |
| 2. Edit/Write block | `.claude/hooks/enforce-delegation.sh` | Blocks META from editing files directly |
| 3. Diagnostic block | Same hook | Blocks grep/curl/ssh/psql from META session |
| 4. [ROLE] tag check | `.claude/hooks/agent-role-tag.sh` | Blocks Agent calls without [ROLE] tag |
| 5. Context check | `.claude/hooks/agent-context-check.sh` | Advisory: warns if agent prompt lacks context |
| 6. Fix chain | `.githooks/pre-commit` | Blocks commit at 3+ consecutive fixes |

## Update (existing project)

```
Обнови eradev инструкции:

Operational (direct):
1. cd eradev && git pull origin main && cd ..
2. cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
3. cp eradev/.claude/settings.json .claude/settings.json
4. cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit

Delegated:
5. Spawn [SETUP] agent: обнови AGENTS.md из eradev/templates/AGENTS.md.template (replace {PROJECT})

Verification:
6. Прочитай eradev/CLAUDE.md — сверь 6 output types и 10 invariants
7. Прочитай eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md
8. Прочитай eradev/projects/{PROJECT}/config.md и lessons.md
9. Выведи SESSION BOOTSTRAP checklist из meta.md Section 14 (12 items)
10. Сохрани META identity (6 output types + Bash classification + LOAD sequence) в memory

Далее продолжаем работу.
```

## Files Created

```
project/
├── CLAUDE.md                  # Auto-bootstrap (loaded every session)
├── AGENTS.md                  # Universal agent config
├── .claude/
│   ├── settings.json          # Hook configuration
│   └── hooks/
│       ├── enforce-delegation.sh  # Blocks Edit/Write/diagnostic Bash
│       ├── agent-role-tag.sh      # Blocks Agent without [ROLE] tag
│       └── agent-context-check.sh # Advisory prompt check
├── .githooks/
│   └── pre-commit             # Fix chain >= 3 detection (BL-3)
└── eradev/                    # Framework (git clone)
```
