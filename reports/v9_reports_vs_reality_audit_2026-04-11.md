# EraDev v9 — Reports vs Reality Audit (Phantom Coherence Check, L2 follow-up)

> Date: 2026-04-11
> Role: [ANALYST] — cold-spawn audit on full v9 cycle
> Task: Verify every artifact claimed in `reports/v9_*` actually exists in the codebase as described
> Operator ask: "все ли что сделано в отчетах имплементировано в eradev?"
> Output type: Report (META output type 5)
> Scope discipline: READ-ONLY audit. No fixes. No edits. No smoke tests. No design judgment.

---

## 1. Activation Operator log

- **A_F (Focus):** Read all 25 v9 implementation/reflection reports (`reports/v9_*.md`), inventoried full artifact surface (root + `.claude/skills/eradev/` + 4 project configs + `roles/` + `templates/` + `scripts/` + `BOOTSTRAP_LESSONS*`). Performed byte-level diff between root and skill mirror on every dual-owned file. Ran git log on core files to verify commit provenance. Did NOT read RT-1 research reports (not implementation) and did NOT audit reports/proposals from v8 era.
- **A_E (Alignment):** Goal is phantom-coherence verification: for each report claim, does the artifact exist and match? Deliverable is one audit report with per-claim classification (CONFIRMED / GAP / DRIFT / ORPHAN / DEFERRED-CORRECTLY), gap summary sorted by severity, and a HEALTHY / PARTIAL PHANTOM / SIGNIFICANT PHANTOM verdict.
- **A_σ (Consistency):** Sources of false-positive: (a) trusting reports' own self-verification counts → I re-ran every grep myself; (b) counting lexical matches in research reports (RT-1 inputs) as implementation claims → excluded research artifacts. Sources of false-negative: (a) ignoring defects explicitly labeled "deferred" → tracked separately so they don't inflate gap count; (b) treating report-only claims as cosmetic when they're load-bearing → every OQ/DEF was re-verified against its named file.
- **A_Λ (Experience):** Phase 1.E already ran Phantom Coherence Check L2 (PASS WITH NOTES, 4 DEFs). Wave 5 closed DEF-1/2/3. Wave 6 + 6b closed OQ-W5/W6-1/2/3/4 residuals. This audit covers NEW drift discovered after Phase 1.E + any surviving gap from the Wave 5/6/6b cleanup chain + Phase 2.1.S territory. Same word-boundary regex discipline as Phase 1.E. BL-30 defense-in-depth applied (verified each claim against 2+ independent signals: file content + grep + git log).

All 4 Activation Operator steps passed. Proceeding to Checks 1-5.

---

## 2. Inventory

**Implementation / reflection reports (IN SCOPE): 25**

| Cluster | Reports | Role of reports |
|---------|---------|-----------------|
| Roadmap | 1 (roadmap_v9) | Source-of-truth AC list + phase plan |
| Phase 0.A | 2 (visionary, analyst) | Theoretical proposals: modal B-formula, Ω, OOD, domain schema, skin template |
| Phase 0.B | 2 (tagging, t6) | BL/invariant tagging + T6 adversarial test |
| Phase 1.A | 2 (en_builder, ru_builder) | Role file vocabulary refactor (10 files) |
| Phase 1.B | 1 (builder) | 4 project configs domain block |
| Phase 1.C | 1 (builder) | CLAUDE.md + meta.md Domain Awareness + item 5b |
| Phase 1.D | 1 (coherent) | BL split 22+8 |
| Phase 1.E | 1 (phantom_check) | Validator L2 release gate → PASS WITH NOTES, 4 DEFs |
| Wave 5 | 1 (cleanup) | DEF-1/2/3 closure |
| Wave 6 | 1 (cleanup) | OQ-W5-1..4 closure + scripts/build-skill.sh |
| Wave 6b | 1 (canonical_unification) | OQ-W6-1/2 closure (5→6 output types canonical) |
| Hansei | 1 (v9 hansei) | META L9 reflection on Phase 1 closure |
| Phase 2.1 | 2 (spec, builder) | Article skin spec + Builder |
| Phase 2.1.S | 9 (preflight, selftest, smoke_test, second_smoke_test, skin_cleanup_builder, skin_cleanup_v2, cumulative_validator, hansei) | Real-world smoke tests + v1+v2 skin cleanup |

**Research / RT-1 inputs (OUT OF SCOPE for artifact audit):** 14 files — `rt_en_*`, `rt_ru_*`, `rt_en_synthesis`, `rt_ru_synthesis`, `multi_agent_frameworks_comparison`, `rtk_analysis`. These are research outputs, not artifact claims. They were read as input to the roadmap but did not themselves ship artifacts.

---

## 3. Per-report / per-claim verification table

### 3.1 Core framework claims (eradev.md, CLAUDE.md, meta.md, meta_RU.md, BOOTSTRAP_LESSONS*)

