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
> Spec: reports/v9_phase2a_plan_skin_spec_2026-04-11.md (Analyst hand-off)

---

## Purpose / When META Loads This Skin

META loads this skin when a project's `config.md` declares:
- `domain.type: plan`
- `domain.skin: templates/domain_skin.plan.md`

When loaded, the skin is passed to every spawned role agent in addition to the base role file `roles/{role}_EN.md`. It does NOT replace the role file — it provides a vocabulary map, focus overrides, verification expansion, RT adjustments, examples, and an inherited-vs-overridden BL table specific to plan-authoring work. The skin targets roadmaps, phased execution plans, and structured procedures whose correctness is measured by whether a non-author reader can walk them step by step. Runbooks, SOPs, incident playbooks, and onboarding checklists are adjacent classes and MAY reuse this skin as-is until a more specific sibling is written.

The plan domain shares `text` modality with `code` (uniform 0.25 weights) but diverges on verification: code uses `build` (compile+test+lint), plan uses `dry_run` (mental execution of the plan by a reader who did not author). This is the load-bearing new verification method the skin contributes.

---

## Vocabulary Mapping

This skin performs a LIGHT vocabulary override. Plans share most abstract vocabulary with code-text modality — the differences are concentrated around EXECUTION-TIME (calendar vs runtime), ARTIFACT SHAPE (steps vs functions), and VERIFICATION (dry_run vs build). When an agent sees these generic terms in `roles/{role}_EN.md`, it reads them as the plan-domain meanings below.

| # | Abstract term (role file / BL) | Plan meaning | Where used (evidence) |
|---|---|---|---|
| 1 | **artifact** | a plan document (`.md`, `.txt`, `.pdf`) OR a phase block inside one, OR an individual step with its prerequisites and ownership | `analyst_EN.md` line 7; `builder_EN.md` line 7 |
| 2 | **function** | plan step — the smallest addressable action unit ("Run Phase 0.B tagging", "Merge BL split PR", "Stage on port 8431") | Analogous to `builder_EN.md` "smallest addressable unit"; roadmap v9 lines 118-141 |
| 3 | **module / file** | plan phase or section (e.g., "Phase 0 — Theoretical Closure", "Phase 1 — Vocabulary Refactor") | `roadmap_v9_2026-04-11.md` lines 116-193 (phases as top-level structure) |
| 4 | **test / tests pass** | dry_run — can a reader mentally execute the plan from step 1 to done without ambiguity? | `validator_EN.md` line 7; Section 4 of this skin |
| 5 | **verify** | dry_run walkthrough — steps are self-contained, prerequisites are named, criteria are measurable | `analyst_EN.md` line 24; `roadmap_v9_2026-04-11.md` "Phase 0 PASS criteria" block |
| 6 | **validate** | run all 6 dry_run sub-checks (DR1–DR6 in Section 4) | `validator_EN.md` Key Rules |
| 7 | **build / compile** | render the plan — produce a readable document (Markdown→HTML, Markdown→PDF, or clean Markdown that parses without broken headers/tables) | Analogous to code-skin "compile = build" |
| 8 | **runtime** | execution time / calendar time — how long the plan takes when a real team runs it end-to-end (days, weeks, person-hours) — a blast-radius proxy, not a live runtime check | `builder_EN.md` Key Rules 4 ("blast radius"); `roadmap_v9_2026-04-11.md` line 336 |
| 9 | **spec / specification** | the objective statement — a one-sentence-or-paragraph description of what the plan achieves when done. The plan's True North. | `analyst_EN.md` "Implementation Plan" output format; `roadmap_v9_2026-04-11.md` line 11 |
| 10 | **API / API endpoint** | upstream dependency / handoff interface — another team, another phase, or an external person who must deliver X before this plan's step Y can start | `analyst_EN.md` Responsibilities 3; `roadmap_v9_2026-04-11.md` dependency DAG |
| 11 | **bug / defect** | an unclear or unexecutable step — a step a reader cannot perform without asking the author, OR a step whose prerequisites are dangling, OR a step whose success criterion is subjective | `validator_EN.md` line 20 ("B-diagnostics of defects"); direct analog of "code doesn't compile" = "plan doesn't dry_run" |
| 12 | **refactor** | re-outline / re-scope the plan — restructure phases without changing the central objective | `builder_EN.md` Key Rules 7 (refactor = restructure without semantics change) |
| 13 | **code review** | stakeholder sign-off — a named owner (product, engineering, research, operations) confirms the plan's scope, resources, and timeline are acceptable from their perspective | Analogous to `visionary_EN.md` Example 2 (peer review); `roadmap_v9_2026-04-11.md` META resolution rows |
| 14 | **PR / pull request** | a proposed plan revision submitted for RT review — a delta on a prior plan, or a fresh plan for a new objective | `builder_EN.md` Decision-Point Checklist |
| 15 | **commit** | a signed-off plan revision (author + date + version) — the current "active plan" of record for an objective | `roadmap_v9_2026-04-11.md` header block is a "commit" in plan idiom |
| 16 | **deploy / push to prod** | announce the plan as active — hand it to the operator, post it in the team channel, pin it to the project root. The plan becomes binding. | Analogous to code-skin "deploy"; the roadmap v9 report is itself pinned to `reports/` as the active v9 plan |
| 17 | **production** | the active plan of record — what the team is ACTUALLY doing, as opposed to draft proposals still in review | `validator_EN.md` Key Rules 4 (revert = postmortem) |
| 18 | **feature / feature flag** | an optional phase or step that may be included or skipped based on a downstream pass-criterion (e.g., roadmap v9 Phase 2 is "conditional on Phase 1 success") | Analogous to `builder_EN.md` Key Rules 6 ("feature flags / staged rollouts = release event") |
| 19 | **smoke test** | a quick 2-minute scan of the plan before the full dry_run — does it have all 6 required parts (objective, phases, dependency DAG, pass criteria, OOD, CORS)? A header-level completeness check. | Analogous to `validator_EN.md` Key Rules 5 ("stale output detection") |
| 20 | **glossary / canonical terms** | the project's established vocabulary — the plan must use these terms exactly, not invent new names for phases/gates/roles (BL-29 applied to plans) | `BOOTSTRAP_LESSONS_universal.md` BL-29 |
| 21 | **rollback / revert** | withdraw the plan — either because a new plan supersedes it or because the objective was dropped. Previous plans are archived with a "superseded by vX" note; they are not deleted. | Analogous to `builder_EN.md` Key Rules (rollback pattern); BL-P3 below |
| 22 | **canary / staged rollout** | pilot phase — run ONE sub-component of the plan end-to-end as a proof before committing the full plan to execution | Analogous to BL-2 (code-adapter); BL-P1 below |

