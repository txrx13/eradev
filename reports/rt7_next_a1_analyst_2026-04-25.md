# RT-7 NEXT-A1 [ANALYST] — Empirical Audit of commit 11f51be

**Date:** 2026-04-25 | **Role:** [ANALYST] | **Wave 1 (parallel to Visionary)** | **Read-only diagnostics**

---

## 1. Commit anatomy (`git show 11f51be --stat`)

`11f51be` (2026-04-23, "v10 self-application deploy: Step 1+2"):
- **Diff content**: 2 NEW report files only, +191 lines, ZERO framework artifacts modified.
  - `reports/v10_self_deploy_builder_2026-04-12.md` (+93)
  - `reports/v10_self_deploy_validator_2026-04-12.md` (+98)
- **No** changes to `CLAUDE.md`, `templates/CLAUDE.md.template`, hooks, or settings. The "deploy" produced reports, not artifact mutations — Builder BLOCK preserved live state intact.

## 2. Builder BLOCK reasons (`v10_self_deploy_builder_2026-04-12.md`)

Builder refused to overwrite `/CLAUDE.md` from `templates/CLAUDE.md.template`. Two distinct refusal causes:

**(a) Template was BEHIND v10 on 3 features** (verified at commit time):
1. Template header `## Domain Awareness (v9)` vs current `(v10)` — internal inconsistency with `# EraDev v10` line 1.
2. Omega(H_hist) Session Entry note ABSENT from template.
3. CronCreate background-extraction note ABSENT from template.

**(b) Path-prefix mismatch for self-application**: template uses `eradev/eradev.md`, `eradev/roles/{role}_EN.md`, `eradev/templates/domain_skin.{type}.md` — designed for CONSUMER projects with submodule layout. Self-application working dir IS the framework root (no `eradev/` subdir), so verbatim apply would break every Mandatory Loading Sequence path.

Safety gate fired: "template BEHIND current → STOP → no write." Files modified: NONE.

## 3. Validator NOTES inventory (`v10_self_deploy_validator_2026-04-12.md`, B=0.654)

Validator ran 6 finding categories on the live filesystem:

| # | Check | Verdict | Note |
|---|---|---|---|
| 1 | Hooks executable (6 files) | PASS | 2 required + 4 newer (BL-tier, rework-detector, RT1-composition) all rwxr-xr-x |
| 2 | `CLAUDE.md` `{PROJECT}` placeholders | PASS WITH CONTEXT NOTE | 4 matches at lines 24/48/49/52 are intentional protocol prose for multi-project framework, NOT deploy drift |
| 3 | `CLAUDE.md` v10 content (7 features) | PASS | All present: Domain Awareness v10, 6-step loading, 6 outputs incl. Check Agent, Omega line 59, CronCreate line 60, 16 Invariants |
| 4 | git `core.hooksPath` + `.githooks/pre-commit` | PASS | Configured + executable (742 B) |
| 5 | `settings.json` validity + hook wiring | PASS | Valid JSON, 4 PreToolUse + 1 UserPromptSubmit matchers wire all 6 hooks |
| 6 | Template parity (`CLAUDE.md.template`) | DRIFTED (INFO) | `TEMPLATE-DRIFT-FOLLOWUP` tag — same 3 v10 gaps Builder caught |

