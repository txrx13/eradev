# Meta-Agent Виток 7 — Глубокая саморефлексия

**Дата**: 2026-04-02
**Сессия**: ~80 коммитов, ~5000+ строк, ~80 агентов запущено
**Фокус**: deploy resilience, TX deduplication, PWA Phase 3-6, gossip, monitoring

---

## 1. Количественный анализ

### Fix Rate

| Тип | Кол-во | % |
|-----|--------|---|
| feat | 26 | 32.5% |
| fix | 42 | 52.5% |
| docs | 3 | 3.75% |
| meta | 3 | 3.75% |
| revert | 2 | 2.5% |
| refactor/chore/debug | 4 | 5.0% |
| **Итого** | **80** | |

**Fix Rate = (42 fix + 2 revert) / 80 = 55%**

### Тренд по виткам

| Виток | Fix rate | Тренд |
|-------|----------|-------|
| 5 | ~52% | baseline |
| 6 | 45.9% | улучшение |
| **7** | **55%** | **регресс** |

### Fix Chains (3+ fix подряд)

| Chain | Тема | Длина | Root cause |
|-------|------|-------|-----------|
| 1 | PWA scroll | 8 fix + 1 revert = 9 | CSS/scroll listeners без кросс-браузерного теста |
| 2 | TX dedup | 10 fix | addressbypublickey не существует (hallucination) |
| 3 | Deploy/gossip | 7 fix | stale-binary, gossip stuck, double-build |
| 4 | Persona registrar | 1 feat + 1 revert | flow не прошёл проверку |

**35 из 42 fix (83%) приходятся на 4 кластера.** Остальные 7 fix — единичные.

---

## 2. Классификация инцидентов по ODTOE

### Таблица инцидентов

| # | Инцидент | Коммитов | Root cause | ODTOE=0 |
|---|----------|----------|-----------|---------|
| 1 | PWA scroll freeze | 9 | overflow-x:hidden на html ломает sticky; rAF polling 3с; backdrop-blur + translate = Chrome artifact | F=0, Lambda=0 |
| 2 | Server dedup: addressbypublickey | 5 | Endpoint не существует в Erachain API. Builder hallucinated | F=0 |
| 3 | broadcastWithRetry 7+ нод | 3 | Erachain broadcast64 не идемпотентен, multi-node = дубликаты | sigma=high |
| 4 | .next/ удаление при build | 2 | os.Rename(.next, .next.bak) ПЕРЕД build убивает static assets | F=0 |
| 5 | eradeploy stale-binary loop | 4 | Execute() не проверял NeedsBuild() без нового коммита + autodeploy/eradeploy hash конфликт | Lambda=0 |
| 6 | gossip deploying stuck | 3 | Нет defer на deploying=false, race condition, нет immediate broadcast | E=0 |
| 7 | Stale-rebuild double-build | 2 | Hash записывался до build, pnpm install менял файлы | sigma=high |
| 8 | Notification dialog без dedup | 3 | Dedup добавили в publish/page.tsx но не в new-publication-dialog.tsx | Lambda=0 (Yokoten) |
| 9 | Deploy badge stale | 2 | deploying flag в gossip не обновлялся при success | E=0 |

### Статистика дефицитов

| Компонент ODTOE | Инцидентов | Описание |
|-----------------|------------|----------|
| **F=0** (Focus/hallucination) | **3** | Builder уверенно использует несуществующие API/свойства |
| **Lambda=0** (Memory ignored) | **3** | Записанные уроки не читаются перед реализацией |
| **sigma=high** (Inconsistency) | **2** | Противоречия в pipeline (хотели надёжность, получили дубликаты) |
| **E=0** (Alignment) | **2** | Тесты покрывали happy path, не error/restart paths |

### B-формула для каждого инцидента

