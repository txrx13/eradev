# Shared Lambda Bootstrap -- Universal Lessons for Cold Start

> Loaded when MEMORY.md is empty (Lambda has no project-specific grounding).
> These lessons act as Lambda=0.5 bootstrap: not zero (blind), not high (overfit).
> Source: framework invariants, A/B experiments, RT post-mortems.
> Budget cap: maximum 30 BL entries (current count: 30). Adding BL-N requires merging or retiring existing entries first.

---

### BL-1: Lambda=0.5 as Cold-Start Default [UNIVERSAL]
**Source:** Framework invariant (ODTOE Formula B)
**Rule:** When MEMORY.md is empty, set Lambda=0.5 for all agents -- never 0.
**Why:** Lambda=0 makes the entire B product collapse to zero (multiplicative structure). An agent with zero experience is formally dead. 0.5 is the honest prior: "I have no project memory, but I carry framework knowledge." As project memory accumulates, Lambda adjusts toward observed values.
**Applies to:** ALL roles

---

### BL-2: Protocol Changes Require Canary Deployment [CODE-ADAPTER]
**Source:** RT analysis (multiple post-mortems)
**Rule:** Any change to protocol, infrastructure, or communication layer MUST go through canary deployment with a 30-minute monitoring window before full rollout.
**Why:** Protocol changes have unbounded blast radius. A broken protocol silently corrupts all downstream agents and outputs. Canary constrains the damage surface and gives time for D(eta) to manifest visibly.
**Applies to:** Builder, Validator, Analyst

---

### BL-3: Fix Chain > 3 = Structural Problem [CODE-ADAPTER]
**Source:** Framework invariant (CHECKLIST fix chain counter)
**Rule:** If 3 or more consecutive fixes occur in sequence, STOP. Do not attempt fix number 4. Return to the specification and re-run RT-1.
**Why:** Three consecutive fixes signal a structural defect, not an execution error. Each fix patches a symptom; the root cause lives upstream. Continuing the fix chain compounds technical debt exponentially. The correct action is Andon: stop the line, find the real constraint (TOC Phase 1).
**Applies to:** Builder, Validator

---

### BL-4: S_adjusted = S_team x B_mean [UNIVERSAL]
**Source:** Framework invariant (ODTOE collective formulas)
**Rule:** Never use raw S_team alone to judge team health. Always compute S_adjusted = S_team x B_mean, where B_mean is the arithmetic mean of all agent B values.
**Why:** S_team measures agreement, not quality. Five agents can perfectly agree on the wrong answer (S=1.0, B_mean=0.2, S_adjusted=0.2). Without the B_mean multiplier, high coherence masks low competence.
**Applies to:** Coherencer, Validator

---

### BL-5: Phantom Coherence Detection [UNIVERSAL]
**Source:** A/B experiment (RT analysis)
**Rule:** When S_team > 0.8 but B_mean < 0.4, flag PHANTOM COHERENCE. Do not proceed. Trigger Kill-Switch level 2 ("Challenge premise").
**Why:** High agreement among low-quality agents is the most dangerous configuration. It feels productive -- everyone agrees, output flows quickly -- but the team is synchronized around a flawed model. This is the false-signal trap: confidence without competence. The antidote is managed dissonance, not more consensus.
**Applies to:** Coherencer, Validator, Visionary

---

### BL-6: Verify Before Act — Artifact Validity Gate [CODE-ADAPTER]
**Source:** Framework invariant (Activation Operator Step 1-3) + META Hansei Cycle 2 L-017
**Rule:** Before modifying or committing any artifact, verify its current state. Read the file, check the endpoint, confirm the configuration. Before any artifact (code, document, config) can be committed, Builder MUST run the relevant validity check (compile, lint, parse, render) and attach output as proof. An artifact that "looks correct" but was never validated is treated as unverified — commit REJECTED, counted as fix in fix_rate.
**Why:** Stale mental models are the top source of (1-sigma) collapse. "It compiles in my head" is the #1 source of unverified artifacts. Verification costs seconds; a wrong assumption or uncompiled artifact costs a full fix chain (5-10 commits).
**Applies to:** Builder (run validity check + verify state), Validator (require proof artifact), Analyst (verify endpoints pre-RT-1), META (enforce gate)

---

