# EraDev Self-Project — Lessons & Patterns

> Temporal metadata format: `<!-- valid_from: DATE | ended: DATE|null | superseded_by: ID|null | cross_project: bool -->`
> Lifecycle tags: [ACTIVE] | [SUPERSEDED] | [ARCHIVED]
> EMPs: valid_from matches session date; EMPs never get `ended` (immortal within lessons.md)

## Session 1: Framework Rebuild (April 2026)

### Origin
EraDev v7.1 was rebuilt from scratch by 25 agents (5 RT × 5 roles) analyzing two prior versions (eradev_old and eradev_last). This was the first application of the framework to itself — Level 9 self-modification (Psi* = Phi(Psi*)).

### Lessons

### L-1: 25-agent parallel analysis produces emergent insights [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
1. **25-agent parallel analysis produces emergent insights.** Individual RT teams found different issues. RT1 found duplication (25-30%). RT2 found Lambda problem. RT3 found evolution patterns. RT4 found ODTOE formula errors. Only synthesis (RT5) could see the full picture.

### L-2: P_coll error propagated across multiple documents [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
2. **P_coll error propagated across multiple documents.** The value 0.61 (incorrect) for P_coll at B=0.3, n=3, k=1 was present in eradev_old, eradev_last, and multiple articles. Correct value: 0.657. All 20 analytical agents missed it until RT4-Validator specifically recomputed. Lesson: formula verification requires independent recomputation, not consensus.

### L-3: A/B experiment RU vs EN language stack selection [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
3. **A/B experiment RU vs EN (10 agents): EN prompts give 48% higher B-score for practical tasks.** But RU agents produce deeper mathematical innovations (phi-weighted S_team, Graduated Activation). Neither language is universally better — the task type determines the optimal language stack.

### L-4: Inline routing vs external router [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: false -->
4. **A/B experiment router.md vs eradev.md Section 0 (10 agents): inline routing wins.** External router.md split the team (Builder went EN, 4 others went RU), creating inter-stack divergence. Inline routing in Section 0 let agents self-determine without forced classification.

### L-5: Pluggy session identity enforcement failure [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
5. **Pluggy session (real deployment): 95% solo Builder, 5% delegation.** Root cause: bootstrap prompt said "read and proceed" without declaring META identity. Fix: CLAUDE.md auto-bootstrap + meta.md Section 14 checklist. This is the Lambda problem (BL-16): knowledge without enforcement = zero.

### L-6: Enforcement mechanisms belong in META protocol [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
6. **Section 0.5 was created then removed (5-role vote: 3 vs 2).** Checklist in eradev.md created self-reference problem (checklist inside the file it verifies). Merged into meta.md Section 14 per Option C. Lesson: enforcement mechanisms belong in the META protocol, not in the universal core.

### L-7: Bilingual sync must be simultaneous [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
7. **Bilingual files created without simultaneous sync = immediate tech debt.** eradev_RU.md was created at v7.0, eradev.md was updated to v7.1. Sync audit found 5 HIGH issues. Fix: BL-19 (bilingual sync rule) now in eradev.md Section 0.

### L-8: Check-First prevents format rework [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: true -->
8. **Article format: Check-First prevents 100% of format rework.** Research article was generated with wrong format (no comment groups, \hrule between sections, wrong keywords format). Reading ODTOE_article.tex BEFORE generation would have prevented all issues. Fix: Check-First pipeline in odtoe-articles config.md.

### L-9: S_adjusted formula discovery [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: false -->
9. **S_adjusted = S_team × B_mean — discovered through A/B experiment.** RU-group had S_team=0.95 (high agreement) but B_mean=0.346 (low quality). Without S_adjusted, RU appears healthier. S_adjusted correctly shows EN (0.447) > RU (0.329). All 10 agents in the next experiment independently found a glossary conflict (two S_adjusted definitions).

### L-10: Selective converter execution [ACTIVE]
<!-- valid_from: 2026-04-04 | ended: null | superseded_by: null | cross_project: false -->
10. **tex2md.py regeneration creates unwanted EN files.** Running the converter on all .tex files (including _EN versions) created EN markdown copies that user didn't request. The converter should be run selectively, not on all files.

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

Rule: At every 10th iteration of any score-driven loop, pause optimization and run a mini-RT with at least Visionary + Coherencer. The question is not "is the score improving?" but "is the thing we are scoring still the right thing to score?" If the answer is no, redefine the score function before resuming.

Source: AutoAgent analysis (April 2026) -- AutoAgent achieves speed through score-driven hill climbing but lacks orientation mechanism. EraDev achieves orientation through RT deliberation but lacks optimization speed. The synthesis: embed optimization within orientation.

### Session 2: v8 META-Orchestration Architecture (April 2026)

### L-11: 3-Layer Identity Enforcement [ACTIVE]
<!-- valid_from: 2026-04-07 | ended: null | superseded_by: null | cross_project: true -->
11. **3-Layer Identity Enforcement eliminates single-point collapse.** Single CLAUDE.md enforcement failed in pluggy (95% solo Builder). Adding hook + memory persistence creates 3 independent firing points. Any single layer failing leaves 2 active.

### L-12: META Output Type Spec structural fix [ACTIVE]
<!-- valid_from: 2026-04-07 | ended: null | superseded_by: null | cross_project: true -->
12. **META Output Type Spec is the structural fix for context pollution.** Identity drift was diagnosed not as behavioral but structural: untyped outputs allow any behavior. Enumerating 5 permitted output types makes code output structurally impossible.

### L-13: RT-1 REJECT is healthy [ACTIVE]
<!-- valid_from: 2026-04-07 | ended: null | superseded_by: null | cross_project: true -->
13. **RT-1 can REJECT a proposal — this is healthy.** RT-1 on eradev.md decomposition ran 5 roles, 3/5 rejected the split. In-place Part I/II markers accepted as alternative. REJECT is the system working correctly.

### L-14: BL Budget requires active merge [ACTIVE]
<!-- valid_from: 2026-04-07 | ended: null | superseded_by: null | cross_project: true -->
14. **BL Budget requires active merge, not just append.** At 27/30, adding new entries required merging BL-13+23 and BL-6+27. Append-only BL management hits the wall; active compression is required.

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
v9 is the point at which EraDev stops being a software framework that could theoretically be used for writing and becomes a coherence framework that happens to have a well-developed code adapter. The role archetypes (Visionary, Analyst, Builder, Validator, Coherencer) are domain-invariant; the artifacts they work on are domain-variant. Artifact type (code, article, chapter, config, plan, research) is an L2 concern; roles are L1 and must never hard-code artifact assumptions.

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
v9 roadmap D2 deferred the Apophatic role. v10 research found implementing it as a 6th role would break the R/r = phi torus ratio (4/3 = 1.333, not phi). Implementing it as a Section IV Enforcement Gate preserves n=5 while adding the negation function (is this task decomposable? YES/NO/UNCERTAIN with Coherencer probe). Gate ≠ role: gates are enforcement checkpoints (like Kill-Switch, Phantom Coherence Check), roles are cognitive archetypes. The v9 5-role topology is stable because it maps to a mathematical structure; adding a role changes the math. Adding a gate changes the process, not the math. Source: reports/v10_theoretical_research_2026-04-12.md + reports/v10_prototypes_builder_2026-04-12.md.

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
