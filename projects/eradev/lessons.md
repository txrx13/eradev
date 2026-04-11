# EraDev Self-Project — Lessons & Patterns

## Session 1: Framework Rebuild (April 2026)

### Origin
EraDev v7.1 was rebuilt from scratch by 25 agents (5 RT × 5 roles) analyzing two prior versions (eradev_old and eradev_last). This was the first application of the framework to itself — Level 9 self-modification (Psi* = Phi(Psi*)).

### Lessons

1. **25-agent parallel analysis produces emergent insights.** Individual RT teams found different issues. RT1 found duplication (25-30%). RT2 found Lambda problem. RT3 found evolution patterns. RT4 found ODTOE formula errors. Only synthesis (RT5) could see the full picture.

2. **P_coll error propagated across multiple documents.** The value 0.61 (incorrect) for P_coll at B=0.3, n=3, k=1 was present in eradev_old, eradev_last, and multiple articles. Correct value: 0.657. All 20 analytical agents missed it until RT4-Validator specifically recomputed. Lesson: formula verification requires independent recomputation, not consensus.

3. **A/B experiment RU vs EN (10 agents): EN prompts give 48% higher B-score for practical tasks.** But RU agents produce deeper mathematical innovations (phi-weighted S_team, Graduated Activation). Neither language is universally better — the task type determines the optimal language stack.

4. **A/B experiment router.md vs eradev.md Section 0 (10 agents): inline routing wins.** External router.md split the team (Builder went EN, 4 others went RU), creating inter-stack divergence. Inline routing in Section 0 let agents self-determine without forced classification.

5. **Pluggy session (real deployment): 95% solo Builder, 5% delegation.** Root cause: bootstrap prompt said "read and proceed" without declaring META identity. Fix: CLAUDE.md auto-bootstrap + meta.md Section 14 checklist. This is the Lambda problem (BL-16): knowledge without enforcement = zero.

6. **Section 0.5 was created then removed (5-role vote: 3 vs 2).** Checklist in eradev.md created self-reference problem (checklist inside the file it verifies). Merged into meta.md Section 14 per Option C. Lesson: enforcement mechanisms belong in the META protocol, not in the universal core.

7. **Bilingual files created without simultaneous sync = immediate tech debt.** eradev_RU.md was created at v7.0, eradev.md was updated to v7.1. Sync audit found 5 HIGH issues. Fix: BL-19 (bilingual sync rule) now in eradev.md Section 0.

8. **Article format: Check-First prevents 100% of format rework.** Research article was generated with wrong format (no comment groups, \hrule between sections, wrong keywords format). Reading ODTOE_article.tex BEFORE generation would have prevented all issues. Fix: Check-First pipeline in odtoe-articles config.md.

9. **S_adjusted = S_team × B_mean — discovered through A/B experiment.** RU-group had S_team=0.95 (high agreement) but B_mean=0.346 (low quality). Without S_adjusted, RU appears healthier. S_adjusted correctly shows EN (0.447) > RU (0.329). All 10 agents in the next experiment independently found a glossary conflict (two S_adjusted definitions).

10. **tex2md.py regeneration creates unwanted EN files.** Running the converter on all .tex files (including _EN versions) created EN markdown copies that user didn't request. The converter should be run selectively, not on all files.

## Mega-Patterns

### EMP1: Self-application is the ultimate test
When the framework is applied to improve itself, every weakness becomes visible. The Lambda problem, the sync problem, the format problem — all were discovered by using EraDev on EraDev.

### EMP2: A/B experiments are the highest-value activity
Two A/B experiments (RU vs EN, router vs inline) produced more actionable data than 20 analytical reports combined. When in doubt, test don't argue.

### EMP3: The bilingual architecture is a feature, not a bug
EN for breadth, RU for depth. Running both in parallel and synthesizing at RT produces better results than either language alone. The language is an observation operator, not a neutral carrier.

### EMP4: Enforcement must live where it fires
Bootstrap checklist in eradev.md (read by everyone) was theoretically visible but practically ignored. Moved to meta.md (read only by META) where it actually fires. CLAUDE.md (auto-loaded) is the ultimate enforcement — the agent cannot skip it.

### EMP5: Scope determines pipeline strictness
External-dependency tasks (APIs, SSH, third-party services) need stricter gates than isolated internal work. In cycle-7, 58% of feature commits (isolated UI/logic) had 0 fixes, while 83% of all fixes concentrated in 4 boundary chains (gossip, badge, external API). The pipeline should scale its rigor based on boundary surface area: more external dependencies = more verification gates (PRE-FLIGHT, smoke test, error path matrix).