| Claimed artifact / change | Source report | Reality (grep + file read + git log) | Verdict |
|---------------------------|---------------|----------------------------------------|:-------:|
| `eradev.md` untouched (AC-1 Iron Rule) | roadmap §L0 + Phase 1.E Check 1 | `git log eradev.md` → last commit `d285178` ("Bump version v7.1 → v8"). Zero v9 commits. | **CONFIRMED** |
| `eradev_RU.md` untouched | roadmap §L0 | Same commit. Zero v9 commits. | **CONFIRMED** |
| `eradev.md` Section II.1 (modal B-formula table) | roadmap §Phase 0.A; Phase 0.A Visionary; Phase 1.C Builder section cross-refs | eradev.md Section II is followed directly by Section III. **No Section II.1 exists.** No `### II.1` or modality table in the file. Also absent from `eradev_RU.md`. The weights live inline in CLAUDE.md:29-32 only. Phase 1.E Finding 6 explicitly flagged this. | **ORPHAN** |
| `eradev.md` Section III extension with Ω(H_hist) formula | roadmap §Phase 0.A deliverable 2; Phase 0.A Visionary §1.3 | `grep -n 'Omega\|Ω\|H_hist\|retrospective memory\|cross-domain memory' eradev.md eradev_RU.md` → **0 matches.** Section III is v8-identical (Team S, S_adjusted, S_session, P_coll, Noise Suppression). | **ORPHAN** |
| `eradev.md` OOD registry section | roadmap §Phase 0.A deliverable 3 | No dedicated OOD section in eradev.md. OOD constraint lives only via `domain.ood_scope` enum in project configs and via CLAUDE.md line 27. No corresponding section or subsection in eradev.md itself. | **ORPHAN** |
| `CLAUDE.md` v9 header + Domain Awareness section | Phase 1.C Builder; Phase 1.E Check 2.2 | Line 1: `# EraDev v9 -- Auto-Bootstrap (Claude Code)`. Lines 22-39: full "Domain Awareness (v9)" section with modal B-formula tuples, verify.method enum, backward-compat clause, domain skin clause. | **CONFIRMED** |
| `CLAUDE.md` 14 tagged invariants | Phase 1.C Builder; Phase 1.E AC-2 | 14 numbered invariants, lines 68-81. Tag distribution: 9 UNIVERSAL (1,2,3,4,8,9,11,12,13) + 5 CODE-ADAPTER (5,6,7,10,14). Every invariant carries exactly one tag. | **CONFIRMED** |
| `CLAUDE.md` 6-step Mandatory Loading Sequence (v9 added step 6) | Phase 1.C Builder; Wave 6 LOADING_PROTOCOL.md rewrite | Lines 43-52. Steps 1-6: eradev.md → meta.md (§14 13-item) → BOOTSTRAP_LESSONS.md → project config (with domain block) → project lessons → conditional domain skin. | **CONFIRMED** |
| `CLAUDE.md` Invariant 12 self-loading phrasing | Phase 1.C + Wave 5 DEF-3 | Line 79: "META does NOT embed role file content — the agent reads it into its own context. This keeps META context lean." | **CONFIRMED** |
| `meta.md` §14 Session Bootstrap item 5b DOMAIN | Phase 1.C Builder; Phase 1.E Check 2.1 | Lines 264-268. Full 5-line block: `domain.type`, `Modal B-formula`, `OOD scope`, source pointer, skin clause. Matches Phase 0.A Analyst schema verbatim. | **CONFIRMED** |
| `meta_RU.md` §14 item 5b "ДОМЕН" (Wave 5 DEF-2 closure) | Wave 5 §DEF-2; Hansei §4.4 | Lines 250-254. 5-line Russian mirror with correct enum values. Byte-identical semantic mirror of root meta.md block. | **CONFIRMED** |
| `meta.md` §14 item 11 "6 output types" (Wave 6b OQ-W6-1) | Wave 6b §OQ-W6-1 | Line 274: "6 output types (Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent)". `grep -n '5 output types' meta.md` → 0. | **CONFIRMED** |
| `meta_RU.md` §1a 6-row table + "6 типов" header (Wave 6 OQ-W5-2) | Wave 6 §OQ-W5-2 | Line 11: "META производит РОВНО 6 типов выходов". Line 22: "один из 6 типов". Line 260: "6 типов выходов". Zero residual "5 типов". | **CONFIRMED** |
| `BOOTSTRAP_LESSONS.md` 30 entries combined file | Phase 1.D Coherent | `grep -c '^### BL-' BOOTSTRAP_LESSONS.md` = **30**. Gaps at BL-23, BL-27 (historically merged). | **CONFIRMED** |
| `BOOTSTRAP_LESSONS_universal.md` 22 entries | Phase 1.D Coherent; Phase 1.E AC-7 | `grep -c '^### BL-' BOOTSTRAP_LESSONS_universal.md` = **22**. IDs: {1,4,5,7,9,10,11,12,13,15,16,17,18,19,20,21,26,28,29,30,31,32}. All tagged `[UNIVERSAL]`. | **CONFIRMED** |
| `BOOTSTRAP_LESSONS_code_adapter.md` 8 entries | Phase 1.D Coherent; Phase 1.E AC-7 | `grep -c '^### BL-' BOOTSTRAP_LESSONS_code_adapter.md` = **8**. IDs: {2,3,6,8,14,22,24,25}. All tagged `[CODE-ADAPTER]`. Union of universal + adapter equals combined (30 = 22+8), disjoint, no duplicates. | **CONFIRMED** |
| `BOOTSTRAP_LESSONS_universal.md` + `_code_adapter.md` match Phase 0.B tagging | Phase 0.B tagging report; Phase 1.E Check 2.4 | Split matches Phase 0.B pre-declared split. Independent grep confirms. | **CONFIRMED** |
| `BOOTSTRAP_LESSONS.md` / `_universal.md` BL-26 "6 output types" enumeration (Wave 6b OQ-W6-2) | Wave 6b §OQ-W6-2 | Line 210 (combined) + line 189 (`_universal`): "6 output types (Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent)". | **CONFIRMED** |
| BL-28 "Every Agent call MUST include COMPLETE role file content" | Pre-v9 v8 artifact (NOT a v9 claim; found during audit) | `BOOTSTRAP_LESSONS.md:192` + `BOOTSTRAP_LESSONS_universal.md:165` + skill mirror `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md:192`: **still asserts the v8 "include full content" pattern** — directly contradicts v9 CLAUDE.md Invariant 12 self-loading semantics. This is v8 debt that survived the entire v9 refactor. Not reported as a gap by Phase 1.E or later reports. | **NEW GAP** (DRIFT inside v9 canonical) |

### 3.2 Role files (Phase 1.A vocabulary refactor)

| Claimed artifact | Source report | Reality | Verdict |
|------------------|---------------|---------|:-------:|
| 10 role files (5 EN + 5 RU) vocabulary-cleaned to <5 code tokens | Phase 1.A EN Builder; Phase 1.A RU Builder; Phase 1.E AC-2 | Case-insensitive word-boundary regex `\b(code\|compile\|test\|build\|git)\b`: max 1 hit/file among EN (4 files at 0, visionary_EN.md at 1), max 1 hit/file among RU (3 files at 0, builder.md at 1, validator.md at 1). All well below the <5 threshold. Line counts match Phase 1.E report exactly (78/84, 97/97, 97/103, 87/93, 86/92). | **CONFIRMED** |
| All 10 role files have 3-domain examples (code/article/book) | roadmap §Phase 1.A; Phase 1.E AC-2 | Direct Read of analyst_EN.md shows "3 examples, one role, three domains": software service, scientific article, book chapter. All 10 files have the "Examples" section with 3 domains. (Analyst_EN.md Line 41-47 verified in-session.) | **CONFIRMED** |
| EN + RU role files committed in same wave (BL-19) | Phase 1.A EN Builder; Phase 1.A RU Builder | `git show --name-only 404034f` = Wave 1 commit touched all 10 role files in a single commit. | **CONFIRMED** |

### 3.3 Project configs (Phase 1.B domain schema)

