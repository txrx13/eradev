# Proposals: Role File Improvements from Rybakov Approach Analysis

> Date: 2026-04-04
> Source: RT-1 Rybakov Approach Analysis (S_coherence = 0.88)
> Scope: Universal role files (visionary.md, validator.md, coherent.md)
> Status: PROPOSAL — requires separate RT before implementation
> Why separate: These files affect ALL projects, not just ODTOE articles

---

## Proposal 1: Failure Modes + Acceptance Criteria in Visionary RT-1

**File:** `visionary.md` → Inverted IKR block
**Current state:** Visionary produces IKR (Ideal Final Result) and risk assessment at RT-1.
**Proposed addition:** After IKR, Visionary MUST produce two additional artifacts:

### A. Acceptance Criteria (5-12 items)
Concrete, measurable conditions for task acceptance. Examples for articles:
- "All formulas recomputed to 50 digits with python3 verification"
- "EN/RU parity >= 0.80 (wc -l ratio)"
- "Zero corpus transliteration errors (grep check)"
- "Every new formula has DERIVATION.md"

### B. Failure Modes (3-7 items)
Structured pre-mortem — ways the task could fail. Examples:
- "Parameter fitting masked as derivation (L-23 repeat)"
- "EN version is summary, not translation (L-25 repeat)"
- "Parallel Builders produce contradictory notation (L-29 repeat)"

**Rationale:** The gravity session (S_session=0.40) lacked explicit definition of "what does DONE mean." Coaching Kata asks "What obstacles?" but does not require a structured failure mode catalog. Acceptance criteria anchor Validator's gate to task-specific conditions rather than generic checks.

**Cost:** ~10 lines added to visionary.md output template.

**Relevant BLs:** BL-17 (pre-generate verification), BL-21 (format specs as inputs), AMP7 (BUDGET for XL).

---

## Proposal 2: SPLICING Audit in Validator

**File:** `validator.md` → Obligations section
**Current state:** Validator performs 7 verification checks (for articles) or code review + edge cases (for code). No structured adversarial self-audit step.
**Proposed addition:** New obligation before issuing PASS/BLOCK verdict:

### Obligation 6: Self-Audit (Splicing Protocol)

Before verdict, Validator executes 5 steps:

1. **Contradictions:** Grep for conflicting numerical values, contradictory claims, or inconsistent terminology across sections. For articles: `grep -oP '\d+\.\d{3,}' combined.tex | sort | uniq -cd` (L-29 enforcement).
2. **Ambiguity:** Identify any statement that admits two readings. Flag with suggested clarification.
3. **Red-teaming:** Construct a counter-argument to the central thesis using the artifact's own data. If the counter-argument is stronger than the thesis, escalate to RT-2.
4. **Irrelevant material (introns):** Flag sections/paragraphs that do not serve the stated goal (IFR). Propose removal.
5. **Missing coverage (exons):** Check if acceptance criteria (Proposal 1) have items not addressed. Flag gaps.

**Rationale:** The 6pi^5 contradiction between Section V and Appendix C in the gravity session survived all 7 checks because Validator never did a systematic cross-section contradiction scan. SPLICING formalizes what a good Validator already does implicitly — but implicit processes are not enforceable (BL-16: reading != applying).

**Cost:** ~15 lines added to validator.md.

**Relevant BLs:** BL-6 (verify before act), BL-23 (yokoten grep after fix), BL-27 (artifact validity gate).

---

## Proposal 3: REQUIRES_VERIFICATION Register in Coherencer

**File:** `coherent.md` → Crystallization of Distinctions block
**Current state:** Coherencer produces A3 template with "Open Questions (~2%)" field. No structured register of what specifically remains unverified.
**Proposed addition:** Mandatory companion artifact at RT-3:

### REQUIRES_VERIFICATION Register (max 10 items)

Format:
```
[RV-01] {Claim} | {Section/File} | {Why unverified} | {What would verify it}
[RV-02] ...
```

Sources:
- Builder's `% [HYPOTHESIS]` and `% [OPEN]` markers (Check 8 from config.md)
- Validator's SPLICING audit gaps (Proposal 2)
- RT-3 open questions

The register persists as `ODTOE_{topic}_OPEN_QUESTIONS.md` (for articles) or appended to MEMORY.md (for code tasks). It feeds into the spiral gap (~2%, BL-15) with concrete tracking rather than abstract acknowledgment.

**Rationale:** "Spiral gap ~2%" is a philosophical principle (BL-15) but has no structured mechanism for tracking WHAT SPECIFICALLY remains unverified. The gravity session shipped multiple unverified claims with no tracking — they were simply treated as verified. An explicit register makes the boundary between "verified" and "open" auditable.

**Cost:** ~8 lines added to coherent.md.

**Relevant BLs:** BL-15 (spiral gap is a feature), BL-5 (phantom coherence detection).

---

## Implementation Notes

- All three proposals modify **universal role files** — they affect every project, not just ODTOE
- Recommend implementing as a single RT (M-size task) with bilingual sync (BL-19: visionary.md has no RU pair currently, but validator.md and coherent.md do)
- Proposals 1 and 2 are strongly coupled (acceptance criteria feed into SPLICING coverage check)
- Proposal 3 depends on Check 8 (evidence markers) being implemented first in config.md

## Cross-References

- RT-1 full analysis: `reports/RT1_rybakov_approach_analysis_2026-04-04.md`
- Gravity session lessons: `projects/odtoe-articles/lessons.md` (L-21..L-30)
- Hansei report: `reports/hansei_gravity_session_2026-04-04.md`
