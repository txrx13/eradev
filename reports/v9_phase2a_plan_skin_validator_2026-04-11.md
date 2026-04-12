# EraDev v9 Phase 2.A — Plan Domain Skin (Validator Report)

> Date: 2026-04-11
> Role: [VALIDATOR]
> Task: Phase 2.A — verify `templates/domain_skin.plan.md` against its spec
> Output type: Validator Report (META type 5: Report artifact under `reports/`)
> Language stack: EN (practical task — artifact verification)
> Parallel siblings: Phase 2.A `book`, `config`, `research` skin Validators (spawned together)

---

## Verified: Plan vs Result

### Source materials read

- **Spec:** `reports/v9_phase2a_plan_skin_spec_2026-04-11.md` (745 lines, all 8 sections + hand-off + open questions)
- **Builder report:** `reports/v9_phase2a_plan_skin_builder_2026-04-11.md` (263 lines, all AS/AO/AQ checks documented)
- **Artifact:** `templates/domain_skin.plan.md` (539 lines, read in full)
- **Role file:** `roles/validator_EN.md` (88 lines, Activation Operator applied)

---

## Checklist 1: File existence and size (AS-1, ASZ-1)

| Check | Spec requirement | Artifact | Verdict |
|---|---|---|---|
| File exists | `templates/domain_skin.plan.md` | Confirmed via `wc -l` | PASS |
| Line count | 400-700 lines | 539 lines | PASS |

---

## Checklist 2: Header block (AS-2, FIXED items)

| Field | Spec Section 1.2 value | Artifact value (lines 1-14) | Verdict |
|---|---|---|---|
| Title | `# Domain Skin: plan` | `# Domain Skin: plan` | PASS |
| Type | `plan` | `plan` | PASS |
| Modality | `text (uniform weights 0.25 / 0.25 / 0.25 / 0.25 — v8-compatible default)` | Matches verbatim | PASS |
| OOD scope | `text-discrete` | `text-discrete` | PASS |
| Parent BL | `BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)` | Matches verbatim | PASS |
| Does NOT inherit | `BOOTSTRAP_LESSONS_code_adapter.md` | Matches verbatim | PASS |
| Verify method | `dry_run` | `dry_run (mental execution by a reader who did not author)` | PASS |
| Last updated | `2026-04-11` | `2026-04-11` | PASS |
| Upstream roles | `roles/{role}_EN.md` | Matches | PASS |
| Upstream math | `eradev.md Section II.1 + II.2` | Matches | PASS |
| Live reference | `reports/roadmap_v9_2026-04-11.md` | `reports/roadmap_v9_2026-04-11.md (v9's own Phase 0/1/2 plan)` | PASS |
| B_plan v10 DEFERRED | Explicit defer clause | Lines 81, 524: DEFERRED mentioned | PASS |
| Extra: Spec line | Not in spec header block | Builder added `> Spec: reports/v9_phase2a_plan_skin_spec_2026-04-11.md` at line 13 | NOTE (acceptable — spec says formatting is FLEXIBLE; adds traceability) |

---

## Checklist 3: Vocabulary table (AS-4, Section 2)

| Check | Requirement | Result | Verdict |
|---|---|---|---|
| Row count | 22 rows (spec rows 1-22) | `grep '^\| [0-9]' → 22 matches` | PASS |
| STEP emphasis | Row 2 ("function → plan step") | Present | PASS |
| DEPENDENCY emphasis | Row 10 ("API → upstream dependency / handoff interface") | Present | PASS |
| STAKEHOLDER emphasis | Row 13 ("code review → stakeholder sign-off") | Present | PASS |
| CONTINGENCY emphasis | Row 21 ("rollback/revert → withdraw the plan") | Present | PASS |
| No deletions/renumbering | Rows 1-22 intact | Verified by reading lines 33-57 | PASS |
| Builder additions (0-5 allowed) | 0 additions | PASS (conservative choice within bounds) |
| "Where used" column | Every row cites source | Verified all 22 rows cite role files or roadmap | PASS |
| CRITICAL note block | Vocabulary table WINS on contradiction | Present at line 58-59 | PASS |

