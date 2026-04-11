# RTK Analysis: Output-Side Token Compression

> Date: 2026-04-11
> Source: 1 [ANALYST] agent researching https://github.com/rtk-ai/rtk
> Scope: Identify what RTK adds beyond previous Top 5 borrows
> Status: SECOND-PASS RESEARCH (extends multi_agent_frameworks_comparison_2026-04-11.md)

---

## Executive Summary

**RTK (Rust Token Killer) is NOT a multi-agent framework.** It is a **single-binary Rust CLI proxy** that intercepts shell commands via PreToolUse hooks and compresses their output by 60-90% **before it reaches the LLM**.

This makes RTK **orthogonal** to all 10 frameworks analyzed previously — it stacks cleanly with any orchestration layer, including EraDev. RTK lives at the **shell→model boundary**; EraDev lives at the **user→orchestrator boundary**.

5 NEW borrows identified that do NOT overlap with the previous Top 5.

---

## What is RTK?

- **Type:** CLI proxy / output compressor (Rust binary)
- **Hook deployment:** PreToolUse rewrite — `git status` → `rtk git status`
- **Compression strategies:** 4 (smart filtering, grouping, truncation, deduplication)
- **Filter engine:** Two-tier — Rust modules + TOML DSL pipeline (8 stages: ANSI → regex → truncate → dedup → group)
- **Compound command awareness:** lexer-based state machine for `&&`, `||`, `|`
- **Failure recovery:** tee dump to `~/.local/share/rtk/tee/{epoch}_{slug}.log` — agent re-reads instead of re-runs
- **Telemetry:** SQLite at `~/.local/share/rtk/tracking.db` — token counts, savings %, exec time, 90-day retention
- **Performance:** <10ms startup, <5MB memory
- **Multi-harness:** 1 binary → 7 agents (Claude Code, Cursor, Cline, Windsurf, Codex, Copilot, OpenCode)

---

## NEW Borrows (Beyond Previous Top 5)

### NEW-1: Output-Side Token Compression — CRITICAL
**Impact:** CRITICAL (highest leverage, orthogonal to existing borrows)
**Cost:** ZERO (`rtk init -g` installs hook automatically)

**Mechanism:** PreToolUse hook transparently rewrites Bash commands. Filter engine compresses output 60-90% before it reaches LLM context.

**EraDev alignment:**
- Invariant 10 delegates diagnostic Bash to Check Agents
- Check Agents currently consume MASSIVE tool output (grep across project, psql query results, curl responses)
- RTK compresses at source — Check Agents operate on 5-10× less data
- **Stacks with borrow #2 (Sonnet vs Opus):** Sonnet Validator × compressed Bash = compounded cost reduction (~80% total vs current Opus + raw output)

**Why missed in previous Top 5:** Previous analysis focused on orchestration/memory layer; missed the shell-output compression layer entirely.

**Action:** Add `rtk init -g` to EraDev bootstrap (DEPLOY_PROMPT). Free, near-zero implementation.

---

### NEW-2: SQLite Telemetry Backbone — HIGH
**Impact:** HIGH (closes previously uncovered gap)
**Cost:** LOW-MEDIUM (PostToolUse hook → SQLite log)

**Mechanism:** SQLite database tracks per-command:
- `project_path`
- `tokens_in` / `tokens_out`
- `savings_pct`
- `exec_time_ms`
- `timestamp`

CLI: `rtk gain --graph`, `rtk session`, `rtk discover`. 90-day retention.

**EraDev alignment:**
- Closes "cross-session cost telemetry" gap from previous report
- BL-Budget currently requires manual merge — telemetry can auto-trigger merge when token spike detected
- Feeds Section 16 Meta-Reflection Triggers (currently has "context budget >60%" — could add "cost budget exceeded")

**Distinct from borrow #3 (background instinct extraction):**
- Borrow #3 captures **behavioral patterns** (tool call → action correlations)
- NEW-2 captures **numerical cost telemetry** (tokens, money, time)
- Both should be implemented; they answer different questions

---

### NEW-3: Tee Recovery Pattern — MEDIUM
**Impact:** MEDIUM (attacks BL-3 root cause)
**Cost:** LOW (PostToolUse hook dump on failure)

**Mechanism:** When command fails, raw uncompressed output is dumped to `tee/{epoch}_{slug}.log`. Agent reads the file instead of re-running the command.

**EraDev alignment:**
- BL-3: Fix chain ≥3 = STOP. Why do fix chains happen?
- Builder re-runs commands because compressed/lost output forces fresh data fetch
- Tee preserves raw output for forensics — Builder reads instead of re-running
- Fewer re-runs → fewer fix chains → fewer Andon triggers
- **Root cause attack on BL-3, not just enforcement of it**

**Implementation:** PostToolUse hook checks exit code; on failure, dumps tool output to `projects/{name}/tee/` directory.

---

