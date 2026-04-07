# EraDev Setup: Codex (OpenAI) / Jules (Google)

Both Codex and Jules read `AGENTS.md` at project root. No hooks support — enforcement is text-only.

## Deploy (new project)

```bash
# 1. Clone EraDev
git clone https://github.com/txrx13/eradev.git eradev

# 2. Install AGENTS.md (universal agent config)
cp eradev/templates/AGENTS.md.template AGENTS.md

# 3. Create project skeleton
mkdir -p projects/YOUR_PROJECT
echo "# YOUR_PROJECT — Config" > projects/YOUR_PROJECT/config.md
echo "# YOUR_PROJECT — Lessons" > projects/YOUR_PROJECT/lessons.md
```

## Enforcement

No hooks available. All enforcement is text-based via `AGENTS.md`:
- 6 output types with Check Agent
- Session Bootstrap checklist (6 items)
- KILL-TEST (first action = agent call)
- Bash classification (operational vs diagnostic)
- Report Funnel + Context Tiers
- Meta-Reflection Triggers + Mid-Session Reclassification

## Update (existing project)

```
Update eradev:
1. cd eradev && git pull origin main && cd ..
2. cp eradev/templates/AGENTS.md.template AGENTS.md
3. Read AGENTS.md — verify 6 output types and Core Rules
4. Read eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md
5. Read eradev/projects/{PROJECT}/config.md and lessons.md
6. Output SESSION BOOTSTRAP checklist (6 items from AGENTS.md)

Continue with current tasks.
```

## Files Created

```
project/
├── AGENTS.md              # Universal (Codex and Jules read this)
└── eradev/                # Framework (git clone)
```

## Notes

- Codex walks directory tree from git root to cwd, concatenating AGENTS.md files (32 KiB limit per file)
- Jules reads AGENTS.md from project root only
- Both support markdown format with sections
