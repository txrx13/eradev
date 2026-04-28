# v10 Theoretical Research Report -- 5 Design-Level Items

> Date: 2026-04-12
> Role: [ANALYST] (EN stack)
> Role file: `roles/analyst_EN.md`
> Task type: research (theoretical v10 horizon items)
> B-modality: **B_research** (weights F=0.30, E=0.20, (1-sigma)=0.35, Lambda=0.15)
> Output type: Report (META output type 5) -- input for META v10 roadmap decisions
> Scope: research-only. No file modifications. No implementation specs.

---

## 0. Activation Operator log

- **A_F (Focus):** Read in full -- `roles/analyst_EN.md`; `eradev.md` Sections 0-XVII (full); `CLAUDE.md` (14 invariants + domain awareness + loading sequence); `reports/roadmap_v9_2026-04-11.md` (Phase 3 v10 future work); `reports/v9_odtoe_multiagent_mining_2026-04-11.md` (DEFER-1..4 + OQ-MM-1..6); `reports/v9_phase2_hansei_2026-04-12.md` (v10 horizon list); `.claude/hooks/enforce-delegation.sh` + `agent-context-check.sh` (Claude Code-specific mechanisms); `.claude/settings.json` (hook configuration); `.claude/skills/eradev/` directory (skill bundle structure). All 5 research items scoped against current v9 state.
- **A_E (Alignment):** Operator's direct request: "v10 horizon" with parallel execution. This Analyst covers 5 theoretical items that need design-level research before any Builder session. The output is ranked recommendations with honest effort estimates, NOT implementation specs.
- **A_sigma (Consistency):** Primary risk -- designing v10 features that conflict with v9 invariants (14 in CLAUDE.md) or ODTOE core (eradev.md Sections I-III, immutable per roadmap L0). Every recommendation is cross-checked against these.
- **A_Lambda (Experience):** Applied -- BL-16 (knowledge without enforcement = Lambda zero -- recurrence risk in all 5 items); BL-15 (spiral gap ~2% is a feature, not a bug -- v10 features should preserve this); BL-26 (META always delegates -- any v10 mechanism must respect delegation invariant); Lesson 2 from `projects/eradev/lessons.md` (P_coll propagation -- shared-source phantom coherence risk when reasoning about v10 extensions to v9 math); EMP1 (self-application is the ultimate test -- any v10 design should be testable on EraDev itself).

All 4 Activation Operator steps GREEN. Proceeding.

---

## 1. Continuous/Flow Task Support

### 1.1 Current state (v9)

v9 explicitly scopes to **text-discrete artifacts** via eradev.md Section II.2. The AND-gate requires both (I) discreteness (measurable boundaries) and (II) objective verification. Continuous/flow tasks are listed in the OOD registry with clear rejection reasons:

- Meditation guidance -- fails both criteria
- Music improvisation -- fails (I)
- Free-verse poetry -- fails (II)
- Live RPG roleplay -- fails (I)
- Real-time streaming -- fails (I)

The OOD registry already provides IN-scope alternatives for each ("write a meditation script" is IN-scope as B_creative; "write structured musical notation" is IN-scope if structured). v9's R5 (scope creep risk) and FM5 (failure mode: scope creep into continuous tasks) are explicit defenses.

### 1.2 Gap (what v10 would need)

The gap is NOT "make everything work." It is: **what is the smallest class of currently-OOD tasks that could be admitted with a bounded B-formula extension?**

Three sub-gaps:

**Sub-gap A -- B-formula form.** The multiplicative B = F^w1 * E^w2 * (1-sigma)^w3 * Lambda^w4 assumes the artifact exists as a completed object at measurement time. Continuous artifacts (a live meditation session, an improvised piece) have no "completion" boundary. Options:
- **Windowed B:** measure B over a fixed time/token window (e.g., every 500 tokens). The artifact becomes a sequence of windows, each scored independently. B_session = mean(B_window_i). This preserves multiplicative structure within each window.
- **Trajectory B:** replace single B with B(t), a time-parameterized coherence curve. The quality metric becomes the integral or minimum over the trajectory. This breaks the current scalar B assumption everywhere.
- **Discretize-then-score:** force the continuous artifact through a discretization step (transcribe, segment, snapshot) and score the discrete result with existing B. This is v9's current approach ("write a script for meditation is IN-scope") but with explicit discretization protocol rather than ad-hoc rephrasing.

**Minimum viable:** Windowed B is the smallest extension. It requires only: (a) a window-size parameter per domain, (b) a B_window aggregation rule (mean, min, or percentile), (c) a "session end" trigger that finalizes the trajectory.

**Sub-gap B -- Verification method.** v9's six verification methods (build, cite_check, readability, parse, dry_run, recompute) all assume a terminal artifact. Continuous tasks need a verification method that works mid-stream. Candidates:
- **checkpoint_review:** periodic snapshots verified against structural constraints (e.g., meditation script: "does the current segment maintain voice consistency with the opening?")
- **constraint_count:** countable structural constraints checked per window (e.g., syllable targets, tonal progression rules, thematic arc markers)
- **coherence_drift:** measure (1-sigma) between consecutive windows; drift above threshold triggers Andon

**Minimum viable:** checkpoint_review is sufficient for v10 prototype. It maps to existing readability/cite_check patterns.

**Sub-gap C -- Role definitions.** Can Validator "verify" a meditation script? Yes, if verification is redefined as "does this window satisfy its declared structural constraints?" The Validator role file already uses abstract language ("Does the artifact match the specification?"). The constraint is in the domain skin, not the role.

### 1.3 Minimum viable design

