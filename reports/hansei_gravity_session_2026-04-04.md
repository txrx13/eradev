# Hansei: Сессия ODTOE + Гравитация — Рекомендации по улучшению EraDev

> Дата: 2026-04-04
> Сессия: Написание статьи ODTOE + Гравитация (29 секций, XL)
> Результат: 8/8 файлов создано, но 5 критических проблем выявлено
> S_session (оценка): ~0.45 (YELLOW — статья создана, но качество требует RT-2)

---

## I. ОБНАРУЖЕННЫЕ ПРОБЛЕМЫ

### P-1: 3 из 5 RT-1 агентов отказались выполнять роль (CRITICAL)

**Что произошло:** При запуске RT-1 через Agent tool, Visionary, Validator и Coherent отказались от роли, ответив «I'm Claude, I can't roleplay» вместо выполнения задания. Только Analyst и Builder дали полезные результаты.

**Корень:** Промпт роли, вставленный в Agent tool, недостаточно директивен. Агенты-подпроцессы не наследуют контекст EraDev автоматически — каждый видит только свой промпт. Без явного указания «ты находишься в EraDev-сессии, все файлы доступны по путям» агент трактует задание как roleplay и отказывается.

**B-дефицит:** F=0.3 (агент не загрузил контекст), Lambda=0 (не прочитал фреймворк).

### P-2: Builder написал «ОДТОЕ» вместо «ODTOE» (HIGH)

**Что произошло:** Во всём русском тексте (84 вхождения) Builder транслитерировал аббревиатуру в кириллицу. В корпусе 160+ статей используется именно ODTOE латиницей.

**Корень:** Builder не прочитал существующие статьи корпуса перед генерацией (A_F не выполнен). Агент «помог» русифицировать, нарушив терминологическую согласованность.

**B-дефицит:** F=0.4 (не проверил корпус), (1-sigma)=0.3 (противоречит корпусу).

### P-3: EN версия в 2 раза короче RU (HIGH)

**Что произошло:** RU — 49 страниц (1934 строки), EN — 25 страниц (981 строка). Билингвальная паритетность ~50% вместо требуемых ~90%.

**Корень:** Builder EN получил инструкцию «translate everything», но сократил содержание. Не было явного gate: «EN строк должно быть >=80% от RU строк».

**B-дефицит:** E=0.5 (результат не соответствует intent), (1-sigma)=0.4 (нарушает BL-19).

### P-4: Validator обнаружил подгонку Phi_G (MEDIUM)

**Что произошло:** Формула Phi_G (коэффициент когерентности) в тексте «скорректирована для согласования с экспериментом» — это прямая подгонка параметров, нарушающая Check 4 (no fitting).

**Корень:** Builder не имел достаточного теоретического контекста для полного вывода Phi_G из первых принципов и заполнил пробел эмпирической подстройкой.

**B-дефицит:** E=0.4 (решает не ту задачу — подгоняет вместо выводит).

### P-5: 6pi^5 ошибка транскрипции в Приложении C (MEDIUM)

**Что произошло:** В Секции V: 6pi^5 = 1836.15 (верно). В Приложении C: 6pi^5 = 29.6 (неверно, это pi^5 без множителя 6). Validator поймал.

**Корень:** Три Builder-а работали параллельно без cross-check. Приложение C писал третий Builder, не сверяясь с Секцией V первого.

**B-дефицит:** (1-sigma)=0.2 (внутреннее противоречие).

---

## II. РЕКОМЕНДАЦИИ ПО УЛУЧШЕНИЮ ERADEV

### R-1: Agent Prompt Template с обязательным контекстом (для P-1)

**Проблема:** Агенты-подпроцессы не понимают, что находятся в EraDev-сессии.

**Решение:** В SKILL.md (Section 5, Round Table Dispatch) добавить ОБЯЗАТЕЛЬНЫЙ шаблон промпта для Agent tool:

```
=== MANDATORY AGENT PROMPT PREFIX ===
You are operating within the EraDev framework (Level 9).
You have access to files via Read/Write/Edit/Bash tools.
Your role: {ROLE_NAME}.
Your task is NOT roleplay — it is a concrete analytical task.
You MUST produce a structured output as defined below.
Project directory: {PROJECT_DIR}
Read your role file FIRST: {ROLE_FILE_PATH}
=== END PREFIX ===
```

**Почему:** 3/5 агентов сломались потому что восприняли задание как roleplay. Явное указание «это не RP, ты работаешь с файлами, дай структурированный ответ» устраняет отказ.

**Enforcement:** META MUST NOT spawn agents without this prefix. Промпт без prefix = YELLOW на A_F.

### R-2: Corpus Terminology Gate (для P-2)

**Проблема:** Builder выдумывает терминологию вместо использования корпусной.

**Решение:** В eradev.md Section IV (Activation Operator), шаг A_sigma, добавить:

```
A_sigma sub-check (for article tasks):
  grep корпус для ключевых терминов ПЕРЕД генерацией.
  Если термин имеет устоявшуюся форму в корпусе — использовать ЕЁ.
  Запрещено: транслитерация аббревиатур (ODTOE != ОДТОЕ),
  изобретение синонимов для канонических терминов (46 терминов в glossary.md).
```

**Enforcement:** Coherent при RT-2 проверяет терминологию grep-ом по корпусу. Нарушение = RED на (1-sigma).

