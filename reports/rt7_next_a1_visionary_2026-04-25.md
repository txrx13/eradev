# RT-7 NEXT-A1 — Visionary Strategic Framing

**Date**: 2026-04-25 | **Role**: [VISIONARY] (EN-stack, role: visionary_EN.md)
**Task**: Close 11f51be self-application BLOCK; lift CONSOLIDATION freeze
**Zone**: **Pull** (specific structural goal, measurable outcome — not exploratory)

## 1. IFR (past tense, measurable)
"Self-application deploy ran end-to-end on a clean clone of the framework repo: Builder produced a NEW commit re-creating CLAUDE.md from `templates/CLAUDE.md.template` (or its self-variant) without invoking the safety gate; Validator returned PASS (B≥0.70, no NOTES); RU-Visionary recomputed ψ*=Φ(ψ*) gap ≤10% (down from ~15%); CONSOLIDATION freeze lifted in `projects/eradev/roadmap.md`; framework Φ-applied to itself is a fixed point within the spiral 2% corridor — how did we get there?"

## 2. What 11f51be actually blocked (per `reports/v10_self_deploy_builder_2026-04-12.md` + commit msg)
The Builder did NOT fail. Builder correctly **refused to regress** live `CLAUDE.md` because:
- **Template drift (3 v10 features missing)**: header `## Domain Awareness (v9)` (line 22), Omega(H_hist) Session Entry note ABSENT, CronCreate background-extraction note ABSENT.
- **Path-prefix mismatch**: template uses consumer-oriented `eradev/eradev.md`, `eradev/roles/{role}_EN.md`; framework root is bare (no `eradev/` subdir).
- Validator (B=0.654) confirmed runtime CLAUDE.md is v10-clean on all 7 v10 features; the BLOCK is **artifact divergence**, not runtime drift.

So the BLOCK is a TEMPLATE-vs-LIVE invariance break, not a deploy failure. ψ* gap = "the canonical artifact a consumer would receive ≠ the artifact the framework runs on itself."

## 3. Root-cause hypothesis (3 candidates, ranked)
1. **[H1, ~70%] Template was frozen at v9 and forgotten when v10 features (Omega, CronCreate, BL-34/35 invariants) landed in live CLAUDE.md.** Mechanical drift — template needs `Domain Awareness (v9)→(v10)` flip + 2 note insertions. Single-file edit, Blast Radius LOW.
2. **[H2, ~25%] Single-template-for-two-contexts is structurally wrong.** Self-application (bare paths) and consumer (prefixed paths) are different deploy targets sharing one source — collapses ψ*-gap audit. Resolution: produce `templates/CLAUDE.md.self.template` variant, parameterize prefix.
3. **[H3, ~5%] BLOCK is a feature, not a bug.** The defensive gate firing on a stale template is exactly correct ODTOE behavior; ψ*-gap closure means **fixing the template once, then verifying the gate fires only on stale inputs** going forward. (This combines with H1 — fix the artifact, document the gate semantics.)

**Working hypothesis: H1 + H3 combined.** H2 is v11 territory (deferred — see roadmap Priority D).

## 4. Scope for closure
**MUST happen**:
- a) Update `templates/CLAUDE.md.template`: flip Domain Awareness header to v10; insert Omega(H_hist) note (after current line 58); insert CronCreate note (after Omega note); preserve consumer `eradev/`-prefix paths AS-IS.
- b) Re-run self-deploy with explicit acknowledgment of the dual-context reality: Builder either uses the (now-current) consumer template AND substitutes prefixes for self-application context, OR produces/uses a `CLAUDE.md.self.template` variant with bare paths.
- c) Validator re-verifies the 5-check list from Step 2 PASS WITHOUT NOTES; runs the same 7-feature v10 parity table the Builder ran on the template (post-fix) to confirm template ↔ live equality.
- d) RU-Visionary recomputes ψ*=Φ(ψ*) gap on post-fix state and confirms ≤10%.

**NOT required**: re-running `cp .claude/hooks/*.sh ...` — Validator already confirmed all 6 hooks executable + wired. Hook layer is clean.

## 5. Risks (top 3 with Blast Radius)
- **[FM-1] Template fix introduces new drift to live CLAUDE.md** | trigger: editor inserts trailing whitespace / wrong line numbers cited in spec | mitigation: Builder MUST diff post-edit template vs current CLAUDE.md after `{PROJECT}→eradev` substitution AND `eradev/`-prefix substitution; only ship if delta = 0 on the 7 v10 features. Blast Radius MEDIUM (template = consumer-facing bootstrap).
- **[FM-2] H2 surfaces mid-task** | trigger: Builder discovers consumer-prefix substitution can't be cleanly automated, requires `.self.template` variant, scope creeps from S→M | mitigation: pre-commit checkpoint after step (a). If (a) makes self-application diff = 0, ship and defer H2; if not, escalate to RT-2 with H2 as primary. Blast Radius LOW (caught at checkpoint, no live regression).
- **[FM-3] ψ* gap recompute still >10% after closure** | trigger: RU-V finds another structural FAIL beyond the template (e.g., skill mirror drift, lessons archive inconsistency) | mitigation: NEXT-A1 closes ONLY the template gap; remaining gap items become NEXT-A1.x children, not blockers for THIS RT cycle's deliverable. Blast Radius LOW (incremental). Operator must accept "≤10% within this scope" verdict per AC-3.

