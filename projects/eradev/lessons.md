# EraDev Self-Project — Lessons & Patterns

> Temporal metadata format: `<!-- valid_from: DATE | ended: DATE|null | superseded_by: ID|null | cross_project: bool -->`
> Lifecycle tags: [ACTIVE] | [SUPERSEDED] | [ARCHIVED]
> EMPs: valid_from matches session date; EMPs never get `ended` (immortal within lessons.md)

## Session 1: Framework Rebuild (April 2026)

### Origin
EraDev v7.1 was rebuilt from scratch by 25 agents (5 RT × 5 roles) analyzing two prior versions (eradev_old and eradev_last). This was the first application of the framework to itself — Level 9 self-modification (Psi* = Phi(Psi*)).

### Lessons

### L-1..L-4, L-6, L-7, L-10: [ARCHIVED 2026-04-25 → lessons_archive.md]
<!-- Compression Pass 2026-04-25: codified into framework artifacts (Inv 13, EMP9, CLAUDE.md Language Stack, eradev.md Section 0, meta.md §14, EMP3+L-23, project tooling). Full content preserved in lessons_archive.md. -->

### L-5: Pluggy session identity enforcement failure [SUPERSEDED]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: L-11 | cross_project: true -->
5. **Pluggy session (real deployment): 95% solo Builder, 5% delegation.** Root cause: bootstrap prompt said "read and proceed" without declaring META identity. Fix: CLAUDE.md auto-bootstrap + meta.md Section 14 checklist. This is the Lambda problem (BL-16): knowledge without enforcement = zero.
<!-- Supersede note: L-11 (3-Layer Identity Enforcement) addresses the same single-point-collapse failure mode with mechanical 3-layer redundancy. Pluggy 95% solo is the canonical instance L-11 solves. -->

### L-8: Check-First prevents format rework [SUPERSEDED]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: EMP11 | cross_project: true -->
8. **Article format: Check-First prevents 100% of format rework.** Research article was generated with wrong format (no comment groups, \hrule between sections, wrong keywords format). Reading ODTOE_article.tex BEFORE generation would have prevented all issues. Fix: Check-First pipeline in odtoe-articles config.md.
<!-- Supersede note: EMP11 (7-step first-use pipeline) generalizes Check-First into a domain-invariant pipeline (pre-flight → self-test → smoke → cleanup) for any new abstraction. Check-First is step 1 of the EMP11 pipeline. -->

### L-9: S_adjusted formula discovery [SUPERSEDED]
<!-- valid_from: 2026-04-04 | ended: 2026-04-25 | superseded_by: L-22 + EMP9 | cross_project: false -->
9. **S_adjusted = S_team × B_mean — discovered through A/B experiment.** RU-group had S_team=0.95 (high agreement) but B_mean=0.346 (low quality). Without S_adjusted, RU appears healthier. S_adjusted correctly shows EN (0.447) > RU (0.329). All 10 agents in the next experiment independently found a glossary conflict (two S_adjusted definitions).
<!-- Supersede note: L-22 (Phantom Coherence Check as release gate) cites S_adjusted as the dissonance-amplifying metric and codifies its operational use; EMP9 (structural invariance) explains why the multiplicative form is correct. Discovery context preserved for genealogy. -->


## Mega-Patterns

### EMP1: Self-application is the ultimate test [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
When the framework is applied to improve itself, every weakness becomes visible. The Lambda problem, the sync problem, the format problem — all were discovered by using EraDev on EraDev.

### EMP2: A/B experiments are the highest-value activity [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
Two A/B experiments (RU vs EN, router vs inline) produced more actionable data than 20 analytical reports combined. When in doubt, test don't argue.

### EMP3: The bilingual architecture is a feature, not a bug [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
EN for breadth, RU for depth. Running both in parallel and synthesizing at RT produces better results than either language alone. The language is an observation operator, not a neutral carrier.

### EMP4: Enforcement must live where it fires [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
Bootstrap checklist in eradev.md (read by everyone) was theoretically visible but practically ignored. Moved to meta.md (read only by META) where it actually fires. CLAUDE.md (auto-loaded) is the ultimate enforcement — the agent cannot skip it.

### EMP5: Scope determines pipeline strictness [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
External-dependency tasks (APIs, SSH, third-party services) need stricter gates than isolated internal work. In cycle-7, 58% of feature commits (isolated UI/logic) had 0 fixes, while 83% of all fixes concentrated in 4 boundary chains (gossip, badge, external API). The pipeline should scale its rigor based on boundary surface area: more external dependencies = more verification gates (PRE-FLIGHT, smoke test, error path matrix).

### EMP6: Enforcement without mechanism is Lambda zero, recursively [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
60-65% of cycle-7 proposals already existed as rules in BL-1 through BL-21 (cycle-7 era numbering; post-2026-04-20 main BOOTSTRAP_LESSONS.md: BL-14 merged into BL-8, BL-21 merged into BL-17, BL-20 retired to meta.md §13 MM3). The system knew what not to do; it did it anyway. Seven out of nine incidents had root causes that existing rules already addressed. Adding more rules without adding enforcement mechanisms (checklist items, automated gates, agent prompts) will produce the same result. This is the Lambda problem (BL-16) applied to the system itself: the framework reads its own rules and ignores them. The highest-leverage action is not "add BL-22 through BL-26" but "add enforcement gates for BL-3, BL-6, BL-13 that already exist."

### EMP7: Optimization Without Orientation Is Hill-Climbing Into Fog [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
Every optimization loop must be embedded within an orientation loop. The optimization loop (edit -> run -> score -> keep/discard) determines how FAST you move. The orientation loop (True North re-derivation, Kill-Switch, Visionary re-assessment) determines WHETHER you move in the right direction. One without the other produces either stagnation (orientation without optimization) or efficient convergence to the wrong answer (optimization without orientation).

Rule: At every 10th iteration of any score-driven loop, pause optimization and run a mini-RT with at least Visionary + Coherent. The question is not "is the score improving?" but "is the thing we are scoring still the right thing to score?" If the answer is no, redefine the score function before resuming.

Source: AutoAgent analysis (April 2026) -- AutoAgent achieves speed through score-driven hill climbing but lacks orientation mechanism. EraDev achieves orientation through RT deliberation but lacks optimization speed. The synthesis: embed optimization within orientation.

### Session 2: v8 META-Orchestration Architecture (April 2026)

### L-11: 3-Layer Identity Enforcement [ACTIVE]
<!-- valid_from: 2026-04-07 | ended: null | superseded_by: null | cross_project: true -->
11. **3-Layer Identity Enforcement eliminates single-point collapse.** Single CLAUDE.md enforcement failed in pluggy (95% solo Builder). Adding hook + memory persistence creates 3 independent firing points. Any single layer failing leaves 2 active.

### L-12: META Output Type Spec structural fix [ACTIVE]
<!-- valid_from: 2026-04-07 | ended: null | superseded_by: null | cross_project: true -->
12. **META Output Type Spec is the structural fix for context pollution.** Identity drift was diagnosed not as behavioral but structural: untyped outputs allow any behavior. Enumerating 5 permitted output types makes code output structurally impossible.

### L-13: [ARCHIVED 2026-04-25 → lessons_archive.md]
<!-- Compression: codified in eradev.md RT protocols (REJECT outcome is now framework property). -->

