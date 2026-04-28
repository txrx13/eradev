# RT-1 [VISIONARY] — 2026-04-24

> Role: [VISIONARY] (EN stack, `roles/visionary_EN.md`)
> Scope: strategic direction on 2 questions — team composition rules + self-evaluation maturity
> Mode: RT-1 parallel (5 roles on same 2 questions)
> B_modality: text (framework artifact, code-adapter domain)

---

## 0. Activation Operator Log

- **A_F (Focus):** True North = framework stays PREDICTABLE for new operators AND ADAPTIVE for edge cases. Read ROADMAP implicit in v10 arc (BL-26→28→29→33→34→35 = progressive enforcement hardening, not feature growth). Zone: **Pull with Resonance flavor** — Q1 is navigational (concrete matrix), Q2 is cross-domain bridge (memory ⇄ execution ⇄ instinct).
- **A_E (Alignment):** Operator intent (from pre-RT framing "проверь — учтено ли условие сколько билдеров...") = make implicit rules explicit WITHOUT killing adaptive headroom. Cross-check Pull anchor: the framework exists to produce artifacts (code/prose/research), not to produce meta-matrices about itself. Any clarification must reduce session friction, not add ceremony.
- **A_σ (Consistency):** Gap G1 (per-role matrix) has NO architectural conflict — it condenses existing scattered rules. Gap G2 (parallel-role enumeration) conflicts with nothing but must preserve Invariant 13 as the override. Gap G3-G5 are polish. Q2 maturity ask: no conflict with existing Jidoka/Hansei — complements them.
- **A_Λ (Experience):** BL-33 enforcement-tier ladder says T1>T2>T3>T4. Composition rules today live mostly at T4+T3 — fragile for L/XL. BL-29 (gravity session divergence at 3 parallel Builders) is the cautionary tale: ad-hoc spawning without a matrix CAN produce semantic drift. BL-16 (knowledge without enforcement = Lambda zero) — writing a matrix without a hook = partial lift.

Status: 4 GREEN.

---

## 1. IFR for Q1 (Team composition rules)

**Past-tense, measurable:**

> "The per-role-per-size matrix was shipped in `eradev.md` Section X (one canonical table: S/M/L/XL × {V, A, B, Val, Coh-L1/L2/L3}); new operators answered 'how many of each role do I spawn for L with 2 modules?' in <30 seconds by reading ONE table; multi-Analyst / multi-Validator parallel patterns were explicitly enumerated next to File Ownership; session practice (4B+4V+4A) retrospectively mapped to the matrix with zero ad-hoc authorisation; a T2 hook validated spawn count against classified size before RT-1 synthesis — how did we get there?"

**Measurable AC:**
- [AC-1] Single matrix table in `eradev.md` Section X: rows = S/M/L/XL; cols = V, A, B, Val, Coh-L1, Coh-L2, Coh-L3.
- [AC-2] Operator answer-time for "spawn count for L/2-modules/structured" ≤30s (current: >5min reconstruction).
- [AC-3] Parallel-role enumeration sub-section covers all 5 roles (not just Builder) — states "Visionary parallel = FORBIDDEN" explicitly.
- [AC-4] Section X cites Section VI.1 FLUX override inline (single sentence), removing manual composition burden.
- [AC-5] T2 hook parses classified size from session entry and blocks if spawned count ≠ matrix floor (soft gate, ANDON-able).
- [AC-6] Skills-mirror `.claude/skills/eradev/reference/README_EN.md` synced via pre-commit drift check (fixes G4).

---

## 2. IFR for Q2 (Self-evaluation + post-task recommendations maturity)

**Past-tense, measurable:**

> "After every completed task, META produced a structured `post-task-recommendations.md` block containing (a) what worked / what nearly broke, (b) 1-3 concrete next-action candidates with priority tags, (c) BL_CANDIDATES staging diffs, (d) Omega-drift delta vs session start; the recommendations landed in `projects/{name}/recommendations.md` (append-only log) and were re-read at next session bootstrap as item 9.5; institutional memory no longer evaporated between sessions; Jidoka + Hansei + μ-check remained as IN-task gates, while recommendations became the BETWEEN-task connective tissue — how did we get there?"

**Measurable AC:**
- [AC-7] `projects/{name}/recommendations.md` append-only log exists per project; bootstrap reads it (new checklist item 9.5).
- [AC-8] Every task of size M+ ends with META-authored recommendations block (≤15 lines, 3 sections: worked / risked / next).
- [AC-9] Recommendations cross-reference BL_CANDIDATES staging for promotion candidates — no orphan insights.
- [AC-10] "What worked near-perfectly" AND "what nearly broke" both captured — not survivorship-biased.
- [AC-11] Next-session Omega comparison cites prior recommendations delta (did we act on them? drift?).

---

## 3. Top 3 Risks (both Qs)

