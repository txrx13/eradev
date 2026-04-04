# Instruction Improvements Report — Cycle-7 Analysis

**Method:** 5-role Round Table (Visionary, Analyst, Builder, Validator, Coherencer)
**Input:** cycle-7-reflection.md + ODTOE_eradev_multiagent_research.tex + current instructions
**Date:** April 2026

---

## Executive Summary

S_team across 5 roles: **0.72** (high conceptual alignment, moderate structural mismatch).

**Key finding:** 60–65% of cycle-7 proposals already exist as rules in BL-1–BL-21. The problem is NOT knowledge — it is enforcement. This is the Lambda problem (BL-16) applied recursively to the system itself.

**The single most important gap:** Rules exist only as .md descriptions (form 1 of 3). meta.md Section 13 demands all rules exist in 3 forms: (1) .md description, (2) checklist in agent prompt, (3) automated gate. BL-3, BL-6, BL-11, BL-13 — all satisfied only form 1. All were violated in cycle-7.

---

## Consolidated Change List (deduplicated from 5 roles)

### P0 — Immediate (before next coding session)

| # | Change | Target File | Type | Evidence |
|---|--------|------------|------|----------|
| C1 | **BL-22: PRE-FLIGHT Gate** — Analyst curl-verifies all external endpoints before RT-1. Unverified endpoint = Builder BLOCK | BOOTSTRAP_LESSONS.md + CLAUDE.md.template (Invariants) + analyst.md (new responsibility) | NEW | F=0 in 3/9 incidents (16/42 fixes) |
| C2 | **BL-23: Yokoten Gate** — After every fix, Coherencer greps for analogous patterns. Single-site fix = incomplete | BOOTSTRAP_LESSONS.md + coherent.md (new gate) | NEW enforcement of BL-13 | Incident #8 (3 fix commits) |
| C3 | **BL-24: Single-Responsibility Commits** — One commit = one phase. >5 files from different modules = RT-2 required | BOOTSTRAP_LESSONS.md + CLAUDE.md.template (Invariants) | NEW | Big bang commits (16 files, 14 files) |
| C4 | **Lambda Audit at RT-1** — Coherencer reads and announces 3 relevant lessons + 2 mega-patterns before task begins | meta.md Section 14 (new item 8) + coherent.md | ENFORCEMENT of BL-4/BL-10 | Lambda=0 in 3/9 incidents |
| C5 | **Fix-to-Spec Escalation** — Fix chain >= 3 = Andon. Builder writes spec, spec passes RT, then resume | meta.md (Commit Archaeology) + coherent.md + CLAUDE.md.template | ENFORCEMENT of BL-3 | 3 chains (9+10+7 fixes = 26 wasted commits) |

### P1 — This session (after P0)

| # | Change | Target File | Type | Evidence |
|---|--------|------------|------|----------|
| C6 | **BL-25: Error Path Coverage Matrix** — 5 paths mandatory for server-side code: happy/error/timeout/restart/partial | BOOTSTRAP_LESSONS.md + builder.md + validator.md | NEW | E=0 in 2/9 incidents (gossip, badge) |
| C7 | **BL-26: META Zero Quick-Fix Rule** — M+ fixes require Builder+Validator minimum. No direct META coding | BOOTSTRAP_LESSONS.md + CLAUDE.md.template | NEW | ~8 unreviewed M-size commits |
| C8 | **Fix Rate Monitoring** — After every 10 commits: <30% GREEN, 30-50% YELLOW, >50% RED (mandatory stop) | meta.md Section 5 (new metric) | NEW | Session hit 55% without detection |
| C9 | **EMP5: Scope determines pipeline strictness** — External-dependency tasks need stricter gates; isolated UI lighter | projects/eradev/lessons.md | NEW mega-pattern | 58% of feature commits had 0 fixes (isolated); 83% of fixes in 4 boundary chains |
| C10 | **EMP6: Enforcement without mechanism is Lambda zero (recursive)** — 60% of cycle-7 proposals already existed as rules | projects/eradev/lessons.md | NEW mega-pattern | The meta-lesson of this entire analysis |

### P2 — Next session (defer)

| # | Change | Target File | Type | Rationale for deferral |
|---|--------|------------|------|----------------------|
| C11 | Smoke Test Gate (SSH verify on real node before commit) | builder.md, validator.md | NEW | Requires SSH access infrastructure |
| C12 | File Ownership tracking (files modified >5x = dedicated owner) | meta.md | NEW | Low urgency, prevents instability accumulation |
| C13 | Mid-session scope reclassification trigger | meta.md Section 14 | ENFORCEMENT of BL-18 | Needs fix rate monitor (C8) first |
| C14 | Cycle-7 specific patterns P24-P28 in project lessons | projects/eradev/lessons.md | Project-level | Too specific for universal core |

---

## Specific File Changes (from Analyst mapping)

### eradev.md

