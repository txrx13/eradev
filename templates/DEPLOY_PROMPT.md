# EraDev Universal Deploy Prompt

Paste this into ANY AI coding agent (Claude Code, Cursor, Codex, Jules, Windsurf).
The agent will set up EraDev framework in the current project.
{PROJECT} = basename of current working directory.

## Deploy Steps

Execute all steps sequentially:

1. **Clone or update EraDev.** If `eradev/` directory exists, run git pull inside it. If not, clone https://github.com/txrx13/eradev.git into `eradev/`.

2. **Create AGENTS.md.** Read `eradev/templates/AGENTS.md.template`, replace `{PROJECT}` with actual project name, save as `./AGENTS.md` at project root. This is the universal config read by all AI agents.

3. **Create CLAUDE.md.** Read `eradev/templates/CLAUDE.md.template`, replace `{PROJECT}` with actual project name, save as `./CLAUDE.md` at project root. This is Claude Code specific.

4. **Create .cursorrules.** Copy AGENTS.md content to `.cursorrules` at project root. Cursor reads this file.

5. **Create .windsurfrules.** Copy AGENTS.md content to `.windsurfrules` at project root. Windsurf reads this file.

6. **Install enforcement hooks.** Create `.claude/hooks/` directory. Copy all `.sh` files from `eradev/.claude/hooks/` into it. Make them executable. Copy `eradev/.claude/settings.json` to `.claude/settings.json`. Create `.windsurf/hooks.json` with the same hook configuration (PreToolUse matchers for Edit|Write|Bash and Agent).

7. **Create project skeleton.** Create `projects/{PROJECT}/` directory. Create `config.md` inside with sections: True North, Architecture, Iron Rules. Create `lessons.md` inside with header.

8. **Save to memory.** Save META identity to the agent's persistent memory: META-Orchestrator L9, 6 output types (Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent), Bash classification (operational vs diagnostic), LOAD sequence.

9. **Confirmation.** Output this checklist:

```
=== EraDev Deploy Complete ===
[x] eradev/ cloned/updated    [x] AGENTS.md (universal)
[x] CLAUDE.md (Claude Code)   [x] .cursorrules (Cursor)
[x] .windsurfrules (Windsurf)  [x] .claude/hooks/ (enforcement)
[x] .windsurf/hooks.json       [x] projects/{PROJECT}/
[x] Memory: META identity + LOAD sequence
Next: open new session — META loads automatically.
```

---

## Update EraDev (paste into existing session)

```
Обнови eradev инструкции:
1. cd eradev && git pull origin main && cd ..
2. Sync hooks: скопируй eradev/.claude/hooks/*.sh в .claude/hooks/, сделай executable
3. Sync settings: скопируй eradev/.claude/settings.json в .claude/settings.json
4. Прочитай eradev/CLAUDE.md — сверь 6 output types и 10 invariants
5. Прочитай eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md
6. Прочитай eradev/projects/{PROJECT}/config.md и lessons.md
7. Выведи SESSION BOOTSTRAP checklist из meta.md Section 14 (12 items)
8. Сохрани META identity (6 output types + Bash classification) в Claude Code memory

Далее продолжаем работу по текущим задачам.
```