### Risk R1 — Over-specification kills adaptivity (Q1 failure mode)
**Trigger:** Gap G1 matrix is published as HARD FLOOR, new operators treat it as ceiling too; Invariant 13 parallel-role permission gets deprecated by convention.
**Blast radius:** MEDIUM. Framework loses the 4-parallel-Analyst pattern that worked well on 2026-04-24; exploratory research sessions regress to rigid 5-role quintets.
**Mitigation:** Matrix MUST be labelled "floor, not ceiling" in the table caption; Invariant 13 cited inline as override; T2 hook fires YELLOW (advisory) below floor, never RED on exceeding.

### Risk R2 — Post-task recommendations become performative busywork (Q2 failure mode)
**Trigger:** Recommendations block mandated for EVERY task including S; operator/META produce low-signal boilerplate to satisfy the hook; signal-to-noise craters; BL_CANDIDATES fills with junk.
**Blast radius:** HIGH. Institutional memory gets WORSE, not better, because real signals drown in ceremony. Happened with early Jidoka Self-Check before block-level gating.
**Mitigation:** M+ only (exempt S); block must have concrete content rule (e.g., ≥1 specific file path OR ≥1 BL_CANDIDATE diff OR SKIP with one-line justification). Empty recommendations block = ANDON.

### Risk R3 — Session-practice drift normalised before matrix lands (cross-Q)
**Trigger:** Operator continues running 4B+4V+4A pattern for next 10+ sessions without explicit L2 Coherent spawn (§8.3 weakness from audit) → semantic-drift bug from BL-29 recurs; matrix ships AFTER a failure.
**Blast radius:** HIGH. We WROTE the rule on gravity-session drift (BL-29, `meta.md:210`) — repeating the failure means Lambda = zero for that lesson. Operator trust in the framework erodes.
**Mitigation:** Gap G1 is MUST-DO on same release window as Gap G2 (parallel-role enumeration); explicit L2 Coherent spawn becomes blocking before the matrix ships, not after.

---

## 4. Strategic Priority Ranking (A/B/C/D tiers)

### Tier A — NOW (this release window, pre-session-closure)
- **A1. Gap G1 (per-role-per-size matrix)** — MUST. Operator asked exact question; audit confirms; answers Q1 IFR's AC-1/AC-2.
- **A2. Gap G2 (parallel-role enumeration, esp. "Visionary-parallel = FORBIDDEN")** — MUST. Without it, matrix is incomplete; AC-3.
- **A3. Explicit L2 Coherent spawn rule for N_Builders ≥ 2** — MUST. Closes §8.3 practice gap; prevents BL-29 recurrence.

### Tier B — NEXT (v10 tech-debt sweep)
- **B1. Q2 recommendations.md append-only log + bootstrap item 9.5** — SHOULD. Institutional memory glue; AC-7/AC-8.
- **B2. Gap G3 (Section X cites Section VI.1 FLUX override inline)** — SHOULD. One-line fix, high operator ROI; AC-4.
- **B3. Gap G4 (skills-mirror drift hook)** — SHOULD. Prevents split-brain on RT Phase Protocols; AC-6.

### Tier C — SOON (v10.1 or v11 opening)
- **C1. T2 hook validating spawn-count vs matrix floor** — COULD. AC-5; adds enforcement tier but only valuable AFTER A1 lands.
- **C2. Gap G5 (L row "5-8" endpoint disambiguation)** — COULD. Polish, subsumed by A1 matrix.
- **C3. Gap G7 (L3 Coherent upper-bound ceiling)** — COULD. Edge case (5+ teams rare).

### Tier D — DEFER (v11 or later)
- **D1. Gap G6 (domain-skin 2-Builder exceptions to summary table)** — DEFER. Skins are DOMAIN-LOCAL by design; summarising risks flattening legitimate domain divergence.
- **D2. Full T1 type-level composition enforcement** — DEFER. Would require schema-validator infrastructure; ROI low until framework stabilises post-v10.
- **D3. RIGOR_LEVEL × size fused matrix as separate artifact** — DEFER. AC-4 inline reference suffices; full fusion matrix risks Risk R1 (over-specification).

---

## 5. Answers to sub-prompts

### Q1 True North question
**Rule-based determinism for the FLOOR; context-sensitive judgment for the CEILING.** The matrix is the minimum-viable spawn contract (new operator reads once, runs confidently). Invariant 13 + domain skins preserve the adaptive headroom. Both live in the same document with explicit "floor, not ceiling" labelling.