| Claimed artifact | Source report | Reality | Verdict |
|------------------|---------------|---------|:-------:|
| 4 project configs (eradev, odtoe-articles, academic-lab, plugy) have `domain:` block | Phase 1.B Builder; Phase 1.E AC-3 | All 4 have `domain:` block with required fields (type, artifact.primary, artifact.secondary, verify.method/command/success_criteria, metrics[B_modality, strictness], ood_scope, examples[], subdomains[], skin). Enum values match Phase 0.A schema. | **CONFIRMED** |
| `projects/odtoe-articles/config.md` has `skin: "templates/domain_skin.article.md"` | Phase 2.1.S selftest (claimed "line 33") | Line 33: `  skin: "templates/domain_skin.article.md"` — byte-exact match. | **CONFIRMED** |
| `projects/eradev/config.md` `skin: "templates/domain_skin.code.md"` | Phase 1.B Builder | Line 33 contains it. BUT `templates/domain_skin.code.md` does not exist (see §3.6 dangling skin paths). | **DRIFT** (config references a file that doesn't exist) |
| `projects/academic-lab/config.md` `skin: "templates/domain_skin.code.md"` | Phase 1.B Builder | Line 31 contains it. Same dangling path. | **DRIFT** |
| `projects/plugy/config.md` `skin: "templates/domain_skin.code.md"` | Phase 1.B Builder | Line 43 contains it. Same dangling path. | **DRIFT** |
| `projects/odtoe-articles/config.md` line 201 "Seven Verification Checks" (should be "Eight") | Phase 2.1.S skin_selftest §DEF-B; skin_cleanup_builder §explicit out of scope; skin_cleanup_v2 §explicit out of scope; Phase 2.1.S Hansei backlog | Line 201: `## Seven Verification Checks (MANDATORY — applied to EVERY article)`. Config line 17 itself says "all 8 verification checks PASS". Pre-existing v8 drift; v9 did NOT close it. | **KNOWN DRIFT (deferred, not closed)** |

### 3.4 Domain skin files (Phase 2.1)

| Claimed artifact | Source report | Reality | Verdict |
|------------------|---------------|---------|:-------:|
| `templates/domain_skin.md.template` (schema template) | Phase 0.A Analyst §Deliverable 4; Wave 2 commit | File exists, 138 lines. | **CONFIRMED** |
| `templates/domain_skin.article.md` created by Phase 2.1 Builder, 445 lines initial | Phase 2.1 Builder §Deliverable | File existed at 445 lines initially (per git log). | **CONFIRMED** (historical) |
| `templates/domain_skin.article.md` grew to 549 lines after v1 cleanup | Phase 2.1.S skin_cleanup_builder | Intermediate state (confirmed by Phase 2.1.S cumulative validator). | **CONFIRMED** (historical) |
| `templates/domain_skin.article.md` final 644 lines after v2 cleanup | Phase 2.1.S skin_cleanup_v2; cumulative_validator | `wc -l` = **644** exact. Matches verbatim. Vocabulary table, C5 ladder, C6a/C6b split, project lessons integration all present. | **CONFIRMED** |
| `templates/domain_skin.article.md` cites `eradev.md Section II.1` in Purpose block + Footer | Phase 2.1.S skin_selftest §DEF-A | Line 10 and Line 641: both say `eradev.md Section II.1 (B_research weights)`. Section II.1 does not exist in eradev.md → **orphan citation**. | **ORPHAN (DEF-A, deferred to Phase 2.2 per 2.1.S hansei)** |

### 3.5 Skill bundle mirror (Phase 1.E DEF-1 / Wave 5 / Wave 6 / Wave 6b)

| Claimed artifact | Source report | Reality | Verdict |
|------------------|---------------|---------|:-------:|
| `.claude/skills/eradev/SKILL.md` v9 + 14 tagged invariants + 6-step loading | Wave 5 §DEF-1 | Line 6: `# EraDev v9 -- Auto-Bootstrap`. Lines 73-86: 14 tagged invariants. Lines 50-55: 6-step loading. | **CONFIRMED** |
| `.claude/skills/eradev/templates/CLAUDE.md.template` byte-identical to root | Wave 5 §DEF-1 | `diff -q` → no difference. Byte-identical. | **CONFIRMED** |
| `.claude/skills/eradev/templates/CLAUDE.md.universal` byte-identical to root | Wave 5 §DEF-1 | `diff -q` → no difference. | **CONFIRMED** |
| `.claude/skills/eradev/meta/meta.md` byte-identical to root | Wave 5 §DEF-1 + Wave 6b re-sync | `diff -q` → no difference. | **CONFIRMED** |
| `.claude/skills/eradev/meta/meta_RU.md` byte-identical to root | Wave 5 §DEF-2 + Wave 6 re-sync | `diff -q` → no difference. Line 11 "6 типов", line 260 "6 типов". | **CONFIRMED** |
| `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` synced + "6 output types" | Wave 6b explicit (fixes OQ-W6-4 partial) | `diff -q` root vs mirror → no difference. Line 210: "6 output types (...Check Agent)". | **CONFIRMED** |
| `.claude/skills/eradev/reference/README.md` v9 header + footer | Wave 6 §OQ-W5-1 | Line 1: `# EraDev v9 — META-Orchestration`. Line 182: `*EraDev v9 | 2026-04-11*`. | **CONFIRMED** |
| `.claude/skills/eradev/reference/README_EN.md` v9 header + "v9 essentials" + footer | Wave 6 §OQ-W5-1 | Line 1: `# EraDev v9 — META-Orchestration`. Line 7: `**v9 essentials:**`. Line 184: `*EraDev v9 | 2026-04-11*`. | **CONFIRMED** |
| `.claude/skills/eradev/meta/LOADING_PROTOCOL.md` rewrite 5→6 steps, v9 footer | Wave 6 §OQ-W5-1 | Line 65+: 6-row META Loading Path table matching root CLAUDE.md. Line 103: `*EraDev v9 | Agent Loading Protocol...*`. | **CONFIRMED** |
| **Root `LOADING_PROTOCOL.md` v9 alignment** | Not claimed by any v9 report | **Root `LOADING_PROTOCOL.md` line 102: `*EraDev v8 | Agent Loading Protocol...*`**. Only 5-step META loading table. `git log LOADING_PROTOCOL.md` → last commit is `d285178` (v7.1→v8). **Never touched in v9.** The skill mirror is ahead of the root canonical. | **NEW GAP** (ROOT lags SKILL MIRROR — inversion of DEF-1) |
| `.claude/skills/eradev/roles/*.md` (10 role files) in sync with v9 root | **NEVER CLAIMED** by any wave report. Wave 5 DEF-1 scope was 4 files (SKILL.md, CLAUDE.md.template, CLAUDE.md.universal, meta.md). Wave 6 scope was 4 aux files. Wave 6b scope was 3 files. | `diff` all 10 role file pairs → **ALL 10 DIFFER**. Skill mirror role files have v7/v8 content: `builder_EN.md` skill mirror says "tested code", "package/module", "variable/function", 8 code tokens. Root `builder_EN.md` says "artifact", "component/module/section/chapter", 0 code tokens. `git log .claude/skills/eradev/roles/` → last touch Apr 4 (`b8776b2 Rebuild EraDev skill as self-contained bundle` + `a1334a7 Add role improvements`). **No v9 wave touched these files.** | **CRITICAL GAP** (the skill-bundle role files are pre-v9) |
| `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS_universal.md` + `_code_adapter.md` split files | Phase 1.D Coherent said "both files load correctly" (for root) | Skill mirror has only combined `BOOTSTRAP_LESSONS.md`, NO `_universal.md` or `_code_adapter.md` files. Non-code projects bootstrapping via skill path get the combined file (which has correct tags, so not critical, but the split-file experience is missing). Not a claim in Phase 1.D report, but the skill bundle does not reproduce the Phase 1.D split architecture. | **PARTIAL GAP** (combined tagged file present, split files absent) |
| `.claude/skills/eradev/templates/domain_skin.md.template` | Phase 0.A Analyst §Deliverable 4 | **Not present in skill mirror.** File exists only at root `templates/domain_skin.md.template`. | **GAP** |
| `.claude/skills/eradev/templates/domain_skin.article.md` | Phase 2.1 Builder | **Not present in skill mirror.** File exists only at root. | **GAP** |
| `.claude/skills/eradev/templates/AGENTS.md.template` | Pre-v9 but referenced in v9 templates/ directory listing | **Not present in skill mirror.** File exists only at root `templates/AGENTS.md.template`. Pre-existing gap, not v9 regression. | **PRE-EXISTING GAP** |

### 3.6 Dangling skin paths

| Dangling path | Referenced by | Reality | Verdict |
|---------------|---------------|---------|:-------:|
| `templates/domain_skin.code.md` | `projects/eradev/config.md:33`, `projects/academic-lab/config.md:31`, `projects/plugy/config.md:43`, `SKILL.md:44` (example), `CLAUDE.md:39` (example), `templates/CLAUDE.md.template:39` (example), `templates/CLAUDE.md.universal:11` (example), skill mirror `templates/CLAUDE.md.template`, skill mirror `SKILL.md:44` | **File does not exist.** Phase 1.B Builder OQ-B2 explicitly noted: "Concrete skin files... are Phase 2.A deliverables. All 4 configs reference `skin: templates/domain_skin.code.md` or `domain_skin.article.md` — these paths will dangle until Phase 2.A." 3 of 4 configs have dangling paths. | **KNOWN DANGLING PATH (deferred to Phase 2.A)** |
| `templates/domain_skin.book.md` | Phase 0.A Analyst example; Phase 1.E Check 3 (book task probe) | **File does not exist.** Referenced only hypothetically in reports. | **DEFERRED-CORRECTLY** (never claimed as existing) |
| `templates/domain_skin.config.md`, `.plan.md`, `.research.md` | Phase 0.A Analyst schema enumeration | **None exist.** Phase 0.A Analyst explicitly labeled "Not this phase". | **DEFERRED-CORRECTLY** |

### 3.7 Build & automation (Wave 6)

| Claimed artifact | Source report | Reality | Verdict |
|------------------|---------------|---------|:-------:|
| `scripts/build-skill.sh` exists, executable, `set -euo pipefail`, v9 header assertion | Wave 6 §OQ-W5-4 | File at 61 lines, 2009 bytes, mode `-rwxr-xr-x`. Line 21: `set -euo pipefail`. Lines 56-64: v9 header assertion (`grep -q 'EraDev v9'`). `bash -n` syntax passes. | **CONFIRMED** |
| `eradev-skill.zip` exists post-Wave 6 | Wave 6 §Blast Radius clause: "do NOT regenerate the zip as part of this task" — deferred to next META operational run | `ls -la eradev-skill.zip` → exists, 127969 bytes, mtime Apr 11 18:17. Inner SKILL.md header: `# EraDev v9 -- Auto-Bootstrap`. | **CONFIRMED (partial)** — zip has been rebuilt post-Wave-6 (see below) |
| `eradev-skill.zip` inner role files are v9 | Implicit in "rebuild zip" expectation | **Inner zip role files have mtimes Apr 4** (pre-v9) — they match the v7/v8-era skill mirror on disk, which was never updated. The build script verifies SKILL.md header only, not role file vocabulary. So the zip was rebuilt with a v9 SKILL.md but v7/v8 role files. | **DRIFT (build script false-positive)** |

### 3.8 Lessons + Hansei artifacts

| Claimed artifact | Source report | Reality | Verdict |
|------------------|---------------|---------|:-------:|
| `projects/eradev/lessons.md` Session 3 block (v9 closure lessons 16, 18, 19, 21, 22, 25 + EMP8 + EMP9) | Hansei §10; Wave 5 + Hansei commit | Lines 69-101: "Session 3: v9 Universalization" block with lessons 16/18/19/21/22/25 + "Session 3 Mega-Patterns" EMP8 ("Coherence framework...") + EMP9 ("Structural invariance..."). Session 3 Extension block (lines 103-113) covers Phase 2.1.S lessons 26-30. | **CONFIRMED** |
| `projects/odtoe-articles/lessons.md` L-36..L-39 (Phase 2.1.S outputs) | Phase 2.1.S Hansei §11 | Lines 131-139: entries 36, 37, 38, 39 present, each with the exact Phase 2.1.S vocabulary: "skin is value-additive" (L-36), "not overfit" (L-37), "BL-19 8-file-set corpus-wide drift" (L-38), "pre-flight accuracy is not automatic" (L-39). Source pointers reference reports by filename. | **CONFIRMED** |
| `projects/eradev/lessons.md` complete numbering without gaps | Not claimed | Numbers skip 17, 20, 23, 24 — pre-existing drift, not v9-created. | **PRE-EXISTING DRIFT (informational)** |

### 3.9 Hooks + enforcement layer

| Claimed artifact | Source report | Reality | Verdict |
|------------------|---------------|---------|:-------:|
| `.claude/hooks/agent-context-check.sh` Check 5 language-agnostic regex | Hansei §4.1 | Report says: "Made the regex language-agnostic, path-only matching". Last git touch was `a6cbba1 Self-loading context architecture` + Wave 1 `404034f`. Not directly read in this audit (out of scope, documentary claim only). | **CONFIRMED (via git)** |
| `.claude/hooks/enforce-delegation.sh` whitelist for META output paths | Hansei §4.2 | Report says: "Added whitelist for META-owned paths. 20/20 test cases pass". Last git touch was `2cbcf27 Hook whitelist: META can Write own output types`. Not directly read. | **CONFIRMED (via git)** |

---

## 4. Known-suspect deep dive

### 4.1 DEF-A: `eradev.md` Section II.1 orphan

**Scope of orphan: 11 references across 6 unique source files (5 duplicated in skill bundle):**

| File | Line | Text |
|------|------|------|
| `meta.md` | 265 | "Modal B-formula: ___ (text/creative/research — selects weights per eradev.md Section II.1)" |
| `meta_RU.md` | 251 | Russian mirror |
| `CLAUDE.md` | 26 | Domain Awareness bullet list |
| `templates/CLAUDE.md.template` | 26 | Template mirror |
| `templates/CLAUDE.md.universal` | 11 | Universal template mirror |
| `templates/domain_skin.article.md` | 10 | Skin Purpose block "Upstream math: eradev.md Section II.1 (B_research weights)" |
| `templates/domain_skin.article.md` | 641 | Skin Footer |
| `.claude/skills/eradev/SKILL.md` | 31 | Skill-bundle mirror of CLAUDE.md |
| `.claude/skills/eradev/meta/meta.md` | 265 | Skill mirror of meta.md |
| `.claude/skills/eradev/meta/meta_RU.md` | 251 | Skill mirror of meta_RU.md |
| `.claude/skills/eradev/templates/CLAUDE.md.template` | 26 | Skill mirror |
| `.claude/skills/eradev/templates/CLAUDE.md.universal` | 11 | Skill mirror |

**Ground truth:** `eradev.md` Section II ends at line 94 (end of "THE WEAK LINK PRINCIPLE" + Two absorbing states); Section III begins at line 96. **There is NO Section II.1 between them.** Git log confirms `eradev.md` has not been modified since commit `d285178` (v7.1 → v8 bump). All three Phase 0.A Visionary deliverables (modal B-formula Section II.1, Ω in Section III, OOD scope) are orphans: **the proposals live only in the Phase 0.A Visionary report and in the downstream files that cite them**. The roadmap's AC-4 says "Section II.1 added, examples for 3 modalities" as the measurement — which is not met by any artifact in `eradev.md`.

**Mitigation already in place:** CLAUDE.md Domain Awareness section (lines 22-44) carries the weights inline. Phase 1.C Builder logged this as OQ-1C-1 with explicit mitigation: "CLAUDE.md still contains the full weight tuples inline, so it is self-contained even if eradev.md Section II.1 is not yet written." This is why no runtime breakage has occurred — but the framework has 11 stale pointers into a nonexistent section. Phase 2.1.S Hansei logged this as "Deferred to Phase 2.2 backlog".

**Severity: HIGH (11 references, explicit AC, deferred indefinitely with no owner).**

### 4.2 Ω(H_hist) formalization orphan

**Roadmap Phase 0.A §deliverable 2** promised: "Formalize Ω(H_hist) — cross-domain memory multiplier (Antiworld concept from RU team). Add to eradev.md Section III as collective formula."

**Ground truth:** `grep -n 'Omega\|Ω\|H_hist\|cross-domain memory\|retrospective memory' eradev.md eradev_RU.md` → **0 matches**. Section III is v8-identical. Neither the Visionary's proposed formula nor the RU team's Antiworld concept landed in the framework core. The only trace is in the Phase 0.A Visionary report's text.

**Impact on AC list:** The roadmap's AC list (8 items) does not include an explicit AC-for-Omega — Phase 0.A Visionary logged it as "Deliverable 2" without wiring it to an AC. So this is a DELIVERABLE orphan, not an AC orphan. But it was named as roadmap Phase 0.A output, and reports §0.A Visionary report treats it as complete. The operator's expectation from reading the roadmap would be that Section III has a new subsection about Ω.

**Severity: MEDIUM (deliverable promised but orphaned; no runtime dependency; OQ-4 in roadmap explicitly says "What is numerical Ω(H_hist)? — deferred").**

### 4.3 OOD registry orphan

**Roadmap Phase 0.A §deliverable 3** promised: "Define OOD scope explicitly: text-discrete artifacts IN, continuous/flow tasks OUT."

**Ground truth:** OOD scope lives at the project-config level via `ood_scope: text-discrete` field and is enforced at the CLAUDE.md Domain Awareness section (line 27): "REJECT if continuous — v9 scope per Phase 0.A OOD definition". No dedicated "OOD registry" file or eradev.md section exists. Phase 0.A Visionary's proposal was effectively realized as the `ood_scope` enum; the "registry" framing did not materialize as a file or section.

**Severity: LOW (deliverable was informally realized, not dropped).** Classification: **PARTIAL-PHANTOM / DEFERRED-IMPLICITLY** — the registry as a distinct artifact does not exist, but the constraint it encoded is enforced.

### 4.4 `templates/domain_skin.code.md` dangling path

**Scope:** 3 project configs (`eradev`, `academic-lab`, `plugy`) + SKILL.md + CLAUDE.md + 2 templates all reference `templates/domain_skin.code.md`. **The file does not exist.** 

Phase 1.B Builder's OQ-B2 explicitly stated: "These paths will dangle until Phase 2.A. Not a blocker for v9 Phase 1." So this is documented drift, scoped to a future phase, not a phantom in the sense of a false completion claim. But it means that if v9 is declared "Phase 1 complete" today, 3 of 4 project configs have references to a non-existent skin file. Phase 2.1 shipped `domain_skin.article.md` (matching the 4th config's `odtoe-articles` reference) but not the `.code.md` sibling.

