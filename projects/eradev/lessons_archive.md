# EraDev Self-Project -- Lessons Archive (T3 Wisdom)

> This file contains superseded and archived lessons from lessons.md.
> Archival preserves the audit trail -- nothing is deleted.
> Lessons here retain all temporal metadata (valid_from, ended, superseded_by).
> To recall an archived lesson into T2 session context, Coherencer pulls it at Lambda Audit.

## Archived Lessons

### Compression Pass 2026-04-25 (RT-6, EMP18 CONSOLIDATION mode)

Active count exceeded 50 threshold (54 L-N lessons + 18 EMPs). Per item 9 trigger + L-50 (extending BL beats adding) + EMP18 ψ*-gap freeze rule, Coherencer ran surgical compression on Sessions 1–3 lessons whose content has been codified into framework artifacts (eradev.md, meta.md, BL, Invariants, EMPs, hooks) or superseded by later lessons.

EMPs untouched (immortal).

---

### L-1: 25-agent parallel analysis produces emergent insights [ARCHIVED 2026-04-25]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: Inv-13 | cross_project: true -->
Archive rationale: superseded by Invariant 13 "MAX parallelization by DEFAULT" — content codified in CLAUDE.md as enforced rule; 25-agent observation is a historical instance of the codified principle.

1. **25-agent parallel analysis produces emergent insights.** Individual RT teams found different issues. RT1 found duplication (25-30%). RT2 found Lambda problem. RT3 found evolution patterns. RT4 found ODTOE formula errors. Only synthesis (RT5) could see the full picture.

### L-2: P_coll error propagated across multiple documents [ARCHIVED 2026-04-25]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: EMP9 | cross_project: true -->
Archive rationale: superseded by EMP9 (structural invariance is the signature of correct abstraction) which generalizes the "independent recomputation > consensus" principle into a universal verification rule.

2. **P_coll error propagated across multiple documents.** The value 0.61 (incorrect) for P_coll at B=0.3, n=3, k=1 was present in eradev_old, eradev_last, and multiple articles. Correct value: 0.657. All 20 analytical agents missed it until RT4-Validator specifically recomputed. Lesson: formula verification requires independent recomputation, not consensus.

### L-3: A/B experiment RU vs EN language stack selection [ARCHIVED 2026-04-25]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: CLAUDE.md-LanguageStack | cross_project: true -->
Archive rationale: codified in CLAUDE.md "Language Stack" section + eradev.md Section 0 routing. Empirical finding (48% B-score difference) is now permanent framework rule, not a lesson to remember.

3. **A/B experiment RU vs EN (10 agents): EN prompts give 48% higher B-score for practical tasks.** But RU agents produce deeper mathematical innovations (phi-weighted S_team, Graduated Activation). Neither language is universally better — the task type determines the optimal language stack.

### L-4: Inline routing vs external router [ARCHIVED 2026-04-25]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: eradev.md-Section0 | cross_project: false -->
Archive rationale: historical design decision now permanent in eradev.md Section 0 (inline routing is the implemented architecture). No remaining decision pressure.

4. **A/B experiment router.md vs eradev.md Section 0 (10 agents): inline routing wins.** External router.md split the team (Builder went EN, 4 others went RU), creating inter-stack divergence. Inline routing in Section 0 let agents self-determine without forced classification.

### L-6: Enforcement mechanisms belong in META protocol [ARCHIVED 2026-04-25]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: meta.md-Section14 | cross_project: true -->
Archive rationale: historical decision (Section 0.5 created then merged into meta.md §14). Outcome permanent in meta.md; principle subsumed by EMP4 (enforcement must live where it fires).

6. **Section 0.5 was created then removed (5-role vote: 3 vs 2).** Checklist in eradev.md created self-reference problem (checklist inside the file it verifies). Merged into meta.md Section 14 per Option C. Lesson: enforcement mechanisms belong in the META protocol, not in the universal core.

### L-7: Bilingual sync must be simultaneous [ARCHIVED 2026-04-25]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: L-23 + EMP3 | cross_project: true -->
Archive rationale: superseded by L-23 (language-bound regex is bilingual bug) which provides mechanical enforcement principle, plus EMP3 (bilingual architecture is feature). BL-19 sync rule itself is documented in eradev.md.

7. **Bilingual files created without simultaneous sync = immediate tech debt.** eradev_RU.md was created at v7.0, eradev.md was updated to v7.1. Sync audit found 5 HIGH issues. Fix: BL-19 (bilingual sync rule) now in eradev.md Section 0.

### L-10: Selective converter execution [ARCHIVED 2026-04-25]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: project-tooling | cross_project: false -->
Archive rationale: project-specific tooling note (tex2md.py converter). No longer in active toolchain; project-local concern. Cross_project: false confirms low reuse value.

10. **tex2md.py regeneration creates unwanted EN files.** Running the converter on all .tex files (including _EN versions) created EN markdown copies that user didn't request. The converter should be run selectively, not on all files.

### L-13: RT-1 REJECT is healthy [ARCHIVED 2026-04-25]
<!-- valid_from: 2026-04-07 | ended: 2026-04-25 | superseded_by: eradev.md-RT-protocols | cross_project: true -->
Archive rationale: principle codified in eradev.md RT protocols (RT-1 outcome ∈ {ACCEPT, REJECT, MODIFY}). REJECT-as-healthy is now a framework property, not a lesson.

13. **RT-1 can REJECT a proposal — this is healthy.** RT-1 on eradev.md decomposition ran 5 roles, 3/5 rejected the split. In-place Part I/II markers accepted as alternative. REJECT is the system working correctly.
