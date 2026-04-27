# EraDev Setup: Claude Code (v10)

## Deploy (new project)

## Pre-requisite (run in terminal)

```bash
cd your-project-root
# HTTPS:
git clone https://github.com/txrx13/eradev.git eradev
# SSH:
git clone git@github.com:txrx13/eradev.git eradev
```

Then paste this prompt into a new Claude Code session:

```
Deploy EraDev ({PROJECT} = basename of current directory):

0. META setup (operational Bash — run directly, not via agent):
   - Run: mkdir -p .claude/hooks .githooks projects/{PROJECT}
   - Run: cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
   - Run: cp eradev/.claude/settings.json .claude/settings.json
   - Run: cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit
   - Run: git config core.hooksPath .githooks
   If any command blocked by sandbox, ask operator to run it in terminal.

1. Spawn [BUILDER] agent:
   - Read eradev/templates/CLAUDE.md.template, replace all {PROJECT} with actual project name, save as ./CLAUDE.md
   - Create projects/{PROJECT}/config.md (True North, Architecture, Iron Rules)
   - Create projects/{PROJECT}/lessons.md with header

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: verify deploy artifacts (all files exist, hooks executable, no literal {PROJECT} in generated files, git hooksPath configured). Report: PASS/BLOCK.

3. AFTER [VALIDATOR] PASS — META loads framework (6-step sequence):
   1. Read eradev/eradev.md
   2. Read eradev/meta.md
   3. Read eradev/BOOTSTRAP_LESSONS.md
   4. Read projects/{PROJECT}/config.md (detect domain.type from `domain:` block — default: code)
   5. Read projects/{PROJECT}/lessons.md
   6. IF domain.skin set in config: Read eradev/templates/domain_skin.{type}.md
   Output SESSION BOOTSTRAP checklist (13 items, incl. 5b DOMAIN). Save META identity to memory. Apply Language Stack routing from eradev.md Section 0 for all subsequent tasks.

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
| 7. Phantom-newness (PN-1) | `.githooks/phantom-newness-check.sh` | BLOCKS commits adding new BL/L-/EMP IDs, Invariants, or template files whose keywords overlap existing entries (BL-29 sister; L-58). Bypass: `PN_OVERRIDE=1`, `--phantom-checked`, or `[novel-add]` in commit message |

**Note:** These are runtime enforcement hooks. Separately, EraDev uses a 4-layer file architecture: L0 IMMUTABLE (ODTOE core) / L1 Universal roles / L2 Domain skins / L3 Project instances.

**Domain awareness:** For non-code projects, set `domain:` block in `projects/{PROJECT}/config.md`. Use `domain.skin` to point at `eradev/templates/domain_skin.{type}.md` (types: code, article, book, config, plan, research).

## Update (existing project)

Run in terminal first:

```bash
cd your-project-root
cd eradev && git pull origin main && cd ..
```

Then paste:

```
Обнови eradev:

0. META setup (operational Bash):
   - Run: cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
   - Run: cp eradev/.claude/settings.json .claude/settings.json
   - Run: cp eradev/.githooks/pre-commit .githooks/pre-commit && chmod +x .githooks/pre-commit
   If any command blocked, ask operator to run it in terminal.

1. Spawn [BUILDER] agent:
   - Read eradev/templates/CLAUDE.md.template, replace all {PROJECT} with actual project name, save as ./CLAUDE.md

2. AFTER [BUILDER] completes — spawn [VALIDATOR] agent: verify deploy artifacts (hooks executable, no literal {PROJECT} in CLAUDE.md, git hooksPath configured). Report: PASS/BLOCK.

3. AFTER [VALIDATOR] PASS — META loads framework (6-step sequence):
   1. Read eradev/eradev.md
   2. Read eradev/meta.md
   3. Read eradev/BOOTSTRAP_LESSONS.md
   4. Read projects/{PROJECT}/config.md (detect domain.type)
   5. Read projects/{PROJECT}/lessons.md
   6. IF domain.skin set: Read eradev/templates/domain_skin.{type}.md
   Output SESSION BOOTSTRAP checklist (13 items). Apply Language Stack routing from eradev.md Section 0 for all subsequent tasks.

Далее продолжаем работу.
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
├── .githooks/
│   └── pre-commit             # Fix chain >= 3 detection (BL-3)
└── eradev/                    # Framework (git clone)
```