### EMP6: Enforcement without mechanism is Lambda zero, recursively
60-65% of cycle-7 proposals already existed as rules in BL-1 through BL-21. The system knew what not to do; it did it anyway. Seven out of nine incidents had root causes that existing rules already addressed. Adding more rules without adding enforcement mechanisms (checklist items, automated gates, agent prompts) will produce the same result. This is the Lambda problem (BL-16) applied to the system itself: the framework reads its own rules and ignores them. The highest-leverage action is not "add BL-22 through BL-26" but "add enforcement gates for BL-3, BL-6, BL-13 that already exist."

### EMP7: Optimization Without Orientation Is Hill-Climbing Into Fog
Every optimization loop must be embedded within an orientation loop. The optimization loop (edit -> run -> score -> keep/discard) determines how FAST you move. The orientation loop (True North re-derivation, Kill-Switch, Visionary re-assessment) determines WHETHER you move in the right direction. One without the other produces either stagnation (orientation without optimization) or efficient convergence to the wrong answer (optimization without orientation).

Rule: At every 10th iteration of any score-driven loop, pause optimization and run a mini-RT with at least Visionary + Coherencer. The question is not "is the score improving?" but "is the thing we are scoring still the right thing to score?" If the answer is no, redefine the score function before resuming.

Source: AutoAgent analysis (April 2026) -- AutoAgent achieves speed through score-driven hill climbing but lacks orientation mechanism. EraDev achieves orientation through RT deliberation but lacks optimization speed. The synthesis: embed optimization within orientation.

### Session 2: v8 META-Orchestration Architecture (April 2026)

11. **3-Layer Identity Enforcement eliminates single-point collapse.** Single CLAUDE.md enforcement failed in pluggy (95% solo Builder). Adding hook + memory persistence creates 3 independent firing points. Any single layer failing leaves 2 active.

12. **META Output Type Spec is the structural fix for context pollution.** Identity drift was diagnosed not as behavioral but structural: untyped outputs allow any behavior. Enumerating 5 permitted output types makes code output structurally impossible.

13. **RT-1 can REJECT a proposal — this is healthy.** RT-1 on eradev.md decomposition ran 5 roles, 3/5 rejected the split. In-place Part I/II markers accepted as alternative. REJECT is the system working correctly.

14. **BL Budget requires active merge, not just append.** At 27/30, adding new entries required merging BL-13+23 and BL-6+27. Append-only BL management hits the wall; active compression is required.

15. **Bash classification: operational vs diagnostic is the correct boundary.** Research confirmed: restricting META to git-only breaks skill bundle sync (cp/zip), enforcement setup (chmod), and decision-making (ls). The correct split: operational commands (git, ls, cp, mkdir, zip, chmod, diff) stay with META for infrastructure management. Diagnostic commands (grep, curl, ssh, psql, redis-cli, jq) are blocked and delegated to Check Agent ([ANALYST] or [VALIDATOR]). Hook enforces this at Layer 2.

### Session 3: v9 Universalization — text-discrete coherence framework (April 2026)

16. **Scope cut is a first-class Visionary output.** The operator's "универсализация для научных книг и статей" could have expanded to continuous/flow tasks (streaming, real-time simulation, data pipelines). Phase 0.A Visionary explicitly REJECTed continuous into v10+ and bounded v9 to text-discrete artifacts only. Without the cut, the domain schema would have bloated with latency budgets and backpressure semantics that don't fit the B-formula's multiplicative gate structure. Rule: the Visionary phase must name what is OUT of scope, not just what is IN.

17. **Modal B-formula preserved its product structure under generalization.** B = F·E·(1-σ)·Λ survived the code→text/article/book transition without changing shape. Only the relative weights shift across modalities (text / creative / research). The product form is domain-invariant because multiplicative AND-gating of 4 orthogonal failure modes is a statement about epistemic coherence, not about software quality. When an abstraction generalizes without changing shape, that's evidence it was already the right abstraction — it was being applied in a narrower domain than necessary.

18. **4-layer architecture (L0/L1/L2/L3) is backward-compat by construction, not by assertion.** Absent `domain:` block in a project config → defaults (type=code, B_modality=text, ood_scope=text-discrete, verify.method=build). Phase 1.E AC-3 walked through a zero-diff code-project bootstrap to prove this, rather than claiming it. Proof-by-construction is load-bearing when the claim is "v8 projects load identically under v9".