### BL-7: EN for Practical Tasks, RU for Theoretical Depth [UNIVERSAL]
**Source:** A/B experiment (Language Policy, eradev.md Section 0)
**Rule:** Use English for agent communication, interface contracts, debugging, and execution prompts. Use Russian for theoretical deepening, mathematical derivations, and conceptual exploration. Cross-project lessons are always in EN.
**Why:** A/B testing showed EN yields better tool coverage, more consistent interface contracts, and cleaner debugging output. RU yields stronger mathematical intuition and richer conceptual density. Mixing them within a single layer introduces translation noise that degrades S_team.
**Applies to:** ALL roles

---

### BL-8: Feature Flag Toggle = Deployment Event [CODE-ADAPTER]
**Source:** RT analysis (Pre-Deploy checklist)
**Rule:** Toggling a feature flag is a deployment event. It requires the same Pre-Deploy checklist as a code deploy: rollback plan, health check, monitoring window.
**Why:** A feature flag flip changes production behavior identically to a code deploy -- users see different code paths. Treating it as "just a config change" bypasses the safety net that catches regressions. Every behavioral change in production, regardless of mechanism, is a deployment.
**Applies to:** Builder, Validator, Analyst

---

### BL-9: Interface Contracts Between Roles Reduce |Bi - Bj| [UNIVERSAL]
**Source:** Framework invariant (S_team formula)
**Rule:** When two roles interact, define an explicit interface contract: what format the output has, what the receiver expects, what constitutes a valid handoff. Document it before work begins.
**Why:** S_team = 1 - (2/n(n-1)) * Sum|Bi-Bj|. The |Bi-Bj| term shrinks when agents share a common understanding of inputs and outputs. Without contracts, each agent fills ambiguity with assumptions, and assumptions diverge. Explicit contracts are the cheapest way to increase S.
**Applies to:** ALL roles (especially Builder-Validator and Analyst-Builder pairs)

---

### BL-10: Multiplicative Structure Means Zero Tolerance for Zero Components [UNIVERSAL]
**Source:** Framework invariant (Formula B, Weak Link Principle)
**Rule:** Before generating any output, run the Activation Operator (A_F, A_E, A_sigma, A_Lambda). If ANY component scores below 0.3, invoke Andon. Do not compensate a weak component by strengthening others.
**Why:** B = F^w1 * E^w2 * (1-sigma)^w3 * Lambda^w4. A single zero factor kills the product regardless of how strong the others are. This is not additive -- you cannot "make up" for zero focus with vast experience. The weak link determines the ceiling.
**Applies to:** ALL roles

---

### BL-11: Scope Creep Is Muda [UNIVERSAL]
**Source:** Framework invariant (TPS Integration, Pre-Commit checklist)
**Rule:** Every change must correspond to the defined task scope. If you discover additional work during implementation, log it as a separate task -- do not fold it into the current commit.
**Why:** Scope creep is Muda (waste) in TPS terms. It muddies the commit history, makes rollback harder, increases blast radius, and degrades E (alignment) because the output no longer matches the original intent. Small, scoped changes are cheaper to verify, revert, and learn from.
**Applies to:** Builder, Analyst

---

### BL-12: Hansei Targets Process, Not People [UNIVERSAL]
**Source:** Framework invariant (TPS Hansei, RT-3 acceptance)
**Rule:** In every RT-3, the Hansei question is "Why did our PROCESS produce this result?" -- never "Who made this mistake?"
**Why:** Blame-oriented retrospectives suppress Andon signals in future rounds. If agents fear blame, they hide problems instead of surfacing them. Process-oriented reflection improves the system for all future cycles. The goal is to fix the machine, not punish the operator.
**Applies to:** ALL roles (led by Coherencer)

---

### BL-13: Yokoten — One Lesson, All Analogous Cases (+ Grep Gate) [UNIVERSAL]
**Source:** Framework invariant (TPS Yokoten) + Cycle-7 incident #8 (dialog dedup fix applied to one site, 3 missed)
**Rule:** When a lesson is learned from an incident, propagate it horizontally to ALL analogous contexts. After every fix commit, grep the codebase for analogous patterns. A single-site fix is incomplete by definition. Log grep results and either fix all sites or document why each non-fix is safe.
**Why:** A bug found in one API endpoint likely exists in sibling endpoints built from the same template. Fixing only the discovered instance leaves n-1 copies of the same defect. Yokoten converts a point fix into a systemic improvement, raising Lambda for the entire team.
**Applies to:** Coherencer (gate owner), Builder (grep execution), Validator (verify completeness), Analyst (propagation scope)

---