### L-14: BL Budget requires active merge [SUPERSEDED]
<!-- valid_from: 2026-04-07 | ended: 2026-04-25 | superseded_by: L-50 | cross_project: true -->
14. **BL Budget requires active merge, not just append.** At 27/30, adding new entries required merging BL-13+23 and BL-6+27. Append-only BL management hits the wall; active compression is required.
<!-- Supersede note: L-50 (extending existing BL beats adding) provides the operational rule that L-14 motivated: when adding rule conceptually adjacent, extend rather than add. L-14's "active compression required" is now the L-50 default. -->



### L-15: Bash classification boundary [ACTIVE]
<!-- valid_from: 2026-04-07 | ended: null | superseded_by: null | cross_project: false -->
15. **Bash classification: operational vs diagnostic is the correct boundary.** Research confirmed: restricting META to git-only breaks skill bundle sync (cp/zip), enforcement setup (chmod), and decision-making (ls). The correct split: operational commands (git, ls, cp, mkdir, zip, chmod, diff) stay with META for infrastructure management. Diagnostic commands (grep, curl, ssh, psql, redis-cli, jq) are blocked and delegated to Check Agent ([ANALYST] or [VALIDATOR]). Hook enforces this at Layer 2.

### Session 3: v9 Universalization — text-discrete coherence framework (April 2026)

### L-16: Scope cut is a first-class Visionary output [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
16. **Scope cut is a first-class Visionary output.** The operator's "универсализация для научных книг и статей" could have expanded to continuous/flow tasks (streaming, real-time simulation, data pipelines). Phase 0.A Visionary explicitly REJECTed continuous into v10+ and bounded v9 to text-discrete artifacts only. Without the cut, the domain schema would have bloated with latency budgets and backpressure semantics that don't fit the B-formula's multiplicative gate structure. Rule: the Visionary phase must name what is OUT of scope, not just what is IN.

### L-17: Modal B-formula product structure domain-invariant [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: false -->
17. **Modal B-formula preserved its product structure under generalization.** B = F·E·(1-σ)·Λ survived the code→text/article/book transition without changing shape. Only the relative weights shift across modalities (text / creative / research). The product form is domain-invariant because multiplicative AND-gating of 4 orthogonal failure modes is a statement about epistemic coherence, not about software quality. When an abstraction generalizes without changing shape, that's evidence it was already the right abstraction — it was being applied in a narrower domain than necessary.

### L-18: Backward compatibility by construction [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
18. **4-layer architecture (L0/L1/L2/L3) is backward-compat by construction, not by assertion.** Absent `domain:` block in a project config → defaults (type=code, B_modality=text, ood_scope=text-discrete, verify.method=build). Phase 1.E AC-3 walked through a zero-diff code-project bootstrap to prove this, rather than claiming it. Proof-by-construction is load-bearing when the claim is "v8 projects load identically under v9".

### L-19: Lexical discipline for universal archetypes [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: false -->
19. **Universal role archetypes require lexical discipline, not just structural.** v8 role files were code-biased in vocabulary (15-40 code-specific tokens per file: function, API, endpoint, bug, refactor, type-check). Phase 1.A refactor brought each file to <5 code tokens and added 3 examples per role (code, article, chapter). The L1/L2 architectural boundary is philosophical but its enforcement is mechanical — run a regex, count the tokens, fix the ceiling.

### L-20: BL tagging makes L2 inheritance mechanical [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: false -->
20. **BL tagging [UNIVERSAL] vs [CODE-ADAPTER] made L2 inheritance mechanical.** 22 universal + 8 code-adapter = 30 BL, split into two files. A future L2 domain skin now inherits the universal 22 by default and only overrides specific items. No more "which lessons apply to my article project?" judgment calls. Structural clarity replaces editorial judgment.

### L-21: Self-loading context architecture [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
21. **Self-loading context architecture scaled to 20+ parallel agents.** Each agent Reads its role file as FIRST action; META names only the path. v9 stress-tested this: Phase 1.A vocabulary refactors automatically propagated to Phase 1.B/1.C/1.D/1.E agents because each agent loaded the *current* role file, not a META-embedded snapshot. Zero context pollution at META level. Zero version drift across agents. Self-loading is the architectural mechanism that made one-session 5-wave execution possible.

### L-22: Phantom Coherence Check as release gate [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
22. **Phantom Coherence Check surfaced drift that RT-1 consensus missed.** 10 agents (5 EN + 5 RU) agreed on v9 direction. None flagged the skill mirror drift, the bilingual gap, or the template phrasing. A dedicated Phase 1.E Validator L2 running the Phantom Check as a release gate found all 3. S_adjusted = S_team × B_mean is dissonance-amplifying: high S without high B is precisely where phantom lives. Dedicated release gates (not just RT consensus) are mandatory for cross-cutting cycles.

### L-23: Language-bound regex is a bilingual bug [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
23. **Language-bound regex in invariants is a latent bilingual bug.** Hook Check 5 originally matched English "read" — 5 RU agents were blocked in parallel RT-1 spawn because "Прочитай" didn't match. Fix: make enforcement surface the file path, not the lexical signal around it. Rule: whenever an invariant is enforced by regex, any English-only lexical anchor is a bug waiting for the non-default language to surface.

### L-24: Enforcement that blocks valid operations is broken [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
24. **An enforcement mechanism that blocks your own valid operations is broken, not strict.** enforce-delegation.sh originally blocked META Writes to reports/, lessons.md, memory/ — all of which are META's explicitly enumerated output types. Fix: whitelist for META-owned paths, verified against the 6-output-type enumeration. This is BL-29 (verify terminology) applied to enforcement mechanisms themselves: every hook must be verified against the spec it enforces.

### L-25: Template files propagate stale patterns [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
25. **Template files ship stale guidance into every new project until you grep them.** v8→v9 introduced self-loading (agents Read role files themselves instead of META embedding "FULL CONTENT"). Root CLAUDE.md was updated; templates/CLAUDE.md.template was not. Every new project copied from that template shipped the v8 anti-pattern. Wave 5 fixed it with 3 targeted edits (Invariant 12, Language Stack, KILL-TEST). Rule: when introducing a new architectural pattern, grep the template files for the old pattern's phrasing — they're copied at project creation and propagate silently.

## Session 3 Mega-Patterns

### EMP8: Coherence framework, not software framework [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
v9 is the point at which EraDev stops being a software framework that could theoretically be used for writing and becomes a coherence framework that happens to have a well-developed code adapter. The role archetypes (Visionary, Analyst, Builder, Validator, Coherent) are domain-invariant; the artifacts they work on are domain-variant. Artifact type (code, article, chapter, config, plan, research) is an L2 concern; roles are L1 and must never hard-code artifact assumptions.

Corollary: whenever a framework-level change is proposed, ask "does this change the L1 archetype, or does it change an L2 assumption?" If L1 — require cross-modality verification (test against code + article + book). If L2 — scope to the affected modality.

### EMP9: Structural invariance is the signature of a correct abstraction [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
B = F·E·(1-σ)·Λ survived code→text generalization without structural change; only the weights shifted. Section 0 language routing survived the same generalization; only the token lists expanded. The 6 META output types survived; only the content varied. When abstractions generalize without changing shape, the original form was already correct and was merely being applied too narrowly. When abstractions break under generalization, the original form was over-fitted to the narrow case.

Rule: before changing an abstraction to accommodate a new domain, first check whether the new domain is a valid instance of the existing abstraction. Most "we need a new formula for X" requests fail this check — the old formula works, only the reading context needs adjustment.

### Session 3 Extension: v9 Phase 2.1.S — first real-world smoke test (April 2026)

