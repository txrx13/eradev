# BT-1 Phase 2 Roadmap — Real Pareto Prune Wave (β path)

**Status as of commit `30aba78` (2026-04-26):** Phase 1 prep COMPLETE. Phase 2 implementation **PENDING operator GO**. All design artifacts in `reports/rt13_*.md` + `reports/composition-hazards-2026-04-26-bt1_*.md`.

## TL;DR — for next session continuation

Operator chose **β (Adjust+ship)** for BT-1 (Visionary structural triad cure).
Phase 2 = **D → M → P sequenced implementation** (locked, no re-debate).
14-16 agents across 3 cure phases + final integrated wave. ~184 LOC + RU mirror. ZERO new BL/Inv (pure L-50 extensions).

## Sources of truth

| Artifact | Role | Path |
|---|---|---|
| L2 synthesis | Unified Plan + (β) recommendation | `reports/rt13_l2_synthesis_2026-04-26.md` |
| Co-spec C1-C5 | 5 conditions formal spec | `reports/rt13_co_spec_c1_c5_2026-04-26.md` |
| β-refined Builder | D2 additive formula + BLOCK enforcement | `reports/rt13_builder_beta_refined_2026-04-26.md` |
| ψ*-gap recompute | YELLOW-RED 12.7%/25%, CONDITIONAL_PROCEED | `reports/rt13_psi_gap_2026-04-26.md` |

## Phase 2.1 — D-cure (axis re-anchor, ships first)

**Pre-conditions to verify at session entry:**
- [ ] Confirm operator still wants β proceed (not pivot to γ pilot or freeze)
- [ ] Write Σ_pre snapshot: `.eradev/beta_snapshot.txt` + `git tag beta-pre-ship`
- [ ] Verify ψ*-gap not regressed since 30aba78 (re-spawn Validator if >7 days elapsed)

**Spawn (parallel, single message):**
- **[BUILDER] D-EN** — eradev.md §II.1 B-formula amendment + meta.md §14 leverage_factor print + new `check-leverage.sh` pre-commit hook + `.claude/settings.json` registration
- **[BUILDER] D-RU** — eradev_RU.md §II.1 (byte-identical formula) + meta_RU.md §14 mirror

**Formula (locked):** `Λ = 0.5·Λ_consulted + 0.5·leverage_factor` (D2 additive — see β-refined report §1)

**BLOCK semantics:** `check-leverage.sh` exit 3 pre-commit; blocks 3 consecutive framework commits with LF<0.10; `[retire-pass]` tag exemption.

**Then sequentially:**
- [COHERENT] D-gate L1 — verify EN/RU byte-identical formula, no §II.1 collisions, BL-19 sync OK
- [VALIDATOR] D-regression — 5 scenarios from `rt13_validator_en_2026-04-26.md` (existing B-scores still in [0,1], LF=0.012 → ANDON correctly, LF=0.70 → GREEN, etc.)
- META: commit `BT-1 Phase 2.1: D-cure (axis re-anchor, β-additive formula)`

**Files touched:** `eradev.md`, `eradev_RU.md`, `meta.md`, `meta_RU.md`, `.claude/hooks/check-leverage.sh` (NEW), `.claude/settings.json`, `.claude/skills/eradev/core/eradev{,_RU}.md`, `.claude/skills/eradev/meta/meta{,_RU}.md`, `.eradev/beta_snapshot.txt` (NEW), `.gitignore` extension.

**LOC:** ~50 (D leg) + RU mirror.

## Phase 2.2 — M-cure (META discipline, after D ships)

**Spawn (parallel):**
- **[BUILDER] M-EN** — CLAUDE.md ε_meta canonical anchor (enumerate META 6 output types) + `enforce-delegation.sh` extension (exit 2 on direct Edit/Write without INTENT or first-tool≠Agent, ε_meta whitelist) + meta.md §14 intent_ratio print
- **[BUILDER] M-RU** — meta_RU.md §14 KILL-TEST mirror (RU translation of intent-action separator)

**Then:**
- [COHERENT] M-gate L1 — verify ε_meta anchor cited from M-cure + future D-cure denominator (single-source-of-truth)
- [VALIDATOR] M-regression — 5 scenarios from `rt13_validator_en_2026-04-26.md` (legitimate META outputs still pass, direct framework Edit blocks, INTENT bypass works)
- META: commit `BT-1 Phase 2.2: M-cure (META discipline, intent-vs-action separator)`

**Files:** `CLAUDE.md`, `meta.md`, `meta_RU.md`, `.claude/hooks/enforce-delegation.sh`, skill mirrors.

**LOC:** ~31 (M leg) + RU mirror.

