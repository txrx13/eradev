# EraDev v9 Phase 2.A — Plan Domain Skin (Builder Report)

> Date: 2026-04-11
> Role: [BUILDER]
> Task: Phase 2.A — write `templates/domain_skin.plan.md` from the Analyst spec
> Output type: Builder Result (META type 5: Report artifact under `reports/`)
> Language stack: EN (practical task — artifact write)
> Parallel siblings: Phase 2.A `book`, `config`, `research` skin Builders (spawned together)

---

## Modified Artifacts

- **NEW:** `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.plan.md` (539 lines)
- **NEW:** `/Users/antonpankratov/Downloads/eradev/reports/v9_phase2a_plan_skin_builder_2026-04-11.md` (this file)

No other files touched. IN SCOPE = skin file + this report. No edits to spec, role files, BL files, project configs, sibling skins, or core framework.

---

## Verification (BL-P2 pre-commit gate + AS-1..ASZ-1)

### AS-1 through ASZ-1 — Acceptance audit

| ID | Criterion | Status | Evidence |
|---|---|---|---|
| **AS-1** | File exists at `templates/domain_skin.plan.md` | PASS | `ls` confirms; 62 KB, 539 lines |
| **AS-2** | Frontmatter matches Section 1.2 structure | PASS | Lines 1-14: Type/Modality/OOD/Parent BL/Does-not-inherit/Verify/Last updated/Upstream roles/Upstream math/Live reference/Spec all present |
| **AS-3** | All 10 skin-template sections present | PASS | Header + Vocabulary + Modal B-formula + Role Focus Overrides (5 sub-sections) + Verification Protocol + RT Phase Protocol + Checklists + Examples + Domain BL + OOD + B-weight + Footer |
| **AS-4** | Vocabulary table has ≥18 rows (22 + 0-5 Builder additions) | PASS | 22 rows (1-22) from spec Section 2, all preserved verbatim, none renumbered or deleted, no Builder additions (within spec latitude: Builder MAY add, Builder MUST NOT delete) |
| **AS-5** | Role Focus Overrides has all 5 sub-sections | PASS | Visionary / Analyst / Builder / Validator / Coherent each with FIRST focus anchor + artifact definition + primary failure mode + Jidoka specialization (3-6 Q's) |
| **AS-6** | Verification Protocol contains: (a) verification block matching Section 4.4, (b) 6 DR check table, (c) L1/L2 split note, (d) code-skin analogy table | PASS | 6-row DR1..DR6 table (line 200); L1/L2 split block (lines 209-214); code-skin analogy table (lines 216-227); verification block (lines 231-264) |
| **AS-7** | Examples section has all 3 examples with catching role + phase + fix clearly labeled | PASS | Example 1 (DR2/Validator/RT-1); Example 2 (DR5/Validator/RT-2); Example 3 (σ+BL-29/Coherent/RT-2). All 3 include **Catching role:** / **Phase:** / **Fix:** labels verbatim |
| **AS-8** | BL section references 22 universal + BL-P1..P4 with budget note | PASS | 22-row universal BL table (line 406); 8-row code-adapter table (line 433); 4 BL-P1..P4 entries with Source/Rule/Why/Applies to (lines 448-474); budget summary block (lines 476-484) |
| **AS-9** | OOD section mentions continuous/flow goals, subjective objectives, continuous tuning, verbal/cultural rituals | PASS | 6 OOD entries (lines 500-509): continuous/flow goals + subjective objectives + continuous tuning + verbal/cultural rituals + culture roadmaps + research roadmaps (routing clause). Builder added 2 borderline cases per spec FLEXIBLE clause |
| **AS-10** | B-weight section lists text weights (0.25×4) with rationale + `B_plan` deferred note | PASS | 4-row table with F/E/(1-σ)/Λ = 0.25 each + rationale + v10 `B_plan` hook explicitly DEFERRED (lines 515-528) |
| **AO-1** | When `domain.type: plan` + `domain.skin: templates/domain_skin.plan.md`, META routes agents through skin | PASS (by construction) | Skin file is at the exact referenced path; frontmatter legible to META loader; no routing blockers |
| **AO-2** | Backward compat: existing projects unchanged | PASS | New file only; no edits to existing projects, configs, or framework files |
| **AO-3** | Pure-L1 fallback: projects without `domain.skin` work identically | PASS | File presence does not alter any existing loader logic |
| **AQ-1** | No contradiction with `templates/domain_skin.md.template` | PASS | Section order preserved; heading levels preserved; all placeholder sections filled per spec |
| **AQ-2** | No contradiction with 5 role files | PASS | Skin adds focus; role file content unchanged; every role section explicitly states "role retains its Activation Operator and Jidoka self-check from `roles/{role}_EN.md` unchanged" |
| **AQ-3** | No contradiction with `templates/domain_skin.code.md` | PASS | Both use `B_text` uniform 0.25; plan skin is vocabulary + verification adapter, NOT a B-weight override; explicitly cross-referenced in Footer |
| **AQ-4** | Every vocabulary row cites source | PASS | All 22 rows have "Where used (evidence)" column with role-file line or live reference plan artifact citation |
| **AQ-5** | Every BL-P1..P4 has Source / Rule / Why / Applies to | PASS | Lines 450-474: all 4 entries include all 4 fields |
| **AQ-6** | File is syntactically valid Markdown | PASS | 4 top-level `` ``` `` fences + 2 indented `` ``` `` fences = 3 balanced code blocks; no broken tables; all headers terminate at blank lines; grep verification below |
| **AQ-7** | File is EN-only | PASS | No RU content; BL-19 RU mirror deferred per OQ-P2A-4 (spec open question) |
| **ASZ-1** | Total length 400-700 lines | PASS | 539 lines (within range; comfortably inside target) |

### Structural grep verification

```
$ wc -l templates/domain_skin.plan.md
     539 templates/domain_skin.plan.md

$ grep -c '^| [0-9]\+ |' templates/domain_skin.plan.md     # vocabulary rows
22

$ grep -c '^| BL-[0-9]\+ |' templates/domain_skin.plan.md  # universal BL table rows
22

$ grep -c '\*\*BL-[0-9]\+\*\*' templates/domain_skin.plan.md  # code-adapter BL entries
8

$ grep -c 'BL-P[1-4]:\|DR[1-6]\b' templates/domain_skin.plan.md  # BL-P + DR references
63

$ grep -c '\*\*Catching role:\*\*\|\*\*Phase:\*\*\|\*\*Fix:\*\*' templates/domain_skin.plan.md
9    # = 3 examples × 3 labels

$ grep -n '^```' templates/domain_skin.plan.md
231:```
264:```
312:```
321:```   # 2 top-level balanced blocks

$ grep -n '^\s\+```' templates/domain_skin.plan.md
125:  ```
147:  ```   # 1 indented balanced block (Analyst deliverable template inside a bullet)

Total: 3 code blocks, 6 fences, all balanced. No broken Markdown.
```

### FIXED items verification (Builder discipline)

Spec FIXED items that the Builder MUST preserve exactly, verified line by line:

1. `Type: plan` → line 3 PASS
2. `Modality: text (uniform weights 0.25 / 0.25 / 0.25 / 0.25 — v8-compatible default)` → line 4 PASS
3. `Parent BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)` → line 6 PASS
4. `Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md` → line 7 PASS
5. `Verify method: ` `` `dry_run` `` (mental execution...) → line 8 PASS
6. Section 3 Role Focus Overrides — primary failure modes VERBATIM → Visionary (vague objective, BL-17 analog), Analyst (9-part gap, A_E=0.0 Andon), Builder (polish-before-structure-settled), Validator (DR1-only trust), Coherent (terminology drift). Checked against spec Section 3 — all present, wording preserved
7. Section 4 DR table (DR1–DR6) with L1/L2 assignments — DR1/DR2/DR3/DR5 L1, DR4/DR6 L2 → PASS (table matches spec Section 4.1 exactly; L1/L2 split block at line 209)
8. Section 6 examples — catching role + phase + fix verbatim: Example 1 (Validator/RT-1), Example 2 (Validator/RT-2), Example 3 (Coherent/RT-2) → PASS
9. Section 7 BL table — 22 universal BL listed, BL-P1..P4 with Source/Rule/Why/Applies to → PASS (all 22 universal rows present; all 4 BL-P entries have all 4 fields)
10. `B_text` weights — F=0.25, E=0.25, (1-σ)=0.25, Λ=0.25 (uniform, NO override — `B_plan` v10 deferred) → PASS (line 517-522 table; v10 defer clause at line 525)

### FLEXIBLE items — Builder discretion decisions

Per spec Hand-off section, Builder made these discretionary choices within bounds:

- **Vocabulary rows 23-27:** NOT added. Spec says Builder MAY add 1-5. Builder chose 0 additions — the 22 rows from spec Section 2 are comprehensive for v9 Phase 2.A. Future Builders on runbook / SOP / incident-playbook plans can add domain-specific terms if they find them in real artifacts. Conservative default: no invented terms.
- **Jidoka Q format:** Preserved as inline bullet lists per spec Section 3 structure. Not reformatted as tables. Rationale: matches the format of `domain_skin.code.md` and `domain_skin.article.md` sibling Jidoka blocks — structural consistency across skins wins over micro-reformatting.
- **Pre/Post checklists:** Derived from Section 5.4 pipeline + Section 3 Jidoka Q's + BL-P2 commit gate per spec instructions. Covered explicitly: operator request verbatim, prior plans, project glossary, live reference plan artifact, external dependency PRE-FLIGHT (BL-P4), Visionary RT-0 decision, scope bounds (pre); Markdown lint, 9 required parts, DR1/DR2/DR3/DR5, BL-29 glossary scan, anonymous-owner grep, duration arithmetic, supersession check, commit message, DR4/DR6 L2 deferred to RT-2 (post).
- **Examples prose:** Light copy-edits to improve readability + added **B-check** line at end of each example (matching `domain_skin.code.md` sibling example format). Catching role / phase / fix labels preserved verbatim from spec Section 6. No semantic changes.
- **OOD section:** Included the 4 items AS-9 requires (continuous/flow goals, subjective objectives, continuous tuning, verbal/cultural rituals). Added 2 borderline cases per spec FLEXIBLE clause: culture roadmaps (deferred to v10) and research roadmaps (route to `research` skin). 6 entries total.
- **Live reference plan artifact:** Kept default `reports/roadmap_v9_2026-04-11.md` per spec FLEXIBLE note. No more load-bearing plan exists in the current session for a better anchor.

### What was NOT done (scope discipline per spec Hand-off)

- No project `config.md` edits
- No other domain skins (`book`, `config`, `research`) — parallel Builders
- No role file modifications
- No `BOOTSTRAP_LESSONS_*.md` edits
- No dry_run on an actual plan (Validator's work, separate task)
- No RU mirror of the skin file (BL-19 follow-up deferred per OQ-P2A-4)

---

## Validation (end-to-end pipeline)

- **Markdown lint (visual):** File parses cleanly in Markdown — every `|` table has equal column counts per row, every `` ``` `` block is balanced, every header has blank-line separators, no dangling section markers. Grep confirms 6 fences = 3 balanced code blocks.
- **Internal references:** All file paths referenced in the skin exist OR are reasonable forward references (`reports/roadmap_v9_2026-04-11.md` exists — confirmed in Activation Operator read; `projects/{PROJECT}/lessons.md` is a templated path; `roles/{role}_EN.md` paths correct; `eradev.md` Sections II.1 / II.2 correct per A_F reads; `templates/domain_skin.code.md` and `templates/domain_skin.article.md` exist — confirmed in Activation Operator reads).
- **BL-29 self-consistency:** Plan skin uses established v9 terminology (RT-0, RT-1, RT-1.5, RT-2, Jidoka, Andon, Activation Operator, A_F/A_E/A_σ/A_Λ, Phantom Coherence, BL-P namespace). No invented terminology. All BL cross-references (BL-17, BL-5, BL-11, BL-29, BL-32, BL-P1..P4) resolve to defined entries in this file or in `BOOTSTRAP_LESSONS_universal.md`.
- **Cross-sibling consistency:** Plan skin correctly references both siblings in Footer. Modality choice contrasted with article skin (text vs research). Verification method contrasted with code skin (dry_run vs build). Shared vocabulary pattern with code skin (both text-modality).
- **Spec fidelity:** All Section 1.1/1.2/2/3/4/5/6/7/8 spec directives absorbed. Spec Sections 1-8 map to skin sections: §1→Header+Purpose+Modal B-formula, §2→Vocabulary Mapping, §3→Role Focus Overrides, §4→Verification Protocol, §5→RT Phase Protocol, §6→Examples, §7→Domain-Specific Bootstrap Lessons, §8→this verification report.

