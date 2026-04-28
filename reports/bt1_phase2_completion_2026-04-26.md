# BT-1 Phase 2 Completion Snapshot

**Date:** 2026-04-26
**Status:** ACCEPTED (Validator + L2 Coherent dual-verdict)

## Commits
- `c10146a` — Phase 2.1 D-cure: axis re-anchor (D2-additive)
- `6343d75` — Phase 2.2 M-cure: META discipline + ε_meta anchor
- `0e024d9` — Phase 2.3 P-cure: retirement organ [retire-pass]

## Phase metrics

| Phase | S_team | B_mean | EN-RU spread |
|-------|--------|--------|--------------|
| D-cure | 1.00 | 0.553 | 0.000 |
| M-cure | 0.924 | 0.692 | 0.076 |
| P-cure | 0.98 | 0.72 | 0.020 |
| **Integrated** | **0.968** | **0.655** | <0.08 |

S_adjusted (M+P avg): 0.674
Phantom risk: LOW (BL-5/BL-29 thresholds clear)

I:D ratios verified against git: D=309/0, M=48/10, P=200/2 (matches L2 Coherent report).

## Files added/modified
- `eradev.md` + `eradev_RU.md` §II.1 (D-cure formula)
- `meta.md` + `meta_RU.md` §14 item 9 (D+M+P metrics)
- `CLAUDE.md` (M-cure ε_meta anchor)
- `.claude/hooks/check-leverage.sh` (NEW, D-cure)
- `.claude/hooks/enforce-delegation.sh` (M-cure comment ext)
- `.githooks/phantom-newness-check.sh` (P-cure sentinel ext)
- `templates/hansei_dormancy_template.md` + `_RU.md` (NEW, P-cure)
- `projects/eradev/lessons_archive.md` (P-cure workflow)
- 6 skill mirrors byte-synced

## Σ_pre vs Σ_post
Σ_pre: framework had Λ = Λ_consulted (single component), no LF measurement, no ε_meta canonical anchor, no Ω_pruned retirement metric.
Σ_post: Λ = 0.5·Λ_consulted + 0.5·leverage_factor (D2-additive), ε_meta canonical in CLAUDE.md, Ω_pruned dormancy detection active.

## Hook chain integration (Validator smoke test)
- `bash -n .claude/hooks/check-leverage.sh` → OK
- `bash -n .githooks/phantom-newness-check.sh` → OK
- `git log c10146a^..HEAD` → 3 commits visible, ordering preserved (D → M → P)
- I:D ratios match Coherent report exactly

## DOCS DRIFT (Validator Rule 9)
Grep across `docs/`, `README.md`, `README_EN.md`, `setup-claude.md`, `setup-codex.md`, `setup-cursor.md`, `setup-windsurf.md` for symbols `leverage_factor | intent_ratio | Ω_pruned | ε_meta | retire-pass | hansei_dormancy`: **0 matches**.

Interpretation: BT-1 is internal framework wiring (META session-bootstrap metrics + hooks). Operator-facing surfaces (README, setup-*) intentionally do not enumerate internal session-entry probes. No drift, no missing update.

Recommendation (advisory, non-blocking): if a future "Operator Quickstart" section ever mentions Λ Audit output format, add a brief note about LF/intent_ratio/Ω_pruned print blocks. Not required for BT-1 ship.

## Open Questions (Spiral Gap ~2%)
1. Empirical baseline: LF log empty, intent_ratio counter not yet implemented
2. Composition hazard: framework-self LF will trend down before OD-2/OD-3 deploy operator-domain ratio
3. Hansei dormancy template Tier line: implicit (Coherent-authored) — could add explicit "Tier: T3" header
4. intent_ratio measurement vehicle: who increments? manual self-report or session log derived?
5. 4-session window definition: needs sentinel for session boundary

## Next steps
- Wave 5: F1 (scope-bypass guard), OD-2 (Λ-floor session-entry hard gate), F2 (GREEN-then-failed)
- C5 dormancy audit at Session 17 (4-session window from BT-1 ship)
- 1-week observation window for empirical LF/intent_ratio baseline