**Smallest useful v10 expansion:** admit structured continuous tasks (poetry with prosody, musical notation with harmonic rules, meditation scripts with structural markers) by:

1. Add `B_continuous` modality with Windowed B measurement: `B_modality: continuous` in config.md
2. Add `verify.method: checkpoint_review` to the verify method registry
3. Add window-size parameter to domain config: `domain.window_tokens: 500`
4. Add 1 domain skin: `templates/domain_skin.continuous.md` with checkpoint vocabulary
5. Remove the AND-gate hard block in Section II.2 for tasks tagged `ood_scope: structured-continuous` (new enum value between `text-discrete` and `continuous`)
6. Keep `ood_scope: continuous` as REJECT (unstructured continuous remains OOD)

**NOT in scope for v10:** Trajectory B (too complex), real-time streaming (requires async architecture), aesthetic judgment verification (no objective basis).

### 1.4 Effort estimate

**M** -- new modality row in Section II.1, new enum value in Section II.2, 1 domain skin, update to CLAUDE.md domain awareness, 1 smoke test. Single RT-1 session for design, 1-2 Builder sessions for implementation.

### 1.5 Risk

- **R1 (HIGH): Scope creep.** This is the #1 cited risk in the roadmap (R5). Once `structured-continuous` exists, pressure to expand to `unstructured-continuous` will be immediate. Defense: the AND-gate for `continuous` remains. Only `structured-continuous` (new middle category) is admitted.
- **R2 (MEDIUM): Windowed B calibration.** Window size affects B values -- too small = noise, too large = misses drift. No empirical data exists. Defense: v10 ships with `window_tokens: 500` as default, logs actual values for v11 calibration.
- **R3 (LOW): Role file changes.** Minimal -- Validator already uses abstract language. Domain skin carries the specifics.

### 1.6 Recommendation

**v10 PROTOTYPE.** Ship `structured-continuous` as a narrow category with 1 domain skin and Windowed B. Keep `continuous` as REJECT. Evaluate after 3 smoke tests. If Windowed B does not add signal over "just discretize the artifact first," REJECT and keep v9's approach permanently.

### 1.7 Dependencies

- v9 Phase 2 fully closed (domain skin system stable)
- v9 smoke tests for book/plan/config/research skins completed (to confirm skin system works broadly before extending it)
- No dependency on items 2-5 in this report

---

## 2. Apophatic Role (6th Role)

### 2.1 Current state (v9)

v9 ROADMAP D2 resolved: "No 6th role in v9." The two functions that an Apophatic role would serve are currently distributed:

- **OOD detection** ("this task is NOT decomposable") -- assigned to Visionary at RT-0 (pre-RT-1 screening)
- **Flow protection** ("this scope is creeping") -- assigned to Coherent during RT-2

The roadmap states: "Reconsider in v10 if dual-role function fails."

### 2.2 Gap (when does the dual-role approach fail?)

After analyzing the v9 RT protocol and failure modes, I identify **3 scenarios** where the dual-role approach may fail:

**Failure scenario 1: Visionary accepts a composite task.** Visionary's RT-0 check is scope-level: "is this task IN-scope for v9?" A task like "write a meditation script AND a deployment guide for it" is technically text-discrete (both parts are files) but the meditation script sub-task may be OOD depending on its structure. Visionary sees the composite as IN-scope because the whole task produces discrete files. The OOD sub-task enters RT-1 undetected. **Root cause:** Visionary checks the task envelope, not sub-task decomposition.

**Failure scenario 2: Coherent detects scope creep too late.** Coherent's flow protection activates at RT-2 (midpoint). If scope creep happens between RT-1 and the first RT-2 checkpoint, Builder has already committed effort on an expanded scope. The Coherent catches it but the cost is sunk. **Root cause:** Coherent's flow check is periodic (RT-2), not continuous.

**Failure scenario 3: Neither role challenges the PREMISE.** Both Visionary and Coherent work WITHIN the task frame. Neither is structurally incentivized to ask "should this task exist at all?" or "is this task a symptom of a different problem?" The Bottleneck Protocol (Section XII) provides a mechanism (TRIZ contradiction unpacking + SMD multi-perspective) but it is triggered by BLOCKERS, not by well-formed tasks that should not be done.

### 2.3 What would an Apophatic role DO?

An Apophatic role would be a **negation-based reviewer** whose core question is: "What is this task NOT?" Concrete functions:

1. **Sub-task OOD screening:** decompose the task into atomic sub-tasks and check each against OOD criteria independently. This catches Failure Scenario 1.
2. **Premise challenge:** at RT-1, ask "what would happen if we do NOT do this task?" If the answer is "nothing bad," the task is optional and should be deprioritized. This addresses Failure Scenario 3.
3. **Negative specification:** produce a "NOT-list" for each task: "this task does NOT change X, does NOT affect Y, does NOT require Z." This constrains blast radius explicitly.
4. **Continuous scope monitoring:** unlike Coherent's RT-2 checkpoint, Apophatic monitoring would be per-Builder-output (after each commit/artifact). This addresses Failure Scenario 2.

### 2.4 Theoretical impact on P_coll and n_min

If n changes from 5 to 6:

**P_coll impact:** `P_coll(E) = 1 - Product(1 - Bi^k)` with n=6 gives higher P_coll than n=5 at equal B (one more agent contributing). At B=0.5, k=1: P_coll(5) = 1 - 0.5^5 = 0.969; P_coll(6) = 1 - 0.5^6 = 0.984. Marginal gain: +0.015. At B=0.3: P_coll(5) = 0.832; P_coll(6) = 0.882. Marginal gain: +0.050. The marginal value of a 6th role is highest when individual B is low (exactly when you need OOD protection most).

