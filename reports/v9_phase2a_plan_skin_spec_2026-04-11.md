# EraDev v9 Phase 2.A — Plan Domain Skin Specification

> Date: 2026-04-11
> Role: [ANALYST]
> Task: Phase 2.A — specify `templates/domain_skin.plan.md` (L2 domain skin for plans/roadmaps/procedures)
> Output type: Report (META type 5) — Analyst spec for Builder hand-off
> Language stack: EN (practical task — artifact design)
> Zone: Pull with Resonance flavor (specific target + cross-domain bridge code→plan)
> Parallel siblings: Phase 2.A `book`, `config`, `research` skin specs (all spawned together)

---

## Activation Operator Results

- **A_F (Focus)**: Read `roles/analyst_EN.md` (all 78 lines); `templates/domain_skin.md.template` (10-section skeleton); `templates/domain_skin.code.md` (text-modality identity-skin example, 172 lines); first and last thirds of `templates/domain_skin.article.md` (research-modality override-skin example); `reports/v9_phase2_1_article_skin_spec_2026-04-11.md` (Phase 2.1 spec style reference — 662 lines); `eradev.md` Section II.1 lines 97-198 (B_text default, modality registry, v9 IN-SCOPE list incl. "plans and roadmaps", OOD gate); `reports/roadmap_v9_2026-04-11.md` lines 1-336 (itself a live plan artifact — Phase 0/1/2 structure, dependency DAG, pass criteria, CORS, status fields); `BOOTSTRAP_LESSONS_universal.md` (all 22 universal BL); `BOOTSTRAP_LESSONS_code_adapter.md` (all 8 code-adapter BL, including the split-file loading rules). True North: produce a spec rigorous enough that a Builder writes `templates/domain_skin.plan.md` in one shot without design decisions, matching the Phase 2.1 precedent in structure and with three parallel siblings (`book`, `config`, `research`) that reuse identical section scaffolding.
- **A_E (Alignment)**: The spec must be a BRIDGE, not a replacement. Role files already carry implicit plan-domain flavor (Analyst Ex.3 "chapter plan", Builder & Validator pipelines). Unlike articles, the skin's job is NOT to rewrite the role files' vocabulary wholesale — plans share `text` modality with code, so B-weights are uniform (0.25×4) and the vocabulary lift is SMALL. The skin's load-bearing contribution is the `verify.method: dry_run` protocol: plans are future-action artifacts whose correctness is measured by whether a reader can mentally execute them from step 1 to "done" without ambiguity. This is a genuinely new verification modality not covered by the code or article skins. Intent: the plan skin becomes THE template for `dry_run` as a verification method, usable by any future v9 artifact class where "executable intent by a second reader" is the load-bearing property (runbooks, SOPs, incident playbooks, onboarding checklists).
- **A_σ (Consistency)**: No conflict with L0 (ODTOE core untouched). No conflict with Phase 0.A schema (`domain.type: plan` and `B_modality: text` are already enumerated in `eradev.md` Section II.1 lines 117, 168). No conflict with the roadmap v9 report (which itself is a plan artifact and will serve as Example 1 ground truth). No conflict with `templates/domain_skin.code.md` (plans share `B_text` weights — the plan skin is NOT a B-weight override; it is a vocabulary + verification adapter). No conflict with `templates/domain_skin.article.md` (article is `research` modality; plan is `text` modality; they overlap only on the universal BL spine). One TENSION flagged: `eradev.md` line 144 mentions "v10 extension hook: `B_plan` with Λ-dominant weights for roadmaps" as a future possibility. This spec RESPECTS that by pinning `B_modality: text` for v9 (uniform 0.25×4) and documenting the `B_plan` override as a v10 FUTURE HOOK, NOT a v9 obligation. Plans in v9 use `B_text`, full stop.
- **A_Λ (Experience)**: Consulted BL-17 (Check-First = prevention — plans need a pre-draft Check-First gate too, but the items differ from code or articles: stakeholder list, scope boundary, prior-plan read), BL-11 (scope creep is Muda — plans are the ARTIFACT most vulnerable to scope creep because the draft IS the scope), BL-15 (2% spiral gap — every plan ships with some open questions, and the plan skin must make that EXPLICIT via a mandatory "Open Questions" section), BL-24 (one commit = one phase — maps directly to "one plan revision = one scoped objective"), BL-28 (agent prompt must include explicit context — the skin itself cannot be truncated in prompts), BL-29 (terminology before generating — plans must use established project terms, not invent new names for phases), BL-32 (grep after BL merge — if plan terminology changes, propagate across all sections). From live experience: the roadmap v9 report (`reports/roadmap_v9_2026-04-11.md`) was a plan artifact produced IN this v9 session; its Phase 0/1/2 structure, pass criteria, CORS lists, and dependency DAGs are empirical evidence of what a good plan looks like. That report is cited in Section 6 Example 1 as a SUCCESS CASE. Phase 2.1 Analyst spec established 22 universal BL inheritance + 8 code-adapter individual treatment + 4 BL-A namespace — this spec follows the same pattern (specific BL-P entries are plan-specific adaptations; see Section 7).

---

## Inverted IFR (past tense, measurable)

> "The `templates/domain_skin.plan.md` file was written by a single Builder in ~60 minutes using this spec. The file has a header block that pins `Type: plan`, `Modality: text`, `verify.method: dry_run`, a vocabulary table with ~20 mappings grounded in plan-authoring practice, per-role focus overrides for all 5 roles that reference their upstream role files rather than replacing them, a dry_run verification protocol expanded to 6 concrete sub-checks (DR1–DR6) split into reader-mechanical (walkthrough) and auditor-interpretive (contingency/criterion coverage) passes, 3 examples that each include the role catching the issue + phase + fix, a BL inheritance table preserving all 22 universal BL unchanged and providing plan-equivalents for 4 of 8 code-adapter BL (marking 2 as N/A and 2 as transfer-unchanged), 4 plan-specific BL-P1..P4, and an RT protocol that names RT-0 (Visionary solo for objective capture) + RT-1 (full team for decomposition) + RT-2 (full team for pre-commit dry_run + terminology unification). When a project's `config.md` declares `domain.type: plan` with `domain.skin: templates/domain_skin.plan.md`, META routes all 5 roles through the skin overrides. Backward compat: existing projects without a plan skin reference are untouched. How did we get there? This Analyst spec was concrete enough that every Builder decision was pre-made. No design calls surfaced during write."

## Acceptance Criteria

- **[AC-1]** Spec contains all 10 required sections (8 main + Hand-off + Open Questions) with no placeholder text
- **[AC-2]** Vocabulary mapping has ~20 term pairs grounded in plan-authoring practice (drawn from role files + the roadmap v9 report as the live reference plan artifact)
- **[AC-3]** Per-role focus overrides cover all 5 roles with: FIRST focus anchor, "artifact" definition, primary failure mode, Jidoka self-check specialization (3–5 questions each)
- **[AC-4]** Verification protocol enumerates at least 6 concrete dry_run sub-checks (DR1–DR6) with per-check: what it catches, who runs it, mechanism
- **[AC-5]** 3 examples each name the catching role, phase, and fix (matching Phase 2.1 example format)
- **[AC-6]** BL inheritance: all 22 universal BL listed with plan-specific applicability note; all 8 code-adapter BL handled individually (each either N/A or plan-equivalent or transfer unchanged); new plan-specific BL added in BL-P1..BL-P{N} namespace (separate budget)
- **[AC-7]** Spec is backward-compatible: existing projects without `domain.type: plan` are untouched; Universal CLAUDE.md routing works because `domain.skin` already points to the file path
- **[AC-8]** `B_modality: text` is PINNED (uniform 0.25×4 weights); `B_plan` override is explicitly DEFERRED to v10 with a one-line future-hook note
- **[AC-9]** Hand-off section names the exact file path, expected size (lines), template sections to copy from `templates/domain_skin.md.template`, and flags which spec items are FLEXIBLE vs FIXED for Builder discretion
- **[AC-10]** Open Questions section logs 3–5 deferred decisions (BL-15 compliance)

## Failure Pre-mortem

- **[FM-1]** Spec is too abstract → Builder has to invent vocabulary mid-write → Mitigation: every vocabulary term grounded in a role file or the live roadmap v9 report, with source cited in the "Where used" column.
- **[FM-2]** Spec duplicates Phase 2.1 article spec verbatim (BL-32 violation — same content under different label) → Mitigation: plan-specific focus is clearly separated — vocabulary emphasizes STEP/DEPENDENCY/STAKEHOLDER/CONTINGENCY rather than SECTION/CITATION/FORMULA; verification is `dry_run` not `cite_check`; modality is `text` not `research`.
- **[FM-3]** Builder confuses plan-with-text-modality (uniform weights) with article-with-research-modality (σ-dominant) → Mitigation: Section 3 explicitly pins the B weights with 1-sentence rationale; Section 1 has a "Modality choice" subsection that contrasts plan vs article explicitly.
- **[FM-4]** Dry_run is under-specified and reduces to "read the plan and see if it makes sense" (vibes-based verification, BL-17 violation) → Mitigation: Section 4 expands `dry_run` into 6 concrete sub-checks DR1–DR6 with per-check failure modes. Dry_run becomes MECHANICAL, not vibes.
- **[FM-5]** BL-P budget creep — the plan domain is "too broad" and BL-P1..P10+ feel justified → Mitigation: stick to 4 BL-P entries max, matching Phase 2.1 BL-A4 budget. If a plan-specific rule is a universal rule in disguise, escalate for promotion to the 22 universal BL via a future Phase 2 follow-up, do not bloat BL-P.
- **[FM-6]** The roadmap v9 report is RETROFITTED to match the spec — Example 1 feels staged rather than grounded → Mitigation: Example 1 cites specific line numbers from the roadmap v9 report where its Phase 0 pass criteria, dependency DAG, and pass-gates are visible; the spec treats the roadmap report as PRE-EXISTING evidence, not a target.

---

# SECTION 1 — Domain Identification