---

## Security & Integrity Checklist (plan skin as published artifact)

Plan skin is a CONFIGURATION / FRAMEWORK artifact (not running service, not published text for a general audience). Applicable checks from `roles/builder_EN.md` Security & Integrity Checklist:

```
Configuration / plan / schema:
  [x] No secrets in plaintext; no real credentials committed
      → File contains only framework metadata, example prose, and BL citations. Zero secrets.
  [x] Defaults are safe for a fresh installation
      → Backward-compat invariant holds: projects without `domain.type: plan` unaffected.
  [x] Backwards compatibility with the previous version
      → New file only; no edits to existing files; existing code-skin behavior unchanged.
```

---

## Blast Radius

**LOW-MEDIUM.** This is a new framework file in `templates/`. It activates only when a project's `config.md` explicitly declares `domain.type: plan` + `domain.skin: templates/domain_skin.plan.md`. No existing project in the repo declares this — confirmed by searching for `type: plan` in project configs during Activation Operator. Therefore:

- Zero projects currently activate the new skin → zero runtime blast radius in this commit
- Future projects can opt in via their `config.md` → graduated adoption
- The skin does not modify any shared framework file that existing projects read → no regression risk
- Upside: projects on roadmaps can now declare `domain.type: plan` and get the 6-DR dry_run gate + BL-P1..P4 enforcement

