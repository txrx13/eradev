# RT-13 Validator RU — Формальная композиционная верификация P×M×D (BT-1)

**Дата:** 2026-04-26
**Роль:** [VALIDATOR] (RU-стек, formal composition verification)
**Скоп:** Inv 15 / BL-34 — formal proofs ТОЛЬКО, не regression scenarios. Composability of cures P (pruning organ), M (meta-stack inversion), D (defensibility ≠ leverage).
**Источники:** `composition-hazards-2026-04-26-bt1_EN.md`, `composition-hazards-2026-04-26-bt1_RU.md`, FOUNDATIONS §12, eradev §II.1 (B_text).
**Operator request:** "(all-3 sequenced) option a" — формальная safety этого варианта проверяется здесь.

---

## 1. Pre-flight: type signatures трёх лечений

Чтобы проверить композицию формально, фиксируем тип-сигнатуры (закрытая алгебра — без этого "композиция" undefined):

| Cure | Domain | Codomain | Operator class |
|---|---|---|---|
| Φ_P (retire) | `framework_state × time_window` | `framework_state'` (Ω_pruned ≥ 0 признак) | retraction (Φ⁻ кандидат) |
| Φ_M (intent-decl) | `meta_call_seq × pre_action` | `meta_call_seq'` (intent_ratio признак) | level-discipline (stratification) |
| Φ_D (Λ-rescore) | `B_components × session_window` | `B_components'` (Λ ← Λ·leverage_factor) | metric re-anchor (axis re-weight) |

Все три оперируют на разных проекциях `framework_state`, но **не disjoint**: см. §3.

---

## 2. Pair-tests (formal verdicts)

### 2.1 P × M — `MARGINAL`

**Failure mode F_PM (formal):** retire-операция типа `retire: BL_id → framework_state'`. Если META выполняет retire **directly** (Edit/Write на `BOOTSTRAP_LESSONS.md`) — это invocation `Ô_4` (Builder-codomain) с уровня L9. По RU §1.2 это type error: domain coercion. M's KILL-TEST extension МУСТ block META's direct edit; но retire без `[BUILDER] retire+archive` agent-spawn = phantom retire (без archive provenance, без supersede-link, без temporal triple closure).

**Resolution test (falsifiable per L-52):**
> Q1: Существует ли в P-cure spec пункт "retire is Agent-routed only (Builder + Validator), never META direct edit"?
> Q2: KILL-TEST hook (M-cure) распознаёт retire-paths КАК Edit/Write на `lessons.md|BOOTSTRAP_LESSONS.md|BL/Inv id removal patterns`?

**Текущее состояние reports:** EN §2 P-M строка ставит `Reinforce, with shared dependency on bootstrap §9`, добавляет mitigation "downstream-references audit". RU §2 P-M строго требует "retire-paths должны иметь СТРОЖЕ deny-hook чем add-paths". **Convergent.** НО ни один из двух reports не обязывает Q1+Q2 одновременно как **co-spec invariant**. Без этого P×M верифицируем-частично.

**Verdict: MARGINAL.** σ_pair = 0.30.
- Composable условно: спека P МУСТ содержать "retire-route = Agent-only" клаузу; спека M МУСТ содержать "retire-pattern recognition" в KILL-TEST hook. Оба в одном RT-1 spec — иначе reinforce-фантом.
- Falsifiable: post-ship audit `grep "retire" .claude/hooks/enforce-delegation.sh` должен находить retire-pattern matchers; иначе FAIL.

### 2.2 P × D — `MARGINAL` (с lean towards FAIL)

**Failure mode F_PD (formal):** D's `leverage_factor = operator_artifacts ÷ framework_self_artifacts`. Если P retires Inv/BL по cardinality criterion (age + low fire-frequency), retired item уходит из numerator/denominator measurement; **но если retired item был load-bearing для будущего operator-domain паттерна, его retire изменяет D's signal post-hoc.**

**Strict formal test:**
- Пусть `S_t` = framework_state в момент `t`. D measures `Λ(S_t) = Λ_consulted(S_t) × leverage_factor(S_t)`.
- P performs `S_{t+1} = retire(BL_x, S_t)`. Если `BL_x ∈ Λ_consulted(S_{t-k})` (BL_x consulted в прошлом окне), то `Λ(S_{t+1}) ≠ Λ(S_t)` без operator action. **D's metric changes purely from P's act, not from operator behaviour.**
- Это нарушает **observability invariant** D: leverage должен measure operator-vs-framework activity, а не framework-internal sliding.