**Unified with the live reference plan artifact — CRITICAL note:**
The live reference plan artifact is `reports/roadmap_v9_2026-04-11.md` (v9's own roadmap). It contains the SAME structural elements every plan-skin-compliant document should have: Executive Summary (objective), phased structure (Phase 0/1/2), pass criteria per phase, dependency DAG, OOD list (continuous/flow tasks deferred to v10), and a CORS (Convergent/Resolved/Sticky) list of open decisions. If any agent detects a contradiction between Section 3 (Role Focus Overrides) and this vocabulary table, the vocabulary table WINS and the agent must escalate to META before proceeding. If an agent detects a contradiction between the skin and the live reference plan artifact, it flags the item as an open question in the plan's Spiral Gap section — it does not silently resolve it.

---

## Modal B-formula (text weights, uniform 0.25×4)

This skin pins `B_modality: text`. The plan Builder / Validator / Coherencer use the text (uniform) weights:

| Component | Weight | Rationale |
|---|---|---|
| F (Focus) | **0.25** | Authors must have read the prior state and enclosing context — prior roadmap phases, existing plans for the same objective, project glossary. No prior-state read = drift. |
| E (Alignment) | **0.25** | Plan must solve the actual objective the operator set — not "a plan that reads well" but "a plan whose completion satisfies the original request." |
| (1-σ) (Consistency) | **0.25** | Phases must not contradict each other (same resource assigned to two parallel streams = conflict; two phases with dangling prerequisites on each other = deadlock). |
| Λ (Experience) | **0.25** | Prior plans' post-mortems (Hansei outputs) must inform this plan — BL-12 applied to plans. |

**Why `text`, not `creative` or `research` (PINNED — NO override):**
1. No single component dominates plan-authoring — all four matter in roughly equal measure.
2. Plans are text artifacts, not theorem/proof work. There is no proof chain to falsify. Inconsistency is bad but not formally fatal the way a broken proof chain is in `research`.
3. Plans are NOT creative long-form prose. Voice consistency and reader-alignment matter less than whether the plan is EXECUTABLE. A dry, terse plan that executes cleanly is better than a beautifully written plan that leaves steps ambiguous.

This is the v8-compatible default and matches `templates/domain_skin.code.md` — both are text-modality text-discrete artifacts.

**Variant clause (v10 future hook — NOT v9):** `eradev.md` Section II.1 names `B_plan` as a candidate modality with Λ-dominant weights, hypothesizing that ROADMAPS especially benefit from high Λ (prior roadmaps teach the current one). This is a v10+ research direction. v9 does NOT ship a `B_plan` modality — plans use `B_text`. If a project explicitly wants Λ-weighted plans, they can override per-project via `config.md` `## B-weight Override` section. The SKIN does not override; projects override individually if needed.

---

## Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` **unchanged**. The skin adds DOMAIN-SPECIFIC focus anchors, artifact definitions, failure modes, and Jidoka specializations for plan-authoring.

### Visionary (plan focus)

- **FIRST focus anchor (A_F override):** Read the operator's ORIGINAL request verbatim (not paraphrased). Read any existing plan for the same or adjacent objective (supersession check — see BL-P3 below). True North = *what does "done" mean for this objective, stated in the past tense as a measurable outcome?* Visionary's output is a single paragraph: the central objective + what is explicitly OUT OF SCOPE.
- **What the role considers "the artifact":** The central objective + its boundary. NOT the phases, NOT the steps, NOT the dependency DAG — those are Analyst's artifact. At RT-0 the Visionary speaks at the level of "this plan achieves X by date Y and explicitly does NOT achieve Z, W, V."
- **Primary failure mode in plan work:** Approving a plan whose objective is vague or whose "done" state is subjective ("make it better", "improve throughput", "clean up the mess"). This is a BL-17 violation applied to plans: pre-generation verification should have caught the objective ambiguity before Analyst decomposed it. Mitigation: Visionary's output MUST include a measurable "done" state, or the plan does not proceed to RT-1.
- **Jidoka self-check (plan specialization):**
  - Q1: "Is the 'done' state MEASURABLE (numeric threshold, named artifact exists, named stakeholder sign-off achieved)? If no — YELLOW on E, escalate before RT-1."
  - Q2: "Is the scope explicitly BOUNDED (what is OUT of scope)? An unbounded plan is a Muda generator (BL-11)."
  - Q3: "Does this plan SUPERSEDE an existing plan for the same objective? If yes, is the supersession acknowledged in writing (BL-P3 below)?"
  - Q4: "Is the objective falsifiable in a discrete way (plans are text-discrete per `eradev.md` Section II.2), or is it a continuous/subjective goal (OOD — escalate to Visionary RT-0 kill-switch)?"
- **Upstream reference:** `visionary_EN.md` establishes "True North" in code terms; the skin adds the *measurable-done + bounded-scope + supersession-check* triad which is NOT in the base role file.

### Analyst (plan focus)

- **FIRST focus anchor (A_F override):** Read Visionary's objective statement. Read any prior plans for the same or adjacent objective (BL-29 applied to plans: re-use the established phase names, step vocabulary, and pass-criterion format). Read the enclosing plan (if this plan is a sub-plan) to understand upstream prerequisites. THEN draft the phase decomposition. Analyst's primary artifact is the dependency DAG + the phase-by-phase step list + the resource allocation.
- **What the role considers "the artifact":** A structured plan document with EXACTLY these 9 required parts:
  1. **Objective block** (copied verbatim from Visionary's RT-0 output)
  2. **Scope bounds** (in / out)
  3. **Phases** with named durations (calendar time), named owners, named deliverables
  4. **Dependency DAG** (which phase/step blocks which)
  5. **Pass criteria per phase** (measurable gates)
  6. **Resource allocation** (who does what, what tools are needed)
  7. **Contingencies** (what to do if phase N fails)
  8. **Known Out-of-Scope** (OOD patterns for this plan class)
  9. **Open Questions / CORS** (per BL-15 2% spiral gap)

  The Analyst output is a DOCUMENT, not a bullet list. At RT-1 the Analyst hands a complete draft to Builder for wording polish + completeness gaps.
- **Primary failure mode in plan work:** Building a "perfect looking" outline with gaps — phases named but step lists missing, dependencies not stated explicitly, pass criteria reduced to vibes ("when it feels done"). This is the default plan failure mode. Mitigation: Analyst's Jidoka scores A_E=0.0 (Andon) if any of the 9 required parts above is missing.
- **Secondary failure mode:** Dangling prerequisite — a phase says "use the output of phase N-2" but no earlier phase produces that output, OR the prerequisite comes from an external team and no handoff interface is named. Mitigation: before RT-1 closes, Analyst runs DR2 (prerequisite check — see Section 4) on their own draft.
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

### Builder (plan focus)

- **FIRST focus anchor (A_F override):** Read the Analyst draft verbatim. Read the live reference plan artifact (`reports/roadmap_v9_2026-04-11.md` by default, or another named plan if the project has one) as the format gold standard. Read the project's established terminology — phase names, role names, gate names — and use them exactly (BL-29 applied to plans). Do NOT start polishing prose until all three reads are complete.
- **What the role considers "the artifact":** The single plan document file (`.md` typically, sometimes `.pdf` for formal submissions). The artifact is NOT a set of bullet points in a chat thread — it is a SAVED FILE with a canonical path and version field in its header. Builder must NOT mark Done until the file exists at a canonical path and parses cleanly as Markdown.
- **Primary failure mode in plan work:** Polishing prose before the structure is settled. Builder rewrites step 3 for readability, then Analyst's RT-1.5 review finds step 3 had a dangling prerequisite, and the "polished" version must be rewritten. Mitigation: Builder's Activation Operator requires reading the Analyst draft in full BEFORE any prose polish, and confirming the dependency DAG is stable before polishing individual steps.
- **Secondary failure mode:** Expanding scope during polish — "while drafting phase 2, I noticed phase 1 could also include X" — this is BL-11 violation applied to plans. The additional scope belongs in a DIFFERENT plan. Mitigation: Builder's Jidoka Q3 below explicitly asks "did I add anything the Analyst draft did not have?"
- **Tertiary failure mode (plan-specific, not in base role file):** Anonymous owners — "the team will do this", "we will check that". Every step MUST name an owner (role, person, or external party). Mitigation: Builder's Jidoka Q4 greps the draft for anonymous-owner patterns ("we", "the team", "someone", "TBD").
- **Jidoka self-check (plan specialization):**
  - Q1: "Have I read the Analyst draft in full? (F)"
  - Q2: "Have I read the live reference plan artifact (or the named reference plan) for format alignment? (F)"
  - Q3: "Does my polished plan match the Analyst draft's structure, or have I silently added scope? (E — BL-11)"
  - Q4: "Are all owners named (no 'we', no 'the team', no TBD)? (1-σ)"
  - Q5: "Does the plan use the project's established phase / gate / role terminology exactly? (Λ — BL-29)"
  - Q6: "Does the plan render cleanly as Markdown (no broken tables, no unclosed code blocks, no dangling section markers)? (F)"

### Validator (plan focus)

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

### Coherencer (plan focus)

- **FIRST focus anchor (A_F override):** Read the full plan end-to-end, twice — once top-down (objective → phases → steps) and once bottom-up (steps → phases → objective). Read the project's `lessons.md` for any rules this plan must honor (BL-29 glossary). Coherencer cares about *the plan's internal consistency AND its fit with the project's prior plans*, not just the plan in isolation.
- **What the role considers "the artifact":** The plan + (all prior plans for the same or adjacent objective) = plan series. Coherencer checks that the CURRENT plan does not contradict or duplicate prior plans, and that the current plan's phase terminology matches the project glossary.
- **Primary failure mode in plan work:** "Terminology drift across sections" — early phases call something a "sprint", later phases call it an "iteration", or the pass-criterion for Phase 0 uses "GREEN/YELLOW/RED" labels while Phase 1 uses "PASS/FAIL/WARN". These are ALL (1-σ) failures at the plan level. Mitigation: Coherencer runs a glossary scan across ALL phase sections + builds a mini-glossary of the terms the plan actually uses + flags divergence.
- **Secondary failure mode (plan-specific):** Phantom coherence — every phase's pass criterion "looks rigorous" but they all defer to the SAME underlying subjective judgment ("when it feels done"). The plan appears verifiable because each phase has a criterion, but the criteria collapse into one vague vibe. Mitigation: Coherencer asks "if I replace every phase's pass criterion with ITSELF (independent of every other phase's criterion), does the plan still work?"
- **Jidoka self-check (plan specialization):**
  - Q1: "Does the plan use every technical term consistently across phases, or does it drift (sprint vs iteration vs cycle)? (1-σ, BL-29)"
  - Q2: "Do the phase durations ADD UP to the plan's total duration, end-to-end? (basic arithmetic consistency)"
  - Q3: "Are pass criteria ACTUALLY independent across phases, or do they all collapse to one vibe? (phantom coherence check, BL-5 applied to plans)"
  - Q4: "Does this plan contradict or duplicate a prior plan for the same objective? If yes, is the supersession acknowledged (BL-P3)?"
  - Q5: "Independent spot-check: pick 3 steps at random — does each step name an owner, have prerequisites met by prior steps, and produce a named deliverable? If any fails, flag."
- **Supersession rule (BL-P3):** Coherencer is the ENFORCER of the supersession protocol. Commit is BLOCKED if a prior plan for the same objective is not archived with a "superseded by vX" marker.

---

## Verification Protocol (dry_run expanded)

This section maps directly to `config.md` `domain.verify.method: dry_run`. Unlike the code skin's `build` (which reduces to a shell command), `dry_run` is a structured mental execution split into 6 sub-checks (DR1–DR6), partitioned across roles and into mechanical (near-automated) versus interpretive (judgment-requiring) passes.

### The six dry_run checks

| # | Check | What it catches | Who runs it | Mechanism |
|---|---|---|---|---|
| **DR1** | **Step-by-step walkthrough** — mentally execute each step in sequence; each step must be self-contained and executable by a reader who did not author the plan | Unclear / unexecutable steps; steps that assume tribal knowledge | Validator | Near-mechanical — reader runs the sequence top-to-bottom, flagging any step they cannot perform without asking the author |
| **DR2** | **Prerequisite check** — every step's inputs are either (a) produced by a prior step in the plan, or (b) declared as an external input with a named source | Dangling prerequisites; phantom inputs; "magic" steps that assume something the plan never produced | Validator | Mechanical — build the step-input graph, find any node with an unsatisfied input |
| **DR3** | **Resource completeness** — every actor (role, person, team), tool (software, hardware, credential), budget (money, person-hours, compute), and deadline is named | Anonymous owners, missing tools, un-budgeted work, un-dated deadlines | Validator | Mechanical — grep for anonymous-owner patterns ("we", "the team", "TBD", "someone") + scan for un-dated phases + scan for un-budgeted tools |
| **DR4** | **Contingency presence** — for each phase, what happens if that phase fails? (rollback / escalate / cut scope / extend deadline) | Plans that only cover the happy path; plans with no failure-mode thinking; plans that assume everything will succeed | Validator | Interpretive — requires reading each phase's contingency section and asking "is the contingency realistic, or is it 'try harder'?" |
| **DR5** | **Success criterion measurability** — every phase's "done" state is quantifiable (numeric threshold, binary gate, named-artifact-exists), not subjective | Plans with vibes-based success criteria ("when it feels done", "good enough", "clean") | Validator | Near-mechanical — scan each pass-criterion block for numeric / binary / named-artifact keywords; flag any criterion that lacks them |
| **DR6** | **Handoff clarity** — each phase transition has an explicit ownership change OR an explicit "same owner continues" note | Implicit handoffs ("the team will take it from there"); unclear who owns the transition | Coherencer | Interpretive — scan each phase boundary and ask "who owns the next step, and did the prior phase produce what that owner needs?" |

### L1 (mechanical) vs L2 (interpretive) split

Like the article skin's cite_check, dry_run splits into two verification strata:

- **L1 (mechanical, per-commit):** **DR1, DR2, DR3, DR5** — all four can be reduced to structured scans with some human judgment at the margins. These run on every plan revision commit.
- **L2 (interpretive, pre-activation):** **DR4, DR6** — require a thoughtful reader who asks "is this realistic?" These run once before the plan is DECLARED ACTIVE (the plan-domain analog of "pre-submission" in the article domain).

### Relationship to the code-skin `build` verification

The code skin's `verify.method: build` checks "does the code compile + test + lint?" The plan skin's `verify.method: dry_run` is a direct analog: "does the plan compile (render as clean Markdown) + test (walk through steps) + lint (terminology consistency + measurable criteria)?"

| Code skin check | Plan skin analog |
|---|---|
| `compile` (does the source typecheck?) | DR1 + DR2 (does the step sequence make sense without gaps?) |
| `test` (do the unit tests pass?) | DR3 + DR5 (are resources named and criteria measurable?) |
| `lint` (are there style violations?) | DR6 + BL-29 glossary scan (is terminology consistent?) |
| `integration tests` (do the modules cooperate?) | DR4 (do phases cooperate at handoff boundaries, including failure modes?) |

The analogy is PEDAGOGICAL — a Builder coming from code should think of dry_run as "compile-and-test for plans".

### Verification block (for META / agent reference)

```
method:           dry_run
command:          N/A for automated dry_run alone; a plan is dry_run by a reader
                  (human or LLM agent) who did not author it. Mechanical aids:
                  - Markdown lint: `markdownlint plan.md` (renders cleanly)
                  - Resource grep: `grep -nE "\b(we|the team|someone|TBD|n/a)\b" plan.md`
                    → zero hits = PASS on anonymous-owner scan
                  - Duration sum check (manual): add up each phase's stated duration,
                    compare to plan total
                  - Cross-phase term consistency (BL-29): extract all capitalized
                    phase/gate/role names, confirm no synonyms ("sprint" ≠ "iteration")
success criteria: all 6 DR checks PASS (DR1–DR6) AND the plan file renders cleanly
                  as Markdown AND all 9 required parts of the Analyst deliverable
                  template are present AND supersession check (BL-P3) confirms no
                  prior-plan conflict
failure recovery: specific per check —
                  DR1 fail → identify unclear step(s), rewrite with explicit sub-actions
                  DR2 fail → either add a prior step that produces the missing input,
                             or declare the input as external with a named source
                  DR3 fail → name the owner(s), tool(s), budget(s), deadline(s)
                  DR4 fail → add a contingency paragraph per phase
                  DR5 fail → replace subjective criterion with numeric/binary/named-artifact
                             criterion
                  DR6 fail → add an explicit owner-change note at each phase boundary
independence check: Validator runs dry_run WITHOUT having been in the authoring
                  conversation. If Validator had to participate in drafting the plan,
                  Validator is not independent — escalate to a second Validator who
                  did not participate. This is the plan analog of "run tests on a
                  clean checkout, not on Builder's workspace."
                  Phantom coherence detection (BL-5) applied to plans: if Builder
                  and Validator BOTH read the plan and everyone says PASS but neither
                  actually walked through step 1 → step N in sequence, flag PHANTOM
                  DRY_RUN.
```

---

## RT Phase Protocol Adjustments

Code projects use the canonical RT protocol from `eradev.md` Section VI:
Visionary (direction) → Analyst (design) → Builder (implement) → Validator (test) → Coherencer (integrate)

Plans need adjustments because the work profile is different (no build/test feedback loop; the "artifact" is the plan document itself; dry_run requires a second-reader pass).

### When is the RT run?

Three RT invocation points for plans:

1. **RT-0 (Visionary solo, RECOMMENDED): objective capture + OOD check.** Runs before any RT-1 when the operator proposes a new objective or when an existing plan needs replacement. Visionary alone evaluates: is the objective measurable, bounded, falsifiable in a discrete way (not continuous/subjective), and does it supersede any existing plan? A YES from Visionary unlocks RT-1. RT-0 is nearly mandatory for plans that supersede a prior plan.
2. **RT-1 (mandatory, full 5-role): decomposition + validation.** Produces the Analyst deliverable template (9 required parts) + Builder's polished plan file + Validator's first DR1–DR5 pass + Coherencer's terminology check. Builder does NOT release the plan until RT-1 approves.
3. **RT-2 (mandatory, pre-activation): full dry_run + terminology unification.** Before the plan is declared ACTIVE (handed to the execution team, pinned as the project's active plan of record), runs all 6 DR checks + BL-29 glossary scan + supersession check (BL-P3).

No RT between RT-1 and RT-2 for single-phase plans. For multi-phase plans (>3 phases), an intermediate RT-1.5 MAY be run after each phase is drafted, but this is OPTIONAL. **Exception:** for XL plans (>10 phases OR total duration >2 weeks), RT-1.5 is MANDATORY after each major phase group.

### "Builder for a plan" — single or split?

**Decision: single Builder, unless the plan is XL.**

The plan Builder is a SINGLE agent for S/M/L plans. Within that single Builder session the rhythm is:
- Read Analyst draft
- Read live reference plan artifact for format alignment
- Polish section by section (objective → scope → phases → dependency DAG → pass criteria → contingencies → OOD → open questions)
- Internal self-check: render Markdown, grep for anonymous owners, sum durations
- Commit

This is a LINEAR polish pass, not an iterative loop. One Builder agent, one session.

**Exception (XL only):** For an XL plan (>10 phases OR >2 weeks duration OR >3 named owners across phases), the Analyst MAY split work across *two Builders* by phase ownership (Builder A polishes phases 0-3, Builder B polishes phases 4-7). File Ownership rule from `analyst_EN.md` Responsibilities 4 applies. Coherencer gate is MANDATORY between Builder completion and Validator RT-2.

**Rationale for NOT splitting outliner + polisher (even on XL):** Outline + polish live in the same mental model of the plan. Splitting them causes the polisher to lose the context the outliner had — increasing |B_outliner − B_polisher| and decreasing S_team. Keeping them unified is consistent with the v9 principle that *role is a focus, not a specialization*.

### RT-0 (Visionary solo) output format

RT-0 produces a single-paragraph decision:
- **APPROVED:** "objective is measurable as [numeric / binary / named-artifact-exists]; no prior plan covers this objective; scope bounds are [in: ... | out: ...]; proceed to RT-1."
- **REJECTED:** "objective is ambiguous / continuous / duplicates existing plan vX; propose a refined version."
- **SUPERSEDES:** "replaces plan vX-1 (dated YYYY-MM-DD); archive vX-1 with 'superseded by vX' marker per BL-P3."
- **OUT-OF-SCOPE:** "objective is continuous/subjective, no discrete verification possible; defer to v10 or reject."

### Plan pipeline (FIXED)

```
RT-0 (Visionary solo, RECOMMENDED) → objective capture + OOD + supersession check
RT-1 (full 5-role) → 9-part Analyst draft + Builder polish + Validator DR1–DR5
                     + Coherencer glossary
    [optional RT-1.5 after each major phase group for XL plans]
Coherencer gate (after Builder polish completes)
RT-2 (full 5-role) → 6 DR checks + BL-29 glossary scan + BL-P3 supersession check
Commit plan file + archive any superseded prior plan with "superseded by vX" note
Plan becomes ACTIVE → handed to execution team → outside RT scope (execution-time work)
```

---

## Checklists

### Pre-Generation Checklist (BL-17 Check-First, plan edition)

- [ ] Operator's original request read VERBATIM (not paraphrased)
- [ ] Prior plans for the same or adjacent objective located and read (supersession check, BL-P3)
- [ ] Project glossary read (phase / gate / role / owner canonical names, BL-29)
- [ ] Live reference plan artifact read (`reports/roadmap_v9_2026-04-11.md` by default) for format alignment
- [ ] Upstream prerequisites identified (what external teams / systems / artifacts the plan depends on)
- [ ] External dependency PRE-FLIGHT (BL-P4) — every external commitment confirmed in writing BEFORE RT-1
- [ ] Visionary RT-0 decision captured in writing (APPROVED / REJECTED / SUPERSEDES / OUT-OF-SCOPE)
- [ ] Scope bounds stated as explicit in / out lists

### Post-Generation Checklist (BL-P2 commit gate, Jidoka)

- [ ] Markdown lint passes (plan file renders cleanly, no broken tables, no unclosed code blocks, no dangling headers)
- [ ] All 9 required parts of the Analyst deliverable template present (objective / scope / phases / DAG / pass criteria / resources / contingencies / OOD / open questions)
- [ ] DR1 (walkthrough) passes — every step executable in isolation
- [ ] DR2 (prerequisites) passes — no dangling inputs
- [ ] DR3 (resource completeness) passes — no anonymous owners, no missing tools, no un-budgeted work
- [ ] DR5 (criterion measurability) passes — every pass criterion is numeric / binary / named-artifact-exists
- [ ] BL-29 glossary scan passes — no terminology drift across phases
- [ ] Anonymous-owner grep: `grep -nE "\b(we|the team|someone|TBD|n/a)\b" plan.md` → zero hits
- [ ] Phase durations sum to plan total (internal arithmetic consistency)
- [ ] Supersession check: if this plan supersedes an earlier plan, the prior plan is archived with a "superseded by vX" marker (BL-P3)
- [ ] Commit message follows project convention (one commit = one plan revision, BL-24)
- [ ] DR4 (contingencies) scheduled for RT-2 L2 pass
- [ ] DR6 (handoff clarity) scheduled for RT-2 L2 pass

---

## Examples (3 concrete tasks)

### Example 1: Dangling prerequisite (DR2 failure)

- **Input:** "Draft a plan to migrate the backend from Postgres to Cockroach. Include schema migration, data replication, and cutover."
- **Domain classification:** type=plan, modality=text, verify=dry_run, blast_radius=HIGH (production DB migration)
- **Scenario:** Analyst drafts a 5-phase plan. Phase 0: audit Postgres schema. Phase 1: set up Cockroach cluster. Phase 2: dual-write from app to both DBs. Phase 3: backfill historical data. Phase 4: cutover and retire Postgres. Builder polishes the draft and declares Done. Plan looks complete.
- **What Validator finds:** Running DR2 (prerequisite check), Validator finds that Phase 4 (cutover) says "deploy the new config that routes reads to Cockroach" — but no earlier phase produces that config. Phase 2 produces dual-write, not a config change for reads. Phase 3 produces backfilled data, not a config. The "new config" is a dangling prerequisite. Running the plan as written, on day 1 of Phase 4, the execution team would ask "wait, where is the config?" and stall.
- **Catching role:** **Validator** (DR2 is the load-bearing check here; Analyst's Jidoka Q3 should also have caught it but didn't).
- **Phase:** **RT-1** (Validator's dry_run pass happens at RT-1; dry_run is the PRIMARY gate, not a deferred one).
- **Fix:** Add a new Phase 3.5 (or insert a step into Phase 3): "produce the read-routing config + review it + stage it behind a feature flag." The feature flag is flipped in Phase 4 as the actual cutover step. Alternatively, declare the config as an external input produced by the infra team, with an explicit handoff interface and a named owner on the infra side.
- **Why DR1 alone would miss this:** DR1 (step walkthrough) checks each step in isolation. Phase 4 step 1 ("deploy the new config") is a well-formed step IN ISOLATION — it has a clear action. Only DR2's graph analysis catches that no prior phase produces the config. This is why dry_run must expand into multiple sub-checks, not reduce to "walk the steps."
- **B-check:** F=0.85 (Validator read all 5 phases + built the input graph), E=0.90 (DR2 is the exact intent of the check), 1-σ=0.85 (no terminology conflict, but DAG is broken), Λ=0.80 (BL-17 pre-generation verification lesson applied) → B ≈ 0.52 YELLOW (Andon triggered: DR2 FAIL; plan re-enters RT-1)

### Example 2: Unmeasurable success criterion (DR5 failure)

- **Input:** "Draft a plan for Q2 to improve onboarding."
- **Domain classification:** type=plan, modality=text, verify=dry_run, blast_radius=MEDIUM (process change, not infra)
- **Scenario:** Visionary approves the objective: "improve onboarding." Analyst decomposes into 4 phases: (P0) audit current onboarding, (P1) design new flow, (P2) implement, (P3) roll out. Each phase has a pass criterion. P0: "audit is done when we've interviewed the team." P1: "design is done when the wireframes feel clean." P2: "implementation is done when the code feels good." P3: "rollout is done when users are happy." Builder polishes. Plan passes Markdown lint. Validator runs DR1 and the walkthrough is mechanically fine.
- **What Validator finds:** Running DR5 (success criterion measurability), Validator flags every single phase's pass criterion as SUBJECTIVE:
  - "we've interviewed the team" — how many people? which team? no number.
  - "wireframes feel clean" — by whose judgment?
  - "code feels good" — lint green? tests pass? coverage threshold?
  - "users are happy" — NPS threshold? satisfaction score? reduction in support tickets?

  DR5 FAILS with 4/4 unmeasurable criteria. The plan is "verified" by DR1 but it is actually a vibes plan — on day 1 of execution, the team cannot know whether Phase 0 is done or not.
- **Catching role:** **Validator** (DR5 is the load-bearing check here).
- **Phase:** **RT-1** (DR5 is L1 mechanical, per-commit; runs at RT-1). But Analyst's Jidoka Q4 should have caught it at RT-1; the fact that it didn't is a process defect worth Hansei.
- **Fix:** Rewrite each pass criterion to be measurable. P0: "audit is done when we have interviewed ≥5 users from each cohort (new, expert, failed-signup) and documented findings in `/docs/onboarding_audit.md`." P1: "design is done when wireframes are reviewed by design lead + 2 engineers + PM, all sign off in writing." P2: "implementation is done when new flow passes E2E suite, feature flag ready, behind-flag rollout tested on staging." P3: "rollout is done when 95% of new signups in a 2-week window use the new flow without falling back, measured by funnel analytics." Visionary reviews the rewritten criteria and re-approves.
- **Why DR1 alone would miss this:** DR1 is a mechanical walkthrough — "can I execute step 1?" — and each phase's steps ARE individually executable. The gap is in the PASS CRITERIA, not the steps. DR5 is designed to catch exactly this kind of plan-shaped vibe that walks but does not verify. This is also a BL-17 violation applied to plans — pre-generation verification should have caught the ambiguity at the objective-statement level.
- **B-check:** F=0.85 (read all 4 phases + audited each criterion), E=0.95 (DR5 is exact intent), 1-σ=0.80 (vibes-based criteria implicitly collapse to one metric), Λ=0.85 (BL-5 phantom coherence + BL-17 pre-gen verification applied) → B ≈ 0.55 YELLOW (Andon: DR5 FAIL; plan re-enters RT-1 via Visionary)

### Example 3: Terminology drift across phases (Coherencer σ failure)

- **Input:** "Draft a plan for the 2026 Q2 release cycle, including sprint planning, iteration reviews, retrospectives, and ship date."
- **Domain classification:** type=plan, modality=text, verify=dry_run, blast_radius=MEDIUM (process plan, multi-team)
- **Scenario:** Analyst drafts a 6-week plan. Phases 0-2 use "sprint" consistently: "Sprint 1 planning", "Sprint 1 review", "Sprint 1 retro." Phases 3-5 drift to "iteration": "Iteration 4 planning", "Iteration 4 review", "Iteration 4 retro." Phase 6 (final ship) mixes both: "Final sprint iteration review." Builder polishes. Validator runs DR1 through DR5 and everything looks mechanical: steps execute, prerequisites are met, criteria are measurable. PASS.
- **What Coherencer finds:** Running the BL-29 glossary scan + DR6 (handoff clarity), Coherencer builds a mini-glossary of term uses: "sprint" appears 14 times, "iteration" appears 11 times, "sprint iteration" appears once. The project's `lessons.md` glossary says "sprint" is the canonical term. Phases 3-5 have drifted. Phase 6 is a hybrid. The plan is internally self-consistent in that each phase works IN ISOLATION, but the team reading phase 3 will interpret "iteration" as a DIFFERENT thing than a "sprint" (they are trained to think sprint = 2-week unit, iteration = a single dev cycle within a sprint). Silent contradiction.
- **Catching role:** **Coherencer** (canonical σ failure — divergent meanings of the same concept across phases; BL-29 applied to plans).
- **Phase:** **RT-2** (final glossary scan is a Coherencer RT-2 activity). Could also be caught at RT-1.5 if the plan is XL.
- **Fix:** Coherencer invokes Phantom Coherence Check (`coherent_EN.md` Key Rules 2) and runs a grep-based unification: replace "iteration" with "sprint" throughout phases 3-5, resolve phase 6 to "Final sprint review" (drop the hybrid), and log a mini-glossary block in the plan's header ("This plan uses 'sprint' = 2-week unit throughout; no other term is used"). Builder re-polishes the affected phases. Validator re-runs DR6 on the affected phase boundaries. Plan re-enters RT-2 gate.
- **How the skin's vocabulary maps this:** "sprint" vs "iteration" = a SYMBOL COLLISION (vocabulary row 20 + BL-29). Coherencer's Q1 ("Does the plan use every technical term consistently across phases?") catches this directly. This is the plan-skin analog of the article-skin `\Lambda` symbol collision from `analyst_EN.md` Ex.2 — a single concept with two labels silently contradicting itself.
- **B-check:** F=0.85 (read all 6 phases + built glossary), E=0.80 (DR6 + BL-29 are the correct checks), 1-σ=0.70 (drift across 2 terms × 11+ hits = MEDIUM σ), Λ=0.85 (BL-29 + BL-5 + BL-32 applied) → B ≈ 0.41 RED (Andon: σ FAIL; plan re-enters Builder polish with glossary unification)

---

## Domain-Specific Bootstrap Lessons

The plan skin inherits all 22 universal BL unchanged from `BOOTSTRAP_LESSONS_universal.md` and handles each of the 8 code-adapter BL individually. New plan-specific BL are added in a separate `BL-P` namespace that does NOT count against the main 30-BL budget.

### Universal BL (22 entries — all inherited unchanged)

| BL | Title | Applicability to plan work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Applies unchanged — a fresh plan-domain project starts with Λ=0.5; accumulates as prior plans land in the archive |
| BL-4 | S_adjusted = S_team × B_mean | Applies unchanged — Coherencer at RT-2 computes S_adjusted from the 5 role B scores |
| BL-5 | Phantom Coherence Detection | Applies unchanged — plan-specific manifestation is "every phase has a pass criterion but all criteria collapse to 'when it feels done'" (see Coherencer primary failure) |
| BL-7 | EN for Practical Tasks, RU for Theoretical Depth | Applies unchanged — plan drafting is practical (EN role files); high-level strategy / vision work is theoretical (RU role files may be used for objective derivation) |
| BL-9 | Interface Contracts Between Roles | Applies unchanged — Analyst→Builder contract is the 9-part draft template; Builder→Validator contract is the polished plan file with all 9 parts filled |
| BL-10 | Multiplicative B Structure | Applies unchanged — weights are `text` profile (F=0.25, E=0.25, (1-σ)=0.25, Λ=0.25) per Section "Modal B-formula" |
| BL-11 | Scope Creep is Muda | **Critical for plans** — plans are the ARTIFACT most vulnerable to scope creep; "while polishing phase 2, I noticed phase 1 also needs fixing" = SEPARATE plan revision, not a silent addition |
| BL-12 | Hansei Targets Process, Not People | Applies unchanged — post-plan-execution reflection is about why the plan had a gap, not who polished it |
| BL-13 | Yokoten — One Lesson, All Analogous Cases | Applies unchanged — if a dry_run catches a dangling prerequisite in one plan, grep the plan archive for the same pattern in other plans |
| BL-15 | 2% Spiral Gap | **Critical for plans** — every plan ships with some open questions; the skin makes this EXPLICIT via a mandatory "Open Questions" section in the Analyst draft template (part 9) |
| BL-16 | Reading the Framework ≠ Applying It | Applies unchanged — META must still delegate plan work to agents, not draft plans directly |
| BL-17 | Pre-Generate Verification = Prevention | **Critical for plans** — Check-First pipeline for plans = "read the objective + read prior plans + read project glossary BEFORE drafting phases" |
| BL-18 | Scope Reclassification at 2× Estimate | **Critical for plans** — if a plan's phase runs 2x its estimated duration, reclassify the plan (maybe S→L, maybe the whole objective needs re-scoping) |
| BL-19 | Bilingual Files Simultaneous | Applies (limited) — if the project has RU and EN stakeholders, the plan must exist in both languages; otherwise EN-only is fine. Plans are NOT as bilingual-heavy as articles, but BL-19 still applies when both language communities need the plan |
| BL-20 | Adversarially Test Bootstrap | Applies unchanged — test the plan skin file itself against a trial plan (e.g., "plan for Q2 docs refresh") before deployment |
| BL-21 | Format Specifications Are Inputs | **Critical for plans** — the live reference plan artifact format must be read BEFORE drafting a new plan; do not invent a new plan format per project |
| BL-26 | META Always Delegates | Applies unchanged — META never drafts plan prose directly |
| BL-28 | Agent Prompt Must Include Explicit Context | Applies unchanged — plan-task agent prompts must name the skin file path AND role file path |
| BL-29 | Verify Established Terminology Before Generating | **Critical for plans** — plans MUST use the project's established phase / gate / role terminology; drift (sprint vs iteration in Example 3) is the canonical Coherencer σ failure |
| BL-30 | Defense-In-Depth | Applies unchanged — plan validation has layers: Builder Jidoka + Coherencer glossary scan + Validator 6 DR checks |
| BL-31 | Constrain Output Types | Applies unchanged — Builder's output is the polished plan file, not prose explanations about the plan |
| BL-32 | Grep After BL Merge | Applies unchanged — if plan terminology changes (e.g., "sprint" → "cycle"), grep the plan archive for orphan references |

### Code-adapter BL (8 entries — treated individually)

| BL | Title | Verdict for plans | Plan equivalent |
|---|---|---|---|
| **BL-2** | Logs as PRIMARY source / Canary Deployment | **Plan equivalent: BL-P1** | Major plan activation (replacing an existing plan, declaring Phase 2 go-live) is a release event requiring a pilot phase. See BL-P1 below. |
| **BL-3** | FIX-TO-SPEC gate (3+ consecutive fixes) | **Applies unchanged** | Plan equivalent: "3+ consecutive revisions of the same phase = STOP, re-scope the objective." No new BL-P needed; BL-3 transfers cleanly. |
| **BL-6** | BUILD-VERIFY gate (compile/test before commit) | **Plan equivalent: BL-P2** | Before committing a plan revision, Builder must render the Markdown AND run DR1/DR2/DR3/DR5 (mechanical dry_run checks) AND BL-29 glossary scan. See BL-P2 below. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **N/A for plans** | Plans do not have feature flags. Phases can be "conditional on prior phase success" (e.g., roadmap v9 Phase 2 is conditional on Phase 1) but this is a pass-criterion gate, not a flag toggle. |
| **BL-14** | Artifact Content Gate / Rollback Plan | **Plan equivalent: BL-P3** | Before declaring a plan ACTIVE (especially one that supersedes a prior plan), author must document the supersession / archive / rollback procedure. See BL-P3 below. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Plan equivalent: BL-P4** | Before RT-1 begins on any plan, Analyst MUST verify every external dependency (upstream team, external vendor, tool availability, budget approval) is actually secured. Unverified externals = Builder BLOCK at RT-1. See BL-P4 below. |
| **BL-24** | One Commit = One Phase | **Applies unchanged** | Plan equivalent: "one commit = one plan revision scoped to one objective." No new BL-P needed; BL-24 transfers cleanly. |
| **BL-25** | Blast Radius Dictates Process / Error Path Coverage | **LIFTED INTO DR4** | Plans do not have "happy/error/timeout/restart/partial" runtime paths in the code sense. HOWEVER, the DR4 contingency check encodes the BL-25 insight: every phase should have a failure-path contingency. BL-25 is therefore LIFTED INTO DR4, not maintained as a separate BL-P entry. |

**Summary:** 2 code-adapter BL apply unchanged (BL-3, BL-24); 4 have plan equivalents (BL-2→P1, BL-6→P2, BL-14→P3, BL-22→P4); 1 is N/A (BL-8); 1 is lifted into DR4 (BL-25).

### Plan-specific BL (BL-P namespace — separate budget)

These 4 BL live in the plan skin file ONLY. They do NOT add to the main 30-BL budget. They are loaded by the plan domain adapter layer, not by META-Orchestrator's universal bootstrap.

**BL-P1: Plan Activation is a Release Event (plan adaptation of BL-2)**
- **Source:** Adapted from BL-2 for the plan domain.
- **Rule:** Declaring a plan ACTIVE (handing it to the execution team, pinning it as the project's plan of record, or replacing an existing active plan) is a release event. It requires: a pilot phase if feasible (run ONE sub-component end-to-end as proof before committing the full plan), a named activation date + activation owner, and a rollback / supersession plan (BL-P3). Major plan activations MUST be announced in writing to all stakeholders named in the plan's resource allocation section.
- **Why:** Plans are bindings on future work. Silently activating a plan leaves affected stakeholders surprised and the plan's Λ accumulation zero (no one learns from the plan because no one knew about it). A pilot phase + written announcement + named activation owner constrain the damage surface.
- **Applies to:** Visionary (approve activation), Builder (write announcement), Validator (pre-activation gate at RT-2).

**BL-P2: Render + Dry_Run Before Commit (plan adaptation of BL-6)**
- **Source:** Adapted from BL-6 for the plan domain.
- **Rule:** Before committing any plan revision, Builder MUST (a) render the plan as clean Markdown (no broken tables, unclosed code blocks, dangling headers), (b) run DR1 / DR2 / DR3 / DR5 (the 4 mechanical dry_run checks), (c) run the BL-29 glossary scan across all phases, and (d) grep for anonymous owner patterns ("we", "the team", "TBD"). Commit is REJECTED if any of the four fails.
- **Why:** A plan file that "looks right" in the editor but fails any mechanical dry_run check is the plan equivalent of unverified code. Cost of running the 4 mechanical checks: 2-5 minutes. Cost of a broken plan in production (execution team hits a dangling prerequisite day 1): hours of coordination + rework.
- **Applies to:** Builder, Validator, META.

**BL-P3: Supersession Before Activation (plan adaptation of BL-14)**
- **Source:** Adapted from BL-14 for the plan domain.
- **Rule:** Before a new plan is declared ACTIVE, author must check whether a prior plan exists for the same or adjacent objective. If yes: (a) document the supersession in the new plan's header ("supersedes plan vX dated YYYY-MM-DD"), (b) archive the prior plan with a "superseded by vX on YYYY-MM-DD" marker at the top (do NOT delete), (c) document what carries over from the prior plan's lessons / completed phases / OOD decisions. If no rollback / supersession is documented, the new plan is NOT permitted to activate.
- **Why:** Post-activation pressure (execution team needs clarity, stakeholders want commitment) is when cognitive load peaks. A pre-written supersession plan executes mechanically when needed. Without supersession markers, plan archaeology becomes impossible — next quarter's author has no way to know which plan was active when. This is the plan-domain analog of "if you cannot describe how to undo a deploy, you don't have permission to deploy."
- **Applies to:** Visionary (approve supersession), Builder (write it), Coherencer (gate at RT-2 — block activation if missing).

**BL-P4: External Dependency PRE-FLIGHT (plan adaptation of BL-22)**
- **Source:** Adapted from BL-22 for the plan domain.
- **Rule:** Before RT-1 begins on any plan task, Analyst MUST verify every EXTERNAL dependency the plan relies on: (a) upstream team commitments are confirmed in writing (not assumed), (b) external vendors / tools are procured and accessible (not "we'll request it later"), (c) budget approvals are obtained (not "we'll ask finance"), (d) any external deadlines referenced by the plan are accurate (not old dates). Produce a VERIFIED EXTERNALS artifact (a small table: dependency | owner | confirmation status | confirmation evidence). Unverified externals = Builder BLOCK (RED on A_F) at RT-1, Validator BLOCK at RT-2.
- **Why:** Hallucinating that "the infra team will deliver X by date Y" is the top F=0 failure in plan work — analogous to hallucinating an API endpoint in code work. Verification costs minutes of cross-team outreach; a plan that collapses because its external dependency never materialized costs weeks of re-planning.
- **Applies to:** Analyst (RT-1 execution), Validator (RT-2 re-verification), Builder (refuse to start without artifact), META (enforce gate).

### BL budget summary

- Universal BL inherited: **22** (unchanged)
- Code-adapter BL that apply unchanged: **2** (BL-3, BL-24)
- Code-adapter BL with plan equivalents: **4** (BL-2, BL-6, BL-14, BL-22 → BL-P1..P4)
- Code-adapter BL lifted into DR check: **1** (BL-25 → DR4 contingency)
- Code-adapter BL that are N/A for plans: **1** (BL-8)
- Plan-specific BL (BL-P namespace, separate budget): **4** (BL-P1..P4)

**Total BL a plan agent carries: 22 universal + 2 transferred code-adapter + 4 BL-P = 28 BL.**
(The 1 N/A code-adapter BL is NOT loaded; plan agents do not "know" about BL-8. BL-25's spirit is preserved via DR4.)

### Project lessons.md integration

**Rule:** The skin inherits 22 universal BL from `BOOTSTRAP_LESSONS_universal.md` AND defers to `projects/{PROJECT}/lessons.md` for project-specific rules. On conflict, the project lessons.md **takes precedence for project-scoped concerns** — the skin encodes the plan-domain invariant, the project lessons encode the project-specific enforcement patterns (e.g., "this project uses 'sprint' not 'iteration'; drift is RED").

**Validator one-line routine:** Read `projects/{PROJECT}/lessons.md` → extract project-specific rule list → supplement the 6 dry_run sub-checks with project-specific rules (e.g., canonical vocabulary, mandatory section order, forbidden phrases).

**Applies to:** Validator (RT-2 primary reader), Coherencer (cross-plan propagation via BL-32), Builder (pre-commit BL-P2 gate), Analyst (RT-1 Check-First preamble).

---

## Known Out-of-Scope (OOD)

Tasks that LOOK like plan work but FAIL v9's text-discrete AND-gate. Agents must escalate these to Visionary RT-0 and, when confirmed OOD, defer to the OOD Registry — do NOT auto-proceed under the plan skin.

- **Continuous / flow goals.** "Improve team morale", "increase product delight", "raise engagement" — there is no discrete pass criterion and no terminal state. FAILS on `verify.method` discreteness. Escalate to Visionary RT-0 kill-switch (Phase 0.A Edge Case 2).
- **Subjective objectives.** "Make the product feel better", "clean up the vibes", "polish the experience" — aesthetic judgment is continuous, not discrete. FAILS on objective verification. Visionary RT-0 is the explicit gate.
- **Continuous tuning of a running system.** Ops knobs, real-time thresholds, auto-scaling policies — these are feedback-loop adjustments, not text-discrete plans. OOD for v9. Escalate to a `config` skin (deferred) or a `runbook` skin (deferred).
- **Verbal / cultural rituals.** "Plan the quarterly offsite vibes", "design the team tradition", "schedule the culture day" — these lack the DR3 resource / DR5 measurability structure a plan skin enforces. OOD for v9; reject or route to a `culture` skin (deferred to v10).
- **Culture roadmaps / values rollouts.** Similar to the above — load-bearing property is adoption rate, which is continuous and measured post-hoc. Deferred to v10.
- **Research roadmaps (theorem / proof work).** Route to the `research` skin instead — research roadmaps have a different verification signature (recomputation, not dry_run) and a different modality (`research`, not `text`).

Agents should escalate these to Visionary RT-0, not auto-proceed. See `eradev.md` Section II.2 for the v9 OOD registry.

---

## B-weight Adjustment (default — no override)

Plan modality uses the default uniform weights. This is the v8-compatible default and matches the `code` skin (both text-discrete, both text-modality). The plan skin does NOT override B-weights; it overrides vocabulary and verification method.

| Component | Weight | Rationale |
|---|---|---|
| F | 0.25 | Prior state read (objective, prior plans, project glossary, live reference plan artifact) — all matter equally for a correct plan |
| E | 0.25 | Output matches operator intent (not just letter) — plan must solve the objective, not "read well" |
| (1-σ) | 0.25 | No conflicts with existing plans, phase names, owner mappings, established terminology |
| Λ | 0.25 | Prior plans' Hansei output consulted, past gaps applied, BL-1..BL-32 considered |

**v10 future hook (DEFERRED — do NOT implement in v9):** `eradev.md` Section II.1 names `B_plan` as a candidate modality with Λ-dominant weights. The hypothesis is that roadmaps especially benefit from high Λ (prior roadmaps teach the current one more than the other components). After 3+ months of actual plan-domain projects running on v9 with `B_text`, a Hansei can revisit: "were plans weak-link-capped on Λ?" If yes, promote `B_plan` to a registered modality for v10. v9 ships with `B_text` only.

Projects MAY override these weights in their own `config.md` `## B-weight Override` section (see `projects/plugy/config.md` for precedent). The skin does not override; projects override individually if needed.

---

## Footer

*Last updated: 2026-04-11 (v9 Phase 2.A)*
*Upstream roles: `roles/{role}_EN.md` (all 5 roles — Visionary, Analyst, Builder, Validator, Coherencer)*
*Upstream math: `eradev.md` Section II.1 (B_text weights) + Section II.2 (v9 OOD scope)*
*Upstream BL: `BOOTSTRAP_LESSONS_universal.md` (22 universal BL inherited)*
*Does NOT inherit `BOOTSTRAP_LESSONS_code_adapter.md` — 2 transferred (BL-3, BL-24), 4 adapted to BL-P1..P4, 1 lifted into DR4, 1 N/A*
*Live reference plan artifact: `reports/roadmap_v9_2026-04-11.md` (v9's own Phase 0/1/2 roadmap)*
*Spec: `reports/v9_phase2a_plan_skin_spec_2026-04-11.md` (Analyst hand-off)*
*Sibling skins: `templates/domain_skin.code.md` (identity, text modality) / `templates/domain_skin.article.md` (override, research modality)*
