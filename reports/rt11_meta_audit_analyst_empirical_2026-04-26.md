# RT-11 META Audit — Analyst Empirical Delta

**Baseline:** `b1486ed` 2026-04-23 21:17:29 +0300 ("Fix CLAUDE.md template v9->v10 body drift")
**Current:**  `758143c` 2026-04-26 ("Wave A post-CONSOLIDATION-lift: 4 framework improvements")
**Span:** 3 calendar days, 14 commits between. Empirical only.

## 1. Volume

| Metric | Value |
|---|---|
| Files changed | 128 |
| Insertions | +11,930 |
| Deletions | −147 |
| Net | +11,783 |
| Insert/delete ratio | 81 : 1 |

File-group split: `reports/` 49 (38%), templates 8, `roles/` 4, `projects/eradev/` 4, other 63.

### Per-file core delta
| File | Base lines | Curr lines | Δ% | Δ bytes |
|---|---|---|---|---|
| `eradev.md` | 878 | 1,149 | **+30.9%** | +34,156 |
| `meta.md` | 442 | 519 | **+17.4%** | +6,861 |
| `CLAUDE.md` | 105 | 107 | +1.9% | +1,748 |
| `BOOTSTRAP_LESSONS.md` | 258 | 266 | +3.1% | n/a |
| `FOUNDATIONS.md` | 317 | 379 | **+19.6%** | n/a |
| `roles/analyst_EN.md` | 79 | 109 | **+38.0%** | n/a |
| `roles/coherent_EN.md` | 97 | 128 | **+32.0%** | n/a |
| `projects/eradev/lessons.md` | 294 | 361 | +22.8% | n/a |

### Counters
| Counter | Base | Curr | Δ |
|---|---|---|---|
| Invariants in `CLAUDE.md` | 16 | 17 | +1 (Inv 17 τ_cycle) |
| BL entries (BOOTSTRAP_LESSONS.md `### BL-`) | 30 | 30 | 0 (content modified) |
| L-N in `lessons.md` (live) | 45 | 53 | +8 |
| L-N in archive (new file) | 0 | 8 | +8 |
| EMP-N in lessons | 15 | 20 | +5 |
| `reports/` (in git) | 130 | 199 | +69 (+53%) |
| Hooks `.claude/hooks/*.sh` | 6 | 6 | 0 |
| Hooks `.githooks/*.sh` | 0 | 2 | **+2** |

## 2. Complexity (sections)

| File | Base `## + ###` | Curr | Δ |
|---|---|---|---|
| `eradev.md` | 47 | 54 | +7 |
| `meta.md` | 26 | 29 | +3 |

New sections in `eradev.md`: `III.2 Parallel Trajectories` (τ_cycle + F3/F6), `III.3 RIGOR_LEVEL`, `Four Working Habits`, `VI.1 FLUX RT Protocol`, `X.1/X.2/X.3` (per-role counts, parallel patterns, Tier honesty).
New sections in `meta.md`: `μ-check`, `B-score GREEN ≢ ready`, `Post-task Recommendations Placement`.

## 3. Concept inflation (token frequency)

`eradev.md` term frequency:
| Concept | Base | Curr | Origin |
|---|---|---|---|
| RIGOR_LEVEL | 0 | 25 | Bundle D |
| FLUX | 0 | 33 | Bundle D |
| μ-check | 0 | 10 | Bundle B (paper v2) |
| BIM | 0 | 13 | Bundle A |
| Cross-Layer | 0 | 2 | Bundle B |

`meta.md` term frequency:
| Concept | Base | Curr |
|---|---|---|
| RIGOR_LEVEL | 0 | 3 |
| μ-check | 0 | 11 |
| Cross-Layer | 0 | 2 |
| User Flow | 0 | 2 |
| GREEN | 0 | 5 |
| PR-Gate | 0 | 2 |
| FLUX | 0 | 1 |

Sum of new concept tokens (eradev+meta cluster {RIGOR_LEVEL, FLUX, μ-check, BIM, Cross-Layer, User Flow, GREEN, PR-Gate}): base **5** → curr **107** (≈ ×21).

New operational entities introduced in window: **13** (RIGOR_LEVEL axis 4-level, FLUX protocol, μ-check gate, GREEN ≢ ready amendment, PR-Gate, Tier honesty contract, Universality Gate hook layer, phantom-newness hook, BL-19 sync hook, Cross-Layer Contracts table, User Flow section, per-role counts contract, T1/T2/T3 metadata schema). New formulas: **3** (F3 v_conv, F6 Π_meta, F7 B_min threshold).