### NEW-4: Compound Command Lexer — MEDIUM
**Impact:** MEDIUM (closes Invariant 10 hole)
**Cost:** LOW (rewrite hook regex → token-aware lexer)

**Mechanism:** Lexer-based state machine tokenizes shell commands, splitting on `&&`, `||`, `|`, handling env prefixes, redirects, special cases.

**EraDev alignment:**
- Current Invariant 10 hook (`enforce-delegation.sh`) classifies by FIRST token
- Command `git status && grep ERROR build.log` currently passes as "operational git"
- BUT the `grep` segment is **diagnostic** and should route to Check Agent
- Lexer parses segments → applies classification per segment
- Either: block whole command if ANY segment is diagnostic, or rewrite to delegate diagnostic segment

**Distinct from borrow #1 (tool-scoped permissions):** That works at **role level**, this works at **command-segment level**.

---

### NEW-5: Canonical Parser Types — LOW-MEDIUM
**Impact:** LOW-MEDIUM
**Cost:** MEDIUM

**Mechanism:** Unified output structures (`TestResult`, `LintResult`) with 3-tier format modes — normalizes output across cargo/pytest/npm/go test/etc.

**EraDev alignment:**
- Validator currently outputs narrative markdown
- Canonical types → structured event log (partially overlaps with previous honorable mention #6)
- Lower priority than other 4 borrows

---

## Risks / Limitations of RTK

1. **RTK only intercepts Bash tool** — Read/Grep/Glob (Claude Code native) bypass the hook. EraDev primarily uses Read/Grep/Glob → RTK covers only diagnostic Bash subset.
2. **Not a framework** — no orchestration, no roles, no coherence. Cannot replace EraDev; only complement.
3. **Rust-only binary** — pre-built platform targets, no Python/Node alternative.
4. **Static filters** — no learning, no context-aware adaptation. Long markdown reports may not benefit from stock filters.
5. **Char÷4 token estimation crude** — real Claude tokenizer differs.
6. **SQLite local-only** — no cross-machine aggregation.
7. **90-day retention hardcoded** — may conflict with EraDev BL historical analysis.
8. **`Read/Grep/Glob` blind spot is significant** — most EraDev tool calls bypass RTK. Mitigation: hook diagnostic Bash specifically.

---

## Updated Phase 1 Roadmap

**Old order:**
1. Tool-scoped permissions
2. Model-per-role
3. Hook profiles

**New order (with RTK):**

| # | Item | Impact | Cost | Rationale |
|---|------|--------|------|-----------|
| 1 | Tool-scoped permissions | HIGH | LOW | Foundation — structural role enforcement |
| 2 | Model-per-role | HIGH | LOW | Cost reduction |
| **3** | **RTK binary install** | **CRITICAL** | **ZERO** | **Free, orthogonal, compounds with #2** |
| 4 | Hook profiles | MEDIUM | LOW | Operator-tunable enforcement |

**Compounded effect:**
- #2 alone: ~40-60% cost reduction
- #2 + RTK: ~80% cost reduction (Sonnet × compressed output)
- All Phase 1: structural enforcement + cost optimization + free compression

---

## Phase 2 Updates

Add to Phase 2:
- **NEW-2 (SQLite Telemetry)** — alongside background instinct extraction
- **NEW-3 (Tee Recovery)** — attacks BL-3 root cause
- **NEW-4 (Compound Command Lexer)** — rewrite Invariant 10 hook with token-aware parsing

Phase 2 grows from 2 to 5 items. Still ~1-2 days total work.

---

## Critical Insight

**RTK and EraDev are non-overlapping and complementary.**

RTK is the **Cisco of LLM** — invisible infrastructure that compresses bandwidth without changing the application layer. EraDev is the **Kubernetes of LLM** — orchestration, role management, lifecycle control.

You can run EraDev without RTK (current state). You can run RTK without EraDev (single-agent harness with compressed output). Running both = orchestration + free compression.

**Recommendation:** Adopt RTK in Phase 1 alongside other quick wins. Zero implementation cost, critical impact for diagnostic agents.

---

## Source Report

Spawned [ANALYST] agent B-check: F=0.85 E=0.90 (1-σ)=0.85 Λ=0.80 → **B=0.520** (above threshold, no Andon)

Self-loading architecture confirmed working — agent successfully Read `roles/analyst_EN.md`, applied Activation Operator, consulted lessons.md (referenced BL-22, BL-16, EMP5, EMP6 in report).

---

## References

- [rtk-ai/rtk GitHub](https://github.com/rtk-ai/rtk)
- [rtk-ai/rtk CLAUDE.md](https://github.com/rtk-ai/rtk/blob/master/CLAUDE.md)
- [rtk-ai/rtk TECHNICAL.md](https://github.com/rtk-ai/rtk/blob/master/docs/contributing/TECHNICAL.md)
- [rtk official site](https://www.rtk-ai.app/)
- [Previous comparison report](multi_agent_frameworks_comparison_2026-04-11.md)
