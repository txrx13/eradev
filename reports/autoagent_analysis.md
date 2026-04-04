# AutoAgent x EraDev: Analysis Report

**Method:** 5-role Round Table
**Input:** AutoAgent (Kevin Gu / thirdlayer.inc) — self-optimizing agent framework
**Date:** April 2026

---

## Executive Summary

AutoAgent and EraDev solve the same problem (meta-level agent improvement) from opposite directions. AutoAgent = speed + automation + score-driven. EraDev = depth + deliberation + theory-driven. Neither is complete alone.

**Visionary's synthesis:** "Autonomous Spiral Engine" — EraDev provides steering/brakes/navigation, AutoAgent provides the engine. Two timescales: outer (human-guided RT, strategic) + inner (machine-speed hill climbing, tactical).

**Когерент's mega-pattern EMP7:** "Optimization without Orientation is Hill-Climbing into Fog" — every optimization loop must be embedded within an orientation loop.

**Валидатор's warning:** AutoAgent's benchmark-first approach would eliminate our bilingual observation diversity and theoretical innovation capability. Adopt selectively, not wholesale.

---

## What AutoAgent Has That EraDev Doesn't

| AutoAgent Capability | EraDev Status | Gap Severity |
|---------------------|---------------|-------------|
| Automated score-driven iteration (edit→run→score→keep/discard) | Manual (Hansei post-hoc) | **CRITICAL** |
| Numeric benchmark suites per domain | No formalized benchmarks | **HIGH** |
| Docker-isolated parallel sandboxes (1000s) | No isolation between agents | MEDIUM |
| Trace-based learning (WHY it failed, not just THAT it failed) | Post-hoc Hansei only | HIGH |
| program.md / agent.py clean boundary (human steers, agent edits) | Blurred (META sometimes codes directly) | MEDIUM |
| Emergent behavior discovery (spot checking, self-tests, subagents) | Partially present but not systematically harvested | LOW |

## What EraDev Has That AutoAgent Doesn't

| EraDev Capability | AutoAgent Status | Advantage |
|-------------------|-----------------|-----------|
| Five-role architecture with ODTOE mapping | Single meta + single task (2-agent) | **CRITICAL** for complex tasks |
| S_adjusted phantom coherence detection | Qualitative self-reflection only | **HIGH** — quantitative > self-report |
| Bilingual architecture (EN breadth + RU depth) | Single language (EN) | **HIGH** for theoretical innovation |
| 26 Bootstrap Lessons (cross-session Lambda) | No persistent memory between sessions | **HIGH** |
| Torus topology, golden ratio, spiral gap | No topological model | MEDIUM |
| Graduated Activation (GREEN/YELLOW/RED) | Binary pass/fail | MEDIUM |
| Kill-Switch hierarchy (5 levels) | No escalation model | MEDIUM |

---

## Confirmed Claims (validated by our data)

1. **"Splitting helps"** — CONFIRMED by pluggy session (95% solo Builder when META/task not split)
2. **"Agents overfit"** — CONFIRMED = our phantom coherence (S_team=0.970, S_adjusted=0.335)
3. **"Meta-agent quality matters"** — CONFIRMED by CLAUDE.md template evolution (3-line→10-line)
4. **"Traces > scores alone"** — CONFIRMED by our Hansei (post-hoc trace analysis produced BL-16–26)

## Skeptical Claims (not validated for our context)

1. **"#1 on benchmarks"** — SpreadsheetBench/TerminalBench are closed-form. ODTOE articles are open-ended. Wrong benchmark type.
2. **"No hand-engineering needed"** — Our φ-weighted S_team formula came ONLY from human-guided RU-Analyst. AutoAgent would optimize it away as "underperforming" (B=0.346).
3. **"Same-model pairing wins"** — In our bilingual architecture, same model + different language = different operator. Diversity is the feature.

---

## Consolidated Improvement Plan (from all 5 roles)

### P0 — Immediate