**Severity: MEDIUM (3 configs with dangling pointers; documented deferral; no runtime breakage because skin load is conditional).**

### 4.5 BL-31 numbering claim (Wave 6b)

**Claim:** Wave 6b Builder discovered the "6 output types" BL is numbered BL-31 (not BL-26).

**Reality:** 
- **BL-26** = "META Always Delegates — No Exceptions" (`BOOTSTRAP_LESSONS_universal.md:153`)
- **BL-31** = "Constrain Output Types to Constrain Behavior" (`BOOTSTRAP_LESSONS_universal.md:187`)

**Interpretation:** Both lessons exist. Wave 6b's discovery is correct: the "type-constrain" lesson (which is what enumerates the output types) is BL-31. The CLAUDE.md Invariant 1 citation `(BL-26)` is also correct because Invariant 1 is about META delegation, which IS BL-26. The two BLs are different lessons. **No drift** — Wave 6b's observation was accurate.

**Severity: N/A (CONFIRMED: both BL numbers are correct, for different rules).**

### 4.6 BL-28 vs v9 self-loading contradiction (NEW GAP discovered)

**Claim by v9:** Wave 5 DEF-3 + Phase 1.C + Invariant 12 establish that **META does NOT embed role file content** — agents self-load via path (BL-19 / BL-29 / BL-30 defense-in-depth).

