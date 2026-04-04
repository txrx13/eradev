# EraDev Bilingual Glossary v4.0

> Single source of truth for all ODTOE and EraDev terminology.
> Canonical reference -- all other documents MUST link here, not duplicate.

---

## Canonical Forms

Each term has exactly ONE canonical form per language. All other variants are deprecated aliases.

| # | Canonical EN | Canonical RU | Deprecated aliases (DO NOT USE) |
|---|---|---|---|
| 1 | Coherencer | Когерент | Coherent Agent, когерент-агент, Coherence Agent |
| 2 | Cognitive Coherence B | Когнитивная когерентность B | B-metric, метрика B, agent quality |
| 3 | System Coherence S | Когерентность системы S | team sync, синхронизация команды, S_team |
| 4 | Collective Probability P_coll | Коллективная вероятность P_coll | collective reliability, надёжность группы |
| 5 | Observation Operator O_hat | Оператор наблюдения O_hat | observer, наблюдатель-проектор |
| 6 | Field of States Psi | Поле состояний Psi | state space, пространство состояний |
| 7 | Observation Result R | Результат наблюдения R | output, выход агента |
| 8 | Embedding Operator iota | Оператор погружения iota | feedback operator, оператор обратной связи |
| 9 | Self-Observation Phi | Отображение самонаблюдения Phi | self-map, рекурсивное отображение |
| 10 | Fixed Point Psi* | Неподвижная точка Psi* | stable state, стабильное состояние |
| 11 | Focus F | Фокус F | attention, внимание |
| 12 | Alignment E | Эмоциональная когерентность E | emotional coherence, целевое соответствие |
| 13 | Entropy sigma | Энтропия сомнений sigma | doubt entropy, внутренний шум |
| 14 | Experience Lambda | Эмпирическое подкрепление Lambda | grounded experience, накопленный опыт |
| 15 | Dimensionality d | Мерность наблюдения d | recursion depth, глубина рекурсии |
| 16 | Round Table | Круглый Стол | RT, раунд-тейбл |
| 17 | Activation Operator A | Оператор активации A | boot sequence, последовательность запуска |
| 18 | Configuration Inertia I(C) | Инерция конфигурации I(C) | blast radius, сопротивление |
| 19 | Configuration Lifetime T(C) | Время жизни конфигурации T(C) | deploy stability, стабильность деплоя |
| 20 | Noise Dispersion D(eta) | Дисперсия шума D(eta) | error rate, уровень ошибок |
| 21 | Adaptive Attractor | Адаптивный аттрактор | True North (context-dependent alias, acceptable) |
| 22 | True North | True North | Истинный Север (literal translation, avoid) |
| 23 | Spiral Gap | Спиральный зазор | residual gap, незамкнутость |
| 24 | Golden Ratio phi | Золотое сечение phi | golden section |
| 25 | Torus Topology | Тороидальная топология | toroidal structure, тороидальная структура |
| 26 | Perveance P | Первеанс P | interaction intensity |
| 27 | Coherence Dynamics dB/dt | Динамика когерентности dB/dt | B-rate, скорость B |
| 28 | Jidoka | Дзидока | self-check (acceptable shorthand) |
| 29 | Andon | Андон | stop signal, стоп-сигнал |
| 30 | Mura | Мура | unevenness, неравномерность |
| 31 | Muri | Мури | overload, перегрузка |
| 32 | Muda | Муда | waste, потери |
| 33 | Hansei | Хансей | reflection, рефлексия |
| 34 | Yokoten | Ёкотен | horizontal propagation |
| 35 | Nemawashi | Немаваси | pre-alignment, предварительное согласование |
| 36 | SKW Matrix | SKW-матрица | situation-keyword-questions |
| 37 | Coherence Cluster | Когерентный кластер | team unit, команда |
| 38 | Cluster Hierarchy | Иерархия кластеров | L1-L2-L3 hierarchy |
| 39 | Damper Capacity | Демпферная ёмкость | buffer, буфер |
| 40 | S_adjusted | S_adjusted (скорректированная когерентность) | phantom coherence detector |
| 41 | Graduated Activation | Градуированная активация | phased activation, поэтапный запуск, sequential role launching |
| 42 | Interface Contract | Интерфейсный контракт | API contract, контракт API |
| 43 | Lambda Bootstrap | Лямбда-бутстрап | experience bootstrap, начальная загрузка опыта |
| 44 | Language Policy | Языковая политика | dual-language policy, билингвальная политика |
| 45 | Check-First | Check-First (проверка перед генерацией) | read-before-write, прочитай-перед-записью |
| 46 | Lambda Problem | Лямбда-проблема | knowledge-without-enforcement, знание-без-применения |