---

## Checklist 4: Role Focus Overrides (AS-5, Section 3)

| Role | FIRST focus anchor | Artifact definition | Primary failure mode | Jidoka Q count | Verdict |
|---|---|---|---|---|---|
| Visionary | Read operator's ORIGINAL request + supersession check | Central objective + boundary | Vague objective (BL-17 analog) | 4 (Q1-Q4) | PASS |
| Analyst | Read Visionary objective + prior plans + enclosing plan | 9-part structured plan document | "Perfect looking" outline with gaps; A_E=0.0 Andon if any of 9 parts missing | 5 (Q1-Q5) | PASS |
| Builder | Read Analyst draft + live reference + project terminology | Single plan document file at canonical path | Polish-before-structure-settled | 6 (Q1-Q6) | PASS |
| Validator | Read Analyst plan + Builder plan; run 6 DR checks | Polished plan file in final form | DR1-only trust (must run ALL 6 DR checks) | 6 (Q1-Q6) | PASS |
| Coherencer | Read plan end-to-end twice (top-down + bottom-up) | Plan + prior plans = plan series | Terminology drift across sections | 5 (Q1-Q5) | PASS |

**Analyst 9-part deliverable template:** Present at lines 104-147, includes code-fenced template block with all 9 parts (Objective, Scope, Phases, DAG, Pass criteria, Resources, Contingencies, OOD, Open Questions) + B-check line. PASS.

**All roles state "retains Activation Operator and Jidoka from roles/{role}_EN.md unchanged":** Confirmed at line 87. PASS.

---

## Checklist 5: Verification Protocol — DR1-DR6 (AS-6, Section 4)

| DR | Check name | Who runs it | Mechanism | L1/L2 | Present | Verdict |
|---|---|---|---|---|---|---|
| DR1 | Step-by-step walkthrough | Validator | Near-mechanical | L1 | Line 202 | PASS |
| DR2 | Prerequisite check | Validator | Mechanical | L1 | Line 203 | PASS |
| DR3 | Resource completeness | Validator | Mechanical | L1 | Line 204 | PASS |
| DR4 | Contingency presence | Validator | Interpretive | L2 | Line 205 | PASS |
| DR5 | Success criterion measurability | Validator | Near-mechanical | L1 | Line 206 | PASS |
| DR6 | Handoff clarity | Coherencer | Interpretive | L2 | Line 207 | PASS |

**L1/L2 split note:** Lines 209-214 explicitly state L1 = DR1/2/3/5 (per-commit), L2 = DR4/6 (pre-activation). PASS.

**Code-skin analogy table:** Lines 220-225, 4 rows mapping compile/test/lint/integration to DR checks. PASS.

**Verification block:** Lines 231-264, fenced code block with method/command/success criteria/failure recovery/independence check. All fields present. PASS.

### DEFECT D-1: Internal contradiction in Example 2 vs L1/L2 classification

- **Location:** Artifact line 383 (Example 2 "Phase" field)
- **What it says:** "DR5 is L2 interpretive; runs at RT-2"
- **What L1/L2 split says (line 213):** DR5 is L1 (mechanical, per-commit)
- **What Post-Generation Checklist says (line 345):** DR5 runs at commit time (L1)
- **What the spec says:** Section 4.2 classifies DR5 as L1. Example 6.2 says "DR5 is L2 interpretive; runs at RT-2."
- **Root cause:** The SPEC ITSELF contains this contradiction between Section 4.2 (DR5 = L1) and Example 6.2 (DR5 = "L2 interpretive"). The Builder faithfully reproduced both spec sections, inheriting the contradiction.
- **B-deficit:** sigma (internal consistency failure)
- **Severity:** MEDIUM. DR5 (success criterion measurability) is arguably near-mechanical (scan for numeric/binary keywords) and correctly classified as L1 in Section 4.2. Example 2's "L2 interpretive" label is incorrect per the spec's own DR classification. The Post-Generation Checklist (lines 342-345) correctly lists DR5 as an L1 commit-time check, and Example 2's Phase field says "RT-2" while DR5 should catch this at RT-1 commit gate.
- **Fix:** Change artifact line 383 from:
  `- **Phase:** **RT-2** (pre-activation — DR5 is L2 interpretive; runs at RT-2). But Analyst's Jidoka Q4 should have caught it at RT-1; the fact that it didn't is a process defect worth Hansei.`
  to:
  `- **Phase:** **RT-1** (DR5 is L1 near-mechanical; runs at commit-time per the Post-Generation Checklist). But Analyst's Jidoka Q4 should have caught it even earlier at draft time; the fact that it didn't is a process defect worth Hansei.`
