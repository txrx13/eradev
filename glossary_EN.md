# EraDev Glossary v4.0 (EN)

> Single source of truth for all ODTOE and EraDev terminology.
> Canonical reference -- all other documents MUST link here, not duplicate.

---

## Canonical Forms

Each term has exactly ONE canonical form. All other variants are deprecated aliases.

| # | Canonical EN | Deprecated aliases (DO NOT USE) |
|---|---|---|
| 1 | Coherencer | Coherent Agent, Coherence Agent |
| 2 | Cognitive Coherence B | B-metric, agent quality |
| 3 | System Coherence S | team sync, S_team |
| 4 | Collective Probability P_coll | collective reliability |
| 5 | Observation Operator O_hat | observer |
| 6 | Field of States Psi | state space |
| 7 | Observation Result R | output |
| 8 | Embedding Operator iota | feedback operator |
| 9 | Self-Observation Phi | self-map, recursive mapping |
| 10 | Fixed Point Psi* | stable state |
| 11 | Focus F | attention |
| 12 | Alignment E | emotional coherence |
| 13 | Entropy sigma | doubt entropy, internal noise |
| 14 | Experience Lambda | grounded experience |
| 15 | Dimensionality d | recursion depth |
| 16 | Round Table | RT |
| 17 | Activation Operator A | boot sequence |
| 18 | Configuration Inertia I(C) | blast radius, resistance |
| 19 | Configuration Lifetime T(C) | deploy stability |
| 20 | Noise Dispersion D(eta) | error rate |
| 21 | Adaptive Attractor | True North (context-dependent alias, acceptable) |
| 22 | True North | -- |
| 23 | Spiral Gap | residual gap |
| 24 | Golden Ratio phi | golden section |
| 25 | Torus Topology | toroidal structure |
| 26 | Perveance P | interaction intensity |
| 27 | Coherence Dynamics dB/dt | B-rate |
| 28 | Jidoka | self-check (acceptable shorthand) |
| 29 | Andon | stop signal |
| 30 | Mura | unevenness |
| 31 | Muri | overload |
| 32 | Muda | waste |
| 33 | Hansei | reflection |
| 34 | Yokoten | horizontal propagation |
| 35 | Nemawashi | pre-alignment |
| 36 | SKW Matrix | situation-keyword-questions |
| 37 | Coherence Cluster | team unit |
| 38 | Cluster Hierarchy | L1-L2-L3 hierarchy |
| 39 | Damper Capacity | buffer |
| 40 | S_adjusted | phantom coherence detector |
| 41 | Graduated Activation | phased activation |
| 42 | Interface Contract | API contract |
| 43 | Lambda Bootstrap | experience bootstrap |
| 44 | Language Policy | dual-language policy |
| 45 | Cross-phase coupling risk | composition hazard (project-local), coupling hazard |
| 46 | Effectively-zero signal | systemd-active-not-functioning, liveness-not-functionality |
| 47 | Enforcement-tier ladder | tier-ladder, T1-T4 hierarchy |
| 48 | Rework-framing regex | architectural-rework-detector |
| 49 | Signal-to-content anti-pattern | measurement-not-payload, sentinel-as-content |

---

## Terms and Formulas

