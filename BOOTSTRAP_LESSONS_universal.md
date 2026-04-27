# Shared Lambda Bootstrap -- Universal Lessons (Cross-Domain)

> **Loading rule:** Loaded by ALL projects (code, article, book, config, plan).
> Split from BOOTSTRAP_LESSONS.md in EraDev v9 Phase 1.D (2026-04-11).
> Loaded when MEMORY.md is empty (Lambda has no project-specific grounding).
> These lessons act as Lambda=0.5 bootstrap: not zero (blind), not high (overfit).
> Source: framework invariants, A/B experiments, RT post-mortems.
>
> **Scope:** These 23 lessons apply to any text-discrete artifact task. Principles are
> framework-invariant (ODTOE math, TPS, delegation, identity, classification, output types).
> They reference universal mechanics — not code-native tools — even when their origin
> stories include code examples.
>
> **BL numbering preserved from combined BOOTSTRAP_LESSONS.md.** Gaps in this file
> (BL-2, BL-3, BL-6, BL-8, BL-14, BL-20, BL-21, BL-22, BL-23, BL-24, BL-25, BL-27) are either
> code-adapter lessons (loaded separately by code projects) or retired/merged entries.
> See "BL Gap Map" section at the bottom of this file.
>
> Budget cap: maximum 30 BL across both files. Adding BL-N requires merging or retiring
> existing entries first.
>
> **2026-04-20 Phase 1 update:** BL-14 MERGED INTO BL-8 (rollback-plan consolidated into
> deployment-event checklist); BL-20 RETIRED (content lifted to meta.md §13 MM3); BL-21
> MERGED INTO BL-17 (format-spec-as-input consolidated into pre-generate verification).
> BL-33, BL-34, BL-35 added as new universal entries.

---

### BL-1: Lambda=0.5 as Cold-Start Default [UNIVERSAL]
**Source:** Framework invariant (ODTOE Formula B)
**Rule:** When MEMORY.md is empty, set Lambda=0.5 for all agents -- never 0.
**Why:** Lambda=0 makes the entire B product collapse to zero (multiplicative structure). An agent with zero experience is formally dead. 0.5 is the honest prior: "I have no project memory, but I carry framework knowledge." As project memory accumulates, Lambda adjusts toward observed values.
**Applies to:** ALL roles
**Tier:** T4 (docs-only, conceptual constant)

---

### BL-4: S_adjusted = S_team x B_mean [UNIVERSAL]
**Source:** Framework invariant (ODTOE collective formulas)
**Rule:** Never use raw S_team alone to judge team health. Always compute S_adjusted = S_team x B_mean, where B_mean is the arithmetic mean of all agent B values.
**Why:** S_team measures agreement, not quality. Five agents can perfectly agree on the wrong answer (S=1.0, B_mean=0.2, S_adjusted=0.2). Without the B_mean multiplier, high coherence masks low competence.
**Applies to:** Coherencer, Validator
**Tier:** T3 (agent-prompt checklist)

---

### BL-5: Phantom Coherence Detection [UNIVERSAL]
**Source:** A/B experiment (RT analysis)
**Rule:** When S_team > 0.8 but B_mean < 0.4, flag PHANTOM COHERENCE. Do not proceed. Trigger Kill-Switch level 2 ("Challenge premise").
**Why:** High agreement among low-quality agents is the most dangerous configuration. It feels productive -- everyone agrees, output flows quickly -- but the team is synchronized around a flawed model. This is the false-signal trap: confidence without competence. The antidote is managed dissonance, not more consensus.
**Applies to:** Coherencer, Validator, Visionary
**Tier:** T3 (agent-prompt checklist)

---

### BL-7: EN for Practical Tasks, RU for Theoretical Depth [UNIVERSAL]
**Source:** A/B experiment (Language Policy, eradev.md Section 0)
**Rule:** Use English for agent communication, interface contracts, debugging, and execution prompts. Use Russian for theoretical deepening, mathematical derivations, and conceptual exploration. Cross-project lessons are always in EN.
**Why:** A/B testing showed EN yields better tool coverage, more consistent interface contracts, and cleaner debugging output. RU yields stronger mathematical intuition and richer conceptual density. Mixing them within a single layer introduces translation noise that degrades S_team.
**Applies to:** ALL roles
**Tier:** T3 (agent-prompt checklist)