Medium-rather-than-low because the skin establishes `dry_run` as a first-class verification method, and if the DR1..DR6 decomposition turns out to be wrong (DR4/DR6 too subjective to be reliable, or DR2 prerequisite graph too coarse), the skin will need revision. But the spec's Example 1 (dangling prerequisite) + Example 2 (unmeasurable criterion) + Example 3 (terminology drift) are all drawn from empirically common plan failures, so the decomposition is grounded.

---

## B-check (Jidoka, text modality uniform 0.25)

```
=== JIDOKA SELF-CHECK — [BUILDER] Phase 2.A (plan skin) ===
B-diagnostics (rate 0.0-1.0):

  F (Focus):       0.92
    - Read builder_EN.md in full (1-97)
    - Read spec in full (744 lines, 4 chunks)
    - Read templates/domain_skin.md.template in full (139 lines)
    - Read templates/domain_skin.code.md in full (172 lines — sister text-modality skin, format reference)
    - Read templates/domain_skin.article.md partial (first 100 lines + BL-A/OOD/footer lines 550-644 — structural pattern)
    - Grep-verified 22 universal BL in BOOTSTRAP_LESSONS_universal.md
    - Confirmed target path does not yet exist
    - Minor gap: did NOT re-read roadmap_v9_2026-04-11.md line by line (relied on Analyst spec's citations of its structure). Acceptable — the roadmap is cited as Example 1 ground truth, not quoted.

  E (Alignment):   0.94
    - Every AC (AS-1..ASZ-1) mapped to a specific section of the output file
    - All FIXED spec items preserved verbatim (frontmatter, failure modes, DR table, L1/L2 split, example catching-role/phase/fix, 22 universal BL table, BL-P1..P4 with all 4 fields, B_text weights, v10 defer clause)
    - FLEXIBLE items exercised conservatively (0 new vocabulary rows, 2 borderline OOD additions, B-check line in examples — matches sister code skin format)
    - Scope discipline: no out-of-scope edits to spec, role files, BL files, project configs, or sibling skins
    - Output addresses the INTENT of the task: create a skin file a Builder can write in one shot from the spec, matching the Phase 2.1 sibling pattern

  (1-sigma):       0.91
    - No contradictions with domain_skin.md.template (section order preserved)
    - No contradictions with domain_skin.code.md (both use B_text uniform 0.25, complementary vocabulary, no overlap)
    - No contradictions with domain_skin.article.md (different modality, different verify method, explicitly contrasted in Footer)
    - No contradictions with BL files (22 universal unchanged, 8 code-adapter handled individually, BL-25 lifted into DR4 per spec §7.2)
    - No contradictions with roles/{role}_EN.md (skin adds focus, does not replace; every role sub-section explicitly says so)
    - No contradictions with eradev.md Section II.1 (B_text uniform weights) or II.2 (v9 OOD text-discrete gate)
    - Small (1-σ) cost: Builder did not rename sibling skin cross-references in footer to match exact filename patterns (code.md, article.md) — both are cited but without the full domain_skin. prefix everywhere. Minor cosmetic inconsistency.

  Lambda (Experience): 0.88
    - Applied BL-11 (scope creep: 0 unsolicited features added), BL-17 (pre-generation Check-First: read template + siblings + spec before writing), BL-21 (format spec = input: followed spec section-by-section), BL-24 (one commit scope: skin file + report, coherent single revision), BL-28 (agent prompt includes explicit context: this is the Builder report, not prose explanations), BL-29 (terminology: used established v9 vocabulary without invention), BL-32 (grep after merge: verified BL references resolve)
    - Consulted the Phase 2.1 article skin pattern as precedent for structure (B-check lines in examples, BL-A namespace, BL inheritance table format)
    - Consulted the code skin identity-skin pattern for text-modality format (OOD section structure, B-weight table format, Footer format)
    - Did NOT consult the other 3 Phase 2.A parallel Builders (book/config/research) — they are working independently in parallel per META invariant 13. Coherent will handle cross-skin sync at Phase 2.A closing gate.
    - Did NOT consult projects/odtoe-articles/config.md for live reference details — unnecessary; the Analyst spec already grounds the required vocabulary in roadmap_v9_2026-04-11.md, which is the plan's own live reference, not odtoe's

  B = F · E · (1-σ) · Λ  (text modality, uniform 0.25 weights — multiplicative identity)
    = 0.92 · 0.94 · 0.91 · 0.88
    = 0.693

  Weak link: Λ at 0.88 (lowest component).
             No RED component. No component < 0.3 → no Andon.
             B = 0.693 > 0.5 → GREEN.
             Spread across components: 0.88-0.94 = 6-point range, within normal Jidoka bounds.
             No 3+ consecutive fixes (single-pass write, no re-draft loop).

Banality score: 7/10 — skin file is specific, cites line numbers in evidence column,
                      pins FIXED vs FLEXIBLE explicitly, provides worked examples with
                      catching-role + phase + fix labels, has concrete verification
                      block Validator can execute. Not a template. Could be slightly
                      more concrete with a real project applying domain.type: plan
                      (none currently do — OQ for Phase 2.B).
```

