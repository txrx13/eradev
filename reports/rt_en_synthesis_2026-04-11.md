# RT-1 EN Team Synthesis — Universalization of EraDev

> Date: 2026-04-11
> Author: [COHERENT] EN, L2 synthesis (cross-role, within-team)
> Cycle: RT-1 (EN stack, 5 roles)
> Input reports:
> - reports/rt_en_visionary_2026-04-11.md
> - reports/rt_en_analyst_2026-04-11.md
> - reports/rt_en_builder_2026-04-11.md
> - reports/rt_en_validator_2026-04-11.md
> - reports/rt_en_coherent_2026-04-11.md
> Status: EN team unified verdict, ready for RT-2 (or L3 cross-team fusion with RU team)

---

## 0. Activation Operator Log (L2 Coherent)

- **A_F (Focus):** Read coherent_EN.md (L1/L2/L3 definition, Jidoka template, Verification Register), all 5 EN RT-1 reports in full, projects/eradev/lessons.md (15 lessons + 7 EMPs), BOOTSTRAP_LESSONS.md (32 BL) via references already captured by the 5 agents.
- **A_E (Alignment):** True North for this cycle = "Is universalizing EraDev beyond code feasible and if so, what is the smallest safe first step?" The L2 task is not to rewrite the 5 reports — it is to find (a) where they agree, (b) where they diverge, (c) whether the divergences are recoverable through explicit Phase 0, (d) whether the agreement is real or phantom.
- **A_sigma (Consistency):** Primary tension axis = Builder/Analyst optimism vs Validator adversarial block. Visionary is strategic-optimistic, Coherent is cautious-accept, Analyst is structurally-accept, Builder is implementationally-accept. Validator is the sole dissenter but with the heaviest argument (BUG-04, the non-code Lambda=0 claim). This is NOT phantom coherence in the sense of everyone agreeing without looking — it IS the structured disagreement shape that RT-1 is supposed to produce. Validator's dissent is the 2% spiral gap fuel.
- **A_Lambda (Experience):** Lessons activated by this synthesis: Lesson 4 (inline routing wins — applies to domain detection), Lesson 7 (bilingual sync is immediate tech debt — applies to adapter layer), Lesson 11 (3-Layer enforcement — applies to "knowledge without enforcement" BL-16 recursion on non-code domains), EMP1 (self-application — universalization IS self-application at a new level), EMP5 (scope determines strictness — becomes universal once decoupled from code examples), BL-16 (reading ≠ applying — the dominant risk on this proposal), BL-19 (bilingual sync), BL-24 (5+ files → RT-2), BL-30 (defense in depth).

All 4 A-steps GREEN. Proceed to synthesis.

---

## 1. Coherence Computation

### 1.1 Individual B-checks (from each EN report)

| Role        | F    | E    | (1-σ) | Λ    | B (individual) | Method               |
|-------------|------|------|-------|------|---------------|----------------------|
| Visionary   | 0.85 | 0.90 | 0.80  | 0.85 | **0.520**     | multiplicative       |
| Analyst     | 0.90 | 0.90 | 0.85  | 0.85 | **0.585**     | multiplicative       |
| Builder     | 0.90 | 0.88 | 0.85  | 0.85 | **0.572**     | multiplicative       |
| Validator   | 0.85 | 0.90 | 0.80  | 0.80 | **0.490**     | multiplicative       |
| Coherent  | 0.85 | 0.80 | 0.70  | 0.75 | **0.774**     | geometric-mean (1/4) |

Note on the Coherent row: it used geometric-mean-of-4 (B = (F·E·(1-σ)·Λ)^0.25 ≈ 0.774). If I re-normalize to the same multiplicative form the other four used (B = F·E·(1-σ)·Λ), the Coherent's own B = 0.85 · 0.80 · 0.70 · 0.75 = **0.357** — below 0.5. This is a documented formula inconsistency across EN team reports. I will use the multiplicative form for team aggregation (it is the dominant convention in eradev.md and used by 4/5 reports) and flag the Coherent row as "0.357 strict / 0.774 gm" for transparency.

**B_mean (strict multiplicative, all 5):**
B_mean = (0.520 + 0.585 + 0.572 + 0.490 + 0.357) / 5 = **0.505**

