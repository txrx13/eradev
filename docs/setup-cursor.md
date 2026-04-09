# EraDev Setup: Cursor

Cursor reads `.cursorrules` or `.cursor/rules/*.mdc` at project root. No hooks support — enforcement is text-only via AGENTS.md rules.

## Deploy (new project)

Paste this prompt into your first Cursor session:

```
Deploy EraDev ({PROJECT} = basename of current directory):

1. Spawn [BUILDER] agent:
   - git clone https://github.com/txrx13/eradev.git eradev (or git pull if exists)
   - mkdir -p .githooks
   - Copy eradev/.githooks/pre-commit to .githooks/pre-commit, make executable
   - Run: git config core.hooksPath .githooks
   - Read eradev/templates/AGENTS.md.template, save as ./AGENTS.md (replace {PROJECT})
   - Copy AGENTS.md to .cursorrules
   - Create projects/{PROJECT}/config.md (True North, Architecture, Iron Rules)
   - Create projects/{PROJECT}/lessons.md with header

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: verify deploy artifacts (.cursorrules and AGENTS.md exist with no literal {PROJECT}, .githooks/pre-commit executable, git hooksPath configured). Report: PASS/BLOCK.

3. AFTER [VALIDATOR] PASS — META loads framework: Read eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, projects/{PROJECT}/config.md, projects/{PROJECT}/lessons.md. Output SESSION BOOTSTRAP checklist. Save META identity to memory.

Далее общаемся на русском.
```

## Enforcement

No hooks available. All enforcement is text-based via `.cursorrules`:
- 6 output types (Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent)
- Session Bootstrap checklist (6 items)
- KILL-TEST (first action = agent call)
- Bash classification (operational vs diagnostic)
- Report Funnel (Builder → Verdict → Brief → META)
- Context Tiers + Meta-Reflection Triggers
- Git pre-commit hook detects fix chains >= 3 (BL-3)

## Update (existing project)

```
Обнови eradev:

1. Spawn [BUILDER] agent:
   - cd eradev && git pull origin main && cd ..
   - Copy eradev/.githooks/pre-commit to .githooks/pre-commit, make executable
   - Update AGENTS.md from eradev/templates/AGENTS.md.template (replace {PROJECT})
   - Copy AGENTS.md to .cursorrules

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: verify deploy artifacts (.cursorrules matches AGENTS.md, no literal {PROJECT}, pre-commit executable). Report: PASS/BLOCK.

3. AFTER [VALIDATOR] PASS — META loads framework: Read eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md, projects/{PROJECT}/config.md, projects/{PROJECT}/lessons.md. Output SESSION BOOTSTRAP checklist.

Далее продолжаем работу.
```

## Files Created

```
project/
├── .cursorrules           # Cursor reads this (copy of AGENTS.md)
├── AGENTS.md              # Universal (Codex/Jules also read this)
├── .githooks/
│   └── pre-commit             # Fix chain >= 3 detection (BL-3)
└── eradev/                # Framework (git clone)
```