```
B = F × E × (1-sigma) × Lambda

Инцидент 1 (PWA scroll):    B = 0 × 0.8 × 0.7 × 0   = 0 (F=0 + Lambda=0)
Инцидент 2 (addressbypublickey): B = 0 × 0.9 × 0.9 × 0.5 = 0 (F=0 hallucination)
Инцидент 3 (multi-node dup): B = 0.7 × 0.7 × 0.3 × 0.5 = 0.07 (sigma=0.7)
Инцидент 4 (.next deletion): B = 0 × 0.8 × 0.8 × 0.3 = 0 (F=0)
Инцидент 5 (stale loop):    B = 0.5 × 0.7 × 0.5 × 0   = 0 (Lambda=0)
Инцидент 6 (gossip stuck):  B = 0.7 × 0 × 0.8 × 0.5  = 0 (E=0 no edge test)
Инцидент 7 (double-build):  B = 0.5 × 0.7 × 0.3 × 0.5 = 0.05 (sigma=0.7)
Инцидент 8 (dialog no dedup): B = 0.8 × 0.8 × 0.8 × 0 = 0 (Lambda=0 Yokoten)
Инцидент 9 (badge stale):   B = 0.7 × 0 × 0.8 × 0.5  = 0 (E=0 no lifecycle test)
```

**7 из 9 инцидентов имеют B=0.** Один нулевой компонент убивает когерентность полностью.

---

## 3. Анализ процесса пятёрки

### Успешные задачи (0 fix, 58% feat)

| Задача | Почему 0 fix |
|--------|-------------|
| Comments 120s cooldown + auto-refresh | Изолированный UI, нет внешних API |
| PWA Phase 1 (dialogs, keyboard) | Foundation first, RT-3 synthesis |
| Mobile Profile (Phase 3) | useIsMobile pattern уже отлажен |
| Deploy dashboard | Новая страница, нет legacy dependencies |
| EraDev MEMORY.md, scaling.md | Документация, нет кода |
| Certify person dialog | Новый компонент, существующий buildIssuePersonFromBytecode |
| Collapse duplicates UI | Чистая утилита + компонент, нет external API |

**Паттерн успеха:**
1. Изолированные модули (LOW coupling)
2. Нет взаимодействия с внешними API (browser scroll, Erachain endpoints, deploy pipeline)
3. Использование СУЩЕСТВУЮЩИХ проверенных функций (не создание новых API calls)
4. Foundation-first approach (RT-3 synthesis перед кодом)

### Провальные задачи (3+ fix)

| Задача | Fix chain | Почему провал |
|--------|-----------|---------------|
| PWA scroll/transitions | 9 | Browser scroll API quirks не исследованы |
| TX deduplication | 10 | addressbypublickey hallucination, multi-node broadcast |
| Deploy pipeline | 7 | .next deletion, hash mismatch, gossip race conditions |
| Person registrar | 2 | Protected flow не тестировался E2E |

**Паттерн провала:**
1. Взаимодействие с ВНЕШНИМИ системами (browser API, Erachain API, systemd)
2. **Предположения вместо проверки** (F=0 — ключевая проблема)
3. Happy-path тестирование (E=0 — error/restart paths не покрыты)
4. Big bang коммиты (MP12 нарушен — Phase 3-6 в одном коммите)
5. **Yokoten failure** — fix не распространяется на аналогичные места

### Проигнорированные уроки из памяти

| Урок | Нарушение |
|------|-----------|
| MP2 "Fix chain = отсутствие specification" | PWA scroll chain (9), dedup chain (10) |
| MP11 "Fix chain > 3 = STOP + specification" | Нарушено 3 раза |
| MP12 "Big bang multi-phase = revert risk" | Phase 3-6 в одном коммите |
| Урок 2 "Hash comparison перед restart" | eradeploy stale-binary loop |
| Урок 22 "Не дублируй browser API" | responsive-dialog scroll lock |
| BL-6 "Verify Before Act" | addressbypublickey hallucination |
| BL-13 "Yokoten" | Dedup не распространили на notification dialog |

---

## 4. Анализ Мета-Оркестратора

### Quick fix без пятёрки