---

### BL-9: Interface Contracts Between Roles Reduce |Bi - Bj| [UNIVERSAL]
**Source:** Framework invariant (S_team formula)
**Rule:** When two roles interact, define an explicit interface contract: what format the output has, what the receiver expects, what constitutes a valid handoff. Document it before work begins.
**Why:** S_team = 1 - (2/n(n-1)) * Sum|Bi-Bj|. The |Bi-Bj| term shrinks when agents share a common understanding of inputs and outputs. Without contracts, each agent fills ambiguity with assumptions, and assumptions diverge. Explicit contracts are the cheapest way to increase S.
**Applies to:** ALL roles (especially Builder-Validator and Analyst-Builder pairs)
**Tier:** T3 (agent-prompt checklist)

---

### BL-10: Multiplicative Structure Means Zero Tolerance for Zero Components [UNIVERSAL]
**Source:** Framework invariant (Formula B, Weak Link Principle)
**Rule:** Before generating any output, run the Activation Operator (A_F, A_E, A_sigma, A_Lambda). If ANY component scores below 0.3, invoke Andon. Do not compensate a weak component by strengthening others.
**Why:** B = F^w1 * E^w2 * (1-sigma)^w3 * Lambda^w4. A single zero factor kills the product regardless of how strong the others are. This is not additive -- you cannot "make up" for zero focus with vast experience. The weak link determines the ceiling.
**Applies to:** ALL roles
**Tier:** T3 (agent-prompt checklist)

---

### BL-11: Scope Creep Is Muda [UNIVERSAL]
**Source:** Framework invariant (TPS Integration, Pre-Commit checklist)
**Rule:** Every change must correspond to the defined task scope. If you discover additional work during implementation, log it as a separate task -- do not fold it into the current commit.
**Why:** Scope creep is Muda (waste) in TPS terms. It muddies the commit history, makes rollback harder, increases blast radius, and degrades E (alignment) because the output no longer matches the original intent. Small, scoped changes are cheaper to verify, revert, and learn from.
**Applies to:** Builder, Analyst
**Tier:** T3 (agent-prompt checklist)

---

### BL-12: Hansei Targets Process, Not People [UNIVERSAL]
**Source:** Framework invariant (TPS Hansei, RT-3 acceptance)
**Rule:** In every RT-3, the Hansei question is "Why did our PROCESS produce this result?" -- never "Who made this mistake?"
**Why:** Blame-oriented retrospectives suppress Andon signals in future rounds. If agents fear blame, they hide problems instead of surfacing them. Process-oriented reflection improves the system for all future cycles. The goal is to fix the machine, not punish the operator.
**Applies to:** ALL roles (led by Coherencer)
**Tier:** T3 (agent-prompt checklist)

---

### BL-13: Yokoten — One Lesson, All Analogous Cases (+ Grep Gate) [UNIVERSAL]
**Source:** Framework invariant (TPS Yokoten) + Cycle-7 incident #8 (dialog dedup fix applied to one site, 3 missed)
**Rule:** When a lesson is learned from an incident, propagate it horizontally to ALL analogous contexts. After every fix commit, grep the codebase for analogous patterns. A single-site fix is incomplete by definition. Log grep results and either fix all sites or document why each non-fix is safe.
**Why:** A bug found in one API endpoint likely exists in sibling endpoints built from the same template. Fixing only the discovered instance leaves n-1 copies of the same defect. Yokoten converts a point fix into a systemic improvement, raising Lambda for the entire team.
**Applies to:** Coherencer (gate owner), Builder (grep execution), Validator (verify completeness), Analyst (propagation scope)
**Tier:** T2 (hook / CI / lint)

---

