# EraDev Setup: Codex (OpenAI) / Jules (Google)

Both Codex and Jules read `AGENTS.md` at project root. No hooks support — enforcement is text-only.

## Deploy (new project)

Paste this prompt into your first Codex/Jules session:

```
Deploy EraDev ({PROJECT} = basename of current directory):

1. Spawn [BUILDER] agent:
   - git clone https://github.com/txrx13/eradev.git eradev (or git pull if exists)
   - mkdir -p .githooks
   - Copy eradev/.githooks/pre-commit to .githooks/pre-commit, make executable
   - Run: git config core.hooksPath .githooks
   - Read eradev/templates/AGENTS.md.template, save as ./AGENTS.md (replace {PROJECT})
   - Create projects/{PROJECT}/config.md (True North, Architecture, Iron Rules)
   - Create projects/{PROJECT}/lessons.md with header

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: verify deploy artifacts (AGENTS.md exists with no literal {PROJECT}, .githooks/pre-commit executable, git hooksPath configured). Report: PASS/BLOCK.

3. AFTER [VALIDATOR] PASS — META loads framework: Read eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, projects/{PROJECT}/config.md, projects/{PROJECT}/lessons.md. Output SESSION BOOTSTRAP checklist. Save META identity to memory.

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

1. Spawn [BUILDER] agent:
   - cd eradev && git pull origin main && cd ..
   - Copy eradev/.githooks/pre-commit to .githooks/pre-commit, make executable
   - Update AGENTS.md from eradev/templates/AGENTS.md.template (replace {PROJECT})

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: verify deploy artifacts (AGENTS.md has no literal {PROJECT}, pre-commit executable). Report: PASS/BLOCK.

3. AFTER [VALIDATOR] PASS — META loads framework: Read eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, projects/{PROJECT}/config.md, projects/{PROJECT}/lessons.md. Output SESSION BOOTSTRAP checklist.

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
