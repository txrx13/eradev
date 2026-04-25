# EraDev Self-Project Roadmap

> Forward plan per Q2 canonical model (meta.md §15 Post-task Recommendations Placement).
> Updates: live (any session may amend Next Steps).

## Current state (2026-04-25)
v10 series — RT-7 closure (dbc08a4) shipped: NEXT-A1 self-application BLOCK closed (a79654c + b1486ed remediated), bilingual hook live, exit-2 BLOCK semantic in rework-framing-detector, Galileo Cronbach α adopted, MultiAgentBench KPIs in Hansei. ψ*-gap reduced from ~15% (RT-5 RU-V audit) to ≤7% (RT-7 closure validator).

## 🟡 CONDITIONAL LIFT PENDING (was: ACTIVE FREEZE)

CONSOLIDATION lift conditions status (2026-04-25):
- ✅ #1 NEXT-A1 self-application BLOCK CLOSED (a79654c + b1486ed remediated, dbc08a4 declared)
- ✅ #2 ψ*-gap ≤10% MET (was ~15%, now ≤7% per RT-7 closure validator)
- 🟡 #3 4 sessions stability — 3/4 (Sessions 8, 9, 10 stable; Session 11 in progress)

After Session 11 ends without fix chains / rework triggers / Builder BLOCKs:
- All 3 conditions MET → operator may declare lift
- Lift unlocks: new BL/Invariants, new theoretical content в eradev.md, new domain skins, new verify methods

While lift pending (Session 11 active):
- Mechanical drift cleanup ALLOWED
- Hook upgrades ALLOWED (Tier-claim integrity sweep ongoing)
- Documentation ALLOWED
- Lessons.md additions ALLOWED (observations, not rules)
- NO new BL/Invariants until lift declared
- NO new theoretical content

## Next Steps (M+ tasks pending operator approval)

### Priority A: ψ* convergence
- ~~**NEXT-A1**: Close 11f51be self-application BLOCK~~ ✅ **CLOSED 2026-04-25** (RT-7 dbc08a4)
  - Source: RT-5 EN-V R2 + L2 C1 HIGH
  - Type: M-task RT-1 (full 5-role) — completed
  - Scope: re-run skill bundle self-deploy (cp eradev/.claude/hooks/*.sh ...) — Builder NOT blocked, Validator PASS clean (a79654c + b1486ed remediated)
  - Outcome: Closed lift condition #1; ψ*-gap closed to ≤7% (lift condition #2)

### Priority B: Tier-claim integrity (L-52 enforcement)
- ~~**NEXT-B1**: BL-19 bilingual-sync hook (tier-upgrade T4→T2)~~ ✅ **CLOSED 2026-04-25** (RT-7 dbc08a4)
  - Source: RT-5 EN-Validator B=0.381 ANDON
  - Type: M-task RT-2 (Validator-led + Builder) — completed
  - Scope: pre-commit hook diff EN/RU file pairs, exit 1 if single-language edit detected — bilingual hook + 10/10 tests delivered
- ~~**NEXT-B2**: rework-framing-detector exit 0 → exit 2 (advisory → BLOCK)~~ ✅ **CLOSED 2026-04-25** (RT-7 dbc08a4)
  - Source: RT-5 EN-Validator
  - Type: S-task — completed
  - Scope: `.claude/hooks/rework-framing-detector.sh` exit semantics align with BL-35 mandated BLOCK
- **Priority B status note**: Tier-claim integrity sweep continuing in RT-8 for Inv 17 + §X.1/§X.2.

### Priority C: Recommendations from research wave (deferred)
- ~~**NEXT-C1**: Adopt Galileo Cronbach α for subjective verifiers (readability/dry_run)~~ ✅ **CLOSED 2026-04-25** (RT-7 dbc08a4)
- ~~**NEXT-C2**: SCF arxiv 2604.16339 gap analysis — Drift Monitor + Conflict Detection artifact~~ ✅ **CLOSED 2026-04-25** (research wave, DEFERRED v11) — SCF gap analyzed
- ~~**NEXT-C3**: MultiAgentBench 2-3 KPIs into Hansei template~~ ✅ **CLOSED 2026-04-25** (RT-7 dbc08a4)

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
Conditions (status 2026-04-25):
- ✅ NEXT-A1 closed (self-application BLOCK resolved — RT-7 dbc08a4)
- ✅ ψ* gap recomputed ≤10% (≤7% per RT-7 closure validator)
- 🟡 4 sessions of stability (3/4 — Sessions 8, 9, 10 stable; Session 11 in progress)

Lift declaration: operator authority only. Triggers when Session 11 ends without fix chains / rework triggers / Builder BLOCKs.

## Maintained while lift pending
- Hook upgrades (Tier-claim integrity sweep ongoing — RT-8 for Inv 17 + §X.1/§X.2)
- Mechanical drift cleanup
- Documentation accuracy
- Skill-mirror sync
- Lessons.md observations (not rules)
