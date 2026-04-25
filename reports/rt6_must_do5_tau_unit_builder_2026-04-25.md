# RT-6 MUST-DO #5 — τ_cycle Unit Specification — Builder Report

**Date**: 2026-04-25
**Builder**: B (EN-stack, role: builder_EN.md)
**Scope**: §III.2.3 unit specification (close metaphorical formula → executable measure)

## Builder Result

**Modified artifacts**:
- `eradev.md` §III.2.3 (line 429) — added `**Unit**:` paragraph between F3 variables block and Interpretation paragraph
- `eradev_RU.md` §III.2.3 (line 430) — mirrored RU translation `**Единица измерения**:`
- `.claude/skills/eradev/core/eradev.md` — synced from canonical
- `.claude/skills/eradev/core/eradev_RU.md` — synced from canonical

**Insertion content (EN)**: "τ_cycle measured in commits between RT-1.start and RT-3.close (preferred for code/research domains). Alternative units when commit cadence isn't natural: wall-clock hours (creative/exploratory FLUX) or conversation-turns (interactive sessions). Project may override via `domain.tau_unit` (deferred to v11)."

**Verification** (3 checks, all PASS):
1. `grep "τ_cycle.*commits"` → EN match line 429; RU match line 430 (Russian variant `коммитах`) — ≥1 each
2. `wc -l` parity: all 4 files = 1137 lines (±0, well within ±5 tolerance)
3. AC-1 deletions check: 0 deletions in §I-III main — only additive paragraph in §III.2.3 subsection (scope-permitted)

**Validation**: Insertion site is structurally optimal — placed after the variable definitions block (α, I(C), ε) and before "Interpretation" paragraph, keeping the formula+vars+units+interp cluster atomic. Existing definition line 418 already says "(units: reformulations per unit time)" but didn't specify the unit-of-time denominator; this edit closes that gap.

**Security & integrity checklist**: N/A (text-only documentation edit, no secrets, no breaking config change). Backwards compat: `domain.tau_unit` is OPTIONAL with explicit "deferred to v11" tag → no v10 consumer breaks.

**Blast Radius**: LOW (subsection-local, additive, no formula change, no API change, no semantic shift in F3/F6 — units were always implicit; this just makes them explicit).

**B-check**: F=1.0 (read full §III.2.3 + §III.2.4 + neighboring sections), E=1.0 (addresses MUST-DO #5 verbatim — RU-Builder fix recommendation applied), (1-σ)=1.0 (no terminology conflicts; `domain.tau_unit` parallels existing `domain.skin`/`domain.verify.method` schema), Λ=1.0 (consulted L2 synthesis + RU-Builder source report) → **B = 1.0**

**Out-of-scope respected**: did NOT touch SKILL.md (Builder A), lessons.md (Coherencer), roadmap.md (Builder C).