---

## Terms and Formulas

| # | Term | EN Definition | RU Definition | Formula | Used by (roles) |
|---|---|---|---|---|---|
| 1 | **B** (Cognitive Coherence) | Quality of observation by an individual agent, determined by four multiplicative components. Weak link principle: if any component = 0, all coherence = 0 | Качество наблюдения отдельного агента, определяемое четырьмя мультипликативными компонентами. Принцип слабого звена: если любой компонент = 0, вся когерентность = 0 | B = F^w1 * E^w2 * (1-sigma)^w3 * Lambda^w4, w1+w2+w3+w4 = 1 | All roles (Jidoka Self-Check) |
| 2 | **S** (System Coherence) | Degree of synchronization between observers in a group. S=1: perfect sync. S<0.5: agents diverge. Target: S>0.7 | Степень синхронизации между наблюдателями в группе. S=1: идеальная синхронизация. S<0.5: агенты расходятся. Цель: S>0.7 | S = 1 - (2/(n(n-1))) * SUM(\|Bi - Bj\|) | Coherencer |
| 3 | **P_coll** (Collective Probability) | Probability of achieving target configuration by a group of observers. Mathematical case for multi-agent over single-agent | Вероятность достижения целевой конфигурации группой наблюдателей. Математическое обоснование преимущества мульти-агента над одиночным | P_coll(E) = 1 - PROD(1 - Bi^k) | Analyst, Coherencer |
| 4 | **T(C)** (Configuration Lifetime) | Stability of a configuration over time, depending on coherence. Higher S yields exponentially longer stability | Устойчивость конфигурации во времени, зависящая от когерентности. Более высокое S даёт экспоненциально большую стабильность | T(C) = T0 / (1-S)^n | Validator, Coherencer |
| 5 | **Phi** (Self-Observation) | Recursive self-observation mapping -- observer observes itself. Fixed point Psi* = stable deployment | Рекурсивное отображение самонаблюдения -- наблюдатель наблюдает себя. Неподвижная точка Psi* = стабильный деплой | Phi(Psi) = iota(O_hat(Psi)); Psi* = Phi(Psi*) | All roles (RT cycle) |
| 6 | **F** (Focus) | Ability to concentrate attention on the subject of observation. Step A_F of the Activation Operator | Способность сконцентрировать внимание на предмете наблюдения. Шаг A_F оператора активации | Component of B. F=0 => B=0 (blindness kills result) | Analyst (dominant) |
| 7 | **E** (Alignment) | Alignment of internal state with observation goal. Pull-anchor in RT-1 | Согласованность внутреннего состояния с целью наблюдения. Pull-якорь в RT-1 | Component of B. E=0 => B=0 (wrong problem solved) | Builder (dominant) |
| 8 | **sigma** (Entropy) | Internal contradiction of the observer. Andon protocol when sigma->1 | Внутренняя противоречивость наблюдателя. Андон-протокол при sigma->1 | Component of B as (1-sigma). sigma=1 => B=0 | Validator (dominant via 1-sigma) |
| 9 | **Lambda** (Experience) | Accumulated verified experience of the observer. MEMORY.md, A3 templates, Decision Log | Накопленный верифицированный опыт наблюдателя. MEMORY.md, A3-шаблоны, Decision Log | Component of B. Lambda=0 => B=0 (work without memory) | Visionary (dominant) |
| 10 | **d** (Dimensionality) | Level of self-observation recursion. Key thresholds: 3 (self-check), 6 (full cycle), 9 (self-modification) | Уровень рекурсии самонаблюдения. Ключевые пороги: 3 (самопроверка), 6 (полный цикл), 9 (самомодификация) | d=3,6,9 -- cognitive architecture thresholds | All roles |
| 11 | **O_hat** (Observation Operator) | Projection from the space of possibilities into a result. Each role is a specialized observation operator | Проекция из пространства возможностей в результат. Каждая роль -- свой оператор наблюдения | R = O_hat(Psi); defined in {role}.md | Each role individually |
| 12 | **Psi** (Field of States) | Space of all possible configurations of the project | Пространство всех возможных конфигураций проекта | Psi' = iota(R) -- updated after each cycle | Visionary |
| 13 | **R** (Observation Result) | Concrete output produced by applying O_hat to Psi | Конкретный результат применения O_hat к Psi | R = O_hat(Psi) | Builder |
| 14 | **iota** (Embedding Operator) | Feedback: observation result changes the state space | Обратная связь: результат наблюдения изменяет пространство состояний | iota: R -> Psi' | Validator |
| 15 | **A** (Activation Operator) | Mandatory 4-step boot sequence EVERY agent runs before generating output | Обязательная 4-шаговая последовательность, которую КАЖДЫЙ агент выполняет перед генерацией результата | A = A_Lambda o A_sigma o A_E o A_F | All roles |
| 16 | **I(C)** (Configuration Inertia) | System resistance to reconfiguration. Higher inertia demands stricter process | Сопротивление системы переконфигурации. Чем выше инерция, тем строже процесс | v = alpha / (I(C) + epsilon) | Analyst, Coherencer |
| 17 | **D(eta)** (Noise Dispersion) | Stochastic noise suppression: higher coherence S suppresses randomness | Подавление стохастического шума: более высокая когерентность S подавляет случайность | D(eta) = D0 * (1 - S) | Coherencer |
| 18 | **dB/dt** (Coherence Dynamics) | Rate of coherence change over time. Prediction Delta: divergence between RT-1 predictions and RT-3 reality | Скорость изменения когерентности во времени. Prediction Delta: расхождение предсказаний RT-1 и реальности RT-3 | dB/dt = gamma * tanh(beta * d_dot) * d_bar * B(1-B) | Coherencer |
| 19 | **P** (Perveance) | Intensity of interaction between observers. Determined by torus topology | Интенсивность взаимодействия между наблюдателями. Определяется тороидальной топологией | Related to r/R = 1/phi | Coherencer |
| 20 | **phi** (Golden Ratio) | Fundamental self-similarity proportion. RT/Build = 38%/62%. Torus ring ratio R/r | Фундаментальная пропорция самоподобия. RT/Build = 38%/62%. Соотношение тороидальных колец R/r | phi = (1+sqrt(5))/2 = 1.618... | All roles (time allocation) |
| 21 | **Psi*** (Fixed Point) | System applied to itself reproduces itself improved. Stable release: commit after 5/5 GO | Система, применённая к себе, воспроизводит себя в улучшенном виде. Стабильный релиз: коммит после 5/5 GO | Psi* = Phi(Psi*) | All roles (RT-3 target) |
| 22 | **Round Table** | Protocol of parallel observation: all 5 roles see the task simultaneously. Three stages: RT-1 (start), RT-2 (midpoint), RT-3 (finish) | Протокол параллельного наблюдения: все 5 ролей видят задачу одновременно. Три стадии: RT-1 (старт), RT-2 (проверка), RT-3 (фиксация) | RT-1 -> Build -> RT-2 -> Build -> RT-3 | All roles |
| 23 | **Spiral Gap** | Non-closure of the self-observation cycle, preventing stagnation. ~2% remains unresolved -- this is the engine of development | Незамкнутость цикла самонаблюдения, предотвращающая стагнацию. ~2% остаётся нерешённым -- это двигатель развития | (pi-3)^2 ~ 0.02 | Coherencer (A3 template) |
| 24 | **Torus Topology** | Communication structure: two rings with golden ratio. Inner ring r (fast): Analyst-Builder-Validator. Outer ring R (slow): Visionary-Coherencer-Analyst | Структура коммуникации: два кольца с отношением золотого сечения. Внутреннее кольцо r (быстрое): Аналитик-Строитель-Валидатор. Внешнее кольцо R (медленное): Визионер-Когерент-Аналитик | R/r = phi = 1.618... | All roles |
| 25 | **True North** | Adaptive attractor -- configuration with maximum stability. NOT a goal (reached and abandoned), but a DIRECTION (eternal pull) | Адаптивный аттрактор -- конфигурация с максимальной устойчивостью. НЕ цель (достигается и исчезает), а НАПРАВЛЕНИЕ (вечное притяжение) | Defined in projects/{name}/config.md | Visionary, Coherencer |
| 26 | **Jidoka** | Quality built in at every step. Agent self-checks own output before handoff. Realization of O_hat(O_hat) = O_hat' | Качество на каждом шаге. Агент проверяет свой результат перед передачей. Реализация O_hat(O_hat) = O_hat' | Applied after each work block | All roles |
| 27 | **Andon** | Right and obligation to stop the line upon detecting a problem. Continuing on a defective plan = multiplying the defect | Право и обязанность остановить линию при обнаружении проблемы. Продолжение на дефектном плане = размножение дефекта | Trigger: sigma -> 1 or F -> 0 | All roles |
| 28 | **Mura** (Unevenness) | Quality oscillations between sessions or agents (TPS) | Колебания качества между сессиями или агентами (TPS) | Detector: Coherencer checks balance in RT-2 | Coherencer |
| 29 | **Muri** (Overload) | Task exceeds agent capacity: prompt >200 lines, meta.md grows linearly (TPS) | Задача превышает возможности агента: промпт >200 строк, meta.md линейно растёт (TPS) | Detector: Analyst checks blast radius | Analyst |
| 30 | **Muda** (Waste) | Actions that create no value: duplication, project-specific rules in core, re-solving solved problems (TPS) | Действия, не создающие ценности: дублирование, проектная специфика в ядре, повторное решение решённых задач (TPS) | Eliminated via DRY and Yokoten | All roles |
| 31 | **Hansei** | Reflection on PROCESS, not result. "Why did our process lead to this?" Source of improvements | Рефлексия процесса, а не результата. "Почему процесс привёл к этому?" Источник улучшений | Applied in RT-3 and A3 crystallization | All roles (RT-3) |
| 32 | **Yokoten** | Horizontal knowledge propagation. Lesson from one incident generalized to all analogous cases (TPS) | Горизонтальное распространение знаний. Урок из инцидента обобщается на все аналогичные случаи (TPS) | Mechanism: spiral memory -> rules | Coherencer |
| 33 | **Nemawashi** | Pre-alignment before critical decisions. All roles see the decision before it is made (TPS) | Предварительное согласование перед критическим решением. Все роли видят решение до его принятия (TPS) | Trigger: blast radius >= HIGH | Coherencer, Analyst |
| 34 | **SKW Matrix** | Structured request format: Situation, Keyword, Questions (Why, How, Who, When). Elementary unit of coherent formation | Структурированный формат запроса: Ситуация, Ключевое слово, Вопросы (Зачем, Как, Кто, Когда). Элементарная единица когерентного образования | Reduces inertia I(C) of the task | Coherencer (RT-1) |
| 35 | **Coherence Cluster** | Co-observers with S above threshold. Minimum viable team = 5 (ceil(pi)+1) | Со-наблюдатели с S выше порога. Минимальная жизнеспособная команда = 5 (ceil(pi)+1) | n_min = ceil(pi) + 1 = 5 | Coherencer |
| 36 | **Cluster Hierarchy** | Scaling structure: Atom -> Molecule -> Universe. L1 (within team), L2 (between teams), L3 (global) | Структура масштабирования: Атом -> Молекула -> Вселенная. L1 (внутри команды), L2 (между командами), L3 (глобально) | N_teams = ceil(N_modules / 3) | Coherencer (L1/L2/L3) |
| 37 | **Damper Capacity** | Buffer for smoothing fluctuations across sessions | Буфер для сглаживания колебаний между сессиями | MEMORY.md, A3 as inter-session memory | Coherencer, Visionary |
| 38 | **S_adjusted** | Quality-weighted coherence: S_team scaled by mean agent quality. Detects phantom coherence (high agreement + low substance). Three diagnostic bands: S_adjusted > 0.5 = healthy; S_team > 0.7 but S_adjusted < 0.5 = phantom coherence → Kill-Switch; S_adjusted > 0.7 but S_team < 0.7 = strong agents, weak alignment → RT sync | Когерентность с поправкой на качество: S_team, умноженная на среднее качество агентов. Обнаруживает фантомную когерентность (высокое согласие + низкое качество). Три диагностических зоны: S_adjusted > 0.5 = здоровое состояние; S_team > 0.7, но S_adjusted < 0.5 = фантомная когерентность → Kill-Switch; S_adjusted > 0.7, но S_team < 0.7 = сильные агенты, слабая синхронизация → RT sync | S_adjusted = S_team × B_mean, where B_mean = (1/n) × SUM(Bi) | Coherencer |
| 39 | **Graduated Activation** | GREEN/YELLOW/RED status system for Activation Operator steps, replacing binary pass/fail Andon. GREEN = proceed; YELLOW = proceed with caveat, flag for RT-2; RED = full Andon stop. Two or more YELLOW = RED. Applies to: Activation Operator (Section IV) | Система статусов GREEN/YELLOW/RED для шагов Оператора Активации, заменяющая бинарный pass/fail Андон. GREEN = продолжить; YELLOW = продолжить с оговоркой, флаг для RT-2; RED = полный Андон-стоп. Два и более YELLOW = RED. Применяется к: Оператор Активации (Раздел IV) | Status per A-step: GREEN / YELLOW / RED | All roles (Activation Operator, Section IV) |
| 40 | **Interface Contract** | Explicit specification of inputs, outputs, and invariants between agents or modules. Eliminates implicit assumptions | Явная спецификация входов, выходов и инвариантов между агентами или модулями. Устраняет неявные допущения | Defined per role pair in RT-1 | Analyst, Builder |
| 41 | **Lambda Bootstrap** | Protocol for initializing Lambda (experience) when an agent has no prior context. Loads baseline patterns from MEMORY.md and cross-project lessons | Протокол инициализации Lambda (опыта), когда у агента нет предшествующего контекста. Загружает базовые паттерны из MEMORY.md и кросс-проектных уроков | Lambda_0 = load(MEMORY.md) + load(lessons_cross_project) | All roles (session start) |
| 42 | **Language Policy** | Dual-language architecture: EN for execution (core prompts, agent communication), RU for theoretical depth (formulas, conceptual leaps). Project configs follow team language | Двуязычная архитектура: EN для исполнения (промпты ядра, коммуникация агентов), RU для теоретической глубины (формулы, концептуальные прорывы). Проектные конфиги на языке команды | See eradev.md Section 0 | All roles |
| 43 | **Kill-Switch** | Managed dissonance protocol triggered when agent outputs become homogeneous. 5 escalation levels from angle-shift to full frame break | Протокол управляемого диссонанса, активируемый при гомогенизации выходов агентов. 5 уровней эскалации от смены угла до полного сброса рамки | Trigger: >40% of RT-2 phrases repeat RT-1 verbatim | Coherencer |
| 44 | **Absorbing States** | Boundary conditions where the living system dies. B->0 (nihilistic collapse) or B->1 (dogmatic collapse). Living condition: 0 < B < 1 | Граничные условия, при которых живая система умирает. B->0 (нигилистический коллапс) или B->1 (догматический коллапс). Условие жизни: 0 < B < 1 | 0 < Bi < 1 for all agents at all times | All roles (Jidoka check) |
| 45 | **Check-First** | Protocol: read the reference format BEFORE generating output. Prevents 100% of format rework by ensuring the agent knows the target structure before writing. (BL-17, BL-21) | Протокол: прочитать эталонный формат ДО генерации результата. Предотвращает 100% переделок формата, обеспечивая знание целевой структуры перед записью. (BL-17, BL-21) | Read reference -> 7 checks -> Write | Builder, Validator |
| 46 | **Lambda Problem** | Knowledge exists in the system (Lambda > 0) but is not enforced at execution time, so effectively Lambda = 0 for behavior. Root cause: enforcement mechanism lives where agents do not look. Fix: place enforcement where it auto-fires (CLAUDE.md, meta.md). (BL-16) | Знание существует в системе (Lambda > 0), но не применяется при исполнении, поэтому фактически Lambda = 0 для поведения. Причина: механизм применения находится там, куда агенты не смотрят. Исправление: разместить применение там, где оно срабатывает автоматически (CLAUDE.md, meta.md). (BL-16) | Lambda_effective = 0 when enforcement misplaced | All roles (Activation Operator Step 4) |

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
| Self-check / Самопроверка | 3 | O_hat(O_hat) = O_hat' | Jidoka Self-Check per agent |
| Full cycle / Полный цикл | 6 | Phi = iota(O_hat(Psi)) | RT-1 -> Build -> RT-2 -> Build -> RT-3 |
| Self-modification / Самомодификация | 9 | O_hat modifies itself | Meta-Agent modifies prompts based on Prediction Delta |

