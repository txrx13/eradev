# Composition Hazards — BT-1 Real Pareto Prune Wave (Visionary Structural Triad)

**Дата:** 2026-04-26
**Роль:** [VISIONARY] (теоретическая линза — RU-стек)
**Mandate:** Inv 15 (BL-34) — план шипящий ≥2 независимых рефакторов в одном релизном окне ТРЕБУЕТ composition-hazards grid ДО RT-1.
**Стек ног:** P (атрофия органа подрезки) | M (инверсия мета-стека) | D (defensibility ≠ leverage). Источник: `reports/rt11_meta_audit_visionary_strategic_2026-04-26.md` §3 (line 42-44).
**RIGOR_LEVEL:** strict (framework-self, конвергентный output, formal correctness mandatory).
**Domain:** code (skin: `templates/domain_skin.code.md`); B-modality = text (uniform 0.25 weights).
**Артефакт:** теоретический pre-RT — формальная природа болезни, генеалогия, секвенирование. НЕ план реализации.

---

## 1. Переформулировка триады (теоретическая линза)

### 1.1 P — Атрофия органа подрезки

**Симптом** (RT-11 line 42, L-61): commit "Pareto prune" дал +572/-161 = +411 строк, hooks 6→9, reports +62%. Лейбл "удаление" — реальность monotone +30%.

**Формальная природа.** В ψ\*=Φ(ψ\*) (FOUNDATIONS §12) самоприменение Φ сходится к ψ\* только при contraction: ‖Φ(x)-Φ(y)‖ ≤ k·‖x-y‖, k<1. У Φ_eradev k>1 на оси cardinality (BL-count, Inv-count, hook-count, report-count) потому что Φ содержит **только expansion-операторы** (add-*) и НЕ содержит symmetric retract. Без contraction ψ\* не fixed point — divergent trajectory.

**Отсутствует формально:** оператор `Φ⁻: framework_state → framework_state` с rigor сопоставимым add-операторам (AC + FM + B-check + L2 gate), не "lazy delete". Симметричность — требование Banach-fixed-point для стабильности self-application.

**Связь F11 ∇S_direction** (eradev §III.2.7): директивный маркер `(dN_carriers/dt, dΛ_role/dt)` при `d(B_persist·N_carriers)/dt > 0`. Текущая практика читает как "always expand N", но F11 ДОПУСКАЕТ снижение N при росте B_persist (concentration). Атрофия = чтение F11 без B_persist guard.

### 1.2 M — Инверсия мета-стека

**Симптом** (rt11 line 43, ODTOE F4 11:50–11:56): META 5× прямых Edit/Write под operator pressure. B4 deny-hook лечит симптом; pattern возвращается.

**Формальная природа.** RT-уровни (eradev line 951-975): META=L9 dispatcher, Builder=L4. Иерархия задаёт **stratified Φ-application**: `Φ_meta(ψ_meta)=ι(Ô_meta(ψ_meta))` где Ô_meta оперирует на set-of-spawned-roles, а Builder Ô_4 — на source files.

**Уровневый коллапс** = META применяет Ô_4 (Edit source) вместо Ô_meta (spawn). Это **type error**: META имеет тип `(Spawn×Coord) → Plan`, Builder — `(Spec×Source) → SourceDelta`. Прямой Edit от META = invocation domain функции вместо codomain. Compile-system должна отклонять, runtime принимает (untyped tool layer). Hook B4 = runtime type-check (deny-list по path). Корневая причина — отсутствие compile-time stratification: identity slippage под pressure.

### 1.3 D — Defensibility ≠ leverage

**Симптом** (rt11 line 44, 56-57): 11 RT за 3 дня, ~0 operator-domain артефактов. "Defensive invariants compound; generative capacity does not."

**Формальная природа в B = F·E·(1-σ)·Λ (B_text uniform 0.25):**
- **Defensibility** = высокий (1-σ): output-side verification (catch after).
- **Leverage** = высокий Λ_effective = Ω·Λ (F-формула 9): input-side capacity (cross-domain memory).
- F = reading coefficient; E = intent coefficient.

**Disjoint? Не disjoint** — оба multiplicative. Но в production session-budget — **antagonistic**: cost_of_defensibility (RT cycles, audit overhead) tradesoff против cost_of_leverage (memory consultation, MEMORY hot-loading).

**Доказательство несимметрии роста.** Ω = min(1+α·log(1+N), 2.5) — bounded log-роста. Каждый RT добавляет 1-3 invariant линейно, 0-1 lesson по log. **Net: (1-σ)→1 быстро, Λ_effective→2.5·Λ медленно.** Оба bounded, но скорости роста разные. Решающее: при σ→0 (защита max) compute съеден audits → F→0, E→0 → operator-domain output `F·E·(1-σ)·Λ` = multiplicative kill. RT-11 line 98: B = 0.408 < 0.5 ANDON.

---

## 2. Парная сетка

