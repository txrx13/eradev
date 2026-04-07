# EraDev Setup: Codex (OpenAI) / Jules (Google)

Both Codex and Jules read `AGENTS.md` at project root. No hooks support — enforcement is text-only.

## Deploy (new project)

Paste this prompt into your first Codex/Jules session:

```
Setup EraDev for this project ({PROJECT} = basename of current directory):

1. git clone https://github.com/txrx13/eradev.git eradev (or git pull if exists)
2. cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit && git config core.hooksPath .githooks
3. Spawn [SETUP] agent: create these files —
   - Read eradev/templates/AGENTS.md.template, save as ./AGENTS.md (replace {PROJECT})
   - Create projects/{PROJECT}/config.md (True North, Architecture, Iron Rules)
   - Create projects/{PROJECT}/lessons.md with header
4. Spawn [VALIDATOR] agent: прочитай AGENTS.md, eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, eradev/projects/{PROJECT}/config.md и lessons.md. Сверь 6 output types, Core Rules. Выведи SESSION BOOTSTRAP checklist. Report: PASS/BLOCK.

Continue in Russian.
```

## Enforcement

No hooks available. All enforcement is text-based via `AGENTS.md`:
- 6 output types with Check Agent
- Session Bootstrap checklist (6 items)
- KILL-TEST (first action = agent call)
- Bash classification (operational vs diagnostic)
- Report Funnel + Context Tiers
- Meta-Reflection Triggers + Mid-Session Reclassification
- Git pre-commit hook detects fix chains >= 3 (BL-3)

## Update (existing project)

```
Update eradev:
1. cd eradev && git pull origin main && cd ..
2. cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit
3. Spawn [SETUP] agent: update AGENTS.md from eradev/templates/AGENTS.md.template (replace {PROJECT})
4. Spawn [VALIDATOR] agent: прочитай AGENTS.md, eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, eradev/projects/{PROJECT}/config.md и lessons.md. Сверь 6 output types, Core Rules. Выведи SESSION BOOTSTRAP checklist. Report: PASS/BLOCK.

Continue with current tasks.
```

## Files Created

```
project/
├── AGENTS.md              # Universal (Codex and Jules read this)
├── .githooks/
│   └── pre-commit             # Fix chain >= 3 detection (BL-3)
└── eradev/                # Framework (git clone)
```

## Notes

- Codex walks directory tree from git root to cwd, concatenating AGENTS.md files (32 KiB limit per file)
- Jules reads AGENTS.md from project root only
- Both support markdown format with sections
