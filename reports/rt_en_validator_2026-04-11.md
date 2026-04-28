# RT-1 [VALIDATOR] EN — Universalization Plan Critique

> Date: 2026-04-11
> Role: Validator (EN stack)
> Scope: Adversarial verification of universalization plan and 12 existing borrows
> Source reports audited:
> - `reports/multi_agent_frameworks_comparison_2026-04-11.md` (5 borrows)
> - `reports/rtk_analysis_2026-04-11.md` (5 borrows)
> - Carry-overs: MetaGPT 5-role validation, ChatDev dehallucination (2 implicit borrows)
> B-check at end.

---

## Activation Operator (executed)

1. **A_F (Focus):** Read both source reports in full, role file, config, lessons, BOOTSTRAP_LESSONS (all 32 BL), ODTOE parent directory probe, web research on MAS failure modes.
2. **A_E (Alignment):** Task INTENT = "verify the plan to universalize EraDev beyond code to any task type." Not "approve the borrows." The verification target is **applicability outside software**, not the borrows' merits inside software.
3. **A_σ (Consistency):** Cross-checked borrow claims against: BL-1..32, MAST failure taxonomy (14 modes, arxiv 2503.13657), single-agent vs multi-agent benchmarks (arxiv 2604.02460), AI technical debt research (InfoQ 2025).
4. **A_Λ (Experience):** Activated BL-5 (phantom coherence), BL-10 (multiplicative zero), BL-16 (reading ≠ applying), BL-20 (adversarial test required), EMP5 (scope determines strictness), EMP7 (optimization without orientation).

---

## Executive Verdict

**The universalization plan has a FOUNDATIONAL BLIND SPOT.** Of the 12 borrows, 9 are **code-shape-specific** — they encode assumptions (file paths, commits, tests, build artifacts, Bash output, SQL telemetry) that do not generalize to art, music, research papers, theorem proving, therapy, policy analysis, or ideation. The plan reads universal but is practically a refactor for the code-case with cosmetic "universal" labels.

**Three phantom coherence signals detected** (BL-5):
1. Both source reports converge on a hill-climb ordering of borrows (Phase 1 / Phase 2 / Phase 3). They agree on *the ordering* but neither validates **the category boundary**: are these borrows applicable OUTSIDE code? Phantom agreement on sub-questions masks disagreement on the super-question.
2. The `rtk_analysis` report uses the phrase "orthogonal to all 10 frameworks" to shield RTK from scrutiny. Orthogonality is a mathematical claim — it was asserted, not proved. For universalization, RTK is **strictly subordinate**: shell output compression is a code-artifact optimization. Zero relevance to non-code tasks.
3. Both reports treat "S_team = 0.85" and "B_mean = 0.645" as validation that the borrows converge. But BL-4: S_adjusted = S_team × B_mean = 0.548. That is 0.052 above the 0.5 phantom-coherence threshold. **One bad review flip** collapses the team into PHANTOM COHERENCE territory. The margin is thin.

**Recommendation:** Do not proceed to RT-2 on universalization without first answering the prerequisite question: **What is the canonical non-code task that the universalized framework will be validated against?** Without this, all "universal" claims are unfalsifiable.

---

## Per-Borrow Verdicts (Universalization Lens)

### Legend
- **ACCEPT** — generalizes to any task type with minor relabelling.
- **MODIFY** — core insight generalizes but implementation must change for non-code tasks.
- **REJECT** — code-shape specific; cannot be universalized without conceptual substitution (which would make it a different borrow).

---

#### Borrow #1: Tool-Scoped Role Permissions (Claude Code native)
**Code-case merit:** HIGH. **Universalization verdict: MODIFY.**

- For code tasks, Read/Write/Edit/Bash map cleanly to roles.
- For NON-code tasks (research review, theorem proof, musical composition, therapy session plan) the tool inventory is different: WebSearch, WebFetch, Glob over references, Grep over notation, no Bash, no Edit.
- A Builder for a music composition task needs access to MIDI libraries, notation engraving tools, or audio renderers — none of which Claude Code exposes natively.
- The core insight ("constrain role by tool inventory") generalizes. The enumerated tool list does NOT. Universalization requires a **tool-inventory-per-task-domain matrix**, not a single "Visionary: Read, Glob, Grep" list.

**Missing from analysis:** Tool-scoped permissions assume tool existence. For domains where the required tool doesn't exist in the harness (music engraving, chemical drawing, legal citation lookups), this borrow is inert.

**Action for universalization:** Introduce `domain:` field in task classification. Role tools declared per (role × domain) tuple. Without this, Tool-scoped = code-only.

---

#### Borrow #2: Model-Per-Role Cost Optimization (CrewAI)
**Code-case merit:** HIGH. **Universalization verdict: ACCEPT with caveat.**

