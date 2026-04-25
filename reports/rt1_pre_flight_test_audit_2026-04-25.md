# Pre-Flight Test Audit — does EraDev "run tests BEFORE work"?

**Auditor:** [ANALYST] | **Date:** 2026-04-25 | **Scope:** read-only

## Operator's Question
"Run checks/auto-tests to verify everything is done correctly BEFORE starting work."
Translation in EraDev terms: is there a first-class mechanism that **executes** existing tests/health-checks **before** RT-1 / Builder spawn — not just reads references?

## Mechanism × runs-tests × coverage

| # | Mechanism | Citation | Executes tests? | Fires BEFORE work? | Coverage |
|---|-----------|----------|-----------------|---------------------|----------|
| 1 | BL-17 Check-First | `BOOTSTRAP_LESSONS.md:141-146` | NO — READS reference/format/spec/sources | YES (pre-generate) | 100% generation tasks, but only docs/format reads |
| 2 | BL-22 PRE-FLIGHT (external API) | `BOOTSTRAP_LESSONS.md:162-167`; `eradev.md:591` | YES — `curl`-verifies endpoints | YES (before RT-1) | ~10-20% tasks (only those touching external APIs) [CODE-ADAPTER] |
| 3 | Activation Operator A_F | `roles/analyst_EN.md:10`; `roles/builder_EN.md` (A_F) | NO — Reads artifacts in scope | YES | 100% but read-only |
| 4 | μ-check / `doc_alignment` | `templates/domain_skin.md.template:94-111`; `meta.md` §μ-check | NO — 7 checks are docs-alignment (template populated, AC↔FM mapping, no dangling refs); Check 5 = "no dangling references", NOT "tests pass" | YES (between RT-1 close and Builder spawn) | 100% strict/structured M+, but no test execution |
| 5 | `flux_check` | `templates/domain_skin.md.template:113-128` | NO — voice/Ô/IFR/draft existence checks | YES | 100% exploratory/emergent, advisory only |
| 6 | `verify.method=build` | project `domain:` block | YES — `build` runs compile/test toolchain | NO — fires AFTER Builder produces artifact, at Validator phase | 100% code projects but POST-work |
| 7 | Validator KR1 + KR5 (stale-output / pipeline-stage / artifact content audit) | `roles/validator_EN.md:24,28,30` | YES — render/parse/read-aloud, hash/timestamp delta, content signature | NO — POST-Builder | 100% Validator runs, but POST-work |
| 8 | Hooks (`agent-context-check`, `agent-role-tag`, `bl-tier-check`, `enforce-delegation`, `rework-framing-detector`, `rt1-composition-gate`) | `.claude/hooks/*.sh` | NO — string-pattern guards on prompts/Tool-use | YES (PreToolUse) | 100% Agent calls, but no test execution |
| 9 | Cycle-7 "SMOKE TEST GATE" proposal | `reports/cycle-7-reflection.md:187-197,406,458` | YES (proposed: SSH check on node) | NO — POST-Builder, pre-commit | NEVER LANDED — still a proposal, not a shipped gate |
| 10 | `verify.method=parse / cite_check / readability / dry_run / recompute` | `templates/domain_skin.md.template:21,81-92` | YES (per-domain) | NO — POST-Builder | 100% per-domain, POST-work |

## Verdict: **MISSING (PARTIAL only for external APIs)**

- "Auto-test BEFORE work" exists as a **first-class mechanism only for external API endpoints** (BL-22 PRE-FLIGHT — Tier T3, code-adapter only). Coverage ≈ 10-20% of tasks.
- For all other task classes (internal refactor, doc edit, framework change, article draft), there is **no gate that executes the existing test/build/parse suite before RT-1 or before Builder spawn**.
- BL-17 Check-First is **read-only** (it loads format spec / reference template / bibliography); it does not run tests.
- μ-check / `doc_alignment` is **document-alignment-only**; its 7 checks audit plan completeness, not executable health.
- `verify.method=build` and Validator's render/parse checks fire **AFTER** Builder, never **BEFORE**.
- Cycle-7 proposed a "SMOKE TEST GATE" (`reports/cycle-7-reflection.md:187,458`) but it was scoped POST-Builder/pre-commit, AND it never shipped — so even that partial proposal is not in the live framework.

## Gap

The operator's request — "run tests/checks BEFORE starting" — names a **baseline-health gate**: confirm the existing artifact set still **executes green** before changing it. This catches: stale local state, half-merged branches, broken main, stale dependencies, undocumented prior failures. EraDev currently has no such gate for non-external-API work.

## Minimal fix proposal

**Add `verify.method=build`-equivalent as a PRE-RT-1 baseline check (new BL or extension to BL-17).**

- **Name:** **BL-39 Baseline Health Check** (universal, Tier T3) — *or* extend BL-22 from external-API-only to "any task with executable verify method runs `domain.verify.method` BEFORE RT-1, captures baseline status (PASS/FAIL/skip-with-reason), attaches to Unified Plan §0".
- **Trigger:** Session Entry item 5b (DOMAIN check, `meta.md` §14) — after domain detected, before RT-1 spawn.
- **Action:** META spawns `[ANALYST] Check Agent` with prompt: "Run `domain.verify.method` (currently `build` / `cite_check` / `parse` / etc.) once on current HEAD, no edits. Report PASS/FAIL + 5-line summary." Output attaches to `reports/baseline-{TASK_ID}-{DATE}.md`.
- **Failure path:** baseline FAIL = META declares P0-baseline (NOT operator's task) and spawns repair RT-1 *before* the operator's task RT-1.
- **Cost:** 1 agent call per session, ~30-60s; saves the "I built on top of broken main" failure mode.
- **Hook (T2 follow-up):** `pre-rt1-baseline.sh` — checks for `reports/baseline-*-{DATE}.md` artifact; missing on M+ = WARNING.

## B-check (B_text)
F=0.85 — read 8 files (CLAUDE.md, BL.md §141-146 §162-167, eradev.md §591, validator_EN.md, builder_EN.md §60-72, analyst_EN.md, domain_skin.md.template §80-128, hooks/*.sh, reports/cycle-7-reflection.md §187). Missed: meta.md μ-check section read fully (only via grep), eradev_RU/meta_RU parity, possible non-canonical custom methods in projects/.
E=0.92 — answers operator's literal question (does EraDev have "auto-test before action"?) with a per-mechanism ledger and a verdict.
(1-σ)=0.90 — no contradictions; one risk: if a project ships custom `verify.method` that includes pre-execution, my "MISSING" verdict could become "PARTIAL" for that project. Disclosed.
Λ=0.78 — applied BL-17 (read references first), BL-22 pattern recognition, μ-check spec read; did NOT apply Lessons history (lessons.md not consulted).
B = 0.85 × 0.92 × 0.90 × 0.78 = **0.55** ≥ 0.5 → no ANDON; pass.
