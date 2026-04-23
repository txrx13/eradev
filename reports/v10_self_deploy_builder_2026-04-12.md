# v10 Self-Deploy Builder Report — CLAUDE.md regeneration

**Date:** 2026-04-12 (session date 2026-04-23)
**Role:** [BUILDER]
**Scope:** Single-file self-application deploy — regenerate project-root `CLAUDE.md` from `templates/CLAUDE.md.template` with `{PROJECT}` → `eradev`.
**Decision:** **BLOCKED — template is BEHIND current CLAUDE.md + template path-prefixes are wrong for self-application**

---

## 1. Files inspected

- `/Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template` (104 lines, source)
- `/Users/antonpankratov/Downloads/eradev/CLAUDE.md` (106 lines, current project-root)
- `/Users/antonpankratov/Downloads/eradev/roles/builder_EN.md` (Activation Operator applied)

## 2. Template vs current CLAUDE.md — v10 feature comparison

| v10 feature (per task checklist) | Current CLAUDE.md | Template (post-substitution) | Match? |
|---|---|---|---|
| "EraDev v10" header | line 1: `# EraDev v10 -- Auto-Bootstrap (Claude Code)` | line 1: `# EraDev v10 -- Auto-Bootstrap (Claude Code)` | YES |
| 14+ tagged invariants (actual count: 16) | lines 70-85 — 16 items, all tagged `[UNIVERSAL]` / `[CODE-ADAPTER]` | lines 68-83 — 16 items, identical tagging | YES |
| Domain Awareness with 3 modalities | header `## Domain Awareness (v10)` (line 22) | header `## Domain Awareness (v9)` (line 22) | **NO — drift** |
| 6-step Mandatory Loading Sequence | lines 43-50, 6 numbered steps | lines 41-50, 6 numbered steps | YES (structure) |
| 6 output types (incl. Check Agent) | line 18 has Check Agent row | line 18 has Check Agent row | YES |
| Omega(H_hist) note in Session Entry | line 59: "Item 9 now computes Omega(H_hist) and reports it in the bootstrap output (v10)." | **ABSENT** | **NO — drift** |
| CronCreate background extraction note | line 60: "Optional: enable background extraction via CronCreate (see meta.md Background Instinct Extraction)." | **ABSENT** | **NO — drift** |

## 3. Additional blocker — path-prefix mismatch for self-application

The template is authored for CONSUMER projects where EraDev lives under an `eradev/` submodule. It uses prefixes like:
- `eradev/eradev.md` (template line 45)
- `eradev/meta.md` (line 46)
- `eradev/BOOTSTRAP_LESSONS.md` (line 47)
- `eradev/roles/{role}_EN.md` (lines 79, 88, 94, 103)
- `eradev/templates/domain_skin.{type}.md` (lines 39, 50)

The working directory `/Users/antonpankratov/Downloads/eradev/` **is** the framework source. Root layout:
```
eradev.md           meta.md          BOOTSTRAP_LESSONS.md
roles/              templates/       projects/            reports/
```
There is NO `eradev/` subdirectory. Applying the template verbatim would break every Mandatory Loading Sequence path and every Agent spawn instruction.

The current CLAUDE.md correctly uses bare paths (`eradev.md`, `roles/{role}_EN.md`, `templates/domain_skin.{type}.md`) — this is the self-application correction that has already been made.

## 4. Decision: BLOCK (do not overwrite)

Per task safety gate:
> "If template is BEHIND current CLAUDE.md (missing v10 features) → STOP. Report BLOCK. Do NOT overwrite."

Three v10 features are missing from the template and one entire class of paths is wrong for the self-application context. Overwriting would regress the bootstrap file.

**Files modified:** NONE (only this report created).

## 5. Recommended follow-up (out of scope for this task)

META should spawn a separate S-task to update `templates/CLAUDE.md.template` to v10 parity:
1. Flip header `Domain Awareness (v9)` → `Domain Awareness (v10)`.
2. Append Omega(H_hist) line to Session Entry Protocol section.
3. Append CronCreate background extraction line to Session Entry Protocol section.
4. (Optional) Add a self-application toggle note or produce a `CLAUDE.md.self.template` variant with bare paths, since the current template's `eradev/` prefix is consumer-oriented by design.

Once the template is at v10 parity, re-run this self-deploy; it will then be an idempotent refresh.

## 6. Security & Integrity checklist

- [x] No secrets inspected/written
- [x] No destructive operations executed
- [x] Backwards compatibility: preserved current v10 CLAUDE.md unchanged
- [x] Blast radius correctly assessed BEFORE writing (content gate: compared template content vs expected v10, rejected on mismatch)

**Blast Radius:** MEDIUM (CLAUDE.md is the bootstrap entry point — a bad overwrite would propagate to every subsequent session).

## 7. B-check (B_text, uniform weights per domain=code)

```
F (Focus):       0.95 — read all 3 required files in full (role, template, current CLAUDE.md), listed root + roles + templates + reports directories
E (Alignment):   0.95 — task intent = "regenerate CLAUDE.md ONLY if template is current"; I executed the safety gate, caught drift, honored the BLOCK instruction rather than blindly writing
(1-sigma):       0.95 — no conflict with corpus; respected existing v10 content; report uses absolute paths per project conventions
Lambda:          0.90 — applied BL-16 (knowledge without enforcement = Lambda zero) by actually enforcing the safety gate; applied BL-17 Check-First by verifying root layout before concluding path mismatch
B = 0.95 * 0.95 * 0.95 * 0.90 = 0.772
```
min(F,E,1-s,L) = 0.90 ≥ 0.3 → no ANDON. B = 0.77 ≥ 0.5 → clean.

---

## Builder Result
Modified artifacts: `/Users/antonpankratov/Downloads/eradev/reports/v10_self_deploy_builder_2026-04-12.md` (this report only)
Verification: diff-review of template vs current CLAUDE.md against 7-item v10 checklist; root-layout verification confirming absence of `eradev/` subdirectory
Validation: pre-write safety gate triggered → BLOCK → no write executed → current CLAUDE.md preserved intact
Security & integrity checklist: passed
Blast Radius: MEDIUM
B-check: F=0.95 E=0.95 (1-s)=0.95 L=0.90 => B=0.77