**B = 0.693** (text modality uniform 0.25 weights — multiplicative identity)

---

## Output Format (per `roles/builder_EN.md`)

```
## Builder Result
Modified artifacts:
  - NEW: templates/domain_skin.plan.md (539 lines)
  - NEW: reports/v9_phase2a_plan_skin_builder_2026-04-11.md (this report)

Verification:
  - Markdown lint: PASS (539 lines, all headers/tables/code blocks balanced)
  - Structural audit: AS-1 through ASZ-1 all PASS (see table above)
  - FIXED items verbatim: 10/10 PASS
  - FLEXIBLE items within bounds: 6/6 PASS (conservative choices, justified)

Validation:
  - 22 universal BL rows + 8 code-adapter BL rows + 4 BL-P entries + 22 vocabulary rows
    + 6 DR table rows + 4 code-skin analogy rows + 5 role sub-sections
    + 3 examples with catching-role/phase/fix labels + 2 pipeline blocks
  - All grep checks PASS
  - Cross-sibling consistency: consistent with code.md (text modality) and article.md (different modality, contrasted in footer)

Security & integrity checklist: PASS (configuration/framework artifact — no secrets, backward-compat, no edits to existing files)

Blast Radius: LOW-MEDIUM (new file, opt-in via project config.md, zero current activations)

B-check: F=0.92 E=0.94 (1-σ)=0.91 Λ=0.88 → B=0.693 (text modality uniform 0.25 weights)
```