### BL-15: The 2% Spiral Gap Is a Feature [UNIVERSAL]
**Source:** Framework invariant (Spiral Gap, Section IX)
**Rule:** Accept that each cycle leaves approximately 2% unresolved. Record these open questions in the A3 template. Do not force closure on genuinely open problems.
**Why:** (pi-3)^2 ~ 0.02. Perfect closure is a mathematical impossibility in iterative systems. The residual is the fuel for the next spiral turn. Forcing premature closure creates false confidence (dogmatic collapse, B->1). Honest open questions are more valuable than dishonest answers.
**Applies to:** ALL roles (especially Visionary and Coherencer)
**Tier:** T4 (docs-only, conceptual constant)

---

### BL-16: Reading the Framework ≠ Applying the Framework [UNIVERSAL]
**Source:** A/B experiment — real-world deployment session analysis (5-agent RT, April 2026)
**Rule:** A bootstrap prompt that says "read the framework and proceed" results in 95% solo Builder behavior. The agent reads about Round Tables, classifies XL correctly, then ignores everything and writes code directly. The fix: bootstrap must declare META identity, mandate Agent tool delegation, and include explicit INVARIANT against skipping RT-1.
**Why:** Claude's default attractor is "helpful solo assistant." Without an explicit identity override ("You are META-Orchestrator, you NEVER write code"), the framework becomes informational context rather than binding protocol. Knowledge without enforcement = Lambda zero (BL-4 recursive application).
**Applies to:** META-Orchestrator (session bootstrap), all roles (awareness of the failure mode)
**Tier:** T3 (agent-prompt checklist)

---

### BL-17: Pre-Generate Verification — check format, spec, sources FIRST [UNIVERSAL]
**Source:** META Hansei ODTOE articles session + META Hansei 2026-04-20 framework-improvements (merged BL-21 format-spec-as-input here).
**Tier:** T3 (checklist in Builder + Analyst prompts)
**Rule:** Before generating any artifact (article, code, config, deliverable, report), verify format, formulas, sources, and consistency FIRST. Read the reference template, check critical domain-specific values, validate bibliography, verify format specification — BEFORE writing. Format specs are INPUTS, not afterthoughts. Load the reference format as Step 0 of any generation task. Post-generation checking catches errors but costs 2-3× more effort to fix than preventing them; format drift specifically costs 10× more after completion than pre-load.
**Why:** The ODTOE research article was generated with wrong format (missing comment groups, \hrule between sections, wrong keywords format), requiring complete rewrite. If the reference template had been read BEFORE generation, all issues would have been prevented. Generalizes: any generated artifact with a known reference format must load that format before generation.
**Applies to:** Builder (Check-First pipeline), Analyst (include format spec in decomposition), Validator (pre-generation review), META (enforce Check-First).

---

### BL-18: Session Scope Must Be Formally Reclassified at 2x Initial Estimate [UNIVERSAL]
**Source:** META Hansei — session grew from M to XL without reclassification
**Rule:** If cumulative work exceeds 2x the initial task classification estimate (e.g., started as M but spawned 80+ agents), STOP and formally reclassify. Graduated: 1.5x = YELLOW (log warning, continue with monitoring), 2x = RED (mandatory stop and reclassify). Announce the new classification and adjust team structure accordingly.
**Why:** Scope creep without reclassification means the process is undersized for the actual work. The META-Orchestrator continues running M-level protocols for XL-level work, resulting in insufficient RT cycles and oversight.
**Applies to:** META-Orchestrator, Coherencer (scope monitoring)
**Tier:** T3 (agent-prompt checklist)

---