### BL-14: Rollback Plan Before Deploy, Not After [CODE-ADAPTER]
**Source:** RT analysis (Pre-Deploy checklist)
**Rule:** Document the rollback procedure BEFORE executing any deployment. If you cannot describe how to undo a change, you do not have permission to make it.
**Why:** Under incident pressure, cognitive load peaks and decision quality drops. A pre-written rollback plan is executed mechanically when needed, bypassing the degraded decision-making of a stressed team. Writing it beforehand also forces you to verify that rollback is actually possible.
**Applies to:** Builder, Analyst, Validator

---

### BL-15: The 2% Spiral Gap Is a Feature [UNIVERSAL]
**Source:** Framework invariant (Spiral Gap, Section IX)
**Rule:** Accept that each cycle leaves approximately 2% unresolved. Record these open questions in the A3 template. Do not force closure on genuinely open problems.
**Why:** (pi-3)^2 ~ 0.02. Perfect closure is a mathematical impossibility in iterative systems. The residual is the fuel for the next spiral turn. Forcing premature closure creates false confidence (dogmatic collapse, B->1). Honest open questions are more valuable than dishonest answers.
**Applies to:** ALL roles (especially Visionary and Coherencer)

### BL-16: Reading the Framework ≠ Applying the Framework [UNIVERSAL]
**Source:** A/B experiment — real-world deployment session analysis (5-agent RT, April 2026)
**Rule:** A bootstrap prompt that says "read the framework and proceed" results in 95% solo Builder behavior. The agent reads about Round Tables, classifies XL correctly, then ignores everything and writes code directly. The fix: bootstrap must declare META identity, mandate Agent tool delegation, and include explicit INVARIANT against skipping RT-1.
**Why:** Claude's default attractor is "helpful solo assistant." Without an explicit identity override ("You are META-Orchestrator, you NEVER write code"), the framework becomes informational context rather than binding protocol. Knowledge without enforcement = Lambda zero (BL-4 recursive application).
**Applies to:** META-Orchestrator (session bootstrap), all roles (awareness of the failure mode)

### BL-17: Pre-Generate Verification Is Prevention; Post-Generation Checking Is Rework [UNIVERSAL]
**Source:** META Hansei — ODTOE articles session (April 2026)
**Rule:** Before generating any artifact (article, code, config), verify format, formulas, sources, and consistency FIRST. Read the reference format, check critical domain-specific values, validate bibliography — BEFORE writing. Post-generation checking catches errors but costs 2-3x more effort to fix than preventing them.
**Why:** The research article was generated with wrong format (missing comment groups, \hrule between sections, wrong keywords format), requiring complete rewrite. If the reference template had been read BEFORE generation, all format issues would have been prevented.
**Applies to:** Builder (Check-First pipeline), Validator (pre-generation review), META (enforce Check-First)

### BL-18: Session Scope Must Be Formally Reclassified at 2x Initial Estimate [UNIVERSAL]
**Source:** META Hansei — session grew from M to XL without reclassification
**Rule:** If cumulative work exceeds 2x the initial task classification estimate (e.g., started as M but spawned 80+ agents), STOP and formally reclassify. Graduated: 1.5x = YELLOW (log warning, continue with monitoring), 2x = RED (mandatory stop and reclassify). Announce the new classification and adjust team structure accordingly.
**Why:** Scope creep without reclassification means the process is undersized for the actual work. The META-Orchestrator continues running M-level protocols for XL-level work, resulting in insufficient RT cycles and oversight.
**Applies to:** META-Orchestrator, Coherencer (scope monitoring)

### BL-19: Bilingual Files Must Be Created and Updated Simultaneously [UNIVERSAL]
**Source:** META Hansei — eradev_RU.md created at v7.0, eradev.md updated to v7.1, sync audit found 5 HIGH issues
**Rule:** When creating or updating a file that has a bilingual counterpart (RU/EN), ALWAYS update BOTH versions in the same operation. Never create an EN file without its RU pair (or vice versa). Never update one without the other.
**Why:** Creating pairs sequentially guarantees immediate desynchronization. The sync audit found eradev_RU.md missing 4 entire sections that existed in eradev.md. Every bilingual pair created without simultaneous sync is technical debt that compounds.
**Applies to:** ALL roles, META-Orchestrator (enforce bilingual sync rule)

