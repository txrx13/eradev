# EraDev Setup: Claude Code

## Deploy (new project)

Paste this prompt into a new Claude Code session at your project root:

```
Deploy EraDev ({PROJECT} = basename of current directory):

1. Spawn [SETUP] agent:
   - git clone https://github.com/txrx13/eradev.git eradev (or git pull if exists)
   - mkdir -p .claude/hooks .githooks
   - Copy eradev/.claude/hooks/*.sh to .claude/hooks/, make executable
   - Copy eradev/.claude/settings.json to .claude/settings.json
   - Copy eradev/.githooks/pre-commit to .githooks/pre-commit, make executable
   - Run: git config core.hooksPath .githooks
   - Read eradev/templates/CLAUDE.md.template, save as ./CLAUDE.md (replace {PROJECT})
   - Read eradev/templates/AGENTS.md.template, save as ./AGENTS.md (replace {PROJECT})
   - Create projects/{PROJECT}/config.md (True North, Architecture, Iron Rules)
   - Create projects/{PROJECT}/lessons.md with header

2. Spawn [VALIDATOR] agent: прочитай eradev/CLAUDE.md, eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, eradev/projects/{PROJECT}/config.md и lessons.md. Сверь: 6 output types, 10 invariants, 30 BL. Выведи SESSION BOOTSTRAP checklist (12 items). Сохрани META identity (6 output types + Bash classification + LOAD sequence) в memory. Report: PASS/BLOCK.

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
Обнови eradev:

1. Spawn [SETUP] agent:
   - cd eradev && git pull origin main && cd ..
   - Copy eradev/.claude/hooks/*.sh to .claude/hooks/, make executable
   - Copy eradev/.claude/settings.json to .claude/settings.json
   - Copy eradev/.githooks/pre-commit to .githooks/pre-commit, make executable
   - Update AGENTS.md from eradev/templates/AGENTS.md.template (replace {PROJECT})

2. Spawn [VALIDATOR] agent: прочитай eradev/CLAUDE.md, eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, eradev/projects/{PROJECT}/config.md и lessons.md. Сверь: 6 output types, 10 invariants, 30 BL. Выведи SESSION BOOTSTRAP checklist (12 items). Сохрани META identity (6 output types + Bash classification + LOAD sequence) в memory. Report: PASS/BLOCK.

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