19. **Universal role archetypes require lexical discipline, not just structural.** v8 role files were code-biased in vocabulary (15-40 code-specific tokens per file: function, API, endpoint, bug, refactor, type-check). Phase 1.A refactor brought each file to <5 code tokens and added 3 examples per role (code, article, chapter). The L1/L2 architectural boundary is philosophical but its enforcement is mechanical — run a regex, count the tokens, fix the ceiling.

20. **BL tagging [UNIVERSAL] vs [CODE-ADAPTER] made L2 inheritance mechanical.** 22 universal + 8 code-adapter = 30 BL, split into two files. A future L2 domain skin now inherits the universal 22 by default and only overrides specific items. No more "which lessons apply to my article project?" judgment calls. Structural clarity replaces editorial judgment.

21. **Self-loading context architecture scaled to 20+ parallel agents.** Each agent Reads its role file as FIRST action; META names only the path. v9 stress-tested this: Phase 1.A vocabulary refactors automatically propagated to Phase 1.B/1.C/1.D/1.E agents because each agent loaded the *current* role file, not a META-embedded snapshot. Zero context pollution at META level. Zero version drift across agents. Self-loading is the architectural mechanism that made one-session 5-wave execution possible.

22. **Phantom Coherence Check surfaced drift that RT-1 consensus missed.** 10 agents (5 EN + 5 RU) agreed on v9 direction. None flagged the skill mirror drift, the bilingual gap, or the template phrasing. A dedicated Phase 1.E Validator L2 running the Phantom Check as a release gate found all 3. S_adjusted = S_team × B_mean is dissonance-amplifying: high S without high B is precisely where phantom lives. Dedicated release gates (not just RT consensus) are mandatory for cross-cutting cycles.

23. **Language-bound regex in invariants is a latent bilingual bug.** Hook Check 5 originally matched English "read" — 5 RU agents were blocked in parallel RT-1 spawn because "Прочитай" didn't match. Fix: make enforcement surface the file path, not the lexical signal around it. Rule: whenever an invariant is enforced by regex, any English-only lexical anchor is a bug waiting for the non-default language to surface.

24. **An enforcement mechanism that blocks your own valid operations is broken, not strict.** enforce-delegation.sh originally blocked META Writes to reports/, lessons.md, memory/ — all of which are META's explicitly enumerated output types. Fix: whitelist for META-owned paths, verified against the 6-output-type enumeration. This is BL-29 (verify terminology) applied to enforcement mechanisms themselves: every hook must be verified against the spec it enforces.

25. **Template files ship stale guidance into every new project until you grep them.** v8→v9 introduced self-loading (agents Read role files themselves instead of META embedding "FULL CONTENT"). Root CLAUDE.md was updated; templates/CLAUDE.md.template was not. Every new project copied from that template shipped the v8 anti-pattern. Wave 5 fixed it with 3 targeted edits (Invariant 12, Language Stack, KILL-TEST). Rule: when introducing a new architectural pattern, grep the template files for the old pattern's phrasing — they're copied at project creation and propagate silently.

## Session 3 Mega-Patterns

### EMP8: Coherence framework, not software framework
v9 is the point at which EraDev stops being a software framework that could theoretically be used for writing and becomes a coherence framework that happens to have a well-developed code adapter. The role archetypes (Visionary, Analyst, Builder, Validator, Coherencer) are domain-invariant; the artifacts they work on are domain-variant. Artifact type (code, article, chapter, config, plan, research) is an L2 concern; roles are L1 and must never hard-code artifact assumptions.

Corollary: whenever a framework-level change is proposed, ask "does this change the L1 archetype, or does it change an L2 assumption?" If L1 — require cross-modality verification (test against code + article + book). If L2 — scope to the affected modality.

### EMP9: Structural invariance is the signature of a correct abstraction
B = F·E·(1-σ)·Λ survived code→text generalization without structural change; only the weights shifted. Section 0 language routing survived the same generalization; only the token lists expanded. The 6 META output types survived; only the content varied. When abstractions generalize without changing shape, the original form was already correct and was merely being applied too narrowly. When abstractions break under generalization, the original form was over-fitted to the narrow case.

Rule: before changing an abstraction to accommodate a new domain, first check whether the new domain is a valid instance of the existing abstraction. Most "we need a new formula for X" requests fail this check — the old formula works, only the reading context needs adjustment.