**~20 fix-коммитов** выглядят как прямые правки Мета-Оркестратором без RT:
- `fix: mobile drawer Сообщество → /blockchain?tab=persons` — 1 строка, допустимо (S-задача)
- `fix: rename to 'Верифицировать чужую персону'` — 1 строка, допустимо
- `fix(dedup): server-side check now works` — 4 файла, сложная логика — НЕ допустимо без пятёрки
- `fix(deploy): stop deleting .next/` — критический файл, изменение build pipeline — НЕ допустимо
- `debug(dedup): add console.log` — debug коммит в production — НЕДОПУСТИМО

**Оценка**: ~8 fix-коммитов были M-размера и требовали минимум Builder + Validator, но были сделаны Мета-Оркестратором напрямую.

### Big bang коммиты

| Коммит | Размер | Нарушение |
|--------|--------|-----------|
| `80e5987 feat(pwa): Phase 3-6` | 16 файлов, +1418 строк | MP12: max 2 фазы за коммит |
| `a7db5c6 feat(deploy): Phase 2-5` | 14 файлов, +1704 строк | Без RT-2 midpoint |
| `e4a5d75 feat(dedup): Wave 1` | 7 файлов, +544 строк | OK — 3 изолированных команды |

### File Ownership нарушения

`publish/page.tsx` модифицировался **7 раз** разными "командами" и прямыми правками. Это самый нестабильный файл сессии. Нужен dedicated owner.

---

## 5. Предложения по улучшению

### 5.1 Новые pipeline gates

#### PRE-FLIGHT GATE (перед RT-1 для задач с external API)

```
КОГДА: задача использует Erachain API, browser API, systemd, deploy pipeline
КТО: Аналитик
ЧТО:
  1. Список ВСЕХ external endpoints которые будет использовать Builder
  2. Для каждого endpoint: curl подтверждение что он существует и возвращает ожидаемый формат
  3. Для browser API: caniuse.com проверка поддержки в Chrome + Safari + Яндекс
  4. Результат: "VERIFIED ENDPOINTS" документ который Builder ОБЯЗАН использовать
БЛОКИРУЕТ: если endpoint не подтверждён — Builder не имеет права его использовать

Предотвратило бы: инциденты #1 (scroll API), #2 (addressbypublickey), #4 (.next/ behavior)
```

#### SMOKE TEST GATE (после Builder, перед commit)

```
КОГДА: задача затрагивает deploy, eraweb, eradeploy, или server-side API
КТО: Валидатор
ЧТО:
  1. SSH на реальную ноду (не localhost)
  2. Проверить что endpoint отвечает ожидаемо
  3. Проверить error path: что происходит при 500, timeout, restart?
  4. Результат: "SMOKE TEST PASSED" с логами проверки
БЛОКИРУЕТ: без smoke test — commit не допускается для server-side кода

Предотвратило бы: инциденты #4 (.next), #5 (stale-binary), #6 (gossip), #9 (badge)
```

#### YOKOTEN GATE (после fix, перед commit)

```
КОГДА: любой fix-коммит
КТО: Когерент
ЧТО:
  1. "Есть ли аналогичные места в коде где тот же баг может существовать?"
  2. grep по кодовой базе для аналогичных паттернов
  3. Если найдены — fix ОБЯЗАН покрыть все
БЛОКИРУЕТ: одиночный fix без yokoten = неполный коммит

Предотвратило бы: инцидент #8 (dialog без dedup)
```

### 5.2 Правила для builder.md