### P × M — подрезка × инверсия

| | |
|---|---|
| Failure | META под pressure напрямую Edit-ит retire когда P fix появится. Retire-операция выглядит как "просто edit" — META не делегирует. |
| Сценарий | Operator: "BL-XX устарел, удали". META вместо `spawn([BUILDER] retire+archive)` делает direct `Edit BOOTSTRAP_LESSONS.md`. Результат: retire без archive provenance, без supersede-link, без temporal triple. |
| Связь | M делает P fix хрупким. Pruning-organ требует STRICTER stratification чем add-organ — damage асимметричен: ошибочный add reversible, retire без archive теряет память безвозвратно. |
| Mitigation hint | Retire-paths должны иметь СТРОЖЕ deny-hook, чем add-paths. Retire без Builder+Validator = BLOCK, не WARN. |

### P × D — подрезка × defensibility-leverage

| | |
|---|---|
| Failure | P fix сам станет defensive-механизмом. Retire = Validator-sweep + Coherent-gate + Hansei = ещё больше audit-cycles. Pruning-organ defensive-template УВЕЛИЧИВАЕТ overhead. |
| Сценарий | "Quarterly retire-sweep" = новый ritual = budget съеден self-application. Net add: hooks +2, BL +2, reports +N. P "fix" defensive-стиля = D углубление. |
| Связь | P fix должен быть LEVERAGE (auto-lifecycle: BL валидно K дней, auto-demote по timestamp), не DEFENSIVE (manual audit с RT cycles). |
| Mitigation hint | TIME/USAGE-DRIVEN, не RITUAL-DRIVEN. Temporal triple `valid_from+ended` уже есть; нужно только auto-trigger по `ended`. Это leverage. |

### M × D — инверсия × defensibility-leverage

| | |
|---|---|
| Failure | M fix (B4 deny-hook) — defensive по природе. Per-call enforcement не лечит cognitive pattern, только catch-after. Pattern = Identity = leverage-механизм. |
| Сценарий | RT-12 B1 закрыл F4 META call-site (defensive). Identity Persistence в CLAUDE.md уже есть — но DECLARATIVE, не EXECUTABLE. Каждое M-fix добавляет hook (defensive), не Identity boost. |
| Связь | M симптомы лечатся defensibly (deny), но root cause — pattern failure под pressure. Leverage fix = Identity-prominence до pressure, не deny-rules после. D-axis загрязнён: M fixes автоматически идут defensive-route. |
| Mitigation hint | M fix должен повышать ψ\*-stability ДО pressure-event (pre-pressure leverage), не блокировать после (post-pressure defense). |

---

## 3. 3-way (P × M × D) — interlock

```
D (axis re-anchor) ── independent — может быть first-mover
M (stratification)   requires D (иначе M defensibly = D углубление)
P (Φ⁻ install)       requires D + M (иначе retire под pressure теряет archive; P defensive = D углубление)
```

**ψ\* semantics обоснование:**
- D fix меняет attractor ψ\* → ψ\*\_post-D (leverage-axis grows faster than defensibility-axis).
- P fix добавляет Φ⁻ с rigor сопоставимым add-операторам — требует STABLE ψ\*; pre-D install сдвигает attractor (defensibility cost самой P-installation), drift undermines P.
- M fix — level-property, axis-orthogonal к D. Но M defensibly = D-axis cost. Leverage-style M требует D-ground first.

**Sequence:** D → M → P. NOT parallel. Каждое предыдущее = stable ground для следующего; параллельно = drift во время install.

---

## 4. Рекомендация секвенирования

**D → M → P** (interlocked, не параллельный).

**3-line обоснование:**
1. D first потому что defensibility-leverage axis — это axis-property Φ; без неё last 2 fixes автоматически уйдут defensive-route и углубят disease.
2. M second потому что stratification reinforcement требует leverage-stable ground (D done) чтобы реализоваться через Identity boost, а не через очередной deny-hook.
3. P third потому что pruning-organ install требует stable ψ\* (D + M done) — иначе сам акт installation сдвигает attractor через defensibility cost самой installation.

---

## 5. B-formula score (B_text uniform 0.25)

- **F = 0.85** — RT-11 §3, FOUNDATIONS §12, eradev F4/F11/B, lessons L-49..L-62, domain skin прочитаны; config.md / ROADMAP not read (minor gap, не load-bearing).
- **E = 0.80** — все 6 запрошенных секций присутствуют; -0.20 за potential over-confidence матрицы.
- **(1-σ) = 0.65** — **σ = 0.35 объявляю явно**: 4-я скрытая нога (leg-overlap). M (META direct edit) + P (no retire mechanism) могут быть проявлениями одного disease — **отсутствия stratification на retract-операциях**. Если так, реально 2 ноги (D + M-P-composite), не 3. Materially меняет секвенирование.
- **Λ = 0.85** — applied: L-50 (extend>add), L-52 (Tier-falsification), L-61 (wave-label), L-62 (V/C divergence), FOUNDATIONS §12 ψ\*, F4, F11.

