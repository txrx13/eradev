# RT-5 Full Audit — Builder (RU): Метафора vs Исполнение

**Дата:** 2026-04-25 | **Роль:** [BUILDER] RU | **Призма:** теоретическая глубина → исполнимость концептов v10
**Параллель:** EN-Builder (anti-bloat scan) — не дублирую, смотрю на ту же поверхность через "operator vs metaphor".

## Шкала
- **МЕТАФОРИЧНО** — концепт живёт только в .md, у агента нет операции, которую он мог бы выполнить.
- **ЧАСТИЧНО ИСПОЛНИМО** — есть инструкция, но критерий/измеритель отсутствует; агент имитирует исполнение.
- **ИСПОЛНИМО** — у агента есть конкретный observable шаг (read/grep/compute), результат бинарен или числен.
- **РАБОТАЕТ** — исполнимое + интегрировано в существующий цикл (RT/μ-check/Lambda Audit) с обратной связью.

## Скан 6 концептов

### 1. RIGOR_LEVEL classification (§III.3) — **ЧАСТИЧНО ИСПОЛНИМО**
4-уровневая каскад (`domain default` → task → segment → agent warning) — это ОПЕРАЦИЯ: read `config.md → rigor_default`, далее выбор по таблице III.3.1. Visionary исполнимо классифицирует. НО: пункт 4 (Builder/Validator emit `[RIGOR WARNING]` при mismatch) — нет конкретного критерия "AC cannot be specified" → агент решает по интуиции. OQ-CR-3 (auto-inference из IFR-токенов) DEFERRED v11 — то есть детектор-регекс ещё не существует. Без него классификация — это ручное чтение таблицы. **Грейд: ИСПОЛНИМО для domain default + task override; МЕТАФОРИЧНО для agent warning.**

### 2. FLUX vs BIM mode switch (§VI.1) — **ЧАСТИЧНО ИСПОЛНИМО**
Триггеры перехода ОПИСАНЫ: "FLUX → BIM: Visionary sees enough structure", "BIM → FLUX: strict failing to converge", "after N FLUX iterations (default 3) Coherencer asks circling?". У "N=3" есть числовой порог — это исполнимое условие. НО: "sees enough structure", "preventing solution" — это семантические триггеры без формального теста. Coherencer не имеет grep/parse/compute, который вернёт "switch=true". OQ-CR-4 (adoption metrics) DEFERRED v11 — то есть мы НЕ ЗНАЕМ, переходит ли кто-нибудь на FLUX в реальности. **Грейд: ИСПОЛНИМО только для счётчика итераций (N=3); остальное МЕТАФОРИЧНО до v11 эмпирики.**

### 3. Path-(c) ΔÔ acceptance (Coherencer) — **ИСПОЛНИМО**
В `roles/coherent_EN.md:37-48` дан конкретный протокол: (a) phantom coherence check fail OR phantom decoherence fail, AND (b) one glossary unification pass divergence persists, THEN accept ΔÔ ≠ 0 + verify B_received ≥ B_min via blind continuation test. Это ИСПОЛНИМО: Coherencer запускает phantom-check (§12 meta.md, "ask each agent SEPARATELY: what we doing"), считает совпадения 4+/2-3/all-different, при divergence делает glossary pass (текстовая операция), и при провале выдаёт документ "Divergence accepted: Agent X на Ô_x, Agent Y на Ô_y, оба B_received ≥ B_min". F7 blind continuation test (§III.2.5) — настоящая операция (попытка одного next step без re-ask). **Грейд: РАБОТАЕТ — операция определена, выход типизирован, интегрирован в RT-2.**

### 4. τ_cycle measurement — **МЕТАФОРИЧНО → ЧАСТИЧНО ИСПОЛНИМО (proxy)**
Invariant #17 объявляет "τ_cycle primacy", F3 формула `v_conv = α / (τ_cycle · (I(C)+ε))` использует τ_cycle как переменную. НО: НИГДЕ НЕТ ОПЕРАЦИИ, измеряющей τ_cycle в коммитах/часах/RT-итерациях. Что есть: §VI.1 говорит "RT-2 midpoint IS the primary τ_cycle control point" — то есть τ_cycle ≈ длина одного RT-цикла, но это не измерение, это интерпретация. Возможный proxy: `git log --since` + count commits between RT-1 and RT-3 = τ_cycle в коммитах. Этот proxy НЕ КОДИФИЦИРОВАН. F6 `Π_meta = S_adjusted / τ_cycle` отчитывается на RT-3 — но если у τ_cycle нет единиц измерения, Π_meta неисполним. **Грейд: формула есть, измеритель отсутствует. Чтобы поднять до РАБОТАЕТ — нужен 1-line spec "τ_cycle = N_commits between RT-1.start и RT-3.close" или "τ_cycle = wall-clock hours".**