**n_min derivation:** v9 derives n_min = ceil(pi) + 1 = 5 from ODTOE topology (eradev.md Section V). The "+1" is for redundancy. A 6th role does NOT change n_min -- it adds above the minimum. The topology question is whether a 6th role fits the torus: inner ring (Analyst-Builder-Validator) has 3 nodes, outer ring (Visionary-Coherent-Analyst) has 3 nodes (Analyst bridges). A 6th role could sit on the outer ring (Visionary-Apophatic-Coherent-Analyst), making the outer ring 4 nodes. This changes R/r from 3/3 = 1 to 4/3 = 1.333, which is NOT phi (1.618). The torus ratio breaks.

**Alternative topology:** Apophatic as a CHECK FUNCTION, not a role. It does not sit on the torus -- it is a gate applied BEFORE RT-1 (like Visionary's RT-0) and AFTER each Builder artifact (like Validator's verification). This preserves n=5 and the torus topology while adding the negation function.

### 2.5 Effort estimate

- **As a 6th role:** L -- requires updating eradev.md Section V (n_min derivation), all RT protocols (Section VI), task classification (Section X), CLAUDE.md invariants 1/9/11, all domain skins, Coherent hierarchy, and 2 new role files (EN + RU). Torus topology disruption.
- **As a gate function:** S-M -- add Apophatic Gate to Section IV (after Activation Operator, before RT-1). 1 new subsection in eradev.md + 1 CLAUDE.md invariant update + 1 BL addition. No role file needed. No topology change.

### 2.6 Risk

- **R1 (HIGH): Topology disruption.** A 6th role breaks the R/r = phi torus ratio. The mathematical substrate of v9 depends on this ratio (KAM theorem stability). This is not cosmetic -- it is structural.
- **R2 (MEDIUM): Over-filtering.** An Apophatic gate that challenges every premise slows ALL tasks, not just the edge cases it targets. False positive rate matters.
- **R3 (LOW): Role confusion.** Apophatic functions overlap with Validator (checking) and Visionary (scoping). Clear responsibility boundaries needed.

### 2.7 Recommendation

**v10 PROTOTYPE as gate function, NOT as 6th role.** Implement Apophatic Gate (pre-RT-1 sub-task OOD decomposition + premise challenge) as an extension of Section IV Enforcement Gates. Preserve n=5, preserve torus. If the gate fires in >20% of real tasks, reconsider role promotion in v11. If it fires in <5%, REJECT -- the dual-role approach is sufficient.

### 2.8 Dependencies

- v9 smoke tests providing failure-mode data (evidence of Scenarios 1-3 occurring in practice)
- Item 1 (continuous support) resolved first -- Apophatic Gate must know what `structured-continuous` means to screen for it
- No dependency on items 3-5

---

## 3. L10-L12 Framework Levels

### 3.1 Current state (v9)

v9 is Level 9 (self-modifying framework). eradev.md Section VIII defines the 3-6-9 ladder:

| Level | Description | Status |
|-------|------------|--------|
| 3 | Self-check (Jidoka) | Active |
| 6 | Full cycle with feedback (RT-1 -> Build -> RT-3) | Active |
| 9 | Self-modification of observation operator | Emerging |

The roadmap mentions L10 (cross-domain Lambda), L11 (multi-attractor Psi*), L12 (global Omega) as v10+ but provides no definitions. The ODTOE fixed-point equation `Psi* = Phi(Psi*)` is the formal substrate.

### 3.2 Gap -- what each level would mean concretely

**L10: Cross-domain Lambda.** A lesson from project A improves performance on project B without explicit transfer.

- **Is this different from Omega(H_hist)?** Partially yes. Omega(H_hist) (eradev.md Section III.Omega) is currently **same-project only** -- N_relevant counts lessons from the same project's memory. Cross-domain Lambda would mean: an agent working on `projects/plugy/` benefits from a lesson in `projects/odtoe-articles/lessons.md` because the lesson's abstract pattern (not its domain-specific content) transfers.
- **Concrete mechanism:** Extend the relevant-lesson predicate (Section III.Omega) with a 5th structural match: **5. Same abstract pattern** -- T's task structure mirrors L's regardless of domain. Example: "fix chain >= 3" lesson from code project prevents the same anti-pattern in a book editing project.
- **Is this a NEW mechanism or scaling?** It is a **scaling of Omega** with a cross-project lesson index. The mechanism (log-weighted multiplier) stays the same. The predicate expands. The threshold for "same abstract pattern" is the new design challenge -- too loose = phantom coherence across projects, too tight = no transfer.
- **Breakdown threshold:** Omega breaks down when project count exceeds ~10 and lesson corpus exceeds ~200. At that scale, naive string matching on the predicate produces too many false positives. A compression step (BL_CANDIDATES.md -> distilled patterns) is required before L10 works. v9's Phase 2.B shipped BL_CANDIDATES.md as the staging area; v10 would need the actual compression protocol.

**L11: Multi-attractor Psi*.** Multiple stable configurations per project.