### BL-20: Adversarially Test Bootstrap Prompts Before Deployment [UNIVERSAL]
**Source:** META Hansei — deployment session used untested bootstrap
**Rule:** Before deploying a new bootstrap prompt (CLAUDE.md, README bootstrap, or any session-start instruction), run an adversarial test: give the bootstrap to an agent with a concrete task and verify it follows the protocol. Do NOT trust that "it looks right" — test it.
**Why:** The original 3-line bootstrap "looked reasonable" but produced 95% solo Builder behavior. Only the deployment session analysis (real-world failure) revealed the problem. Testing would have caught it before deployment.
**Applies to:** META-Orchestrator, Validator (bootstrap testing)

### BL-21: Format Specifications Are Inputs, Not Afterthoughts [UNIVERSAL]
**Source:** META Hansei — article format was checked AFTER generation, not BEFORE
**Rule:** When creating any formatted artifact (LaTeX article, markdown for website, config file), the format specification (reference file, template, style guide) must be loaded and verified BEFORE generation begins. It is Step 0, not Step N.
**Why:** Format drift is invisible during generation but expensive to fix after. Reading the reference format first takes 30 seconds; reformatting a completed article takes 30 minutes.
**Applies to:** Builder (format-first), Analyst (include format spec in decomposition)

### BL-22: PRE-FLIGHT Gate for External APIs [CODE-ADAPTER]
**Source:** Cycle-7 analysis — F=0 in 3/9 incidents (16/42 fixes traced to unverified endpoints)
**Rule:** Before RT-1 begins on any task involving external APIs, Analyst MUST curl-verify every endpoint the task depends on. Before DEPLOY, Validator MUST re-verify all endpoints against the production environment. Produce a VERIFIED ENDPOINTS artifact listing each URL, HTTP status, and response shape. Unverified endpoint = Builder BLOCK (RED on A_F) at RT-1, Validator BLOCK (RED on A_sigma) at deploy.
**Why:** Hallucinating that an endpoint exists, returns a certain schema, or behaves a certain way is the top source of F=0 collapse in boundary tasks. Verification costs seconds; a fix chain on a nonexistent endpoint costs 10+ commits.
**Applies to:** Analyst (RT-1 execution), Validator (deploy re-verification), Builder (must refuse to start without artifact), META (enforce gate)

### BL-24: Single-Responsibility Commits [CODE-ADAPTER]
**Source:** Cycle-7 — big bang commits (16 files, 14 files) made rollback catastrophic
**Rule:** One commit = one phase. A commit that touches >5 files from different modules requires RT-2 review before merge. If a single task produces changes across many modules, split into sequential commits by phase (e.g., schema first, then logic, then tests).
**Why:** Large cross-module commits have unbounded blast radius. When they break, you cannot revert one module without reverting all. Small, single-responsibility commits are cheap to revert, easy to bisect, and self-documenting.
**Applies to:** Builder (commit discipline), Validator (commit review gate), META (enforce at RT-2)

### BL-25: Error Path Coverage Matrix [CODE-ADAPTER]
**Source:** Cycle-7 — E=0 in 2/9 incidents (gossip protocol, badge system) due to missing error handling
**Rule:** For every server-side or boundary feature, Builder MUST cover 5 paths before marking complete: (1) happy path, (2) error/exception path, (3) timeout path, (4) restart/recovery path, (5) partial failure path. Validator checks coverage at RT-3.
**Why:** Happy-path-only code is demo code, not production code. Timeout and restart paths are where real systems fail. Covering all 5 paths at build time costs 20% more effort; discovering missing paths in production costs 10x.
**Applies to:** Builder (implementation), Validator (coverage check), Analyst (include paths in decomposition)

### BL-26: META Always Delegates — No Exceptions [UNIVERSAL]
**Source:** Cycle-7 + incident L-016 + gravity hansei — 100% correlation across 5 sessions: delegation = success, direct coding = failure
**Rule:** META ALWAYS delegates via Agent tool, regardless of task size. S-tasks: spawn Builder + Validator agents. M+ tasks: spawn full 5-role team. No "quick fix" exception exists. The S-task loophole ("classify it S to code it directly") is eliminated — it trained the pattern of pipeline bypass. P0 production incidents declared by operator are the sole exception; post-incident Hansei is mandatory.
**Why:** META bypassing its own pipeline is the recursive Lambda problem: the enforcer stops enforcing. The deployment session started with "just fix this small thing" and ended with 2.5 hours of solo coding. S-task delegation costs seconds (one Agent call); the behavioral precedent of skipping it costs entire sessions.
**Applies to:** META-Orchestrator (absolute self-constraint), Coherencer (monitor for any direct META output not in the 5 permitted types), Validator (reject any META-authored artifact)