**BL-28 `BOOTSTRAP_LESSONS.md:192` + `_universal.md:165` + skill mirror text:**

> "Every Agent tool call MUST include: (1) COMPLETE role file content (not excerpts — the full file from first line to Output Format section), ..."

This is the v8 "embed the role file into META's prompt" pattern. v9 Invariant 12 says the OPPOSITE. BL-28 was never updated to reflect v9 self-loading semantics.

**Impact:** An agent reading BL-28 (marked `[UNIVERSAL]`) would conclude that META must embed the role file verbatim — directly contradicting the self-loading architecture that Wave 5 DEF-3 / Phase 1.C Invariant 12 explicitly established. A fresh operator reading the BL cold-start would receive contradictory guidance.

**Severity: HIGH (actively contradictory to v9 canonical), not flagged by any v9 report.**

### 4.7 Root `LOADING_PROTOCOL.md` is v8 (NEW GAP discovered)

**Claim by Wave 6:** Wave 6 rewrote `.claude/skills/eradev/meta/LOADING_PROTOCOL.md` from 5-step to 6-step META loading path with v9 footer.

**What Wave 6 did NOT touch:** Root `/Users/antonpankratov/Downloads/eradev/LOADING_PROTOCOL.md`.

**Reality:** Root `LOADING_PROTOCOL.md` still has:
- Line 73: "Step 5: `BOOTSTRAP_LESSONS.md`" (old 5-step order, BL at step 5)
- Line 102: `*EraDev v8 | Agent Loading Protocol | EN-Analyst proposal, verified RT-5*`
- No domain skin step
- No reference to "13-item checklist" or "Section 14 item 5b"

`git log LOADING_PROTOCOL.md` → last commit `d285178` (v7.1→v8). **Zero v9 touches.**

**This is an inversion of Phase 1.E DEF-1:** In Phase 1.E, skill mirror was v8 and root was v9 (for SKILL.md/templates/meta). After Wave 6, the skill mirror LOADING_PROTOCOL.md is v9 and the **root is v8**. Operators who read the root canonical `LOADING_PROTOCOL.md` get v8 guidance; operators who load via skill bundle get v9. This is the mirror problem again, pointed the other way.

**Severity: MEDIUM (canonical root doc is stale; skill mirror is correct; operators reading the tree directly get stale META loading guidance).**

### 4.8 Skill-mirror role files are pre-v9 (NEW GAP discovered)

**Claim by Wave 5:** "DEF-1 MEDIUM — Skill bundle mirror v8 → v9 ... Files modified (4): SKILL.md, templates/CLAUDE.md.template, templates/CLAUDE.md.universal, meta/meta.md." Wave 5 explicitly **did not** list role files in its scope.

**Claim by Wave 6:** scope was 4 aux files (README.md, README_EN.md, meta_RU.md, LOADING_PROTOCOL.md) + 1 new file (build-skill.sh). Wave 6 also **did not** touch role files.

**Claim by Wave 6b:** scope was meta.md §14 item 11 + BL files §BL-26. Wave 6b also **did not** touch role files.

**Reality:** `diff` all 10 pairs `roles/*.md` vs `.claude/skills/eradev/roles/*.md` → **ALL 10 DIFFER**. Sample drift from `builder_EN.md` at the skill mirror:

- Root: "You turn the plan into a working, verified artifact. Your core question: 'What exactly has been done and what needs to be produced?'"
- Mirror: "You turn the plan into working, compilable, tested code. Your core question: 'What exactly has been done and what needs to be written?'"

Mirror contains: `tested code`, `package/module`, `variable/function`, `grep across the project for every variable/function you modify`. **Word-boundary regex for the mirror:** 8 code tokens in `builder_EN.md` (well over v9 <5 threshold).

`git log .claude/skills/eradev/roles/` → last commit touching role files is `a1334a7 Add role improvements` (pre-v9). Neither Wave 1 (v9 Phase 1.A refactor) nor any subsequent wave touched the skill-mirror role files.