- **What does this mean?** Currently, each project converges to a single fixed point Psi* (the stable release). Multi-attractor means: a project can be in state Psi*_code (optimizing for runtime performance) AND state Psi*_docs (optimizing for readability) simultaneously, and both are stable.
- **How does this differ from v9's domain skins?** Domain skins are per-PROJECT, not per-ARTIFACT-within-project. A code project with a domain skin still has one Psi* -- all artifacts converge to the same quality standard. Multi-attractor would mean: within `projects/eradev/`, the code artifacts converge to B_text and the documentation artifacts converge to B_creative, with different Psi* for each.
- **Is this new or scaling?** This is a **new mechanism**. v9's per-task modality override (Section II.2 edge cases: "Fix auth bug = B_text, Write user-guide = B_creative") is the embryo. But v9 does not track per-attractor stability separately. Multi-attractor needs: (a) per-artifact-class B tracking within a project, (b) per-attractor S_team (do all documentation artifacts converge among themselves?), (c) cross-attractor coherence metric (do the code attractor and docs attractor produce compatible outputs?).
- **Breakdown threshold:** v9's single-attractor model works fine when a project has one dominant artifact type. It breaks when a project is genuinely multi-modal (e.g., a research project that produces code, papers, and presentations simultaneously). EraDev itself is close to this boundary -- it produces framework files (B_text), research reports (B_research), and domain skins (B_creative). Currently handled by per-task overrides, but the project-level coherence is measured with a single S_team.

**L12: Global Omega.** Cross-project retrospective coherence -- all projects improving together.

- **Is this just Omega(H_hist) at larger scale?** Yes and no. The mechanism (log-weighted multiplier) scales. But the semantic challenge is different: cross-project Omega requires understanding WHY a lesson from project A applies to project B. Same-project Omega uses structural match (same role, same modality, same artifact type, same failure fingerprint). Cross-project Omega needs abstract pattern matching, which is the L10 mechanism.
- **Concrete meaning:** Global Omega = `Omega_global = 1 + alpha * log(1 + N_relevant_cross)` where N_relevant_cross counts relevant lessons from ALL projects in the operator's portfolio. At scale, this becomes a recommendation system: "this lesson from project X is relevant to your current task on project Y."
- **Is this a new mechanism?** It is L10's mechanism (cross-domain predicate) applied at portfolio scale. L12 is L10 + scale, not L10 + new math.

### 3.3 Minimum viable design

For each level, the smallest useful implementation:

**L10 (cross-domain Lambda):**
- Add predicate 5 ("same abstract pattern") to the relevant-lesson predicate in Section III.Omega
- Add `cross_project` field to temporal metadata in lessons.md
- Add Coherent compression protocol for BL_CANDIDATES.md (distill 10+ candidates into abstract patterns)
- Scope: single operator, 2-3 projects

**L11 (multi-attractor Psi*):**
- Add per-artifact-class B tracking to RT-3 reporting
- Add multi-attractor S_team: `S_team_class = S_team computed only across agents working on artifact class C`
- Define cross-attractor coherence: `S_cross = min(S_team_class_i) for all classes in project`
- Scope: 1 project with 2 artifact classes (e.g., EraDev itself: framework files + research reports)

**L12 (global Omega):**
- This is L10 at portfolio scale. No new mechanism beyond L10.
- Add portfolio-level RT-3 reporting (across projects, once per session)
- Scope: 3+ projects with shared operator

### 3.4 Effort estimate

- **L10:** M -- predicate extension + compression protocol + cross-project index. One RT-1 for design, 2 Builder sessions.
- **L11:** L -- multi-attractor tracking + cross-attractor coherence is a significant extension to Section III + RT-3 reporting. One RT-1 + RT-2, 3 Builder sessions.
- **L12:** S (conditional on L10) -- if L10 is implemented, L12 is scaling the same mechanism. One Builder session for reporting extension.

### 3.5 Risk

- **R1 (HIGH): L11 prematurity.** No project currently needs multi-attractor tracking. EraDev is the closest candidate but per-task overrides work. Building L11 without a use case = solution looking for a problem.
- **R2 (MEDIUM): L10 phantom coherence.** Cross-project lessons may produce false relevance matches. The abstract-pattern predicate is hard to make precise without becoming vacuous.
- **R3 (LOW): L12 irrelevance.** With <5 projects, global Omega is indistinguishable from L10. L12 matters at portfolio scale (10+ projects) which no current operator has.

### 3.6 Recommendation

- **L10:** v10 IMPLEMENT. The substrate exists (BL_CANDIDATES.md, temporal metadata, Omega formula). The gap is the compression protocol and the 5th predicate. Achievable in one RT-1 cycle.
- **L11:** v11+ DEFER. No current project needs it. Per-task modality override is sufficient for v10's scale. Revisit when a project with 3+ artifact classes exists and the per-task override creates coordination problems.
- **L12:** v11+ DEFER (auto-follows L10). When L10 is stable and 3+ projects exist, L12 becomes a reporting extension, not a new mechanism.

### 3.7 Dependencies

- L10 depends on: v9 Phase 2.B memory hierarchy fully deployed (temporal metadata, BL_CANDIDATES.md staging)
- L11 depends on: L10 (cross-domain patterns needed before multi-attractor makes sense)
- L12 depends on: L10 (portfolio = L10 at scale)

---

## 4. Cross-Harness Parity

### 4.1 Current state (v9)

EraDev runs exclusively in Claude Code. The current architecture has two layers of Claude Code-specific mechanisms:

**Layer A: Claude Code-specific (would need adaptation):**

| Mechanism | Claude Code Feature | Function |
|-----------|-------------------|----------|
| `CLAUDE.md` auto-loading | CLAUDE.md convention | Session bootstrap -- framework auto-loads at session start |
| Hooks (PreToolUse) | `.claude/settings.json` hooks | `enforce-delegation.sh` blocks META direct work; `agent-context-check.sh` enforces Invariant 12 (self-loading) |
| Agent tool | Claude Code Agent tool | Spawn subagents with role-specific prompts |
| CronCreate | Claude Code built-in | Background extraction scheduling (Phase 2.C) |
| Skill registration | `.claude/skills/` | Eradev skill bundle (`SKILL.md` + file tree) |
| MEMORY.md persistence | `~/.claude/projects/*/memory/` | Cross-session identity and feedback storage |