### Q1 over/under-specification
- **Over-specify (rigid matrix, no Invariant-13 escape):** kills parallel-Analyst and multi-proof-research patterns. Framework becomes brittle on edge cases. Damage: adaptive headroom lost, operator over-provisions OR under-provisions depending on which side of the rigid line the task falls.
- **Under-specify (current state):** operator bleeds tokens reconstructing the matrix every L/XL session (audit §9.2 shows ~5min of reasoning per session), semantic drift at 3+ Builders (BL-29 evidence), implicit L2 Coherent skipped (§8.3). Damage: per-session friction ~5min × N operators × M sessions = real tokens + real risk.

**Balance:** A1 matrix + A2 parallel-enumeration + "floor not ceiling" caption. Both failure modes addressed.

### Q1 blast radius — wrong composition on L/XL
- Under-provisioned L/XL (5 agents on 4-module XL): no L2 Coherent → semantic drift across Builders (BL-29 gravity formula 6π⁵ error recurs); HIGH blast.
- Over-provisioned M (spawning 10 agents when 5 suffice): token cost + coordination overhead + agent idle time; MEDIUM blast (wasteful but safe).
- Wrong role (2 Visionaries instead of 1 V + 1 A): strategic direction gets diluted; framework's Ô-uniqueness (eradev.md Section IV.1) violated; HIGH blast.

### Q2 current mechanisms assessment
Existing: Jidoka Self-Check (per-block), B-diagnostics (0.0-1.0), banality score, μ-check (plan alignment), Hansei at RT-3, BL_CANDIDATES staging, `/extract` skill. **These are the RIGHT mechanisms for IN-TASK and END-OF-TASK.** What's MISSING is BETWEEN-TASK connective tissue: a structured artifact that survives session close and feeds next session bootstrap. Hansei reports exist but aren't auto-consumed at next bootstrap. BL_CANDIDATES staged but not reviewed systematically.

### Q2 who/when/where for recommendations
- **Who:** META authors (not delegated — this IS meta-output, one of the 6 types; extends "Lessons" to "Lessons + Recommendations").
- **When:** End of every M+ task (immediately after Jidoka final check, before session close).
- **Where:** `projects/{name}/recommendations.md` append-only log, timestamped entries. Read at next bootstrap as checklist item 9.5.

### Q2 institutional memory risk
**YES, evaporates.** Currently: Hansei → `reports/` (read-once), BL_CANDIDATES → staging (reviewed manually, often skipped), `/extract` → ad-hoc. The `projects/{name}/lessons.md` is promotion-only (candidates → lessons). The GAP is: "what should the NEXT session start by considering?" — no channel. Without Q2 structure, every session starts with partial amnesia.

### Q2 priority — now or v11
**NOW, as Tier B (not Tier A).** Reasoning: Q1 matrix fixes an IMMEDIATE operator pain (asked-in-session). Q2 recommendations fix a STRUCTURAL silent-drift problem that compounds over sessions. If Tier A has capacity, Q2 Tier B lands in the same release window; otherwise, v10.1.

---

## 6. Decision

Ship A1 + A2 + A3 in this release window as MUST. Add B1 (recommendations log + bootstrap item 9.5) if capacity allows; else v10.1. Defer D-tier items to v11 explicitly with rationale logged.

Architectural integrity: all A-tier items condense EXISTING rules; zero conflict with v10 arc. Q2 B1 item adds ONE new file pattern (`recommendations.md`) — minimal surface area, fits existing `projects/{name}/` convention.

---

## 7. B-check (B_text modality, read-only strategic assessment)

- **F (Focus):** 0.92 — read visionary role file + full audit + anchored to ROADMAP implicit arc (BL-26→35 progressive hardening). 0.08 deduction for not tracing each gap back to its originating session.
- **E (Alignment):** 0.94 — IFRs past-tense + measurable; AC count 11 (target 3-8, slightly over but justified by 2-question scope); priority ranking tied to audit's M1-M4 + operator's literal ask. 0.06 deduction for interpretation in Tier B/C split.
- **1-σ (Consistency):** 0.93 — no contradictions with eradev.md / meta.md / CLAUDE.md; "floor not ceiling" framing preserves Invariant 13; Visionary-parallel FORBIDDEN rule derives from §IV.1 Ô-uniqueness. 0.07 buffer for un-audited edge cases in RIGOR_LEVEL × multi-role composition.
- **Λ (Experience):** 0.90 — applied BL-26/28/29/33/34/35 as interpretive lenses; gravity-session (BL-29) cited as primary cautionary tale for R3; BL-16 (knowledge without enforcement) as driver for T2 hook (AC-5). 0.10 deduction for not sourcing prior v9 RT-* composition proposals.

**B = F · E · (1-σ) · Λ = 0.92 · 0.94 · 0.93 · 0.90 ≈ 0.724 — GREEN.**

No component < 0.3; no ANDON trigger.

---

*Report authored by [VISIONARY] under META's direct request (Invariant 14) as RT-1 parallel role. Scope: strategic assessment, IFR, risk, prioritization only — NO implementation details. 2026-04-24.*
