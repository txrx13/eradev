# RT-5 Full-Project Consistency Audit — [ANALYST] EN

**Date:** 2026-04-25 | **Lens:** empirical/operational | **Scope:** v10 framework after PTv2 reconciliation, RT-1 Q1+Q2+Q3, Session 9 lessons.

## Activation Operator
F: read CLAUDE.md, meta.md §14, eradev.md §X.1/§X.2, BL.md, lessons.md, README{,_EN}, templates/CLAUDE/AGENTS, `.claude/skills/eradev/{SKILL,core,meta,reference,templates}`, last 50 commits. E: drift on 17/30/51, EN+RU sync, skill-bundle parity, "v9", item 9 trigger. σ: read-only. Λ: BL-19, BL-32, L-50, v10_template_drift / v10_foundations_docs / v10_parallel_trajectories_integration (16→17 sweep).

## §1 — Cross-File Count Consistency

| Surface | File:line | Live | Sev |
|---|---|---|---|
| `CLAUDE.md:68-86` | 17 numbered invariants | 17 | OK |
| `README.md:22, 39, 115, 184` | "17 invariants" ×4 | 17 | OK |
| `README_EN.md:20, 54` | "17 invariants" ×2 | 17 | OK |
| `templates/AGENTS.md.template:106` | "Core Rules (17 Invariants)" + body 1..17 | 17 | OK |
| `templates/CLAUDE.md.template:68-86` | 1..17 | 17 | OK |
| `templates/CLAUDE.md.universal` (cmp identical to .template) | 1..17 | 17 | OK |
| `.claude/skills/eradev/templates/{CLAUDE.md.template, AGENTS.md.template}` | byte-identical | 17 | OK |
| **`.claude/skills/eradev/SKILL.md:71-86`** | numbered list ends at **14** | **14** | **HIGH** |
| `.claude/skills/eradev/reference/README.md:14, 31, 105, 174` | "17 invariants" ×4 | 17 | OK on count |
| `.claude/skills/eradev/reference/README_EN.md:12, 46` | "17 invariants" ×2 | 17 | OK on count |
| `BOOTSTRAP_LESSONS.md:6` ("current count: 30") | 30 `### BL-` headers | 30 | OK |
| `projects/eradev/lessons.md` | 51 L + 17 EMP + 68 [ACTIVE] | 51/17 | see §5 |

**HIGH:** SKILL.md (skill-bundle activation surface) underdelivers Invariants 15 (BL-34 composition-hazards), 16 (BL-35 rework-discipline), 17 (τ_cycle primacy, ODTOE PT F3) versus the README in the same bundle that advertises "17 invariants".

## §2 — Bilingual Sync × Skill-Mirror Sync (last 10 commits)

| # | Commit | EN+RU paired? | Skill mirror paired? |
|---|---|---|---|
| 1 | `0205b40` Session 9 lessons | N/A (lessons only) | N/A |
| 2 | `f2ce45a` RT-1 Q1+Q2+Q3 | YES (eradev/meta both) | YES (core+meta) |
| 3 | `97dd5c4` PTv2 reconciliation | YES | YES |
| 4 | `ee5e218` PDF report | N/A | N/A |
| 5 | `d94ab6e` Session 8 lessons | N/A | N/A |
| 6 | `43c886a` Bundle A+B+C+D | YES (228+228, 29+29) | YES |
| 7 | `b1486ed` CLAUDE.md template fix | N/A (template only) | YES |
| 8 | `6ff4344` v10: FOUNDATIONS + README expand | YES (README+README_EN) | **NO — reference/README*.md NOT updated** |
| 9 | `3efaaf5` Wave 8 universality | YES | YES |
| 10 | `4b9efad` Session 7 lessons | N/A | N/A |

**HIGH:** Commit `6ff4344` updated canonical README (+20 lines) and README_EN (+14 lines) with FOUNDATIONS link, 12-foundations bullet, 4-layer footer, but the skill-mirror copies were not refreshed. `cmp` confirms DIFFER. BL-19 holds inside each surface; cross-surface skill-bundle parity violated.

## §3 — Drift Detection (stale "v9" + invariant counts)