## Phase 2.3 — P-cure (retirement organ, after M ships)

**Spawn (parallel):**
- **[BUILDER] P-EN** — meta.md §14 Ω_pruned print + lessons_archive.md retirement-pass entry template + new Hansei subtype `hansei-c1-dormancy-*` template at `templates/` + `phantom-newness-check.sh` extension (exit 1 if Ω_pruned<1.0 over 4-session window)
- **[BUILDER] P-RU** — meta_RU.md §14 mirror + lessons_archive_RU.md (if exists) + RU Hansei template
- **[BUILDER] skill-mirror sweep** — `.claude/skills/eradev/...` byte-equality with all D+M+P canonical edits + zip rebuild

**Then:**
- [COHERENT] P-gate L1 — verify §14 collision-resolution (D first, M appended, P appended; line counts match per phase)
- [VALIDATOR] P-regression — 5 scenarios (retire-pass on real BL doesn't break dependents, Ω_pruned computes correctly on RT-12 commit, load-bearing BL canary refuses Inv 1 retirement)
- META: commit `BT-1 Phase 2.3: P-cure (retirement organ + skill-mirror sweep)`

**Files:** `meta.md`, `meta_RU.md`, `lessons_archive.md` (entry), `templates/hansei_dormancy_template.md` (NEW), `.claude/hooks/phantom-newness-check.sh`, all skill mirrors, `eradev-skill.zip` rebuild.

**LOC:** ~60 (P leg) + RU mirror + skill sweep.

## Phase 3 — Integrated wave finalization

- [VALIDATOR] integrated — composition matrix across D+M+P; 3 cross-leg scenarios from Validator EN report (bootstrap §9 collision, hook ordering, D's denominator dependency on P)
- [COHERENT] L2 final synthesis — write `reports/bt1_l2_final_synthesis_<date>.md` documenting Σ_pre→Σ_post delta, post-cure B-projection vs actual, dormancy audit schedule (C5 trigger date)
- META: write `git tag beta-post-ship`
- META: commit `BT-1 final: integrated Validator + skill zip + post-ship dormancy schedule`
- META: bundle commit + push

**Total Phase 2+3 agents:** ~14-16 (3 phases × 4 agents avg + 2 final).

## C5 dormancy audit (post-ship)

**Trigger:** 4 sessions after Phase 3 commit.

**Test (T1+T2+T3 falsifiable):**
- T1: did P retire ≥1 BL/Inv/Lesson in 4-session window? (grep lessons_archive)
- T2: was M intent_ratio computed and printed in 4/4 session bootstrap §9?
- T3: was D leverage_factor reported + ≥1 audit triggered (LF<0.10 BLOCK fired)?

**Fail action:** if all 3 dormant → cure-3 was decorative; trigger Hansei + revisit (BT-1 v2 with different framing).

## Honest σ residual (flagged for post-wave Hansei)

- D2 doesn't add symmetric `defensibility_brake` on (1-σ) axis (A-RU §3 partial); operators tend to be punished only on Λ-axis, not on σ-axis for over-defensive moves.
- ψ*-gap conditional CONDITIONAL_PROCEED — strict EMP18 reading is FREEZE; β IS the cure exception (L-59 + L-63). If gap doesn't drop after Phase 2 ship, EMP18 freeze becomes hard.
- 4th leg (measurement self-reference) addressed via C4 frozen-snapshot but adds rebase fragility.
- 5th leg (dormant→active conversion) addressed via C5 audit but only at 4-session boundary (gap of dormancy detection).

## Parked B-tasks (for separate waves after BT-1 ships)

| ID | Description | Priority |
|---|---|---|
| **BT-2** | B4 path-strip greedy fix (skill-mirror deny-pattern dead code) | LOW |
| **BT-3** | BL split files lag aggregate reconciliation (BOOTSTRAP_LESSONS_universal/_code_adapter vs aggregate) | MEDIUM |
| **BT-4** | enforce-delegation `rg` regex word-boundary (LIVE-DEMO blocked META commit RT-12) | MEDIUM |

## Pre-launch checklist for next session

1. [ ] Read this file at session entry
2. [ ] Verify HEAD = `30aba78` or later (no breaking changes since)
3. [ ] Operator confirms β still chosen (vs pivot to γ pilot)
4. [ ] Write Σ_pre snapshot + tag `beta-pre-ship`
5. [ ] Spawn Phase 2.1 D-cure parallel Builders
6. [ ] Sequential gates: Coherent → Validator → commit
7. [ ] Repeat for M then P
8. [ ] Phase 3 integrated wave + tag `beta-post-ship`
9. [ ] Schedule C5 dormancy audit at session+4 boundary