Verdict: **PASS WITH NOTES**. The single non-PASS item (#6) is consumer-template-only drift.

## 4. Gap classification

**Tier-1 (cosmetic NOTES, mechanical fix)** — NONE remaining.
Validator's "PASS WITH CONTEXT NOTE" on `{PROJECT}` placeholders is a SPEC-doc clarification, not an artifact gap; the placeholders are correct as-is.

**Tier-2 (structural BLOCK, requires re-deploy)** — NONE remaining.
Empirical re-check today (2026-04-25): `templates/CLAUDE.md.template` is now **at v10 parity**:
- Line 22: `## Domain Awareness (v10)` ✓
- Line 59: `Item 9 now computes Omega(H_hist)...` ✓
- Line 60: `Optional: enable background extraction via CronCreate...` ✓
- Line count: 106 == current `CLAUDE.md` 106.
Remediated by post-`11f51be` commits `a79654c` ("v10: close template drift") and `b1486ed` ("Fix CLAUDE.md template v9->v10 body drift").

**Tier-3 (architectural, RT-1 needed)** — 1 open question (LOW severity).
Self-application vs consumer template **path-prefix duality**. Template intentionally uses `eradev/`-prefix (consumer submodule layout); root `CLAUDE.md` uses bare paths (self-application root). Diff shows ~10 lines differ ONLY by this prefix. Two architectural options:
- (a) Keep dual artifacts — current state, working but duplicates content (drift risk on every v10+ update).
- (b) Single template + path-substitution variable (e.g., `{ERADEV_PATH}/`) resolved at deploy time → eliminates duplication, but adds template-engine complexity.
Decision deferral: NOT urgent — current dual works; flag as RT-1 candidate for future cycle if drift recurs.

## 5. Closure path per gap tier

- **Tier-1 mechanical fixes NOW**: NONE needed. All Validator NOTES are documentation-clarifications already captured in the report.
- **Tier-2 re-deploy steps**: NOT REQUIRED. The original BLOCK condition (template behind v10) was already remediated; a fresh self-deploy run today would PASS clean (template parity confirmed empirically). Re-run is a cheap idempotent refresh, optional.
- **Tier-3 RT-1 needed**: NO for current cycle. The path-prefix duality is a known architectural feature (consumer vs self-application contexts). Schedule RT-1 only if a future v10+ template update misses sync between the two surfaces.

## 6. Hand-off to Builder (Wave 2)

If META wants closure stamp on the originally-blocked task:

**Files (read-only check):**
- `/Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template` (must show v10 parity)
- `/Users/antonpankratov/Downloads/eradev/CLAUDE.md` (must remain unchanged from current 106 lines)

**Exact commands:**
```bash
grep -c "Domain Awareness (v10)" /Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template   # expect: 1
grep -c "Omega(H_hist)"          /Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template   # expect: 1
grep -c "CronCreate"             /Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template   # expect: 1
diff <(sed 's|eradev/||g' /Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template) /Users/antonpankratov/Downloads/eradev/CLAUDE.md | wc -l   # expect: small (only τ_cycle prose delta + minor wording, NOT structural)
```

**Success criteria:** all 3 grep commands return `1`; diff post-prefix-strip is wording-only (no missing v10 features). If matched → original BLOCK is empirically obsolete; META may mark `TEMPLATE-DRIFT-FOLLOWUP` CLOSED with reference commits `a79654c`+`b1486ed`. Builder Wave 2 SHOULD NOT modify any artifacts; it is a verification-only run.

## 7. B-check (B_text, uniform 0.25 weights, domain=code)

```
F (Focus):       0.95 — read role file + 11f51be diff + both reports + template + diff vs current; verified post-commit history (a79654c, b1486ed)
E (Alignment):   0.95 — task = empirical diagnosis of what blocked; delivered tier-classified gap inventory + closure path; explicitly OUT-of-scope (fix, strategy) honored
(1-sigma):       0.95 — no conflict with Visionary parallel (strategic framing) — empirical lens only; no overlap with reports/rt7_next_b1_*; respected read-only constraint
Lambda:          0.90 — applied BL-17 Check-First (verified template state TODAY, didn't trust report-time claims); applied stale-output detection (Validator Key Rule 5) catching that Builder BLOCK is now historical
B = 0.95 * 0.95 * 0.95 * 0.90 = 0.772
```
min = 0.90 ≥ 0.3 → no ANDON. B = 0.77 ≥ 0.5 → clean.

**Headline finding:** the 11f51be BLOCK is empirically OBSOLETE. Template was already brought to v10 parity by `a79654c` + `b1486ed`. Only architectural question (path-prefix duality) remains, and is LOW-priority deferred.