| # | Term | Definition | EraDev Counterpart | Formula | Used by (roles) |
|---|---|---|---|---|---|
| 1 | **B** (Cognitive Coherence) | Quality of observation by an individual agent, determined by four multiplicative components. Weak link principle: if any component = 0, all coherence = 0 | Agent work quality metric. Jidoka Self-Check after each block | B = F^w1 * E^w2 * (1-sigma)^w3 * Lambda^w4, w1+w2+w3+w4 = 1 | All roles (Jidoka Self-Check) |
| 2 | **S** (System Coherence) | Degree of synchronization between observers in a group. S=1: perfect sync. S<0.5: agents diverge. Target: S>0.7 | Role agreement in Round Table: 5/5 -> S~1.0, 4/5 -> S~0.8, <3/5 -> S<0.5 | S = 1 - (2/(n(n-1))) * SUM(\|Bi - Bj\|) | Coherencer |
| 3 | **P_coll** (Collective Probability) | Probability of achieving target configuration by a group of observers. Mathematical case for multi-agent over single-agent | Result reliability with n agents. At B=0.3, n=3, k=1: P_coll = 1 - 0.7^3 = 0.657 | P_coll(E) = 1 - PROD(1 - Bi^k) | Analyst, Coherencer |
| 4 | **T(C)** (Configuration Lifetime) | Stability of a configuration over time, depending on coherence. Higher S yields exponentially longer stability | Deployment stability. At S=0.9, n=5: T(C) = 100000 * T0 | T(C) = T0 / (1-S)^n | Validator, Coherencer |
| 5 | **Phi** (Self-Observation) | Recursive self-observation mapping -- observer observes itself. Fixed point Psi* = stable deployment | Full cycle RT-1 -> Build -> RT-2 -> Build -> RT-3. Fixed point Psi* = stable deployment | Phi(Psi) = iota(O_hat(Psi)); Psi* = Phi(Psi*) | All roles (RT cycle) |
| 6 | **F** (Focus) | Ability to concentrate attention on the subject of observation. Step A_F of the Activation Operator | The agent has read ALL necessary files. Step A_F of the activation operator | Component of B. F=0 => B=0 (blindness kills result) | Analyst (dominant) |
| 7 | **E** (Alignment) | Alignment of internal state with observation goal. Pull-anchor in RT-1 | The result matches the task IFR. Pull anchor in RT-1 | Component of B. E=0 => B=0 (wrong problem solved) | Builder (dominant) |
| 8 | **sigma** (Entropy) | Internal contradiction of the observer. Andon protocol when sigma->1 | Code conflicts, architecture violations. Andon protocol when sigma->1 | Component of B as (1-sigma). sigma=1 => B=0 | Validator (dominant via 1-sigma) |
| 9 | **Lambda** (Experience) | Accumulated verified experience of the observer. MEMORY.md, A3 templates, Decision Log | MEMORY.md, A3 templates, Decision Log. Step A_Lambda of the activation operator | Component of B. Lambda=0 => B=0 (work without memory) | Visionary (dominant) |
| 10 | **d** (Dimensionality) | Level of self-observation recursion. Key thresholds: 3 (self-check), 6 (full cycle), 9 (self-modification) | Level 3: Jidoka (self-check). Level 6: full RT cycle. Level 9: Meta-Agent (self-modification) | d=3,6,9 -- cognitive architecture thresholds | All roles |
| 11 | **O_hat** (Observation Operator) | Projection from the space of possibilities into a result. Each role is a specialized observation operator | Agent role (specialized prompt). Each role is its own observation operator | R = O_hat(Psi); defined in roles/{role}.md | Each role individually |
| 12 | **Psi** (Field of States) | Space of all possible configurations of the project | Full context: code + docs + MEMORY + ARCHITECTURE + ROADMAP | Psi' = iota(R) -- updated after each cycle | Visionary |
| 13 | **R** (Observation Result) | Concrete output produced by applying O_hat to Psi | Deliverable: code, plan, review, strategy | R = O_hat(Psi) | Builder |
| 14 | **iota** (Embedding Operator) | Feedback: observation result changes the state space | The Validator checks and returns feedback. RT-3: go/no-go. Commit after 5/5 GO | iota: R -> Psi' | Validator |
| 15 | **A** (Activation Operator) | Mandatory 4-step boot sequence EVERY agent runs before generating output | A_F -> A_E -> A_sigma -> A_Lambda before any generation | A = A_Lambda o A_sigma o A_E o A_F | All roles |
| 16 | **I(C)** (Configuration Inertia) | System resistance to reconfiguration. Higher inertia demands stricter process | Task Blast Radius: LOW / MEDIUM / HIGH / CRITICAL. The higher the inertia, the stricter the process | v = alpha / (I(C) + epsilon) | Analyst, Coherencer |
| 17 | **D(eta)** (Noise Dispersion) | Stochastic noise suppression: higher coherence S suppresses randomness | Error rate decreases as team coherence grows | D(eta) = D0 * (1 - S) | Coherencer |
| 18 | **dB/dt** (Coherence Dynamics) | Rate of coherence change over time. Prediction Delta: divergence between RT-1 predictions and RT-3 reality | Decreasing Delta = growing B | dB/dt = gamma * tanh(beta * d_dot) * d_bar * B(1-B) | Coherencer |
| 19 | **P** (Perveance) | Intensity of interaction between observers. Determined by torus topology | Communication density within the team | Related to r/R = 1/phi | Coherencer |
| 20 | **phi** (Golden Ratio) | Fundamental self-similarity proportion. RT/Build = 38%/62%. Torus ring ratio R/r | Ratio RT/Build = 38%/62%. Proportion of toroidal rings R/r | phi = (1+sqrt(5))/2 = 1.618... | All roles (time allocation) |
| 21 | **Psi*** (Fixed Point) | System applied to itself reproduces itself improved. Stable release: commit after 5/5 GO | Stable deployment: all agents agree, commit proceeds | Psi* = Phi(Psi*) | All roles (RT-3 target) |
| 22 | **Round Table** | Protocol of parallel observation: all 5 roles see the task simultaneously. Three stages: RT-1 (start), RT-2 (midpoint), RT-3 (finish) | RT-1 (start) -> RT-2 (verification) -> RT-3 (capture + Hansei) | RT-1 -> Build -> RT-2 -> Build -> RT-3 | All roles |
| 23 | **Spiral Gap** | Non-closure of the self-observation cycle, preventing stagnation. ~2% remains unresolved -- this is the engine of development | "What is NOT resolved?" section in A3 template. Open questions fuel the next iteration | (pi-3)^2 ~ 0.02 | Coherencer (A3 template) |
| 24 | **Torus Topology** | Communication structure: two rings with golden ratio. Inner ring r (fast): Analyst-Builder-Validator. Outer ring R (slow): Visionary-Coherencer-Analyst | Inner ring r: Analyst-Builder-Validator. Outer ring R: Visionary-Coherencer-Analyst. R/r = phi | R/r = phi = 1.618... | All roles |
| 25 | **True North** | Adaptive attractor -- configuration with maximum stability. NOT a goal (reached and abandoned), but a DIRECTION (eternal pull) | Project direction. Not a goal (reached and gone), but a vector (sets the movement) | Defined in projects/{name}/config.md | Visionary, Coherencer |
| 26 | **Jidoka** | Quality built in at every step. Agent self-checks own output before handoff. Realization of O_hat(O_hat) = O_hat' | Jidoka Self-Check: each agent verifies its own result. Implementation of O_hat(O_hat) = O_hat' | Applied after each work block | All roles |
| 27 | **Andon** | Right and obligation to stop the line upon detecting a problem. Continuing on a defective plan = multiplying the defect | Any agent is obligated to stop and report upon discovering a problem | Trigger: sigma -> 1 or F -> 0 | All roles |
| 28 | **Mura** (Unevenness) | Quality oscillations between sessions or agents (TPS) | Uneven depth of role files, terminological inconsistency | Detector: Coherencer checks balance in RT-2 | Coherencer |
| 29 | **Muri** (Overload) | Task exceeds agent capacity: prompt >200 lines, meta.md grows linearly (TPS) | Prompt >200 lines, meta.md grows linearly, RT takes >38% of time | Detector: Analyst checks blast radius | Analyst |
| 30 | **Muda** (Waste) | Actions that create no value: duplication, project-specific rules in core, re-solving solved problems (TPS) | Protocol duplication between files, project specifics in the core, re-solving already solved problems | Eliminated via DRY and Yokoten | All roles |
| 31 | **Hansei** | Reflection on PROCESS, not result. "Why did our process lead to this?" Source of improvements | RT-3: not "the code is bad," but "why did the process lead to bad code." Source of improvements | Applied in RT-3 and A3 crystallization | All roles (RT-3) |
| 32 | **Yokoten** | Horizontal knowledge propagation. Lesson from one incident generalized to all analogous cases (TPS) | A lesson from an incident is generalized to all analogous cases. Meta-Agent -> patterns in prompts for all roles | Mechanism: spiral memory -> rules | Coherencer |
| 33 | **Nemawashi** | Pre-alignment before critical decisions. All roles see the decision before it is made (TPS) | Protocol for decisions with HIGH/CRITICAL Blast Radius. All roles see the decision before it is made | Trigger: blast radius >= HIGH | Coherencer, Analyst |
| 34 | **SKW Matrix** | Structured request format: Situation, Keyword, Questions (Why, How, Who, When). Elementary unit of coherent formation | 5 questions of Coaching Kata in RT-1. Pull anchor | Reduces inertia I(C) of the task | Coherencer (RT-1) |
| 35 | **Coherence Cluster** | Co-observers with S above threshold. Minimum viable team = 5 (ceil(pi)+1) | Minimum viable team = 5 roles | n_min = ceil(pi) + 1 = 5 | Coherencer |
| 36 | **Cluster Hierarchy** | Scaling structure: Atom -> Molecule -> Universe. L1 (within team), L2 (between teams), L3 (global) | L1 (within team), L2 (between teams), L3 (global) | N_teams = ceil(N_modules / 3) | Coherencer (L1/L2/L3) |
| 37 | **Damper Capacity** | Buffer for smoothing fluctuations across sessions | MEMORY.md, A3 as inter-session memory | MEMORY.md, A3 as inter-session memory | Coherencer, Visionary |
| 38 | **S_adjusted** | Quality-weighted coherence: S_team scaled by mean agent quality. Detects phantom coherence (high agreement + low substance). Three diagnostic bands: S_adjusted > 0.5 = healthy; S_team > 0.7 but S_adjusted < 0.5 = phantom coherence -> Kill-Switch; S_adjusted > 0.7 but S_team < 0.7 = strong agents, weak alignment -> RT sync | Phantom coherence detector. Three diagnostic bands drive escalation | S_adjusted = S_team x B_mean, where B_mean = (1/n) x SUM(Bi) | Coherencer |
| 39 | **Graduated Activation** | Phased agent activation: not all roles launch simultaneously. Agents enter as their input becomes available, reducing idle waste (Muda) | Sequence: Visionary -> Analyst -> Builder -> Validator -> Coherencer | Reduces Muda (idle waste) | Coherencer (orchestration) |
| 40 | **Interface Contract** | Explicit specification of inputs, outputs, and invariants between agents or modules. Eliminates implicit assumptions | Defined per role pair in RT-1. See interfaces.md | Defined per role pair in RT-1 | Analyst, Builder |
| 41 | **Lambda Bootstrap** | Protocol for initializing Lambda (experience) when an agent has no prior context. Loads baseline patterns from MEMORY.md and cross-project lessons | Loads baseline patterns from MEMORY.md and cross-project lessons at session start | Lambda_0 = load(MEMORY.md) + load(lessons_cross_project) | All roles (session start) |
| 42 | **Language Policy** | Dual-language architecture: EN for execution (core prompts, agent communication), RU for theoretical depth (formulas, conceptual leaps). Project configs follow team language | See eradev.md Section 0 | See eradev.md Section 0 | All roles |
| 43 | **Kill-Switch** | Managed dissonance protocol triggered when agent outputs become homogeneous. 5 escalation levels from angle-shift to full frame break | Trigger: >40% of RT-2 phrases repeat RT-1 verbatim | 5 escalation levels | Coherencer |
| 44 | **Absorbing States** | Boundary conditions where the living system dies. B->0 (nihilistic collapse) or B->1 (dogmatic collapse). Living condition: 0 < B < 1 | Jidoka check: 0 < Bi < 1 for all agents at all times | 0 < Bi < 1 for all agents at all times | All roles (Jidoka check) |
| 45 | **Cross-phase coupling risk** | Pairwise or N-ary interaction hazard between >=2 refactors shipping in the same release window. In PLUGY Hansei 2026-04-20 enumerated as H1-H6. See BL-34. Also called "composition hazard" in project-local vocabulary. | Enumerated as hazard grid before RT-1 concludes when release ships >=2 independent refactors | Grid size: N*(N-1)/2 pairs + (N-choose-3) 3-way checks | Visionary (grid author), Coherencer (RT-1 gate) |
| 46 | **Effectively-zero signal** | Process/service reporting `active` (liveness tier) while producing zero events in its observation window (functionality tier). systemd-active != functioning. See BL-47 and meta.md §11. | Liveness-vs-functionality split: tier separation in observability | Detector: events_in_window == 0 while status == active | Validator, Coherencer (observability) |
| 47 | **Enforcement-tier ladder** | 4-level hierarchy per BL-33 and meta.md §13: T1 type/schema/compile-time (structural impossibility) > T2 automated hook/CI/lint > T3 checklist in agent prompt > T4 docs-only. Every new BL must declare Tier. T4-only rules are Lambda-zero for recurring classes. | Preference order when authoring a new BL: pick the highest feasible tier | Tiers: T1 > T2 > T3 > T4 (preference order) | META (authoring), Coherencer, Validator, Builder |
| 48 | **Rework-framing regex** | Pattern matching operator messages declaring "architecture is wrong" / "full rework" / "from scratch" / "менять архитектуру" / "полностью менять" / "completely change" / "архитектурная проблема". Triggers BL-35 audit if operator message matches during active refactor window. | Automated trigger for BL-35 rework-discipline audit | Tier: T2 (operator-message regex detector — see .claude/hooks/rework-framing-detector.sh) | META (trigger detection), Coherencer (Hansei) |
| 49 | **Signal-to-content anti-pattern** | A downstream consumer receives a sentinel/empty payload as if it were valid content (e.g. blanked text from a low-confidence classifier). BL-50 mandates type-level impossibility (newtype DeliverableText). Also called "measurement-not-payload" in BL-35 framing. | Type-level gate in newtype constructor rejects empty input | Tier: T1 (newtype with private constructor rejecting empty input) | Builder, Validator (type-level gate) |