**Also covers diagnostic Bash:** grep, curl, ssh, psql, redis-cli, jq are diagnostic tools. When META needs to inspect code or query services: (1) formulate a specific question, (2) spawn Check Agent (any role) with that question, (3) receive structured yes/no answer. "I'll just grep quickly" → diagnostic drift → META becomes debugger. Hook enforces this at Layer 2.

### BL-28: Agent Prompt Must Include Explicit Context [UNIVERSAL]
**Source:** Hansei — gravity session (April 2026), agents refused roleplay due to insufficient directive
**Rule:** Every Agent tool call MUST include: (1) COMPLETE role file content (not excerpts — the full file from first line to Output Format section), (2) concrete task description, (3) explicit file paths to read, (4) expected output format, (5) project config. An agent spawned without this context will either refuse or hallucinate. Truncating the role file to save tokens is a violation — hook Check 6 detects missing Output Format section and blocks the call.
**Why:** Agents spawned via the Agent tool are subprocesses with blank context — they do NOT inherit the parent session's EraDev knowledge, loaded files, or role assignments. Three of five RT-1 agents refused to work in the gravity session because the prompt said "act as Visionary" without providing the Visionary role file, task details, or output format.
**Applies to:** META-Orchestrator (agent spawning), all roles (when delegating sub-tasks)

### BL-29: Verify Established Terminology Before Generating [UNIVERSAL]
**Source:** Hansei — gravity session (April 2026), terminology drift across parallel Builder outputs
**Rule:** Before generating any artifact for an existing project, grep/read the project's existing outputs to identify established terminology, naming conventions, and notation patterns. Use them exactly. Do not invent new terms, transliterations, or abbreviations when the project already has established ones.
**Why:** Three Builders working in parallel each chose different transliterations and notation styles, creating inconsistencies that required manual cleanup. The cost of reading existing conventions first is seconds; the cost of harmonizing divergent terminology after generation is hours. This generalizes beyond articles to code (variable naming, API conventions), docs (glossary terms), and configs (key naming patterns).
**Applies to:** Builder (pre-generation check), Validator (terminology consistency audit), Coherencer (cross-Builder sync)

### BL-30: Defense-In-Depth for Enforcement [UNIVERSAL]
**Source:** v8 session — 3-layer identity enforcement design (CLAUDE.md + hook + memory persistence)
**Rule:** Any critical enforcement mechanism must have at least 2 independent layers. A single enforcement point is a single point of failure. If the mechanism can be bypassed by skipping one file/step, add redundant layers.
**Why:** CLAUDE.md alone failed (deployment test: 95% solo). Hook alone can be bypassed. Memory alone is informational. Three layers together create defense-in-depth where any single layer failing leaves two active.
**Applies to:** META-Orchestrator (identity), Validator (verification gates), Builder (build checks)

### BL-31: Constrain Output Types to Constrain Behavior [UNIVERSAL]
**Source:** v8 session — META Output Specification (5 permitted types)
**Rule:** When a role drifts from its mandate, enumerate its permitted output types and reject all others. Do not "remind harder" — type-constrain. If META can only produce 5 output types (Agent calls, Decisions, Synthesis, Lessons, Reports), it structurally cannot produce code.
**Why:** Behavioral reminders ("don't code") lose to the default attractor. Structural constraints (typed outputs) survive because the violation is detectable: "this output is not one of the 5 types." Constraint > policing.
**Applies to:** ALL roles (each role should have a defined output type set)

### BL-32: Grep After BL Merge — Reference Cleanup [UNIVERSAL]
**Source:** Hansei v8 session — BL-27 stale references found in 5 files after merge into BL-6
**Rule:** After merging BL entries (e.g., BL-13+BL-23 → BL-13), immediately grep the entire repo for all old BL-N references. Replace orphan references with the merged BL-N ID. Commit reference cleanup in the same commit as the merge.
**Why:** BL numbers are referenced across 20+ files (CLAUDE.md, SKILL.md, eradev.md, role files, reports). Merging without grepping creates Lambda gaps: agents encounter "BL-27" but find no definition. The cost of grepping is seconds; the cost of stale refs is agent confusion (A_F collapse).
**Applies to:** META-Orchestrator (merge execution), Coherencer (verify completeness), Validator (post-merge audit)