### L-26: Real use is the only honest gate [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
26. **Real use is the only honest gate for a new abstraction.** Phase 2.1 shipped the article skin through three inspection gates (Analyst spec B=0.904, Builder self-check B=0.927, prior Validator B=0.927). Phase 2.1.S found **7 executability defects** on the same skin the moment a Validator tried to apply it to live content. None of the inspection agents were wrong — they were all reading the document. None of them were using it. The granularity gap between "spec complete for human reader" and "spec executable for LLM agent" closes only via smoke tests on real content with real agents. Inspection gates are necessary but not sufficient. Source: reports/v9_phase2_1_s_hansei_2026-04-11.md §4.2.

### L-27: Skin validation requires multiple targets [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
27. **Skin validation requires ≥2 structurally different targets.** First smoke test on `ODTOE_measuring_B_parameter.tex` (empirical, 700+ lines, 30 biblio entries) found 4 skin defects and 6 article defects. Second smoke test on `ODTOE_phi_fractality.tex` (theoretical, 268 lines, 9 biblio entries, Mar 19 mtime) found 3 more skin defects AND the same BL-19 filesystem drift pattern. One test proves the skin runs; two tests prove the corpus has patterns and the skin is not overfit. Never graduate an L2 skin from validated-on-one to phase-complete without the second target. Source: reports/v9_phase2_1_s_second_smoke_test_2026-04-11.md + Hansei §3.2.

### L-28: Pre-flight recon is not ground truth [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
28. **Pre-flight recon is not ground truth.** The Phase 2.1.S Analyst pre-flight predicted: (1) duplicate biblio entries are EN-only (reality: both RU+EN); (2) 34 `\tag{}` formulas (reality: 22); (3) ~40% self-cite rate (reality: 27% first test, 55.6% second test). None blocked the smoke test, but all three demonstrate that pre-flight runs on SAMPLE-scan heuristics, not full-file inventory. When a downstream step depends on pre-flight counts for decision-making, either the pre-flight must run full inventory OR the downstream step must re-verify as its first action. Source: reports/v9_phase2_1_s_preflight_2026-04-11.md vs smoke test findings.

### L-29: Skin value-add proved by defect differential [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
29. **Skin value-add is proved by "defects base role would miss".** The article skin's C1 ("cited at least once"), C6 (numerical cross-reference + independent recomputation), and BL-19 filesystem enforcement caught 3 defects (duplicate `[17]`/`[27]`, error propagation δB/B ≈ 0.068 vs recomputed 0.0722, and 8-file misplacement) that a base `validator_EN.md` without the skin would not exercise. This is the operational definition of "value-additive" — name the specific defects the base role would miss, and verify the base role actually misses them. Abstract claims of value-add are not proofs; concrete defects named against a reproducible base are. Source: Hansei §3.1.

### L-30: Skin examples are predictive [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
30. **Skin examples are predictive, not decorative.** Article skin Example 3 (abstract/table numerical mismatch: "abstract says N=120, Table 2 says N=118") was written in Phase 2.1 Analyst spec as a didactic illustration. In Phase 2.1.S smoke test #1, the Validator caught DEF-4 (error propagation formula drift) — the exact same class of defect as Example 3. The example served as a **latent Validator program** that activated when the Validator encountered a matching pattern. Choose skin examples for **generative capacity** (will they pattern-match future defects?), not pedagogical clarity. The best example is the one you'd be slightly sad to find in a real article — because it names the exact failure you're trying to catch. Source: Hansei §5.1.

### L-31: Corpus-wide drift requires multiple samples [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
31. **Corpus-wide drift is discoverable only via ≥2 samples.** Both Phase 2.1.S smoke tests found BL-19 violations: 6/8 and 7/8 files in the mandated `/Downloads/odtoe/` location, with `.md` versions drifted to `для сайта/` subdirectories. A single test would have looked like a quirky one-off. Two tests revealed the systematic corpus-wide drift that's been latent for weeks. The BL-19 rule existed; the rule was documented in `config.md`; the rule was known to the operator; the rule was violated on every article until a mechanical check fired. This is BL-16 (Lambda problem) in its purest form: **rules without mechanical enforcement rot in exactly the predicted way**. Source: Hansei §5.3, odtoe-articles/lessons.md L-38.