**B_mean (with Coherent's own gm form):**
B_mean' = (0.520 + 0.585 + 0.572 + 0.490 + 0.774) / 5 = **0.588**

Both values are above the 0.5 ANDON threshold but the strict form is razor-thin (0.505). The weakest link in the strict form is Validator (0.490), who is intentionally below threshold as an HONEST under-confidence (self-described in his B-check) and Coherent (0.357) due to formula mismatch.

### 1.2 S_team (agreement on core questions)

Per ODTOE: S_team = 1 − (2/(n(n−1))) · Σ|B_i − B_j|.

With n=5 and the 5 B-values (0.520, 0.585, 0.572, 0.490, 0.357 — strict form):

- Pairwise distances (10 pairs):
  - |0.520−0.585| = 0.065
  - |0.520−0.572| = 0.052
  - |0.520−0.490| = 0.030
  - |0.520−0.357| = 0.163
  - |0.585−0.572| = 0.013
  - |0.585−0.490| = 0.095
  - |0.585−0.357| = 0.228
  - |0.572−0.490| = 0.082
  - |0.572−0.357| = 0.215
  - |0.490−0.357| = 0.133
- Sum of distances = 1.076
- 2/(n(n-1)) = 2/20 = 0.1
- S_team = 1 − 0.1 · 1.076 = 1 − 0.1076 = **0.892**

With the Coherent gm form (0.774 instead of 0.357), the sum of pairwise distances drops and S_team ≈ **0.921**.

### 1.3 S_adjusted (BL-4)

S_adjusted = S_team × B_mean

- Strict form: S_adjusted = 0.892 × 0.505 = **0.450**  → **BELOW 0.5 → formally PHANTOM COHERENCE ZONE**.
- GM form: S_adjusted = 0.921 × 0.588 = **0.541** → marginally above 0.5.

### 1.4 Phantom Coherence Check (BL-5)

Rule: S_team > 0.8 AND B_mean < 0.4 ⇒ phantom coherence.

- Strict form: S_team = 0.892 > 0.8 ✓, B_mean = 0.505. 0.505 is NOT below 0.4. Phantom coherence NOT formally triggered by the rule.
- But the **margin is thin** (0.105 above the 0.4 floor). This matches the Validator's independent finding in his own report: "S_adjusted margin is thin... One bad review flip collapses the team into phantom coherence territory."
- In the strict form, S_adjusted itself IS below 0.5 (0.450), which is the BL-4 red-line, independent of the BL-5 phantom rule. **Under BL-4 strict reading, this team is BELOW the coherence threshold and should not proceed to RT-2 without remediation.**

### 1.5 Coherence verdict

**Formally:** team coherence is at the edge. Under the strict multiplicative form, S_adjusted = 0.450 (below 0.5). Under the Coherent's geometric-mean form, S_adjusted = 0.541 (barely above). The EN team agrees strongly on HIGH-LEVEL shape (all 5 reports converge on "the core is already universal; the enforcement layer is code-shaped") but disagrees on CATEGORY (Validator says borrows are code-specific; the other 4 treat them as universalization inputs) and on SCOPE (Analyst says XL/50 files; Builder says ~18 files; Coherent says Phase 0 tagging only).

**Interpretation:** this is **productive disagreement**, not phantom alignment. The 4/5 optimism on direction and the 1/5 adversarial block on category are the structure of a functioning RT-1 cycle. The thin margin is a signal to converge in RT-2, not to abort.

**Decision:** proceed to RT-2 **conditionally on Phase 0 resolution of Validator's BUG-04** (no non-code task data). This matches three independent recommendations: Coherent's Phase 0 tagging, Validator's "define universalization target" + "run T6 adversarial bootstrap test FIRST", and Builder's 3-domain smoke test.

---

## 2. Convergent Findings (Where All 5 EN Agents Agree)

The intersection of all 5 reports yields the following unanimous positions.

### C1. The 5-role topology is a stable attractor, not code-specific
All 5 agents reference the MetaGPT + PaperOrchestra independent convergence on 5 roles. All 5 agree the ODTOE math (B, S_team, S_adjusted, P_coll, spiral gap, Jidoka self-check) is domain-agnostic on its face.

Validator qualifies this: "Two frameworks built by humans in the same year for the same task converging on the same decomposition could be path-dependent" — but he does not reject the 5-role claim, only the certainty of it. All 5 preserve the 5-role structure in their proposals.

### C2. The code shape of EraDev is inherited from the Claude Code harness, not axiomatic
All 5 agents, in different words:
- Visionary: "EraDev's 5 roles are NOT software-specific. They are universal cognitive archetypes wearing software clothing."
- Analyst: "role files, BL entries, and meta.md guide all bake a specific domain (software engineering with build/compile/lint/commit/deploy) into files that are advertised as universal."
- Builder: "EraDev ALREADY has a working scientific-articles project... The framework is already universal in its bones but leaks code-specific vocabulary."
- Validator: "The 12-borrow list is dominated by code-domain optimizations... Only 3 generalize cleanly."
- Coherent: "EraDev is code-focused because the enforcement surface... is the only surface where enforcement could land. The math was never code-specific; only the grounding was."

**Unanimous:** formalism is universal; enforcement + vocabulary is code-shaped.

### C3. Silent universalization is already happening (odtoe-articles, academic-lab)
All 5 agents note that `projects/odtoe-articles/` already runs RT cycles on a non-code task (LaTeX article generation with 7 verification checks). Analyst and Builder both explicitly say this project IS the existence proof that the framework can handle non-code work. Coherent names it "silent universalization" as a distinction to crystallize. Visionary treats it as a Resonance-zone datapoint. Validator concedes it but flags that no non-code task data was fed back into the borrow analysis.

**Unanimous:** the project already has a non-code case study; the disagreement is only about how to make the silent pattern explicit.

### C4. Bilingual sync (BL-19) is the dominant tech debt vector for any universalization
All 5 agents explicitly invoke BL-19. Visionary (Risk 3: "Bilingual tax doubles for each new domain"). Analyst (Phase 0 discipline: EN+RU pair per commit). Builder (BL-19 enforcement in the smallest change set). Validator (not primary concern but mentioned). Coherent (Lesson 7 — "bilingual sync is immediate tech debt" — raised as the dominant structural risk).

**Unanimous:** any universalization that creates new file pairs (adapters, archetypes, skins, domains) will multiply bilingual sync cost linearly. Tool support (diff-structure CI check) is necessary, not optional.

### C5. The enforcement layer must be designed BEFORE the formalism is extracted
Validator says it loudest (BUG-04), Coherent says it formally ("BL-16 recursion: universalization without enforcement design"), Builder says it as EMP6 ("enforcement without mechanism is Lambda zero recursively"), Analyst says it as a Risk R3 ("new domains/ layer read as optional and ignored = Lambda=0 recurrence"), Visionary says it as FM-5 ("BL enforcement breaks on non-software rules").

**Unanimous:** the non-code enforcement question is the load-bearing unresolved problem. Any proposal that does not answer it is BL-16 recursion.

### C6. The smallest viable change is additive, not rewriting
- Visionary: "Universal Wrapper pattern — add an archetype layer UNDER current role files, add domain skin layer OVER them, leave ODTOE core UNTOUCHED."
- Analyst: "None [deleted]. Even the most code-biased content is repurposed, not deleted. This preserves all accumulated Lambda."
- Builder: "Alternative A + B... Ship as part of A+B... All changes are additive or surgical edits — no rewrites."
- Validator: "Reclassify borrows by domain. Drop all REJECT items from the universalization plan; they belong in a separate 'code-domain Phase 1' roadmap." (i.e. keep universalization purely additive, subtract the code-only borrows from it).
- Coherent: "Phase 0 = tag existing Invariants and BLs with a domain-scope marker... Do NOT create domain adapters yet. Do NOT rewrite hooks."

**Unanimous:** no rewrites. All 5 propose additive layers or tagging. Zero votes for Alternative E (ontology rewrite).

---

## 3. Divergent Findings (Where Roles Disagree)

Coherence is in the shape; divergence is in scale, scope, and category.

### D1. Scale of Phase 1 change (2 hours → 7.5 hours → 50 files / XL)

| Role        | Phase 1 size estimate     | Files touched | Philosophy                                |
|-------------|---------------------------|---------------|-------------------------------------------|
| Coherent  | ~2 hours, tagging only    | ~2            | Smallest reversible probe                 |
| Visionary   | ~3 hours (quick wins)     | ~8-12         | Archetype layer + CLAUDE.md template      |
| Builder     | ~7.5 hours (A+B combined) | ~14           | Abstraction + domain adapter schema       |
| Analyst     | 4–6 hours agent-work      | ~50           | Full domains/ layer + skill bundle mirror |
| Validator   | 30 minutes for T6 test    | ~0            | Do not build; prove falsifiability first  |

**Analysis:** the disagreement is about what "first step" means.
- Validator argues epistemology first (prove we CAN universalize before changing anything).
- Coherent argues documentation first (tag what is universal so the next agent can see it).
- Visionary argues architecture first (add opt-in layers).
- Builder argues vocabulary + schema together (BL-30 defense-in-depth in one commit set).
- Analyst argues full decomposition first (treat as XL, RT-2 mandatory).

All five are internally consistent. The disagreement is a **zoom-level disagreement**, not a direction disagreement. All 5 point the same way; they disagree on stride length.

**Resolution proposal (for RT-2 synthesis):** sequence them. Validator T6 → Coherent tagging → Builder A+B → Analyst full decomposition. This is a 4-step Phase ladder, not a conflict.

### D2. Whether the existing 12 borrows are "universalization inputs" at all

- Visionary, Analyst, Builder, Coherent: implicit or explicit assumption that borrows from comparison report + RTK analysis feed the universalization plan.
- Validator (BLOCK): 9 of 12 borrows are code-specific; only 3 generalize. The universalization plan is a mislabeled code-domain Phase 1 roadmap.

This is the **single biggest divergence** in the team. It is not resolvable by negotiation — it is a factual claim about whether specific borrows (RTK, compound lexer, canonical parser types, tool-scoped permissions as enumerated) have non-code applicability. Validator's table of 3 ACCEPT / 5 MODIFY / 4 REJECT is the authoritative input and should be adopted as an RT-1 output.

**Resolution:** accept Validator's reclassification as the RT-1 canonical borrow-to-universalization mapping. Drop the 4 REJECT borrows from the universalization workstream and move them to a "code-domain Phase 1" workstream that runs independently. This is fully compatible with all 5 reports — the other 4 did not explicitly reject Validator's reclassification because they were focused on different decompositions.

### D3. Whether n=5 is rigid or allows n ∈ {5, 7}

- Visionary FM-3: "False universality — book writing actually needs 6 roles not 5." Proposes "allow n in {5, 7} (both primes, both match ceil(pi)+k pattern)."
- Analyst: treats n=5 as invariant ("5-role topology (ODTOE analog) is provably minimal... MetaGPT converged on the same split independently"), cites eradev.md n_min = ⌈π⌉+1 = 5 axiom.
- Builder: treats n=5 as invariant.
- Validator: agrees with Visionary in effect — "Role count should be task-dependent. n_min = 5 is a theorem about teamwork stability, not a claim that 5 is always optimal" (edge case analysis, sections 1, 2, 7).
- Coherent: does not engage this question directly in RT-1 but defers all structural changes to Phase 0 tagging.

**Tension:** Visionary + Validator see n as flexible; Analyst + Builder treat it as rigid. Coherent silent.

**Resolution (for RT-2):** this is a v9/v10 question, not a Phase 0 question. Phase 0 tagging and Phase 1 domain adapter work can proceed with n=5 assumption. If/when a real book or therapy-plan project appears, a 6th role (Reader Advocate / Adversary / Stakeholder) may be added experimentally in that project's config.md without touching the core. Defer the structural n ∈ {5,7} decision until a non-code project empirically requires it.

### D4. Whether RTK / compound lexer / canonical parser types belong in RT-1 at all

- Validator: categorical REJECT — they are code-specific, their presence in a universalization report is a **category error** (BUG-01).
- Others: treat them as borrows to evaluate but agree they are heavy on code-domain (Builder: Alternative D notes that skill bundles need A+B groundwork first; Analyst: no mention of RTK in the 50-file plan, implicitly dropping it).

**Resolution:** adopt Validator's category error finding. RTK compression, compound lexer, canonical parser types go to a "software adapter phase 1 optimization" bucket. They are NOT universalization work.

### D5. Where does domain detection live — inline (roadmap-style) or external (adapter manifest)

- Coherent: **MUST be inline** (Lesson 4 — inline routing wins; externalization causes team splits).
- Analyst: proposes `domains/` directory as external files + `projects/{name}/config.md: domain:` declaration. Each agent reads the domain file in addition to role file.
- Builder: same as Analyst — external `domain:` block in project config.
- Visionary: projects/{domain}/role_skin.md file per domain.
- Validator: does not specify but flags tool-scoped permissions need a (role × domain) matrix, implicitly external.

**Tension:** Coherent's Lesson 4 argument says externalization caused the Builder-going-EN-vs-4-others-going-RU split in a past A/B experiment. The other 4 propose external domain files. This is a DIRECT contradiction with a concrete lesson.

**Resolution (for RT-2):** this is the first real technical conflict to settle in RT-2. Options:
1. **External file + inline router section in eradev.md**: the domain file exists externally, but eradev.md contains inline domain detection keywords (extending Section 0 verb table) and a "if this task type → load this domain file" table. Agents see the routing inline before they read the external file. This satisfies both Lesson 4 (inline routing) and the Analyst/Builder file-separation proposal.
2. **Inline-only (Coherent strict)**: domains go into eradev.md as numbered sections, not external files. Simpler but violates Analyst/Builder's architectural cleanliness.
3. **External-only (current proposal)**: Analyst/Builder path, but Coherent's Lesson 4 risk is real and must be mitigated by other means (e.g., hook enforcement that checks "did the agent read the domain file?").

I propose option 1 for RT-2: external domain files but inline router in core.

---

## 4. Resolved Tensions

These are items where one or more reports flag a concern but the union of reports has resolved it:

### R1. "Will universalization break existing code projects?"
Builder explicitly addresses this: "Zero breakage expected. The change is purely additive." Analyst's dependency graph also shows project configs only gain an additive `domain:` block. Validator does not dispute this. Coherent's Phase 0 tagging is non-disruptive by construction. **Resolved:** no regression risk if Phase 1 is A+B (abstraction + schema), not C (variant role files) or E (ontology rewrite).

### R2. "Is the 5-role structure preserved?"
All 5 preserve it. Analyst explicitly: "Universalization is NOT about removing the Builder role." **Resolved:** 5 roles preserved; only their vocabulary and domain binding change.

### R3. "Is ODTOE math touched?"
All 5 explicitly protect it. Coherent quotes the paper's language ("the word is task, not code task"). Visionary's IFR: "ODTOE math — already universal." Builder: "ODTOE formulas... universal." **Resolved:** ODTOE math layer (eradev.md Section XI, the coherence formulas) is untouched. Phase 0 does not edit math.

### R4. "Is bilingual sync a blocker?"
Analyst makes it Risk R4 (MED/MED), Visionary makes it Risk 3 (HIGH if unmitigated), Coherent makes it the dominant Lesson 7 recursion risk. Mitigation is unanimous: "tool the sync audit" (Visionary), "per-commit EN+RU pairing" (Analyst), "single commit per EN+RU pair per role file" (Builder). **Resolved:** bilingual sync is a managed risk with a known mitigation (tooling + discipline). It does not block Phase 0.

### R5. "Is the `domain.build_command` field a security attack surface?"
Builder explicitly analyzes this (Section B-5) and concludes: LOW net risk, equivalent to existing lessons.md prompt injection risk, mitigated by Invariant 10 (diagnostic bash → Check Agent delegation) and human git review. Validator does not raise new security concerns on this. **Resolved:** manageable via existing mechanisms; no new hook needed.

---

## 5. Open Questions (Feed RT-2)

The spiral gap for RT-2 consists of the questions that all 5 reports could not answer or that emerged from the disagreement structure.

### OQ-1. What is the canonical non-code task for validation?
Validator's BUG-04 and Recommended Action #1. Without answering this, S_adjusted cannot rise above the phantom threshold.

**Proposal for RT-2:** use one existing `odtoe-articles/` task as the canonical non-code case study. It is already running; Phase 0 tagging + 30-minute T6 adversarial bootstrap test are cheap to execute.

### OQ-2. How does Invariant 10 (Bash classification) generalize to non-code domains?
Raised by Coherent (OQ-2) and Analyst (Section 14 item 6). Proposed generalization: "diagnostic operations on external state must be delegated to Check Agents" — where "external state" in writing = library search, in research = dataset query, in code = grep/curl.

**Proposal for RT-2:** keep Invariant 10 as-is for code adapter; write a universal form that the code adapter is one instance of. Document in Coherent's domain tag table.

### OQ-3. Is the domain binding layer inline or external?
Direct contradiction between Coherent (Lesson 4: inline routing wins) and Analyst/Builder/Visionary (external domain files). See D5 above. My proposed hybrid (option 1) needs RT-2 ratification.

### OQ-4. Does Phase 0 tagging actually change agent behavior, or is it pure documentation?
Coherent's Phase 0 explicitly defers this measurement to post-Phase-0 observation: "evaluate whether the tags cause any behavioral change in the next M+ task. If yes → Phase 1. If no → Phase 1 must add enforcement."

**Proposal for RT-2:** accept this deferred measurement; Phase 0 is a probe, not a commitment. Low cost, high information value.

### OQ-5. Do non-code domains need a 6th role (n ∈ {5,7})?
Visionary FM-3 + Validator edge case analysis. Analyst and Builder treat n=5 as invariant. See D3.

**Proposal for RT-2:** defer to project-level. If a book or therapy project needs a 6th role, it can add one in its own config.md without editing eradev.md. Structural support for variable n is not part of Phase 0 or Phase 1.

### OQ-6. Can the memory hierarchy (MemPalace borrow #5) ride along with universalization or must it be sequenced separately?
Validator's Premature Optimization Risk #5: "rebuilding the entire memory layer during universalization creates simultaneous migration risk." Builder and Analyst do not address memory rebuild in their Phase 1.

**Proposal for RT-2:** accept Validator's sequencing. Memory hierarchy is Phase 2 or later. Phase 0 tags; Phase 1 builds domain adapter layer; Phase 2 considers memory.

### OQ-7. Formula inconsistency in B calculation
The 5 reports use two different B formulas (strict multiplicative vs geometric-mean-of-4). This is not a universalization question; it is a coherence-hygiene question within the EN stack. Ironic that the Coherent is the one who used the non-standard form.

**Proposal for RT-2:** standardize on strict multiplicative B = F · E · (1-σ) · Λ per eradev.md Section XI. Add a note to coherent_EN.md that the geometric mean form is not canonical.

---

## 6. Synthesis Verdict

### Does the EN team think universalization is feasible?

**Yes, with conditions.** 4 of 5 EN agents explicitly endorse proceeding; the 5th (Validator) blocks conditional on 7 pre-actions that the other 4 can satisfy without changing their core proposals.

The feasibility is constrained, not unconditional:
1. **Feasible in formalism:** all 5 agree ODTOE math + 5-role structure are already universal.
2. **Feasible in vocabulary:** all 5 agree core files can be de-code-biased through surgical edits.
3. **Feasible in adapter layer:** 4 of 5 propose some form of domain layer; 1 (Coherent) defers adapter creation until Phase 0 signal.
4. **NOT YET feasible in enforcement:** all 5 flag this as the dominant unresolved problem. Phase 0 does not attempt to solve it.
5. **NOT YET feasible for borrows:** Validator's reclassification (3 ACCEPT / 5 MODIFY / 4 REJECT) is the canonical decision; 4 borrows must be removed from the universalization plan.

### The smallest safe first step (EN team consensus)

**Phase 0 (Coherent's proposal, refined by the rest):**
1. Tag all 14 Invariants in CLAUDE.md with [UNIVERSAL] or [CODE-ADAPTER].
2. Tag all 32 BL in BOOTSTRAP_LESSONS.md with the same taxonomy.
3. Add a "## Domain Scope" section in CLAUDE.md declaring that EraDev core is universal and the current adapter is `code`.
4. Run Validator's 30-minute T6 adversarial bootstrap test: give the framework (post-tagging) to a fresh agent with one non-code task from `odtoe-articles/` and observe whether the agent silently defaults to code behavior.
5. Do NOT create domain adapter files yet. Do NOT edit hooks. Do NOT touch ODTOE math.

**Cost:** ~2 hours effort + 30-minute smoke test. Fully reversible. Zero new files.

**Signal:** the T6 result decides whether Phase 1 (adapter schema, Builder's A+B) is safe to pursue. If T6 shows the agent defaults to code behavior, Phase 1 must include enforcement (hook or prompt contract). If T6 shows the agent adapts, Phase 1 can be the lighter A+B without enforcement.

---

## 7. Top 5 Unified Recommendations (Intersection of Role Findings)

These are the 5 recommendations that appear in 3 or more reports AND survive Validator's critique.

### U1. Phase 0: Tag Invariants and BL entries by domain scope (Coherent, seconded by Validator's "define scope" requirement and Visionary's "Domain audit" Phase 0 item)
Add [UNIVERSAL] or [CODE-ADAPTER] tag to each of 14 Invariants and 32 BL entries. Zero file rewrites; one commit; ~2 hours. Target after Phase 0: 9/14 invariants tagged UNIVERSAL, 5/14 tagged CODE-ADAPTER (Coherent's proposed split); ~20/32 BL tagged UNIVERSAL, ~8/32 tagged CODE-ADAPTER, ~4/32 requiring minor wording fixes (Analyst's count).

### U2. Preserve ODTOE math layer and 5-role topology as untouched (Visionary, Analyst, Builder, Validator with caveat, Coherent)
eradev.md Section XI (coherence formulas), Section 0 (5 roles), RT protocol, Jidoka self-check template — zero edits. Phase 0 and Phase 1 may not touch these. This is the strongest invariant the EN team produces.

### U3. Build a domain adapter schema in each project's config.md (Builder Alternative B, Analyst Section 3, Visionary Layer 2 skin)
Every `projects/{name}/config.md` gets a `domain:` block with fields: `type`, `artifact_types`, `build_command`, `verify_command`, `deploy_target`. Human-read markdown prose with key markers (not strict YAML). Additive to existing content. Target files: `projects/eradev/`, `projects/odtoe-articles/`, `projects/academic-lab/`, `projects/plugy/`. This is Phase 1.

### U4. Drop the 4 REJECT borrows (RTK, compound lexer, canonical parser types, hook profiles as-stated) from the universalization workstream (Validator's category error, implicitly accepted by others)
These belong in a "code adapter phase 1 optimization" track that runs independently. Universalization Phase 1 = A+B (Builder) = tagging + abstraction + schema. Code-domain performance work = RTK + lexer + canonical types + hook profiles. Two separate workstreams, two separate RT cycles.

### U5. Run Validator's T6 adversarial bootstrap test after Phase 0 (Validator's Required Action #2, implicit in Builder's 3-domain smoke test, compatible with Coherent's Phase 0 measurement step)
Give the post-Phase-0 framework to a fresh agent with ONE concrete `odtoe-articles/` task. Measure: does the agent correctly self-load the domain adapter and use `tectonic` instead of defaulting to `go build`? Binary outcome. ~30 minutes. This is the falsifiability test for Phase 0 universalization.

---

## 8. Top 3 Risks (Union of Role Concerns)

These are the risks where at least one role assigned HIGH severity AND no other role mitigated them away.

### R-HIGH-1. BL-16 recursion: knowledge without enforcement on non-code domains
**Sources:** Validator (BUG-04, Premature Optimization Risks), Coherent (Lesson 11 — 3-Layer Identity Enforcement), Analyst (R3: "New domains/ layer read as optional and ignored"), Builder (EMP6 reference), Visionary (FM-5: "BL enforcement breaks on non-software rules").

**Blast Radius:** if Phase 1 adds domain files but no enforcement, agents on non-code projects will silently default to code behavior. This replicates the pluggy failure at a higher level. Framework integrity decays from within.

**Mitigation (accepted by 4/5):** Phase 0 is pure documentation (no new mechanism = no enforcement debt). Phase 1 Builder A+B adds a Session Bootstrap checkbox requiring the domain adapter read. Phase 2 may add a hook that checks agent prompts contain the domain file read. The 3-layer enforcement (CLAUDE.md + hook + memory) must be designed alongside each new layer, not afterward.

**Open:** exact enforcement mechanism for non-code domains. Harness-level tool_use event interception is required but does not exist yet in Claude Code. Temporary enforcement = Coherent RT gate review.

### R-HIGH-2. Terminology drift between parallel domain writers (code, article, book)
**Sources:** Analyst R1 (HIGH probability, HIGH impact — canonical risk), BL-29 reference. Builder mentions terminology drift as R5 ("Over-abstracting core leaves it vague; role files lose 'bite'"). Visionary FM-2 ("domain skin divergence... same concept gets renamed differently in two skins").

**Blast Radius:** 3 builders working in parallel on 3 domain files will each call the same concept differently ("Verify Before Act" vs "Pre-Generation Check" vs "Reality Check"). BL-29 violated. Core and domain layers drift. Agents reading different domain files use different vocabularies; S_team decays.

**Mitigation (Analyst proposal):** Phase 0 of Phase 1 (sic) is a canonical template file (N7 DOMAIN_TEMPLATE_EN.md) with required section headers and required terms. All parallel domain builders copy from the template. Coherent runs a terminology audit at end of parallel phase. This is the ONLY time Coherent gets veto power during Phase 1.

### R-HIGH-3. Bilingual tax × domain count = quadratic file multiplication
**Sources:** Coherent (Lesson 7 — direct crystallization), Visionary Risk 3 (4 domains × 2 languages = 8 skin files, linear cost), Analyst 4.1 (18 new files = 9 EN + 9 RU), Builder (BL-19 enforcement cost doubles in Alternative C).

**Blast Radius:** every new domain adds 2 files (EN + RU). Every new core invariant or BL needs bilingual update. The sync cost is O(domains × languages × file count), i.e. O(D·L·N). For D=4 domains, L=2 languages, N=20 core files: 160 file-updates per version bump. Manual sync fails at this scale (Lesson 7 says it failed at 5 HIGH issues on a single EN→RU update).

**Mitigation (unanimous):** tool the sync audit. Add a `scripts/bilingual_sync_check.sh` that diff-structures EN and RU files and flags section mismatches. Run on every commit touching `roles/`, `eradev.md`, `meta.md`, or any proposed `domains/*`. This is operational bash (Invariant 10 allows it). Add as a BL follow-up: "BL-19b: structural diff check for bilingual files on every sync commit."

---

## 9. Phase Plan (EN Team Synthesis)

### Phase 0: Tagging + Smoke Test (accepted by all 5 agents)

**Objective:** resolve Validator's BUG-04 cheaply. Make the universal/code-adapter split visible in existing files. Do not create new files. Do not change mechanisms.

**Deliverables:**
1. CLAUDE.md: add "## Domain Scope" section + tag all 14 Invariants with [UNIVERSAL] or [CODE-ADAPTER].
2. BOOTSTRAP_LESSONS.md: add [UNIVERSAL] or [CODE-ADAPTER] tag to each of 32 BL entries. Tag ~4 with [UNIVERSAL — minor wording].
3. Run Validator's T6 test: one `odtoe-articles/` task, fresh Claude Code session, measure whether the agent defaults to code behavior.
4. Commit message: "Phase 0: tag invariants + BL by domain scope. Measure non-code behavior."
5. L2 Coherent checkpoint: read the T6 output, declare Phase 1 green/yellow/red.

**Gate to Phase 1:** T6 shows agent successfully self-selects non-code behavior (green) OR clearly defaults to code (red). Yellow = run T6 a second time with an intentionally ambiguous task.

**Cost:** ~2 hours.
**Risk:** LOW. Fully reversible by `git revert`.
**Files touched:** 2 (CLAUDE.md, BOOTSTRAP_LESSONS.md).

### Phase 1: Adapter Schema + Vocabulary Abstraction (Builder A+B, Analyst 12-14 files variant)

**Objective:** make the adapter layer real. Rewrite role file Mission/Key Rules in artifact-neutral terms. Add `domain:` block to every existing project's config.md. Add domain load step to Session Bootstrap.

**Pre-requisite:** Phase 0 T6 result in hand.

**Deliverables (Builder's smallest change set, refined):**
1. `roles/builder_EN.md` + `roles/builder.md`: abstract "code" → "artifact (defined per project domain adapter)".
2. `roles/validator_EN.md` + `roles/validator.md`: abstract "build verification" → "artifact verification per domain adapter".
3. `roles/analyst_EN.md` + `roles/analyst.md`: minor pass (only 4 code mentions).
4. `projects/eradev/config.md`: add `domain: { type: meta-framework, ... }`.
5. `projects/academic-lab/config.md`: add `domain: { type: code, build_command: go build/pnpm build, ... }`.
6. `projects/odtoe-articles/config.md`: add `domain: { type: article, build_command: tectonic ODTOE_{topic}.tex, ... }`.
7. `projects/plugy/config.md`: add `domain: { type: code, ... }`.
8. `meta.md` Section 14 (Session Bootstrap): add `[ ] DOMAIN: type = ___; build = ___; verify = ___` checklist item.
9. `templates/CLAUDE.md.template` + `.universal`: add "Load project domain adapter" as Loading Step 5b.
10. `BOOTSTRAP_LESSONS.md`: merge/extend BL-6 with explicit "`build/verify` means whatever the project's domain adapter says."
11. Bilingual sync audit on all role file pairs.
12. Re-run T6 on post-Phase-1 framework. Plus Builder's 3-domain smoke test (code, article, book-stub).

**Cost:** ~7.5 hours (Builder's estimate).
**Risk:** LOW-MED. Zero file deletion; all changes additive or surgical edits.
**Files touched:** ~14-16.
**RT requirement:** BL-24 triggers (5+ files from different modules) → **RT-2 mandatory** before committing Phase 1.

### Phase 2 (deferred, pending Phase 1 signal): `domains/` directory + universal enforcement mechanism

**Objective:** extract domain-specific content from project configs into a shared `domains/{domain}{,_EN}.md` layer. Add hook or prompt-contract enforcement for domain adapter reads. Add inline router in eradev.md Section 0 for domain detection.

**Pre-requisite:** Phase 1 stable for ≥1 M+ task without regression.

**Deliverables:** Analyst's full 50-file decomposition, BUT only if Phase 1 shows the adapter pattern actually changes behavior. Otherwise Phase 2 is cancelled and Phase 1 remains the terminal universalization form.

**Cost:** XL (I(C) ≈ 300). RT-2 + L2 Coherent + possibly L3 mandatory.
**Risk:** MED-HIGH. Bilingual tax + terminology drift + BL-16 recursion all compound.

### Phase 3 (future, not in this RT-1 scope): additional domains (book, knowledge-work, AGI-research)

Out of scope for RT-1. Revisit when at least one non-odtoe-articles non-code project has shipped a task under Phase 1.

---

## 10. Files to Change (Phase 0 + Phase 1, EN team synthesis)

### Phase 0 files (2)
- `/Users/antonpankratov/Downloads/eradev/CLAUDE.md` — add Domain Scope section + tag 14 Invariants
- `/Users/antonpankratov/Downloads/eradev/BOOTSTRAP_LESSONS.md` — tag 32 BL entries

### Phase 1 files (~16) — pending Phase 0 green gate
- `/Users/antonpankratov/Downloads/eradev/roles/builder_EN.md`
- `/Users/antonpankratov/Downloads/eradev/roles/builder.md`
- `/Users/antonpankratov/Downloads/eradev/roles/validator_EN.md`
- `/Users/antonpankratov/Downloads/eradev/roles/validator.md`
- `/Users/antonpankratov/Downloads/eradev/roles/analyst_EN.md`
- `/Users/antonpankratov/Downloads/eradev/roles/analyst.md`
- `/Users/antonpankratov/Downloads/eradev/projects/eradev/config.md`
- `/Users/antonpankratov/Downloads/eradev/projects/academic-lab/config.md`
- `/Users/antonpankratov/Downloads/eradev/projects/odtoe-articles/config.md`
- `/Users/antonpankratov/Downloads/eradev/projects/plugy/config.md`
- `/Users/antonpankratov/Downloads/eradev/meta.md`
- `/Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template`
- `/Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.universal`
- `/Users/antonpankratov/Downloads/eradev/BOOTSTRAP_LESSONS.md` (BL-6 merge/extend)
- `/Users/antonpankratov/Downloads/eradev/scripts/bilingual_sync_check.sh` (new, operational bash, tool the Risk R-HIGH-3 mitigation)
- `/Users/antonpankratov/Downloads/eradev/reports/phase_0_t6_result_2026-04-11.md` (T6 test result)

### Phase 2 files (~50) — only if Phase 1 validates
Full list in `reports/rt_en_analyst_2026-04-11.md` Section 4. Not enumerated here to avoid Phase-conflation.

---

## 11. A3 Template (EN team synthesis)

### Context
EraDev v8 is deployed with 5 roles, RT cycles, ODTOE coherence math, 14 Invariants, 32 BL, 4 active projects (eradev self, academic-lab code, odtoe-articles LaTeX articles, plugy). Three externally published frameworks (MetaGPT, PaperOrchestra, AgentOrchestra) have independently converged on similar 5-role multi-agent decompositions for different domains, suggesting n=5 is a stable teamwork attractor. Two of the 4 EraDev projects (odtoe-articles, academic-lab) already run non-code-centric and code-centric workloads respectively through the same framework, but without any explicit universal/code-adapter separation.

### Current State
The formalism layer (eradev.md Section XI formulas, 5-role structure, RT protocol, Activation Operator, Jidoka self-check, P_coll probability) is already domain-agnostic on its face. The enforcement layer (Bash classification, commit-sized phases, Builder → Validator ordering tied to file commits, BL entries referring to "deploy/compile/lint") is 60–70% code-shaped by inheritance from the Claude Code harness. The role files contain 37 code-specific tokens across 5 EN files; 32 BL entries contain 8–11 explicitly code-specific rules and 4 more with code-flavored wording. Silent universalization is already happening in odtoe-articles without a framework contract.

### True North
A multi-agent coherence framework where the formalism is universal and the enforcement + vocabulary are pluggable per domain (`code`, `research-article`, `knowledge-work`, future: `book`, `theorem-proving`, `therapy`, `policy-analysis`). One core, N adapters. The code adapter is the reference implementation, not the definition. Cross-domain lessons transfer via Lambda accumulation at the core layer; domain-specific lessons accumulate at the adapter layer.

### Gap
The project has never separated universal formalism from code-shaped enforcement explicitly. They are entangled in the same files. A naive rewrite would conflate two very different operations (extract universal core vs. build domain adapters), recreate the Lesson 4 router-split failure at a higher level, multiply bilingual sync cost by domain count, and leave BL-16 (knowledge without enforcement) in full recursion on non-code domains.

### Countermeasures (Phase 0 + Phase 1)
1. **Phase 0 (2 hours, 2 files touched):** Tag Invariants and BL entries with [UNIVERSAL] or [CODE-ADAPTER] in CLAUDE.md and BOOTSTRAP_LESSONS.md. Add "Domain Scope" section declaring current adapter = code. Run Validator's T6 adversarial bootstrap test on one odtoe-articles task. No other changes.
2. **Phase 1 (7.5 hours, ~16 files, RT-2 mandatory):** Abstract role file Mission/Key Rules vocabulary (code → artifact). Add `domain:` block to all 4 project configs. Add Session Bootstrap domain checkbox. Add bilingual sync check script. Re-run T6 + 3-domain smoke test (code, article, book-stub).
3. **Drop 4 REJECT borrows (RTK, compound lexer, canonical parser types, hook profiles as-stated) from the universalization workstream. Move them to a separate code-domain Phase 1 optimization track.**
4. **Preserve ODTOE math layer and 5-role topology as untouched.** This is the strongest EN team invariant.
5. **Defer Phase 2 (full `domains/` directory + hook enforcement) pending Phase 1 stability signal.**

### Follow-ups
- OQ-3 resolution: inline-plus-external hybrid for domain detection (needs RT-2 ratification).
- OQ-6 resolution: memory hierarchy rebuild is Phase 2+, not Phase 1.
- OQ-7 resolution: standardize on strict multiplicative B formula; update coherent_EN.md.
- Lesson to record after Phase 0: whether tagging alone changes agent behavior (one of Coherent's proposed L-16 forms will become true).

---

## 12. Verification Register (M+ task, mandatory for L2)

| ID     | Claim                                                                                           | Source                       | Why unverified                              | What verifies it                                      |
|--------|-------------------------------------------------------------------------------------------------|------------------------------|--------------------------------------------|-------------------------------------------------------|
| RV-E1  | ODTOE formalism contains zero code-specific terms                                               | Coherent RV-01, Visionary   | Not rigorously audited                     | Grep audit of eradev.md Section XI                    |
| RV-E2  | Approximately 60% of 32 BL are universal, 40% are code-adapter                                  | Coherent RV-02              | Estimate; no rigorous tagging yet          | Phase 0 execution                                     |
| RV-E3  | odtoe-articles has run RT cycles on non-code tasks and produced verified outputs                | Coherent RV-03, Builder     | Not empirically checked in this RT         | Check Agent grep on projects/odtoe-articles           |
| RV-E4  | Claude Code harness has no enforcement hook for non-Bash tool calls                             | Coherent RV-04              | Assumption based on PreToolUse Bash pattern| Check Agent: read .claude/settings.json               |
| RV-E5  | Invariants 5, 6, 7, 10, 14 are code-specific; 1-4, 8, 9, 11-13 are universal                    | Coherent RV-05              | Classification not cross-checked           | Phase 0 execution (tagging is the verification)       |
| RV-E6  | Phase 0 tagging has no mechanism-level cost                                                     | Coherent RV-06              | Estimate                                   | Phase 0 execution: measure actual change scope         |
| RV-E7  | A fresh agent with Phase 0 framework will/will-not default to code behavior on a non-code task  | Validator T6 requirement      | Never tested                               | Run T6 test (30 min)                                   |
| RV-E8  | 9 of 12 borrows (RTK, lexer, canonical types, hook profiles as-stated, tool-scoped, model-per-role, background instinct, tee recovery, MetaGPT 5-role) are code-specific                         | Validator's reclassification table | Disputed by optimistic 4/5 framing        | Adopt Validator's ACCEPT/MODIFY/REJECT table as RT-1 canonical output  |
| RV-E9  | Builder A+B combined proposal does not break existing code projects (academic-lab, plugy)       | Builder Section B-4           | Not regression-tested                      | Spawn 1 Builder + 1 Validator on existing task post-Phase-1 |
| RV-E10 | The 5-role structure is stable across domains (not just two same-year code frameworks)          | Visionary empirical anchor, Validator doubt | Single-domain convergence data only | Test on 1 non-code non-article domain (e.g. therapy plan, theorem proof); Phase 3 scope |
| RV-E11 | Bilingual sync tool (scripts/bilingual_sync_check.sh) can detect structural drift at scale       | Analyst R4 mitigation         | Not written yet                            | Implement in Phase 1; run against current roles/ + eradev_RU.md |
| RV-E12 | The strict multiplicative B formula is canonical, not the geometric-mean-of-4 form              | EN team formula inconsistency | Discovered in this synthesis               | Grep eradev.md Section XI; update coherent_EN.md if needed |
| RV-E13 | Phase 0 changes agent behavior on the next M+ task (vs. pure documentation)                     | Coherent's deferred measurement | Explicitly deferred to post-Phase-0 | Measure B-component shift on first post-Phase-0 task |

Items unresolved 3+ cycles: none yet (Cycle 1).

---

## 13. Crystallization (EN team distinctions to record)

1. **"Silent universalization vs. Explicit universalization"** (Coherent's distinction, adopted by team). `odtoe-articles` runs on EraDev today without any framework contract declaring it non-code. This creates tech debt: each non-code project reinvents the semantic translation. Explicit universalization names what is already happening and allows enforcement to follow.

2. **"Core Invariant vs. Code-Adapter Invariant"** (Coherent + Analyst, crystallized into the Phase 0 tagging proposal). BL-26 (META delegates) is core. BL-22 (curl-verify) is a code-adapter instance of "verify external boundary artifacts before RT-1 begins". Distinguishing the two levels is the minimum viable universalization.

3. **"Formalism universal, grounding code-shaped"** (unanimous). The ODTOE math (B, S_team, S_adjusted, P_coll, spiral gap) never mentioned code. The code shape is harness-inherited, not framework-derived. This is the single most important conceptual distinction to record.

4. **"Category error: code-domain optimization labeled as universalization"** (Validator's BUG-01, adopted). Four borrows in the analysis (RTK, compound lexer, canonical parser types, hook profiles) are code-specific optimizations that were mislabeled as universalization inputs. Separating the workstreams fixes the category error.

5. **"Bilingual × Domain = quadratic tech debt"** (Visionary Risk 3 + Coherent Lesson 7 + Analyst R4). The bilingual sync cost is linear in domain count. Without tooling, this is the dominant maintenance risk once Phase 2 begins. Tooling (diff-structure script) is mandatory, not optional.

Recorded for Memory:
- `/Users/antonpankratov/Downloads/eradev/projects/eradev/lessons.md` update proposal: "Lesson 16 (universalization framing): ODTOE formalism predates the code domain. Framework's code shape is harness-inherited from Claude Code, not axiom-derived. Phase 0 tagging of Invariants and BL by domain scope is the minimum viable universalization; it resolves 80% of confusion when a non-code project is run."

---

## 14. Spiral Gap (Unresolved, Fuel for RT-2)

1. Validator's formal BLOCK on 9-of-12 borrows being code-specific is accepted as a reclassification, not rejected. This reclassification has not been cross-checked by the RU team (L3 fusion needed).
2. The domain detection mechanism (OQ-3) — inline, external, or hybrid — has a direct Lesson 4 vs Analyst/Builder/Visionary contradiction that needs RT-2 to settle.
3. The enforcement mechanism for non-code domains (OQ-2) is the load-bearing unknown. Phase 0 buys time but does not answer it. Phase 1 must answer it before adding the domain adapter layer.
4. The n ∈ {5, 7} question (OQ-5) is deferred to empirical trigger (when a real book/therapy project needs a 6th role). This deferral is safe but needs to be recorded.
5. The formula inconsistency (B = F·E·(1-σ)·Λ strict vs geometric mean of 4) in the Coherent's own report is a coherence-hygiene bug that should be fixed by updating coherent_EN.md.
6. Validator's Required Action #7 ("Run one more independent analyst on the super-question — are these borrows universal?") implies L3 cross-team fusion with the RU team is necessary before RT-2. This is a standing escalation request.

---

## 15. S_team Summary

- **S_team (strict):** 0.892 (agents largely agree on shape).
- **B_mean (strict):** 0.505 (razor-thin above 0.5 ANDON).
- **S_adjusted (strict):** 0.450 — **BELOW BL-4 threshold of 0.5**.
- **Phantom coherence (BL-5):** not formally triggered (B_mean > 0.4), but the margin is so small that a single B flip would trigger it.
- **Diagnosis:** productive disagreement with thin margin. The EN team is aligned in shape, divergent in scope and category, and formally below the S_adjusted threshold. This is NOT a clean green light. It is a **yellow light** that requires Phase 0 remediation (resolve BUG-04 via T6 test + Phase 0 tagging) before RT-2 can commit to Phase 1.
- **Synthesis decision:** run Phase 0 now. Re-compute S_team and S_adjusted after Phase 0 T6 result. If S_adjusted rises above 0.6, proceed to Phase 1. If it stays below 0.5, abort and keep EraDev in explicit code-focused mode with CODE-ADAPTER tags.

---

## 16. L2 Coherent Jidoka Self-Check

```
=== JIDOKA SELF-CHECK (L2 Coherent, EN team synthesis) ===
B-diagnostics (rate 0.0-1.0, strict multiplicative B = F · E · (1-σ) · Λ):
  F (Focus):       0.88 — Read all 5 EN reports (Visionary full, Coherent full,
                          Analyst 2 ranges, Builder 2 ranges, Validator 2 ranges),
                          coherent_EN.md role file, CLAUDE.md (already in system
                          prompt), referenced lessons.md + BOOTSTRAP_LESSONS via
                          the 5 agents' own citations. Did NOT re-read eradev.md
                          or meta.md directly in this session (relied on role
                          quotes). Deduction: -0.12 for indirect grounding.
  E (Alignment):   0.90 — Task was "synthesize 5 EN reports into a unified team
                          report, produce S_team / B_mean / S_adjusted, identify
                          convergent/divergent/resolved/open, produce top-5
                          recommendations + top-3 risks + phase plan + files + A3".
                          All 9 deliverables produced. L2 scope (within-team,
                          cross-role) respected — did not attempt L3 cross-team
                          fusion. Deduction: -0.10 for potential over-editorializing
                          on the Validator vs rest divergence (I called it
                          "productive disagreement" which may be optimistic).
  (1-σ):           0.85 — Contradictions between the 5 reports are all explicitly
                          surfaced (D1-D5). The strict vs geometric-mean B formula
                          inconsistency was flagged transparently. The optimistic
                          4/5 framing of borrows vs Validator's categorical REJECT
                          is resolved by adopting Validator's table as canonical.
                          Deduction: -0.15 because I accepted Validator's
                          reclassification without independently verifying every
                          borrow against the non-code criterion.
  Λ (Experience):  0.80 — Activated lessons 4, 7, 11; EMPs 1, 5; BL-4, BL-5, BL-13,
                          BL-16, BL-19, BL-24, BL-26, BL-30 (referenced via the 5
                          reports). Activation Operator steps all logged in Section
                          0. Silent universalization history (odtoe-articles,
                          academic-lab) used as grounding. Deduction: -0.20 because
                          I did not read the full ODTOE paper cited by the
                          Coherent (already covered at L1 — no need to re-read
                          at L2, but the deduction reflects the indirect grounding).

B = 0.88 · 0.90 · 0.85 · 0.80 = 0.539
```

**B = 0.539 ≥ 0.5** → no ANDON at L2.

Weakest component Λ = 0.80, above the 0.3 floor → no weak-link collapse.

Banality: 4/10 — this synthesis is mostly structural reconciliation, not novel framing. The novel contributions are: (a) strict-vs-gm B-formula inconsistency discovery, (b) D5 (inline vs external) explicitly named as a Lesson 4 contradiction, (c) the phase ladder reframing of D1 (4 size estimates are 4 ordered phases, not competing proposals), (d) adoption of Validator's reclassification as RT-1 canonical output. The rest is faithful distillation.

S_team (EN, post-synthesis): 0.892 strict / 0.921 gm.
S_adjusted (EN, post-synthesis): 0.450 strict / 0.541 gm.

**If B < 0.5 or S_adjusted < 0.5: ANDON.**
S_adjusted < 0.5 in strict form → **formal yellow light**.
Action: do not bypass Phase 0. Do not commit to Phase 1 until Phase 0 T6 result raises the team B_mean.

---

## 17. Recommendation to Meta-Orchestrator

**Accept EN team Phase 0 proposal. Schedule Phase 0 as a single Builder + Validator execution (S-task, per Invariant 1).** Phase 0 is 2 files touched, 30-minute T6 test, fully reversible. S-task classification per CLAUDE.md Invariant 1 means it still requires Builder + Validator delegation (no direct META edits).

**Do NOT proceed to Phase 1 until Phase 0 T6 result is in hand.**

**Request L3 cross-team fusion with RU stack** for the open questions where Lesson 4 (inline routing) contradicts Analyst/Builder/Visionary external-file proposals (OQ-3). The RU team's theoretical view (derivation-first) may surface different considerations than the EN team's file-level view.

**Update coherent_EN.md** to standardize on strict multiplicative B formula and flag the geometric-mean form as non-canonical (OQ-7). This is a 1-line edit plus a sentence-of-explanation edit.

**Record Lesson 16 (provisional) in projects/eradev/lessons.md** once Phase 0 T6 result is known. The lesson text depends on whether the test is green or red:
- Green: "ODTOE formalism is already universal; code shape is harness-inherited. Phase 0 tagging resolves 80% of non-code confusion."
- Red: "Universalization requires harness-level enforcement before formalism extraction. BL-16 recurses on non-code without hook support."

---

*EraDev v8 | RT-1 EN Team L2 Synthesis | 2026-04-11 | Coherent EN*