| Sev | File:line | Token | Action |
|---|---|---|---|
| MED | `LOADING_PROTOCOL.md:103` | "EraDev v9 \| Agent Loading Protocol" | bump to v10 |
| MED | `templates/cross_harness_requirements.md:12` | "EraDev v9 runs exclusively in Claude Code" | bump to v10 |
| MED | `.claude/skills/eradev/meta/LOADING_PROTOCOL.md:103` | mirror | lockstep |
| MED | `.claude/skills/eradev/templates/cross_harness_requirements.md:12` | mirror | lockstep |
| LOW | `BOOTSTRAP_LESSONS_universal.md:4, :290`, `BOOTSTRAP_LESSONS_code_adapter.md:5, :137` | "Split … in EraDev v9 Phase 1.D" | historical provenance, leave |
| OK | `CLAUDE.md`, `meta.md`, `eradev.md`, both READMEs, AGENTS.md.template, both CLAUDE.md.{template,universal} | grep `"14 invariant\|15 invariant\|16 invariant"` outside `reports/` = **0 hits** | none |
| OK | `templates/CLAUDE.md.universal:1` | "EraDev v10" | none |

Count drift fully closed in non-archival surfaces (matches v10_parallel_trajectories_integration_2026-04-24.md:150-151).

## §4 — Skill-Bundle Byte-Identity (cmp)

| Canonical → Mirror | Result |
|---|---|
| `eradev{,_RU}.md` → `core/` | IDENTICAL ×2 |
| `meta{,_RU}.md` + `BOOTSTRAP_LESSONS.md` → `meta/` | IDENTICAL ×3 |
| `templates/CLAUDE.md.{template,universal}` + `AGENTS.md.template` → mirror | IDENTICAL ×3 |
| `glossary.md`, `CHECKLIST{,_EN}.md`, `interfaces.md` → `reference/` | IDENTICAL ×4 |
| **`README{,_EN}.md` → `reference/`** | **DIFFER ×2** (6ff4344 unmirrored) |
| **CLAUDE.md invariants body → SKILL.md:73-86** | **DIFFER count 17 vs 14** |

13 of 16 IDENTICAL; 3 stale at activation entry points.

## §5 — lessons.md Trigger per meta.md §14 item 9

`meta.md:336`: *"If lessons.md active count > 50: trigger compression pass (Coherent, see spec)."*

- `### L-` headers = 51, `### EMP` = 17, `[ACTIVE]` count on those headers = **68**
- Threshold = 50 → **TRIGGER FIRED** (active > 50)
- Last 10 commits added 7 entries (L-46..L-51 + EMP16/17) since threshold crossed; no compression pass logged.

**MED (pending operator):** spawn [COHERENT] compression pass at next session bootstrap, or apply L-50 (extend > add) and ARCHIVE oldest L-1..L-15.

## §6 — Adjacent verifications
§X.1/§X.2 at `eradev.md:942, :967`. meta.md 5b/5c at `:16, :21, :287, :292`. BL gaps (14,20,21,23,27) historical per `hansei-meta-plugy-framework-improvements-2026-04-20.md:138`. Domain skins: 12 files (6 EN + 6 RU).

## §7 — Severity Roll-up

| Sev | n | Items |
|---|---|---|
| HIGH | **3** | SKILL.md 14→17 body | reference/README.md mirror stale | reference/README_EN.md mirror stale |
| MED | **5** | v9 footers ×4 + lessons.md compression trigger pending |
| LOW | **2** | BL-split footer provenance (leave) |

## §8 — Smallest Viable Closure

1. **P0 sync** `cp README{,_EN}.md .claude/skills/eradev/reference/`; re-zip `eradev-skill.zip`.
2. **Patch SKILL.md 14→17:** append invariants 15/16/17 verbatim from `CLAUDE.md:84-86`; re-zip.
3. **v9→v10 footer sweep:** `LOADING_PROTOCOL.md:103`, `templates/cross_harness_requirements.md:12` + both mirror twins. Skip BL-split provenance lines.
4. **Lessons compression:** spawn [COHERENT] §14 item 9 protocol; target active ≤ 50 (apply L-50).

## B-check (B_text uniform)
F=0.85 · E=0.90 · (1-σ)=1.0 · Λ=0.80 → **B = 0.612** ≥ 0.5 PASS, no Andon.