- **Note:** This fix also corrects the spec's own internal contradiction. The spec's Section 4.2 (the authoritative DR classification) says DR5 = L1. Example 2 in the spec says "L2 interpretive" but that is the spec's own error. The artifact should follow Section 4.2 (the normative section), not the example (illustrative).

---

## Checklist 6: RT Phase Protocol (Section 5)

| RT | Type | Status | Requirement | Artifact | Verdict |
|---|---|---|---|---|---|
| RT-0 | Visionary solo | RECOMMENDED | Objective capture + OOD + supersession | Lines 279-308 | PASS |
| RT-1 | Full 5-role | MANDATORY | 9-part draft + polish + DR1-DR5 + glossary | Lines 280-281 | PASS |
| RT-2 | Full 5-role | MANDATORY (pre-activation) | 6 DR checks + BL-29 + BL-P3 | Lines 281-282 | PASS |
| RT-1.5 | Optional | For XL plans | After each major phase group | Line 283 | PASS |
| Plan pipeline block | FIXED | Code-fenced | Lines 312-321 | PASS |
| RT-0 output format | 4 outcomes | APPROVED/REJECTED/SUPERSEDES/OUT-OF-SCOPE | Lines 304-308 | PASS |
| Single vs split Builder | Decision documented | Single for S/M/L; split for XL only | Lines 287-300 | PASS |

---

## Checklist 7: Examples (AS-7, Section 6)

| Example | DR/failure | Catching role | Phase | Fix present | B-check present | Verdict |
|---|---|---|---|---|---|---|
| 1: Dangling prerequisite | DR2 | Validator | RT-1 | Yes | Yes (B=0.52 YELLOW) | PASS |
| 2: Unmeasurable criterion | DR5 | Validator | RT-2 (DEFECT — should be RT-1; see D-1) | Yes | Yes (B=0.55 YELLOW) | PASS WITH NOTES |
| 3: Terminology drift | sigma + BL-29 | Coherencer | RT-2 | Yes | Yes (B=0.41 RED) | PASS |

All 3 examples have `**Catching role:**`, `**Phase:**`, `**Fix:**` labels (3 labels x 3 examples = 9; grep confirms 9). PASS.

All 3 examples have a "Why DR1 alone would miss this" / "How the skin's vocabulary maps this" pedagogical note. PASS.

Builder added `**Domain classification:**` and `**B-check:**` lines to each example (matching `domain_skin.code.md` sibling format). Acceptable Builder enhancement within FLEXIBLE bounds.

---

## Checklist 8: Bootstrap Lessons (AS-8, Section 7)