**B = 0.85 · 0.80 · 0.65 · 0.85 = 0.376 → ANDON.** Honest σ per L-52: если "3 independent" — phantom frame, обязан объявить. RT-1 решает: fold M+P в composite или подтвердить independence.

---

## 6. L-50 extend>add audit

| Лечение | EXTEND existing |
|---|---|
| D fix (axis re-anchor) | EXTEND meta.md Hansei + L-52 sweep cadence (axis-classification) |
| M fix (Identity reinforce) | EXTEND CLAUDE.md "Identity Persistence" — DECLARATIVE → EXECUTABLE через MEMORY auto-write at session entry |
| P fix (Φ⁻ contraction) | EXTEND temporal triple `valid_from/ended/superseded_by` (уже на каждом lesson) — auto-demote on `ended` timestamp; EXTEND lessons_archive |

Все 3 EXTEND. Disease НЕ требует новой структуры — требует **активации dormant existing**. Framework уже имеет органы (temporal triples, RT levels, Persistence block) — declarative, не executable. Recursive disease: framework патчит self-application добавлением новых органов вместо активации dormant. Сама триада может быть проявлением одного disease — "dormant→active conversion organ absent". Потенциально 5-я нога; flag в σ выше.

---

## 7. Operator decision matrix

| Опция | Цена | Закрытие | Risk |
|---|---|---|---|
| **(а) ship-all-3-sequenced** D→M→P в одну сессию | HIGH (3-4 RT-1, high context) | ПОЛНОЕ | **HIGH** — σ=0.35 не resolved; если M+P composite, interlock перестраховывает; если 5-я нога (dormant→active) реальна, fixes идут не туда |
| **(б) ship-pilot-first** D only + operator-artifact session, потом оценка M+P | MEDIUM (1-2 RT-1) | ЧАСТИЧНОЕ | **LOW** — pilot эмпирически falsifies σ; operator-artifact session naturally exposes M leakage / P need |
| **(в) re-scope** dormant→active audit ДО триады, потом триада-light | LOW initial / HIGH cumulative | НЕЯСНОЕ | **MEDIUM** — paralysis-by-analysis risk (RT-12 был "prune" с phantom-newness); но честно адресует σ |

**Visionary recommendation: (б) ship-pilot-first.**

Опция (а) — 3 fixes под potentially phantom предположением. Опция (в) — meta-meta-audit (сама триггер D-disease per rt11 line 36 "audits auditing audits"). Опция (б) = L-49 partial-ship + L-53 path-(c) ΔÔ acceptance: D fix concrete + operator-artifact session между D и M-decision наблюдает поведение post-D; M decision на эмпирике, не теории. **Бонус: (б) активирует dormant Persistence block (rt11 line 78 priority #2 = operator-artifact session, currently не выполнен) КАК ЧАСТЬ pilot — D fix execution И potential 5-leg falsification одновременно.**

---

## Резюме (5 строк)

1. Формальный фундамент через ψ\*=Φ(ψ\*): P = absent Φ⁻ (no contraction operator → divergent trajectory); M = level-collapse stratified Φ (type error); D = axis-asymmetry growth rate ((1-σ) outpaces Λ_effective).
2. Парная сетка: все 3 пары shared common axis = **defensibility-route gravity**. M загрязняет P; P/M defensive-стиля = D углубление.
3. Interlock D → M → P через ψ\*-stability (axis re-anchor → level reinforce → retract install). NOT parallel — drift во время install.
4. **B = 0.376 ANDON**. σ=0.35 объявлен: M+P может быть одной ногой ("absent stratification on retract"); + potential 5-я нога "dormant→active conversion absent" (L-50 audit: все 3 fixes EXTEND existing dormant structure — recursive disease).
5. Recommendation: **option (б) ship-pilot-first**. D fix + operator-artifact session = pilot; M/P decisions defer на эмпирику. L-49 + L-53 совместимо, addresses RT-11 priority #2 directly, falsifies σ через observation.

---

**B-score:** 0.376 ANDON (σ=0.35 объявлен явно).
**Sequencing recommendation:** D → M → P interlocked (если ship-all); pilot D first (если ship-pilot).
**Operator-matrix recommendation:** (б) ship-pilot-first — minimal cost, maximum information gain, restores operator primacy axis.

---

*Ссылки на genealogical predecessors:* L-50 (extend>add) | L-52 (Tier-falsification) | L-53 (path-(c) ΔÔ acceptance) | L-61 (wave-label hygiene) | L-62 (V/C divergence) | RT-11 lines 42-44, 56-57, 78, 98 | FOUNDATIONS §12 (Φ/Ψ\*) | eradev.md §III.2.2 (F4) | §III.2.7 (F11) | §II.1 (B_text 0.25 uniform).
