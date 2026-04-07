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