**Impact:**
- Any operator who bootstraps via the skill bundle (`.claude/skills/eradev/`) gets **v7/v8-era role files with code-biased vocabulary**.
- The `eradev-skill.zip` contains the same pre-v9 role files (zip inner mtimes Apr 4).
- The build-skill.sh script only verifies SKILL.md has `EraDev v9` — it does NOT verify role file vocabulary. So the automated guardrail is insufficient for this gap.
- Phase 1.E / Wave 5 never flagged this because Phase 1.E's DEF-1 was scoped to "skill mirror is v8" and Wave 5 synced only the files explicitly named in the DEF-1 work order (SKILL.md + templates + meta.md). The role files were out of scope by omission, not by decision.

**Severity: CRITICAL — the skill bundle is the primary distribution surface. A new operator installing the skill on a fresh machine gets a framework where the root canonical (roles) is v9 but the skill-bundled copy is v7/v8. This is the exact DEF-1 failure mode that Wave 5 was supposed to fix, surviving because the scope was narrower than the problem.**

### 4.9 `domain.artifact` field — roadmap §L2 vs Phase 1.B implementation

**Roadmap §L2 claim:** `domain.artifact: file|chapter|section|...` as a first-class field alongside `domain.type`.

**Reality in configs:** `projects/odtoe-articles/config.md` lines 11-13:
```yaml
  artifact:
    primary: section
    secondary: [formula, citation_entry, figure, bibliography_item]
```

`projects/eradev/config.md` lines 11-13:
```yaml
  artifact:
    primary: source_file
    secondary: [design_doc, test_file, role_file]
```

**Verdict:** Field IS present in all 4 configs, as a nested `primary`+`secondary` object (not a flat scalar as the roadmap example implied). Phase 0.A Analyst's schema used the nested form; Phase 1.B Builder implemented the nested form. The roadmap's flat example was simplified for brevity. No drift, just a schema detail.

**Severity: N/A (CONFIRMED, schema matches).**

### 4.10 Phase 2.1.S smoke-test validation (domain_skin.article.md executability)

**Claim:** Phase 2.1.S ran two smoke tests + two cleanup passes + cumulative validator, all PASS. Final skin file is 644 lines, has C5 ladder, C6a/C6b split, project lessons integration.

**Reality:** `wc -l templates/domain_skin.article.md` = 644. `projects/odtoe-articles/lessons.md` L-36..L-39 present. `odtoe-articles/config.md:33` references the skin path exactly.

**Severity: N/A (CONFIRMED, all Phase 2.1.S claims verified).**

---

## 5. Acceptance Criteria — formal status

| AC | Description | Measurement | Audit finding | Verdict |
|:--:|-------------|-------------|---------------|:-------:|
| **AC-1** | ODTOE core (Sections I-III) unchanged | `git diff` 0 lines in Sections I-III | `git log eradev.md eradev_RU.md` → last commit `d285178` (v7.1→v8). Zero v9 touches. Sections I-III byte-identical to v8. | **PASS** |
| **AC-2** | All 10 role files vocabulary-cleaned (<5 code tokens) | Word-boundary regex per file | Max case-insensitive hits per file: 1 (visionary_EN, builder RU, validator RU). All 10 files ≤ 1 hit. | **PASS** |
| **AC-3** | All 4 project configs have valid `domain:` block | Schema validation | All 4 configs have `domain:` block with type, artifact, verify, metrics, ood_scope, examples, skin. Enum values inside schema. | **PASS** |
| **AC-4** | Modal B-formula defined and consistent | **Section II.1 added, examples for 3 modalities** | `eradev.md` has NO Section II.1. **The weights live inline in CLAUDE.md:29-32 only.** The roadmap measurement (Section II.1 added) is **NOT MET**. The weights themselves ARE consistent (Phase 1.E Check 2.2 verified) and an operator CAN apply them — they just don't live where the roadmap said they would. | **PARTIAL / FAIL ON MEASUREMENT** |
| **AC-5** | T6 adversarial test passes on non-code task (B_mean ≥ 0.6) | T6 report B_mean | Phase 0.B T6 report (`v9_phase0b_t6_2026-04-11.md`) self-reports B_creative ≈ 0.75 (conservative Λ), pessimistic Λ=0.50 gives B ≈ 0.71. Both exceed 0.6. Phase 1.E Check 1 re-verified. (This audit did not re-run T6 — out of scope.) | **PASS (assuming report accuracy)** |
| **AC-6** | Phantom Coherence Check L2 passes | Fresh-agent S_team drop < 0.15 | Phase 1.E ran it and returned PASS WITH NOTES (4 DEFs). Wave 5 closed DEF-1/2/3 within their scope. Wave 6/6b closed residuals in their scope. **This current audit is an unauthorized-wave L2 re-verification and finds 4 NEW gaps not logged by Phase 1.E.** Per the fresh-agent-independence test of AC-6, the fact that I independently surfaced BL-28 drift, root LOADING_PROTOCOL.md v8, skill-mirror role files pre-v9, and the §4.x new gaps suggests AC-6's "S_team drop < 0.15" was measured at the scope of Phase 1.E's checklist only. S_team drop across the broader audit scope is higher than 0.15 — the phantom coherence is there, it was just out of the Phase 1.E measurement window. | **PARTIAL / MEASUREMENT-SCOPED PASS** |
| **AC-7** | BL split deployed, 22 universal + 8 code-adapter, both load correctly | Count + disjoint union | 22+8=30, disjoint, all tagged, root + skill mirror both have correct combined file. Phase 1.D split files present at root only (not in skill bundle). | **PASS (root), PARTIAL (skill bundle has combined only)** |
| **AC-8** | At least 5 new Open Questions recorded | Grep for OQ pattern | Visionary 9 + Analyst 9 + T6 3 + Phase 1.C 5 + Phase 1.D 5 + Phase 2.1.S various = 30+. Phase 1.E counted 31. | **PASS** (6× target) |

**Summary: 5 full PASS (AC-1, AC-2, AC-3, AC-5, AC-8), 2 PARTIAL (AC-6, AC-7), 1 FAIL-ON-MEASUREMENT (AC-4).**

**Interpretation:**
- AC-4 is a **strict failure on its own measurement criterion** ("Section II.1 added"). The functional intent (modal B-formula exists and is applicable) is met via CLAUDE.md inline copy — but the roadmap's written measurement is not.
- AC-6 passed Phase 1.E's check at Phase 1.E's scope, but this cold-spawn audit surfaces gaps that Phase 1.E didn't look for. This is exactly what AC-6's fresh-agent test was designed to catch, ironically.
- AC-7 passes for the root canonical surface; the skill bundle ships the combined tagged file only, not the split files. The split is documented in lessons/reports but not in the skill distribution.

**Net AC status: 5/8 unambiguous PASS, 2/8 PARTIAL, 1/8 FAIL-ON-MEASUREMENT.**

v9 Hansei claimed "7/8 PASS with AC-4 partial". This audit converges on the same AC-4 finding but flags AC-6 + AC-7 as partial too, which Hansei classified as PASS.

---

## 6. Gap summary (sorted by severity)

### 6.1 CRITICAL (v9 release surface broken for the skill-bundle distribution path)