---

## Five Roles as Observation Operators

| Role EN | Role RU | Core Question | ODTOE Operator | Dominant B | Operations |
|---------|---------|---------------|----------------|------------|------------|
| Visionary | Визионер | What and why? / Что и зачем? | Psi (field of states) | Lambda (scale) | READ strategy |
| Analyst | Аналитик | How exactly? / Как именно? | O_hat (projection) | F (focus) | READ -> WRITE plan |
| Builder | Строитель | What is done? / Что сделано? | R (result) | E (energy) | WRITE code |
| Validator | Валидатор | Does it match? / Соответствует ли? | iota (feedback) | (1-sigma) | VERIFY result |
| Coherencer | Когерент | Same picture? / Мы видим одно? | S (coherence) | Balanced | SYNC all |

---

## Absorbing States (Living System Boundaries)

| State EN | State RU | B | Description EN | Description RU |
|----------|----------|---|----------------|----------------|
| Nihilistic collapse | Нигилистический коллапс | B -> 0 | Total loss of coherence | Полная утрата когерентности |
| Dogmatic collapse | Догматический коллапс | B -> 1 | Closed to learning | Закрытость, неспособность учиться |
| Living state | Живое состояние | 0 < B < 1 | Capable of development | Способность к развитию |

Viability condition: 0 < Bi < 1 for all agents at all times.

---

*EraDev Glossary v4.0 | 2026-04-02 | Coherencer RT dovodka | Bilingual single source of truth*
*Total terms: 46 | Languages: EN + RU | Canonical forms: enforced*