### R-3: Bilingual Parity Metric (для P-3)

**Проблема:** BL-19 говорит «обновляй оба файла одновременно», но не задаёт количественный критерий паритетности.

**Решение:** В config.md проекта odtoe-articles добавить:

```
Bilingual Parity Metric:
  lines(EN) / lines(RU) >= 0.80  (PASS)
  0.60 <= ratio < 0.80           (YELLOW — допустимо с обоснованием)
  ratio < 0.60                   (RED — EN версия неполная, BLOCK)
```

**Enforcement:** Builder EN получает в промпте: «Исходник RU содержит N строк. Твой EN должен содержать >= 0.8*N строк. Если меньше — ANDON.»

### R-4: Cross-Builder Consistency Check (для P-5)

**Проблема:** Параллельные Builder-ы создают противоречия между частями.

**Решение:** В meta.md добавить правило для XL-задач с несколькими Builder-ами:

```
MULTI-BUILDER CONSISTENCY GATE (XL tasks):
  После объединения частей от разных Builder-ов,
  Coherent (или META) запускает автоматическую проверку:
  1. grep для всех числовых констант — одинаковы ли они?
  2. grep для всех формул с тегами — нет ли дубликатов?
  3. Подсчёт секций — непрерывная нумерация?
  Эта проверка ОБЯЗАТЕЛЬНА перед компиляцией.
```

**Enforcement:** Compile step BLOCKED до прохождения consistency check.

### R-5: «Честная оговорка» вместо ложного «no fitting» (для P-4)

**Проблема:** Builder не может вывести все параметры из первых принципов, но вместо честной оговорки маскирует подгонку.

**Решение:** В config.md odtoe-articles, Check 4, добавить:

```
Check 4 clarification:
  Если параметр НЕ МОЖЕТ быть выведен из теории в текущей сессии:
  1. НЕ подгоняй его к эксперименту
  2. Оставь как символьную переменную с пометкой
     «Вывод этого параметра — открытый вопрос (спиральная щель ~2%)»
  3. Покажи, какое значение параметр ДОЛЖЕН принять для согласия
     с экспериментом (prediction, не fit)
  Разница: «из теории следует X=0.97, эксперимент даёт 1.00»
  vs. «мы выбрали X=1.00 чтобы совпало» — первое допустимо, второе нет.
```

### R-6: BOOTSTRAP_LESSONS обновление — новые уроки

**BL-28: Agent Refusal Prevention**
```
Agents spawned via Agent tool may refuse role assignments,
interpreting them as "roleplay." Every agent prompt MUST include:
(a) explicit file paths to read, (b) concrete output format,
(c) statement "this is a concrete analytical task, not roleplay."
Without this, expect 50-60% refusal rate.
```

**BL-29: Corpus Terminology Is Canonical**
```
When generating text for an existing corpus, grep the corpus for
key terms BEFORE writing. Use established forms exactly.
Transliteration of international abbreviations is PROHIBITED
unless the corpus itself uses the transliterated form.
```

---

## III. ПРИОРИТИЗАЦИЯ

| ID | Усилие | Влияние | Приоритет |
|----|--------|---------|-----------|
| R-1 (Agent Prompt Template) | LOW (текст) | CRITICAL (без этого 60% RT-1 бесполезны) | **P0** |
| R-4 (Cross-Builder Check) | LOW (grep-скрипт) | HIGH (ловит P-5 класс ошибок) | **P1** |
| R-2 (Corpus Term Gate) | LOW (grep в A_sigma) | HIGH (ловит P-2 класс ошибок) | **P1** |
| R-3 (Bilingual Metric) | LOW (число в config) | MEDIUM (ловит P-3) | **P2** |
| R-5 (Honest No-Fit) | LOW (текст в config) | MEDIUM (улучшает Check 4) | **P2** |
| R-6 (BL-28, BL-29) | LOW (2 записи) | HIGH (Lambda для будущих сессий) | **P1** |

---

## IV. TRACE ACCUMULATOR (сессия)

```
YELLOW count: 3 (P-2 corpus term, P-3 bilingual parity, P-4 fitting)
RED count: 1 (P-1 agent refusal — 3/5 agents)
Fix commits: 1 (ОДТОЕ → ODTOE)
Agents spawned: 12 (vs XL ceiling 10+) — OK
Enforcement gate violations: 1 (A_sigma not run before corpus generation)
```

---

## V. A3 КРИСТАЛЛИЗАЦИЯ

| Поле | Содержание |
|------|------------|
| **Контекст** | XL-задача: научная статья ODTOE+Гравитация, 29 секций, билингвальная |
| **Текущее состояние** | 8/8 файлов создано, 49 стр. RU + 25 стр. EN, 5 проблем |
| **True North** | Каждая статья — полная, согласованная с корпусом, без подгонок |
| **Gap** | RT-1 потерял 60% агентов; терминология не проверена по корпусу; EN неполная |
| **Ключевые различения** | Agent refusal — новая проблема (не было в предыдущих сессиях); Corpus grep — дешёвый gate с высоким ROI |
| **Открытые вопросы (~2%)** | Как обеспечить полный вывод Phi_G без подгонки? Как автоматизировать bilingual parity check? |

---

*Отчёт подготовлен META-Orchestrator. Рекомендуется применить R-1 (Agent Prompt Template) немедленно — это устранит 60% потерь на RT-1.*