| Field | Value | Justification |
|---|---|---|
| `domain.type` | `plan` | Matches Phase 0.A schema enum; named in `eradev.md` line 168 v9 IN-SCOPE list ("plans and roadmaps") |
| `domain.B_modality` | **`text`** | Uniform 0.25×4 weights — see Section 1.1 rationale. `B_plan` is a DEFERRED v10 hook per `eradev.md` line 144. |
| `domain.ood_scope` | `text-discrete` | A plan artifact has measurable boundaries (file exists, step count, dependency count, named deadlines) and objective verification (can a reader execute it? yes/no). Passes v9 AND-gate per Phase 0.A Deliverable 3. REJECT if `continuous`. |
| `domain.verify.method` | `dry_run` | See Section 4 for what dry_run concretely entails. A plan passes dry_run iff a reader who did not participate in authoring can walk through step 1 → done without ambiguity, missing prerequisites, or dangling references. |
| `domain.parent_bl` | `BOOTSTRAP_LESSONS_universal.md` (22 universal BL) | Plans do NOT inherit `BOOTSTRAP_LESSONS_code_adapter.md`. Section 7 handles each code-adapter BL individually. |
| `domain.skin` | `templates/domain_skin.plan.md` | This spec's target file path. |

### 1.1 Modality choice: `text`, not `creative` or `research`

**Rationale:** Per `eradev.md` Section II.1 lines 115–119, the modality registry has three PINNED options plus the v8-compatible default:

- **`B_text`** (uniform 0.25×4) — default for any text-discrete artifact whose coherence is balanced across Focus / Alignment / Consistency / Experience. Code, configs, and PLANS fall here.
- **`B_creative`** (w_E=0.30, w_(1-σ)=0.30, w_F=0.20, w_Λ=0.20) — for long-form prose where reader-alignment and internal-voice consistency dominate. Books, some articles.
- **`B_research`** (w_F=0.30, w_E=0.20, w_(1-σ)=0.35, w_Λ=0.15) — for theorem/proof work where proof-chain consistency dominates. ODTOE-style articles.

**Why `text` for plans:**
1. **No single component dominates plan-authoring.** A good plan requires all four components in roughly equal measure:
   - **F (Focus):** the authors must have read the prior state and the enclosing context — e.g., the roadmap v9 report's Phase 0 decisions inform Phase 1, which informs Phase 2. No prior-state read = drift.
   - **E (Alignment):** the plan must solve the actual objective the operator set — not "a plan that reads well" but "a plan whose completion satisfies the original request."
   - **(1-σ) (Consistency):** phases must not contradict each other (same resource assigned to two parallel streams = conflict; two phases with dangling prerequisites on each other = deadlock).
   - **Λ (Experience):** prior plans' post-mortems (Hansei outputs) must inform this plan — BL-12 applied to plans.
2. **Plans are text artifacts, not theorem/proof work.** There is no proof chain to falsify. Inconsistency is bad but not formally fatal the way a broken proof chain is in `research`.
3. **Plans are NOT creative long-form prose.** Voice consistency and reader-alignment matter less than whether the plan is EXECUTABLE. A dry, terse plan that executes cleanly is better than a beautifully written plan that leaves steps ambiguous.

**Result:** the DEFAULT plan skin modality is **text** (uniform 0.25×4). This is PINNED in the skin file, NOT left as a placeholder.

**Variant clause (v10 future hook):** `eradev.md` line 144 names `B_plan` as a candidate modality with Λ-dominant weights, hypothesizing that ROADMAPS especially benefit from high Λ (prior roadmaps teach the current one). This is a v10+ research direction. v9 does NOT ship a `B_plan` modality — plans use `B_text`. If a project explicitly wants Λ-weighted plans, they can override per-project via `config.md` `## B-weight Override` section (see `projects/plugy/config.md` precedent). The SKIN does not override; projects override individually if needed.

### 1.2 Header block for the skin file

The Builder must produce a file starting exactly like this (copy from `templates/domain_skin.md.template` lines 1-7, filling placeholders):

```markdown
# Domain Skin: plan

> Type: plan
> Modality: text (uniform weights 0.25 / 0.25 / 0.25 / 0.25 — v8-compatible default)
> OOD scope: text-discrete
> Parent BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)
> Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md
> Verify method: `dry_run` (mental execution by a reader who did not author)
> Last updated: 2026-04-11
> Upstream roles: roles/{role}_EN.md
> Upstream math: eradev.md Section II.1 (B_text weights) + Section II.2 (v9 OOD scope)
> Live reference artifact: reports/roadmap_v9_2026-04-11.md (v9's own Phase 0/1/2 plan)

---
```

**FIXED (Builder must not alter):** `Type: plan`, `Modality: text (uniform weights 0.25 / 0.25 / 0.25 / 0.25 — v8-compatible default)`, the "does NOT inherit code_adapter" line, the `Verify method: dry_run` line.
**FLEXIBLE:** wording of the "Live reference artifact" line (Builder may name a different plan artifact if one proves more load-bearing), formatting of the `> ` block.

---

# SECTION 2 — Vocabulary Mapping

This is the fastest bridge from abstract role file to plan-domain action. The skin file must include a ~20-row vocabulary table. Every row below is GROUNDED: the "Where used (evidence)" column cites where the abstract term appears in a role file or in the live roadmap v9 plan artifact. Builder must preserve all rows; Builder MAY add 1-5 more rows if they find more plan-specific terms but must NOT delete any.

Unlike the `article` skin which REWRITES vocabulary wholesale (because articles use radically different artifact shapes than code), the `plan` skin performs a LIGHT rewrite. Plans share most abstract vocabulary with code-text modality — the differences are concentrated around EXECUTION-TIME (calendar vs runtime), ARTIFACT SHAPE (steps vs functions), and VERIFICATION (dry_run vs build).

| # | Abstract term (role file / BL) | Plan meaning | Where used (evidence) |
|---|---|---|---|
| 1 | **artifact** | a plan document (`.md`, `.txt`, `.pdf`) OR a phase block inside one, OR an individual step with its prerequisites and ownership | `analyst_EN.md` line 7 ("An 'artifact' is any discrete element..."); `builder_EN.md` line 7 |
| 2 | **function** | plan step — the smallest addressable action unit ("Run Phase 0.B tagging", "Merge BL split PR", "Stage on port 8431") | Analogous to `builder_EN.md` "smallest addressable unit"; see roadmap v9 lines 118-141 (Phase 0 as step list) |
| 3 | **module / file** | plan phase or section (e.g., "Phase 0 — Theoretical Closure", "Phase 1 — Vocabulary Refactor") | `roadmap_v9_2026-04-11.md` lines 116-193 (phases as top-level structure) |
| 4 | **test / tests pass** | dry_run — can a reader mentally execute the plan from step 1 to done without ambiguity? | `validator_EN.md` line 7 (validation = "run the checks"); Section 4 of this spec |
| 5 | **verify** | dry_run walkthrough — steps are self-contained, prerequisites are named, criteria are measurable | `analyst_EN.md` line 24 (verify = domain-substituted check); `roadmap_v9_2026-04-11.md` "Phase 0 PASS criteria" block lines 135-139 |
| 6 | **validate** | run all 6 dry_run sub-checks (DR1–DR6 in Section 4) | `validator_EN.md` Key Rules |
| 7 | **build / compile** | render the plan — produce a readable document (Markdown→HTML, Markdown→PDF, or just a clean Markdown file that parses without broken headers/tables) | Analogous to code-skin "compile = build" — plan's build is "document renders cleanly" |
| 8 | **runtime** | execution time / calendar time — how long the plan takes when a real team runs it end-to-end (days, weeks, person-hours) — NOT a live runtime check, but a blast-radius proxy | `builder_EN.md` Key Rules 4 ("blast radius"); `roadmap_v9_2026-04-11.md` line 336 ("Total v9 effort: 3-4 days") |
| 9 | **spec / specification** | the objective statement — a one-sentence-or-paragraph description of what the plan achieves when done. The plan's True North. | `analyst_EN.md` "Implementation Plan" output format; `roadmap_v9_2026-04-11.md` line 11 ("Executive Summary") |
| 10 | **API / API endpoint** | upstream dependency / handoff interface — another team, another phase, or an external person who must deliver X before this plan's step Y can start | `analyst_EN.md` Responsibilities 3 ("Interface design — design the contracts between components"); `roadmap_v9_2026-04-11.md` dependency DAG lines 310-335 |
| 11 | **bug / defect** | an unclear or unexecutable step — a step a reader cannot perform without asking the author, OR a step whose prerequisites are dangling, OR a step whose success criterion is subjective | `validator_EN.md` line 20 ("B-diagnostics of defects"); direct analog of "code doesn't compile" = "plan doesn't dry_run" |
| 12 | **refactor** | re-outline / re-scope the plan — restructure phases without changing the central objective | `builder_EN.md` Key Rules 7 (refactor = restructure without semantics change) |
| 13 | **code review** | stakeholder sign-off — a named owner (product, engineering, research, operations) confirms the plan's scope, resources, and timeline are acceptable from their perspective | Analogous to `visionary_EN.md` Example 2 (peer review); `roadmap_v9_2026-04-11.md` META resolution rows (D1–D5) |
| 14 | **PR / pull request** | a proposed plan revision submitted for RT review — a delta on a prior plan, or a fresh plan for a new objective | `builder_EN.md` Decision-Point Checklist |
| 15 | **commit** | a signed-off plan revision (author+date+version) — the current "active plan" of record for an objective | `roadmap_v9_2026-04-11.md` lines 1-9 (Author+Date+Sources header is a "commit" in plan idiom) |
| 16 | **deploy / push to prod** | announce the plan as active — hand it to the operator, post it in the team channel, pin it to the project root. The plan becomes binding. | Analogous to code-skin "deploy"; `roadmap_v9_2026-04-11.md` is itself pinned to `reports/` as the active v9 plan |
| 17 | **production** | the active plan of record — what the team is ACTUALLY doing, as opposed to draft proposals still in review | `validator_EN.md` Key Rules 4 (revert = postmortem) |
| 18 | **feature / feature flag** | an optional phase or step that may be included or skipped based on a downstream pass-criterion (e.g., Phase 2 is "conditional on Phase 1 success" per `roadmap_v9_2026-04-11.md` line 198) | Analogous to `builder_EN.md` Key Rules 6 ("feature flags / staged rollouts = release event") |
| 19 | **smoke test** | a quick 2-minute scan of the plan before the full dry_run — does it have all 6 required parts (objective, phases, dependency DAG, pass criteria, OOD, CORS)? A header-level completeness check. | Analogous to `validator_EN.md` Key Rules 5 ("stale output detection") |
| 20 | **glossary / canonical terms** | the project's established vocabulary — the plan must use these terms exactly, not invent new names for phases/gates/roles (BL-29 applied to plans) | `BOOTSTRAP_LESSONS_universal.md` BL-29 |
| 21 | **rollback / revert** | withdraw the plan — either because a new plan supersedes it or because the objective was dropped. Previous plans are archived with a "superseded by vX" note; they are not deleted. | Analogous to `builder_EN.md` Key Rules (rollback pattern); BL-P3 below |
| 22 | **canary / staged rollout** | pilot phase — run ONE sub-component of the plan end-to-end as a proof before committing the full plan to execution | Analogous to BL-2 (code); BL-P1 below |

