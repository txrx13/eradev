# EraDev Cross-Harness Requirements (v10)

> Version: v10 prototype
> Status: requirements spec only — no adapter implementation in v10
> Source: `reports/v10_theoretical_research_2026-04-12.md` Item 4 (Cross-Harness Parity)
> Rationale: document what ANY harness must provide for EraDev to operate at L5+

---

## Purpose

EraDev v10 runs exclusively in Claude Code. This document specifies what a harness
must provide for EraDev to operate at L5+ (META delegates via agents, RT-1 produces
independent multi-role perspectives). It is NOT a porting guide — it is a requirements
contract that any candidate harness can be evaluated against.

The value of EraDev IS the multi-agent Round Table protocol. A harness that supports
only single-agent execution reduces EraDev to L3 (self-check / Jidoka), which provides
minimal value over using the harness natively without EraDev.

**Key insight from v10 research:** no existing harness besides Claude Code supports L5+
without significant custom engineering. The Agent tool (spawn independent subagents with
role-specific prompts) is the structural prerequisite that all other harnesses lack.

---

## Architecture layers

EraDev has two layers with different portability characteristics:

**Layer A — Harness-specific (enforcement + orchestration):**
Mechanisms that depend on harness capabilities: auto-loading, hooks, agent spawning,
periodic execution, skills, memory persistence. This is ~30% by file count but includes
ALL enforcement — without it, BL-16 predicts Lambda = 0 (knowledge without enforcement).

**Layer B — Portable (pure Markdown, works anywhere):**
ODTOE core math, RT protocol, role definitions, domain skins, Bootstrap Lessons, project
configs, project lessons, meta protocol. This is ~70% by file count and constitutes the
intellectual content of EraDev. Layer B is 100% portable as-is.

This spec defines what Layer A requires from a harness.

---

## Minimum requirements (L5 — delegation works)

### R1: Agent spawning

The harness MUST allow spawning independent subprocesses with separate context windows.

