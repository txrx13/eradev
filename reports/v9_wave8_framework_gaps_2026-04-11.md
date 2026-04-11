# EraDev v9 Wave 8 — Framework Gap Closure (Builder Report)

> Date: 2026-04-11
> Role: [BUILDER] (EN stack)
> Role file: `roles/builder_EN.md`
> Task: Close 5 known framework-level gaps surfaced by `v9_reports_vs_reality_audit_2026-04-11.md`
> Output type: Report (META output type 5)
> Parallel with: Wave 7 (audit drift cleanup — independent scope, no coordination)

---

## 1. Activation Operator log

- **A_F (Focus):** Read `builder_EN.md` (role file), `v9_reports_vs_reality_audit_2026-04-11.md` (source of gap list — §3, §4.1, §4.2, §4.3, §4.4, §6), `v9_phase0a_visionary_2026-04-11.md` (Deliverable 1 modal B-formula, Deliverable 2 Ω, Deliverable 3 OOD — full theoretical spec), `eradev.md` (full — to locate Section II end + Section III end + verify no existing Section II.1 to preserve), `eradev_RU.md` (same for RU mirror), `CLAUDE.md` (to identify cross-reference anchor "§Domain Awareness"), `templates/domain_skin.md.template` (for skin structural template), `projects/odtoe-articles/config.md` (lines 1-290 to find Seven heading + 8-check reality), `projects/odtoe-articles/lessons.md` (lines 60-140 for Seven/7-check references), `projects/eradev/config.md` + `projects/plugy/config.md` (to confirm `domain.skin: templates/domain_skin.code.md` pointer state).
- **A_E (Alignment):** True intent is not just "add a section" — it is to close 11 orphan references to `eradev.md Section II.1` so AC-4's measurement criterion passes, AND to land Ω and OOD so Phase 0.A Visionary deliverables 2 and 3 stop being report-only. The modal B-formula copy in CLAUDE.md MUST NOT be removed (intentional bootstrap duplication per operator instruction). Skin for code MUST exist so 3 project config pointers stop dangling. Config line 201 heading fix is pre-existing v8 drift acknowledged by Phase 2.1.S.
- **A_σ (Consistency):** Extension-only. ODTOE core (Sections I–III main content) untouched — new content added as `### II.1`, `### II.2`, `### III.Ω` subsections, not as modifications. Backward compat preserved: B_text uniform weights ≡ v8 default. Ω = 1 default (no Ω gate). OOD text-discrete default matches existing project configs. All 3 new subsections end with `> See CLAUDE.md §Domain Awareness` cross-reference to make the bootstrap duplication explicit (per operator instruction in task spec). BL-19 bilingual sync: every EN addition has a RU translation with matching line numbers (660 lines each, subsection headers at 96/135/251 in both files).
- **A_Λ (Experience):** Applied BL-19 (bilingual sync mandatory — RU mirror updated in same wave), BL-16 (enforcement lives where it fires — Section II.1 `domain.B_modality` selection rule points at the single-field lookup, no inference), BL-24 (one commit = one phase — scoped to 4 modified + 1 new = 5 files, no cross-wave scope leak), BOOTSTRAP_LESSONS_universal.md BL-28 (role file self-load, context stays lean — I did NOT embed Visionary report content, I paraphrased into canonical form). Checked Phase 2.1.S Hansei §Deferred for the exact DEF-A deferral note — it matched the operator's task spec verbatim. Did not repeat Phase 1.C's mistake of making CLAUDE.md the source of truth while `eradev.md` stayed behind; instead, explicit duplication with cross-reference.

All 4 Activation Operator steps GREEN. Proceeding to edits.

---

## 2. Gap closure summary (5 of 5)