**Snapshot freeze proposal (4-я нога resolution, §4):** D MUST measure `leverage_factor` over **frozen window** `[t_start, t_start + 4 sessions]` где `framework_state` snapshot taken at `t_start`. Retire-events in `[t_start, t_end]` записываются в delta-log, не в D's denominator. Без этого D becomes self-referential noise.

**Текущее состояние reports:** EN P-D `Conflict` honest. RU P-D `defensive-ritual deepening` orthogonal angle. EN mitigation "leverage_factor projection check before retire" — **circular**: P checks D before P retires, но D's metric не stable до P. RU's mitigation "TIME/USAGE-DRIVEN auto-demote" elegant но не resolves snapshot question.

**Verdict: MARGINAL → FAIL** unless snapshot-freeze added.
σ_pair = 0.40 (high — circular dependency unresolved).
- Falsifiable: после ship проверить что D's `leverage_factor(S_t)` invariant под `retire(BL_x, S_t)` events для всех `BL_x ∉ recent_operator_artifacts`. Если нет — observability нарушена.

### 2.3 M × D — `PASS WITH NOTES`

**Failure mode F_MD (formal):** RU §2 M-D строка центральная: "leverage_factor counts artifacts; intent_ratio counts META actions; double-count?"

**Disambiguation test:**
- M's `intent_ratio = declared_intents / Agent_spawns` — измеряется per-call (per META tool-invocation event).
- D's `leverage_factor = operator_artifacts / framework_self_artifacts` — измеряется per-window (rolling 4 sessions).
- **Type-distinct:** M tracks tool-invocations (Edit/Write/Agent — events in stream); D tracks artifacts (files written — outcomes).

