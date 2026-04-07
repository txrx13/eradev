# EraDev Setup: Claude Code

## Deploy (new project)

**Option A (recommended):** Paste `templates/DEPLOY_PROMPT.md` contents into a new Claude Code session. It does everything automatically.

**Option B:** Paste this prompt:

```
Setup EraDev for this project ({PROJECT} = basename of current directory):
1. git clone https://github.com/txrx13/eradev.git eradev (or git pull if exists)
2. Read eradev/templates/CLAUDE.md.template, save as ./CLAUDE.md — replace {PROJECT}
3. Create .claude/hooks/ directory, copy all .sh files from eradev/.claude/hooks/, make executable
4. Read eradev/.claude/settings.json, save as ./.claude/settings.json
5. Create projects/{PROJECT}/config.md with sections: True North, Architecture, Iron Rules
6. Create projects/{PROJECT}/lessons.md with header
7. Save META identity (6 output types + Bash classification) to Claude Code memory
8. Output SESSION BOOTSTRAP checklist from eradev/meta.md Section 14

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
1. cd eradev && git pull origin main && cd ..
2. Sync hooks: cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
3. Sync settings: cp eradev/.claude/settings.json .claude/settings.json
4. Прочитай eradev/CLAUDE.md — сверь 6 output types и 10 invariants
5. Прочитай eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md
6. Прочитай eradev/projects/{PROJECT}/config.md и lessons.md
7. Выведи SESSION BOOTSTRAP checklist из meta.md Section 14 (12 items)
8. Сохрани META identity (6 output types + Bash classification) в Claude Code memory

Далее продолжаем работу по текущим задачам.
```

## Files Created

```
project/
├── CLAUDE.md                  # Auto-bootstrap (loaded every session)
├── .claude/
│   ├── settings.json          # Hook configuration
│   └── hooks/
│       ├── enforce-delegation.sh  # Blocks Edit/Write/diagnostic Bash
│       ├── agent-role-tag.sh      # Blocks Agent without [ROLE] tag
│       └── agent-context-check.sh # Advisory prompt check
└── eradev/                    # Framework (git clone)
```