```markdown
## Паттерны Витка 7

### P24: PRE-FLIGHT API CHECK
Перед ЛЮБЫМ вызовом внешнего API (Erachain, browser API, третьи стороны):
1. Подтверди что endpoint СУЩЕСТВУЕТ (curl на реальной ноде)
2. Подтверди формат ответа (JSON structure, поля, типы)
3. Документируй: "Endpoint: /api/X, verified on node Y, returns {Z}"
Код на предположениях = F=0 = весь B обнуляется.
**Нарушение = addressbypublickey инцидент (5 fix-коммитов на несуществующий endpoint).**

### P25: SINGLE-RESPONSIBILITY COMMIT
Один коммит = одна фаза = один модуль. НИКОГДА "Phase 3-6" в одном коммите.
Если задача > 1 фазы — отдельный коммит на каждую.
**Нарушение = невозможность точного revert. PWA Phase 3-7 revert затронул 16 файлов.**

### P26: NO DEBUG IN PRODUCTION
console.log для отладки — ТОЛЬКО в dev ветке. Если нужна отладка на production:
1. Используй structured logging (slog в Go, server-side в Next.js)
2. НЕ коммить console.log/console.warn в main
**Нарушение = debug(dedup) коммит загрязнил production код.**

### P27: BUILD PIPELINE AWARENESS
При изменении build/deploy кода — ОБЯЗАТЕЛЬНО смоделировать:
1. Что происходит с файлами СТАРОГО билда пока идёт НОВЫЙ build?
2. Что видит клиент в момент build? В момент restart?
3. Что если build fails — откат работает?
**Нарушение = .next/ deletion = серый экран 10-30с на каждой ноде.**

### P28: ERROR PATH COVERAGE
Для network/deploy/gossip кода — ОБЯЗАТЕЛЬНО покрыть:
1. Happy path: всё работает
2. Error path: endpoint вернул 500
3. Timeout path: endpoint не ответил за 5с
4. Restart path: сервис перезапустился во время операции
5. Partial failure: часть нод приняли, часть нет
**Нарушение = gossip deploying stuck (3 бага в error paths).**
```

### 5.3 Правила для validator.md

```markdown
## Паттерны Витка 7

### P20: EXTERNAL API GATE
Перед review — убедись что ВСЕ внешние вызовы протестированы на реальном endpoint:
- Erachain: `curl -s http://node:9057/api/...` подтвержди ответ
- Browser API: проверь caniuse для Chrome + Safari + Яндекс
- Deploy: проверь что systemctl/drain работает на реальной ноде
Непроверенный external call = BLOCK.
**Предотвращает: addressbypublickey (5 fix), scroll API (9 fix).**

### P21: EDGE CASE MATRIX
Для deploy/network/gossip кода — обязательная проверка матрицы:
| Сценарий | Проверен? |
|----------|-----------|
| Success (happy path) | |
| Error (500/exception) | |
| Timeout (no response) | |
| Restart (mid-operation) | |
| Partial failure | |
Если Builder проверил только happy path — BLOCK + потребовать test cases.
**Предотвращает: gossip stuck (3 fix), stale-rebuild (2 fix).**

### P22: YOKOTEN CHECK
При ЛЮБОМ fix — обязательный вопрос:
"Есть ли аналогичные места в коде где тот же баг может существовать?"
Выполни: grep по кодовой базе для аналогичного паттерна.
Если найдены аналоги — fix ОБЯЗАН покрыть все.
**Предотвращает: dialog без dedup (3 fix), unconfirmed TX без collapse.**
```

### 5.4 Правила для coherent.md

```markdown
## Паттерны Витка 7

### P15: SCOPE ALARM
Если Builder-коммит затрагивает >3 файла из разных модулей — АНДОН.
Потребовать декомпозицию: один коммит per модуль.
Big bang commit (>10 файлов) = красная карта.
**Предотвращает: Phase 3-6 big bang (16 файлов, +1418 строк, revert).**

### P16: LAMBDA AUDIT на RT-1
Перед стартом КАЖДОЙ задачи — Когерент ОБЯЗАН:
1. Прочитать 3 наиболее релевантных урока из MEMORY.md
2. Прочитать 2 наиболее релевантных мега-паттерна
3. Озвучить в RT-1: "Уроки X, Y, Z применимы к этой задаче"
Если Builder не может назвать ни одного урока — Lambda=0, STOP.
**Предотвращает: 3 инцидента с Lambda=0 в этой сессии.**