| # | Change | Source | Target |
|---|--------|--------|--------|
| 1 | **S_session score formula** = (1-fix_rate) × (1-chain_ratio) × delta_improvement × B_mean | Builder | eradev.md VI, meta.md 5 |
| 2 | **Trace Accumulator** — running YELLOW/RED counters, auto-trigger at thresholds | Builder | eradev.md IV |
| 3 | **Overfitting guard step 5b** — "Would this rule still help if this incident never happened?" | Builder | meta.md 6 |
| 4 | **EMP7: Optimization without Orientation = fog** — every 10th iteration, pause for mini-RT | Когерент | projects/eradev/lessons.md |

### P1 — This session

| # | Change | Source | Target |
|---|--------|--------|--------|
| 5 | **Prompt Evolution trigger** — if S_session < 0.3, propose edit, tag it, track for 2 sessions | Builder | meta.md 6 |
| 6 | **Mid-Build Sub-RT** — Builder can request nested RT for M-sized subtask | Builder | eradev.md X |
| 7 | **Benchmark-in-the-Loop** — 10-20 standard tasks with test suites for prompt evolution validation | Аналитик | projects/eradev/ |
| 8 | **spiral_log.tsv** — structured trace log per RT-3 (machine-readable) | Аналитик | meta.md format |

### P2 — Next session

| # | Change | Source | Target |
|---|--------|--------|--------|
| 9 | External B-Score validation (compile, test, lint as proxies) | Аналитик | eradev.md XIV |
| 10 | Micro-sandbox for Builder (Docker-like isolation) | Аналитик | infrastructure |
| 11 | A/B testing infrastructure for prompt variants | Аналитик | meta.md |
| 12 | Emergence Log in A3 template ("what was not predicted?") | Когерент | eradev.md VI |

---

## What NOT to Adopt (Validator's warnings)

1. **NOT single meta+task replacing five-role architecture** — P_coll proves 5 specialized agents > 1 generalist
2. **NOT fully autonomous experimentation without Andon** — failed experiments propagate in our context (P_coll error)
3. **NOT pure score-driven without Hansei** — scores are fast but shallow; process reflection generates higher-order Lambda
4. **NOT optimizing away the RU stack** — would eliminate our most original theoretical contributions
5. **NOT within-session-only learning** — would lose the spiral (cross-session Lambda accumulation)

---

## The ODTOE Connection

**Model empathy = Observer self-recognition.** AutoAgent's finding that same-model pairing outperforms cross-model is O_hat recognizing its own projection properties. The meta-agent shares weights with the task agent and can internally simulate how the task agent will interpret a prompt.

**EraDev's five roles are ODTOE's observation decomposition.** Different roles project Ψ through different kernels. The Round Table synthesizes partial observations into collective observation approaching completeness.

**AutoAgent's convergence = ODTOE's fixed point.** When AutoAgent's score stops improving, the harness has reached Ψ* = Φ(Ψ*) — the self-consistent configuration that reproduces itself under the meta-evaluation loop.

---

## EMP7: Optimization Without Orientation Is Hill-Climbing Into Fog

Every optimization loop must be embedded within an orientation loop:
- **Optimization loop** (AutoAgent-style): edit → run → score → keep/discard. Determines how FAST you move.
- **Orientation loop** (EraDev-style): True North → RT deliberation → Kill-Switch. Determines WHETHER you move in the right direction.

One without the other produces: stagnation (orientation without optimization) or efficient convergence to the wrong answer (optimization without orientation).

**Rule:** At every 10th iteration of any score-driven loop, pause and run a mini-RT with Visionary + Coherencer. Ask: "Is the thing we are scoring still the right thing to score?"

---

## Spiral Gap (~2%)

1. Speed-depth tradeoff has no analytic solution (62/38 ratio derived for deliberative, not hybrid)
2. Score function evolution — neither system can derive new evaluation criteria from first principles
3. Autonomy-oversight crossover point — below what task complexity does AutoAgent dominate? Above what does EraDev dominate?

---

*Report synthesized from 5-role Round Table. B_mean across roles: 0.58. S_team: 0.82.*
