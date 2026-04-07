# EraDev Setup: Cursor

Cursor reads `.cursorrules` or `.cursor/rules/*.mdc` at project root. No hooks support — enforcement is text-only via AGENTS.md rules.

## Deploy (new project)

```bash
# 1. Clone EraDev
git clone https://github.com/txrx13/eradev.git eradev

# 2. Install .cursorrules (universal agent config)
cp eradev/templates/AGENTS.md.template .cursorrules

# 3. Also create AGENTS.md (for Codex/Jules compatibility)
cp eradev/templates/AGENTS.md.template AGENTS.md

# 4. Create project skeleton
mkdir -p projects/YOUR_PROJECT
echo "# YOUR_PROJECT — Config" > projects/YOUR_PROJECT/config.md
echo "# YOUR_PROJECT — Lessons" > projects/YOUR_PROJECT/lessons.md
```

## Enforcement

No hooks available. All enforcement is text-based via `.cursorrules`:
- 6 output types (Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent)
- Session Bootstrap checklist (6 items)
- KILL-TEST (first action = agent call)
- Bash classification (operational vs diagnostic)
- Report Funnel (Builder → Verdict → Brief → META)
- Context Tiers + Meta-Reflection Triggers

## Update (existing project)

```
Обнови eradev:
1. cd eradev && git pull origin main && cd ..
2. cp eradev/templates/AGENTS.md.template .cursorrules
3. cp eradev/templates/AGENTS.md.template AGENTS.md
4. Прочитай .cursorrules — сверь 6 output types и Core Rules
5. Прочитай eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md
6. Прочитай eradev/projects/{PROJECT}/config.md и lessons.md
7. Выведи SESSION BOOTSTRAP checklist (6 items из AGENTS.md)

Далее продолжаем работу.
```

## Files Created

```
project/
├── .cursorrules           # Cursor reads this (copy of AGENTS.md)
├── AGENTS.md              # Universal (Codex/Jules also read this)
└── eradev/                # Framework (git clone)
```