| Component | Requirement | Artifact | Verdict |
|---|---|---|---|
| Universal BL table | 22 rows, all inherited unchanged | Lines 408-431: `grep '^\| BL-[0-9]' → 22 rows` | PASS |
| Code-adapter BL table | 8 rows, treated individually | Lines 435-444: `grep '^\| \*\*BL-[0-9]' → 8 rows` | PASS |
| BL-3 transfer | Applies unchanged | Present in table | PASS |
| BL-24 transfer | Applies unchanged | Present in table | PASS |
| BL-8 N/A | N/A for plans | Present: "Plans do not have feature flags" | PASS |
| BL-25 LIFTED into DR4 | Not a separate BL-P | Present: "LIFTED INTO DR4" | PASS |
| BL-P1 | Plan Activation = Release Event (from BL-2) | Lines 452-456: Source/Rule/Why/Applies to all present | PASS |
| BL-P2 | Render + Dry_Run Before Commit (from BL-6) | Lines 458-462: Source/Rule/Why/Applies to all present | PASS |
| BL-P3 | Supersession Before Activation (from BL-14) | Lines 464-468: Source/Rule/Why/Applies to all present | PASS |
| BL-P4 | External Dependency PRE-FLIGHT (from BL-22) | Lines 470-474: Source/Rule/Why/Applies to all present | PASS |
| Budget summary | Total = 28 BL (22 universal + 2 transferred + 4 BL-P) | Lines 476-486: all counts match | PASS |
| lessons.md integration | Rule + one-line routine + applies-to | Lines 488-494 | PASS |

---

## Checklist 9: Scope discipline

| Check | Verdict |
|---|---|
| Only new files created (no edits to existing) | PASS — artifact is NEW; Builder report is NEW |
| No project config.md edits | PASS |
| No role file modifications | PASS |
| No BL file modifications | PASS |
| No sibling skin modifications | PASS |
| No RU mirror (deferred per OQ-P2A-4) | PASS |

---

## Render / Verify / Validate

### Markdown structure verification