**FLEXIBLE:** Builder MAY add rows 23-27 with additional mappings from other plan artifacts (procedures, SOPs, incident runbooks). Builder MUST NOT delete or renumber rows 1-22.

**Unified with the live reference plan artifact — CRITICAL note for Builder:**
The live reference plan artifact is `reports/roadmap_v9_2026-04-11.md` (v9's own roadmap). It contains the SAME structural elements that every plan skin compliant document should have: Executive Summary (objective), phased structure (Phase 0/1/2), pass criteria per phase, dependency DAG, OOD list (continuous/flow tasks deferred to v10), and a CORS (Convergent/Resolved/Sticky) list of open decisions. If Builder detects any contradiction between this spec's Section 3 (role focus overrides) and the vocabulary table above, the SPEC table WINS and Builder must escalate to META before proceeding. If Builder detects a contradiction between the spec and the live reference plan artifact, Builder must flag it as an open question in the skin's Spiral Gap section — not silently resolve it.

---

# SECTION 3 — Per-Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` **unchanged**. The skin adds DOMAIN-SPECIFIC focus anchors, artifact definitions, failure modes, and Jidoka specializations for plan-authoring. The Builder must produce a sub-section for each of the 5 roles.

### 3.1 Visionary (plan focus)

- **FIRST focus anchor (A_F override):** Read the operator's ORIGINAL request verbatim (not paraphrased). Read any existing plan for the same or adjacent objective (supersession check — see BL-P3 below). True North = *what does "done" mean for this objective, stated in the past tense as a measurable outcome?* Visionary's output is a single paragraph: the central objective + what is explicitly OUT OF SCOPE.
- **What the role considers "the artifact":** The central objective + its boundary. NOT the phases, NOT the steps, NOT the dependency DAG — those are Analyst's artifact. At RT-0 the Visionary speaks at the level of "this plan achieves X by date Y and explicitly does NOT achieve Z, W, V."
- **Primary failure mode in plan work:** Approving a plan whose objective is vague or whose "done" state is subjective ("make it better", "improve throughput", "clean up the mess"). This is a BL-17 violation applied to plans: pre-generation verification should have caught the objective ambiguity before Analyst decomposed it. Mitigation: Visionary's output MUST include a measurable "done" state, or the plan does not proceed to RT-1.
- **Jidoka self-check (plan specialization):**
  - Q1: "Is the 'done' state MEASURABLE (numeric threshold, named artifact exists, named stakeholder sign-off achieved)? If no — YELLOW on E, escalate before RT-1."
  - Q2: "Is the scope explicitly BOUNDED (what is OUT of scope)? An unbounded plan is a Muda generator (BL-11)."
  - Q3: "Does this plan SUPERSEDE an existing plan for the same objective? If yes, is the supersession acknowledged in writing (BL-P3 below)?"
  - Q4: "Is the objective falsifiable in a discrete way (plans are text-discrete per `eradev.md` Section II.2), or is it a continuous/subjective goal (OOD — escalate to Visionary RT-0 kill-switch)?"
- **Section reference for Builder:** `visionary_EN.md` establishes "True North" in code terms; the skin adds the *measurable-done + bounded-scope + supersession-check* triad which is NOT in the base role file.

### 3.2 Analyst (plan focus)

- **FIRST focus anchor (A_F override):** Read Visionary's objective statement. Read any prior plans for the same or adjacent objective (BL-29 applied to plans: re-use the established phase names, step vocabulary, and pass-criterion format). Read the enclosing plan (if this plan is a sub-plan) to understand upstream prerequisites. THEN draft the phase decomposition. Analyst's primary artifact is the dependency DAG + the phase-by-phase step list + the resource allocation.
- **What the role considers "the artifact":** A structured plan document with EXACTLY these required parts:
  1. **Objective block** (copied verbatim from Visionary's RT-0 output)
  2. **Scope bounds** (in/out)
  3. **Phases** with named durations (calendar time), named owners, named deliverables
  4. **Dependency DAG** (which phase/step blocks which)
  5. **Pass criteria per phase** (measurable gates)
  6. **Resource allocation** (who does what, what tools are needed)
  7. **Contingencies** (what to do if phase N fails)
  8. **Known Out-of-Scope** (OOD patterns for this plan class)
  9. **Open Questions / CORS** (per BL-15 2% spiral gap)
  The Analyst output is a DOCUMENT, not a bullet list. At RT-1 the Analyst hands a complete draft to Builder for wording polish + completeness gaps.
- **Primary failure mode in plan work:** Building a "perfect looking" outline with gaps — phases named but step lists missing, dependencies not stated explicitly, pass criteria reduced to vibes ("when it feels done"). This is the default plan failure mode. Mitigation: Analyst's Jidoka scores A_E=0.0 (Andon) if any of the 9 required parts above is missing.
- **Second failure mode:** Dangling prerequisite — a phase says "use the output of phase N-2" but no earlier phase produces that output, OR the prerequisite comes from an external team and no handoff interface is named. Mitigation: before RT-1 closes, Analyst runs DR2 (prerequisite check — see Section 4) on their own draft.
- **Jidoka self-check (plan specialization):**
  - Q1: "Does the plan have all 9 required parts above? If any is missing → A_E=0.0 → Andon."
  - Q2: "For each phase, is the owner named (not 'the team', but an actual role or person)?"
  - Q3: "For each phase's inputs, does a prior phase produce that input, OR is it declared as an external input with a named source?"
  - Q4: "For each phase, is the success criterion MEASURABLE (numeric or binary), not subjective ('when it feels good')?"
  - Q5: "Are the phase durations additive and realistic — do they sum to the plan's stated total duration?"
- **Deliverable template (plan-specific):**
  ```
  ## Plan Draft (Analyst output for plans)
  Title: [plan name]
  Objective: [verbatim from Visionary RT-0]
  Scope in: [...]  | Scope out: [...]
  Phases:
    Phase A [name]:
      Owner: [role or person]
      Duration: [days / hours / weeks]
      Inputs: [upstream artifacts + external deps]
      Steps: [numbered list of actions]
      Deliverables: [named artifacts produced]
      Pass criteria: [measurable]
      Contingency: [if this phase fails, what next?]
    Phase B [name]: ...
    Phase C [name]: ...
  Dependency DAG: [A → B, A → C, B+C → D, etc.]
  Total duration: [sum of critical path]
  Resource allocation: [who does what, what tools, what budget]
  Known OOD: [what NOT to do inside this plan]
  Open Questions: [BL-15 — what's genuinely unresolved]
  B-check: F=_ E=_ (1-σ)=_ Λ=_ → B=_
  ```

### 3.3 Builder (plan focus)

- **FIRST focus anchor (A_F override):** Read the Analyst draft verbatim. Read the live reference plan artifact (`reports/roadmap_v9_2026-04-11.md` by default, or another named plan if the project has one) as the format gold standard. Read the project's established terminology — phase names, role names, gate names — and use them exactly (BL-29 applied to plans). Do NOT start polishing prose until all three reads are complete.
- **What the role considers "the artifact":** The single plan document file (`.md` typically, sometimes `.pdf` for formal submissions). The artifact is NOT a set of bullet points in a chat thread — it is a SAVED FILE with a canonical path and version field in its header. Builder must NOT mark Done until the file exists at a canonical path and parses cleanly as Markdown.
- **Primary failure mode in plan work:** Polishing prose before the structure is settled. Builder rewrites step 3 for readability, then Analyst's RT-1.5 review finds step 3 had a dangling prerequisite, and the "polished" version must be rewritten. Mitigation: Builder's Activation Operator requires reading the Analyst draft in full BEFORE any prose polish, and confirming the dependency DAG is stable before polishing individual steps.
- **Second failure mode:** Expanding scope during polish — "while drafting phase 2, I noticed phase 1 could also include X" — this is BL-11 violation applied to plans. The additional scope belongs in a DIFFERENT plan. Mitigation: Builder's Jidoka Q3 below explicitly asks "did I add anything the Analyst draft did not have?"
- **Third failure mode (plan-specific, not in base role file):** Anonymous owners — "the team will do this", "we will check that". Every step MUST name an owner (role, person, or external party). Mitigation: Builder's Jidoka Q4 greps the draft for anonymous-owner patterns ("we", "the team", "someone", "TBD").
- **Jidoka self-check (plan specialization):**
  - Q1: "Have I read the Analyst draft in full? (F)"
  - Q2: "Have I read the live reference plan artifact (or the named reference plan) for format alignment? (F)"
  - Q3: "Does my polished plan match the Analyst draft's structure, or have I silently added scope? (E — BL-11)"
  - Q4: "Are all owners named (no 'we', no 'the team', no TBD)? (1-σ)"
  - Q5: "Does the plan use the project's established phase/gate/role terminology exactly? (Λ — BL-29)"
  - Q6: "Does the plan render cleanly as Markdown (no broken tables, no unclosed code blocks, no dangling section markers)? (F)"

### 3.4 Validator (plan focus)

- **FIRST focus anchor (A_F override):** Read the Analyst plan + the Builder's polished plan file. Then run the 6 dry_run sub-checks from Section 4 (DR1–DR6). Validator does NOT skip any of the 6 checks — each one catches a specific failure mode, and dry_run in aggregate is the gate.
- **What the role considers "the artifact":** The polished plan file IN ITS FINAL FORM — the same thing an execution team would read the morning they kick off the plan. Validator simulates the execution team at the highest-stakes moment: day 1 of Phase 0.
- **Primary failure mode in plan work:** Running DR1 (step walkthrough) alone and declaring PASS while the plan has un-measurable success criteria OR missing contingencies. DR1 catches mechanical executability gaps; it does NOT catch criterion measurability or contingency coverage. Validator MUST run ALL 6 DR checks. This is the distinction between `verify.method: dry_run` (the PRIMARY label) and the FULL validation gate (all 6 DR sub-checks). BL-17 + the 6-check structure together prevent this failure.
- **Secondary failure mode (plan-specific):** Trusting the Builder's prose. A phase tagged "completes in 2 days" might be optimistic guesswork with no basis in prior data. Validator must audit duration estimates against prior plans' actuals (BL-18 applied to plans — if a phase runs 2x estimate, reclassify).
- **Jidoka self-check (plan specialization):**
  - Q1: "Have I run all 6 DR checks, not just DR1 (walkthrough)?"
  - Q2: "For each phase's pass criterion, is it MEASURABLE (numeric, binary, or named-artifact-exists) or subjective?"
  - Q3: "For each phase, is there a contingency? What happens if phase N fails?"
  - Q4: "Are the phase durations GROUNDED in prior data (other plans' actuals) or guesstimates?"
  - Q5: "Do the phase durations sum to the plan's stated total duration? (internal consistency check)"
  - Q6: "If I were on the execution team day 1, could I start phase 0 step 1 without asking the author a question? If I have to ask even one question → FAIL DR1."

### 3.5 Coherencer (plan focus)

- **FIRST focus anchor (A_F override):** Read the full plan end-to-end, twice — once top-down (objective → phases → steps) and once bottom-up (steps → phases → objective). Read the project's lessons.md for any rules this plan must honor (BL-29 glossary). Coherencer cares about *the plan's internal consistency AND its fit with the project's prior plans*, not just the plan in isolation.
- **What the role considers "the artifact":** The plan + (all prior plans for the same or adjacent objective) = plan series. Coherencer checks that the CURRENT plan does not contradict or duplicate prior plans, and that the current plan's phase terminology matches the project glossary.
- **Primary failure mode in plan work:** "Terminology drift across sections" — early phases call something a "sprint", later phases call it an "iteration", or the pass-criterion for Phase 0 uses "GREEN/YELLOW/RED" labels while Phase 1 uses "PASS/FAIL/WARN". These are ALL (1-σ) failures at the plan level. Mitigation: Coherencer runs a glossary scan across ALL phase sections + builds a mini-glossary of the terms the plan actually uses + flags divergence.
- **Secondary failure mode (plan-specific):** Phantom coherence — every phase's pass criterion "looks rigorous" but they all defer to the SAME underlying subjective judgment ("when it feels done"). The plan appears verifiable because each phase has a criterion, but the criteria collapse into one vague vibe. Mitigation: Coherencer asks "if I replace every phase's pass criterion with ITSELF (independent of every other phase's criterion), does the plan still work?"
- **Jidoka self-check (plan specialization):**
  - Q1: "Does the plan use every technical term consistently across phases, or does it drift (sprint vs iteration vs cycle)? (1-σ, BL-29)"
  - Q2: "Do the phase durations ADD UP to the plan's total duration, end-to-end? (basic arithmetic consistency)"
  - Q3: "Are pass criteria ACTUALLY independent across phases, or do they all collapse to one vibe? (phantom coherence check, BL-5 applied to plans)"
  - Q4: "Does this plan contradict or duplicate a prior plan for the same objective? If yes, is the supersession acknowledged (BL-P3)?"
  - Q5: "Independent spot-check: pick 3 steps at random — does each step name an owner, have prerequisites met by prior steps, and produce a named deliverable? If any fails, flag."
- **Supersession rule (BL-P3, see Section 7):** Coherencer is the ENFORCER of the supersession protocol. Commit is BLOCKED if a prior plan for the same objective is not archived with a "superseded by vX" marker.

---

# SECTION 4 — Verification Protocol (dry_run expanded)

The skin file's verification section maps directly to `domain.verify.method: dry_run`. The skin must expand `dry_run` into 6 concrete sub-checks (DR1–DR6), split across roles and into mechanical (automated or near-automated) versus interpretive (requires a human/agent reader making judgment calls).

### 4.1 The six dry_run checks

| # | Check | What it catches | Who runs it | Mechanism |
|---|---|---|---|---|
| **DR1** | **Step-by-step walkthrough** — mentally execute each step in sequence; each step must be self-contained and executable by a reader who did not author the plan | Unclear/unexecutable steps; steps that assume tribal knowledge | Validator | Near-mechanical — reader runs the sequence top-to-bottom, flagging any step they cannot perform without asking the author |
| **DR2** | **Prerequisite check** — every step's inputs are either (a) produced by a prior step in the plan, or (b) declared as an external input with a named source | Dangling prerequisites; phantom inputs; "magic" steps that assume something the plan never produced | Validator | Mechanical — build the step-input graph, find any node with an unsatisfied input |
| **DR3** | **Resource completeness** — every actor (role, person, team), tool (software, hardware, credential), budget (money, person-hours, compute), and deadline is named | Anonymous owners, missing tools, un-budgeted work, un-dated deadlines | Validator | Mechanical — grep for anonymous-owner patterns ("we", "the team", "TBD", "someone") + scan for un-dated phases + scan for un-budgeted tools |
| **DR4** | **Contingency presence** — for each phase, what happens if that phase fails? (rollback / escalate / cut scope / extend deadline) | Plans that only cover the happy path; plans with no failure mode thinking; plans that assume everything will succeed | Validator | Interpretive — requires reading each phase's contingency section and asking "is the contingency realistic, or is it 'try harder'?" |
| **DR5** | **Success criterion measurability** — every phase's "done" state is quantifiable (numeric threshold, binary gate, named-artifact-exists), not subjective | Plans with vibes-based success criteria ("when it feels done", "good enough", "clean") | Validator | Near-mechanical — scan each pass-criterion block for numeric / binary / named-artifact keywords; flag any criterion that lacks them |
| **DR6** | **Handoff clarity** — each phase transition has an explicit ownership change OR an explicit "same owner continues" note | Implicit handoffs ("the team will take it from there"); unclear who owns the transition | Coherencer | Interpretive — scan each phase boundary and ask "who owns the next step, and did the prior phase produce what that owner needs?" |

### 4.2 L1 (mechanical) vs L2 (interpretive) split

Like the article skin's cite_check, dry_run splits into two verification strata:

- **L1 (mechanical, per-commit):** DR1, DR2, DR3, DR5 — all four can be reduced to structured scans with some human judgment at the margins. These should run on every plan revision commit.
- **L2 (interpretive, pre-activation):** DR4, DR6 — require a thoughtful reader who asks "is this realistic?" These run once before the plan is DECLARED ACTIVE (the plan-domain analog of "pre-submission" in the article domain).

### 4.3 Relationship to the code-skin `build` verification

The code skin's `verify.method: build` checks "does the code compile + test + lint?" The plan skin's `verify.method: dry_run` is a direct analog: "does the plan compile (render as clean Markdown) + test (walk through steps) + lint (terminology consistency + measurable criteria)?"

| Code skin check | Plan skin analog |
|---|---|
| `compile` (does the source typecheck?) | DR1 + DR2 (does the step sequence make sense without gaps?) |
| `test` (do the unit tests pass?) | DR3 + DR5 (are resources named and criteria measurable?) |
| `lint` (are there style violations?) | DR6 + BL-29 glossary scan (is terminology consistent?) |
| `integration tests` (do the modules cooperate?) | DR4 (do phases cooperate at handoff boundaries, including failure modes?) |

The analogy is PEDAGOGICAL — a Builder coming from code should think of dry_run as "compile-and-test for plans".

### 4.4 Block for the skin file (under "Verification Protocol")

The Builder must produce a block matching this structure:

```
[method name]: dry_run
[command]: N/A for automated dry_run alone; a plan is dry_run by a reader
          (human or LLM agent) who did not author it. Mechanical aids:
          - Markdown lint: `markdownlint plan.md` (renders cleanly)
          - Resource grep: `grep -nE "\b(we|the team|someone|TBD|n/a)\b" plan.md`
            → zero hits = PASS on anonymous-owner scan
          - Duration sum check (manual): add up each phase's stated duration,
            compare to plan total
          - Cross-phase term consistency (BL-29): extract all capitalized
            phase/gate/role names, confirm no synonyms ("sprint" ≠ "iteration")
[success criteria]: all 6 DR checks PASS (DR1–DR6 in Section 4.1 of this skin)
                    AND the plan file renders cleanly as Markdown AND
                    all 9 required parts of the Analyst deliverable template
                    (Section 3.2) are present AND supersession check (BL-P3)
                    confirms no prior-plan conflict
[failure recovery]: specific per check —
                    DR1 fail → identify unclear step(s), rewrite with
                               explicit sub-actions
                    DR2 fail → either add a prior step that produces the
                               missing input, or declare the input as external
                               with a named source
                    DR3 fail → name the owner(s), tool(s), budget(s), deadline(s)
                    DR4 fail → add a contingency paragraph per phase
                    DR5 fail → replace subjective criterion with
                               numeric/binary/named-artifact criterion
                    DR6 fail → add an explicit owner-change note at
                               each phase boundary
[independence check]: Validator runs dry_run WITHOUT having been in the
                      authoring conversation. If Validator had to participate
                      in drafting the plan, Validator is not independent —
                      escalate to a second Validator who did not participate.
                      This is the plan analog of "run tests on a clean
                      checkout, not on Builder's workspace."
                      Phantom coherence detection (BL-5) applied to plans:
                      if Builder and Validator BOTH read the plan and
                      everyone says PASS but neither actually walked through
                      step 1 → step N in sequence, flag PHANTOM DRY_RUN.
```

---

# SECTION 5 — RT Phase Protocol Adjustments

Code projects use the canonical phase protocol from `eradev.md` Section VI:
Visionary (direction) → Analyst (design) → Builder (implement) → Validator (test) → Coherencer (integrate)

Plans need adjustments because the work profile is different (no build/test feedback loop; the "artifact" is the plan document itself; dry_run requires a second-reader pass). The skin file must specify:

### 5.1 When is the RT run?

**Three RT invocation points for plans:**

1. **RT-0 (Visionary solo, RECOMMENDED): objective capture + OOD check.** Before any RT-1. Runs when the operator proposes a new objective or when an existing plan needs replacement. Visionary alone evaluates: is the objective measurable, bounded, falsifiable in a discrete way (not continuous/subjective), and does it supersede any existing plan? A YES from Visionary unlocks RT-1.
2. **RT-1 (mandatory, full 5-role): decomposition + validation.** Produces the Analyst deliverable template from Section 3.2 (9 required parts) + Builder's polished plan file + Validator's first DR1-DR5 pass + Coherencer's terminology check. Builder does NOT release the plan until RT-1 approves.
3. **RT-2 (mandatory, pre-activation): full dry_run + terminology unification.** Before the plan is declared ACTIVE (handed to the execution team, pinned as the project's active plan of record). Runs all 6 DR checks + BL-29 glossary scan + supersession check (BL-P3).

**No RT between RT-1 and RT-2 for single-phase plans.** For multi-phase plans (>3 phases), an intermediate RT-1.5 may be run after each phase is drafted, but this is OPTIONAL. Exception: for XL plans (>10 phases or total duration >2 weeks), RT-1.5 is MANDATORY after each major phase group.

### 5.2 "Builder for a plan" — single or split?

**Decision: single Builder, unless the plan is XL.**

The plan Builder is a SINGLE agent for S/M/L plans. Within that single Builder session, the rhythm is:
- Read Analyst draft
- Read live reference plan artifact for format alignment
- Polish section by section (objective → scope → phases → dependency DAG → pass criteria → contingencies → OOD → open questions)
- Internal self-check: render Markdown, grep for anonymous owners, sum durations
- Commit

This is a LINEAR polish pass, not an iterative loop. One Builder agent, one session.

**Exception (XL only):** For an XL plan (>10 phases OR >2 weeks duration OR >3 named owners across phases), the Analyst may split work across *two Builders* by phase ownership (Builder A polishes phases 0-3, Builder B polishes phases 4-7). File Ownership rule from `analyst_EN.md` Responsibilities 4 applies. Coherencer gate is MANDATORY between Builder completion and Validator RT-2.

**Rationale for NOT splitting outliner + polisher:** Like the article skin's rationale, outline + polish live in the same mental model of the plan. Splitting them would cause the polisher to lose the context that the outliner had — increasing |B_outliner − B_polisher| and decreasing S_team. Keeping them unified is consistent with the v9 principle that *role is a focus, not a specialization*.

### 5.3 Pre-RT "Visionary solo" phase?

**Yes — RT-0 (Visionary solo) is RECOMMENDED for plans, nearly mandatory for plans that supersede a prior plan.**

Plans need a pre-RT Visionary pass because:
- The central objective must be stable before Analyst decomposes it into phases. A wobbling objective wastes Analyst effort.
- Supersession risk is real — many projects have 2–3 active plans for overlapping objectives. Approving a new plan without running the supersession check is BL-P3 violation.
- OOD check — the operator might propose "a plan for improving team morale" or "a plan for making the product more delightful" — both are continuous/subjective, not text-discrete. Visionary is the role that catches this at RT-0.

**RT-0 output:** A single-paragraph decision:
- "APPROVED: objective is measurable as [numeric / binary / named-artifact-exists]; no prior plan covers this objective; scope bounds are [in: ... | out: ...]; proceed to RT-1."
- OR "REJECTED: objective is ambiguous / continuous / duplicates existing plan vX; propose a refined version."
- OR "SUPERSEDES: replaces plan vX-1 (dated YYYY-MM-DD); archive vX-1 with 'superseded by vX' marker per BL-P3."
- OR "OUT-OF-SCOPE: objective is continuous/subjective, no discrete verification possible; defer to v10 or reject."

### 5.4 Pipeline block for the skin file

```
Plan pipeline (FIXED):
RT-0 (Visionary solo, RECOMMENDED) → objective capture + OOD + supersession check
RT-1 (full 5-role) → 9-part Analyst draft + Builder polish + Validator DR1–DR5 + Coherencer glossary
    [optional RT-1.5 after each major phase group for XL plans]
Coherencer gate (after Builder polish completes)
RT-2 (full 5-role) → 6 DR checks + BL-29 glossary scan + BL-P3 supersession check
Commit plan file + archive any superseded prior plan with "superseded by vX" note
Plan becomes ACTIVE → handed to execution team → outside RT scope (execution-time work)
```

---

# SECTION 6 — Examples (3 concrete)

The skin file must include 3 examples matching the template at `templates/domain_skin.md.template` lines 88-99 but expanded to include catching role + phase + fix per this spec. Below are the exact 3 examples Builder must include (Builder MAY polish prose for readability; Builder MUST preserve the structural elements — catching role, phase, fix — verbatim).

### 6.1 Example 1: Dangling prerequisite (DR2 failure)

- **Input:** "Draft a plan to migrate the backend from Postgres to Cockroach. Include schema migration, data replication, and cutover."
- **Scenario:** Analyst drafts a 5-phase plan. Phase 0: audit Postgres schema. Phase 1: set up Cockroach cluster. Phase 2: dual-write from app to both DBs. Phase 3: backfill historical data. Phase 4: cutover and retire Postgres. Builder polishes the draft and declares Done. Plan looks complete.
- **What Validator finds:** Running DR2 (prerequisite check), Validator finds that Phase 4 (cutover) says "deploy the new config that routes reads to Cockroach" — but no earlier phase produces that config. Phase 2 produces dual-write, not a config change for reads. Phase 3 produces backfilled data, not a config. The "new config" is a dangling prerequisite. Running the plan as written, on day 1 of Phase 4, the execution team would ask "wait, where is the config?" and stall.
- **Catching role:** **Validator** (DR2 is the load-bearing check here; Analyst's Jidoka Q3 should also have caught it but didn't).
- **Phase:** **RT-1** (Validator's dry_run pass happens at RT-1, not RT-2 — dry_run is the PRIMARY gate, not a deferred one).
- **Fix:** Add a new Phase 3.5 (or insert a step into Phase 3): "produce the read-routing config + review it + stage it behind a feature flag." The feature flag is flipped in Phase 4 as the actual cutover step. Alternatively, declare the config as an external input produced by the infra team, with an explicit handoff interface and a named owner on the infra side.
- **Why DR1 alone would miss this:** DR1 (step walkthrough) checks each step in isolation. Phase 4 step 1 ("deploy the new config") is a well-formed step IN ISOLATION — it has a clear action. Only DR2's graph analysis catches that no prior phase produces the config. This is why dry_run must expand into multiple sub-checks, not reduce to "walk the steps."

### 6.2 Example 2: Unmeasurable success criterion (DR5 failure)

- **Input:** "Draft a plan for Q2 to improve onboarding."
- **Scenario:** Visionary approves the objective: "improve onboarding." Analyst decomposes into 4 phases: (P0) audit current onboarding, (P1) design new flow, (P2) implement, (P3) roll out. Each phase has a pass criterion. P0: "audit is done when we've interviewed the team." P1: "design is done when the wireframes feel clean." P2: "implementation is done when the code feels good." P3: "rollout is done when users are happy." Builder polishes. Plan passes Markdown lint. Validator runs DR1 and the walkthrough is mechanically fine.
- **What Validator finds:** Running DR5 (success criterion measurability), Validator flags every single phase's pass criterion as SUBJECTIVE:
  - "we've interviewed the team" — how many people? which team? no number.
  - "wireframes feel clean" — by whose judgment?
  - "code feels good" — lint is green? tests pass? coverage threshold?
  - "users are happy" — NPS threshold? satisfaction score? reduction in support tickets?
  DR5 FAILS with 4/4 unmeasurable criteria. The plan is "verified" by DR1 but it is actually a vibes plan — on day 1 of execution, the team cannot know whether Phase 0 is done or not.
- **Catching role:** **Validator** (DR5 is the load-bearing check here).
- **Phase:** **RT-2** (pre-activation — DR5 is L2 interpretive; runs at RT-2). But Analyst's Jidoka Q4 should have caught it at RT-1; the fact that it didn't is a process defect worth Hansei.
- **Fix:** Rewrite each pass criterion to be measurable. P0: "audit is done when we have interviewed ≥5 users from each cohort (new, expert, failed-signup) and documented findings in /docs/onboarding_audit.md." P1: "design is done when wireframes are reviewed by design lead + 2 engineers + PM, all sign off in writing." P2: "implementation is done when new flow passes E2E suite, feature flag ready, behind-flag rollout tested on staging." P3: "rollout is done when 95% of new signups in a 2-week window use the new flow without falling back, measured by funnel analytics." Visionary reviews the rewritten criteria and re-approves.
- **Why DR1 alone would miss this:** DR1 is a mechanical walkthrough — "can I execute step 1?" — and each phase's steps ARE individually executable. The gap is in the PASS CRITERIA, not the steps. DR5 is designed to catch exactly this kind of plan-shaped vibe that walks but does not verify. This is also a BL-17 violation applied to plans — pre-generation verification should have caught the ambiguity at the objective-statement level.

### 6.3 Example 3: Terminology drift across phases (Coherencer σ failure)

- **Input:** "Draft a plan for the 2026 Q2 release cycle, including sprint planning, iteration reviews, retrospectives, and ship date."
- **Scenario:** Analyst drafts a 6-week plan. Phases 0-2 use "sprint" consistently: "Sprint 1 planning", "Sprint 1 review", "Sprint 1 retro." Phases 3-5 drift to "iteration": "Iteration 4 planning", "Iteration 4 review", "Iteration 4 retro." Phase 6 (final ship) mixes both: "Final sprint iteration review." Builder polishes. Validator runs DR1 through DR5 and everything looks mechanical: steps execute, prerequisites are met, criteria are measurable. PASS.
- **What Coherencer finds:** Running the BL-29 glossary scan + DR6 (handoff clarity), Coherencer builds a mini-glossary of term uses: "sprint" appears 14 times, "iteration" appears 11 times, "sprint iteration" appears once. The project's lessons.md glossary says "sprint" is the canonical term. Phases 3-5 have drifted. Phase 6 is a hybrid. The plan is internally self-consistent in that each phase works IN ISOLATION, but the team reading phase 3 will interpret "iteration" as a DIFFERENT thing than a "sprint" (they are trained to think sprint = 2-week unit, iteration = a single dev cycle within a sprint). Silent contradiction.
- **Catching role:** **Coherencer** (canonical σ failure — divergent meanings of the same concept across phases; BL-29 applied to plans).
- **Phase:** **RT-2** (final glossary scan is a Coherencer RT-2 activity). Could also be caught at RT-1.5 if the plan is XL.
- **Fix:** Coherencer invokes Phantom Coherence Check (`coherent_EN.md` Key Rules 2) and runs a grep-based unification: replace "iteration" with "sprint" throughout phases 3-5, resolve phase 6 to "Final sprint review" (drop the hybrid), and log a mini-glossary block in the plan's header ("This plan uses 'sprint' = 2-week unit throughout; no other term is used"). Builder re-polishes the affected phases. Validator re-runs DR6 on the affected phase boundaries. Plan re-enters RT-2 gate.
- **How the skin's vocabulary maps this:** "sprint" vs "iteration" = a SYMBOL COLLISION (vocabulary row 20 + BL-29). Coherencer's Q1 ("Does the plan use every technical term consistently across phases?") catches this directly. This is the plan-skin analog of the article-skin `\Lambda` symbol collision from `analyst_EN.md` Ex.2 — a single concept with two labels silently contradicting itself.

---

# SECTION 7 — BL Inheritance and Overrides

The plan skin inherits all 22 universal BL unchanged and handles each of the 8 code-adapter BL individually. New plan-specific BL are added in a separate `BL-P` namespace that does NOT count against the main 30-BL budget.

### 7.1 Universal BL (22 entries — all inherited unchanged, 1-line applicability note each)

| BL | Title | Applicability to plan work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Applies unchanged — a fresh plan-domain project starts with Λ=0.5; accumulates as prior plans land in the archive |
| BL-4 | S_adjusted = S_team × B_mean | Applies unchanged — Coherencer at RT-2 computes S_adjusted from the 5 role B scores |
| BL-5 | Phantom Coherence Detection | Applies unchanged — plan-specific manifestation is "every phase has a pass criterion but all 4 criteria collapse to 'when it feels done'" (see Coherencer primary failure) |
| BL-7 | EN for Practical Tasks, RU for Theoretical Depth | Applies unchanged — plan drafting is practical (EN role files); high-level strategy and vision work is theoretical (RU role files may be used for objective derivation) |
| BL-9 | Interface Contracts Between Roles | Applies unchanged — Analyst→Builder contract is the 9-part draft template; Builder→Validator contract is the polished plan file with all 9 parts filled |
| BL-10 | Multiplicative B Structure | Applies unchanged — weights are `text` profile (F=0.25, E=0.25, (1-σ)=0.25, Λ=0.25) per Section 1.1 |
| BL-11 | Scope Creep is Muda | **Critical for plans** — plans are the ARTIFACT most vulnerable to scope creep; "while polishing phase 2, I noticed phase 1 also needs fixing" = SEPARATE plan revision, not a silent addition |
| BL-12 | Hansei Targets Process, Not People | Applies unchanged — post-plan-execution reflection is about why the plan had a gap, not who polished it |
| BL-13 | Yokoten — One Lesson, All Analogous Cases | Applies unchanged — if a dry_run catches a dangling prerequisite in one plan, grep the plan archive for the same pattern in other plans |
| BL-15 | 2% Spiral Gap | **Critical for plans** — every plan ships with some open questions; the plan skin makes this EXPLICIT via a mandatory "Open Questions" section in the Analyst draft template (Section 3.2 part 9) |
| BL-16 | Reading the Framework ≠ Applying It | Applies unchanged — META must still delegate plan work to agents, not draft plans directly |
| BL-17 | Pre-Generate Verification = Prevention | **Critical for plans** — Check-First pipeline for plans = "read the objective + read prior plans + read project glossary BEFORE drafting phases" |
| BL-18 | Scope Reclassification at 2× Estimate | **Critical for plans** — if a plan's phase runs 2x its estimated duration, reclassify the plan (maybe S→L, maybe the whole objective needs re-scoping) |
| BL-19 | Bilingual Files Simultaneous | Applies (limited) — if the project has RU and EN stakeholders, the plan must exist in both languages; otherwise EN-only is fine. Plans are NOT as bilingual-heavy as articles (which have 8-file sets), but BL-19 still applies when both language communities need the plan |
| BL-20 | Adversarially Test Bootstrap | Applies unchanged — test the plan skin file itself against a trial plan (e.g., "plan for Q2 docs refresh") before deployment |
| BL-21 | Format Specifications Are Inputs | **Critical for plans** — the live reference plan artifact format must be read BEFORE drafting a new plan; do not invent a new plan format per project |
| BL-26 | META Always Delegates | Applies unchanged — META never drafts plan prose directly |
| BL-28 | Agent Prompt Must Include Explicit Context | Applies unchanged — plan-task agent prompts must name the skin file path AND role file path |
| BL-29 | Verify Established Terminology Before Generating | **Critical for plans** — plans MUST use the project's established phase / gate / role terminology; drift (sprint vs iteration in Example 3) is the canonical Coherencer σ failure |
| BL-30 | Defense-In-Depth | Applies unchanged — plan validation has layers: Builder Jidoka + Coherencer glossary scan + Validator 6 DR checks |
| BL-31 | Constrain Output Types | Applies unchanged — Builder's output is the polished plan file, not prose explanations about the plan |
| BL-32 | Grep After BL Merge | Applies unchanged — if plan terminology changes (e.g., "sprint" → "cycle"), grep the plan archive for orphan references |

### 7.2 Code-adapter BL (8 entries — treated individually)

| BL | Title | Verdict for plans | Plan equivalent (if not N/A) |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | **Plan equivalent: BL-P1** | Major plan activation (replacing an existing plan, declaring Phase 2 go-live) is a release event requiring a pilot phase. See BL-P1 below. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Applies unchanged** | Plan equivalent is "3+ consecutive revisions of the same phase = STOP, re-scope the objective." No new BL-P needed; BL-3 transfers cleanly. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | **Plan equivalent: BL-P2** | Before committing a plan revision, Builder must render the Markdown AND run DR1/DR2/DR3/DR5 (mechanical dry_run checks) AND BL-29 glossary scan. See BL-P2 below. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **N/A for plans** | Plans do not have feature flags. Phases can be "conditional on prior phase success" (e.g., roadmap v9 Phase 2 is conditional on Phase 1) but this is a pass-criterion gate, not a flag toggle. |
| **BL-14** | Rollback Plan Before Deploy | **Plan equivalent: BL-P3** | Before declaring a plan ACTIVE (especially one that supersedes a prior plan), author must document the supersession / archive / rollback procedure. See BL-P3 below. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Plan equivalent: BL-P4** | Before RT-1 begins on any plan, Analyst MUST verify every external dependency (upstream team, external vendor, tool availability, budget approval) is actually secured. Unverified externals = Builder BLOCK at RT-1. See BL-P4 below. |
| **BL-24** | Single-Responsibility Commits | **Applies unchanged** | Plan equivalent is "one commit = one plan revision scoped to one objective." No new BL-P needed; BL-24 transfers cleanly. |
| **BL-25** | Error Path Coverage Matrix | **N/A for plans** (partial) | Plans do not have "happy/error/timeout/restart/partial" runtime paths in the code sense. HOWEVER, the DR4 contingency check (Section 4.1) partially encodes the BL-25 insight: every phase should have a failure-path contingency. BL-25 is therefore LIFTED INTO DR4, not maintained as a separate BL-P entry. |

Summary: 2 code-adapter BL apply unchanged (BL-3, BL-24); 4 have plan equivalents (BL-2→P1, BL-6→P2, BL-14→P3, BL-22→P4); 1 is N/A (BL-8); 1 is lifted into DR4 (BL-25).

### 7.3 New plan-specific BL (BL-P namespace — separate budget)

These 4 BL live in the plan skin file ONLY. They do NOT add to the main 30-BL budget. They are loaded by the plan domain adapter layer, not by META-Orchestrator's universal bootstrap.

**BL-P1: Plan Activation is a Release Event (plan adaptation of BL-2)**
- **Source:** Adapted from BL-2 for the plan domain.
- **Rule:** Declaring a plan ACTIVE (handing it to the execution team, pinning it as the project's plan of record, or replacing an existing active plan) is a release event. It requires: a pilot phase if feasible (run ONE sub-component end-to-end as proof before committing the full plan), a named activation date + activation owner, and a rollback/supersession plan (BL-P3). Major plan activations MUST be announced in writing to all stakeholders named in the plan's resource allocation section.
- **Why:** Plans are bindings on future work. Silently activating a plan leaves affected stakeholders surprised and the plan's Λ accumulation zero (no one learns from the plan because no one knew about it). A pilot phase + written announcement + named activation owner constrains the damage surface.
- **Applies to:** Visionary (approve activation), Builder (write announcement), Validator (pre-activation gate at RT-2).

**BL-P2: Render + Dry_Run Before Commit (plan adaptation of BL-6)**
- **Source:** Adapted from BL-6 for the plan domain.
- **Rule:** Before committing any plan revision, Builder MUST (a) render the plan as clean Markdown (no broken tables, unclosed code blocks, dangling headers), (b) run DR1/DR2/DR3/DR5 (the 4 mechanical dry_run checks), (c) run the BL-29 glossary scan across all phases, and (d) grep for anonymous owner patterns ("we", "the team", "TBD"). Commit is REJECTED if any of the four fails.
- **Why:** A plan file that "looks right" in the editor but fails any mechanical dry_run check is the plan equivalent of unverified code. Cost of running the 4 mechanical checks: 2-5 minutes. Cost of a broken plan in production (execution team hits a dangling prerequisite day 1): hours of coordination + rework.
- **Applies to:** Builder, Validator, META.

**BL-P3: Supersession Before Activation (plan adaptation of BL-14)**
- **Source:** Adapted from BL-14 for the plan domain.
- **Rule:** Before a new plan is declared ACTIVE, author must check whether a prior plan exists for the same or adjacent objective. If yes: (a) document the supersession in the new plan's header ("supersedes plan vX dated YYYY-MM-DD"), (b) archive the prior plan with a "superseded by vX on YYYY-MM-DD" marker at the top (do NOT delete), (c) document what carries over from the prior plan's lessons / completed phases / OOD decisions. If no rollback/supersession is documented, the new plan is NOT permitted to activate.
- **Why:** Post-activation pressure (execution team needs clarity, stakeholders want commitment) is when cognitive load peaks. A pre-written supersession plan executes mechanically when needed. Without supersession markers, plan archaeology becomes impossible — next quarter's author has no way to know which plan was active when. This is the plan-domain analog of "if you cannot describe how to undo a deploy, you don't have permission to deploy."
- **Applies to:** Visionary (approve supersession), Builder (write it), Coherencer (gate at RT-2 — block activation if missing).

**BL-P4: External Dependency PRE-FLIGHT (plan adaptation of BL-22)**
- **Source:** Adapted from BL-22 for the plan domain.
- **Rule:** Before RT-1 begins on any plan task, Analyst MUST verify every EXTERNAL dependency the plan relies on: (a) upstream team commitments are confirmed in writing (not assumed), (b) external vendors/tools are procured and accessible (not "we'll request it later"), (c) budget approvals are obtained (not "we'll ask finance"), (d) any external deadlines referenced by the plan are accurate (not old dates). Produce a VERIFIED EXTERNALS artifact (a small table: dependency | owner | confirmation status | confirmation evidence). Unverified externals = Builder BLOCK (RED on A_F) at RT-1, Validator BLOCK at RT-2.
- **Why:** Hallucinating that "the infra team will deliver X by date Y" is the top F=0 failure in plan work — analogous to hallucinating an API endpoint in code work. Verification costs minutes of cross-team outreach; a plan that collapses because its external dependency never materialized costs weeks of re-planning.
- **Applies to:** Analyst (RT-1 execution), Validator (RT-2 re-verification), Builder (refuse to start without artifact), META (enforce gate).

### 7.4 BL budget summary for the plan skin

- Universal BL inherited: **22** (unchanged)
- Code-adapter BL that apply unchanged: **2** (BL-3, BL-24)
- Code-adapter BL with plan equivalents: **4** (BL-2, BL-6, BL-14, BL-22 → BL-P1..P4)
- Code-adapter BL lifted into DR check: **1** (BL-25 → DR4 contingency)
- Code-adapter BL that are N/A for plans: **1** (BL-8)
- Plan-specific BL (BL-P namespace, separate budget): **4** (BL-P1..P4)

Total BL a plan agent carries: 22 universal + 2 transferred code-adapter + 4 BL-P = **28 BL**.
(The 1 N/A code-adapter BL is NOT loaded; plan agents do not "know" about BL-8. BL-25's spirit is preserved via DR4.)

---

# SECTION 8 — Acceptance Criteria for the Skin File

The Builder must produce `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.plan.md` satisfying ALL of the following:

### 8.1 Structural acceptance

- **[AS-1]** File exists at `templates/domain_skin.plan.md`
- **[AS-2]** YAML-style frontmatter block (lines 1-12 approximately) matches the structure in Section 1.2 of this spec
- **[AS-3]** All 10 skin-template sections from `templates/domain_skin.md.template` are present:
  1. Header block
  2. Vocabulary Mapping
  3. Role Focus Overrides (5 sub-sections — one per role)
  4. Verification Protocol (dry_run, 6 sub-checks)
  5. Checklists (Pre-Generation + Post-Generation)
  6. Examples (3 entries)
  7. Domain-Specific Bootstrap Lessons
  8. Known Out-of-Scope (OOD)
  9. B-weight Adjustment (uniform 0.25×4 — no override)
  10. Footer (last updated, upstream roles, upstream math, upstream BL, upstream live reference plan artifact)
- **[AS-4]** Vocabulary table has at least 18 rows (20 from Section 2 of this spec, plus 0-5 Builder additions; rows 1-22 MUST NOT be deleted or renumbered)
- **[AS-5]** Role Focus Overrides has all 5 sub-sections (Visionary, Analyst, Builder, Validator, Coherencer), each with FIRST focus anchor, artifact definition, primary failure mode, Jidoka specialization (3-5 questions)
- **[AS-6]** Verification Protocol section contains: (a) the block matching Section 4.4, (b) the 6 DR check table (DR1–DR6), (c) a note clarifying that dry_run is the MECHANICAL+INTERPRETIVE split L1/L2, (d) the code-skin analogy table from Section 4.3
- **[AS-7]** Examples section has all 3 examples from Section 6 of this spec (dangling prerequisite, unmeasurable criterion, terminology drift) with catching role + phase + fix clearly labeled
- **[AS-8]** Domain-Specific Bootstrap Lessons section references BOTH the 22 universal BL (inherited) AND the BL-P1..P4 additions, with a clear budget note
- **[AS-9]** Known Out-of-Scope section explicitly mentions: continuous/flow goals (improve morale, increase delight), subjective objectives (make it feel better), continuous tuning of a running system (ops knobs, real-time thresholds), verbal/cultural rituals (team traditions, culture decisions). These are NOT plan-skin-scope; escalate to Visionary RT-0 kill-switch.
- **[AS-10]** B-weight Adjustment section lists the `text` weights (F=0.25, E=0.25, (1-σ)=0.25, Λ=0.25) as DEFAULT with rationale from Section 1.1, AND mentions the v10 `B_plan` hook as DEFERRED

### 8.2 Routing / operator acceptance

- **[AO-1]** When an operator loads a project's `config.md` with `domain.type: plan` and `domain.skin: templates/domain_skin.plan.md`, META must route all 5 spawned agents through the skin overrides. This is an OPERATOR test, not a Builder test — but the Builder's skin file must SUPPORT this routing (i.e., the skin file must be legible to META's loader).
- **[AO-2]** Backward compat: existing projects MUST NOT be required to change as a result of this skin being written. Projects without `domain.type: plan` continue to work identically.
- **[AO-3]** Pure-L1 fallback: a project WITHOUT `domain.skin` in its config must continue to work identically to before. The skin file's existence must not affect projects that don't reference it.

### 8.3 Quality acceptance

- **[AQ-1]** No contradictions with `templates/domain_skin.md.template`. If Builder detects a contradiction, Builder ESCALATES to META instead of silently resolving.
- **[AQ-2]** No contradictions with the 5 role files. The skin adds focus, not replacement.
- **[AQ-3]** No contradictions with `templates/domain_skin.code.md` (both use `B_text` uniform weights). The plan skin is a vocabulary + verification adapter, not a B-weight override.
- **[AQ-4]** Every vocabulary row cites its source (role file line or live reference plan artifact line) in the table.
- **[AQ-5]** Every BL-P1..P4 entry has Source / Rule / Why / Applies to fields (matching universal BL format).
- **[AQ-6]** File is syntactically valid Markdown (parses cleanly, no broken headers, no incomplete tables).
- **[AQ-7]** File is EN-only (this is the EN skin; an RU mirror is deferred to the Phase 2 BL-19 follow-up task covering all new skins together).

### 8.4 Size acceptance

- **[ASZ-1]** Total file length: 400-700 lines (enough to be concrete, short enough to be loadable in agent context). This spec is ~900 lines; the skin file should be noticeably more compact because it is the PRODUCT, not the SPEC.

---

# Hand-off Section — For the Builder

**Target file:** `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.plan.md`

**Expected size:** 400-700 lines of Markdown (see AS-1 through ASZ-1 above).

**Structure to copy from `templates/domain_skin.md.template`:** The 10-section skeleton (header, Vocabulary, Role Focus Overrides, Verification, Checklists, Examples, BL, OOD, B-weight, Footer). Keep section order. Keep heading levels (# for top-level, ## for skin sections, ### for role sub-sections within Role Focus Overrides).

**What this spec GIVES you (do not re-invent):**
- Section 1 → fills the skin's header block exactly
- Section 2 → fills the skin's Vocabulary Mapping table exactly (all 22 rows)
- Section 3 → fills the skin's Role Focus Overrides (5 sub-sections with prescribed content)
- Section 4 → fills the skin's Verification Protocol (the block in 4.4 + the DR table in 4.1 + the L1/L2 split in 4.2 + the code-analogy table in 4.3)
- Section 5 → fills the RT phase protocol (skin's Checklists section becomes the Pre-Generation + Post-Generation checklists derived from the 5.4 pipeline + Section 3 Jidoka)
- Section 6 → fills the skin's Examples section (3 entries verbatim from 6.1/6.2/6.3 but prose polished)
- Section 7 → fills the skin's Domain-Specific Bootstrap Lessons section (22 universal + 2 transferred + 4 BL-P)
- Section 8 → is the acceptance test for YOUR output (not content to copy, but the rubric you must pass)

**What is FLEXIBLE (Builder discretion, within bounds):**
- **Vocabulary table: rows 23-27.** Builder MAY add 1-5 more rows if they find more plan-specific terms in other plan artifacts (SOPs, runbooks, incident procedures). Builder MUST NOT delete or renumber rows 1-22.
- **Prose tone in the Role Focus Overrides.** The Jidoka Q1-Q5/Q6 lists in Section 3 are structured; Builder may reformat as bullets or tables as long as all questions are preserved.
- **Pre-Generation Checklist and Post-Generation Checklist wording.** Builder must derive these from the 5.4 pipeline + Section 3 Jidoka questions + the BL-P2 commit gate. Builder MAY combine or reorder, but MUST cover all items (especially: render Markdown, run DR1/2/3/5 mechanically, BL-29 glossary scan, anonymous-owner grep).
- **Examples prose.** Builder may edit wording of Section 6 examples for readability, as long as (a) the catching role, (b) the phase, and (c) the fix are preserved verbatim.
- **Known Out-of-Scope section.** Builder MUST include the 4 items from AS-9 but MAY add 1-2 more borderline cases (e.g., "culture roadmaps — DEFERRED to v10" or "research roadmaps — route to `research` skin instead").
- **Live reference plan artifact line in header block.** Default is `reports/roadmap_v9_2026-04-11.md` but Builder may substitute a different named plan if one proves more load-bearing for a specific project.

**What is FIXED (Builder MUST preserve exactly):**
- `Type: plan` / `Modality: text (uniform weights 0.25 / 0.25 / 0.25 / 0.25 — v8-compatible default)` / `Parent BL: BOOTSTRAP_LESSONS_universal.md` / `Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md` / `Verify method: dry_run`
- Section 3 overrides: each role's primary failure mode verbatim
- Section 4 DR table (DR1–DR6) with exact L1/L2 assignments
- Section 6 examples: catching role + phase + fix verbatim
- Section 7 BL table: the 22 universal BL list unchanged; the 4 BL-P entries with Source/Rule/Why/Applies to fields
- `B_text` weights: F=0.25, E=0.25, (1-σ)=0.25, Λ=0.25 (uniform, NO override — `B_plan` is v10 deferred)

**Builder pre-write checklist:**
1. Read `templates/domain_skin.md.template` (reference structure)
2. Read this spec (full — you already did if you're here)
3. Read `templates/domain_skin.code.md` (sister text-modality skin — format reference)
4. Read the 5 EN role files if not already in context (skin references them)
5. Read `reports/roadmap_v9_2026-04-11.md` (the live reference plan artifact)
6. Verify the 22 universal BL list matches `BOOTSTRAP_LESSONS_universal.md` before copying Section 7.1 table — do NOT rely on this spec alone (BL-29 enforcement)

**Builder post-write checklist:**
1. Run through AS-1..ASZ-1: is every item satisfied?
2. Markdown lint: does `templates/domain_skin.plan.md` render cleanly? (BL-P2 pre-commit gate equivalent)
3. Read the file end-to-end once: do all sections flow, are all tables complete, are all references to other files correct?
4. Jidoka self-check per `roles/builder_EN.md`

**Do NOT do (out of scope for Builder):**
- Do NOT modify any project `config.md` (those will be updated by the operator later if they want plan-skin routing)
- Do NOT create other domain skins (`book`, `config`, `research`) in parallel — those have their own specs and their own Builders
- Do NOT modify any role file
- Do NOT modify `BOOTSTRAP_LESSONS_universal.md` or `BOOTSTRAP_LESSONS_code_adapter.md`
- Do NOT run dry_run on an actual plan (Validator work, separate task)
- Do NOT create an RU mirror of the skin file (BL-19 follow-up task covering all new skins, not this one)

---

# Open Questions (Spiral Gap, per BL-15)

- **OQ-P2A-1:** Should the plan skin's Section 4 (Verification Protocol) explicitly call out that `dry_run` is INCOMPLETE without the BL-29 glossary scan, or should glossary-scan be folded into DR6 (handoff clarity)? Current proposal: keep glossary-scan as a Coherencer-owned side check, not as a numbered DR sub-check, because it's a cross-phase consistency test rather than a walkthrough-time test. Revisit if operators find the split unclear.

- **OQ-P2A-2:** The skin assigns 5-6 Jidoka Q's per role in Section 3. Is this too many (role file has no fixed Q-count — each role has an abstract Jidoka)? Current proposal: 5-6 is fine because it's OPTIONAL specialization over the base Jidoka, not replacement. Match Phase 2.1 precedent.

- **OQ-P2A-3:** BL-P budget namespace — should BL-P1..P4 eventually be PROMOTED to the main BL budget (as BL-33..36), or should they stay namespaced forever? Current proposal: namespaced indefinitely. If a BL-P entry proves universal (all domains benefit — e.g., "activation is a release event" probably generalizes), it can be promoted later — but start conservative.

- **OQ-P2A-4:** The skin does NOT include an RU mirror (`templates/domain_skin.plan_RU.md`). This is technically BL-19 violation. Current proposal: accept the violation for v9 Phase 2.A specifically (four skins shipped in parallel; BL-19 mirror can be batched across all skins in a single follow-up task). Log the violation, do not close it.

- **OQ-P2A-5:** The `B_plan` modality mentioned in `eradev.md` line 144 is DEFERRED to v10 — but is that the right call? Plans might benefit from Λ-dominance (prior plans teach current ones more than other components do). Current proposal: defer to v10 empirical evidence — after 3+ months of actual plan-domain projects running on v9 with `B_text`, Hansei the question "were plans weak-link-capped on Λ?" If yes, promote `B_plan` to a registered modality for v10.

- **OQ-P2A-6:** Section 5.2 decision (single Builder for S/M/L, split for XL) — is the XL threshold right? ">10 phases OR >2 weeks OR >3 named owners" is a rough guess. Revisit after 2-3 plans actually run at XL scale.

---

# Jidoka Self-Check (B-diagnostics, text modality)

```
=== JIDOKA SELF-CHECK — [ANALYST] Phase 2.A (plan skin) ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.91 — Read all required inputs: analyst_EN.md, domain_skin.md.template,
                          domain_skin.code.md (full), domain_skin.article.md (partial —
                          hit file-size limit, read first 250 lines + lines 540-790 covering
                          BL/OOD/footer; structural pattern captured), v9_phase2_1 article
                          spec (full 662 lines — primary style reference), eradev.md II.1
                          modality registry + II.2 OOD scope, both BL files in full,
                          roadmap v9 report first 150 lines + Phase 2 section. One minor
                          gap: did NOT read roadmap v9 full 336 lines. Acceptable — I
                          have enough for Example 1 grounding + overall structural
                          recognition.
  E (Alignment):   0.93 — All 10 required spec sections produced with prescribed structure.
                          Each section maps directly to a template section in
                          templates/domain_skin.md.template that Builder will fill.
                          Hand-off tells Builder exactly where to put what. No padding,
                          no "future work" digressions. Plan-specific focus is clearly
                          separated from article-specific (different modality, different
                          vocabulary emphasis, different verification method). B-weight
                          choice is PINNED with rationale.
  (1-sigma):       0.90 — No contradictions with L0 (eradev.md untouched), with code
                          skin (both text modality, same weights, complementary
                          vocabulary), with article skin (different modality, different
                          verify method, no overlap), with Phase 0.A deliverables
                          (plan is in the v9 IN-SCOPE list at line 168), with BL files
                          (22 universal inherited, 8 code-adapter handled individually,
                          BL-25 explicitly lifted into DR4 rather than creating a
                          separate BL-P). One tension: OQ-P2A-1 (glossary scan placement)
                          is unresolved. Acceptable — it's an OPEN question, not a
                          contradiction.
  Lambda (Experience): 0.89 — Applied BL-11, BL-15, BL-17, BL-18, BL-21, BL-28, BL-29,
                              BL-32 explicitly. Applied Phase 0.A Visionary modal B
                              registry (text modality chosen with rationale), Phase 2.1
                              article spec structure (8-section + hand-off + open questions
                              + B-check frame), code skin identity-skin example (for
                              text-modality precedent). Used roadmap v9 report as live
                              reference plan artifact. Did NOT consult book/config/research
                              parallel skin specs (they are being written by parallel
                              siblings, not yet in context). Acceptable — this spec is
                              self-contained; cross-skin consistency check will happen
                              at Phase 2.A Coherencer gate when all 4 specs land.

  B = F · E · (1-σ) · Λ  (text modality, uniform 0.25 weights — multiplicative identity)
    = 0.91 · 0.93 · 0.90 · 0.89
    = 0.678

  (Note: using B_text uniform weights since this spec is FOR a plan-domain skin,
   plan modality is text, and the parent modality is session-sticky. The spec itself
   is the act of authoring a plan for plan-domain skin authoring — reflexively text
   modality.)

Weak link: (1-σ) at 0.90 (among 0.89/0.90/0.91/0.93 — all within 4 points).
           No RED component. No component < 0.3 → no Andon.
B = 0.678 > 0.5 → GREEN, no Andon.
Banality score: 8/10 — spec is specific, cites line numbers, pins fixed vs flexible,
                      provides explicit Builder hand-off rubric, grounds vocabulary
                      in the live roadmap v9 plan artifact. Not a template.
```

## B-check (Output Format per `roles/analyst_EN.md`)

```
## Implementation Plan (for Builder)
Task inertia: M (single file, 400-700 lines, all 10 sections pre-designed)
Artifacts: templates/domain_skin.plan.md (NEW file, absolute path above)
Dependencies: This spec (you are reading it). templates/domain_skin.md.template (structure).
              templates/domain_skin.code.md (sister text-modality skin — format reference).
              reports/roadmap_v9_2026-04-11.md (live reference plan artifact).
              The 5 EN role files (referenced but not modified).
              BOOTSTRAP_LESSONS_universal.md (22 BL table).
Artifact Ownership: Single Builder (M task — do NOT split into parallel Builders;
                    split rule from Section 5.2 only kicks in for XL plans, not plan-skin
                    authoring).
Pipeline: read this spec → read template → read code skin → read roadmap v9 report →
          read role files → draft the plan skin file → markdown-lint →
          Jidoka self-check → commit
Resource conflicts: None with existing files (new file, new path). No bilingual mirror
                    required in this task (BL-19 follow-up deferred — see OQ-P2A-4).
                    No conflict with parallel Phase 2.A skin specs (book/config/research)
                    because each has its own file path.
System dependencies: markdown-lint (or equivalent parser) for AS-4 verification.
B-check (text modality, uniform 0.25): F=0.91 E=0.93 (1-σ)=0.90 Λ=0.89 → B=0.678
```

---

*Analyst spec complete. B=0.678 (B_text uniform weights). Hand-off to [BUILDER] for skin-file creation. OQ-P2A-1..6 logged for follow-up.*

*Phase 2.A positioning note:* This is the FIRST plan-domain skin in v9 and establishes the `dry_run` verification method as the load-bearing gate for plan-like artifacts. Subsequent plan-adjacent artifact types (runbooks, SOPs, incident playbooks, onboarding checklists) can reuse this skin as-is or derive sibling skins (`templates/domain_skin.runbook.md` etc.) that inherit DR1–DR6 and the 5-role focus overrides. The plan skin's success is measured by how easily these derivatives reuse the patterns. If they can't, Hansei at that point — not now.

*Parallel Phase 2.A coherence note:* This spec is being drafted in parallel with `book`, `config`, and `research` skin specs. Cross-skin consistency (are the 4 Phase 2.A specs compatible? do they share vocabulary where they should? do they not contradict each other on modality choice?) is a Coherencer L2 responsibility at the Phase 2.A closing gate — NOT the Analyst's responsibility at draft time. If downstream Coherencer finds a contradiction between this spec and a sibling spec, the resolution happens at L2 synthesis, not here.