**Functional requirements:**
- Each subprocess receives a text prompt and returns text output
- Subprocesses MUST start with a blank/fresh context (not shared with META's context)
- Parallel spawning MUST be supported — Invariant 13 requires independent agents to run simultaneously
- The prompt to each subprocess is the ONLY input — META does NOT pre-load role files into agent context
- Subprocesses must be able to call tools (Read, Write, Edit, Bash at minimum)

**Why non-negotiable:** RT-1 requires 5 independent role perspectives. Sequential role-playing in a single context produces anchoring bias: S_team=0.97 but S_adjusted=0.33 (eradev.md Section VI). BL-26: META ALWAYS delegates. The independence guarantee is structural, not prompt-based.

**Example:** Claude Code's `Agent` tool.

### R2: File system access

The harness MUST provide read and write access to the project directory.

**Functional requirements:**
- Read any file in the project tree (roles, templates, configs, lessons, framework files)
- Write/edit files (with appropriate permission controls)
- File search: glob patterns (e.g., `**/*.md`) and content search (grep/regex)
- Path resolution relative to project root

**Why non-negotiable:** Role self-loading (Invariant 12), domain skin loading, artifact production (Builder writes), verification (Validator reads), lesson writing.

### R3: Auto-loading project instructions

The harness MUST automatically load a project instruction file at session start.

**Functional requirements:**
- A designated file (like `CLAUDE.md`) is loaded into context before the first user message
- The file content becomes part of the system context, not a user message
- The file MUST be able to reference other files to be loaded (loading sequence)
- The auto-loaded file bootstraps META identity — without it, L5 collapses to L3

**Why non-negotiable:** META identity, 17 invariants, 6 output types, and mandatory loading sequence all bootstrap from this file. Without it, Lambda = 0 for cold starts.

**Examples:** Claude Code `CLAUDE.md`, Cursor `.cursorrules`, Codex system prompt.

### R4: Shell execution

The harness MUST allow running operational shell commands.

**Functional requirements:**
- Execute Bash commands: `git`, `ls`, `cp`, `mkdir`, `wc`, `zip`
- Capture stdout/stderr output
- Support command chaining (`&&`, `;`)
- Working directory persistence or explicit path support

**Why non-negotiable:** Commit cycles (`git add/commit/status`), verification (`wc -l`, `ls`), operational tasks (Invariant 10). SSH/DB/service management are diagnostic (L6+), not required for L5.

### R5: Session persistence

The harness MUST maintain context across conversation turns within a session.

**Functional requirements:**
- Variables, decisions, and state persist across turns in the same session
- META can reference earlier RT-1 outputs when making synthesis decisions
- Agent outputs from earlier turns are available for later agents to reference (via files)

**Why non-negotiable:** RT protocol spans multiple turns (RT-1 -> synthesis -> execution -> RT-3). META must remember the unified plan; Coherent needs prior outputs for S_team. Cross-session persistence (MEMORY.md, Omega) is L6+, not required for L5.

---

## Extended requirements (L6 — full RT works with enforcement)

### R6: Hook system

The harness SHOULD provide pre/post tool-use hooks (shell commands triggered by tool calls).

**Functional requirements:**
- Pre-tool-use hooks: run a shell script BEFORE a tool call executes
- The hook receives: tool name, tool arguments, agent context
- The hook can ALLOW or BLOCK the tool call
- Post-tool-use hooks: run a shell script AFTER a tool call completes

**Why this matters:** `enforce-delegation.sh` (BL-26), `agent-context-check.sh` (Invariant 12). Without hooks, enforcement is prompt-based only -- BL-16 risk (Lambda drift to zero). Acceptable for L5 prototype, insufficient for production.

### R7: Periodic execution

The harness SHOULD provide session-scoped recurring prompt execution.

**Functional requirements:**
- Schedule a prompt to run on a cron-like schedule within the session
- The scheduled prompt executes in a separate context (like an agent)
- Results are available to the main session

**Why this matters:** Background extraction (Phase 2.C) -- periodic mining for BL candidates. Without R7, extraction is manual-only (`/extract`). L5 and L6 are achievable without R7.

### R8: Skill registration (L7+)

The harness MAY provide a skill/command registration mechanism.
Register named commands (e.g., `/eradev`, `/extract`) with associated prompt files,
invocable from the chat interface. Without R8, EraDev works via direct prompting.
Skills are a UX improvement, not a structural dependency.

---

## Harness compatibility matrix

Assessment of existing harnesses against R1-R8 requirements.

```
Requirement    │ Claude Code │ Cursor      │ Windsurf    │ Codex (OpenAI) │ Gemini
───────────────┼─────────────┼─────────────┼─────────────┼────────────────┼──────────
R1 Agent spawn │ YES         │ NO          │ NO          │ PARTIAL        │ NO
               │ Agent tool  │ Composer is │ Single-ctx  │ API multi-turn │ No agent
               │             │ sequential  │ sequential  │ no isolation   │ tool
───────────────┼─────────────┼─────────────┼─────────────┼────────────────┼──────────
R2 File access │ YES         │ YES         │ YES         │ PARTIAL        │ PARTIAL
               │ Full local  │ Full local  │ Full local  │ Sandboxed      │ Limited
───────────────┼─────────────┼─────────────┼─────────────┼────────────────┼──────────
R3 Auto-load   │ YES         │ YES         │ YES         │ YES            │ PARTIAL
               │ CLAUDE.md   │ .cursorrules│ .windsurfrules │ System prompt│ System
               │             │             │             │                │ instruct.
───────────────┼─────────────┼─────────────┼─────────────┼────────────────┼──────────
R4 Shell exec  │ YES         │ YES         │ YES         │ PARTIAL        │ NO
               │ Bash tool   │ Terminal    │ Terminal    │ Sandboxed      │ No shell
───────────────┼─────────────┼─────────────┼─────────────┼────────────────┼──────────
R5 Session     │ YES         │ YES         │ YES         │ YES            │ YES
   persistence │ Full turn   │ Full turn   │ Full turn   │ Per-session    │ Per-session
───────────────┼─────────────┼─────────────┼─────────────┼────────────────┼──────────
R6 Hooks       │ YES         │ PARTIAL     │ NO          │ NO             │ NO
               │ PreToolUse  │ Rules (no   │             │                │
               │ PostToolUse │ block/allow)│             │                │
───────────────┼─────────────┼─────────────┼─────────────┼────────────────┼──────────
R7 Periodic    │ YES         │ NO          │ NO          │ NO             │ NO
   execution   │ CronCreate  │             │             │                │
───────────────┼─────────────┼─────────────┼─────────────┼────────────────┼──────────
R8 Skills      │ YES         │ NO          │ NO          │ NO             │ NO
               │ .claude/    │             │             │                │
               │ skills/     │             │             │                │
```

### Maximum achievable EraDev level per harness

```
Harness        │ Max Level │ Bottleneck                         │ Notes
───────────────┼───────────┼────────────────────────────────────┼──────────────────────
Claude Code    │ L9        │ None (current runtime)             │ Full support
Cursor         │ L3        │ R1: no independent agent spawning  │ Sequential role-play
               │           │ produces anchoring bias            │ workaround possible
Windsurf       │ L3        │ R1: no independent agent spawning  │ Same as Cursor
Codex (OpenAI) │ L3        │ R1: partial (API, no isolation)    │ Plus R4/R6 gaps
               │           │ R6: no hooks (BL-16 risk maximal)  │
Gemini         │ L3        │ R1: no agent tool                  │ Plus R4 gap
               │           │ R4: no shell execution             │
LangGraph      │ L6+       │ Custom engineering required        │ StateGraph provides
(custom)       │           │ for R3, R6, R7, R8                 │ R1 natively
```

---

## Design constraints for future adapters

When a harness eventually satisfies R1-R5 (L5 minimum), the adapter must respect:

### C1: Independence guarantee

Agent spawning MUST produce genuinely independent perspectives. The test:
- Spawn 5 agents with the same task but different role prompts
- Each agent MUST NOT have access to other agents' outputs during RT-1
- S_team computed from their outputs MUST be < 0.90 on non-trivial tasks
  (if S_team = 0.97+, the agents are anchoring on shared context)

### C2: Self-loading pattern

Agents MUST self-load their role files. META provides the path, the agent reads it.
META does NOT embed role file content in the agent prompt. This keeps META context
lean (Invariant 12) and ensures each agent has the full role file in its own context.

### C3: No content loss in translation

The adapter MUST NOT simplify, truncate, or summarize EraDev's Layer B content.
The full `eradev.md`, `meta.md`, role files, and domain skins must be loadable.
Harnesses with small context windows may not be viable.

### C4: Enforcement layering (BL-30)

The adapter SHOULD provide at least 2 enforcement layers:
1. Prompt-level (auto-loaded instructions) — always available (R3)
2. Mechanical (hooks or equivalent) — R6, needed for L6+

A single enforcement layer (prompt only) is acceptable for L5 prototype but
degrades to Lambda = 0 over extended operation (BL-16).

---

## Evaluation protocol

To evaluate a new harness: (1) R1 test -- spawn 3 agents with different prompts, verify independent outputs and no shared context leakage; (2) R2 test -- agent reads, modifies, re-reads a file; (3) R3 test -- start new session, verify auto-loaded content available without user action; (4) R4 test -- run `git status`, verify output captured; (5) R5 test -- set value in turn 1, reference in turn 3; (6) L5 integration -- run S-task (Builder + Validator) through full protocol; (7) L6 integration -- run M-task (5-role RT-1) through full protocol with synthesis and go/no-go gate.

---

## Changelog

| Version | Date | Change |
|---------|------|--------|
| v10-draft | 2026-04-12 | Initial requirements spec from v10 theoretical research |