## 6. Lift conditions verify (how to recompute ψ* gap to ≤10%)
Spawn RU-Visionary post-Builder/Validator with the same instrument used in `rt5_full_audit_visionary_RU_2026-04-25.md` §3:
- Re-run the 5-axis ψ*=Φ(ψ*) checklist (B-modal, F3-F11, Ω, RIGOR_LEVEL, self-application).
- Self-application axis: confirm "Builder produced commit (NOT BLOCK), Validator PASS (NOT PASS WITH NOTES), template→live diff = 0 on v10 features." If yes: that axis flips from FAIL→PASS.
- Recompute weighted gap. Prior calc: 1 of 5 axes FAIL with ~weight 0.15-0.20 → ~15% gap. Closing self-application axis → expected gap 0-5% (within 2% spiral corridor + small residual from the deferred Direction-A/Hurwitz items, which are v11-scope).
- **Acceptance**: gap ≤10%. **Stretch target**: gap ≤5%.

## 7. Hand-off to Builder
**Files to touch (precise)**:
1. `templates/CLAUDE.md.template` (canonical source). Edits:
   - Line 22: `## Domain Awareness (v9)` → `## Domain Awareness (v10)`.
   - After Session Entry "13 items" line: insert `Item 9 now computes Omega(H_hist) and reports it in the bootstrap output (v10).`
   - Next line: insert `Optional: enable background extraction via CronCreate (see meta.md Background Instinct Extraction).`
2. After (1): re-run substitution mentally/via dry-run — `{PROJECT}→eradev`, `eradev/eradev.md→eradev.md`, etc. Diff against current `/Users/antonpankratov/Downloads/eradev/CLAUDE.md`. **If delta = 0 on the 7 v10 features → ship template fix as the closure artifact (no overwrite of live CLAUDE.md needed).**
3. If delta ≠ 0: surface to META, escalate to H2 path (`.self.template` variant). Do NOT overwrite live.

**Expected output**:
- One commit modifying `templates/CLAUDE.md.template` only (LOW blast radius, mechanical drift cleanup — ALLOWED under freeze per roadmap line 12).
- Builder report at `reports/rt7_next_a1_builder_2026-04-25.md` documenting: pre/post diff vs live, the 7-feature parity table now shows YES/YES/YES, BLOCK reason resolved.
- **No edits to live `CLAUDE.md`** (it is already v10-correct per Validator).

**Out of scope for Builder**: hook re-deploy, lessons.md updates, roadmap freeze-lift (Coherent task post-Validator PASS).

## 8. Acceptance Criteria & Failure Pre-mortem
**AC**:
- [AC-1] `templates/CLAUDE.md.template` post-edit, line 22 contains `(v10)`.
- [AC-2] `grep "Omega(H_hist)" templates/CLAUDE.md.template` returns ≥1 match.
- [AC-3] `grep "CronCreate" templates/CLAUDE.md.template` returns ≥1 match.
- [AC-4] Post-substitution template diff vs live `CLAUDE.md` shows 0 deltas on the 7-feature v10 parity table from Builder report §2.
- [AC-5] Validator re-runs Step 2 checklist → PASS without NOTES on template parity row.
- [AC-6] RU-Visionary ψ*-gap recompute → ≤10%.

**FM** (covered in §5 above): FM-1 trailing-whitespace/line-drift; FM-2 H2 scope creep; FM-3 residual gap >10%.

## 9. B-check (B_text, uniform weights — domain=code, type=config drift)
```
F (Focus):       0.95 — read commit, both reports, roadmap, L2 synthesis, RU-V audit, lessons EMP18 + L52-54, hook layout
E (Alignment):   0.95 — IFR addresses C1 convergent finding (L2 synthesis line 26); closure scope = artifact divergence, not runtime defect; honors freeze rules (mechanical drift cleanup ALLOWED)
(1-σ):           0.90 — no architecture conflict; H2 deferred to v11 explicitly; AC-4 enforces zero-delta to prevent live regression
Λ (Experience): 0.95 — applied EMP18 (gap >10%=freeze), BL-16 (knowledge with enforcement), BL-3 (no fix-chain — single mechanical edit), Inv-7 (one commit one phase), Validator's TEMPLATE-DRIFT-FOLLOWUP tag
B = 0.95 * 0.95 * 0.90 * 0.95 = 0.772
```
min(F,E,1-σ,Λ) = 0.90 ≥ 0.3 → no ANDON. B=0.77 ≥ 0.5 → ship to META.