**Layer B: Portable (pure Markdown, works anywhere):**

| Mechanism | Files | Function |
|-----------|-------|----------|
| ODTOE core math | `eradev.md` Sections I-III | B formula, S_team, P_coll, Omega |
| RT protocol | `eradev.md` Section VI | Round Table phases |
| Role definitions | `roles/*_EN.md`, `roles/*.md` | 10 role files (5 EN + 5 RU) |
| Domain skins | `templates/domain_skin.*.md` | 6 domain-specific overlays |
| Bootstrap Lessons | `BOOTSTRAP_LESSONS.md` | 30 BL (22 universal + 8 code-adapter) |
| Project configs | `projects/*/config.md` | Per-project settings |
| Project lessons | `projects/*/lessons.md` | Project memory |
| Domain skin template | `templates/domain_skin.md.template` | Schema for new skins |
| Meta protocol | `meta.md` | Session entry, RT coordination, reflection triggers |

**Assessment:** Layer B (the intellectual content) is 100% portable. Layer A (the enforcement and orchestration machinery) is Claude Code-specific. The ratio is roughly 70% portable / 30% harness-specific by file count, but the 30% includes ALL enforcement -- without it, BL-16 predicts Lambda = 0 (knowledge without enforcement).

### 4.2 What would a Cursor adapter look like?

Cursor uses `.cursorrules` instead of `CLAUDE.md` for auto-loading. Key differences:

| Feature | Claude Code | Cursor | Adaptation |
|---------|------------|--------|------------|
| Auto-load file | `CLAUDE.md` | `.cursorrules` | Rename + adapt format |
| Hook system | `.claude/settings.json` PreToolUse | `.cursor/rules/` glob-based rules | Rewrite hooks as Cursor rules |
| Agent spawning | Agent tool with prompt | Composer agents / multi-file edit | Different orchestration model -- Cursor does not have explicit subagent spawning with role assignment |
| Skills | `.claude/skills/` | Not applicable | Drop or repackage as instructions |
| Memory | `~/.claude/projects/*/memory/` | Cursor context files | Different persistence model |

**Critical gap:** Cursor does NOT have an Agent tool equivalent. META's core function (spawn 5 role agents for RT-1) has no direct mapping. Cursor's Composer can edit multiple files simultaneously but does not support independent agent perspectives with different role prompts. This is a FUNDAMENTAL architectural mismatch, not a surface-level port.

**Workaround:** Sequential role-playing. META prompts Cursor to "act as Visionary, then act as Analyst, then act as Builder..." in sequence within a single context. This loses the independence guarantee (RT-1/RT-3 require parallel independent perspectives to prevent confirmation bias -- see eradev.md Section VI RT Phase Protocols note on sequential anchoring producing S_team=0.97 but S_adjusted=0.33).

### 4.3 What would a Codex adapter look like?

Codex (OpenAI) operates as an API-only agent with sandboxed execution. Key differences:

| Feature | Claude Code | Codex | Adaptation |
|---------|------------|-------|------------|
| Auto-load file | `CLAUDE.md` | System prompt / project instructions | Embed CLAUDE.md content in system prompt |
| Hook system | Shell scripts | Not available | No enforcement layer -- BL-16 risk is maximal |
| Agent spawning | Agent tool | API-based multi-turn | Can simulate via API calls but no built-in orchestration |
| File system | Full local access | Sandboxed | Limited file ops -- some v9 patterns inapplicable |
| Memory | Persistent across sessions | Per-session only | No cross-session Lambda |

**Critical gap:** No hook system means no enforcement. EraDev's BL-30 (defense-in-depth) requires enforcement at multiple layers. Codex has exactly one layer (system prompt). This is the BL-16 failure mode by design.

### 4.4 What would a Gemini adapter look like?

Gemini (Google) has long-context windows but different tool calling semantics. The most relevant difference: Gemini does not have a built-in Agent tool. Its function calling is tool-level (like Claude Code's Edit/Write/Bash) not agent-level (like Claude Code's Agent tool). Same fundamental gap as Cursor.

### 4.5 Minimum viable design

**Minimum viable: one alternative harness running EraDev at L5+ (META delegates, RT-1 works).**

The minimum requires:
1. A harness with multi-agent support (independent parallel agent spawning with different prompts)
2. An auto-load mechanism (system prompt or equivalent)
3. An enforcement mechanism (at least 1 layer)

**Assessment of candidates:**

| Harness | Multi-agent | Auto-load | Enforcement | L5+ achievable? |
|---------|-----------|-----------|-------------|----------------|
| Claude Code | Yes (Agent tool) | Yes (CLAUDE.md) | Yes (hooks) | Already running at L9 |
| Cursor | No (Composer is sequential) | Yes (.cursorrules) | Partial (rules) | L3 max (self-check, no true RT) |
| Codex | Partial (API multi-turn) | Yes (system prompt) | No | L3 max (self-check only) |
| Gemini | No (no agent tool) | Yes (system prompt) | No | L3 max |
| LangGraph / custom | Yes (graph nodes) | Custom | Custom | L6+ possible with engineering |