### 5. Ω(H_hist) computation (Lambda Audit, meta.md item 9) — **РАБОТАЕТ**
Формула `Ω = min(1 + 0.15 · ln(1 + N_relevant), 2.500)`. Алгоритм исполнения В meta.md §14 item 9 ПРОПИСАН: (1) read all OTHER projects/lessons.md → filter `cross_project: true AND ended: null` → load в T2; (2) применить 4-предикат relevance filter (eradev.md §III.Omega) к task T; (3) исключить stale (freshness < 0.3); (4) посчитать N_relevant; (5) подставить в формулу; (6) report "Omega(H_hist) = X.XXX (N_relevant = N, alpha = 0.15)". Шаги 1-5 — исполнимые операции (Glob, Read, фильтр, арифметика). YELLOW при Ω > 2.0 — числовое условие. v10 activation ПРОПИСАН (§III.Omega:377). **Грейд: РАБОТАЕТ — единственный из v10-концептов с полным end-to-end оператором + reporting + threshold-alarm.**

### 6. σ-операторы paper v2 (σ_anchor / σ_conf / σ_ext) — **МЕТАФОРИЧНО**
В отчёте `v10_parallel_trajectories_v2_delta_2026-04-24.md:137` зафиксировано: "**PARTIAL** — mentioned in BIM cross-ref context in v1 analysis; NOT shipped as a framework construct. v10 framework does not name σ_anchor / σ_conf / σ_ext". OQ-PTv2-4 рекомендует **DEFER**. То есть концепты существуют в paper v2, обсуждались, но НЕ интегрированы в роль-файлы / μ-check / Validator scoring. У агентов нет инструкции "проверь output на σ_conf (cherry-picked confirmatory evidence)". Это чистый философский overhang из теоретической работы, который ждёт RT-1 на Validator scoring. **Грейд: МЕТАФОРИЧНО — концепт известен, операция отсутствует, интеграция отложена решением C27 upgrade (1-line reference в FOUNDATIONS.md, не больше).**

## Сводная таблица

| # | Концепт | Грейд | Что не хватает до РАБОТАЕТ |
|---|---|---|---|
| 1 | RIGOR_LEVEL classification | ИСПОЛНИМО (default+override) / МЕТАФОРИЧНО (agent warning) | формальный тест "AC cannot be specified" |
| 2 | FLUX vs BIM switch | ЧАСТИЧНО (счётчик N=3) / МЕТАФОРИЧНО (семантика) | OQ-CR-4 эмпирика v11 |
| 3 | Path-(c) ΔÔ acceptance | РАБОТАЕТ | — |
| 4 | τ_cycle measurement | МЕТАФОРИЧНО → ЧАСТИЧНО (proxy не закреплён) | 1-line spec единиц измерения |
| 5 | Ω(H_hist) computation | РАБОТАЕТ | — |
| 6 | σ-операторы (paper v2) | МЕТАФОРИЧНО | RT-1 на Validator scoring (DEFERRED) |

## Главный вывод (Builder RU lens)

**Из 6 концептов: 2 РАБОТАЮТ (Path-(c), Ω), 1 ИСПОЛНИМ частично (RIGOR_LEVEL default cascade), 2 ЧАСТИЧНО ИСПОЛНИМЫ proxy-уровня (FLUX switch counter, τ_cycle через RT-длину), 1 МЕТАФОРИЧЕН (σ-операторы).**

Закономерность: концепты РАБОТАЮТ когда (а) есть числовая формула + (б) пошаговый алгоритм исполнения в meta.md + (в) integration point в RT-цикле (Lambda Audit для Ω, RT-2 для path-(c)). МЕТАФОРИЧНЫ концепты, у которых формула есть, но алгоритм исполнения отсутствует (τ_cycle, σ-операторы). Это и есть **разрыв "теория → ремесло"** — главное место, где v10 платит налог за теоретический uplift из paper v2 без операционной интеграции.

**Минимальная фиксация** (без оверинжиниринга, в духе Минимального жизнеспособного объёма): 1 PR — закрепить unit для τ_cycle (commits между RT-1.start и RT-3.close ИЛИ wall-clock hours, на выбор) → это поднимает τ_cycle и Π_meta из МЕТАФОРИЧНО в ИСПОЛНИМО без новых сущностей. σ-операторы оставить в DEFERRED — корректное решение по C27 уже принято. RIGOR_LEVEL agent warning — ждать v11 эмпирики (OQ-CR-3), не форсировать регекс сейчас.

## B-check (B_text, uniform 0.25)
- F (Focus): 0.85 — прочитал builder.md + ключевые секции eradev.md (§III.2/III.3/VI.1) + coherent_EN.md path-(c) + reports/v10_parallel_trajectories_v2_delta для σ-grade.
- E (Alignment): 0.90 — output отвечает именно на 6 пунктов задачи + сводная таблица + один минимальный fix-пред.
- (1-σ): 0.85 — проверил, что не дублирую EN-Builder (anti-bloat) — фокус на operator-existence.
- Λ (Experience): 0.80 — применён принцип BL-16 (Lambda без enforcement = 0): концепт без операции = метафорично; F10 inverted-U V_practical (минимальная фиксация без overengineering).
- **B = 0.85 · 0.90 · 0.85 · 0.80 = 0.520** — выше 0.5, ANDON не сработал.