| Section | Change | Lines |
|---------|--------|-------|
| IV (Activation Operator) | Add "IV.1 Enforcement Gates": PRE-FLIGHT, LAMBDA AUDIT, SMOKE TEST | After current Graduated Activation |
| VII (Andon) | Add quantitative triggers: fix chain >= 3, big bang >10 files, unverified external API | After line 226 |
| X (Task Classification) | Add "boundary surface area" factor: `I(C) = files × coupling × legacy × boundary_factor` | Line 260-283 |
| XI (TPS/Yokoten) | Add enforcement: "After fix, grep for analogous patterns. Single-site fix = incomplete" | Line 296 |
| XIV (Jidoka) | Add fix rate counter + file instability detector | After Self-Check template |

### meta.md

| Section | Change |
|---------|--------|
| 5 (Prediction Delta) | Add fix rate monitoring: <30%/30-50%/>50% = GREEN/YELLOW/RED |
| 6 (Prompt Evolution) | Add MM6: External endpoint verification for every Builder output |
| 11 (Commit Archaeology) | Add row: "3+ fix on same topic → STOP + specification + RT review" |
| 14 (Session Entry) | Add item 8: PRE-FLIGHT check; item 9: FIX RATE every 10 commits; item 10: LAMBDA AUDIT |

### CLAUDE.md.template

| Section | Change |
|---------|--------|
| Invariants | Add: "External API tasks → Analyst PRE-FLIGHT before RT-1" |
| Invariants | Add: "Fix chain >= 3 = STOP, write specification" |
| Invariants | Add: "One commit = one phase. >5 files = RT-2 required" |
| Invariants | Add: "M+ fixes require Builder+Validator. No META quick-fixes" |

### Role files (all languages)

| File | Change |
|------|--------|
| analyst.md / _EN | Add: PRE-FLIGHT execution responsibility, VERIFIED ENDPOINTS artifact |
| builder.md / _EN | Add: P24 (PRE-FLIGHT check), P25 (single-responsibility), P28 (error path matrix) |
| validator.md / _EN | Add: External API gate, edge case matrix (5 paths), yokoten verification |
| coherent.md / _EN | Add: LAMBDA AUDIT (3 lessons + 2 patterns at RT-1), FIX-TO-SPEC escalation, SCOPE ALARM |
| visionary.md / _EN | Add: External dependency count escalates risk class |

---

## Existing Rules That Were Violated (NOT new — need enforcement)

| Rule | Existed Since | Violated In | Why Failed | Fix |
|------|-------------|-------------|-----------|-----|
| BL-3 (fix chain > 3 = STOP) | v7.0 | 3 chains (9+10+7) | Form 1 only (.md), no gate | C5: enforcement in meta.md + coherent.md |
| BL-6 (verify before act) | v7.0 | Incident #2 (hallucination) | Generic, no external API specificity | C1: PRE-FLIGHT with curl protocol |
| BL-13 (Yokoten) | v7.0 | Incident #8 (dialog dedup) | Declarative, no grep gate | C2: Yokoten Gate after every fix |
| BL-11 (scope creep) | v7.0 | Big bang commits | No quantitative threshold | C3: commit size gate |
| BL-16 (reading ≠ applying) | v7.1 | ~8 META quick-fixes | Mid-session regression not covered | C7: Zero Quick-Fix rule |

---

## New Bootstrap Lessons (BL-22 through BL-26)

| BL | Title | Source | Prevents |
|----|-------|--------|----------|
| BL-22 | PRE-FLIGHT Gate for External APIs | Cycle-7: F=0 in 3/9 incidents | Hallucination on nonexistent endpoints |
| BL-23 | Yokoten Gate — grep after every fix | Cycle-7: incident #8 | Incomplete fixes that miss analog sites |
| BL-24 | Single-Responsibility Commits | Cycle-7: big bang commits | Revert catastrophe (16-file reverts) |
| BL-25 | Error Path Coverage Matrix (5 paths) | Cycle-7: E=0 in 2/9 incidents | Missing error/timeout/restart handling |
| BL-26 | META Zero Quick-Fix Rule | Cycle-7: ~8 unreviewed commits | Pipeline bypass by META under time pressure |

---

## Spiral Gap (~2%) — Deferred to Next Iteration

1. Smoke Test Gate (SSH verification) — needs infrastructure
2. Quantitative bridge between language Mura and B-delta — needs math work
3. B-diagnostics measurement for all session agents — needs tooling
4. CONSTANTS_REGISTRY.md — separate workstream
5. Fix rate targets (40%) — validate over 2-3 sessions before hardcoding
6. Self-assessment inflation detection — structural problem (agent rates own B)

---

## Meta-Observation (EMP6)

> **Enforcement without mechanism is Lambda zero, recursively.**
>
> Cycle-7 demonstrates that EraDev has a mature knowledge layer but an immature enforcement layer. Seven out of nine incidents had root causes that existing rules already addressed. The system knows what not to do; it does it anyway. Adding more rules without adding enforcement mechanisms will produce the same result in cycle-8. The highest-leverage action is not "add BL-22 through BL-26" but "add enforcement gates for BL-3, BL-6, BL-13 that already exist."

---

*Report synthesized from 5-role Round Table analysis. All five roles agreed on P0 priorities. Divergence was on P1 ordering only.*