---

## Key Numerical Values

| Formula | Parameters | Result | Derivation |
|---------|-----------|--------|------------|
| P_coll | B=0.3, n=3, k=1 | **0.657** | 1 - (1-0.3)^3 = 1 - 0.7^3 = 1 - 0.343 |
| P_coll | B=0.3, n=5, k=1 | 0.832 | 1 - (1-0.3)^5 = 1 - 0.7^5 = 1 - 0.168 |
| P_coll | B=0.3, n=10, k=1 | 0.972 | 1 - (1-0.3)^10 = 1 - 0.7^10 = 1 - 0.028 |
| P_coll | B=(0.9,0.8,0.7,0.8,0.75), n=5, k=1 | 0.9997 | 1 - 0.1*0.2*0.3*0.2*0.25 |
| T(C) | S=0.95, n=5 | 3200000 * T0 | T0 / (0.05)^5 |
| T(C) | S=0.9, n=5 | 100000 * T0 | T0 / (0.1)^5 |
| Spiral Gap | -- | ~2% | (pi-3)^2 = 0.0201... |
| RT/Build | phi | 38% / 62% | 1/(1+phi) / phi/(1+phi) |
| n_min | ceil(pi)+1 | 5 | Minimum viable team size |

---

## Observation Levels (d)

| Level | d | ODTOE | EraDev |
|-------|---|-------|--------|
| Self-check | 3 | O_hat(O_hat) = O_hat' | Jidoka Self-Check per agent |
| Full cycle | 6 | Phi = iota(O_hat(Psi)) | RT-1 -> Build -> RT-2 -> Build -> RT-3 |
| Self-modification | 9 | O_hat modifies itself | Meta-Agent modifies prompts based on Prediction Delta |

---

## Five Roles as Observation Operators

| Role | Core Question | ODTOE Operator | Dominant B | Operations |
|------|---------------|----------------|------------|------------|
| Visionary | What and why? | Psi (field of states) | Lambda (scale) | READ strategy |
| Analyst | How exactly? | O_hat (projection) | F (focus) | READ -> WRITE plan |
| Builder | What is done? | R (result) | E (energy) | WRITE code |
| Validator | Does it match? | iota (feedback) | (1-sigma) | VERIFY result |
| Coherencer | Same picture? | S (coherence) | Balanced | SYNC all |

---

## Absorbing States (Living System Boundaries)

| State | B | Description |
|-------|---|-------------|
| Nihilistic collapse | B -> 0 | Total loss of coherence |
| Dogmatic collapse | B -> 1 | Closed to learning |
| Living state | 0 < B < 1 | Capable of development |

Viability condition: 0 < Bi < 1 for all agents at all times.

---

*EraDev Glossary v4.1 | 2026-04-21 | EN single source of truth + PLUGY glossary drift unification*
*Total terms: 49 | Language: EN | Canonical forms: enforced*