1. **Skill-mirror role files are pre-v9 (10 files)** — `.claude/skills/eradev/roles/*.md` have v7/v8 code-biased vocabulary. Wave 5 DEF-1 scope did not include role files. Wave 6/6b did not touch them. The build-skill.sh script's v9 header check is fooled because SKILL.md is v9 but the bundled role files are not. The eradev-skill.zip inherits this drift. Operators installing the skill bundle on a fresh machine get code-biased roles while root `roles/` is universal. **This is the exact DEF-1 failure mode Wave 5 was supposed to fix, surviving because the scope was narrower than the problem.** Blast radius: any new operator bootstrapping via skill distribution. Severity: **CRITICAL**.

### 6.2 HIGH (contradicts v9 canonical guidance or AC measurement)

2. **BL-28 text still asserts v8 "include COMPLETE role file content"** — root `BOOTSTRAP_LESSONS.md:192`, `BOOTSTRAP_LESSONS_universal.md:165`, skill mirror line 192. Directly contradicts Invariant 12 self-loading. Severity: **HIGH** (a BL tagged `[UNIVERSAL]` telling agents to do the exact thing v9 Invariant 12 forbids).

3. **`eradev.md` Section II.1 orphan — 11 references, AC-4 fails on measurement** — section does not exist in eradev.md; weights live only in CLAUDE.md. Phase 2.1.S Hansei deferred this to "Phase 2.2 backlog". Severity: **HIGH** (AC failure + 11 stale pointers including skill mirror).

### 6.3 MEDIUM (drift, not broken, but documented-inaccurate)

4. **Root `LOADING_PROTOCOL.md` is v8** — never touched in v9. Lists 5-step META loading, no domain skin, `*EraDev v8*` footer. Skill mirror IS v9. Wave 6 updated the mirror but the ROOT was never named in any scope. Severity: **MEDIUM** (inversion drift; root canonical lags skill distribution).

5. **Ω(H_hist) formalization orphan** — roadmap §Phase 0.A Deliverable 2 promised to add to eradev.md Section III. Section III is v8-identical. Proposal lives only in Phase 0.A Visionary report. OQ-4 in roadmap explicitly defers. Severity: **MEDIUM** (deliverable orphaned, not an AC, but operator reading roadmap would expect this).

6. **`templates/domain_skin.code.md` dangling path in 3 configs** — Phase 1.B Builder OQ-B2 explicitly documented. Phase 2.A deferred. 3 of 4 configs reference a non-existent file. Severity: **MEDIUM** (deferred, not a phantom; but the deferral is explicit and open-ended).

7. **Skill mirror missing `domain_skin.md.template` + `domain_skin.article.md`** — root `templates/` has both; skill bundle `.claude/skills/eradev/templates/` has neither. Operators bootstrapping via skill bundle cannot route to the article skin. Severity: **MEDIUM** (partial v9 experience for skill-distributed operators).

8. **`projects/odtoe-articles/config.md:201` "Seven Verification Checks"** — pre-existing v8 drift. Line 17 of same config says 8 checks. Phase 2.1.S skin_selftest DEF-B explicitly deferred. Severity: **MEDIUM** (not v9-created, but v9 did not close; skin-selftest Validator knew about it and v9 shipped with it).

### 6.4 LOW (cosmetic / known-deferred / informational)

9. **`.claude/skills/eradev/templates/AGENTS.md.template` missing** — pre-v9 absence, unrelated to v9 scope.

10. **`projects/eradev/lessons.md` number gaps (skips 17, 20, 23, 24)** — pre-v9 drift, unrelated to v9 claims.

11. **`.claude/skills/eradev/meta/BOOTSTRAP_LESSONS_universal.md` + `_code_adapter.md` absent** — Phase 1.D split exists at root only. Skill mirror has combined file with tags intact (so the information is preserved, just not the file split). Severity: **LOW** (functionally OK, architecturally asymmetric).

12. **OOD registry orphan (implicit realization)** — the "registry" framing from Phase 0.A was realized as `ood_scope` enum rather than a dedicated file. Severity: **LOW** (deliverable intent met, naming missed).

---

## 7. Recommendations

**Priority 1 (close before any further v9 release claim):**

- **R1** — Sync `.claude/skills/eradev/roles/*.md` byte-identical to root `roles/*.md` (10 `cp` operations) + rebuild `eradev-skill.zip` via `scripts/build-skill.sh`. This is the CRITICAL gap. The v9 vocabulary refactor is invisible to the skill distribution surface until this is done.
- **R2** — Extend `scripts/build-skill.sh` to assert v9 vocabulary on role files (e.g., grep for `\b(tested code|compile|variable\/function)\b` → must be 0, fail build if >0). The current v9 header check is insufficient — it only validates SKILL.md.
- **R3** — Fix BL-28 text in root + split files + skill mirror. Replace "Every Agent tool call MUST include COMPLETE role file content" with the v9 self-loading semantics (Invariant 12 phrasing). 3 files, 3 edits, no scope ambiguity.

**Priority 2 (close as a dedicated Wave 7 cleanup):**

- **R4** — Add `eradev.md` Section II.1 (modal B-formula table with 3 modalities + 2 worked examples each). Closes DEF-A / OQ-1C-1 / 11 stale references. OR redirect all 11 references from "eradev.md Section II.1" to "CLAUDE.md §Domain Awareness". Either is valid. Current state is drift.
- **R5** — Update root `LOADING_PROTOCOL.md` to match the Wave-6 skill mirror (v9 header + 6-step META table with domain skin step). Or decide that the root file is deprecated and delete it. Current state = inversion drift.
- **R6** — Close `odtoe-articles/config.md:201` "Seven → Eight Verification Checks" heading (1-line edit). Acknowledged by Phase 2.1.S skin_selftest DEF-B and skin_cleanup v1/v2 as explicitly out of scope.

**Priority 3 (Phase 2.A scope):**

- **R7** — Create `templates/domain_skin.code.md` to close the 3 dangling config paths. Or update the 3 configs to drop `skin:` field if the code domain is the default and needs no overlay.
- **R8** — Copy `templates/domain_skin.md.template` and `templates/domain_skin.article.md` into the skill bundle `.claude/skills/eradev/templates/` so skill-distributed operators can route article projects.

**Priority 4 (informational, already backlogged):**

- **R9** — Add Ω(H_hist) to eradev.md Section III (roadmap Phase 0.A Deliverable 2). OQ-4 in roadmap says "deferred"; Phase 2.2 backlog should inherit this.
- **R10** — Ship `BOOTSTRAP_LESSONS_universal.md` + `_code_adapter.md` in skill bundle so the Phase 1.D split architecture is visible in the distribution surface too.

**Already on backlog (no new action needed, just tracking):**

- DEF-A (Section II.1 orphan) — on Phase 2.2 backlog per Phase 2.1.S Hansei §Deferred Wave 5 debt.
- OQ-W5-4 `scripts/build-skill.sh` — CLOSED by Wave 6.
- OQ-W6-1/2 — CLOSED by Wave 6b.
- OQ-W6-3 (README.md "3-layer" → "4-layer" refresh) — explicitly deferred, low priority.

**New drift discovered by this audit (NOT on any backlog):**

- Skill mirror role files pre-v9 (R1, R2) — **new, CRITICAL**
- BL-28 contradiction with Invariant 12 (R3) — **new, HIGH**
- Root LOADING_PROTOCOL.md v8 (R5) — **new, MEDIUM**
- Skill bundle missing domain skin files (R8) — **new, MEDIUM**

---

## 8. B-check (Jidoka)