### P17: FIX-TO-SPEC ESCALATION
Если в текущей задаче уже 3+ fix-коммита — Когерент объявляет АНДОН:
1. СТОП любой реализации
2. Builder пишет СПЕЦИФИКАЦИЮ (не код)
3. Спецификация проходит RT-review
4. Только после review — продолжение реализации
**Предотвращает: PWA chain (9), dedup chain (10), deploy chain (7).**
```

### 5.5 Правила для MEMORY.md (Мета-Оркестратор)

```markdown
## Железные правила (добавить)

7. **ZERO QUICK-FIX**: Мета-Оркестратор НЕ делает fix напрямую.
   ЛЮБОЙ fix ≥ M-размера проходит через Builder + Validator.
   S-задачи (1-3 строки, 1 файл): допускается без RT.

8. **PRE-FLIGHT для external API**: перед RT-1 Аналитик проверяет
   curl-ом что каждый endpoint существует.

9. **SMOKE TEST для server-side**: после Builder Валидатор проверяет
   на реальной ноде через SSH.

10. **MAX 2 ФАЗЫ ЗА КОММИТ**: MP12 enforcement. Когерент блокирует
    при >3 файлах из разных модулей.
```

### 5.6 Правила для meta.md (Meta-Agent)

```markdown
## Enforcement (добавить)

### RULE: COMMIT REVIEW GATE
Мета-Оркестратор ПЕРЕД каждым commit проверяет:
1. Сколько файлов изменено? (>5 = требуется RT-2 review)
2. Есть ли external API calls? (да = требуется PRE-FLIGHT подтверждение)
3. Затрагивает ли deploy pipeline? (да = требуется SMOKE TEST)
4. Это fix chain (3+ fix на одну тему)? (да = СТОП + specification)

### RULE: FIX RATE MONITORING
После каждых 10 коммитов — подсчитать fix rate за последние 10.
- < 30% = GREEN (здоровый процесс)
- 30-50% = YELLOW (нужен review процесса)
- > 50% = RED (СТОП. Meta reflection обязателен перед продолжением)

### RULE: HALLUCINATION PREVENTION
Для КАЖДОГО external endpoint в коде Builder:
1. Аналитик подтвердил curl-ом? [Y/N]
2. Формат ответа задокументирован? [Y/N]
3. Error handling покрывает 404/500/timeout? [Y/N]
Если хоть один [N] — commit заблокирован.
```

---

## 6. Диаграмма улучшенного pipeline

```
ЗАДАЧА ОТ ПОЛЬЗОВАТЕЛЯ
        │
        ▼
[Мета-Оркестратор: классификация S/M/L/XL]
        │
        ├─ S (≤3 строки): Builder + Validator
        │
        ├─ M/L/XL:
        │       │
        │       ▼
        │   [PRE-FLIGHT GATE] ← НОВЫЙ
        │       │ Аналитик: curl каждый endpoint
        │       │ Аналитик: caniuse для browser API
        │       │ Результат: VERIFIED ENDPOINTS list
        │       │
        │       ▼
        │   [RT-1: все 5 ролей]
        │       │ Когерент: LAMBDA AUDIT (3 урока + 2 MP)
        │       │ Визионер: стратегия + риски
        │       │ Аналитик: план + file ownership
        │       │ Строитель: сложности
        │       │ Валидатор: edge case matrix
        │       │
        │       ▼
        │   [BUILD: Строители]
        │       │ P24: только VERIFIED endpoints
        │       │ P25: 1 commit = 1 phase
        │       │ P26: no debug in production
        │       │ P27: build pipeline awareness
        │       │ P28: error path coverage
        │       │
        │       ▼
        │   [VALIDATION]
        │       │ P20: external API gate
        │       │ P21: edge case matrix check
        │       │ P22: yokoten check
        │       │
        │       ▼
        │   [SMOKE TEST GATE] ← НОВЫЙ
        │       │ Валидатор: SSH на реальную ноду
        │       │ Проверить: endpoint отвечает?
        │       │ Проверить: error path?
        │       │
        │       ▼
        │   [COMMIT REVIEW GATE] ← НОВЫЙ
        │       │ Мета-Оркестратор:
        │       │   files > 5? → RT-2 review
        │       │   external API? → PRE-FLIGHT confirmed?
        │       │   deploy pipeline? → SMOKE TEST passed?
        │       │   fix chain > 3? → STOP + specification
        │       │
        │       ▼
        │   [COMMIT + PUSH]
        │       │
        │       ▼
        │   [YOKOTEN GATE] ← НОВЫЙ (для fix-коммитов)
        │       │ Когерент: аналогичные места?
        │       │ Если да → fix ALL, не один
        │       │
        │       ▼
        │   [RT-3: go/no-go]
        │
        ▼
    DEPLOY