**Finding:** No existing harness besides Claude Code supports L5+ without significant custom engineering. The Agent tool (spawn independent subagents with role-specific prompts) is the structural prerequisite. A custom harness built on LangGraph or a similar orchestration framework could achieve L6+ but requires building the orchestration layer from scratch.

### 4.6 Effort estimate

- **Cursor adapter (L3):** S -- create `.cursorrules` from CLAUDE.md, test basic delegation. Value: low (loses RT independence).
- **Custom harness (L6+):** XL -- build orchestration layer with multi-agent spawning, enforcement hooks, memory persistence. Multiple RT-1 cycles for design. Multi-week engineering.
- **Abstraction layer (harness-agnostic spec):** M -- write a `HARNESS_REQUIREMENTS.md` that specifies what any harness must provide (agent spawning API, auto-load mechanism, enforcement hooks, memory API). This is the prerequisite for any adapter.

### 4.7 Risk

- **R1 (HIGH): XL effort for marginal gain.** EraDev at L3 (self-check only) in Cursor/Codex provides minimal value over using those tools natively. The value of EraDev IS the multi-agent RT protocol, which requires L5+.
- **R2 (MEDIUM): Maintenance tax.** Each adapter requires maintaining parallel enforcement mechanisms, testing across harnesses, and tracking feature parity. With 6 domain skins x N harnesses, the combinatorial surface grows quadratically.
- **R3 (LOW): False portability.** A Cursor adapter that "runs EraDev" at L3 may give the impression of full support while losing the core value proposition (independent multi-agent perspectives).

### 4.8 Recommendation

**v10 PROTOTYPE -- harness requirements spec only.** Write `HARNESS_REQUIREMENTS.md` specifying: (a) agent spawning API contract (input: role name + prompt + context; output: agent response), (b) auto-load mechanism (minimum: one file loaded before first user message), (c) enforcement API (minimum: one pre-tool-use hook), (d) memory API (minimum: read/write per-session state). Do NOT build any adapter. Let the spec inform which harnesses to target in v11+.

**Rationale for not building adapters in v10:** the Agent tool is the single most important Claude Code feature for EraDev. Until another harness provides equivalent functionality, adapter work is premature optimization. If LangGraph or a similar framework matures to provide agent spawning with role isolation, revisit.

### 4.9 Dependencies

- No dependency on items 1-3
- Depends on v9 being stable (Phase 2 complete, 6 domain skins working)
- Harness requirements spec is prerequisite for any future adapter work

---

## 5. Declarative RT Graph

### 5.1 Current state (v9)

The RT protocol is described **procedurally** across two files:
- `eradev.md` Section VI: RT-1/RT-2/RT-3 phases, RT Phase Protocols table, Four-Tact Cognitive Cycle
- `meta.md`: Session entry protocol, agent spawning logic, RT coordination

META decides who to spawn in what order by reading the procedural description and applying it. The logic is: (1) classify task size, (2) determine role team from classification table, (3) spawn agents per RT Phase Protocols, (4) synthesize, (5) gate.

This works but has two weaknesses:
- **Implicit dependencies.** The rule "Builder COMPLETES first, THEN Validator starts" (Invariant 11) is encoded in CLAUDE.md as a text invariant, not as a structural dependency in a graph.
- **No visual representation.** The RT flow is described in prose. A new META agent must reconstruct the graph from reading ~200 lines of procedural text across 2 files.

### 5.2 What would a declarative RT graph look like?

A YAML/JSON document describing:

```yaml
# Conceptual example -- NOT a spec
rt_graph:
  name: "Standard M-task RT cycle"
  phases:
    - id: rt1
      type: parallel
      roles: [visionary, analyst, builder, validator, coherent]
      input: raw_task
      output: unified_plan
      gate: all_responses_received

    - id: execution
      type: sequential
      steps:
        - role: builder
          input: unified_plan
          output: artifacts
        - role: validator
          input: artifacts
          gate: all_checks_pass

    - id: rt2
      type: hybrid
      trigger: coherent_broadcasts_rt1_synthesis
      roles: [visionary, analyst, builder, validator]
      input: rt1_synthesis + artifacts
      gate: s_team > 0.5

    - id: rt3
      type: parallel
      roles: [visionary, analyst, builder, validator, coherent]
      input: final_artifacts
      output: go_nogo
      gate: "5/5 GO"

  scaling:
    S: { phases: [execution], skip: [rt1, rt2, rt3] }
    M: { phases: [rt1, execution, rt3] }
    L: { phases: [rt1, execution, rt2, execution, rt3] }
    XL: { phases: [rt1, execution, rt2, execution, rt3], multi_team: true }
```

### 5.3 Benefit analysis

**Would META benefit from "executing the graph" instead of hand-coding each phase?**

- **For S/M tasks:** Marginal benefit. META already knows the pattern. The procedural description is 6 lines of text. A declarative graph would be equally compact but requires a graph execution engine.
- **For L/XL tasks:** Moderate benefit. Multi-team coordination with Coherent hierarchy (L1/L2/L3) involves conditional branching that is hard to describe procedurally. A graph with explicit gates and dependencies would make the coordination pattern visible.
- **For harness portability (Item 4):** Significant benefit. A declarative graph is harness-agnostic -- any execution engine that can parse YAML and spawn agents can run it. This is the LangGraph connection: LangGraph provides exactly this pattern (state graph with nodes = agents, edges = dependencies).
- **For debugging/audit:** Significant benefit. "Why did META spawn Builder before Validator responded?" is answerable by inspecting the graph. Currently requires reading META's reasoning trace.

### 5.4 Risk: over-engineering

**Is the current procedural approach actually fine for v9's scale?**

