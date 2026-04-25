# RT-6 Lessons Compression — Coherencer Report (2026-04-25)

**Trigger**: meta.md item 9 (active count >50). Source: 54 L-N + 18 EMP = 72 total in lessons.md. Mode: EMP18 CONSOLIDATION + L-50 (extend > add).

## Decisions

| Lesson | Decision | Rationale |
|---|---|---|
| L-1 | ARCHIVE | Superseded by Inv 13 (MAX parallelization codified). |
| L-2 | ARCHIVE | Superseded by EMP9 (independent recomputation principle). |
| L-3 | ARCHIVE | Codified in CLAUDE.md Language Stack. |
| L-4 | ARCHIVE | Codified in eradev.md Section 0 inline routing. |
| L-5 | SUPERSEDE | Superseded by L-11 (3-Layer Identity Enforcement). |
| L-6 | ARCHIVE | Historical decision permanent in meta.md §14. |
| L-7 | ARCHIVE | Superseded by L-23 + EMP3; BL-19 in eradev.md. |
| L-8 | SUPERSEDE | Superseded by EMP11 (7-step pipeline subsumes Check-First). |
| L-9 | SUPERSEDE | Superseded by L-22 (S_adjusted operational use) + EMP9. |
| L-10 | ARCHIVE | Project-specific tooling note (cross_project=false). |
| L-11..L-12 | KEEP | Active load-bearing (L-11 referenced by L-5 supersede). |
| L-13 | ARCHIVE | Codified in eradev.md RT protocols. |
| L-14 | SUPERSEDE | Superseded by L-50 (extend > add). |
| L-15..L-54 | KEEP | All active and cited in current invariants/EMPs. |
| EMP1..EMP18 | KEEP (immortal) | EMPs never archived per spec. |

## Counts (before / after)

| Category | Before | After |
|---|---|---|
| Active L-N lessons | 54 | 42 |
| Superseded L-N (kept tagged) | 0 | 4 |
| Archived L-N (moved to archive) | 0 | 8 |
| EMPs (active, immortal) | 18 | 18 |
| Total active items | 72 | 60 |

Target was active L-N ≤45 with 5 buffer. Achieved 42 → 3 buffer remaining (conservative — surgical preference per task rule 4).

## Files modified

- `projects/eradev/lessons.md`: 8 ARCHIVED entries replaced by 2 group stubs; 4 SUPERSEDED entries tagged with `superseded_by` pointer + supersede note.
- `projects/eradev/lessons_archive.md`: Compression Pass 2026-04-25 section added with all 8 archived lessons preserved verbatim + per-lesson archive rationale + temporal triple `ended: 2026-04-25` + `superseded_by` field.

## B-check (B_text, uniform weights)

- F (Focus): 0.95 — all candidates inspected against current framework artifacts; cross-references verified (L-11 exists, EMP11 exists, L-50 exists, L-22 exists, EMP9 exists, eradev.md Section 0/RT protocols/Language Stack confirmed).
- E (Alignment): 0.92 — preserved L-50 directive (extend beats add) + EMP18 CONSOLIDATION mode + spec rule 4 (surgical > aggressive); EMPs untouched per immortality rule.
- (1−σ): 0.93 — zero contradictions: archived lessons removed from active count but preserved in audit trail; superseded lessons kept-tagged with explicit pointer to successor; no orphan references.
- Λ (Experience): 0.90 — applied L-50 (extend > add) to ARCHIVE/SUPERSEDE distinction; applied L-22 phantom check (verified successor lessons actually subsume archived content, not just adjacent).

**B = 0.95 × 0.92 × 0.93 × 0.90 = 0.732** — GREEN, exceeds B_min=0.5.

## Spiral gap (~2%)

EMP6/EMP15 still cite "BL-1 through BL-21" historical numbering; future BL audit may want to refresh historical references in EMP bodies. Left as fuel for next RT — out of scope for compression pass.
