# v9 Phase 2.C -- Background Instinct Extraction Specification

> Date: 2026-04-12
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> Task type: design / specification / framework infrastructure
> B-modality: **B_text** (uniform weights 0.25 each -- framework infrastructure)
> Output type: Report (META output #5) -- spec for Builder implementation
> Scope: Background Instinct Extraction system for EraDev v9 (spec only, no implementation)
> Preceded by: roadmap_v9_2026-04-11.md Phase 2.C definition; v9_phase2b_memory_hierarchy_spec_2026-04-12.md (BL_CANDIDATES.md staging area); BOOTSTRAP_LESSONS.md BL-16 (knowledge without enforcement = Lambda zero)
> Depends on: Phase 2.B (BL_CANDIDATES.md file must exist as landing pad)

---

## 0. Activation Operator Log

- **A_F (Focus):** Read in full: `roles/analyst_EN.md` (mission + activation + jidoka); `CLAUDE.md` (14 invariants, domain awareness, 6-step loading, hooks architecture); `BOOTSTRAP_LESSONS.md` (30 BL, BL-16 target problem); `projects/eradev/lessons.md` (32 lessons + 11 EMPs); `reports/roadmap_v9_2026-04-11.md` (Phase 2.C: PostToolUse hook -> background Haiku agent -> instinct extraction, solves BL-16 structurally); `reports/v9_phase2b_memory_hierarchy_spec_2026-04-12.md` (BL_CANDIDATES.md staging area with CAND-N format, compression at count >= 5); `.claude/settings.json` (current hook config: PreToolUse for Edit/Write/Bash/Agent); `.claude/hooks/` (3 scripts: enforce-delegation.sh, agent-role-tag.sh, agent-context-check.sh -- all PreToolUse hooks); `.claude/settings.local.json` (permissions allow list). Verified: no PostToolUse hooks exist today. CronCreate is available as session-scoped prompt scheduler. mcp__scheduled-tasks tools available for cross-session persistence.

- **A_E (Alignment):** META's task: produce a specification for Background Instinct Extraction that a Builder can implement in one pass. The spec must be REALISTIC about Claude Code capabilities -- specifically: (1) hooks run shell commands, not agent prompts; (2) CronCreate enqueues prompts but is session-scoped and fires only while REPL is idle; (3) scheduled-tasks MCP tool persists across sessions but creates new Claude sessions. The system must solve BL-16 (knowledge -> application gap) by automatically extracting patterns from work sessions into BL_CANDIDATES.md. Intent is a lightweight, low-cost background process, not a heavyweight analysis framework.

- **A_sigma (Consistency):** Checked for conflicts:
  - Phase 2.B defines `BL_CANDIDATES.md` at repo root with CAND-N format. This spec writes TO that file. No ownership conflict -- Phase 2.B defines the schema, Phase 2.C defines one producer.
  - Existing hooks are all PreToolUse. Phase 2.C could add PostToolUse hooks (shell scripts) but these cannot invoke agent prompts directly. CronCreate is the alternative that CAN invoke prompts.
  - `projects/eradev/lessons.md` is modified by Hansei reflections (manual). Phase 2.C writes to BL_CANDIDATES.md (staging), not directly to lessons.md. No write conflict.
  - `enforce-delegation.sh` blocks META from diagnostic Bash. Extraction agent runs as a sub-agent (has agent_id) so this hook does not block it. However, the extraction agent itself should NOT run Bash -- see safety guardrails.
  - CronCreate jobs are session-scoped -- they die when Claude exits. This is a feature, not a bug: extraction is session-bound, not persistent. If the session ends, the extraction job ends cleanly.
  - scheduled-tasks MCP tool creates tasks that survive session restarts. However, it spawns NEW sessions for each run, which means the extraction prompt would run without session context. This makes it unsuitable for "extract from current session" but potentially useful for "periodic review of BL_CANDIDATES.md".

- **A_Lambda (Experience):** Applied:
  - BL-16 (reading the framework != applying it): the CORE problem this spec solves. Extraction must convert tacit session knowledge into explicit BL candidates automatically.
  - BL-30 (defense-in-depth): extraction should have multiple trigger points, not a single mechanism.
  - BL-11 (scope creep is Muda): the extraction agent must be tightly constrained. No sub-agent spawning, no Bash, no framework file modification.
  - BL-31 (constrain output types to constrain behavior): the extraction agent produces EXACTLY one output type: BL_CANDIDATES.md entries.
  - EMP6 (enforcement without mechanism is Lambda zero, recursively): the extraction mechanism IS the enforcement -- it catches patterns that should become rules before they evaporate.
  - Lesson 14 (BL budget requires active merge, not just append): extraction is append-only TO THE STAGING FILE. Compression is Phase 2.B's Coherent responsibility, triggered at count >= 5.
  - EMP4 (enforcement must live where it fires): the extraction fires where work happens (during the session), not after (during Hansei).

All 4 Activation Operator steps GREEN. Proceeding with specification.

---

## 1. Architecture Overview

### 1.1 Problem Statement

Three gaps exist between work execution and institutional memory:

| Gap | Description | Current state | Impact |
|-----|-------------|---------------|--------|
| **Latency** | Insights captured only at session end (Hansei) | If session is cut short (rate limit, timeout), insights are lost | Lambda stagnation despite productive sessions |
| **Coverage** | Micro-insights during work never reach lessons.md | Too small for formal lesson entry, evaporate at session end | Tacit knowledge never becomes institutional |
| **BL-16 recursion** | New patterns emerge during work that SHOULD become rules | Wait for human to notice and write them | The system that enforces rules cannot auto-generate new rules |

### 1.2 Solution Architecture

```
                    DURING SESSION
                    ==============

    Agent completes work ───> Session context grows
                                     |
                        ┌────────────┘
                        v
              ┌─────────────────────┐
              │  CronCreate job     │
              │  (fires every 30m   │
              │   while REPL idle)  │
              │                     │
              │  Prompt reads:      │
              │  - Recent messages  │
              │  - Current lessons  │
              │  - Current BL       │
              │                     │
              │  Produces:          │
              │  - CAND-N entries   │
              │  - Writes to        │
              │    BL_CANDIDATES.md │
              └─────────────────────┘
                        |
           ┌────────────┘
           v
    BL_CANDIDATES.md (Phase 2.B staging file)
           |
           v (when count >= 5)
    Coherent compression pass (Phase 2.B)
           |
           v
    BOOTSTRAP_LESSONS.md (promoted) or DISCARD
```

### 1.3 Key Design Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| **Trigger mechanism** | CronCreate (session-scoped prompt scheduler) | Only mechanism in Claude Code that can enqueue prompts. Hooks run shell scripts and cannot invoke agents. |
| **Extraction agent** | Current model (same as session) via CronCreate prompt | CronCreate does not support model selection. The prompt runs in the current session's model. No Haiku/Sonnet choice available. |
| **Output destination** | `BL_CANDIDATES.md` at repo root | Phase 2.B defines this as the staging area. Extraction is one producer; Coherent compression is the consumer. |
| **Extraction frequency** | Every 30 minutes while REPL is idle | Balance between coverage (catching patterns) and cost (token usage). See Section 5 for cost model. |
| **Session scope** | Session-scoped only (CronCreate dies with session) | This is correct: extraction captures session-specific patterns. Cross-session persistence is Phase 2.B's Coherent responsibility. |
| **Extraction depth** | Shallow: read BL_CANDIDATES.md + lessons.md + last few tool results | Deep context reading is expensive and slow. Shallow extraction with frequent triggers catches more than deep extraction with rare triggers. |

### 1.4 What the Roadmap Proposed vs What Is Feasible

| Roadmap (aspirational) | Feasible (spec) | Gap analysis |
|------------------------|-----------------|--------------|
| PostToolUse hook -> background Haiku agent | CronCreate periodic prompt (current model) | Hooks run shell scripts, not agents. CronCreate runs prompts but uses the current model, not Haiku. No model selection API for CronCreate. |
| Background agent runs after every tool use | Periodic sweep every 30 minutes | Per-tool-use is too frequent (hundreds of triggers per session) and hooks cannot invoke prompts. Periodic sweep is implementable and cheaper. |
| Instinct extraction | BL candidate extraction | "Instinct" implies deep behavioral analysis. BL candidate extraction is concrete and implementable: compare recent work against known BL, identify gaps. |

**Honest assessment:** The roadmap's vision of a PostToolUse Haiku agent is not implementable with current Claude Code architecture. What IS implementable: a CronCreate job that periodically reads recent context and writes BL candidates. This achieves the same goal (BL-16 structural solution) via a different mechanism. An additional manual trigger (`/extract` skill command) supplements the automatic sweep.

---

## 2. Extraction Triggers

### 2.1 Trigger Comparison

| Trigger | Mechanism | Pro | Con | Cost per session |
|---------|-----------|-----|-----|-----------------|
| PostToolUse hook -> shell script | `.claude/settings.json` hook | Fires after every tool | Shell cannot invoke agent prompts; can only write static text | N/A (infeasible for extraction) |
| PostToolUse hook -> `claude` CLI | Shell script calls `claude --print` | Could invoke extraction prompt | Spawns external process; no access to session context; adds latency to every tool call; `claude` CLI availability not guaranteed | HIGH (hundreds of CLI calls) |
| CronCreate periodic (30 min) | `CronCreate` tool at session start | Prompt runs in session context; fires while REPL idle; session-scoped (clean lifecycle) | Fires only while idle (not during active work); limited to ~7 day auto-expiry; small jitter | LOW (4-8 per session) |
| Post-commit hook | `.githooks/pre-commit` or PostToolUse on Bash git-commit | Natural breakpoint; meaningful work just completed | Shell-only; cannot read session context; git hook runs outside Claude | N/A (no session context) |
| Manual `/extract` skill | Skill tool invocation | Operator-controlled; no cost when not used; full session context | Requires operator to remember to invoke; does not solve the "automatic" aspect | ZERO (on-demand) |
| Scheduled task (MCP) | `mcp__scheduled-tasks__create_scheduled_task` | Persists across sessions; survives restarts | Spawns NEW session with no prior context; cannot extract from current session; useful for periodic BL_CANDIDATES.md review, not for extraction | LOW per run, but useless for extraction |

### 2.2 Recommended Combination

**Primary: CronCreate periodic sweep (every 30 minutes)**

The CronCreate tool enqueues a prompt that fires while the REPL is idle. This is the only mechanism in Claude Code that can:
- Run a prompt (not just a shell command)
- Access session context (recent messages, tool results)
- Write to files (BL_CANDIDATES.md via the prompt's tool access)
- Self-clean (session-scoped, auto-expires after 7 days)

The 30-minute interval balances coverage vs cost. A typical 2-4 hour session produces 4-8 extraction sweeps. Each sweep captures patterns from the preceding 30 minutes of work.

**Secondary: Manual `/extract` skill command**

Operator invokes `/extract` when they observe a pattern worth capturing, or at session end before context evaporates. This is the safety net for sessions that are too short for a 30-minute cron to fire. The skill runs the same extraction prompt as the CronCreate job but on demand.

**Tertiary: Scheduled task for BL_CANDIDATES.md review (cross-session)**

A scheduled task runs daily to check if BL_CANDIDATES.md has accumulated >= 5 candidates. If so, it notifies the operator that a Coherent compression pass is due. This does NOT do extraction -- it is a reminder to run Phase 2.B compression. This is the only cross-session component.

### 2.3 What We Explicitly Do NOT Recommend

- **PostToolUse hook for extraction:** Hooks run shell commands. A shell command cannot read session context, run an agent prompt, or access the conversation history. Using `claude` CLI from a hook would spawn a separate process with no session context, defeating the purpose.
- **Per-tool-use frequency:** Even if technically possible, firing extraction after every tool use (potentially hundreds per session) would overwhelm cost budgets and produce noise.
- **Haiku model specifically:** CronCreate does not support model selection. The prompt runs under whatever model the session uses. If future Claude Code versions add model selection to CronCreate, Haiku would be the recommended model for extraction (cost-optimized for simple pattern matching).

---

## 3. Extraction Agent Prompt

### 3.1 Prompt Template

The CronCreate job enqueues the following prompt. When the prompt fires (REPL idle), Claude processes it as a regular message with full tool access.

```
BACKGROUND EXTRACTION: You are performing a background instinct extraction sweep.
This is an automated periodic task, not a user request.

## Rules (non-negotiable)
1. You MUST NOT modify any file except BL_CANDIDATES.md.
2. You MUST NOT spawn sub-agents (no Agent tool).
3. You MUST NOT run Bash commands.
4. You MUST NOT access network resources.
5. You MUST produce at most 1 candidate per sweep (quality over quantity).
6. You MUST complete in under 30 seconds of wall-clock processing.
7. If you find nothing worth extracting, respond with "EXTRACTION: no new candidates" and STOP.

## Process
1. Read `/Users/antonpankratov/Downloads/eradev/BL_CANDIDATES.md` to see existing candidates and current count.
2. Read `/Users/antonpankratov/Downloads/eradev/BOOTSTRAP_LESSONS.md` to know the current 30 BL entries.
3. Reflect on the work done in this session since the last extraction sweep.
   Consider: What patterns emerged? What mistakes were caught? What rules were followed or violated?
   Focus on: failure modes, enforcement gaps, process improvements -- NOT content-specific details.
4. Compare your observations against the existing 30 BL:
   a. REINFORCEMENT: Did this session's work confirm an existing BL? (Log but do not write a candidate.)
   b. DRIFT: Did this session's work violate an existing BL in a way that reveals a gap? (Candidate.)
   c. NOVEL: Did a new pattern emerge that no existing BL covers? (Candidate.)
5. If you identified a candidate (DRIFT or NOVEL):
   a. Check: does any existing CAND-N in BL_CANDIDATES.md already cover this? If yes, STOP.
   b. Write the candidate to BL_CANDIDATES.md using the Edit tool. Follow this format EXACTLY:

### CAND-{N+1}: {title}
**Source:** Background extraction, session {date}
**Proposed rule:** {1-2 sentence rule, same format as existing BL entries}
**Overlap check:** Does BL-{nearest} already cover this? {Y with amendment / N}
**Date:** {ISO date}

   c. Update the "Current count:" line in BL_CANDIDATES.md header.
6. Respond with "EXTRACTION: [wrote CAND-N: {title}]" or "EXTRACTION: no new candidates".
```

### 3.2 Prompt Design Rationale

| Design choice | Rationale |
|---------------|-----------|
| "at most 1 candidate per sweep" | Prevents noise. 4-8 sweeps per session, each producing at most 1 candidate = 4-8 candidates max per session. Phase 2.B compression triggers at 5. |
| "reflect on the work done in this session" | CronCreate prompts fire in the session context -- the model has access to the conversation history. This is the key advantage over hooks. |
| "do not write reinforcement" | A BL that was followed correctly is not news. Only gaps and novel patterns warrant candidates. |
| Explicit file paths | The extraction agent runs as a prompt in the current session. It needs exact paths, not relative references. |
| "complete in under 30 seconds" | Budget constraint. The extraction should not block the operator or consume significant tokens. |

### 3.3 Path Parameterization

The prompt template contains hardcoded paths (`/Users/antonpankratov/Downloads/eradev/`). The Builder MUST parameterize this when implementing:

- Read the project root from the session context (pwd or equivalent).
- Substitute into the prompt template before passing to CronCreate.
- The `/extract` skill should detect the project root dynamically.

---

## 4. Integration with Phase 2.B Memory Hierarchy

### 4.1 BL_CANDIDATES.md as Landing Pad

Phase 2.B defines `BL_CANDIDATES.md` at repo root with this schema:

```markdown
# BL Candidates (staging)

> These are candidate BL entries awaiting the next compression pass.
> Compression triggers when count >= 5.
> Current count: N

### CAND-1: {title}
**Source:** {report or session}
**Proposed rule:** {rule}
**Overlap check:** Does BL-{N} already cover this? Y/N
**Date:** {ISO date}
```

Phase 2.C adds one field to candidates it produces:

```markdown
### CAND-N: {title}
**Source:** Background extraction, session {date}
**Proposed rule:** {rule}
**Overlap check:** Does BL-{N} already cover this? Y/N
**Date:** {ISO date}
**Extraction type:** DRIFT | NOVEL
```

The `Extraction type` field distinguishes candidates that reveal enforcement gaps in existing BL (DRIFT) from entirely new patterns (NOVEL). This helps the Coherent during compression: DRIFT candidates are more likely to merge into existing BL as amendments; NOVEL candidates are more likely to become new BL entries (requiring a merge to free a slot per the 30-cap budget).

### 4.2 Temporal Metadata

- `valid_from`: automatically set to the extraction timestamp (ISO date).
- Phase 2.B's temporal triples apply to candidates that are promoted to lessons or BL. Extraction candidates inherit the extraction date as their `valid_from`.

### 4.3 Cross-Project Tagging

- Extraction candidates are auto-tagged with the current project name (read from `projects/{PROJECT}/config.md` or from the session's project context).
- Cross-project relevance (`cross_project: true/false`) is NOT auto-determined by extraction. The Coherent makes this judgment during compression, per Phase 2.B Section 6.2 criteria.

### 4.4 Compression Trigger

Phase 2.B specifies: compression triggers when `BL_CANDIDATES.md` count >= 5.

Phase 2.C's contribution:
- After each successful extraction (CAND written), the extraction agent updates the "Current count" header.
- The daily scheduled task (Section 2.2 tertiary trigger) checks if count >= 5 and notifies the operator.
- Actual compression is Phase 2.B's Coherent responsibility. Phase 2.C does NOT compress.

---

## 5. Cost Model

### 5.1 Per-Extraction Token Estimate

| Component | Input tokens | Output tokens | Notes |
|-----------|-------------|---------------|-------|
| Extraction prompt | ~500 | -- | The template itself |
| BL_CANDIDATES.md read | ~200-500 | -- | Depends on accumulated candidates |
| BOOTSTRAP_LESSONS.md read | ~4000 | -- | Full 30 BL entries |
| Session context reflection | ~0 (implicit) | -- | Model already has session context |
| Candidate output (if any) | -- | ~100-200 | CAND entry + status message |
| "No candidates" output | -- | ~10 | Just the status message |
| **Total per extraction** | **~4700-5000** | **~10-200** | |

### 5.2 Per-Session Frequency

| Session length | Extractions (30 min interval) | Total input tokens | Total output tokens |
|----------------|-------------------------------|--------------------|--------------------|
| 1 hour | 2 | ~10,000 | ~20-400 |
| 2 hours | 4 | ~20,000 | ~40-800 |
| 4 hours | 8 | ~40,000 | ~80-1600 |
| 8 hours | 16 | ~80,000 | ~160-3200 |

### 5.3 Cost Comparison by Model (Hypothetical)

CronCreate currently runs prompts under the session's active model. This table is informational for when/if model selection becomes available:

| Model | Input cost per 1M tokens | Output cost per 1M tokens | Cost per extraction | Cost per 4h session (8 extractions) |
|-------|-------------------------|--------------------------|--------------------|------------------------------------|
| Haiku (claude-3-5-haiku) | $0.80 | $4.00 | ~$0.004 + ~$0.001 = $0.005 | ~$0.04 |
| Sonnet (claude-sonnet-4) | $3.00 | $15.00 | ~$0.015 + ~$0.003 = $0.018 | ~$0.14 |
| Opus (claude-opus-4) | $15.00 | $75.00 | ~$0.075 + ~$0.015 = $0.090 | ~$0.72 |

### 5.4 Cost-Benefit Analysis

**Comparison with current manual extraction:**
- Manual Hansei at session end: 1 reflection per session, produces 3-5 lessons.
- Typical cost of manual Hansei: 10,000-20,000 input tokens + 2,000-5,000 output tokens (more thorough but infrequent).
- Background extraction at 30 min intervals over 4 hours: 8 extractions, each much cheaper individually, catching patterns that would be forgotten by Hansei time.

**Break-even question:** Is one additional BL candidate (that would have been lost) worth $0.04-$0.72 per session?

Answer: YES for any model. A single BL entry that prevents a fix chain (BL-3: fix chain > 3 = structural problem) saves 5-10 commits of rework. At Opus prices, 1 session of background extraction costs $0.72. A single prevented fix chain saves 30-60 minutes of agent time. The economics are strongly favorable.

### 5.5 Recommended Configuration

- **Model:** Whatever the session runs (currently no choice). When model selection becomes available: Haiku for extraction, Opus for real work.
- **Frequency:** 30-minute intervals. Not shorter (cost), not longer (latency gap).
- **Budget cap:** If BL_CANDIDATES.md already has >= 10 candidates (2x the compression trigger), skip extraction until compression runs. This prevents unbounded accumulation.

---

## 6. Safety Guardrails

### 6.1 Extraction Agent Constraints (Enforced by Prompt)

| Constraint | Enforcement mechanism | What prevents violation |
|------------|----------------------|------------------------|
| MUST NOT modify files except BL_CANDIDATES.md | Prompt instruction + existing `enforce-delegation.sh` hook (if extraction runs as main session prompt, the hook allows Write to `BL_CANDIDATES.md` since it matches the reports/lessons whitelist pattern -- but BL_CANDIDATES.md is at repo root, NOT in reports/. See 6.2.) | Prompt-only enforcement (soft). See 6.2 for hardening. |
| MUST NOT spawn sub-agents | Prompt instruction | Prompt-only (soft). CronCreate prompts run in the main session, which has hook enforcement. The `agent-role-tag.sh` hook would block any Agent call without a [ROLE] tag, providing a secondary gate. |
| MUST NOT run Bash commands | Prompt instruction | Prompt-only (soft). If extraction runs as main session, `enforce-delegation.sh` classifies diagnostic Bash as blocked for main session. However, operational Bash (ls, git) would still be allowed. |
| MUST NOT access network | Prompt instruction | Prompt-only (soft). No hook blocks WebFetch/WebSearch for main session. |
| At most 1 candidate per sweep | Prompt instruction | Prompt-only (soft). |
| Complete in under 30 seconds | Prompt instruction (advisory) | No enforcement mechanism exists. CronCreate does not impose time limits on prompts. |

### 6.2 Enforcement Hardening

The extraction agent runs as a CronCreate-enqueued prompt in the main session. This means it has FULL tool access -- the same as the operator. The constraints in Section 6.1 are prompt-based (soft).

**Hardening option A: PostToolUse hook for extraction context detection**

Add a PostToolUse hook (shell script) that detects if the current action was triggered by an extraction prompt (by checking for a sentinel marker in the session context) and blocks non-BL_CANDIDATES.md writes. This is technically possible but fragile -- hooks cannot reliably detect "which prompt triggered this tool call."

**Hardening option B: Write-path enforcement in enforce-delegation.sh**

Extend `enforce-delegation.sh` to allow main session Write to `BL_CANDIDATES.md` specifically. Currently, the whitelist allows `/reports/*.md`, `/projects/*/lessons.md`, `/memory/*.md`, and `/MEMORY.md`. Adding `BL_CANDIDATES.md` to the whitelist is a one-line change.

**Recommendation: Option B + prompt constraints.**

The extraction prompt's soft constraints are sufficient for v9. The main risk is not malicious violation (the extraction agent IS the session model) but accidental scope creep (extraction agent decides to "help" by fixing a file it read). The prompt explicitly says "MUST NOT modify any file except BL_CANDIDATES.md" which provides adequate protection for an automated background task.

The only hard enforcement needed: ensure `enforce-delegation.sh` whitelist includes `BL_CANDIDATES.md` so the extraction CAN write to it. Currently, a Write to `/Users/antonpankratov/Downloads/eradev/BL_CANDIDATES.md` would be BLOCKED by `enforce-delegation.sh` because the path does not match any existing whitelist pattern. This is a Phase 2.C implementation requirement.

### 6.3 Candidate Review Gate

Extraction results are CANDIDATES, not auto-promoted entries. The promotion path:

```
BL_CANDIDATES.md (extraction writes here)
       |
       v  (count >= 5)
Coherent compression pass (Phase 2.B)
       |
       ├──> Merge into existing BL (DRIFT candidates)
       ├──> New BL entry (NOVEL candidates, requires merge to free slot)
       └──> DISCARD (noise, duplicates, contradictions)
```

No extraction candidate is auto-promoted to BOOTSTRAP_LESSONS.md or lessons.md. Human/META review via Coherent compression is the gate.

---

## 7. Failure Modes

### FM-1: False Positive (Contradictory Candidate)

**Description:** Extraction produces a CAND that contradicts an existing BL. Example: extraction observes META doing a quick grep and proposes "META should be allowed to run diagnostic Bash directly" -- contradicting BL-26.

**Detection:** Overlap check in the CAND format asks "Does BL-{N} already cover this?" A candidate that says "Y, but proposes a different rule" is a contradiction signal.

**Mitigation:** The Coherent compression pass must cross-check each CAND against all 30 BL. Contradictory CANDs are DISCARDED with a note: "Contradicts BL-N, discarded at compression." If the contradiction reveals a genuine tension, it becomes an Open Question, not a BL amendment.

**Severity:** LOW. The staging area (BL_CANDIDATES.md) is inert. A bad candidate sitting in staging harms nothing until promoted.

### FM-2: Noise (Trivial Observations)

**Description:** Extraction produces trivial observations on every sweep. Example: "Builder read the file before editing" (this is just BL-6 being followed, not an insight).

**Detection:** Extraction prompt explicitly instructs: "do not write reinforcement." If the agent follows this, noise is filtered at source. If it does not, the Coherent discards trivial CANDs during compression.

**Mitigation:** If noise rate exceeds 80% (4+ trivial CANDs out of 5 at compression trigger), increase the extraction interval from 30 to 60 minutes and add a stronger prompt instruction: "A candidate must describe a FAILURE MODE, not a success observation."

**Severity:** LOW. Noisy candidates waste Coherent time during compression but do not corrupt the BL.

### FM-3: Cost Runaway

**Description:** Extraction agent uses more tokens than the actual work. Example: a session with minimal agent work (operator reading docs) still fires 8 extraction sweeps, each reading 5000 tokens of BL for no reason.

**Detection:** If the extraction prompt fires and finds no recent agent work since the last sweep, it should immediately return "EXTRACTION: no new candidates" with minimal token usage (~500 input + 10 output).

**Mitigation:** The extraction prompt's step 3 says "reflect on the work done since the last extraction sweep." If no work was done (no agent calls, no commits, no edits), the reflection is empty and the prompt exits early. Cost is dominated by BL read (~4000 tokens) -- to reduce this, the prompt could skip the full BL read if no work was done. Implementation: add step 0: "If no Agent, Edit, Write, or Bash tools have been used since the last extraction, respond 'EXTRACTION: idle session, skipping' and STOP."

**Severity:** MEDIUM. Without the idle-session optimization, cost during idle sessions is wasted. With the optimization, cost drops to ~500 tokens per idle sweep.

### FM-4: Privacy (Sensitive Information Capture)

**Description:** Extraction captures sensitive info from tool results into BL_CANDIDATES.md. Example: a Builder reads a config file with API keys, and the extraction agent includes the key in a CAND entry.

**Detection:** Extraction prompt focuses on PROCESS patterns ("failure modes, enforcement gaps, process improvements"), not CONTENT details. The instruction "NOT content-specific details" is the primary filter.

**Mitigation:** The extraction prompt explicitly says: "Focus on: failure modes, enforcement gaps, process improvements -- NOT content-specific details." If a CAND contains what appears to be a secret (API key pattern, password, token), the Coherent MUST redact it before promotion. BL_CANDIDATES.md is version-controlled in the repo -- any secret written there is permanently in git history.

**Severity:** HIGH for code projects with secrets. LOW for framework projects like eradev. For code projects, the extraction prompt should include: "NEVER include API keys, passwords, tokens, or file content in candidate entries. Describe the PATTERN, not the DATA."

### FM-5: CronCreate Lifecycle Mismatch

**Description:** CronCreate jobs auto-expire after 7 days. For sessions longer than 7 days (unlikely but possible), extraction stops silently.

**Detection:** CronCreate returns a job ID. The session could track this and re-create if expired. However, 7-day sessions are outside normal operating range.

**Mitigation:** Document the 7-day limit. If the operator runs sessions longer than 7 days, they should manually re-invoke the session bootstrap (which re-creates the CronCreate job). This is an edge case not worth engineering around.

**Severity:** LOW. 7-day sessions are abnormal.

### FM-6: Extraction During Sensitive Operations

**Description:** CronCreate fires during a complex multi-step operation (e.g., mid-RT-1 with 5 agents pending). The extraction prompt interrupts the workflow by reading/writing files.

**Detection:** CronCreate fires only while the REPL is idle (no active query being processed). This means extraction CANNOT interrupt mid-agent-call or mid-tool-use. It fires BETWEEN user messages, when nothing else is running.

**Mitigation:** CronCreate's idle-only firing is the mitigation. No additional engineering needed.

**Severity:** LOW (mitigated by CronCreate's built-in behavior).

---

## 8. Implementation Plan

### 8.1 Files to Create

| File | Location | Size | Purpose |
|------|----------|------|---------|
| `.claude/skills/extract/SKILL.md` | Repo | S | `/extract` manual trigger skill definition |

### 8.2 Files to Modify

| File | Location | Size of change | Description |
|------|----------|----------------|-------------|
| `.claude/hooks/enforce-delegation.sh` | Repo | 1 line | Add `BL_CANDIDATES.md` to META Write whitelist |
| `meta.md` Section 14 | Repo | S | Add item: "Create CronCreate extraction job at session start" |
| `CLAUDE.md` | Repo | S | Add note to Session Entry Protocol: "After bootstrap checklist, create CronCreate extraction job" |

### 8.3 Files NOT Created by Phase 2.C

| File | Why not | Who creates it |
|------|---------|----------------|
| `BL_CANDIDATES.md` | Phase 2.B defines and creates the staging file | Phase 2.B Builder |
| CronCreate job | Created programmatically at session start, not a file | META at session bootstrap |
| Scheduled task | Created via MCP tool, not a file | META at session bootstrap (optional) |

### 8.4 Hook Configuration Changes

**Current `.claude/settings.json`:**

```json
{
  "hooks": {
    "PreToolUse": [
      { "matcher": "Edit|Write|Bash", "hooks": [{ "type": "command", "command": ".claude/hooks/enforce-delegation.sh" }] },
      { "matcher": "Agent", "hooks": [{ "type": "command", "command": ".claude/hooks/agent-role-tag.sh" }, { "type": "command", "command": ".claude/hooks/agent-context-check.sh" }] }
    ]
  }
}
```

**No new hooks needed.** The extraction runs as a CronCreate prompt, not a hook. The existing `enforce-delegation.sh` needs a one-line whitelist addition (Section 8.2).

### 8.5 `/extract` Skill Definition

The skill file `.claude/skills/extract/SKILL.md`:

```markdown
---
name: extract
description: Manual background instinct extraction. Reads recent session context, compares against BL, writes candidates to BL_CANDIDATES.md.
---

# /extract -- Manual Instinct Extraction

Run the same extraction logic as the automatic CronCreate job, but on demand.

## When to use
- Before ending a session (capture patterns before context evaporates)
- After a significant event (fix chain, enforcement violation, novel pattern observed)
- When the operator notices a pattern worth capturing

## Process
[Same prompt as Section 3.1, with dynamic path substitution]
```

### 8.6 Session Bootstrap Addition

At session start (after the Section 14 checklist), META creates the CronCreate job:

```
CronCreate:
  cron: "17 * * * *"   # Every hour at :17 (offset from :00/:30 per CronCreate guidelines)
  recurring: true
  prompt: [Section 3.1 prompt template with project root substituted]
```

Wait -- the spec says 30-minute intervals. CronCreate's minimum practical interval:

```
CronCreate:
  cron: "17,47 * * * *"   # Every 30 minutes at :17 and :47 (offset)
  recurring: true
  prompt: [Section 3.1 prompt template]
```

This fires at :17 and :47 past every hour, avoiding the :00 and :30 marks per CronCreate best practices.

### 8.7 Integration Test Plan

| Test | Method | Pass criteria |
|------|--------|---------------|
| T-1: CronCreate job fires | Create job, wait for first fire, check output | Prompt runs and produces "EXTRACTION: no new candidates" or writes a CAND |
| T-2: CAND written correctly | Run `/extract` after a session with deliberate BL violations | CAND appears in BL_CANDIDATES.md with correct format |
| T-3: Idle session optimization | Run `/extract` on a session with no agent/edit/write activity | Output is "EXTRACTION: idle session, skipping" (or "no new candidates") with minimal token usage |
| T-4: enforce-delegation.sh whitelist | Attempt Write to BL_CANDIDATES.md from main session | Write succeeds (whitelist updated) |
| T-5: enforce-delegation.sh still blocks | Attempt Write to eradev.md from main session | Write blocked (no regression) |
| T-6: `/extract` skill invocation | Invoke `/extract` from operator | Extraction runs, produces output |
| T-7: CronCreate lifecycle | Check that CronCreate job appears in CronList | Job listed with correct schedule |
| T-8: Count update | Run extraction twice with successful CANDs | "Current count:" in BL_CANDIDATES.md header incremented correctly |

---

## 9. Acceptance Criteria

| AC | Description | Measurement | Status |
|----|-------------|-------------|--------|
| AC-2C-1 | CronCreate extraction job created at session bootstrap | CronList shows the job after session start | PENDING |
| AC-2C-2 | Extraction prompt fires and produces correct output | T-1 passes: output is either "no new candidates" or a valid CAND | PENDING |
| AC-2C-3 | CAND entries follow Phase 2.B schema exactly | T-2 passes: format matches `CAND-N` schema + `Extraction type` field | PENDING |
| AC-2C-4 | `/extract` skill exists and is invocable | T-6 passes: operator can run `/extract` | PENDING |
| AC-2C-5 | `enforce-delegation.sh` allows Write to `BL_CANDIDATES.md` | T-4 and T-5 pass: whitelist updated, no regression | PENDING |
| AC-2C-6 | Idle session optimization works | T-3 passes: minimal token usage when no work done | PENDING |
| AC-2C-7 | Extraction does not modify any file except BL_CANDIDATES.md | Review extraction sweep output across 3+ fires | PENDING |
| AC-2C-8 | Extraction does not spawn sub-agents or run Bash | Review extraction sweep output across 3+ fires | PENDING |

**All 8 ACs must pass to mark Phase 2.C as complete.**

---

## 10. Open Questions

### OQ-2C-1: Optimal Extraction Frequency

30 minutes is a starting point. After 5+ sessions with extraction running, measure: what percentage of sweeps produce a candidate? If < 10%, increase interval to 60 minutes. If > 50%, decrease to 15 minutes. The calibration requires empirical data.

### OQ-2C-2: Model Selection for Extraction

CronCreate does not currently support model selection. If future Claude Code versions add this, Haiku would be optimal for extraction (simple pattern matching, low cost). When should this be re-evaluated?

### OQ-2C-3: Extraction Context Depth

The current spec says "reflect on the work done since the last extraction sweep." How deep is this reflection? The model has the full session context, but the extraction prompt does not explicitly scope how far back to look. Should the prompt include a marker file (e.g., `memory/last_extraction_timestamp.md`) to bound the reflection window?

### OQ-2C-4: Multi-Project Sessions

If a session works across multiple projects (e.g., eradev + plugy), which project's BL_CANDIDATES.md receives the candidates? Currently, each project has its own repo with its own BL_CANDIDATES.md. The extraction prompt uses hardcoded paths. Multi-project sessions would need path switching logic.

### OQ-2C-5: Extraction Quality Measurement

How do we measure whether extraction is producing valuable candidates vs noise? Proposed metric: promotion rate = (CANDs promoted to BL or lessons) / (total CANDs produced). A promotion rate below 20% after 10 sessions suggests the extraction prompt needs tuning. Above 50% suggests the system is working well.

### OQ-2C-6: Interaction with Phase 2.D (Model-Per-Role)

When/if Phase 2.D (model-per-role) is implemented, should extraction run under a specific model? The natural choice is Haiku (cheapest, sufficient for pattern matching). But model-per-role assigns models to ROLES, not to background tasks. Should "extraction" be a role? A sub-role? A tool profile?

### OQ-2C-7: CronCreate Prompt Size vs Context Window

The extraction prompt is ~500 tokens. But when CronCreate fires the prompt, the session context is also present. In long sessions (100k+ tokens of context), does the extraction prompt's "reflect on work since last sweep" degrade due to attention dilution? Should the prompt explicitly instruct "focus on the last 5 Agent tool results only"?

---

## B-Check (B_text, uniform weights 0.25 each)

```
=== JIDOKA SELF-CHECK ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.90 -- Read all relevant source files (hooks, settings, Phase 2.B spec, BL, lessons, roadmap). Verified CronCreate capabilities and limitations. Only gap: did not read eradev.md core sections (not needed for this infrastructure spec).
  E (Alignment):   0.90 -- Spec directly addresses the 3 gaps (latency, coverage, BL-16 recursion). Realistic about Claude Code limitations. Does not promise PostToolUse Haiku agent that cannot be built. Provides implementable alternative.
  (1-sigma):       0.85 -- No conflict with Phase 2.B (writes to BL_CANDIDATES.md, does not own it). No conflict with existing hooks (no new hooks needed). One potential conflict: enforce-delegation.sh needs whitelist update for BL_CANDIDATES.md (documented in implementation plan). CronCreate idle-only firing prevents workflow interruption.
  Lambda:          0.85 -- Applied BL-16 (core problem), BL-30 (defense-in-depth with CronCreate + /extract + scheduled task), BL-31 (extraction agent typed to one output), BL-11 (scope discipline), EMP4 (enforcement where it fires), EMP6 (enforcement without mechanism = zero). Consulted Phase 2.B for schema compatibility.
  B = 0.25*0.90 + 0.25*0.90 + 0.25*0.85 + 0.25*0.85 = 0.875

  Note: B_text uses ADDITIVE weighting per v9 modal formula (uniform 0.25 each), NOT multiplicative. This is the correct formula for text modality (framework infrastructure).
  Wait -- re-reading eradev.md: B = F^w1 * E^w2 * (1-sigma)^w3 * Lambda^w4 with uniform weights for text modality means w1=w2=w3=w4=0.25 in the EXPONENT, which is multiplicative (geometric mean).
  Corrected: B = 0.90^0.25 * 0.90^0.25 * 0.85^0.25 * 0.85^0.25 = 0.974 * 0.974 * 0.960 * 0.960 = 0.873

  B = 0.873 (above 0.5, no Andon)
  min(F, E, 1-sigma, Lambda) = 0.85 (above 0.3, no component-level Andon)
```

---

*Phase 2.C Background Instinct Extraction spec ready for Builder implementation.*
*Depends on: Phase 2.B BL_CANDIDATES.md file existing at repo root.*
*Next action: Builder implements CronCreate job setup, /extract skill, enforce-delegation.sh whitelist update.*