### BL-19: Bilingual Files Must Be Created and Updated Simultaneously [UNIVERSAL]
**Source:** META Hansei — eradev_RU.md created at v7.0, eradev.md updated to v7.1, sync audit found 5 HIGH issues
**Rule:** When creating or updating a file that has a bilingual counterpart (RU/EN), ALWAYS update BOTH versions in the same operation. Never create an EN file without its RU pair (or vice versa). Never update one without the other.
**Why:** Creating pairs sequentially guarantees immediate desynchronization. The sync audit found eradev_RU.md missing 4 entire sections that existed in eradev.md. Every bilingual pair created without simultaneous sync is technical debt that compounds.
**Applies to:** ALL roles, META-Orchestrator (enforce bilingual sync rule)
**Tier:** T2 (hook / CI / lint)
**Hook:** `.githooks/bl19-bilingual-sync.sh` (added 2026-04-25, RT-7 NEXT-B1, closes L-52 Tier-claim falsification on BL-19). Pairs covered: eradev.md↔eradev_RU.md, meta.md↔meta_RU.md, LOADING_PROTOCOL.md↔LOADING_PROTOCOL_RU.md, roles/*_EN.md↔roles/*.md, templates/domain_skin.{type}.md↔templates/domain_skin.{type}_RU.md. Override: `BL19_OVERRIDE=1` env var (logged) or `git commit --no-verify`.

---

### BL-22 sub-(b): Baseline Health Check [UNIVERSAL extension]
**Source:** 2026-04-25 audit (`reports/rt1_pre_flight_test_audit_2026-04-25.md`) — operator pattern "сделай проверки перед началом" exposed missing baseline-health gate for non-API tasks.
**Rule:** Any task with executable `verify.method` (build / cite_check / parse / recompute / structure_check / etc.) MUST run baseline verification on current HEAD before RT-1; baseline FAIL → P0-baseline RT-1 BEFORE operator's task. Non-executable methods (readability / dry_run / flux_check / doc_alignment) skip baseline (no executable test surface). Operator override: "skip-baseline" trigger word in task description bypasses (logged to lessons.md).
Output: `reports/baseline-{TASK_ID}-{DATE}.md` with PASS/FAIL summary and sample errors.
**Why:** Operator's pattern "сделай проверки перед началом" addresses the "built on broken main" failure mode. Without baseline gate, RT-1 may converge on plan that's already broken upstream. Cost ~30-60s (single verify run); eliminates entire failure class.
**Applies to:** Analyst (RT-1 baseline run), META (enforce gate at Session Entry items 5c + 8)
**Tier:** T3 (checklist + Session Entry item enforcement)
**Note:** Full BL-22 entry (including code-adapter sub-(a) for external APIs) lives in `BOOTSTRAP_LESSONS_code_adapter.md`. This is the universal extension for non-API tasks.

---

### BL-26: META Always Delegates — No Exceptions [UNIVERSAL]
**Source:** Cycle-7 + incident L-016 + gravity hansei — 100% correlation across 5 sessions: delegation = success, direct coding = failure
**Rule:** META ALWAYS delegates via Agent tool, regardless of task size. S-tasks: spawn Builder + Validator agents. M+ tasks: spawn full 5-role team. No "quick fix" exception exists. The S-task loophole ("classify it S to code it directly") is eliminated — it trained the pattern of pipeline bypass. P0 production incidents declared by operator are the sole exception; post-incident Hansei is mandatory.
**Why:** META bypassing its own pipeline is the recursive Lambda problem: the enforcer stops enforcing. The deployment session started with "just fix this small thing" and ended with 2.5 hours of solo coding. S-task delegation costs seconds (one Agent call); the behavioral precedent of skipping it costs entire sessions.
**Applies to:** META-Orchestrator (absolute self-constraint), Coherencer (monitor for any direct META output not in the 5 permitted types), Validator (reject any META-authored artifact)
**Tier:** T2 (hook / CI / lint)

**Also covers diagnostic Bash:** grep, curl, ssh, psql, redis-cli, jq are diagnostic tools. When META needs to inspect code or query services: (1) formulate a specific question, (2) spawn Check Agent (any role) with that question, (3) receive structured yes/no answer. "I'll just grep quickly" → diagnostic drift → META becomes debugger. Hook enforces this at Layer 2.

**Hook implementation (rt12 Wave Prune, ODTOE F4 closure):** `.claude/hooks/enforce-delegation.sh` is the PreToolUse guard. Subagents (`agent_id` present) bypass; main-session META is constrained. The deny-list overrides the whitelist for framework files — META cannot Edit/Write any of:
- `CLAUDE.md`, `eradev.md`, `eradev_RU.md`, `meta.md`, `meta_RU.md`, `FOUNDATIONS.md`, `LOADING_PROTOCOL.md`, `BOOTSTRAP_LESSONS*.md`
- `roles/*.md`, `templates/*.md`
- `.claude/hooks/*.sh`, `.githooks/*.sh`, `scripts/*.sh`
- `.claude/skills/eradev/**/*.md` (skill mirror)

Whitelist (META outputs only): `reports/*.md`, `projects/*/lessons.md`, `memory/*.md`, `MEMORY.md`, `BL_CANDIDATES.md`. Emergency override: `ERADEV_HOOKS_DISABLED=1` (P0 only; post-incident Hansei mandatory per CLAUDE.md Inv 8). Source: ODTOE F4 — 5 direct META Edit/Write calls at 11:50–11:56 to Hansei/lessons/CLAUDE.md right after operator critique #117 (`reports/rt11_meta_audit_odtoe_session_2026-04-26.md`).

---

### BL-28: Agent Prompt Must Include Explicit Context [UNIVERSAL]
**Source:** Hansei — gravity session (April 2026), agents refused roleplay due to insufficient directive. v9 amendment: self-loading semantics per CLAUDE.md Invariant 12 + self-loading context architecture
**Rule:** Every Agent tool call MUST (1) instruct the agent to self-load its role file via Read as its FIRST action, (2) name the role file path in the prompt (e.g., "Read roles/builder_EN.md, apply Activation Operator"), (3) NOT embed role file content into META's context, (4) provide concrete task description + explicit file paths to read + expected output format + project config. The agent is a subprocess with blank context — it self-loads the role file, META names the path. Truncating or embedding the role file in META's prompt is a v9 violation.
**Why:** Self-loading keeps META context lean and prevents version drift across parallel agents — each agent Reads the current role file state, not a META-embedded snapshot that may be stale by the time a later agent spawns. v8 (pre-v9) used the "embed full file" pattern to guarantee context; v9 Invariant 12 replaces it with path-naming + agent-side self-load, which both saves tokens and ensures every agent sees the single source of truth on disk. The original failure mode (three of five RT-1 agents refused to work in the gravity session because the prompt said "act as Visionary" without a directive to read the role file) is still covered: the prompt must explicitly name the path and instruct the Read action as step 1.
**Applies to:** META-Orchestrator (agent spawning), all roles (when delegating sub-tasks)
**Tier:** T3 (agent-prompt checklist)

**v10 extension (architectural rework framing):** When operator framing matches BL-35 trigger regex during an active refactor window, the spawned [VALIDATOR] prompt MUST include a section `## Operator rework framing: <verbatim quote>` reproducing the operator's literal words. Without this section, Validator may mis-scope the risk matrix to a generic review instead of a BL-49 rework-discipline audit. META-Orchestrator enforces at Agent spawn; operator rework framings are load-bearing context, not stylistic noise. See Invariant 16 and meta.md §14 item 7b.

---

### BL-29: Verify Established Terminology Before Generating [UNIVERSAL]
**Source:** Hansei — gravity session (April 2026), terminology drift across parallel Builder outputs
**Rule:** Before generating any artifact for an existing project, grep/read the project's existing outputs to identify established terminology, naming conventions, and notation patterns. Use them exactly. Do not invent new terms, transliterations, or abbreviations when the project already has established ones.
**Why:** Three Builders working in parallel each chose different transliterations and notation styles, creating inconsistencies that required manual cleanup. The cost of reading existing conventions first is seconds; the cost of harmonizing divergent terminology after generation is hours. This generalizes beyond articles to code (variable naming, API conventions), docs (glossary terms), and configs (key naming patterns).
**Applies to:** Builder (pre-generation check), Validator (terminology consistency audit), Coherencer (cross-Builder sync)
**Tier:** T3 (agent-prompt checklist)

**Phantom DECOHERENCE (v9 Wave 9 extension, symmetric to BL-5 phantom coherence):**
When S_team is low but B_mean is high, the team may not be disagreeing on substance — they may be using different terminology for the same concept. This is the symmetric failure of phantom coherence. Coherencer MUST:

1. Before declaring "team disagrees", run a glossary unification pass: extract key terms each role uses, check for synonyms, translate across terminology systems (code vs paper vs mathematical formalism).
2. If synonym analysis reduces the disagreement surface by ≥40%, re-score S_team on the unified terminology. Report both original S_team and unified S_team in the Coherencer output.
3. If disagreement persists after glossary unification, it's genuine divergence — escalate to Visionary for scope re-derivation.

**Symptom of phantom decoherence:** S_team < 0.5 AND B_mean ≥ 0.7 AND pair-wise role outputs share entities but disagree on predicates.
**Source:** v9 Wave 9 ODTOE mining — `reports/v9_odtoe_multiagent_mining_2026-04-11.md` REC-2, derived from `ODTOE_multiagent_coherence.md` §III.8.

**Phantom NEWNESS (RT-10 Wave A B2 / L-58 / PN-1, sister of phantom decoherence on the time axis):**
Symmetric to phantom decoherence: an agent proposes a "new" L-N / EMP-N / BL-N / Invariant entry whose substance is already documented in the knowledge base. Source: RT-9 phantom-newness audit (2026-04-25) — 12.9 % genuine-novelty rate (4 / 31 proposals); operator caught L-A9 as exact duplicate of L-1 (2026-04-04). Without a pre-grep step, every fresh session repeats BL-16 (knowledge without enforcement = Lambda zero) recursively. Mandatory pre-grep before any new ID proposal — match keywords / nouns / verbs of the proposed title against `lessons.md`, `lessons_archive.md`, `BOOTSTRAP_LESSONS.md`, `eradev.md`, `FOUNDATIONS.md`, `projects/*/lessons.md`. If overlap found: re-frame as extension (L-50 supersede / temporal triple) instead of fresh ID. Enforcement: T2 pre-commit hook `.githooks/phantom-newness-check.sh` (PN-1) chained from `.githooks/pre-commit`. Override: `PN_OVERRIDE=1`, `--phantom-checked` sentinel in commit message, or `ERADEV_HOOKS_DISABLED=1`.

---

### BL-30: Defense-In-Depth for Enforcement [UNIVERSAL]
**Source:** v8 session — 3-layer identity enforcement design (CLAUDE.md + hook + memory persistence)
**Rule:** Any critical enforcement mechanism must have at least 2 independent layers. A single enforcement point is a single point of failure. If the mechanism can be bypassed by skipping one file/step, add redundant layers.
**Why:** CLAUDE.md alone failed (deployment test: 95% solo). Hook alone can be bypassed. Memory alone is informational. Three layers together create defense-in-depth where any single layer failing leaves two active.
**Applies to:** META-Orchestrator (identity), Validator (verification gates), Builder (build checks)
**Tier:** T3 (agent-prompt checklist)

---

### BL-31: Constrain Output Types to Constrain Behavior [UNIVERSAL]
**Source:** v8 session — META Output Specification (5 permitted types)
**Rule:** When a role drifts from its mandate, enumerate its permitted output types and reject all others. Do not "remind harder" — type-constrain. If META can only produce 6 output types (Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent), it structurally cannot produce code.
**Why:** Behavioral reminders ("don't code") lose to the default attractor. Structural constraints (typed outputs) survive because the violation is detectable: "this output is not one of the 6 types." Constraint > policing.
**Applies to:** ALL roles (each role should have a defined output type set)
**Tier:** T3 (agent-prompt checklist)

---

### BL-32: Grep After BL Merge — Reference Cleanup [UNIVERSAL]
**Source:** Hansei v8 session — BL-27 stale references found in 5 files after merge into BL-6
**Rule:** After merging BL entries (e.g., BL-13+BL-23 → BL-13), immediately grep the entire repo for all old BL-N references. Replace orphan references with the merged BL-N ID. Commit reference cleanup in the same commit as the merge.
**Why:** BL numbers are referenced across 20+ files (CLAUDE.md, SKILL.md, eradev.md, role files, reports). Merging without grepping creates Lambda gaps: agents encounter "BL-27" but find no definition. The cost of grepping is seconds; the cost of stale refs is agent confusion (A_F collapse).
**Applies to:** META-Orchestrator (merge execution), Coherencer (verify completeness), Validator (post-merge audit)
**Tier:** T3 (agent-prompt checklist)

---

### BL-33: Enforcement-Tier Ladder — type > hook > checklist > docs [UNIVERSAL]
**Source:** PLUGY Session 5 EMP6 (type-level > policy-level > review-tier > operator-vigilance); META Hansei 2026-04-20 framework-improvements synthesis.
**Tier:** T2 (pre-commit hook on BOOTSTRAP_LESSONS.md — see .claude/hooks/bl-tier-check.sh)
**Rule:** Every new BL or invariant MUST declare its enforcement tier on a `Tier:` line. Preference order when authoring a rule: **T1 type-level / schema / compile-time** (bug unconstructible) > **T2 automated check** (pre-commit hook / CI lint / pre-merge gate) > **T3 checklist** in agent prompt (awareness, review-time catch) > **T4 .md description only** (documentation, operator vigilance). A rule that lives only at T4 is effectively Lambda=0 for any recurring bug class (BL-16 recursive). Bugs that recur 2+ times under a T3/T4 rule are flagged for tier-upgrade review; the upgrade path template is "can this be a type? if no, can it be a hook? if no, can it be a checklist?"
**Why:** PLUGY 19-bug burst (2026-04-18..04-20): 6/6 bug classes had project-local rules in form 1 (docs) — ZERO had form 3 (hook/CI). All 6 rules were Lambda-zero per BL-16. BL-50 (DeliverableText newtype) proved that tier-1 (compile-time) enforcement makes a whole class of bugs unconstructible — which is categorically stronger than any policy or review.
**Applies to:** META (authoring rules), Coherencer (crystallizing lessons), Validator (reviewing BL proposals), Builder (picking enforcement mechanism).

---

### BL-34: Composition Hazards Gate for ≥2 parallel refactors [UNIVERSAL]
**Source:** PLUGY Hansei 2026-04-20 §6 (hazards H1-H6 enumerated before any Builder spawn prevented big-bang failure); generalizes Invariant 7 (commit-size >5 files = RT-2) from commit-level to ROADMAP-pivot-level.
**Tier:** T2 (pre-commit hook — see .claude/hooks/rt1-composition-gate.sh; path-glob accepts BOTH absolute AND relative paths since 2026-04-26 RT-12 Pareto-prune B2, closing L-52 falsification recurrence — previous case-pattern `*/reports/rt1_*.md` silently no-op'd on relative paths from agent Write calls)
**Rule:** Before spawning any Builder work on a plan touching 2+ independent refactors in the same release window, Visionary MUST author a composition-hazards grid (glossary canonical term: **"cross-phase coupling risk"** — see glossary.md #47; "composition hazard" is the project-local alias). Minimum pairs: N·(N-1)/2. For N ≥ 3: add all 3-way combinations. Each grid entry has: impact, precondition, mitigation, sequencing constraint. Missing grid on ≥2-refactor plan = RED on A_F for Visionary; Coherencer REJECTS RT-1 synthesis. Output artifact: `reports/composition-hazards-<date>.md` using `templates/composition_hazards.template.md`. Hazards form hard edges in the sequencing DAG — parallel ship is forbidden until a pairwise mitigation is declared.
**Why:** PLUGY proposed 10 refactors (R1-R10) across 4 months; hazards H1-H6 (R4 double-rewrite, R2+R5 silent-protector recurrence, R1+R7 PII exposure, R6+R7 FZ-152 exposure, R3+R4 guard-on-guard cascade, R2+R6 classifier duplication) would have produced 3 production incidents if shipped in parallel without enumeration.
**Applies to:** Visionary (grid author), Coherencer (RT-1 synthesis gate), META (enforce before Builder spawn), Validator (verify grid completeness at G2 gate).

---

### BL-35: Rework-discipline audit on "architectural rework" framing [UNIVERSAL]
**Source:** PLUGY BL-49 Session 5 promoted UNIVERSAL — operator said "полностью менять архитектуру" mid-flight during active Phase Q pivots; literal reading = big-bang = H1/H2/H5 fire simultaneously.
**Tier:** T1-enforced (operator-message regex detector — see .claude/hooks/rework-framing-detector.sh; UserPromptSubmit hook exits 2 BLOCKING when trigger matches AND active pivot window detected, **with rhetorical/conditional/past-tense discrimination guard**: hook exits 0 advisory when message contains question mark OR rhetorical markers («стоит ли», «надо ли», «или нет», «should we», «is it worth») OR past-tense markers («вчера», «уже менял», «yesterday», «previously») UNLESS imperative override present («!», «сделай», «do it», «now»); override via `ERADEV_HOOKS_DISABLED=1` or explicit operator authorization. RT-12 PRUNE-B1 2026-04-26 added guard to neutralize 30-50% live FP rate from perpetual-pivot window.)
**Rule:** When operator declares "the architecture is wrong" / "full rework" / "from scratch" / "менять архитектуру" / "полностью менять" / "completely change" DURING active pivots, META MUST NOT interpret as "reset everything." Mandatory sequence: (1) spawn Validator FIRST with risk-matrix task; (2) re-validate project NO-GO list against operator's literal request; (3) enumerate composition hazards per BL-34; (4) propose INTERLOCKED SEQUENCE (one pivot at a time with parity windows, kill-switches, shadow-mode) — never a parallel menu; (5) produce `reports/hansei-architectural-rework-<date>.md` using `templates/interlocked_sequence.template.md`; (6) operator sign-off on decision matrix (OD-1..OD-N) BEFORE any Builder spawns. Operator frustration during active pivot = class-shift DETECTOR at ROADMAP level, NOT a permission to parallelize. The Hansei itself breaks any implicit BL-3 chain.
**Why:** Under outage stress, operator psychology favors "reset everything" framing. Without the audit, META reads it literally as "ship all refactors in parallel" — the most dangerous composition possible. PLUGY 2026-04-20 Hansei proved the audit reshaped 10 proposed refactors into a 4-month interlocked sequence with ≥3× BD ROI vs the parallel alternative.
**Applies to:** META (trigger detection + Validator spawn ordering), Validator (risk-matrix authorship), Coherencer (Hansei synthesis + interlock verification).

---

## BL Gap Map (this file only)

Gaps in this universal file, with the location of the missing BL:

| BL # | Status | Location |
|------|--------|----------|
| BL-2 | Code-adapter | `BOOTSTRAP_LESSONS_code_adapter.md` |
| BL-3 | Code-adapter | `BOOTSTRAP_LESSONS_code_adapter.md` |
| BL-6 | Code-adapter | `BOOTSTRAP_LESSONS_code_adapter.md` |
| BL-8 | Code-adapter | `BOOTSTRAP_LESSONS_code_adapter.md` (absorbed BL-14 rollback-plan on 2026-04-20) |
| BL-14 | Merged | MERGED INTO BL-8 (2026-04-20): rollback-plan consolidated into deployment-event checklist |
| BL-20 | Retired | RETIRED 2026-04-20: content lifted to meta.md §13 MM3 (Adversarial bootstrap testing) |
| BL-21 | Merged | MERGED INTO BL-17 (2026-04-20): format-spec-as-input consolidated into pre-generate verification |
| BL-22 | Hybrid (sub-(a) code-adapter + sub-(b) universal extension above, 2026-04-25) | `BOOTSTRAP_LESSONS_code_adapter.md` (full entry) + sub-(b) inline above |
| BL-23 | Retired | Merged/retired (see BOOTSTRAP_LESSONS.md budget header) |
| BL-24 | Code-adapter | `BOOTSTRAP_LESSONS_code_adapter.md` |
| BL-25 | Code-adapter | `BOOTSTRAP_LESSONS_code_adapter.md` |
| BL-27 | Retired | Merged into BL-6 (per BL-32 reference cleanup lesson) |

**Totals in this file:** 23 Universal BL entries (20 pre-Phase-1 - 2 retired/merged + 3 new BL-33/34/35 + BL-17 absorbed BL-21).
**Active count:** 23 universal + 7 code-adapter = 30 active BL (BL-14, BL-20, BL-21, BL-23, BL-27 retired/merged; BL-33, BL-34, BL-35 added).

---

*Split generated 2026-04-11 by EraDev v9 Phase 1.D [COHERENCER]. Source of truth for tagging: `reports/v9_phase0b_tagging_2026-04-11.md` (Builder) + this file (Coherencer).*
