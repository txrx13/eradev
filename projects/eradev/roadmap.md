# EraDev Self-Project Roadmap

> Forward plan per Q2 canonical model (meta.md §15 Post-task Recommendations Placement).
> Updates: live (any session may amend Next Steps).

## Current state (2026-04-25)
v10 series — last commit fccf730. Stable framework, ψ*=Φ(ψ*) gap ~15% per RU-Visionary RT-5 audit.

## ⚠ ACTIVE FREEZE: CONSOLIDATION mode (EMP18 trigger)
Reason: self-application gap >10% (commit 11f51be Builder BLOCK + Validator PASS WITH NOTES on self-deploy).
Per EMP18: NO new BL or Invariants until ψ* gap closes to ≤10%.
Bug fixes, mechanical drift cleanup, hook upgrades — ALLOWED.
NEW theoretical content — BLOCKED.

## Next Steps (M+ tasks pending operator approval)

### Priority A: ψ* convergence
- **NEXT-A1**: Close 11f51be self-application BLOCK
  - Source: RT-5 EN-V R2 + L2 C1 HIGH
  - Type: M-task RT-1 (full 5-role)
  - Scope: re-run skill bundle self-deploy (cp eradev/.claude/hooks/*.sh ...) on this repo with Builder NOT blocked, Validator PASS clean
  - Blocker for: lifting CONSOLIDATION freeze

### Priority B: Tier-claim integrity (L-52 enforcement)
- **NEXT-B1**: BL-19 bilingual-sync hook (tier-upgrade T4→T2)
  - Source: RT-5 EN-Validator B=0.381 ANDON
  - Type: M-task RT-2 (Validator-led + Builder)
  - Scope: pre-commit hook diff EN/RU file pairs, exit 1 if single-language edit detected
- **NEXT-B2**: rework-framing-detector exit 0 → exit 2 (advisory → BLOCK)
  - Source: RT-5 EN-Validator
  - Type: S-task (1-line hook change + test)
  - Scope: `.claude/hooks/rework-framing-detector.sh` exit semantics align with BL-35 mandated BLOCK

### Priority C: Recommendations from research wave (deferred)
- **NEXT-C1**: Adopt Galileo Cronbach α for subjective verifiers (readability/dry_run)
- **NEXT-C2**: SCF arxiv 2604.16339 gap analysis — Drift Monitor + Conflict Detection artifact
- **NEXT-C3**: MultiAgentBench 2-3 KPIs into Hansei template

### Priority D: v11 deferrals
- σ-aggregation function specification (RU-Analyst HIGH)
- F4×σ composition lemma (RU-Analyst HIGH)
- F4 set-theoretic restriction (RU-Validator D1)
- L9 metric d formalization (RU-Validator D2)
- Hurwitz Direction A shipping decision OR retire (RU-Coherencer RV-RU-03)
- Per-modality Ω-α calibration (RU-Visionary R-T2)
- HANSEI_TEMPLATE.md A3 alignment (RU-Coherencer RV-RU-01)
- Direction C "phase transition" — verify or retire (RU-Coherencer RV-RU-02)
- Nemawashi BL or retire (RU-Coherencer RV-RU-04)

## Lifting CONSOLIDATION freeze
Conditions:
- NEXT-A1 closed (self-application BLOCK resolved)
- ψ* gap recomputed ≤10% (rerun RU-V test)
- 4 sessions of stability (no new fix chains)

## Maintained while frozen
- Hook upgrades (NEXT-B1, NEXT-B2)
- Mechanical drift cleanup
- Documentation accuracy
- Skill-mirror sync