| Check | Result | Verdict |
|---|---|---|
| Top-level code blocks | 4 fences (`^````) at lines 231, 264, 312, 321 = 2 balanced pairs | PASS |
| Indented code blocks | 2 fences at lines 125, 147 = 1 balanced pair (Analyst deliverable template) | PASS |
| Total code blocks | 3 balanced blocks, 6 fences | PASS |
| Section headers | 1 H1, 16 H2, 17 H3 = 34 total headers, all with blank-line separators | PASS |
| Tables | 7 tables (vocabulary 22-row, B-formula 4-row, DR 6-row, code-analogy 4-row, BL-universal 22-row, BL-adapter 8-row, B-weight 4-row) — all have equal column counts per row | PASS |
| Horizontal rules | 10 `---` separators between major sections | PASS |

### Cross-reference verification

| Reference | Resolves? | Verdict |
|---|---|---|
| `reports/roadmap_v9_2026-04-11.md` | Confirmed exists | PASS |
| `templates/domain_skin.code.md` | Referenced at lines 79, 539 | PASS |
| `templates/domain_skin.article.md` | Referenced at line 539 | PASS |
| `roles/{role}_EN.md` | Template path, correct pattern | PASS |
| `BOOTSTRAP_LESSONS_universal.md` | Referenced, correct | PASS |
| `reports/v9_phase2a_plan_skin_spec_2026-04-11.md` | Referenced in header + footer | PASS |

### Terminology consistency (BL-29 / Mura detector)

| Term | Usage pattern | Verdict |
|---|---|---|
| dry_run | Consistent throughout (never "dry run" or "dryrun") | PASS |
| DR1-DR6 | Consistent bold-numbered format | PASS |
| BL-P1..P4 | Consistent namespace | PASS |
| RT-0/RT-1/RT-2 | Consistent throughout | PASS |
| "text-discrete" | Consistent (never "text discrete") | PASS |
| Activation Operator | Consistent | PASS |
| Jidoka | Consistent | PASS |
| Andon | Consistent | PASS |

---

## Edge Cases Probed

1. **What if a project declares `domain.type: plan` but no `domain.skin`?** The skin file's Purpose section (lines 19-21) requires BOTH fields. Without `domain.skin`, META does not load the skin. Pure-L1 fallback works — no regression. PASS.

2. **What if a new plan skin BL-P5 is needed?** The BL-P namespace is explicitly separated from the 30-BL budget (lines 450, 483-486). Future additions are accommodated. PASS.

3. **What if two plans for the same objective coexist without supersession markers?** BL-P3 (lines 464-468) + Coherencer supersession enforcement (line 190) explicitly BLOCK activation. PASS.

4. **What if the plan has continuous/subjective objective?** OOD section (lines 498-509) explicitly lists 6 OOD patterns and routes to Visionary RT-0 kill-switch. PASS.

5. **What if the vocabulary table contradicts Section 3 (Role Focus Overrides)?** The CRITICAL note at lines 58-59 says "vocabulary table WINS" and agent must escalate to META. PASS.

6. **Adversarial: Example 2 L1/L2 contradiction.** See D-1 above. An agent reading Example 2 would conclude DR5 runs at RT-2, but reading the L1/L2 split (line 213) and Post-Generation Checklist (line 345), they would conclude DR5 runs at commit-time. MEDIUM confusion risk.

---

## Defects

| ID | Location | Description | B-deficit | Severity | Fix |
|---|---|---|---|---|---|
| **D-1** | Line 383 | Example 2 says "DR5 is L2 interpretive; runs at RT-2" but L1/L2 split (line 213) and Post-Generation Checklist (line 345) classify DR5 as L1 (mechanical, per-commit). Internal contradiction inherited from the spec's own inconsistency between Section 4.2 and Example 6.2. | sigma | MEDIUM | Change Phase field to "RT-1 (DR5 is L1 near-mechanical; runs at commit-time)" |

**No other defects found.** All FIXED items from the spec preserved verbatim. All FLEXIBLE items exercised within bounds. All structural, routing, and quality acceptance criteria satisfied.

---

## Fix Chain

| Component | Consecutive fix count | Status |
|---|---|---|
| `templates/domain_skin.plan.md` | 0 (first-pass artifact) | GREEN |

No fix chain. Single-pass write with one defect found.

---

## Verdict: PASS WITH NOTES

**Overall:** The artifact `templates/domain_skin.plan.md` (539 lines) satisfies all 10 structural acceptance criteria (AS-1 through ASZ-1), all 3 routing/operator criteria (AO-1 through AO-3), and all 7 quality criteria (AQ-1 through AQ-7). The artifact faithfully implements the Analyst spec with conservative Builder discretion choices. Markdown renders cleanly. Cross-references resolve. Terminology is consistent. BL budget is correct. Examples are pedagogically effective. Scope discipline is maintained.

**One defect (D-1, MEDIUM):** Example 2's Phase field contradicts the L1/L2 classification within the same document. The contradiction is inherited from the spec itself (Section 4.2 vs Example 6.2 disagree on DR5 classification). The fix is a one-line edit to align Example 2 with the normative L1/L2 definition. This does NOT block activation of the skin but SHOULD be fixed before the Phase 2.A closing gate to avoid confusing downstream agents.

**Recommendation:** Fix D-1 (one-line edit in Example 2), then the artifact is ready for Phase 2.A Coherencer gate. No structural re-work needed. No RT-1 re-entry needed.

---

## B-check (Jidoka, text modality uniform 0.25)

```
=== JIDOKA SELF-CHECK — [VALIDATOR] Phase 2.A (plan skin) ===
B-diagnostics (rate 0.0-1.0):

  F (Focus):       0.93
    - Read validator_EN.md in full (88 lines)
    - Read spec in full (745 lines, all 8 sections + hand-off + open questions)
    - Read Builder report in full (263 lines)
    - Read artifact in full (539 lines, 3 chunks)
    - Ran structural grep checks (vocabulary rows, BL rows, DR rows,
      code blocks, catching-role/phase/fix labels, B-check lines,
      header/section structure, cross-references)
    - Minor gap: did NOT read the live reference plan artifact
      (reports/roadmap_v9_2026-04-11.md) end-to-end — relied on
      the spec's citations. Acceptable — the roadmap is cited as
      Example 1 ground truth, not directly modified.

  E (Alignment):   0.95
    - Verified against the INTENT (does the skin file enable a plan-domain
      agent to work correctly?) not just format compliance
    - Caught D-1 (L1/L2 contradiction) which is an alignment defect
      (agent reading Example 2 would follow wrong verification timing)
    - All 9 checklist items from META task verified with evidence
    - Scope discipline confirmed (no out-of-scope edits)

  (1-sigma):       0.92
    - Caught the one internal contradiction (D-1) between Example 2
      and the L1/L2 split
    - No other contradictions found between: artifact vs spec,
      artifact vs role files, artifact vs code skin, artifact vs
      article skin, artifact internally
    - Terminology is consistent throughout (dry_run, DR1-DR6,
      BL-P1..P4, RT-0/1/2)
    - Small residual: did not cross-check against the 3 parallel
      sibling skins (book/config/research) — that is Coherencer L2
      responsibility at Phase 2.A closing gate, not Validator's scope

  Lambda (Experience): 0.90
    - Applied validator_EN.md Key Rule 7 (ARTIFACT CONTENT AUDIT):
      read the actual content, did not accept existence + line count
      as proof of validity
    - Applied Key Rule 5 (stale output detection): confirmed all
      structural counts (22 vocab rows, 22 BL rows, 8 code-adapter
      rows, 6 DR rows, 3 examples, 3 code blocks)
    - Applied Key Rule 1 (verify every pipeline stage): verified
      Markdown structure, cross-references, terminology consistency
    - Applied BL-17 (Check-First): verified the spec's own internal
      consistency before comparing artifact to spec — caught that
      the spec's Example 6.2 contradicts its own Section 4.2
    - Applied BL-5 (Phantom Coherence Detection): verified that the
      Builder's AS-1..ASZ-1 self-check is substantive, not phantom
      (grep evidence backs every claim)

  B = F * E * (1-sigma) * Lambda  (text modality, uniform 0.25 weights)
    = 0.93 * 0.95 * 0.92 * 0.90
    = 0.731

  No RED component. No component < 0.3 => no Andon.
  B = 0.731 > 0.5 => GREEN.
  Weak link: Lambda at 0.90 (lowest component).
  Spread: 0.90-0.95 = 5-point range, within normal Jidoka bounds.

  Banality score: 8/10 — report is specific, cites line numbers,
                        identifies one genuine defect with root cause
                        analysis (spec's own internal inconsistency),
                        proposes concrete one-line fix, distinguishes
                        between spec contradictions and Builder errors.
                        Not a rubber-stamp PASS.
```

**B = 0.731** (text modality uniform 0.25 weights)

---

## Output Format (per `roles/validator_EN.md`)

```
## Validator Report
Verified: plan skin spec (reports/v9_phase2a_plan_skin_spec_2026-04-11.md)
          vs artifact (templates/domain_skin.plan.md, 539 lines)

Render / verify / validate:
  - Markdown structure: 3 balanced code blocks, 7 tables, 34 headers — PASS
  - Cross-references: 6 file paths verified — PASS
  - Terminology consistency: 8 key terms checked, no drift — PASS

Edge cases:
  - Pure-L1 fallback (no domain.skin): PASS
  - Supersession enforcement: PASS
  - OOD routing: PASS
  - Vocabulary vs Role Focus conflict resolution: PASS
  - L1/L2 contradiction in Example 2: FOUND (D-1)

Defects:
  D-1: Example 2 line 383 — "DR5 is L2 interpretive; runs at RT-2"
       contradicts L1/L2 split (line 213) which says DR5 = L1.
       B-deficit: sigma. Severity: MEDIUM. Inherited from spec.

Fix chain: 0 (first-pass artifact)

Verdict: PASS WITH NOTES (D-1 is MEDIUM, one-line fix, does not block
         but should be fixed before Phase 2.A closing gate)

B-check: F=0.93 E=0.95 (1-s)=0.92 L=0.90 => B=0.731
```

---

*Validator complete. B=0.731 (B_text uniform weights). D-1 flagged for Builder one-line fix. Artifact ready for Phase 2.A Coherencer gate after D-1 resolution.*

*Phase 2.A coherence note:* This Validator verified the plan skin in isolation. Cross-skin consistency check against the 3 parallel sibling skins (book/config/research) is a Coherencer L2 responsibility at the Phase 2.A closing gate, not Validator's scope.