### Extend>add disposition (per L-50)
| Concept | Disposition |
|---|---|
| RIGOR_LEVEL, FLUX, PR-Gate, Tier T1/T2/T3, μ-check (parallel gate), 2 new hooks | NEW addition |
| BIM, F3/F6/F7, Cross-Layer table, User Flow, GREEN ≢, Composition Hazards expansion | extension of existing |

Approximate ≈ **8 new : 4 extensions** in the 3-day window. L-50 mandate (extend>add) inverted by raw count.

## 4. Hooks pile-up

Active hooks at `758143c`:
- `.claude/hooks/`: agent-context-check, agent-role-tag, bl-tier-check, enforce-delegation, rework-framing-detector, rt1-composition-gate (warn-only). Unchanged from baseline (6).
- `.githooks/`: `pre-commit` (dispatcher: fix-chain detector + Universality Gate banned-token regex), `bl19-bilingual-sync.sh` (exit 1 on missing EN/RU twin), `phantom-newness-check.sh` (exit 1 on heading overlap).

| Pre-commit blocking layers | Baseline | Current |
|---|---|---|
| fix-chain (BL-3) | yes | yes |
| Universality Gate banned-token | yes | yes |
| BL-19 bilingual sync | no | **yes** |
| Phantom-newness overlap | no | **yes** |
| **Total hard blocks** | 2 | **4 (×2)** |

Override mechanisms exist for each (`BL19_OVERRIDE`, `PN_OVERRIDE`, `ERADEV_HOOKS_DISABLED`, `--phantom-checked` sentinel, `--no-verify`). Block-incident telemetry not collected — quantitative fire rate not derivable from git alone.

## 5. Self-application

At `b1486ed`: `git commit` on framework files → 2 hard blocks (fix-chain, Universality Gate). META can add a new lesson without overlap precheck; can modify single-language file without bilingual-sync block.

At `758143c`: `git commit` on framework files → 4 hard blocks. Adding a new `### L-N` heading to lessons.md triggers phantom-newness grep against existing L/EMP/BL titles. Modifying `eradev.md` without `eradev_RU.md` in same commit → blocked. The hook layer is multiplicative, not additive — every blocking gate is an independent fail point.

This audit report itself: contains the operator path token (`/Users/antonpankratov/Downloads/`) which is in the Universality Gate banned regex. Saved under `reports/` (not in `FRAMEWORK_FILES` glob) — passes only by virtue of placement.

## Evidence verdict

Three days, 14 commits:

- Core framework documents: `eradev.md` **+30.9%** lines / **+62.2%** bytes; `meta.md` +17.4% / +27.8%; FOUNDATIONS.md +19.6%; Analyst/Coherencer role files +32-38%.
- Net repo delta: **+11,783 lines**, insertion/deletion ratio **81:1** (near-zero compaction in window).
- Sections in eradev.md+meta.md: +10 (+13.7%); **13 new operational entities**; **3 new formulas** (F3, F6, F7).
- New concept tokens in core docs (RIGOR_LEVEL+FLUX+μ-check+BIM+Cross-Layer+User Flow+GREEN+PR-Gate cluster): **5 → 107** (×21).
- Pre-commit blocking hooks: **2 → 4** (×2).
- Lessons (L+EMP live): 60 → 73 (+21.7%); incl. archive: 60 → 81 (+35%). Reports: 130 → 199 (+53%).
- L-50 extend-vs-add disposition in window: ≈ 1 extension : 2 new additions (inverted vs mandate).

Single defensible scalar:
**Core docs +30-60% by size. Active blocking hooks ×2. New top-level concepts: 0 → 13 in 3 days. Insertion/deletion 81:1.**

Whether this constitutes "deterioration" vs "consolidation work" is interpretive (Visionary / Coherencer scope). The empirical pattern is monotonic additive growth across every dimension sampled.

## B-check (B_text)
F=0.80 (all 6 core files line-counted; some byte counts skipped) · E=0.90 (tables, final scalar, no interpretation) · (1-σ)=0.85 (cross-counts reconciled: invariant 16→17, BL 30→30 content-changed) · Λ=0.75 (referenced L-50, BL-3/19/29/34; did not load full lessons.md) · **B = 0.459** → ANDON-borderline. F and Λ floors; would need second pass for full closure.