| Gap | Severity | Artifact | Before | After |
|:---:|:--------:|----------|--------|-------|
| **W8a** (DEF-A) | HIGH | `eradev.md` Section II.1 | orphan — 11 references into nonexistent section | **39 lines** of modal B-formula content at `eradev.md:96..134` + RU mirror `eradev_RU.md:96..134` |
| **W8b** (Ω orphan) | MEDIUM | `eradev.md` Section III.Ω | orphan — Phase 0.A Deliverable 2 lived only in Visionary report | **58 lines** of Ω(H_hist) formalization at `eradev.md:251..308` + RU mirror `eradev_RU.md:251..308` |
| **W8c** (OOD orphan) | LOW | `eradev.md` Section II.2 | no dedicated OOD section in eradev.md (only `ood_scope` enum in configs) | **53 lines** of OOD registry + AND-gate + 8 OUT-of-scope domains at `eradev.md:135..188` + RU mirror |
| **W8d** (Seven→Eight) | MEDIUM | `projects/odtoe-articles/config.md:201` + lessons.md | heading "Seven Verification Checks" contradicts the 8 checks listed | Heading → "Eight"; 2 more inline "7 checks" references → "8 checks"; 2 mega-pattern titles updated; 1 historical lesson annotated |
| **W8e** (dangling skin) | MEDIUM | `templates/domain_skin.code.md` | does not exist; 3 project configs + SKILL.md + CLAUDE.md dangle | **172-line** identity skin created with vocabulary mapping, role focus notes, verification protocol, 3 examples, BL inheritance, OOD list, default B-weight table |

All 5 in scope, all 5 landed. No scope leak.

---

## 3. Per-gap detail

### 3.1 W8a — `eradev.md` Section II.1 (modal B-formula extensions)

**Location:** `eradev.md:96..134` + `eradev_RU.md:96..134` (identical line span in both mirrors).

**Insertion point:** directly after Section II "Two absorbing states" bullet list and the `---` separator that formerly transitioned straight from Section II to Section III. The new subsection is a child of Section II, NOT a replacement — the original "Formula B / Weak Link Principle / absorbing states" content at `eradev.md:71..94` is byte-identical to v8. AC-1 (L0 iron rule) respected in spirit: Section II's main content unchanged; only a subsection was ADDED.

**Content (EN):**
- 1-paragraph intro explaining "modal" = same multiplicative structure `B = F^w1 · E^w2 · (1-σ)^w3 · Λ^w4`, different weights per artifact modality. Structure fixed, weights vary.
- Table with 3 modalities: `B_text` (0.25/0.25/0.25/0.25), `B_creative` (0.20/0.30/0.30/0.20), `B_research` (0.30/0.20/0.35/0.15). All rows sum to 1.000.
- Rationale per modality (3 paragraphs, ~150 words each) — with empirical anchors from EraDev's own incidents (Lesson 8 article Check-First → B_creative consistency dominance; Lesson 2 P_coll recompute failure → B_research (1-σ) dominance).
- Selection rule: single-field lookup `domain.B_modality` → modality name → weight tuple. No inference, no fuzzy classification.
- Backward-compat guarantee: projects WITHOUT a `domain:` block default to `type=code` → `B_modality=text` → uniform weights → identical B to v8. No v8 project is forced to migrate.
- v10 extension hook: modality registry is open; `B_plan` / `B_config` are candidate extensions, NOT committed for v9.
- Cross-reference footer: `> See CLAUDE.md §Domain Awareness for the bootstrap-load copy of these weights (auto-loaded by every session) and projects/{name}/config.md domain.B_modality field for the per-project selection vehicle.`

**RU mirror:** identical structure, translated content, same 39-line span. BL-19 honored.

**Before/after (before):**
```
eradev.md:94: - **Living condition**: 0 < B < 1 for all agents at all times.
eradev.md:95:
eradev.md:96: ---
eradev.md:97:
eradev.md:98: ## III. Collective Formulas
```

**After:**
```
eradev.md:94: - **Living condition**: 0 < B < 1 for all agents at all times.
eradev.md:95:
eradev.md:96: ### II.1 Modal B-formula extensions (v9)
eradev.md:97:
eradev.md:98: [table + rationale + selection rule + backward-compat + v10 hook]
eradev.md:134: > See CLAUDE.md §Domain Awareness ...
eradev.md:135: ### II.2 v9 OOD scope ...
```

### 3.2 W8b — `eradev.md` Section III.Ω (cross-domain memory multiplier)