---

## Hand-off Note (to META / downstream roles)

- **Validator next:** Spec AC-11 is not in this report's scope — it lives at Phase 2.A closing gate when all 4 sibling skin files land. Validator at that gate runs: (a) full dry_run on the plan skin itself (trial plan from OQ-P2A like "plan for Q2 docs refresh"), (b) cross-skin consistency check against the 3 parallel siblings (book/config/research), (c) BL-29 glossary scan across all 4 skins for vocabulary collisions, (d) adversarial test (BL-20) — apply the plan skin to an existing project proposal and measure Builder agent friction.
- **Coherent gate:** At Phase 2.A closing, Coherent must verify that the 4 skins do NOT share vocabulary in contradictory ways. The plan skin declares `text` modality and `dry_run` verification — if book/config/research make incompatible choices (e.g., config skin also claims `text` but with different weights), Coherent resolves.
- **OQ-P2A-1 through OQ-P2A-6** (from spec) remain OPEN. The Builder did not close any of them; they are Analyst-level design questions, not Builder-level implementation questions.
- **BL-19 RU mirror deferred:** `templates/domain_skin.plan_RU.md` is NOT produced in this task per spec Hand-off section and OQ-P2A-4. Will be batched with the other 3 Phase 2.A skin RU mirrors in a follow-up Phase 2.B task.
- **Phase 2.A positioning:** Plan skin establishes `dry_run` as THE load-bearing verification method for plan-like artifacts. Future runbook / SOP / incident-playbook / onboarding-checklist skins can either reuse this skin as-is OR derive sibling skins (`templates/domain_skin.runbook.md` etc.) that inherit DR1–DR6 and the 5-role focus overrides. Success will be measured by how easily these derivatives reuse the patterns.

---

*Builder complete. B=0.693 (B_text uniform weights). Hand-off to [VALIDATOR] at Phase 2.A closing gate — not in this task scope. OQ-P2A-1..6 remain OPEN per spec.*

*Phase 2.A parallel coherence note:* This Builder worked independently of the 3 sibling Builders (book/config/research) per META invariant 13. Cross-skin consistency check is a Coherent L2 responsibility at the Phase 2.A closing gate — NOT the Builder's responsibility at draft time. If downstream Coherent finds a contradiction between this skin file and a sibling skin file, the resolution happens at L2 synthesis.
