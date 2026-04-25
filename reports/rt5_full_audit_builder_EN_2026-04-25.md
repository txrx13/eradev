# RT-5 Full Audit — Builder EN (Anti-Bloat Lens)
Date: 2026-04-25 | Scope: v10 since Bundle A+B+C+D + PTv2 + Q1/Q2/Q3 (commits 43c886a..0205b40)

## 1. Actionability Matrix (today, on a fresh task)

| Asset | Where | Usable today? | Friction | Verdict |
|---|---|---|---|---|
| §X.1 per-role counts | eradev.md L942 | YES — clear S/M/L/XL × V/A/B/Val/C grid | none, single read | GREEN |
| §X.2 parallel patterns | eradev.md L967 | YES — Visionary SINGLETON, B/A parallel rules explicit | requires reading File Ownership Protocol L960 | GREEN |
| Item 5c BASELINE HEALTH | meta.md L292 | YES — triggers on executable verify.method | requires `domain.verify.command` populated; eradev project has it | GREEN |
| μ-check (RIGOR_LEVEL branch) | meta.md L349-374 | PARTIALLY — strict/structured paths actionable; exploratory/emergent advisory paths are prose-only | no concrete `flux_check` template artifact yet | YELLOW |
| Four Working Habits | eradev.md L696-710 | YES (#2, #4 universal); #1, #3 qualified | qualifier prose adds ~6 lines per habit; readable but heavy | YELLOW |
| Composition-hazards grid (BL-34) | templates/composition_hazards.template.md | YES — template exists, Invariant 15 enforces | rare trigger (>=2 refactors); cost amortizes only across them | GREEN |
| Interlocked-sequence template (BL-35) | templates/interlocked_sequence.template.md | YES — Invariant 16 + regex detector | regex covers RU+EN | GREEN |
| RIGOR_LEVEL declaration | unified_plan.md.template Rigor Map | YES if Analyst fills it; SILENT FAILURE if omitted | no enforcement: missing rigor_map → defaults to project rigor_default — fine, but no warn signal | YELLOW |
| Domain skins (6) | templates/domain_skin.{type}.md | YES, byte-mirrored EN/RU | 12 files to keep in sync = bilingual debt | YELLOW |
| BL-22 hybrid (sub-a CODE / sub-b UNIVERSAL) | BL.md L162 | YES — extension preserves cap | re-reading users will find sub-numbering unusual | GREEN |

## 2. Tooling gaps (missing surface for the new rules)

| Need | Status | Severity |
|---|---|---|
| `flux_check` verify-method template / runner | NOT EXIST | MED — exploratory/emergent has rule, no artifact |
| `reports/baseline-{TASK}-{DATE}.md` template | NOT EXIST (item 5c references it) | LOW — Analyst Check Agent can synthesize one-shot |
| Rigor Map auto-detector hook (segment glob → level) | NOT EXIST | LOW — currently manual in Analyst |
| BL-34 grid validator (counts pairs vs N(N-1)/2) | NOT EXIST | LOW — Coherencer manual gate |
| µ-check runner (binary PASS/FAIL emitter) | PROSE-ONLY, no script | MED — Coherencer eyeballs 7 checks |
| `hooks/` directory | DOES NOT EXIST | LOW — references in BL-33 ladder are aspirational |

`hooks/` absence is the single largest gap: BL-33 enforcement ladder names "type > hook > checklist > docs" but the middle tier has no implementation. All v10 enforcement collapses to checklist + docs.

## 3. Anti-bloat verdict (~34 framework additions in v10)

**Count check** (v9→v10): 17 invariants (was 14) + BL-33/34/35 + 4 RIGOR_LEVELs + FLUX protocol + 6 domain skins + 8 verify-methods + Four Habits + μ-check + composition-hazards + interlocked-sequence + 4 hooks-aspirational + Item 5c + Ω(H_hist) computation + 51 lessons in eradev project alone.

eradev.md grew to 1135 lines (+141 since Wave 8). meta.md at 496 lines. Five lessons added in last 2 sessions (L-46..L-51 + EMP15..EMP17).

**Diminishing returns triage:**

| Addition | ROI | Keep / cut / consolidate |
|---|---|---|
| RIGOR_LEVEL axis + FLUX | HIGH — closes creativity gap; 4-bucket ontology is minimal-sufficient | KEEP |
| BL-34 + BL-35 + Invariants 15/16 | HIGH — directly killed PLUGY rework episode | KEEP |
| Item 5c BASELINE HEALTH | HIGH — eliminates "built on broken main" failure class for ~30s/session | KEEP |
| Ω(H_hist) computation in item 9 | LOW — cross-project lesson scan computed but acted on rarely; add YELLOW threshold worked once | CONSOLIDATE — fold into Λ-audit summary line |
| Four Habits qualifier prose | LOW — adds ~24 lines for a "sometimes don't apply" message that is already captured in RIGOR_LEVEL | CONSOLIDATE — move qualifiers to §VI.1 FLUX, leave bare habits in §IV |
| Domain skins × 2 (EN+RU) × 6 types = 12 files | MEDIUM — most projects use code default; 11 files cold | KEEP but FREEZE additions; no 7th skin without RT-1 |
| 8 verify-methods | MEDIUM — `flux_check`, `doc_alignment`, `structure_check` overlap | CONSOLIDATE — `doc_alignment` + `flux_check` is 2; collapse `structure_check` into `parse` |
| 51 lessons in eradev/lessons.md | risk: T2 budget bloat | COMPRESSION pass — Coherencer triggered at >50 active (already in 5d) |

**Net diminishing returns indicator:** Builder spawn cost (read eradev.md 1135 + meta.md 496 + role file ~100 + project config ~40) ≈ 1770 lines minimum context per agent. Pre-Bundle-D was ~1500. **+18% per-agent context cost** for ~12% net new usable behavior. Not catastrophic, but trending: one more bundle and we hit 2000-line minimums, where bilingual mirrors become genuine load-bearing cost.

## 4. Net Practical Readiness — YELLOW

| Sub-axis | Color | Reason |
|---|---|---|
| Rules implementable today | GREEN | Invariants 15/16, Item 5c, X.1/X.2 are usable on next M-task |
| Tooling parity | YELLOW | hooks/ missing, μ-check has no runner, flux_check has no template |
| Bloat trajectory | YELLOW | +18% context cost per agent in 2 weeks; OK for now, not OK for v10.next |
| Self-application | YELLOW | 0205b40 ships "Partial RT-1" — framework's own protocol fails under load (rate-limit). Rules exist; resilience under degraded conditions lags |
| Consolidation hygiene | GREEN | Bundle D properly extended BL-22 instead of adding BL-39 (L-50 lesson). EMP17 rejected duplicate recommendations.md. Healthy reflexes |

**Anti-bloat verdict:** v10 is **at the bend** of the diminishing-returns curve. The last 4 additions (Bundle D + Q1/Q2/Q3) each carried real ROI; the next 4 will not. Recommend Visionary's R1 (CONSOLIDATION window) — freeze BL/Invariants for 4 sessions, build the missing tooling tier (hooks/, μ-check runner, flux_check template), then re-audit. Builder concurs with Visionary on R1; adds: prioritize hooks/ scaffolding before any new framework rule.

## 5. Consolidation moves (low-cost, no new rules)
1. Fold Four Habits qualifiers into §VI.1 FLUX (-12 lines §IV).
2. Collapse `structure_check` → `parse` (duplicate semantics).
3. Author `flux_check` template + `hooks/` stubs (BL-22 runner, μ-check binary, BL-34 pair-counter) — activates BL-33 middle tier.
4. Ω(H_hist): emit only at YELLOW threshold (>2.0), not every session — Muri reduction.

## B-check (B_text, uniform)
- F=0.85 — read v10 commits, §X/§IV/§VI.1/§III.3, meta §14/μ-check, BL-22/33/34/35, templates, L-46..L-51+EMP17. Skipped deep-read of 6 skin pairs.
- E=0.92 — addressed brief verbatim (counts, gaps, ROI judgement, RAG).
- (1-σ)=0.90 — checked repo state for invariant/skin counts; RIGOR_LEVEL ⊥ Modal-B observed.
- Λ=0.88 — invoked L-50 (extend>add), EMP17 (no duplicate artifact), Visionary R1.

**B = 0.85 × 0.92 × 0.90 × 0.88 = 0.620 → YELLOW**

## Builder Result
Modified artifacts: this file. Verification: doc_alignment (anti-bloat brief covered, tables populated). Validation: cross-checked vs eradev.md L942, meta.md L292/L349, templates/, BL.md L162-260, lessons.md L316-331. Blast Radius: LOW.