- Generalizes well: "cheap model for mechanical work, expensive model for strategy" is task-agnostic.
- Caveat: the **role-to-model mapping is code-task-specific**. For research/science tasks, Validator is NOT "pattern matching" — it is critical review of novel claims, which is **more expensive** than Builder (literature synthesis can be Haiku-cheap if well-scoped).
- Example: for a theorem proof task, Builder (writing LaTeX/Lean) can be Haiku; Validator (checking formal correctness) MUST be Opus.
- For a therapy plan task, Visionary (ethics, patient welfare) dominates; Builder (intervention drafting) is Sonnet; Validator (safety edge cases) is Opus.

**Missing from analysis:** No discussion of whether the "Opus for strategy, Sonnet for execution, Haiku for yes/no" mapping is a code-task heuristic or a general principle. It is a code-task heuristic.

**Action for universalization:** Rename from "model-per-role" to "model-per-(role × task-domain)". Provide default mappings for 4-5 canonical non-code domains: research, theorem proving, creative writing, therapy plan, policy analysis.

---

#### Borrow #3: Background Instinct Extraction (ECC)
**Code-case merit:** CRITICAL. **Universalization verdict: MODIFY.**

- The mechanism (PostToolUse → background Haiku → pattern clustering) is tied to **tool calls**. Tool calls are the "trigger" side of the trigger→action pattern.
- For research/art/music/theorem tasks, many of the "patterns" are NOT tool-call-shaped. A writer learning "show, don't tell" is a pattern derived from *output critique*, not *tool-call observation*.
- The valuable abstraction is "background agent extracts reusable heuristics from session traces." The trigger source must expand beyond tool calls to include: role outputs (Validator bug classifications), RT decisions (why was this rejected?), Hansei reflections.
- **Blind spot:** The source report claims this "solves BL-16 structurally." For code, perhaps. For non-code, the Lambda problem has a different shape: agents forget not "how to use a tool" but "how to think about a domain." A tool-call hook cannot extract conceptual heuristics.

**Action for universalization:** Generalize trigger surface from PostToolUse → {PostToolUse, PostAgentCall, PostRT, PostHansei}. The Haiku extractor receives a heterogeneous stream and clusters by semantic similarity, not tool-name matching.

---

#### Borrow #4: Hook Profiles (ECC)
**Code-case merit:** MEDIUM. **Universalization verdict: REJECT as-stated, ACCEPT reframed.**

- Hook profiles are a **code-artifact pattern**: ENV vars, shell hooks, CI/CD strictness.
- For non-code tasks, there is no "hook" in the shell sense. There are RT gates, Andon thresholds, consensus bars.
- The underlying insight ("operator-tunable strictness based on scope") generalizes via EMP5. But calling it "hook profiles" anchors it to code.

**Reframe:** **Gate Strictness Profiles** — three modes (exploration / standard / production). Each profile sets thresholds for: Andon triggers, Dead Gate escalation, RT-2 requirement, B_mean acceptance bar.

