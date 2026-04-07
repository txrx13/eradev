# EraDev Universal Deploy Prompt
# Paste this into ANY AI coding agent (Claude Code, Cursor, Codex, Jules, Windsurf).
# The agent will set up EraDev framework in the current project.

You are a setup agent. Execute all steps sequentially. {PROJECT} = basename of current working directory.

## Step 1: Clone or Update EraDev

```bash
[ -d "eradev" ] && (cd eradev && git pull origin main && cd ..) || git clone https://github.com/txrx13/eradev.git eradev
```
Always pull latest — eradev evolves every session.

## Step 2: Create AGENTS.md (universal — all AI agents read this)

Read `eradev/templates/AGENTS.md.template` and write it to `./AGENTS.md` at project root.
Replace `{PROJECT}` with the actual project name.
This file is read by: Codex, Jules, Cursor, Windsurf, Aider.

## Step 3: Create CLAUDE.md (Claude Code specific)

Read `eradev/templates/CLAUDE.md.template` and write it to `./CLAUDE.md` at project root.
Replace `{PROJECT}` with the actual project name.
Paths reference `eradev/` prefix (since eradev is a subfolder).

## Step 4: Create .cursorrules (Cursor)

Copy AGENTS.md to `.cursorrules`:
```bash
cp AGENTS.md .cursorrules
```

## Step 5: Create enforcement hooks (Claude Code + Windsurf)

```bash
mkdir -p .claude/hooks .windsurf
cp eradev/.claude/hooks/*.sh .claude/hooks/
chmod +x .claude/hooks/*.sh
cp eradev/.claude/settings.json .claude/settings.json
```

For Windsurf, create `.windsurf/hooks.json`:
```json
{"hooks":{"PreToolUse":[{"matcher":"Edit|Write|Bash","hooks":[{"type":"command","command":".claude/hooks/enforce-delegation.sh"}]},{"matcher":"Agent","hooks":[{"type":"command","command":".claude/hooks/agent-role-tag.sh"},{"type":"command","command":".claude/hooks/agent-context-check.sh"}]}]}}
```

## Step 6: Create project skeleton

```bash
mkdir -p projects/{PROJECT}
```

Create `projects/{PROJECT}/config.md`:
```
# {PROJECT} — EraDev Project Config
## True North
[Define direction here]
## Architecture
[Describe tech stack]
## Iron Rules
1. Self-application: apply EraDev processes to this project.
2. Bilingual sync: EN + RU files updated together (BL-19).
```

Create `projects/{PROJECT}/lessons.md`:
```
# {PROJECT} — Lessons & Patterns
```

## Step 7: Save to memory

Save two items to the agent's persistent memory:
- **META identity:** META-Orchestrator L9. 6 outputs: Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent. ALWAYS delegates. Hook blocks Edit/Write/diagnostic Bash from main session. Bash classification: operational (git, ls, cp) = direct, diagnostic (grep, curl, ssh) = delegate to [EXPLORE].
- **LOAD sequence:** AGENTS.md/CLAUDE.md auto-loads → eradev/eradev.md, meta.md, BOOTSTRAP_LESSONS.md, projects/{PROJECT}/config.md, lessons.md → Session Bootstrap (12 items) → KILL-TEST.

## Step 8: Confirmation

```
=== EraDev Deploy Complete ===
[x] eradev/ cloned/updated    [x] AGENTS.md (universal)
[x] CLAUDE.md (Claude Code)   [x] .cursorrules (Cursor)
[x] .claude/hooks/ (3 scripts) [x] .claude/settings.json
[x] .windsurf/hooks.json       [x] projects/{PROJECT}/
[x] Memory: META identity + LOAD sequence

Next: open a new session — META loads automatically.
Operator language: Russian. Agents: EN.
```

---

## Update EraDev (paste into existing session)

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