Yes. v9 operates at max 2 teams (XL RT-1 was the largest: 10 agents in 2 parallel teams). The procedural description handles this. The declarative graph adds value at:
- 3+ teams (L3 Coherent hierarchy activated)
- Cross-project coordination (L10/L12 scope)
- Non-standard RT patterns (e.g., a research project that needs RT-1 -> Peer Review -> RT-2 -> Revision -> RT-3, with "Peer Review" being a custom phase)

None of these exist in v10's expected scope. They become relevant at L11+.

### 5.5 LangGraph pattern analysis

LangGraph (LangChain's graph-based agent framework) provides:
- **StateGraph:** nodes = functions (or agents), edges = transitions, state = shared dict
- **Conditional edges:** route based on state (e.g., "if S_team < 0.5, go to kill_switch node")
- **Parallel fan-out/fan-in:** spawn N nodes simultaneously, collect results
- **Checkpointing:** save state at each node for debugging/replay

Applicable to EraDev:
- RT-1 = fan-out to 5 role nodes, fan-in to synthesis node
- Execution = sequential chain (Builder -> Validator), with conditional loop on fix-chain
- RT-2 = conditional node (triggered by Coherent, then fan-out to 4 roles)
- RT-3 = fan-out to 5 role nodes, fan-in to go/no-go gate

**What LangGraph does NOT provide:** role-specific prompt loading (EraDev's self-load pattern), hook-based enforcement (Claude Code-specific), B/S_team computation (EraDev-specific math), domain skin selection (EraDev-specific).

**Assessment:** LangGraph is a useful execution substrate for the graph but does NOT replace EraDev's intellectual content. Using LangGraph = "EraDev's RT protocol encoded as a LangGraph StateGraph, running on any LLM, with EraDev's math as custom state updates."

### 5.6 Minimum viable design

**Smallest useful implementation:**
1. Write `rt_graph_schema.yaml` defining the graph vocabulary (phases, roles, gates, scaling)
2. Write 4 graph instances (S/M/L/XL) using the schema
3. META reads the graph at session start and uses it as a lookup table (not an execution engine)
4. No execution engine in v10 -- META interprets the graph manually, but the graph is the source of truth instead of the procedural text

This is a **documentation improvement** more than an architectural change. The graph does not REPLACE the procedural text in v9; it AUGMENTS it with a visual/structural reference.

### 5.7 Effort estimate

- **Graph schema + 4 instances (documentation only):** S -- 1 Builder session. YAML file + validation.
- **Graph execution engine (LangGraph or custom):** XL -- multi-week engineering project. Requires Item 4 (cross-harness parity) resolved first.
- **META graph interpreter (reads graph as lookup, no engine):** M -- update meta.md to reference graph file instead of procedural text. 1 RT-1 for design.

### 5.8 Risk

- **R1 (MEDIUM): Over-engineering.** A declarative graph for 4 task sizes (S/M/L/XL) may be more complex to read than the current 6-line procedural description. The graph adds value only when patterns diverge from the standard (custom phases, non-standard gates).
- **R2 (LOW): Premature lock-in.** Defining the graph schema before knowing what v10/v11 patterns need risks designing the wrong abstraction.
- **R3 (MEDIUM): LangGraph coupling.** If the graph schema is too LangGraph-specific, it limits harness portability. The schema should be framework-agnostic.

### 5.9 Recommendation

**v10 PROTOTYPE (schema only).** Write `rt_graph_schema.yaml` as a documentation artifact. Encode the 4 standard patterns (S/M/L/XL). Do NOT build an execution engine. Evaluate whether META agents find the graph easier to follow than the procedural text. If yes, promote to primary reference in v11. If no, REJECT -- procedural text is sufficient.

**NOT v10 scope:** LangGraph integration, custom execution engine, non-standard RT patterns. These are v11+ if the schema proves useful.

### 5.10 Dependencies

- No hard dependency on items 1-3
- Soft dependency on Item 4 (harness requirements spec) -- the graph schema should be harness-agnostic, so knowing the harness abstraction informs the schema design
- Depends on v9 RT protocol being stable (no pending changes to Section VI)

---

## 6. Priority Ranking (all 5 items)

| Rank | Item | Recommendation | Effort | Value/Effort | Why this rank |
|------|------|---------------|--------|-------------|---------------|
| 1 | **5. Declarative RT Graph** | v10 PROTOTYPE (schema only) | S | HIGH | Lowest effort, immediate documentation value, prerequisite for Items 3+4 at larger scale |
| 2 | **3. L10-L12 Framework Levels** (L10 only) | v10 IMPLEMENT | M | HIGH | Infrastructure (BL_CANDIDATES, temporal metadata) already exists from v9 Phase 2.B. L10 is the natural next step. L11/L12 deferred. |
| 3 | **2. Apophatic Role** | v10 PROTOTYPE as gate | S-M | MEDIUM | Low effort as gate function, preserves topology, addresses real (if infrequent) failure scenarios |
| 4 | **4. Cross-Harness Parity** | v10 PROTOTYPE (spec only) | M | LOW | No harness besides Claude Code supports L5+. Spec is prerequisite but adapter work is premature. |
| 5 | **1. Continuous/Flow Task** | v10 PROTOTYPE | M | LOW | High risk (scope creep), moderate effort, narrow benefit (few tasks currently blocked by OOD). Worth prototyping but lowest priority. |

**Rationale for ranking:** Items are ranked by `(value delivered in v10) / (risk of scope creep + effort)`. Item 5 (RT graph) ranks first because it is the only S-effort item with immediate documentation value. Item 3 (L10) ranks second because the substrate already exists. Item 1 (continuous) ranks last because its #1 risk (scope creep) is also v9's #1 risk (R5) -- introducing it creates the exact problem v9 was designed to avoid.

---

## 7. Cross-Item Dependency Map

```
                   (v9 stable)
                       |
           +-----------+-----------+
           |           |           |
      [5. RT Graph]  [3. L10]   [4. Harness Spec]
       (schema)    (cross-domain)  (requirements)
           |           |           |
           |     [3. L11] (v11+)   |
           |           |           |
      [2. Apophatic Gate]    [4. Adapters] (v11+)
           |
      [1. Continuous]
           |
      [3. L12] (v11+, auto-follows L10)
```

**Hard dependencies (arrows):**
- Item 1 (continuous) depends on Item 2 (Apophatic Gate knows what structured-continuous means)
- Item 3 L11 depends on L10
- Item 3 L12 depends on L10
- Item 4 adapters depend on Item 4 spec + Item 5 graph schema (adapters execute the graph)

**Soft dependencies (informing):**
- Item 5 (graph schema) informs Item 4 (harness spec should support graph execution)
- Item 4 (harness spec) informs Item 5 (graph schema should be harness-agnostic)

**No dependency:**
- Items 5 and 3(L10) are fully independent. Both can start in parallel.
- Items 4(spec) and 3(L10) are fully independent.

---

## 8. Open Questions (Spiral Gap)

- **OQ-v10-1:** Does Windowed B (Item 1) actually add signal over "just discretize the artifact"? Needs empirical test before committing.
- **OQ-v10-2:** What is the false-positive rate of an Apophatic Gate on standard M-tasks? If >20%, the gate is net-negative.
- **OQ-v10-3:** Is L10's cross-project lesson predicate ("same abstract pattern") operationally definable, or is it inherently fuzzy? The compression protocol for BL_CANDIDATES.md may be the answer -- compressed patterns ARE the abstract patterns.
- **OQ-v10-4:** Does any harness besides Claude Code currently plan to add an Agent tool equivalent? If so, that harness is the natural first adapter target.
- **OQ-v10-5:** Should the RT graph schema include non-standard phases (e.g., "Peer Review" for research projects)? Or should it be limited to the 4 standard patterns (S/M/L/XL)?
- **OQ-v10-6:** At what project count does L12 (global Omega) become distinguishable from L10 (cross-domain Lambda)? Threshold estimate: 5+ projects with 10+ lessons each. Below that, L12 = L10 operationally.
- **OQ-v10-7:** The Apophatic Gate (Item 2) and continuous-task OOD screening (Item 1) overlap: both need sub-task decomposition. Should they share a mechanism?
- **OQ-v10-8:** Phase-Adaptive Weights (DEFER-2 from ODTOE mining report) -- when does per-phase B measurement become feasible? This is a prerequisite for calibration data.

---

## 9. B-check (Jidoka Self-Check)

```
=== JIDOKA SELF-CHECK ===
Modality: B_research (F=0.30, E=0.20, (1-sigma)=0.35, Lambda=0.15)

F (Focus)       = 0.88
  + All 5 items researched against: eradev.md (full), CLAUDE.md (full),
    roadmap (full), ODTOE mining report (full), Phase 2 Hansei (full),
    hook files (both), skill structure (directory listing), settings.json.
  - Did not read meta.md in full (referenced for session entry protocol only).
  - Did not read all 10 role files (read analyst_EN.md; inferred others).
  - Did not read LangGraph documentation (used general knowledge).

E (Alignment)   = 0.92
  + All 5 items have the 7 required output fields (current state, gap,
    minimum viable, effort, risk, recommendation, dependencies).
  + Priority ranking with rationale provided.
  + Cross-item dependency map provided.
  + Honest about v10-achievable vs v11+/aspirational for each item.
  - Item 5 (RT graph) YAML example is conceptual, not validated against
    actual RT protocol edge cases (e.g., L2/L3 Coherent multi-team).

(1-sigma) (Consistency) = 0.90
  + All recommendations cross-checked against 14 CLAUDE.md invariants.
  + No recommendation changes L0 (ODTOE core Sections I-III).
  + Item 2 (Apophatic) explicitly preserves n=5 and torus topology.
  + Item 1 (continuous) preserves AND-gate for unstructured continuous.
  - Item 4 (cross-harness): Cursor/.cursorrules claim not independently
    verified -- based on general knowledge of Cursor, not documentation.
  - Item 5 (RT graph) schema may conflict with procedural text if both
    coexist -- needs Coherent gate at implementation time.

Lambda (Experience) = 0.82
  + Applied BL-16 (enforcement) to all 5 items -- each recommendation
    addresses "how is this enforced, not just documented?"
  + Applied BL-15 (spiral gap) -- 8 open questions preserved.
  + Applied Lesson 2 (P_coll propagation) -- flagged phantom coherence
    risk in L10 cross-project lessons.
  + Applied EMP1 (self-application) -- each item tested against "could
    EraDev itself use this?"
  - Did not consult BOOTSTRAP_LESSONS_universal.md directly (used
    roadmap's BL summary instead).

B = 0.88^0.30 * 0.92^0.20 * 0.90^0.35 * 0.82^0.15
  = 0.963 * 0.983 * 0.964 * 0.970
  = 0.883

B = 0.883 (above 0.5, no Andon)
min(F, E, 1-sigma, Lambda) = 0.82 (Lambda -- above 0.3, no weak link)
```

---

**End of v10 Theoretical Research Report. 5 items researched. Ready for META decision on v10 roadmap inclusion.**