**Missing from analysis:** The source report presents hook profiles as a ~30-minute implementation. For non-code tasks, this requires rethinking which gates even fire (e.g., "build verify" doesn't exist for a philosophy essay).

---

#### Borrow #5: Memory Hierarchy (MemPalace)
**Code-case merit:** MEDIUM. **Universalization verdict: ACCEPT.**

- The Closet/Drawer split, temporal triples, and tiered always-loaded are **data structures**, not code artifacts. They generalize cleanly.
- This borrow is the **most universal of the five**.
- Works for research (drawer = raw citations, closet = literature review summary), art (drawer = reference moodboards, closet = style guide), theorem proving (drawer = proof attempts, closet = established lemmas).

**One caveat:** MemPalace's 96.6% R@5 retrieval was measured on **text-retrieval benchmarks**. No evidence it holds for non-text modalities (images, audio, mathematical expressions). Universalization should flag that the retrieval metric is a code-and-text benchmark.

**This is the single strongest universalizing borrow in the plan.**

---

#### Borrow NEW-1: RTK Output Compression
**Code-case merit:** CRITICAL. **Universalization verdict: REJECT.**

- RTK compresses **Bash shell output**. For research tasks (WebSearch), art tasks (image generation), music tasks (audio rendering), theorem tasks (Lean compiler output), the compression targets are different: web pages, image metadata, audio waveforms, formal proof traces.
- The `rtk_analysis` report ITSELF flags: "RTK only intercepts Bash tool — Read/Grep/Glob bypass the hook. EraDev primarily uses Read/Grep/Glob → RTK covers only diagnostic Bash subset."
- This is a **narrow optimization** for a code-specific subset (diagnostic Bash). Universalization would require rewriting the entire compression engine for non-Bash inputs.
- **Phantom coherence alert:** The source report labels this "CRITICAL" impact because the compression gains are real. But "critical for code" ≠ "critical for universalization." Labelling a narrow optimization as critical is a scope error.

**The correct framing:** RTK is a **code-domain Phase 1 quick win**. It is NOT part of universalization. Including it in a universalization plan confuses "EraDev improvements" with "EraDev universal-applicability improvements."

---

#### Borrow NEW-2: SQLite Telemetry Backbone
**Code-case merit:** HIGH. **Universalization verdict: ACCEPT with modification.**

- Cost telemetry (tokens_in, tokens_out, exec_time_ms, savings_pct) is **task-agnostic**. All tasks consume tokens.
- The **`project_path`** field is a code-shape assumption. For non-code tasks, the unit of analysis may be project, client, research topic, or session. Schema should generalize: `context_id` instead of `project_path`.
- Per-command tracking is code-specific. For non-code tasks, per-RT-cycle or per-agent-call tracking is more meaningful.

**Missing from analysis:** Telemetry creates its own failure mode — it becomes a metric that gets optimized (EMP7: optimization without orientation). For non-code tasks with softer metrics ("was the essay good?"), token telemetry can lead to hill-climbing toward cheap outputs rather than high-value outputs. This is a **premature optimization trap**.

**Action for universalization:** Telemetry schema must include a **quality score** per event, not just a cost score. Otherwise the framework optimizes cost and degrades quality — which kills non-code tasks first because they're more quality-sensitive than code tasks.

---

#### Borrow NEW-3: Tee Recovery Pattern
**Code-case merit:** MEDIUM. **Universalization verdict: MODIFY.**

- Tee recovery (dump raw output on failure, agent re-reads instead of re-runs) is a **cost-of-retry** optimization.
- The principle generalizes (preserve expensive outputs for forensics), but the mechanism is Bash-specific.
- For non-code tasks: a failed WebSearch, a failed research review, a failed theorem proof attempt are all candidates for "preserve output for next-turn analysis." The generalized pattern is **Failure-Output Caching**, not tee-to-file.

**Missing from analysis:** The source report claims this "attacks BL-3 root cause." For code, fix chains happen because Builder re-runs. For non-code, fix chains happen because **the problem is genuinely hard and the spec was wrong**. Caching output doesn't fix conceptual confusion. This is **an incomplete theory of BL-3**.

---

#### Borrow NEW-4: Compound Command Lexer
**Code-case merit:** MEDIUM. **Universalization verdict: REJECT.**

- A shell command lexer is **100% code-specific**. It parses `&&`, `||`, `|`. These symbols do not exist in non-code task languages.
- This is a narrow enforcement improvement for Invariant 10. It has zero universalization value.
- Including it in a universalization report is a **category error**.

---

#### Borrow NEW-5: Canonical Parser Types
**Code-case merit:** LOW. **Universalization verdict: REJECT.**

- `TestResult`, `LintResult` are code-artifact types. Universalization would require inventing an equivalent taxonomy for every task domain.
- The underlying idea ("structured output types") overlaps with BL-31 (Constrain Output Types) which is already universal in the framework.
- This is redundant with existing capabilities, not a new borrow.

---

#### Implicit Borrow #11: MetaGPT 5-Role Validation
**Code-case merit:** HIGH (theoretical). **Universalization verdict: MODIFY.**

- MetaGPT's 5-role team (PM, Architect, Engineer, QA, PM) maps to EraDev's 5 roles **for software work**. The comparison validates the code-domain choice.
- It does NOT validate the 5-role model for non-code domains. MetaGPT is a software engineering framework; its confirmation of a software decomposition is not evidence for a universal decomposition.
- **The "stable attractor" claim is over-reach.** Two frameworks built by humans in the same year for the same task converging on the same decomposition could be path-dependent (both trained on human software teams) rather than a law of nature.

**Action for universalization:** Formally test the 5-role model against non-software domains. Known parallels:
- Science labs: PI / Postdoc / Grad student / Reviewer / Lab manager → maps to 5 roles but weakly (PI and Visionary both strategic; Grad student and Builder mechanical; Reviewer=Validator; Lab manager=Coherent; Postdoc=Analyst). Plausible.
- Film production: Director / Writer / Actor / Editor / Producer → maps weakly (Director=Visionary; Writer=Analyst; Actor=Builder; Editor=Validator; Producer=Coherent). Plausible but role identity blurred.
- **Counterexample:** Solo art (painting, poetry) has no natural decomposition into 5 roles. The 5-role model is a teamwork attractor, not a universal cognitive pattern.

---

#### Implicit Borrow #12: ChatDev Communicative Dehallucination
**Code-case merit:** MEDIUM. **Universalization verdict: ACCEPT.**

- "Role-constrained dialogue reduces hallucinations" is task-agnostic. Generalizes to any domain where multiple perspectives can challenge each other.
- This is **the most philosophically universal borrow**. It captures why the RT-1 mechanism works at all.
- Already implicit in EraDev. No implementation delta.

---

## Borrow Summary Table

| # | Borrow | Code-Case | Universal Verdict | Critical Issue |
|---|--------|-----------|-------------------|---------------|
| 1 | Tool-scoped permissions | HIGH | MODIFY | Tool inventory is domain-specific |
| 2 | Model-per-role | HIGH | ACCEPT w/ caveat | Role→model mapping is code-heuristic |
| 3 | Background instinct extraction | CRITICAL | MODIFY | Trigger surface too narrow |
| 4 | Hook profiles | MEDIUM | REJECT-as-stated | Reframe as Gate Strictness Profiles |
| 5 | Memory hierarchy | MEDIUM | ACCEPT | Strongest universal borrow |
| NEW-1 | RTK compression | CRITICAL | REJECT | Code-only optimization |
| NEW-2 | SQLite telemetry | HIGH | ACCEPT w/ modification | Needs quality metric, not just cost |
| NEW-3 | Tee recovery | MEDIUM | MODIFY | Incomplete theory of BL-3 root cause |
| NEW-4 | Compound lexer | MEDIUM | REJECT | Shell-syntax specific |
| NEW-5 | Canonical types | LOW | REJECT | Redundant with BL-31 |
| 11 | MetaGPT 5-role | HIGH | MODIFY | Not proven outside software |
| 12 | ChatDev dehalucination | MEDIUM | ACCEPT | Already implicit in RT-1 |

**Score:** 3 ACCEPT, 5 MODIFY, 4 REJECT (out of 12).

**Interpretation:** The 12-borrow list is dominated by code-domain optimizations. Only 3 generalize cleanly. The "universalization plan" as it exists is really a **code-domain Phase 1/2 roadmap** mislabeled.

---

## Edge Cases That Break the 5-Role Model

The framework assumes "5 roles × RT × ODTOE coherence" is universal. These task types stress or break that assumption:

### 1. Solo Art / Poetry / Music Composition
- No natural role decomposition. A single artist is the Visionary, Analyst, Builder, Validator, and Coherent simultaneously.
- Splitting the work into 5 agents **destroys the integrated creative state** (flow). Evidence: [CoComposer research](https://arxiv.org/html/2509.00132v1) found multi-agent music composition "significantly lags behind in core aesthetic dimensions" compared to dedicated single-agent models.
- **Break point:** Creativity is not a pipelined activity. Pipelining it creates worse output.
- **Implication:** For solo-creative tasks, the framework should default to **single-agent mode with Inner Critique** (one agent cycling through 5 role perspectives internally), not 5 parallel agents.

### 2. Formal Theorem Proving
- Mixed signals from research. [MA-LoT](https://arxiv.org/html/2503.03205v2) shows multi-agent gets 61% accuracy on MiniF2F-Lean4 vs 55% single-agent.
- BUT the multi-agent architecture there is specialized (Planner / Prover / Critic / Verifier with Lean tools), not EraDev's 5-role model.
- EraDev's Visionary, Coherent roles add no value to theorem proving; the task reduces to Analyst + Builder + Validator in a tight loop.
- **Break point:** Some tasks have natural 3-role or 2-role structures. 5-role forces irrelevant cognitive overhead.
- **Implication:** Role count should be task-dependent. n_min = 5 is a theorem about teamwork stability, not a claim that 5 is always optimal.

### 3. Multi-Hop Reasoning (research questions, fact-finding)
- [arxiv 2604.02460](https://arxiv.org/html/2604.02460) directly shows: "single-agent systems consistently match or outperform multi-agent systems on multi-hop reasoning tasks when reasoning tokens are held constant."
- When compute is normalized, multi-agent adds NOTHING on multi-hop reasoning. The Data Processing Inequality argument suggests SAS is information-efficient under fixed budgets.
- **Break point:** For tasks where the bottleneck is reasoning chain coherence, splitting into 5 agents creates information loss at each hand-off.
- **Implication:** Tasks classified as "multi-hop reasoning dominant" should route to single-agent execution, not 5-role RT.

### 4. Real-Time Clinical / Safety Decisions
- Multi-agent adds 4.8s latency per query at low load, 6.8s at high load (per [Iterathon 2026 analysis](https://iterathon.tech/blog/multi-agent-orchestration-economics-single-vs-multi-2026)).
- Life-critical decisions cannot tolerate RT-1 latency.
- **Break point:** Real-time constraints.
- **Implication:** Framework needs a "Real-Time Lane" where single-agent executes with Validator in parallel (async check), not sequential RT.

### 5. Purely Generative Tasks (image generation, audio synthesis)
- Output is not code, not text — it's media. ODTOE B = F × E × (1-σ) × Λ cannot be computed: what is "consistency" for a painting? What is "experience" for a new melody?
- **Break point:** The B-formula metrics are text-artifact assumptions.
- **Implication:** For generative non-text tasks, EraDev needs media-specific quality operators (e.g., perceptual quality, novelty, coherence as measured by perceptual models), not B-formula.

### 6. Open-Ended Research / Exploration
- Research tasks have no "done" criterion. RT-3 ("go/no-go acceptance") is ill-defined.
- True North becomes unstable: the direction changes based on findings.
- **Break point:** Exploration vs exploitation — EraDev is structured for exploitation.
- **Implication:** Need an "Exploration Mode" with no RT-3, periodic Coherent check-ins, Visionary re-alignment, but no acceptance gate.

### 7. Therapy / Policy Analysis / Ethical Review
- These involve **stakeholder perspectives**, not task perspectives. 5 roles representing cognitive functions miss the point; you need 5 *stakeholders* (client, practitioner, family, regulator, ethicist).
- **Break point:** Role vs stakeholder conflation.
- **Implication:** Alternative 5-role decomposition for human-facing tasks: 5 stakeholder perspectives, not 5 cognitive functions.

### 8. Adversarial / Red-Team Tasks
- The framework assumes all 5 agents cooperate toward True North. Red-teaming requires an adversary by design.
- **Break point:** No adversarial role exists.
- **Implication:** Need a 6th role for adversarial domains, OR reframe Validator as Adversary.

---

## Missing Borrows (Blind Spots)

The analysis missed:

### M-1: Streaming / Real-Time Inference (absent from both reports)
No framework in the analysis addresses streaming outputs or real-time token-by-token generation. EraDev's RT-1/2/3 is fundamentally **batch**. Modern agent work (voice assistants, live coding, interactive theorem provers) is **streaming**. This is the biggest category omission.

### M-2: Adversarial Evaluation / Red-Teaming
The 10 frameworks analyzed are all cooperative. Missing: adversarial frameworks where one agent's job is to break the other agents' outputs. Relevant sources: Anthropic's constitutional AI (internal adversary), DeepMind's Sparrow. These inform how to fold "Validator as adversary" into the role structure.

### M-3: Agentic Retrieval / Active Learning
The background instinct extraction pattern is passive (captures what happened). Missing: **active retrieval** — an agent that identifies what knowledge it LACKS and goes fetch it. This is the difference between "lessons.md append" and "proactively ask what I need to know before starting RT-1."

### M-4: Multi-Modal Task Specification
No borrow addresses tasks where the **spec is non-textual** (a sketch, an audio reference, a gesture). The entire framework assumes textual task input. For universalization, the input pipeline needs multi-modal support.

### M-5: Human-in-the-Loop Checkpoints
The framework assumes META orchestrates autonomously. Missing: explicit HITL (Human-in-the-Loop) checkpoints for tasks where the cost of wrong autonomous action is high (therapy plans, legal advice, financial recommendations). Related: OpenAI's "pause for review" primitive.

### M-6: Cross-Agent Memory Sharing Protocol
The borrows have memory (MemPalace) but no protocol for **shared vs private memory**. In multi-agent creative tasks, memory privacy matters (e.g., Validator's criticism shouldn't contaminate Builder's subsequent work). Missing: memory access control.

### M-7: Process vs Outcome Quality Distinction
No borrow distinguishes "the process was correct" from "the outcome was correct." For code, correctness is testable. For non-code, process quality and outcome quality can diverge. A therapy plan with perfect process can produce bad outcomes; sloppy process can produce good outcomes by luck. EraDev's B-formula conflates these.

### M-8: Cost of Abandonment / Sunk Cost Management
No borrow addresses when to STOP a task mid-flight (abandon, not fix). Fix chain ≥ 3 is a STOP signal, but it triggers Hansei, not abandonment. For research tasks, "this line of inquiry is dead" is a valid outcome that the framework has no structure for.

---

## Premature Optimization Risks

The plan risks multiple premature optimization traps:

### Risk 1: Optimizing Cost Before Validating Generalization
Borrow #2 (model-per-role) promises 40-60% cost reduction. If implemented before universalization is validated, the role-to-model mapping becomes **frozen for code-case**, making later adjustment for non-code domains painful (tech debt). Order matters: universalize first, optimize second. The source report has it backwards.

### Risk 2: Telemetry Becomes the Score Function (EMP7)
Borrow NEW-2 adds SQLite telemetry. Once metrics exist, META will optimize them. But token cost is NOT the right quality metric for non-code tasks (per M-7 above). Optimizing telemetry-visible metrics while quality degrades invisibly is **exactly the "optimization without orientation" failure mode**.

### Risk 3: Hook Profiles Encourage Bypass
Borrow #4 adds `strict/standard/minimal` profiles. Operators under pressure will switch to `minimal` to ship faster, defeating enforcement. BL-16 recursively applied: the escape hatch itself becomes the attractor.

### Risk 4: Premature Compression
Borrow NEW-1 (RTK) compresses output before it's known whether the output contained signal. For non-code tasks, the "compressed" output might be the entire essay. Lossy compression of creative output is destruction, not optimization.

### Risk 5: Memory Hierarchy Rebuild Cost
Borrow #5 (MemPalace) is the only truly universal borrow but requires rebuilding the entire memory layer. Doing this during universalization (rather than after) creates **simultaneous migration risk**: new memory layer + new domain coverage. Violates BL-24 (single-responsibility commits) at the architectural level.

### Risk 6: MetaGPT Convergence Fallacy
The reports treat MetaGPT's 5-role match as validation. This is **confirmation from a single data point** (one other framework). Universalization validation needs evidence from 5+ non-software domains, not 1 same-domain agreement.

### Risk 7: Optimization While Foundation Is Unstable
Per BL-32, BL budget was just merged (32 entries, recently stabilized). Adding 12 new borrows will likely require more merges, potentially destabilizing the BL reference graph. Order: stabilize foundation, then extend.

---

## Phantom Coherence Analysis (BL-5 Deep Dive)

The two source reports agree on Phase 1 ordering. Let me test whether this agreement is genuine or phantom.

**Test 1: Independent derivation.** Would a 3rd analyst spawned independently produce the same Phase 1 ordering (Tool-scoped, Model-per-role, RTK, Hook profiles)?
- Tool-scoped: likely yes (native feature, LOW cost).
- Model-per-role: likely yes (obvious cost win).
- RTK: UNCERTAIN — an analyst working without bias toward "free solutions" might rate this MEDIUM (narrow scope) not CRITICAL.
- Hook profiles: likely yes (small change).
- **Verdict:** Agreement on 3/4 items may be genuine; RTK ranking is suspicious. The "CRITICAL" label for RTK is likely anchored by "ZERO cost" framing, not independent impact assessment.

**Test 2: Would the reports agree if the "universal vs code" distinction were explicit in the prompt?**
- Almost certainly not. The framework comparison report concluded RTK was "orthogonal and stacks cleanly." The RTK analysis report labeled it CRITICAL. Neither report evaluated: **is RTK applicable to non-code tasks?** If forced to, both would say no.
- **Verdict:** The agreement is CODE-LEVEL agreement on CODE-DOMAIN improvements. It is NOT agreement on universalization.

**Test 3: Cross-sectional consistency.**
- Both reports use the same B-threshold (0.5), same phantom detection rule, same S_team language.
- **S_team = 0.85, B_mean = 0.645 → S_adjusted = 0.548.**
- The gap to phantom threshold (0.5) is 0.048. If one agent's B drops by 0.1, S_adjusted = 0.498 → PHANTOM COHERENCE triggered.
- **This is too close to the edge to claim robust coherence.** A genuine coherence result should have S_adjusted > 0.7 (margin of 0.2 above threshold).
- **Verdict:** Borderline phantom. Not triggered yet, but the margin is not convincing.

**Phantom Coherence Verdict:** ELEVATED RISK. Not triggered per the raw numbers, but:
1. Agreement is scoped to code-level improvements (not universalization).
2. RTK ranking shows framing anchoring.
3. S_adjusted margin is thin.
4. The super-question ("are these universal?") was never asked of the 5 prior agents.

**Recommendation:** Run a Kill-Switch Level 2 (Question the Premise) at RT-2: "What if these borrows are NOT applicable to non-code tasks? What does universalization actually require?" If the team cannot answer, the current plan is phantom-coherent and must be rebuilt.

---

## Test Plan: How to Validate Universalization in Practice

The universalization claim is currently untestable. To make it testable, the plan must produce **adversarial validation artifacts**. Proposed test battery:

### Test Battery T1: Domain Coverage
For each of 5 canonical non-code domains, run a representative task end-to-end through the universalized framework:

| # | Domain | Canonical Task | Success Criterion |
|---|--------|---------------|-------------------|
| T1.1 | Research synthesis | "Write a 2000-word literature review on topic X with 10 cited sources" | Validator flags source quality issues; Builder uses WebSearch+WebFetch; final review passes peer-review rubric |
| T1.2 | Creative writing | "Draft a 500-word short story with theme Y" | 5-role mode vs single-agent A/B test; measure reader rating + word-quality metrics |
| T1.3 | Theorem proving | "Prove X in Lean4" | 5-role mode vs minimal agent from [arxiv 2602.24273](https://arxiv.org/html/2602.24273); measure success rate |
| T1.4 | Policy analysis | "Analyze regulation Z for stakeholder impacts" | Validator enumerates missed stakeholder groups; Coherent syncs perspectives |
| T1.5 | Art direction | "Generate moodboard + spec for Q product launch" | Media-output quality metric (no B-formula applicable) |

### Test Battery T2: Borrow Activation
For each borrow that passed MODIFY or ACCEPT, verify it actually fires in a non-code task:

- Tool-scoped: does the permission gate fire correctly for a WebSearch-dominant task? (Not a trick question — many gates currently only check Bash.)
- Model-per-role: does the cost profile hold when Validator is Opus (not Sonnet) for a theorem task?
- Background instinct: does the extractor produce useful heuristics from a research-task trace? (Or does it only produce code-smelling patterns?)
- Memory hierarchy: does the Closet/Drawer split yield retrievable results for non-text modalities?

### Test Battery T3: Failure Mode Coverage
Per MAST 14-mode taxonomy (from [arxiv 2503.13657](https://arxiv.org/pdf/2503.13657)):
- Test each failure mode against the universalized framework.
- Measure which modes the framework detects vs misses.
- Specifically: inter-agent misalignment modes (which the source reports never tested for).

### Test Battery T4: Single-Agent Baseline
For each domain in T1, run the task with:
- **Baseline A:** Single Opus 4.6 agent, no roles, no RT.
- **Baseline B:** EraDev full 5-role RT.
- **Baseline C:** EraDev single-agent-with-inner-critique (the "solo creative mode" proposed above).
- **Measurement:** Quality score, cost (tokens), latency, completion rate.

**Expected result (hypothesis):**
- Code tasks: B > A (EraDev wins).
- Research tasks: B ≈ A (EraDev has overhead that matches its quality gain).
- Creative tasks: C > B > A (solo mode wins).
- Theorem proving: B > A (on certain subclasses, per MA-LoT).
- Real-time tasks: A wins (latency matters).

If the hypothesis holds, the universalization plan needs **task-type-dependent routing** at the META level: not every task goes through 5-role RT.

### Test Battery T5: Regression Against Phantom Coherence
- Run the T1 battery twice, with DIFFERENT agent sets (no shared context).
- Compare S_team between runs.
- If S_team across independent runs is high but B_mean is low, phantom coherence is baseline characteristic of the framework and must be structurally addressed, not asserted away.

### Test Battery T6: Adversarial Bootstrap Test
Per BL-20: adversarially test the universalized bootstrap prompt. Specifically:
- Give the framework to an agent with a **non-code task** and verify it doesn't default to code behavior.
- Current prediction: the framework will default to code behavior because every role file example and every BL entry is code-flavored. This is a **silent failure mode** the analysis has not identified.

---

## Bugs Found (B-Deficit Classification)

1. **BUG-01 (σ-deficit):** The source reports use "universalization" without defining the target scope. The RTK report's "orthogonal" claim and the framework-comparison report's "universal" language are inconsistent — one implies cross-tool, the other implies cross-domain. **B-deficit: sigma.** Terminology drift between reports.

2. **BUG-02 (Λ-deficit):** Neither source report activated BL-18 (scope reclassification at 2x estimate). Universalization is a scope multiplier — if the original scope was "improve EraDev," universalization redefines the scope to "make EraDev domain-agnostic," which is at least 3x larger. BL-18 not triggered. **B-deficit: Lambda.**

3. **BUG-03 (E-deficit):** The INTENT of universalization is never stated. What problem does universalization solve? For whom? If the answer is "we want EraDev to be used outside code," who is asking for that? The reports optimize a solution without a problem statement. **B-deficit: E (alignment).**

4. **BUG-04 (F-deficit):** The analysis did not read any non-code tasks' historical records. There are no non-code EraDev sessions to Λ-ground the universalization claims. This is Lambda=0 for the universalization claim — formally dead per BL-1. **B-deficit: F (did not read non-code domain) + Λ (no non-code experience).**

5. **BUG-05 (σ-deficit):** The two reports converge on Phase 1 ordering but did not cross-validate against each other. The second report (RTK) was a "second-pass" that refined the first but did not challenge its premises. **B-deficit: sigma.** Sequential anchoring.

6. **BUG-06 (E-deficit):** The "score function" for borrow ranking (Impact × 1/Cost) is implicit and unweighted. No consideration of risk, technical debt, or universalizability. This is a **hill-climbing score function** (EMP7) applied to a problem that requires orientation, not optimization. **B-deficit: E.**

7. **BUG-07 (σ-deficit):** The implicit 11th and 12th borrows (MetaGPT validation, ChatDev dehallucination) are carried over from context but never explicitly listed, scored, or debated. They exist in the reports as observations but not as borrows. The "12 borrows" count is therefore fuzzy. **B-deficit: sigma.** Count inconsistency.

**Fix chain on universalization workstream: currently 0 (this is RT-1, no fix chain yet). If RT-2 requires rebuild, log as Andon trigger per BL-3.**

---

## Verdict

**PASS WITH NOTES → BLOCK if not addressed before RT-2.**

**Required actions before RT-2 (non-optional):**

1. **Define universalization target.** What is the scope? What domain(s)? What user problem does it solve? Answer with 1 paragraph, not more.

2. **Run T6 (adversarial bootstrap test) FIRST.** Before any borrow implementation, prove the framework doesn't silently default to code behavior on non-code tasks. This is the fastest falsification path. Est 30 min.

3. **Reclassify borrows by domain.** Use the ACCEPT/MODIFY/REJECT table above. Drop all REJECT items from the universalization plan; they belong in a separate "code-domain Phase 1" roadmap.

4. **Add the 8 missing borrow categories (M-1 to M-8).** At minimum, flag them as known gaps.

5. **Redefine Phase 1.** With the rejects removed, Phase 1 for universalization becomes: (a) Memory hierarchy, (b) Model-per-role WITH domain-aware mapping, (c) ChatDev-style RT formalization. Tool-scoped and others move to Phase 2 because they need the domain matrix first.

6. **Commit to the test battery.** T1-T6 must be scheduled before implementation. BL-20 applies.

7. **Address phantom coherence margin.** Run one more independent analyst on the super-question ("are these borrows universal?"). If S_adjusted stays < 0.7, the team is phantom-coherent on the wrong question.

---

## B-check

```
=== JIDOKA SELF-CHECK ===
B-diagnostics:
  F (Focus):       0.85  — Read both source reports, role file, config, lessons, BL-1..32, ODTOE parent directory check, 4 web searches with peer-reviewed sources.
  E (Alignment):   0.90  — Verified against INTENT (universalization) not format (borrow list review). Caught the category error early.
  (1-sigma):       0.80  — Cross-checked against MAST taxonomy, single-agent vs MAS benchmarks, EMP5, EMP7. Minor residual: did not test all 32 BL against all 12 borrows.
  Lambda:          0.80  — Activated BL-1, 3, 4, 5, 10, 16, 18, 20, 24, 32 + EMP5, EMP7. Missing direct non-code task experience (admitted in BUG-04).
  B = 0.85 * 0.90 * 0.80 * 0.80 = 0.4896

Interpretation: 0.49 is just below 0.5. This is NOT phantom coherence (I am a single Validator, not a team). It reflects the genuine difficulty: I am validating a plan whose foundation (non-code applicability) I cannot verify without non-code task data (BUG-04). This 0.49 is an HONEST under-confidence — the right move when challenged.

Andon: NOT triggered (no component below 0.3, F/E/σ/Λ all in healthy range). B product low due to compounding, not collapse. Report stands.

Verdict: PASS WITH NOTES → BLOCK if the 7 required actions before RT-2 are not addressed.
```

---

## Sources

- [Why Do Multi-Agent LLM Systems Fail? (Cemri et al., 2025) — MAST 14-mode taxonomy](https://arxiv.org/pdf/2503.13657)
- [Single-Agent LLMs Outperform Multi-Agent Systems on Multi-Hop Reasoning Under Equal Thinking Token Budgets (2026)](https://arxiv.org/html/2604.02460)
- [MA-LoT: Multi-Agent Lean-based Long Chain-of-Thought Reasoning (2026)](https://arxiv.org/html/2503.03205v2)
- [CoComposer: LLM Multi-agent Collaborative Music Composition (2025)](https://arxiv.org/html/2509.00132v1)
- [LLM-based multi-agent poetry generation in non-cooperative environments](https://arxiv.org/html/2409.03659v2)
- [Multi-Agent Orchestration Economics When Single Agents Win 2026 — Iterathon](https://iterathon.tech/blog/multi-agent-orchestration-economics-single-vs-multi-2026)
- [Why Multi-Agent LLM Systems Fail (and How to Fix Them) — Augment Code](https://www.augmentcode.com/guides/why-multi-agent-llm-systems-fail-and-how-to-fix-them)
- [Understanding and Mitigating Failure Modes in LLM-Based Multi-Agent Systems — MarkTechPost](https://www.marktechpost.com/2025/03/25/understanding-and-mitigating-failure-modes-in-llm-based-multi-agent-systems/)
- [A Minimal Agent for Automated Theorem Proving (2026)](https://arxiv.org/html/2602.24273)
- [AI-Generated Code Creates New Wave of Technical Debt — InfoQ (2025)](https://www.infoq.com/news/2025/11/ai-code-technical-debt/)
- [Multi-Agent LLM Systems in 2025 — VoltAgent](https://voltagent.dev/blog/multi-agent-llm/)