```

---

## 7. Метрики для отслеживания

| Метрика | Текущее | Цель (Виток 8) | Как измерить |
|---------|---------|----------------|-------------|
| Fix rate | 55% | < 40% | git log --oneline \| grep -c fix / total |
| Fix chain max | 10 | < 3 | Подсчёт подряд идущих fix на одну тему |
| F=0 инцидентов | 3 | 0 | PRE-FLIGHT gate + curl verification |
| Lambda=0 инцидентов | 3 | 0 | LAMBDA AUDIT в RT-1 |
| Big bang коммитов | 2 | 0 | Scope alarm (>5 файлов = block) |
| Quick fix без RT | ~8 | 0 | ZERO QUICK-FIX rule |
| Smoke test coverage | 0% | 100% server tasks | SMOKE TEST gate |
| Yokoten misses | 2 | 0 | YOKOTEN gate после fix |

---

## 8. Приоритет внедрения

| # | Что | Влияние | Усилие | Приоритет |
|---|-----|---------|--------|-----------|
| 1 | PRE-FLIGHT GATE | Устраняет F=0 (3 инцидента) | Добавить шаг в RT-1 | **P0 — немедленно** |
| 2 | LAMBDA AUDIT | Устраняет Lambda=0 (3 инцидента) | Когерент зачитывает уроки | **P0 — немедленно** |
| 3 | FIX-TO-SPEC ESCALATION | Останавливает fix chains | MP11 enforcement | **P0 — немедленно** |
| 4 | SMOKE TEST GATE | Ловит server bugs до deploy | SSH проверка на ноде | **P1 — эта сессия** |
| 5 | YOKOTEN GATE | Распространяет fix на аналоги | grep + review | **P1 — эта сессия** |
| 6 | COMMIT REVIEW GATE | Блокирует big bang + quick fix | Чеклист перед commit | **P1 — эта сессия** |
| 7 | P24-P28 в builder.md | Правила для Builder | Обновление промптов | **P2 — следующая сессия** |
| 8 | P20-P22 в validator.md | Правила для Validator | Обновление промптов | **P2 — следующая сессия** |
| 9 | P15-P17 в coherent.md | Правила для Coherent | Обновление промптов | **P2 — следующая сессия** |

---

## 9. Вывод

**Система улучшается в архитектуре но деградирует в процессе.** EraDev framework зрелый (5 ролей, RT, ODTOE, scaling), но enforcement отсутствует. Правила существуют в .md но не выполняются. Fix rate 55% = каждый второй коммит — исправление ошибки.

**Корневая причина регресса**: увеличение scope задач (deploy pipeline + blockchain API + PWA) при сохранении того же уровня проверки. Чем сложнее задача — тем больше внешних зависимостей — тем выше вероятность F=0 (hallucination) без PRE-FLIGHT.

**Ключевой инсайт**: 58% feat с 0 fix vs 4 кластера с 83% всех fix. Разница = наличие/отсутствие внешних зависимостей. Pipeline должен быть СТРОЖЕ для задач с external API и СВОБОДНЕЕ для изолированных UI задач.

**Три действия которые снизят fix rate с 55% до <35%:**
1. PRE-FLIGHT GATE (устраняет F=0)
2. LAMBDA AUDIT (устраняет Lambda=0)
3. FIX-TO-SPEC ESCALATION (останавливает fix chains)