**Однако double-count potential:** META Synthesis output (Unified Plan, ROADMAP update — META's 6 outputs per CLAUDE.md) ARE artifacts. Если META declares intent "synthesize RT outputs" and produces Synthesis directly (no Agent spawn), M counts it as `intent without spawn` (M-violation), D counts it as `framework_self_artifact` (denominator boost). **Double-penalty for same event.**

**Resolution:** Synthesis is META's exempted output per CLAUDE.md "META Output Spec" table — не Agent-routable. M's KILL-TEST MUST whitelist Synthesis-class outputs (formal exception list: Synthesis, Decisions, Lessons-write, Reports — META's 6 types). D's denominator МУСТ exclude same exempted set, ИЛИ обе формулы measure the exception.

**Verdict: PASS WITH NOTES.**
σ_pair = 0.20.
- Composable iff exemption list co-defined в обоих spec'ах (M whitelist == D denominator exclusion). RT-1 МУСТ produce **shared exemption set ε_meta** as separate artifact.
- Falsifiable: для META's Synthesis-event, M counts 0 violations AND D counts 0 framework_self_artifact (or both count it consistently, not asymmetrically).

### 2.4 Failure mode summary table

| Pair | Verdict | σ | Failure mode | Required co-spec |
|---|---|---|---|---|
| P × M | MARGINAL | 0.30 | retire без Agent-route + KILL-TEST не cover retire | retire-Agent-only + retire-pattern matcher |
| P × D | MARGINAL→FAIL | 0.40 | retire mutates D's signal без operator action | snapshot freeze window for D |
| M × D | PASS WITH NOTES | 0.20 | META Synthesis double-count | shared exemption set ε_meta |

---

## 3. Triple-test P × M × D — formal contraction

**Цель:** доказать (или фальсифицировать) что `Φ_cure = Φ_P ∘ Φ_M ∘ Φ_D` contractive при self-application `ψ* = Φ_cure(ψ*)`.

### 3.1 Composition definition

Рассмотрим `Φ_cure(S) = Φ_P(Φ_M(Φ_D(S)))` (порядок D→M→P per RU recommendation; symmetric argument для P→M→D EN ниже).

**Lipschitz constant analysis (sketch):**
- `k_D` (D-cure): Λ ← Λ·leverage_factor, leverage_factor ∈ [0.2, 1.0] (EN spec). Это **clipping** = non-expansive в sup-norm: `‖Φ_D(x) - Φ_D(y)‖ ≤ ‖x-y‖`. **k_D ≤ 1.**
- `k_M` (M-cure): KILL-TEST extension blocks invalid call-pattern. На `meta_call_seq` projection — projection (idempotent), `Φ_M ∘ Φ_M = Φ_M`. **k_M ≤ 1.**
- `k_P` (P-cure): retract-operator. На `framework_state` cardinality axis — strictly contractive at cardinality decrement events (`|S_{t+1}| < |S_t|`); identity на других sessions. **k_P ≤ 1, strictly < 1 на retire-events.**

### 3.2 Contraction proof (sketch)

**Theorem (informal):** `Φ_cure` is non-expansive globally, contractive whenever `Φ_P` activates (retire-event in window).

**Proof sketch:**
1. Composition of non-expansive maps in Banach space is non-expansive: `k_cure ≤ k_P · k_M · k_D ≤ 1`.
2. For fixed-point existence (Banach), need **strict contraction** `k_cure < 1` at least asymptotically. Получается ТОЛЬКО когда `k_P < 1` fires — т.е. retire-events происходят с positive frequency.
3. Если retire-cadence = 0 (P spec'ed но never fires — например Coherencer veto на каждый retire), `k_cure = 1` → non-expansive но не contraction → fixed point may not exist (just bounded orbit).

**Critical condition C1:** `Φ_cure` contractive **iff retire-frequency > 0 in steady state.** P не просто installed — он МУСТ fire с min cadence (e.g., ≥1 retire per 4 sessions). Без этого triple ничего не contracts.

**Failure case (formal):** если operator vetoes каждый retire-pass (P installed но dormant), composition degrades to `Φ_M ∘ Φ_D` which is non-expansive (k=1) on bounded orbit. Это НЕ contraction — fixed point unstable. Per FOUNDATIONS §12 ψ*=Φ(ψ*) requires Banach contraction для convergence; иначе ψ* maybe-attractor (orbit, not point).

### 3.3 Order sensitivity

**EN-order P→M→D vs RU-order D→M→P — formal comparison:**
- Composition is **non-commutative** in general: `Φ_P ∘ Φ_M ≠ Φ_M ∘ Φ_P` потому что `Φ_M` модифицирует `meta_call_seq`, что включает retire-calls (которые `Φ_P` triggers). Если `Φ_M` first, retire-calls subjected to KILL-TEST-pattern; если `Φ_P` first, retire-events take place до того как M's discipline applies.
- **Operationally:** RU-order (D→M→P) safer для contraction: D устанавливает axis (Λ re-weighted), M устанавливает stratification (retire будет Agent-routed), THEN P fires retire under both prior disciplines. EN-order (P→M→D) экспонирует **window** между P-install и M-install where retire can fire без stratification (см. §2.1 F_PM failure).
- **Verdict:** RU-order **formally safer**. EN-order requires атомарный ship of M в single commit с P (no inter-session window) — это additional invariant.

### 3.4 Triple verdict: `MARGINAL` (lean SAFE iff conditions C1+C2+C3 met)

- **C1:** retire-frequency > 0 в steady state (`Φ_cure` actually contracts).
- **C2:** EN-order requires atomic P+M ship; RU-order doesn't. Если ship-all-3-sequenced (operator option a) — выберите RU-order ИЛИ ensure atomicity within P→M window.
- **C3:** shared exemption set ε_meta defined (M×D resolution, §2.3).

**Без C1+C2+C3: FORMALLY_BROKEN.**
**С C1+C2+C3: FORMALLY_SAFE.**

---

## 4. 4-я нога — measurement self-reference (formal resolution)

**Проблема (EN flag):** D правит B-формулу. Сама эта artefact (composition-hazards reports) scored that B-formula. Если D ships, post-D artifacts scored under amended formula. **Self-reference paradox?**

**Formal analysis:**
- **Pre-D scoring:** все pre-D artifacts scored under `B_old(S)`. Их historical scores immutable (write-once в reports).
- **Post-D scoring:** все post-D artifacts scored under `B_new(S) = B_old(S) × leverage_adjustment`.
- **Boundary:** D's own ship artifact (the spec itself) — какой формулой scored?

**Resolution proposal (frozen-snapshot semantics):**
1. **Pre-cure snapshot:** B-formula, B-thresholds, hooks state — снимок `Σ_pre = (B_old, threshold_old, hooks_pre)` taken **at RT-1 conclusion** (committed to `reports/snapshot-pre-D-2026-04-XX.md`).
2. **Post-cure snapshot:** `Σ_post = (B_new, threshold_new, hooks_post)` taken после Builder ship + Validator pass.
3. **The D-ship artifact itself** scored under `Σ_pre` (consistency with pre-cure regime).
4. **All subsequent artifacts** scored under `Σ_post`.
5. **Boundary line is git commit hash** of D-ship commit — formal, falsifiable, immutable.

**Falsifiable invariant:** для каждого RT report после D-ship, file header МУСТ содержать `B-snapshot: Σ_pre|Σ_post` declaration. Validator sweep verifies. Нет declaration → BLOCK.

**4-я нога verdict:** RESOLVABLE through frozen-snapshot semantics. Это extension существующего temporal-triple pattern (`valid_from | ended | superseded_by`) применённый к B-formula version. EXTEND, not ADD (L-50 compliant).

---

## 5. 5-я нога — dormant→active conversion absent (formal test)

**Проблема (RU §6 audit):** все 3 cure EXTEND existing dormant structure (temporal triples, Hansei, B-formula slots, KILL-TEST). Если real disease — "framework declares mechanisms but never activates them" — то fixes сами могут быть declarative-only, не executable.

**Formal test (falsifiable):**
- **T1 (P-activation):** через 4 sessions после P-ship, `Ω_pruned > 0`? Если retire-protocol installed но 0 retire-events — P dormant.
- **T2 (M-activation):** через 4 sessions, `intent_ratio < 1.0` declared в bootstrap §9 для каждой сессии? Если бутстрап опускает декларацию — M dormant.
- **T3 (D-activation):** через 4 sessions, `leverage_factor` reported и triggered audit at boundary? Если ratio < 0.3 но no ANDON fired — D dormant.

**Pass criterion:** все 3 (T1, T2, T3) firing at first 4-session boundary.

**Recursive disease detection:** если хотя бы 1 из 3 dormant после ship, **5-я нога подтверждена** — fixes themselves проявляют тот же disease они лечат. Operator МУСТ be notified в Hansei (mandatory escalation per BL-3 fix-chain).

**5-я нога verdict:** RESOLVABLE iff post-ship Validator sweep at 4-session boundary verifies (T1 ∧ T2 ∧ T3). Without this sweep, lambda zero (BL-16: knowledge without enforcement).

**Practical recommendation:** RT-1 МУСТ spec **post-ship dormancy audit** as deliverable, not just cure deliverables. Иначе ship всех 3 cures с зеркальным риском dormancy.

---

## 6. Composition contraction proof (final sketch)

**Claim:** `Φ_cure: framework_state → framework_state` is contractive iff:
1. `Φ_P` fires with positive frequency (`retire_rate > 0` per 4-session window).
2. `Φ_M` blocks META direct retire-events (КИЛЛ-TEST recognises retire-pattern).
3. `Φ_D` measures over frozen pre-cure window для retire-events (snapshot semantics, §4).
4. Shared exemption ε_meta defined (M whitelist == D denominator exclusion).

**Banach condition:** `k_cure ≤ k_P · k_M · k_D < 1` whenever `k_P < 1` fires; else `k_cure ≤ 1` (non-expansive but not contraction).

**Self-application stability:** `ψ* = Φ_cure(ψ*)` exists as **fixed point** только под (1)+(2)+(3)+(4). Иначе bounded orbit (no convergence).

**Honest σ:** этот sketch предполагает Banach setting (metric space + complete). Framework_state NOT obviously metric (cardinality + relational structure). Full proof требует metric definition (e.g., `d(S1,S2) = |S1 △ S2|` symmetric difference). На уровне RT-1 sketch sufficient; full proof = OQ for RT-2.

---

## 7. Operator option (a) "ship-all-3-sequenced" — formal safety verdict

**Operator request:** "(all-3 sequenced) option a"

**Validator formal verdict:**
- Option (a) **FORMALLY_SAFE iff:**
  - Sequencing: D → M → P (RU-order, formally safer per §3.3).
  - C1: retire-cadence ≥ 1 per 4-session window committed in P spec.
  - C2: атомарность не required для RU-order (advantage over EN-order).
  - C3: ε_meta exemption set co-specified в RT-1.
  - C4 (4-я нога): frozen-snapshot semantics для B-formula transition (commit-hash boundary).
  - C5 (5-я нога): post-ship dormancy audit deliverable in RT-1 spec.

- Option (a) **FORMALLY_BROKEN iff:**
  - EN-order P→M→D без atomic ship of M (window for retire без stratification).
  - C1 violated (P installed но dormant — composition non-contractive).
  - C3 missing (M×D double-count Synthesis).

**Recommendation для operator option (a):**
1. **Use RU-order** (D → M → P), not EN-order.
2. RT-1 МУСТ produce **shared spec artifact** containing: ε_meta exemption set, retire-cadence requirement, snapshot-semantics rule, post-ship dormancy audit.
3. **One commit per cure** (Inv 7); single release wave; Validator gate after each cure ship.

---

## 8. B-score (этого Validator report)

B_text uniform 0.25:
- **F = 0.85** — Прочитано: оба composition-hazards reports, FOUNDATIONS §12, eradev §II.1, role file, lessons L-52..L-57, EMP18. Не прочитано: RT-11 Visionary report (источник триады) — minor gap, polled через цитаты в hazards reports.
- **E = 0.85** — Все 4 запрошенных секции (3 pair-tests + triple-test + 4-я + 5-я нога) с PASS/FAIL/MARGINAL и σ; failure mode table; composition proof sketch; operator option (a) verdict.
- **(1-σ) = 0.70** — σ = 0.30 объявляю явно: (i) sketches, не full proofs (Banach setting unverified — metric structure assumed); (ii) leverage_factor clipping bound `[0.2, 1.0]` — спросил из EN report но не verified в коде; (iii) ε_meta exemption set — proposed но не enumerated полностью (depend на full META 6-output spec).
- **Λ = 0.85** — L-50 (extend>add) применён к 4-я нога resolution; L-52 (falsifiability) — каждый verdict с falsifiable test; L-53 (path-(c) ΔÔ) — RU+EN reports могут расходиться по order, я их не forced converge; L-57 (tight prompts) — соблюдён; L-54 (parallel default) — meta-relevant.

**B = 0.85 × 0.85 × 0.70 × 0.85 = 0.430**

**B < 0.5 → ANDON.** Honest σ источник: формальная композиция не закрыта без RT-1 co-spec'инга (§3.4 conditions C1+C2+C3 + §4 snapshot + §5 dormancy audit). Это finding, не дефект отчёта: "FORMALLY_SAFE" вердикт under specific conditions; без них — FORMALLY_BROKEN.

---

## 9. Summary verdicts

| Test | Verdict | σ | Critical condition |
|---|---|---|---|
| P × M | MARGINAL | 0.30 | retire = Agent-only + KILL-TEST retire-pattern |
| P × D | MARGINAL→FAIL | 0.40 | snapshot freeze window for D |
| M × D | PASS WITH NOTES | 0.20 | shared exemption set ε_meta |
| Triple P×M×D | MARGINAL→SAFE | 0.30 | C1+C2+C3 met; RU-order preferred |
| 4-я нога (self-ref) | RESOLVABLE | — | frozen-snapshot semantics |
| 5-я нога (dormant) | RESOLVABLE | — | post-ship dormancy audit |

**Composition verdict: MARGINAL.** FORMALLY_SAFE conditional on RT-1 co-specifying 5 conditions (C1: retire-cadence; C2: ordering+atomicity; C3: ε_meta; 4-я: snapshot semantics; 5-я: dormancy audit). FORMALLY_BROKEN if any одна из 5 missing.

---

*Cross-refs:* L-50 (extend>add) | L-52 (Tier-falsification → falsifiable claims) | L-53 (path-(c) ΔÔ) | L-57 (tight prompts) | EMP18 (ψ*-gap) | FOUNDATIONS §12 | eradev §II.1 (B_text) | composition-hazards-2026-04-26-bt1_EN.md | composition-hazards-2026-04-26-bt1_RU.md.