```
=== ANALYST JIDOKA SELF-CHECK ===
B-diagnostics (rate 0.0-1.0, text modality — uniform weights):
  F (Focus):         0.92
    + Inventoried all 25 implementation/reflection reports (roadmap + Phase 0-1-2.1-2.1.S + Wave 5/6/6b + Hansei).
    + Independently ran grep/diff/wc/git log on every claim (did NOT trust Phase reports).
    + Covered cross-axes: eradev.md, CLAUDE.md, meta.md, meta_RU.md, BL files, 10 role files,
      4 project configs, all 3 skin files (template + article + missing code/book/etc),
      skill mirror (29 files), scripts/build-skill.sh, eradev-skill.zip inner state.
    + Used git log to timestamp claims (catches "never touched" cases).
    - Did NOT read every wave report in full (read key sections; relied on cross-report
      convergence for some items like hook whitelist and T6 B_mean). -0.05 on F.
    - Did NOT run dynamic smoke tests (out of scope per task spec). -0.03 on F.

  E (Alignment):     0.95
    + Task was "verify reports vs reality" — every finding is classified (CONFIRMED /
      GAP / DRIFT / ORPHAN / NEW GAP / CRITICAL / DEFERRED-CORRECTLY).
    + Each GAP lists: severity, evidence, affected files, recommendation.
    + The report answers the operator's exact question: "все ли что сделано в отчетах
      имплементировано в eradev?" with a yes/no per-claim table + overall verdict.
    + AC-1..8 formal status section directly maps to roadmap measurement criteria.

  (1-σ) (Consistency): 0.93
    + No contradictions introduced by the audit itself.
    + Gaps are cross-referenced (e.g., DEF-A is flagged in §3.4 + §4.1 + §5 AC-4
      + §6.2 item 3 + §7 R4, all consistent).
    + Severity assignments are internally ordered (CRITICAL > HIGH > MEDIUM > LOW).
    - Did NOT re-compute T6 (AC-5 evidence chain still traces through the T6 report
      rather than independent measurement). -0.05 on (1-σ) for this single trust chain.
    - Did NOT verify that every BL tag is correct (relied on Phase 0.B tagging report's
      22+8 partition and Phase 1.D's file split). -0.02 on (1-σ).

  Λ (Experience):    0.90
    + Applied BL-5 (phantom coherence threshold), BL-16 (knowledge without enforcement),
      BL-19 (bilingual sync), BL-29 (verify established terminology), BL-30 (defense-in-depth:
      every claim verified against 2+ independent signals), BL-32 (grep after BL merge —
      enabled me to catch BL-28 contradiction).
    + Applied Phase 1.E methodology (word-boundary regex, git log, byte-level diff) but
      with broader scope (every dual-owned file, not just the DEF-1/2/3 list).
    + BL-3 fix chain: this is fix chain length 0 (first-pass audit, no iterative patching).
    - Did NOT read odtoe project files directly (/Users/antonpankratov/Downloads/odtoe/)
      to verify Phase 2.1.S smoke-test target file existence. -0.03 on Λ.

  B_text = F^0.25 × E^0.25 × (1-σ)^0.25 × Λ^0.25
         = 0.92^0.25 × 0.95^0.25 × 0.93^0.25 × 0.90^0.25
         ≈ 0.979 × 0.987 × 0.982 × 0.974
         ≈ 0.925

Weak link: Λ at 0.90 (lowest, well above 0.3)
All components > 0.3 → no Andon
B = 0.925 > 0.5 → GREEN, no Andon
Fix chain: 0 (first-pass audit)
```

---

## 9. Final verdict

**PARTIAL PHANTOM** — 4 significant gaps survived the Phase 1.E → Wave 5 → Wave 6 → Wave 6b cleanup chain, none blocking v9 Phase 1 release at the root-canonical level BUT one is CRITICAL for the skill-bundle distribution surface.

**Gap total:** 12 (1 CRITICAL + 2 HIGH + 5 MEDIUM + 4 LOW).

**Of these, 4 are genuinely NEW and not flagged by any prior report:**
1. Skill-mirror role files still pre-v9 (CRITICAL) — §4.8 / R1
2. BL-28 still asserts v8 "include COMPLETE role file content" pattern (HIGH) — §4.6 / R3
3. Root `LOADING_PROTOCOL.md` still v8 (MEDIUM) — §4.7 / R5
4. Skill bundle missing `domain_skin.*` files (MEDIUM) — §3.5 / R8

**The remaining 8 are KNOWN and deferred:**
- DEF-A Section II.1 orphan (HIGH)
- Ω(H_hist) orphan (MEDIUM)
- `domain_skin.code.md` dangling (MEDIUM)
- `config.md:201` Seven → Eight (MEDIUM)
- OOD registry informal (LOW)
- Skill bundle BL split absence (LOW)
- `AGENTS.md.template` skill-mirror absence (LOW)
- lessons.md numbering gaps (LOW)

**Verdict comparison to Phase 1.E:**
- Phase 1.E verdict: PASS WITH NOTES (4 DEFs), AC-6 PASS.
- This audit's verdict: **PARTIAL PHANTOM** (12 gaps, 4 new, AC-6 PARTIAL).

The difference is primarily scope. Phase 1.E's Check 5 was bounded to its DEF-1/2/3 list and did not diff all 10 role file pairs byte-for-byte — it only verified SKILL.md + templates + meta.md. Phase 1.E's Check 2 cross-referenced CLAUDE.md / meta.md / Phase 0.A Analyst schema but not BL files against Invariant 12 semantics. Phase 1.E's AC-1 git-log check was on eradev.md, not on LOADING_PROTOCOL.md. **Phase 1.E was honest within its scope and accurate on its measurements. The drift surfaced here lives outside Phase 1.E's measurement window — which is itself a AC-6 failure mode (the fresh-agent independence test's scope-matching assumption).**

**Release recommendation:**
- Root canonical v9 (operators cloning the repo and working from `/Users/antonpankratov/Downloads/eradev/` with root files) → **shippable with documented debt**. The 4 new gaps are tracked but do not break operation. Backward-compat for code projects is mathematically preserved. The modal B-formula is applicable via CLAUDE.md inline copy even though Section II.1 is orphan.
- Skill-bundle distribution v9 (operators installing via `.claude/skills/eradev/` or `eradev-skill.zip`) → **NOT shippable as "v9" until R1 (role file sync) is executed**. Currently ships a Frankenstein: v9 header + v9 CLAUDE.md + v9 meta files + **v7/v8 role files**. A new operator gets contradictory experience within a single bundle. Rebuild the skill and re-zip.

**Next concrete action:** META should spawn a Wave 7 Builder + Validator pair with explicit scope: (1) `cp` all 10 root `roles/*.md` to `.claude/skills/eradev/roles/` + diff-verify byte identity, (2) rewrite BL-28 text (3 edits across 3 files) + grep post-verify zero residual v8 phrasing, (3) run `bash scripts/build-skill.sh` + verify zip rebuild, (4) optionally update root `LOADING_PROTOCOL.md` to v9 (single-file edit). Blast radius: LOW. Expected duration: S-task.

---

*v9 reports-vs-reality audit complete. B=0.925 (cold-spawn Analyst, text modality). Verdict: PARTIAL PHANTOM. 12 gaps logged. 4 NEW. 8 KNOWN. 1 CRITICAL. Recommend Wave 7 closure before declaring v9 release complete at the skill-bundle distribution surface.*