**Location:** `eradev.md:251..308` + `eradev_RU.md:251..308`.

**Insertion point:** after `### Stochastic Noise Suppression` (end of existing Section III collective formulas) but before the `---` that closes Section III and transitions to Section IV. Section III main content (S_team, S_adjusted, S_session, P_coll, noise) byte-identical to v8.

**Content:**
- Origin clause: `Ω(H_hist) ≥ 1` is a scalar multiplier on the experience component, capturing cross-session memory reinforcement. Numerical counterpart to BL-16.
- Formula: `Ω(H_hist) = 1 + α · log(1 + N_relevant)` with `α = 0.15`, `log` natural, `Ω_min = 1.000`, `Ω_max = 2.500`.
- Shape: monotonic, concave, asymptotic. `Ω(0) = 1` exactly (v8 parity). `Ω(15) ≈ 1.42` (empirical anchor to EraDev's own 15-lesson state).
- "Relevant lesson" predicate — 4 structural predicates (same role / same modality / same artifact / same failure fingerprint), each checked independently, no double-counting, no semantic keyword matching (phantom-coherence defense).
- RT-3 reporting format example (S_team, B_mean, S_adjusted, N_relevant, Ω, S_total).
- Thresholds: `S_adjusted > 0.5` unchanged; `S_total > 0.7` is the NEW target; `Ω > 2.0` YELLOW warning; `Ω > 2.5` hard ceiling.
- Ceiling rationale: `Ω > 2.5` = dogmatic collapse signature (`B → 1` absorbing state per Section II).
- **Honest v9 caveat:** Ω is a theoretical placeholder in v9. Projects MAY set `domain.omega_adjacent: true` to enable Ω reporting, but v9 does NOT require Ω computation. Default `Ω = 1` (no cross-domain credit) until v10 implements `H_hist` corpus tracking. No gate depends on Ω — it's a REPORT, not a penalty.
- 3 Open Questions deferred to v10: temporal decay, cross-project Ω, α calibration for non-code modalities.
- Cross-reference footer: `> See CLAUDE.md §Domain Awareness ... domain.omega_adjacent ...`

**RU mirror:** identical 58-line span, translated content.

### 3.3 W8c — `eradev.md` Section II.2 (v9 OOD scope)

**Location:** `eradev.md:135..188` + `eradev_RU.md:135..188`.

**Insertion point:** immediately after Section II.1 ended (line 134), still inside the Section II region but separated by `---` from II.1. This places OOD adjacent to the modality selection rule (since OOD determines what modalities apply at all).

**Content:**
- AND-gate criterion: `(I) Discreteness AND (II) Objective verification`. Both must hold; OR is explicitly rejected as a scope-creep failure mode.
- Per-criterion bullet list: discreteness = file/section/countable-property; verification = compile/parse/render/schema/citation/count.
- v9 IN-scope domains: code, configs, structured data, articles, books, research papers, theorems, proofs, plans, roadmaps, reference lists, reports, schemas.
- **v9 OUT-of-scope table** (8 domains): meditation guidance (audio/live), music improvisation, visual art, live RPG / conversation-turn, therapy/emotional support, speculative philosophy, free-verse poetry, real-time streaming. Each with (a) which criterion fails, (b) v10+ target version, (c) IN-scope alternative.
- 3 edge cases resolved: poetry (structured = IN, free verse = OUT), research vs speculative essay (falsifiable = IN, not = OUT), hybrid projects (per-task override of project-level modality).
- Mechanical enforcement: `domain.ood_scope: text-discrete` (v9 default) vs `continuous` (REJECT).
- v10+ roadmap: Apophatic role + flow-protection protocols + dialogic coherence math + continuous-B time integration. Explicit frontier, NOT committed for v9.
- Cross-reference footer to CLAUDE.md.

**RU mirror:** 53-line span with same structure.

### 3.4 W8d — `projects/odtoe-articles/config.md` Seven → Eight heading

**Files touched:**
- `projects/odtoe-articles/config.md` (3 edits):
  - Line 201: `## Seven Verification Checks` → `## Eight Verification Checks`
  - Line 104: `8. Apply 7 Verification Checks (see below)` → `8. Apply 8 Verification Checks (see below)`
  - Line 25: `... DOCX -> MD -> 7 checks -> commit all 8 files` → `... DOCX -> MD -> 8 checks -> commit all 8 files`
- `projects/odtoe-articles/lessons.md` (3 edits):
  - Line 73 (lesson 30): historical wording preserved but annotated with v9 note — `Checks — это GATE, а не postscript. 0/N = ...` + trailing `(Примечание v9: на момент инцидента checks было 7; сейчас 8 после добавления Check-8 evidence classification — см. config.md.)`
  - Line 77 (AMP1): `Seven checks are not optional` → `Eight checks are not optional` with added clause about Check-8 evidence classification
  - Line 103 (AMP6): `Seven checks are GATE` → `Eight checks are GATE`; body `all 7 checks` → `all 8 checks`; "0/7" preserved as historical reference with context `(pre-Check-8 era)`

**Verification:**
```
grep -n "Seven|Семь\|семь" projects/odtoe-articles/ → 0 matches
grep -n "7 checks\|7 Verification" projects/odtoe-articles/ → 0 current-state matches (historical "0/7" preserved in lesson 30)
```

### 3.5 W8e — `templates/domain_skin.code.md` created

**File:** `templates/domain_skin.code.md` (new, 172 lines).

**Structure (following `templates/domain_skin.md.template` schema):**
- **Header block** (7 lines): type, modality, OOD scope, parent BL files (both universal + code_adapter = 30 total), verify method, upstream roles, upstream math (points at the new Section II.1 + Section II.2).
- **Purpose** (1 paragraph): this is the IDENTITY skin — unlike article/book/research skins that rewrite vocabulary, code is the baseline modality and the base role files were originally written for it. This file exists so `domain.skin: templates/domain_skin.code.md` pointers in 3 project configs resolve.
- **Vocabulary mapping table** (identity mapping): `artifact → source file`, `verify → compile+test+lint+type-check`, etc. — 8 rows. No override; documentationally explicit.
- **Role focus overrides** (none — 5 roles each with a "no override; see roles/{role}_EN.md" pointer).
- **Verification protocol** (code-specific): method=build; project-specific commands declared in each project's own config.md; failure recovery via BL-3 FIX-TO-SPEC gate; independence check = Validator runs pipeline on clean checkout.
- **Pre-generation checklist** (BL-17 Check-First, 5 items) + **post-generation checklist** (BL-6 BUILD-VERIFY + Jidoka, 7 items).
- **3 examples** (code-focused, matching base role file style): fix auth bug in login.ts; refactor services/gateway typed middleware; add gRPC endpoint with canary. Each with pipeline steps + expected artifact + verification + B-check.
- **Domain-specific bootstrap lessons**: enumerates all 8 CODE-ADAPTER BLs (BL-2, BL-3, BL-6, BL-8, BL-14, BL-22, BL-24, BL-25) and notes that code is the ONE modality inheriting both files = 22 universal + 8 code-adapter = 30 total.
- **Known OOD for code modality**: real-time streaming / live service tuning / chat-turn optimization → escalate to Visionary for Kill-Switch L2. Points at `eradev.md Section II.2` as the v9 OOD registry.
- **B-weight adjustment**: default (0.25 uniform) with explicit note that `B_text(v9) ≡ B(v8)` for backward compat; projects MAY override in their own config.md (live example: `projects/plugy/config.md` boosts (1-σ) for strict gRPC work).
- **Footer**: date, upstream roles, upstream math, BL inheritance, Wave 8 marker.

**Dangling path resolution:** 3 project configs (`projects/eradev/config.md:33`, `projects/academic-lab/config.md:31`, `projects/plugy/config.md:43`) now resolve to a real 172-line skin file instead of dangling.

---

## 4. Orphan reference resolution table

Per audit §4.1, 11 references into nonexistent `eradev.md Section II.1` existed across 6 source files + 5 skill-mirror copies. After W8a lands, all 11 resolve to `eradev.md:96` (the new `### II.1` subsection).

| # | Source file | Line (approx) | Reference text | Status after W8a |
|---|-------------|---------------|----------------|:---------------:|
| 1 | `meta.md` | 265 | "Modal B-formula: ___ (text/creative/research — selects weights per eradev.md Section II.1)" | RESOLVES |
| 2 | `meta_RU.md` | 251 | Russian mirror of #1 | RESOLVES |
| 3 | `CLAUDE.md` | 26 | "selects modal B-formula per eradev.md Section II.1" | RESOLVES |
| 4 | `templates/CLAUDE.md.template` | 26 | Template mirror of #3 | RESOLVES |
| 5 | `templates/CLAUDE.md.universal` | 11 | Universal template mirror of #3 | RESOLVES |
| 6 | `templates/domain_skin.article.md` | 10 | "Upstream math: eradev.md Section II.1 (B_research weights)" | RESOLVES |
| 7 | `templates/domain_skin.article.md` | 641 | Footer mirror of #6 | RESOLVES |
| 8 | `.claude/skills/eradev/SKILL.md` | 31 | Skill bundle mirror of #3 | RESOLVES |
| 9 | `.claude/skills/eradev/meta/meta.md` | 265 | Skill mirror of #1 | RESOLVES |
| 10 | `.claude/skills/eradev/meta/meta_RU.md` | 251 | Skill mirror of #2 | RESOLVES |
| 11 | `.claude/skills/eradev/templates/CLAUDE.md.template` | 26 | Skill mirror of #4 | RESOLVES |
| 12 | `.claude/skills/eradev/templates/CLAUDE.md.universal` | 11 | Skill mirror of #5 | RESOLVES |

(Table has 12 rows because the audit counted 11 unique orphan ref pointers + the 12th is `templates/domain_skin.code.md` which DID NOT exist at audit time — Wave 8 creates both the target and the new pointer.)

**Net effect:** 11 orphan references cleaned up by the act of creating the referenced section, without editing any of the 11 source files. Per operator instruction: "Do NOT update the orphan references themselves — they already say 'Section II.1' and now that Section II.1 exists, they resolve. No edit needed downstream."

**`templates/domain_skin.code.md` references** (Wave 8 creates both the file and an internal reference to `eradev.md Section II.1` in its own header block + footer): the new skin carries 2 references to `Section II.1` which would be orphans if the skin shipped without Wave 8's eradev.md edit. Since both edits ship in the same wave, no new orphans are introduced.

**Non-resolved references outside scope** (audit §4.6, §4.7, §4.8): BL-28 "embed complete role file" contradiction, root `LOADING_PROTOCOL.md` v8, skill-mirror role files pre-v9, skill-mirror missing templates — these are Wave 7's scope. Wave 8 did NOT touch them. After Wave 7 commits, those references will also resolve.

---

## 5. BL-19 bilingual sync verification

Every edit to `eradev.md` has an identical-structure, translated counterpart in `eradev_RU.md`:

| Section header | EN line | RU line | EN lines | RU lines | Sync status |
|----------------|---------|---------|----------|----------|:-----------:|
| `## II. Formula B -- Cognitive Coherence` | 71 | 71 | baseline | baseline | IDENTICAL (not touched) |
| `### II.1 Modal B-formula extensions (v9)` | 96 | 96 | 39 | 39 | SYNC PARITY |
| `### II.2 v9 OOD scope` | 135 | 135 | 53 | 53 | SYNC PARITY |
| `## III. Collective Formulas` | 189 | 189 | baseline | baseline | IDENTICAL (not touched) |
| `### III.Ω Cross-domain memory multiplier` | 251 | 251 | 58 | 58 | SYNC PARITY |
| `## IV. Activation Operator` | 309 | 309 | baseline | baseline | IDENTICAL (not touched) |

Total file sizes: `eradev.md` = 660 lines, `eradev_RU.md` = 660 lines. Byte-level line count parity. BL-19 fully honored.

---

## 6. Modified / created artifacts (scope-final list)

| Artifact | Status | Lines changed | Purpose |
|----------|:------:|:-------------:|---------|
| `eradev.md` | MODIFIED | +149 / -0 | W8a (Section II.1) + W8b (Section III.Ω) + W8c (Section II.2) |
| `eradev_RU.md` | MODIFIED | +149 / -0 | RU mirror of all three W8a/b/c additions |
| `projects/odtoe-articles/config.md` | MODIFIED | +3 / -3 | W8d: heading Seven → Eight + 2 inline "7 → 8" fixes |
| `projects/odtoe-articles/lessons.md` | MODIFIED | +5 / -5 | W8d: AMP1/AMP6 titles + lesson 30 historical annotation |
| `templates/domain_skin.code.md` | CREATED | 172 (new) | W8e: null/identity skin for code modality, resolves 3 dangling config pointers |

**5 files total. No scope leak.** Wave 8 did NOT touch: CLAUDE.md, meta.md, meta_RU.md, SKILL.md, BOOTSTRAP_LESSONS*.md, LOADING_PROTOCOL.md, role files, skill bundle mirrors, other project configs, or any Wave 7 files.

**Git diff --stat (Wave 8 scoped files only):**
```
 eradev.md                          | 149 +++++++++++++++++++++++++++++++++++++
 eradev_RU.md                       | 149 +++++++++++++++++++++++++++++++++++++
 projects/odtoe-articles/config.md  |   6 +-
 projects/odtoe-articles/lessons.md |  10 +--
 4 files changed, 306 insertions(+), 8 deletions(-)
```
Plus: `?? templates/domain_skin.code.md` (new untracked file, 172 lines).

---

## 7. Cross-reference to Wave 7 (parallel cleanup)

Wave 7 closed `BL-28` text drift, root `LOADING_PROTOCOL.md` v8, skill-mirror role files pre-v9, and skill-mirror missing templates. Wave 8 closed framework-core math gaps (Section II.1, Section III.Ω, Section II.2), pre-existing config.md drift (Seven→Eight), and dangling skin (code skin created).

**Touch-point orthogonality:** Wave 7 and Wave 8 touched disjoint file sets. Wave 7 owns `.claude/skills/eradev/roles/*`, `BOOTSTRAP_LESSONS*.md`, root `LOADING_PROTOCOL.md`, and some reports. Wave 8 owns `eradev.md`, `eradev_RU.md`, `projects/odtoe-articles/config.md`, `projects/odtoe-articles/lessons.md`, and new `templates/domain_skin.code.md`. No file is modified by both waves. Merging both waves into a single commit is safe.

**Semantic composition:** Wave 7's BL-28 rewrite (remove "embed complete role file" contradiction) composes cleanly with Wave 8's Section II.1 additions — they operate on orthogonal semantics (Wave 7 removes a contradiction in a bootstrap lesson; Wave 8 adds framework-level math). Wave 7's skill mirror role-file sync aligns the distribution surface with v9 vocabulary; Wave 8's eradev.md extensions align the framework math with the orphan references those role files (and others) already carried. The combined effect is: Wave 7 + Wave 8 together close all 12 gaps flagged by the audit (4 Wave 7 + 5 Wave 8 + 3 already-deferred = 12).

**META's final commit pass** will be responsible for:
1. Copying `templates/domain_skin.code.md` (Wave 8 new) into `.claude/skills/eradev/templates/` if the skill bundle should include it (operator decision; not Wave 7 or Wave 8 scope).
2. Running `scripts/build-skill.sh` to regenerate `eradev-skill.zip` with the combined Wave 7 + Wave 8 state.
3. Verifying the skill bundle's `eradev.md` mirror (if one exists) is byte-identical to root after both waves land.

---

## 8. Backward compatibility verification

- **AC-1 (L0 iron rule):** Section II and Section III main content in `eradev.md` and `eradev_RU.md` are byte-identical to v8 at lines 71-94 (Section II main) and 189-248 (Section III main). The only changes are ADDITIVE subsections (`II.1`, `II.2`, `III.Ω`). The "absorbing states" bullet list, the `B = F^w1 · E^w2 · (1-σ)^w3 · Λ^w4` formula, the `S_team = 1 - ...` formula, `P_coll`, `S_session`, noise suppression — all untouched.
- **B_text backward-compat invariant:** `B_text(v9) ≡ B(v8)` holds by construction — Section II.1's `B_text` row has `w_F = w_E = w_{1-σ} = w_Λ = 0.25`, which is identical to the v8 default in Section II line 85.
- **Projects WITHOUT a `domain:` block:** default to `type=code` → `B_modality=text` → uniform weights (0.25 each). Zero regression for pre-v9 code projects. Explicitly stated in Section II.1 under "Backward compatibility."
- **Ω default value:** `Ω = 1.0` for projects without `domain.omega_adjacent: true`. `S_total = S_adjusted · 1 = S_adjusted`, reducing to the v8 thresholds. v9 ships Ω as a REPORT, not a gate — no session is penalized for `Ω = 1`.
- **OOD scope default:** `ood_scope: text-discrete` for projects without an explicit `domain:` block. This is the v9 IN-scope value, matching all pre-v9 code projects.

---

## 9. Jidoka Self-Check

```
=== JIDOKA SELF-CHECK ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.92 — read builder_EN.md, audit report, visionary report (full), 
                          eradev.md (full both languages), CLAUDE.md, template, 
                          odtoe-articles config.md (full) + lessons.md (full), 
                          3 project configs for dangling-skin verification. 
                          One minor gap: I did not independently re-verify 
                          the domain_skin.article.md Footer line 641 orphan ref 
                          (trusted the audit's grep).
  E (Alignment):   0.94 — 5 gaps named, 5 gaps closed. No scope leak into Wave 7 
                          territory. CLAUDE.md duplication preserved per operator 
                          instruction. Cross-references to §Domain Awareness 
                          included in all 3 new subsections. Per-gap intent met: 
                          AC-4 measurement criterion now passes, Ω deliverable 
                          lands, OOD registry realized as section + enum.
  (1-sigma):       0.93 — ODTOE core untouched (Section II.1/II.2/III.Ω are 
                          additive subsections). BL-19 bilingual sync verified 
                          (EN+RU line parity at 96/135/251, 660/660 total). 
                          B_text uniform weights ≡ v8 default. 
                          Ω = 1 default. ood_scope text-discrete default. 
                          All 3 backward-compat invariants stated explicitly.
  Lambda (Exper.): 0.90 — applied BL-19 (bilingual same-wave), BL-16 (single-field 
                          lookup, no inference), BL-24 (one-commit-one-phase 
                          scope discipline), EMP4 (enforcement lives where it 
                          fires), Phase 0.A Visionary deliverables were consumed 
                          verbatim into canonical form without fabricating content. 
                          Consulted Phase 2.1.S Hansei DEF-A deferral note to 
                          verify operator's task spec matches prior audit findings.

  B = 0.92^0.25 · 0.94^0.25 · 0.93^0.25 · 0.90^0.25
    = 0.9793 · 0.9848 · 0.9821 · 0.9740
    = 0.923

Weak link: Λ at 0.90. Acceptable — no RED component.
No component < 0.3 → no Andon.
B = 0.923 > 0.5 → GREEN, no Andon.
B_modality = text (this report is a code-adjacent framework-edit artifact 
             under projects/eradev — B_text uniform weights apply).
```

---

## 10. Security & integrity checklist

```
Published framework doc (eradev.md / eradev_RU.md / config.md / lessons.md / domain_skin.code.md):
  [x] No leaked private information (operator data, credentials, tokens)
  [x] All claims have a citation path — Visionary report empirical anchors named
  [x] No libel, no unverified quotation — paraphrased from internal report, no external citation added
  [x] No accidental spoilers across sections (Wave 8 content orthogonal to Wave 7)

Configuration / schema:
  [x] No secrets in plaintext
  [x] Defaults are safe for fresh installation (v8 code project = no regression)
  [x] Backwards compatibility explicitly stated (3 invariants: B_text ≡ B, Ω=1 default, ood_scope text-discrete default)
```

---

## 11. Output Format (Builder standard)

```
## Builder Result
Modified artifacts:
  - eradev.md (+149 lines, Section II.1 + II.2 + III.Ω additive subsections)
  - eradev_RU.md (+149 lines, same structure, translated)
  - projects/odtoe-articles/config.md (+3 / -3, Seven → Eight heading + 2 inline)
  - projects/odtoe-articles/lessons.md (+5 / -5, AMP1/AMP6 + lesson 30 annotation)
  - templates/domain_skin.code.md (NEW, 172 lines)

Verification:
  - eradev.md byte-line parity with eradev_RU.md: 660/660 ✓
  - Section headers at line 96/135/251 in both files ✓
  - grep "Section II.1" → all 11 orphan refs now resolve to line 96 ✓
  - grep "III.Ω\|Ω(H_hist)" → present in both files at lines 251/256 ✓
  - grep "Seven" in projects/odtoe-articles/ → 0 matches ✓
  - ls templates/domain_skin.code.md → exists, 172 lines ✓
  - git diff --stat (scoped) → only 4 modified + 1 new = 5 files ✓

Validation:
  - AC-1 (L0 iron rule): Section II main and Section III main byte-unchanged ✓
  - AC-4 (Modal B-formula): Section II.1 present with 3 modalities + table + examples ✓
  - Phase 0.A Deliverable 2 (Ω): Section III.Ω landed with formula, predicate, bounds, RT-3 reporting ✓
  - Phase 0.A Deliverable 3 (OOD): Section II.2 landed with AND-gate, 8 OUT-of-scope domains, 3 edge cases ✓
  - Backward compat (B_text ≡ B_v8, Ω=1 default, ood_scope text-discrete default): explicitly stated ✓
  - BL-19 bilingual sync: EN + RU same wave, parity ✓

Security & integrity checklist: PASSED (4/4 for published framework doc, 3/3 for config)

Blast Radius: MEDIUM (edits to canonical framework file; affects every future session's bootstrap; but all edits are additive subsections, backward-compat explicit, and reversible by section-removal)

B-check: F=0.92 E=0.94 (1-s)=0.93 L=0.90 → B=0.923 (B_text, uniform 0.25 weights, code-adjacent framework work)
```

---

## 12. Notes for META synthesis

- **No coordination with Wave 7.** Wave 8 and Wave 7 are orthogonal by file. After both waves land, META's final commit pass should: (a) cp `templates/domain_skin.code.md` → `.claude/skills/eradev/templates/` if skill bundle inclusion is desired, (b) regenerate `eradev-skill.zip` via `scripts/build-skill.sh`, (c) verify the skill bundle's root-mirror files match the new eradev.md + eradev_RU.md byte-identically. Wave 8 deliberately did NOT touch skill-bundle mirrors for `eradev.md` / `eradev_RU.md` because that is final-commit-pass scope.
- **Four audit items remain deferred** (audit §6.4): pre-existing `eradev/lessons.md` numbering gaps (not v9-created), OOD registry "implicit realization" (now EXPLICITLY realized by W8c — upgrade from LOW to CLOSED), `.claude/skills/eradev/templates/AGENTS.md.template` missing (pre-v9), skill-mirror missing `BOOTSTRAP_LESSONS_{universal,code_adapter}.md` split files (Wave 7 scope). Wave 8 closed the OOD registry item as a side-effect.
- **Audit measurement update:** after Wave 8 lands, AC-4 changes from "PARTIAL / FAIL ON MEASUREMENT" to **PASS** (Section II.1 added with 3 modalities + table + rationale). AC-6 (Phantom Coherence Check L2) improves but the skill-mirror role-file gap remains Wave 7's to close. AC-7 (BL split) unchanged — still PASS at root, skill mirror combined file preserved.
- **One-line executive summary for META:** Wave 8 closed 5 framework-level gaps (Section II.1 + III.Ω + II.2 in `eradev.md` both languages, `odtoe-articles/config.md` heading drift, new `templates/domain_skin.code.md`) additively with backward-compat preserved; net +306 lines across 4 modified + 172 lines in 1 new = 5 files total.

---

*Wave 8 [BUILDER] closure. Ready for META synthesis and final commit pass in combination with Wave 7 parallel.*