### L-32: Cleanup waves must be discrete [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
32. **Cleanup waves must be discrete, not iterative.** Phase 2.1.S closed 7 skin defects in 2 discrete Builder waves (v1 = 4, v2 = 3), each with its own Validator gate and its own scope discipline. BL-3 ("fix chain ≥ 3 = STOP, write spec, re-run") was respected by construction: defects surfaced in batches (smoke test #1 → 4 defects; smoke test #2 → 3 defects); each batch was closed in one Builder pass. No ping-pong, no iterative patching, no fix-chain accumulation. The pattern "smoke → cleanup → re-smoke → cleanup → cumulative validator" is the safe convergence shape; "smoke → fix one → re-smoke → fix another → re-smoke → …" is the unsafe one. Source: Hansei §3.3.

## Session 3 Extension Mega-Patterns

### EMP10: Empirical validation dominates theoretical validation at phase boundaries [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
v9 Phase 1 shipped the 4-layer architecture as specification + proof-by-construction for backward compat. Phase 2.1 shipped the article skin as spec-compliant document. Phase 2.1.S was the first time the architecture met real content — and it immediately surfaced 7 skin defects + 6 article defects + 1 framework drift (DEF-A orphan reference to non-existent eradev.md Section II.1) + 1 corpus-wide pattern (BL-19) that had been invisible to inspection-based validation.

Rule: at phase boundaries (Phase N → Phase N+1), the decisive gate is empirical, not theoretical. Run the new abstraction on real content. Measure what it catches vs a base-role ablation. Measure what it false-positives on structurally different content. If the inspection agents said B ≥ 0.9 but the smoke test catches 7 defects, the inspection B-scores were describing the **spec**, not the **abstraction**. This is why Phase 2.1.S exists as a named phase, not as an afterthought to Phase 2.1.

### EMP11: The 7-step first-use pipeline for any new abstraction [ACTIVE]
<!-- valid_from: 2026-04-11 | ended: null | superseded_by: null | cross_project: true -->
Phase 2.1.S converged via a reproducible 7-step pipeline, now codified for future L2 skins and other abstractions:

1. **Pre-flight (Analyst)** — scope the target, map project structure, pick one live artifact
2. **Self-test (Validator dry run)** — verify the abstraction is executable against framework + config, NOT against content
3. **First smoke test (Validator)** — apply the abstraction to the picked artifact, catch real defects, report verdict
4. **Cleanup v1 (Builder + Validator)** — close defects surfaced in step 3
5. **Second smoke test (Validator)** — apply the cleaned abstraction to a structurally different artifact, verify non-overfit
6. **Cleanup v2 (Builder + Validator)** — close defects surfaced in step 5
7. **Cumulative Validator gate** — verify v1 and v2 fixes together, confirm no regressions, confirm clean convergence

This pipeline is domain-invariant. It applies to article skins, code tooling validation, new role files, new hook logic — any abstraction where "spec compliance" and "executability" are distinct. Source: reports/v9_phase2_1_s_hansei_2026-04-11.md §2 step-by-step table.

### Session 4: v9 Phase 2 Closure (April 2026)

### L-33: 4-layer architecture is complete with concrete content at every layer [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
v9 shipped L0 IMMUTABLE (eradev.md I-III + III.Ω + II.1 + II.2), L1 UNIVERSAL (10 role files, vocabulary-clean), L2 DOMAIN SKINS (6 skins: code/article/book/plan/research/config), L3 PROJECT INSTANCE (4 project configs with domain blocks). Every layer has real, committed, pushed content — not spec-only. The architecture moved from "designed" (Phase 1) to "populated" (Phase 2.A) to "validated on real content" (Phase 2.1.S) in one extended session. Source: reports/v9_phase2_hansei_2026-04-12.md.

### L-34: Reports are ephemeral context pipes, not permanent documentation [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
Phase 2 generated ~40 reports. Their primary value was WITHIN the Analyst→Builder→Validator pipeline, not after. RT-1 reports were consumed by the roadmap synthesis then never re-read. Builder self-reports were consumed by Validators then archived. Analyst spec reports were consumed by Builders then archived. Permanent value lives in eradev.md, BL files, skin files, lessons.md — not reports/. The highest-leverage action for reports was creating `reports/INDEX.md` (Phase 2.B) to make pipe outputs findable. Without an index, N reports = N×noise. Source: operator question "как ты их используешь" + Phase 2 Hansei §1.

### L-35: Technical feasibility gates aspirational roadmap items [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
Roadmap Phase 2.C proposed "PostToolUse hook → background Haiku agent → instinct extraction." Phase 2.C Analyst discovered this is technically impossible in Claude Code: hooks run shell commands, not agent prompts. The realistic alternative (CronCreate periodic sweep) is less elegant but actually implementable. Lesson: Analyst pre-flight for infrastructure phases must include a feasibility check ("can Claude Code actually do this?"), not just a design check ("is this the right architecture?"). Phase 0.A added this for domain-level OOD; Phase 2.C proved it's also needed for tooling-level OOD. Source: reports/v9_phase2c_background_extraction_spec_2026-04-12.md.

### L-36: Phantom coherence audit is the real release gate [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
The v9 reports-vs-reality audit surfaced 4 NEW phantom gaps that 11 prior Validator passes had missed: skill mirror role files still v7/v8 (10 files!), BL-28 contradicting Invariant 12, root LOADING_PROTOCOL.md still v8, skill bundle missing domain_skin templates. All 4 were "reported as done in Wave 5/Phase 1.E" but never verified against filesystem state across the FULL distribution surface. Lesson: after any multi-wave implementation, run a dedicated cross-reference audit ("does every claim in reports/ match a real artifact in the repo?"). RT consensus + phase Validators catch defects within their scope; the audit catches defects across scope boundaries. This is the BL-5 (phantom coherence) self-application to the audit process itself. Source: reports/v9_reports_vs_reality_audit_2026-04-11.md.

### L-37: Execution discipline requires Check-First on your own spawns [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: false -->
META marked the config skin Analyst as "in_progress" in the todo list TWICE without actually spawning the agent. The todo said "running"; reality said "nothing happening." This is BL-16 (Lambda problem) applied to META's own execution loop — knowledge of what to do without the action to match. Fix: after every todo update marking a task "in_progress," immediately verify an Agent tool call exists in the same turn. If no tool call → the todo is a lie. Discovered when operator pointed out "этот процесс фейлится уже 2 раза." Source: Phase 2.A execution log.

## Session 4 Mega-Patterns

### EMP12: Phase 2 is infrastructure, not features [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
Phase 2 shipped 6 domain skins, a tiered memory system, temporal triples on all lessons, a reports index, a BL staging file, an extraction prompt template, and a /extract skill. None of these are "features" in the user-visible sense — nobody's workflow changes the day after Phase 2 commits. They are all substrate: the memory hierarchy feeds v10's Ω(H_hist), the extraction pipeline feeds BL_CANDIDATES.md, the domain skins feed future project bootstraps, the reports index feeds the audit process. Infrastructure value activates on the NEXT cycle, not the current one. Rule: when Phase 2 items don't show immediate impact, that's correct behavior — infrastructure is investment, not return. The return is measured in v10+, not v9.

### Session 5: v10 — substrate activation (April 2026)

### L-38: v(N) builds substrate, v(N+1) activates it [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
v10 was deliberately small: 6 items, ~125 lines of framework changes, ~330 lines of new schema. Every v10 item was activating infrastructure that v9 Phase 2 had already built. Omega formula existed since Phase 0.A → v10 changed "placeholder" to "operational". BL_CANDIDATES.md existed since Phase 2.B → v10 added the compression protocol. Temporal triples existed since Phase 2.B → v10 added the decay formula. Declarative RT was discussed since roadmap → v10 created the schema (engine deferred to v11). This is the correct pattern: build in v(N), activate in v(N+1). Trying to build AND activate in the same version creates scope creep. Source: reports/v10_hansei_2026-04-12.md.

### L-39: Apophatic as gate preserves topology better than Apophatic as role [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
v9 roadmap D2 deferred the Apophatic role. v10 research found implementing it as a 6th role would break the R/r = phi torus ratio (4/3 = 1.333, not phi). Implementing it as a Section IV Enforcement Gate preserves n=5 while adding the negation function (is this task decomposable? YES/NO/UNCERTAIN with Coherent probe). Gate ≠ role: gates are enforcement checkpoints (like Kill-Switch, Phantom Coherence Check), roles are cognitive archetypes. The v9 5-role topology is stable because it maps to a mathematical structure; adding a role changes the math. Adding a gate changes the process, not the math. Source: reports/v10_theoretical_research_2026-04-12.md + reports/v10_prototypes_builder_2026-04-12.md.

### EMP13: Activation is cheaper than construction [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
v10's 6 items took ~4 agent spawns (2 Builders + 2 Validators) and produced ~125+330 = 455 lines of framework changes. v9 Phase 2's equivalent infrastructure took ~28 agent spawns across 4 sub-phases and produced ~10,000+ lines. The ratio is ~6:1 in effort, ~22:1 in output — because activation is applying a formula that's already proven, while construction is designing the formula from first principles. Corollary: when a version feels "too small," check whether it's activating prior substrate. If yes, smallness is the signal of correct sequencing, not of insufficient ambition.

### Session 6: v10 polish — docs, OQ debt, distribution surface (April 2026)

### L-40: Version markers cascade downstream — fix root first [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
Docs audit found 11 stale files all saying "v8" — root cause was `eradev.md` line 3 still declaring "Version: 8" while containing v9+v10 content. Every downstream doc (README, AGENTS template, setup guides, skill READMEs) inherited the stale version because they referenced the root file. Fix root first, then sweep downstream. A phantom version marker is worse than no version marker — it actively misinforms operators about the framework's capabilities.

### L-41: Distribution surface (skill bundle) lags framework by default [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
This session required 3 separate skill mirror syncs + 3 zip rebuilds to keep the distribution surface current with framework state. Each v9/v10 framework change that touched meta.md, eradev.md, CLAUDE.md templates, or role files created a stale zip that operators installing via skill path would receive. The build-skill.sh script (OQ-W5-4) now includes vocabulary assertions, but it only catches drift AFTER the fact. Structural fix: include `bash scripts/build-skill.sh && diff -qr <root> <mirror>` as a pre-commit gate, not a post-hoc check. Phase 2.C extraction pipeline can flag skill-mirror drift as a DRIFT candidate automatically.

### EMP14: Documentation is a distribution surface, not an afterthought [ACTIVE]
<!-- valid_from: 2026-04-12 | ended: null | superseded_by: null | cross_project: true -->
v9 shipped 6 domain skins, 4-layer architecture, 14 tagged invariants, 6 output types, Omega formula, Apophatic Gate, L10 Cross-Domain Lambda — and none of this was visible in README.md, setup guides, or AGENTS.md.template until the docs audit forced a cleanup. The framework was v10 internally but v8 externally. Any new operator following the README or setup guide would have bootstrapped with stale instructions. Rule: every framework change that modifies a user-facing concept (version, loading sequence, architecture layers, invariant count, output types) MUST update the corresponding README/setup docs in the SAME commit. If it doesn't, the docs are phantom — they describe a framework that no longer exists.

### Session 7: Universality refactor — PARTIAL → HIGH (April 2026)

### L-42: Phantom universality is worse than absent universality [ACTIVE]
<!-- valid_from: 2026-04-23 | ended: null | superseded_by: null | cross_project: true -->
Iron Rule #7 ("framework core MUST NOT reference specific projects") existed in `projects/eradev/config.md` since v8. Operator believed framework was universal. Universality audit 2026-04-23 found **190 matches across 33 files** — ODTOE filenames in role examples, 65+ ODTOE-specific references in article skin, LaTeX/tectonic/BibTeX hardcoded as "universal" verify methods. A rule that exists in docs but isn't enforced mechanically creates a FALSE confidence signal: "we checked, it's universal" when it isn't. Absent universality is a known gap; phantom universality is a trap. Rule: for any invariant claimed in docs, add a mechanical check (hook, CI, lint). Absence of check = assume the invariant is drifting. Source: reports/v10_universality_audit_2026-04-23.md.

### L-43: Split beats purify when specifics are load-bearing [ACTIVE]
<!-- valid_from: 2026-04-23 | ended: null | superseded_by: null | cross_project: true -->
Article skin had 644 lines, 65+ ODTOE-specific references. Two options: (a) DELETE all specifics (risk: overlay file value lost, ODTOE projects break), (b) SPLIT into universal skin (555 lines) + project-local overlay (249 lines at `projects/odtoe-articles/overlay/`). Chose (b). Result: universal skin is reusable for any article project, ODTOE project inherits universal + overlay delta, zero behavior regression. Rule: when universal file accumulates project-specific content, split to `projects/{PROJECT}/overlay/` instead of deleting. The overlay pattern preserves institutional knowledge while enforcing L0/L1/L2 layering. Source: reports/v10_universality_B_article_skin_2026-04-23.md.

### L-44: Enforcement requires ACTIVE mechanism, not passive documentation [ACTIVE]
<!-- valid_from: 2026-04-23 | ended: null | superseded_by: null | cross_project: false -->
Iron Rule #7 was documented in projects/eradev/config.md for months. 190 violations accumulated. The moment `.githooks/pre-commit` Universality Gate landed, the next commit passed `[universality-gate] OK: framework scope is universality-clean` — and any future violation will be BLOCKED at commit time (exit 1). Difference between "rule exists" and "rule fires": 190 violations. Mechanism: regex against banned tokens, allowlist for justified exceptions, `--no-verify` escape for P0 emergencies. Rule: for every principle the framework claims to uphold, install (a) pre-commit hook, (b) allowlist file, (c) override protocol. Without all 3, the principle is aspirational, not operational. Source: BL-16 (Lambda problem) applied to Iron Rule #7; Builder D report.

### L-45: 4 parallel Builders can refactor a framework layer cleanly [ACTIVE]
<!-- valid_from: 2026-04-23 | ended: null | superseded_by: null | cross_project: true -->
Universality refactor = 4 parallel Builders (role files / article skin / other skins+schema / Gate installation) on disjoint file scopes, followed by 1 Integration Builder + 1 Validator. Result: zero cross-Builder conflicts, 190→78 matches (-59%), universality PARTIAL→HIGH in one session. Key: scope disjointness verified in META planning ("A touches roles/, B touches article skin + overlay, C touches other skins + template + configs, D touches eradev.md §IV + hooks + allowlist"). Rule: when refactoring a framework layer, partition by file-region not by concern — concern-based partitioning creates merge conflicts; file-region partitioning allows true parallel execution. Coherent at integration verifies no two Builders modified same line. Source: reports/v10_universality_{A,B,C,D}_*_2026-04-23.md + integration + validator.

### EMP15: A framework without an enforcement gate drifts toward its creator's projects [ACTIVE]
<!-- valid_from: 2026-04-23 | ended: null | superseded_by: null | cross_project: true -->
EraDev was designed universal but drifted toward ODTOE (the creator's primary project corpus) over 2+ years. This is the structural gravity of any framework: examples come from the creator's work, vocabulary from the creator's domain, edge cases from the creator's pain points. Without an active enforcement gate, the framework slowly collapses into "a framework specifically for THIS creator's projects" — phantom universality. The Universality Gate is the counter-gravity: every commit to framework core must prove it's not project-specific. The gate doesn't prevent specifics from existing — it forces them into `projects/{PROJECT}/overlay/` where they belong, preserving the L0/L1 universal archetype separation. Rule applies to any framework at any scale: without mechanical anti-drift, the framework becomes the creator's tool, not the ecosystem's tool. Source: universality audit 2026-04-23 finding "ODTOE is the creator's corpus + 190 matches of drift" + Builder D enforcement installation.

### Session 8: Conditional BIM + FLUX — two regimes, one framework (April 2026)

### L-46: Rigor must be conditional, not universal [ACTIVE]
<!-- valid_from: 2026-04-24 | ended: null | superseded_by: null | cross_project: true -->
BIM audit proposed universal docs-first planning to cut fix chains. ODTOE parallel_trajectories proposed τ_cycle primacy as [UNIVERSAL] invariant. Creativity tension audit found: universal rigor kills voice/incubation for book/article work, delivers HIGH help only for code/config/research/plan. Fix: introduce RIGOR_LEVEL axis (strict/structured/exploratory/emergent) orthogonal to domain. Apply BIM when RIGOR_LEVEL ∈ {strict, structured}; apply FLUX when ∈ {exploratory, emergent}. Same framework, two regimes, selected per-segment. Rule: when a proposed invariant works for 4 of 6 domains and harms 2, it's NOT universal — it's CODE-ADAPTER with escape clause. Source: reports/v10_bim_creativity_tension_2026-04-24.md + reports/v10_conditional_bim_deep_research_2026-04-24.md.

### L-47: FLUX is the sibling protocol to BIM, not its replacement [ACTIVE]
<!-- valid_from: 2026-04-24 | ended: null | superseded_by: null | cross_project: true -->
Creative work needs: long cycles (incubation), single-voice Ô, advisory verification, "good-enough-to-iterate" exit, negative capability (sitting with uncertainty). FLUX protocol (Free-flowing/Long-cycle/Unit-of-voice/eXploratory) specifies these as FIRST-CLASS alternative to BIM, not as "BIM turned off". Rule: when you detect a mode where the established protocol harms output, don't weaken the protocol — ADD its sibling with its own rules, gates, and exit criteria. The two protocols compete at RIGOR_LEVEL boundary; Visionary (or operator) picks per segment. Source: reports/v10_bundleD_unified_integration_2026-04-24.md §FLUX.

### L-48: Integration over patchwork: modify unstaged, don't commit-then-patch [ACTIVE]
<!-- valid_from: 2026-04-24 | ended: null | superseded_by: null | cross_project: true -->
Bundle A/B/C was built, validated, integrated (14 skill mirror pairs synced, zip rebuilt) but NOT committed when operator raised creativity concern. Option to ship-then-fix was rejected. Instead: Bundle D was built as MODIFICATION of unstaged A/B/C + NEW conditional content, shipped as ONE coherent commit. Result: zero "correction commits", zero contradictions across Bundles, closed cross-reference graph. Rule: when pre-commit research reveals tension, MODIFY working tree before committing — not "commit the baseline, patch in next commit". Patch-commits create audit-trail noise and obscure design intent. Applies when: user raises concern between build and commit; research reveals gap during integration phase. Source: Session 8 execution log.

### EMP16: Convergent vs divergent knowledge-production are both legitimate regimes [ACTIVE]
<!-- valid_from: 2026-04-24 | ended: null | superseded_by: null | cross_project: true -->
EraDev historically assumed a single knowledge-production regime: agents converge (S_team → 1), plans specify before code, Validator blocks on non-conformance. Paper §II introduced τ_cycle primacy + path-(c) ΔÔ acceptance, hinting divergence is sometimes correct. Bundle D makes this explicit: CONVERGENT regime (BIM, μ-check blocking, Cross-Layer Contracts, rigid plan) for tasks where single correct answer exists; DIVERGENT regime (FLUX, advisory gates, single-voice Ô, emergent plan) for tasks where multiple valid outcomes exist. Neither regime is superior — they're matched to task nature. A framework that only supports convergent production loses half of knowledge work (research hypothesis formation, creative prose, exploratory design, book narrative). RIGOR_LEVEL axis is the selection mechanism. This EMP supersedes implicit EraDev assumption that "more rigor = better"; rule: rigor must MATCH the task's output space (convergent = high rigor; divergent = light rigor, creativity-supporting protocols).

### Session 9: Composition + Recommendations + Baseline Health (April 2026)

### L-49: Partial RT-1 ships when Coherent can predict L2 synthesis [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
RT-1 on team-composition + self-evaluation got 2/5 role completions (Visionary + Coherent) before Analyst/Builder/Validator hit 3 successive API timeouts. Standard practice would block: "RT-1 incomplete = no commit." Instead: Coherent's predictive synthesis (running in parallel with V/A/B/Val) provided sufficient L2 cross-role alignment because (a) prior Q1 audit had Analyst empirical data from 2026-04-24, (b) Coherent correctly predicted phantom-coherence trap on "matrix/table/registry" and resolved via canonical term "composition contract", (c) META synthesized 3 disjoint Implementation Builders from V+C consensus. Result: full ship in single commit (f2ce45a) with B=0.789 Validator GREEN. Rule: when Coherent can produce predictive L2 synthesis grounded in prior Analyst data + role-file authority, partial RT-1 is acceptable — fail-soft pattern. Counter-rule: NEVER skip Coherent or Visionary; the 3 implementation roles (A/B/Val) are RECOVERABLE via predictive synthesis, the 2 strategic roles are NOT. Source: reports/rt1_coherent_2026-04-24.md predictive synthesis verified by f2ce45a outcome.

### L-50: Extending existing BL beats adding new BL when budget capped [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
Q3 Baseline Health Check needed framework expression. Two paths: (a) add BL-39 — but BL count at 30 cap requires merging or retiring existing entry first, expensive bookkeeping; (b) extend existing BL-22 PRE-FLIGHT from [CODE-ADAPTER]/external-API to hybrid with sub-(a) external API + sub-(b) [UNIVERSAL] baseline health. Chose (b) — same semantic content (PRE-FLIGHT verification before action), wider scope, zero cap pressure. Resulting BL-22 has clean tag-pair `[CODE-ADAPTER + UNIVERSAL]` with sub-clauses. Rule: when adding rule conceptually adjacent to existing BL, extend rather than add. Conceptual adjacency = same Why even if Rule scope differs. Saves BL budget (30 cap), preserves audit-trail provenance (BL-22 origin still cited), reduces grep surface (one BL number to search vs two). Source: BL-22 hybrid extension in this commit.

### L-51: Auto-test BEFORE start eliminates "built on broken main" class [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
Operator pattern: "Прежде чем начать, сделай проверки, автотесты, чтобы проверить что все сделано правильно." (Before starting, run checks/auto-tests to verify everything is done correctly.) EraDev had ZERO universal mechanism for this pre-RT-1; only BL-22 sub-(a) external API check (~10-20% coverage). Other "Check-First" mechanisms (BL-17 read references, A_F load files, μ-check plan completeness) are READ-ONLY — they do not RUN tests. Failure mode without baseline gate: RT-1 converges on plan that's already broken upstream; Builder ships against broken baseline; Validator catches in post-hoc verify, wasting one full cycle. Fix: BL-22 sub-(b) [UNIVERSAL] + meta.md §14 item 5c. Cost ~30-60s baseline run BEFORE RT-1; eliminates entire failure class. Generalizable: any framework with "verify after work" should also have "verify before work" — asymmetric verification leaves "broken upstream" untreated. Source: rt1_pre_flight_test_audit_2026-04-25.md verdict MISSING (universal coverage) + this commit fix.

### EMP17: Recommendations placement — three existing artifacts cover all needs [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
Post-task recommendations have three distinct lifetimes: per-task immutable snapshot (Hansei), reusable insight (lessons), live forward plan (roadmap). Each has different write-frequency, read-audience, persistence. EraDev had all three artifacts but no canonical placement rule — operators kept proposing new `recommendations.md` files, duplicating lessons.md content. Coherent's RT-1 synthesis identified the 3-artifact canonical model: hansei nested `## Recommendations` (per-task), lessons.md append (reusable), roadmap "Next Steps" (forward). Codified in meta.md §15 + Coherent role triage protocol. Rejected new recommendations.md (duplication) and per-task BL_CANDIDATES (BL is universal-only). Rule applies to any framework with multiple memory layers: before adding new artifact for "next steps", check if existing layers already cover lifetime/audience/persistence axes. If yes, codify placement; if no, add minimum-viable artifact. Source: rt1_coherent_2026-04-24.md + this commit canonical model.

### Session 10: 2× RT-5 + ANDON + Inv 13 max-parallel default (April 2026)

### L-52: Tier-claim falsification is the deepest BL-16 form [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
RT-5 EN-Validator B=0.381 (ANDON) found BL-19 declares `Tier: T2` (hook/CI/lint) but no bilingual-sync hook exists. Same pattern: Inv 17 τ_cycle primacy zero enforcement; §X.1/§X.2 composition contract T4 only despite [UNIVERSAL] tag; rework-framing-detector exits 0 (advisory) but BL-35 mandates BLOCK. Pattern name: **Tier-claim falsification** — rule declares a Tier it doesn't actually occupy. Worse than BL-16 (knowledge without enforcement) because the Tier label CLAIMS enforcement exists, creating false confidence. Solution: add Validator periodic sweep "for each BL/Invariant with Tier:T1/T2 declaration, verify hook/check/type actually exists". Without this sweep, Tier ladder rots into theatre. Source: reports/rt5_full_audit_validator_EN_2026-04-25.md + L2 synthesis C-driven action item.

### L-53: Path-(c) ΔÔ acceptance is the DEFAULT for cross-stack RT, not the exception [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
RT-5 ran 2 teams (EN practical / RU theoretical) in disjoint observation frames. EN_Ô tracks commit-trail + anti-bloat; RU_Ô tracks formalism + genealogy. Both produced legitimate findings on different layers (EN: SKILL.md drift; RU: σ-aggregation function not specified). L2 Coherent accepted ΔÔ ≠ 0 explicitly — both deliverables cleared because B_received ≥ B_min per layer (F7 sufficiency). Forced convergence would have been phantom coherence (BL-5). Rule: when running parallel teams in different observation stacks (EN vs RU, code vs theory, design vs empirical), path-(c) is the DEFAULT outcome, not the fallback. Coherent's job in cross-stack RT is to catalogue divergences as legitimate, not to force agreement. Source: reports/rt5_l2_synthesis_2026-04-25.md path-(c) acceptance + L-47 (FLUX sibling protocol pattern).

### L-54: API-timeout caution is NOT sufficient justification for batching independent agents [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: false -->
META batched RU team after EN team sequentially during RT-5 audit "to avoid API timeouts" (recent partial RT had 3/5 timeouts). Operator critique: "почему ты 2 5ки RU и EN не запустил параллельно сразу?" — RU and EN role files are disjoint stacks (different files per language), Invariant 13 mandates parallel for independent agents. Timeout caution is operational concern that does NOT override Invariant 13 default. Inv 13 strengthened in same commit: explicit "MAX parallelization by DEFAULT" + operator override list (по очереди / sequential / by stages) + explicit "API-timeout caution NOT sufficient justification" clause. META's discretion shrinks: only operator's explicit instruction OR genuine output-of-A=input-to-B dependency justifies sequential. Source: operator critique 2026-04-25 + Inv 13 update CLAUDE.md line 82.

### EMP18: ψ*=Φ(ψ*) gap >10% = freeze trigger for new framework additions [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
Self-application principle (L9) states ψ*=Φ(ψ*) — framework's transformation Φ on itself must be a fixed point. RU-Visionary computed gap ~15% in v10 post-Bundle-D (commit 11f51be Builder BLOCK + Validator PASS WITH NOTES on self-deploy = ψ* failed Φ-test on its own bootstrap). Spiral gap (π-3)² ≈ 0.02 = 2% is the natural exploration corridor; >10% gap means framework is drifting, not exploring. Convergent finding C1 across EN-V + RU-V + RU-Coh: gap not closed. Rule: when ψ* gap exceeds 10%, halt new BL/Invariant additions until gap closes. Treat as Andon — not blocking shipped work, but blocking NEW expansion. Self-application is the load-bearing claim of an L9 framework; if it fails on itself, every new rule we add is built on broken foundation. Forces CONSOLIDATION over EXPANSION when self-test fails. Source: rt5_l2_synthesis_2026-04-25.md C1 + EN-V R2 + RU-V §3.

### Session 11: NEXT-A1 closure + Tier-claim hook bundle (April 2026)

### L-55: BLOCK obsolescence may precede explicit closure [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
RT-7 NEXT-A1 audit found 11f51be self-application BLOCK was already RESOLVED by follow-up commits a79654c + b1486ed (closed 2026-04-23) but never explicitly declared CLOSED. The 15% ψ*-gap estimate (RU-V) became obsolete the moment those follow-ups landed but the gap measurement persisted in roadmap as "open" because no agent re-ran the test. Rule: when a BLOCK has remediating commits, run explicit closure verification immediately — don't let stale "open" status accumulate phantom debt. Solution: every BLOCK in roadmap gets a CLOSURE-CHECK trigger that fires when a commit message contains keywords matching the BLOCK domain. Without explicit closure, gaps measured against obsolete state misallocate CONSOLIDATION resources. Source: reports/rt7_next_a1_closure_validator_2026-04-25.md.

### L-56: Validator-led implementation is legitimate when verification IS the artifact [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
NEXT-B1 (BL-19 bilingual hook) was Validator-implemented, not Builder-implemented. Rationale: hook IS verification logic — Validator-author writes it correctly because Validator-author understands the verify mental model. Builder-author may write working hook that mismatches Validator's check semantics. Tested on hook itself: 10/10 tests PASS first time, fix chain = 0. Pattern: when artifact's primary purpose IS verification (hooks, lint configs, test specs, audit scripts), Validator-led implementation may produce better artifact than Builder-led. Composition contract §X.1 floor counts (V/A/B/Val/C) treat Validator as verification-only role; this lesson extends Validator scope to "verification artifacts production" as legitimate sub-mode. Does NOT contradict Invariant 11 (Builder→Validator sequence) because Validator self-tests as if Builder of own artifact. Source: reports/rt7_next_b1_bl19_hook_2026-04-25.md.

### L-57: 7-parallel-agent Wave 1 + 2-parallel Wave 2 = sustainable concurrency [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: false -->
RT-7 spawned 7 agents in single message (Wave 1: NEXT-A1 V/A + B1 + B2 + C1 + C2 + C3) then 2 in Wave 2 (Validator + closure). Zero timeouts. Compare to RT-5 Session 10 where 5 parallel hit 3/5 timeouts. Difference: prompts in RT-7 were tightly scoped (max 60-80 lines each), file scopes disjoint, spawns made in single tool-call block. Pattern: parallelism limit is not "agent count" but "prompt complexity × spawn-batching pattern." 7 tight + disjoint = OK; 5 verbose + overlapping = timeouts. Rule when spawning N parallel: budget per-prompt ≤80 lines, verify file-scope disjointness, send all in single message (don't trickle). Source: RT-7 execution log + L-49 fail-soft pattern.

### EMP19: Tier-claim integrity drives framework epistemic health [ACTIVE]
<!-- valid_from: 2026-04-25 | ended: null | superseded_by: null | cross_project: true -->
L-52 surfaced Tier-claim falsification: BL declares Tier:T2 (hook/CI) but no hook exists. RT-7 NEXT-B1 + NEXT-B2 closed this for BL-19 (added bilingual-sync hook) and BL-35 (rework-detector exit 2 BLOCK). Pattern across framework: every Tier claim is a verifiable hypothesis. Either the enforcement exists (T1 type / T2 hook / T3 checklist) or Tier label lies. Lying Tier creates phantom enforcement — operators trust the rule because "hook exists" but no hook fires. Rule: every Tier:T1/T2/T3 declaration must point at a specific enforcement artifact (file path, hook name, checklist location). Validator periodic sweep verifies pointer integrity. Falsification rate is framework's Lambda-effective: high falsification rate = operators trusting framework that doesn't actually enforce = BL-16 recursive collapse. Audit cadence: every 4 sessions (matches CONSOLIDATION lift window) — Validator sweeps Tier claims, surfaces falsifications, NEXT-B-style cleanup. **Sweep updated 2026-04-26 (RT-12 Pareto-prune B2):** RT-11 Validator hooks audit found L-52 sweep claim "4/4 closed" was actually **3/4** — `rt1-composition-gate.sh` BL-34 path-glob `*/reports/rt1_*.md` required leading slash and silently no-op'd on relative paths (agent Write calls commonly emit relative paths). **Lesson:** Tier-T2 hooks must accept BOTH absolute and relative paths from Write tool; case-glob `*/path/...` is fragile — declare both `*/x/file|x/file` alternatives. Now 4/4 after path-glob fix (BL-34 hook accepts `reports/rt1_*.md`, `*/reports/rt1_*.md`, both verified end-to-end).

### Session 12: ODTOE audit + phantom newness + CONSOLIDATION lift (April 26)

### L-58: Phantom newness — proposers don't grep against existing knowledge [ACTIVE]
<!-- valid_from: 2026-04-26 | ended: null | superseded_by: null | cross_project: true -->
RT-9 ODTOE audit (10 agents) proposed 31 «new» items (EMP-CAND/TC/L-A/Inv). Phantom-newness audit found genuine novelty rate **12.9%** (4/31). 5 exact duplicates (operator caught L-A9 = L-1 from 2026-04-04 «TeX ligatures don't render with PT Serif»; Analyst confirmed E1=L-1, E3=Inv 16, E8=EMP9/L-17, L-59=L-22+EMP18). 18 extensions misframed as «new». EN-A + EN-Coh teams: **100% phantom-newness rate**. Only RU-Coh: 0% (correctly applied L-50 extend>add). Pattern is recursive BL-16: audit teams committed exact failure they were auditing. **Worse than Lambda problem** because claims novelty falsely → operators trust new framework patches that already exist → builds phantom debt. Rule: before proposing any new L-N/EMP-N/BL-N/Inv N ID, agent MUST grep existing lessons.md/lessons_archive.md/BOOTSTRAP_LESSONS.md/eradev.md/FOUNDATIONS.md for semantic overlap. If overlap found → frame as extension (per L-50) or supersede (per temporal triple). Never claim novelty without evidence. Tier: T3 checklist NOW, T2-upgradable to pre-commit hook (PN-1 in Wave A roadmap). Source: rt9_phantom_newness_audit_2026-04-26.md + operator's L-A9=L-1 catch.

### L-59: Operator authority overrides self-imposed META protocols when conditions met [ACTIVE]
<!-- valid_from: 2026-04-26 | ended: null | superseded_by: null | cross_project: false -->
META declared CONSOLIDATION freeze 2026-04-25 with 3 lift conditions. By Session 11 end all 3 conditions MET, but META waited for «explicit operator declaration» creating process-theatre delay through Session 12 audit work. Operator question «когда улучшим framework?» → exposed self-imposed bureaucracy. META should have either (a) recognized conditions-met as sufficient signal OR (b) explicitly asked operator to declare lift at Session 11 close, not deferred to next session bootstrap. Rule: when META designs a self-binding protocol (freeze/gate/lift), the protocol must include explicit signal handoff. «Wait for operator» without channel = bureaucracy theatre. Each protocol declaration must specify HOW operator signals approval (chat phrase, file flag, commit marker). Ambiguity creates indefinite procedural delay. Source: operator critique 2026-04-26 «когда улучшим framework?» + «почему сейчас не трогаешь файлы?».

### EMP6 extension: Lambda recursive — proposers don't grep [ACTIVE]
<!-- valid_from: 2026-04-26 | ended: null | superseded_by: null | cross_project: true -->
EMP6 (Enforcement without mechanism is Lambda zero, recursively) gets new instance: phantom-newness pattern (L-58) is BL-16 recursively applied to AUDIT process. Original EMP6 said «framework reads its own rules and ignores them.» New layer: «agents auditing the framework propose rules without reading existing rules.» This is Lambda³ — Lambda problem applied to Lambda problem detection. Mitigation must enforce grep at proposal-time, not at review-time. RT-9 phantom-newness audit empirical evidence: review-time catch (operator's L-A9=L-1 finding) is too late — wastes audit cycles. Pre-grep enforcement (PN-1 hook, post-lift) prevents waste. Same pattern as Universality Gate (Wave 7) which prevents project-name leaks before commit instead of after. Source: L-52 + rt7_next_b1/b2/wave1_integrated_validator reports.

### Session 13: RT-11 META-audit + RT-12 relabeled prune + L2 escalation (April 26)

### L-60: Implicit synthesis is synthesis bypass [ACTIVE]
<!-- valid_from: 2026-04-26 | ended: null | superseded_by: null | cross_project: true -->
RT-11 (6 parallel META-audits of framework deterioration) returned 6 reports. META proceeded directly to RT-12 (6 parallel prune Builders) by passing audit findings as scope-shaping in Builder prompts. NO consolidated `rt11_l2_synthesis_*.md` artifact was authored. Operator caught: «когда сделаем синтез + изменения в eradev? или мы это уже сделали?» — exposed implicit-synthesis pattern. **Rule:** when N audit reports inform M builder actions, an explicit Coherent L2 synthesis MUST exist as ARTIFACT BEFORE bundle commit. Synthesis-as-scope-shaping (each Builder cites finding X) is sufficient for ACTION but not for ACCOUNTABILITY — git history needs single artifact mapping audit→action→status. CLAUDE.md «Synthesis» output type = artifact, not pattern. Treat absence-of-synthesis-file as bypass even when synthesis-as-prompt-content was applied. Tier: T3 (post-RT meta-discipline checklist). Source: operator critique 2026-04-26 + Coherent retroactive rt11_l2_synthesis_2026-04-26.md.

### L-61: Wave-level label hygiene — extends L-52 Tier-falsification to wave aggregate level [ACTIVE]
<!-- valid_from: 2026-04-26 | ended: null | superseded_by: null | cross_project: true -->
RT-12 framed as «Pareto prune» — 6 parallel prune Builders. Per-Builder verdicts: 5 PASS + 1 PARTIAL (Validator B=0.69 GO). Wave-level Coherent found: only B1/B2/B4/B5 = real prune (close F4 META call-site, F7 fix-counter, rework FP rate, rt1-gate path-glob residue). B3 (checklist restructure) + B6 (vocabulary registry) = **additions**, not removals. Net delta: +572 insertions / 161 deletions, hooks 6→9 (+50%), reports +62%. Label «prune» says removal; reality is +30% monotone addition. **Rule:** L-52 Tier-claim falsification applies at WAVE level, not just per-rule. Every wave-label («prune», «consolidate», «cleanup») = verifiable hypothesis testable against insertion:deletion ratio + artifact-count delta. Validator GO on technical correctness ≠ Coherent GO on label fidelity — two different B-formulas. Pattern when wave label contradicts wave delta: (a) revert non-conforming work, (b) re-frame label honestly, (c) split into label-fidelity wave + separate add wave. Operator chose (b) + plan separate real prune wave for Visionary's structural triad. Source: rt11_l2_synthesis_2026-04-26.md §7 + option (3) decision.

### L-62: Tactical GO + Strategic PAUSE — extends L-53 path-(c) from cross-stack to within-stack role divergence [ACTIVE]
<!-- valid_from: 2026-04-26 | ended: null | superseded_by: null | cross_project: true -->
RT-12 closing gates: Validator B=0.69 GO (5/6 PASS, composition clean, regressions pass, BL-19 sync OK); Coherent B=0.488 ANDON-borderline PAUSE (label mismatch, 7/15 RT-11 findings still OPEN, structural triad untouched). NOT a contradiction — Validator scope = technical correctness of WHAT was built; Coherent scope = conceptual coherence of HOW it was framed. Both verdicts correct under their respective B-formulas. Forced consensus would be phantom coherence (BL-5). **Rule:** when V (Validator) and C (Coherent) disagree on bundle commit, META MUST present BOTH verdicts to operator with explicit choice matrix; do NOT auto-resolve. Live demonstration of L-59 (operator authority) + path-(c) ΔÔ acceptance (L-53). 5-role topology earns its weight precisely at these branches. Source: rt12_integrated_validator_2026-04-26.md GO + rt11_l2_synthesis_2026-04-26.md (c) PAUSE.

### L-63: Re-frame > revert when work is technically correct [ACTIVE]
<!-- valid_from: 2026-04-26 | ended: null | superseded_by: null | cross_project: false -->
Option matrix at RT-12 close: (1) commit as-is («prune» label, accept L-52 wave violation), (2) revert B3/B6 additions (lose ready work, may revisit later), (3) commit all + relabel commit message + plan separate real prune wave. Operator chose (3). **Rule:** when Coherent flags label-fidelity issue but Validator confirms technical correctness, prefer re-frame over revert. Re-framing preserves verified work + fixes git-history accuracy + queues real label-conforming wave. Reverting valid work to satisfy a label loses Lambda-effective work. Constraint: re-framed commit message must explicitly acknowledge what was DONE (not what was CLAIMED) AND must spawn explicit follow-up tasks for the un-done work the original label promised. RT-12 → real prune wave for Visionary's structural triad (pruning organ atrophy, meta-stack inversion, defensibility≠leverage) tracked as BT-1; B4 path-strip greedy fix as BT-2; BL split files lag reconciliation as BT-3; B4 subshell bypass weakness as BT-4. Source: operator option (3) selection 2026-04-26.
