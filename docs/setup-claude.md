# EraDev Setup: Claude Code

## Deploy (new project)

Paste `templates/DEPLOY_PROMPT.md` into a new Claude Code session at your project root. It executes 8 steps automatically.

Or manually:

```bash
# 1. Clone EraDev
git clone https://github.com/txrx13/eradev.git eradev

# 2. Install CLAUDE.md
cp eradev/templates/CLAUDE.md.template CLAUDE.md
# Edit CLAUDE.md: replace {PROJECT} with your project name

# 3. Install enforcement hooks
mkdir -p .claude/hooks
cp eradev/.claude/hooks/*.sh .claude/hooks/
chmod +x .claude/hooks/*.sh
cp eradev/.claude/settings.json .claude/settings.json

# 4. Create project skeleton
mkdir -p projects/YOUR_PROJECT
echo "# YOUR_PROJECT — Config" > projects/YOUR_PROJECT/config.md
echo "# YOUR_PROJECT — Lessons" > projects/YOUR_PROJECT/lessons.md
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
