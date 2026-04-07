# EraDev Setup: Windsurf (Codeium)

Windsurf reads `.windsurfrules` or `.windsurf/rules/*.md` and supports hooks via `.windsurf/hooks.json`.

## Deploy (new project)

```bash
# 1. Clone EraDev
git clone https://github.com/txrx13/eradev.git eradev

# 2. Install .windsurfrules (universal agent config)
cp eradev/templates/AGENTS.md.template .windsurfrules

# 3. Also create AGENTS.md (for Codex/Jules compatibility)
cp eradev/templates/AGENTS.md.template AGENTS.md

# 4. Install enforcement hooks (shared with Claude Code)
mkdir -p .claude/hooks .windsurf
cp eradev/.claude/hooks/*.sh .claude/hooks/
chmod +x .claude/hooks/*.sh
```

Create `.windsurf/hooks.json`:
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write|Bash",
        "hooks": [{"type": "command", "command": ".claude/hooks/enforce-delegation.sh"}]
      },
      {
        "matcher": "Agent",
        "hooks": [
          {"type": "command", "command": ".claude/hooks/agent-role-tag.sh"},
          {"type": "command", "command": ".claude/hooks/agent-context-check.sh"}
        ]
      }
    ]
  }
}
```

```bash
# 5. Create project skeleton
mkdir -p projects/YOUR_PROJECT
echo "# YOUR_PROJECT — Config" > projects/YOUR_PROJECT/config.md
echo "# YOUR_PROJECT — Lessons" > projects/YOUR_PROJECT/lessons.md
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
├── .windsurf/
│   └── hooks.json             # Windsurf hook configuration
└── eradev/                    # Framework (git clone)
```
