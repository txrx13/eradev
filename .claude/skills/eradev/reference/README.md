# EraDev v10 — META-Orchestration

## Что такое EraDev

EraDev -- фреймворк мультиагентной разработки, основанный на теории ODTOE (Observer-Dependent Theory of Everything) и принципах Toyota Production System. META-Orchestrator (Level 9) координирует пять специализированных ролей (Визионер, Аналитик, Строитель, Валидатор, Когерент) через протокол Round Table, обеспечивая коллективную когерентность выше индивидуальной.

Качество каждого агента измеряется формулой B = F * E * (1-sigma) * Lambda, где обнуление любого компонента обнуляет весь результат.

**Ключевые свойства v10:**

- **3-layer runtime enforcement** -- CLAUDE.md (авто-загрузка) + PreToolUse hook (блокирует Edit/Write из главной сессии) + memory persistence (идентичность сохраняется между сессиями)
- **4-layer file architecture (v9)** -- L0 IMMUTABLE (ODTOE core) / L1 Universal roles / L2 Domain skins / L3 Project instances
- **6 output types** -- META производит только: Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent. Всё остальное = нарушение.
- **14 invariants** -- с тегами [UNIVERSAL] / [CODE-ADAPTER] для адаптации под не-кодовые домены.
- **6-step loading sequence** -- eradev.md, meta.md, BOOTSTRAP_LESSONS.md, config.md, lessons.md + условный шаг 6 (domain skin).
- **13-item session bootstrap** -- включая 5b DOMAIN (выбор модальной B-формулы).
- **Domain skins (v9)** -- 6 типов доменов: code, article, book, config, plan, research.
- **Self-loading agents (v9)** -- Invariant 12: агенты загружают свой role file самостоятельно.
- **v10 features** -- Omega(H_hist) computation, temporal decay, BL compression, Apophatic Gate, /extract skill.
- **Report Funnel** -- Hansei, proposals и аналитические отчёты генерируются через reports/ артефакты по meta-reflection triggers.
- **30 уроков холодного старта** (BL-1..BL-32, gaps at 23/27) -- накопленный опыт Lambda bootstrap.

---

## Структура файлов

```
eradev/
├── README.md                       # Этот файл -- входная точка (RU)
├── README_EN.md                    # Входная точка (EN)
├── CLAUDE.md                       # Auto-Bootstrap для Claude Code (14 invariants, 6-step loading)
├── LOADING_PROTOCOL.md             # Порядок загрузки файлов агентом
├── BOOTSTRAP_LESSONS.md            # 30 уроков холодного старта (BL-1..BL-32)
├── eradev.md                       # Конституция (EN): ODTOE, TPS, Round Table, формулы
├── eradev_RU.md                    # Конституция (RU)
├── glossary.md                     # Билингвальный глоссарий ODTOE -> EraDev (44 термина)
├── glossary_EN.md                  # Глоссарий (EN)
├── interfaces.md                   # Интерфейсные контракты ролей (5 схем передачи)
├── roles/
│   ├── visionary.md / _EN.md       # Роль: Визионер
│   ├── analyst.md / _EN.md         # Роль: Аналитик
│   ├── builder.md / _EN.md         # Роль: Строитель
│   ├── validator.md / _EN.md       # Роль: Валидатор
│   └── coherent.md / _EN.md        # Роль: Когерент
├── meta.md / meta_RU.md            # Meta-Agent: спиральная память, самомодификация
├── CHECKLIST.md / _EN.md           # Универсальный чеклист верификации
├── MEMORY_TEMPLATE.md / _EN.md     # Шаблон проектной памяти
├── .claude/
│   ├── hooks/                      # PreToolUse enforcement hook (блокирует Edit/Write)
│   └── settings.json               # Конфигурация hooks
├── docs/
│   ├── setup-claude.md             # Claude Code setup guide
│   ├── setup-cursor.md             # Cursor setup guide
│   ├── setup-codex.md              # Codex/Jules setup guide
│   └── setup-windsurf.md           # Windsurf setup guide
├── templates/
│   ├── CLAUDE.md.template          # Шаблон CLAUDE.md для проектов
│   ├── CLAUDE.md.universal         # Универсальный CLAUDE.md (без проекта)
├── projects/
│   ├── {name}/                     # Внешние проекты (config.md + lessons.md)
│   └── eradev/                     # Саморазвитие фреймворка
└── reports/
    ├── HANSEI_TEMPLATE.md          # Шаблон Hansei-рефлексии
    └── *.md                        # RT-отчёты, proposals, hansei-артефакты
```

---

## Enforcement: 3-Layer Runtime Defense (BL-30)

META-Orchestrator никогда не пишет код напрямую. Это обеспечивается тремя runtime-уровнями:

| Уровень | Механизм | Что делает |
|---------|----------|------------|
| 1. CLAUDE.md | Авто-загрузка при старте сессии | Задаёт роль, 6 output types, KILL-TEST |
| 2. PreToolUse hook | `.claude/hooks/enforce-delegation.sh` | Блокирует Edit/Write из главной сессии |
| 3. Memory persistence | MEMORY.md identity record | Сохраняет роль между сессиями |

**KILL-TEST:** Первое действие после загрузки ОБЯЗАНО быть Agent call. Если META пытается edit/write/code -- нарушение, перечитать CLAUDE.md.

---

## Быстрый старт по агентам

| Агент | Guide | Hooks | Config file |
|-------|-------|-------|------------|
| **Claude Code** | [docs/setup-claude.md](docs/setup-claude.md) | Full (Edit/Write/Bash block) | `CLAUDE.md` |
| **Cursor** | [docs/setup-cursor.md](docs/setup-cursor.md) | Text-only | `.cursorrules` |
| **Codex / Jules** | [docs/setup-codex.md](docs/setup-codex.md) | Text-only | `AGENTS.md` |
| **Windsurf** | [docs/setup-windsurf.md](docs/setup-windsurf.md) | Hooks support | `.windsurfrules` |

**Универсальный промт** (для любого агента без специфичной настройки):

```
You are the META-ORCHESTRATOR (EraDev Level 9).
You ALWAYS delegate ALL work via agent calls.

6 OUTPUT TYPES: Agent calls | Decisions | Synthesis | Lessons | Reports | Check Agent

LOAD (6 steps):
1. eradev/eradev.md  2. eradev/meta.md  3. eradev/BOOTSTRAP_LESSONS.md
4. projects/{PROJECT}/config.md  5. projects/{PROJECT}/lessons.md
6. IF domain.skin set: eradev/templates/domain_skin.{type}.md

RULES: S-tasks = Builder+Validator. M+ = 5-role RT-1. 14 invariants ([UNIVERSAL]/[CODE-ADAPTER]).
       Bash: operational direct, diagnostic delegate. Session bootstrap: 13 items (incl. 5b DOMAIN).
KILL-TEST: first action = agent call.

Task: [описание задачи]
```

Подробные инструкции -- в guides выше. Для deploy нового проекта: `docs/setup-{agent}.md` guides.

---

## Быстрый старт (для человека)

### 1. Инициализация проекта

Скопируйте файлы ядра (`eradev.md`, роли, `glossary.md`) в рабочую директорию. Создайте `projects/{name}/config.md` с описанием проекта: технологический стек, True North, известные ограничения.

### 2. Определите True North

True North -- это не цель, а направление. Сформулируйте его как идеальное состояние, к которому стремится проект. Запишите в `projects/{name}/config.md`.

### 3. Запустите Round Table (RT-1)

Все пять ролей получают одну задачу одновременно (параллельный старт). Каждый агент проходит оператор активации перед ответом:

1. **A_F (Фокус)** -- загрузить релевантные файлы
2. **A_E (Согласование)** -- сверить задачу с ИКР
3. **A_sigma (Непротиворечивость)** -- проверить на конфликты
4. **A_Lambda (Опыт)** -- прочитать MEMORY.md

### 4. Классификация задач

| Размер | Критерий | Команды | Агенты |
|--------|----------|---------|--------|
| S | <=3 файла, 1 модуль | 1 | 2 (Строитель + Валидатор) |
| M | 1 модуль, несколько файлов | 1 | 5 (полная пятёрка) |
| L | 2-3 модуля | ceil(N_modules/3) | 5 * N_teams |
| XL | 4+ модуля | ceil(N_modules/3) | 5 * N_teams + L2/L3 Когеренты |

### 5. RT Phase Protocols

| Режим | Когда | Как |
|-------|-------|-----|
| Parallel | RT-1 (расширение) | 5 Agent calls одновременно, каждый независим |
| Hybrid | RT-2 (конвергенция) | Builder + Validator параллельно, Coherencer после |
| Sequential | RT-3 (фиксация) | Последовательно: Validator -> Coherencer -> META synthesis |

Пропорция по золотому сечению: Round Table ~38% времени, Build ~62%.

### 6. Завершение цикла (RT-3)

- Заполните Hansei-шаблон (`reports/HANSEI_TEMPLATE.md`)
- Зафиксируйте 3-5 ключевых различений
- Обновите lessons.md проекта
- Оставьте спиральный зазор ~2% -- открытые вопросы для следующего витка

---

## Ссылки на файлы ядра

| Файл | Назначение |
|------|-----------|
| `eradev.md` | Конституция фреймворка: ODTOE, TPS, Round Table, формулы |
| `meta.md` | Meta-Agent: 1a (Output Spec), Sec 15 (I/O Protocol), Sec 16 (Reflection Triggers), спиральная память, самомодификация |
| `roles/visionary.md` | Промпт Визионера: стратегия, True North, Zone Detection |
| `roles/analyst.md` | Промпт Аналитика: декомпозиция, File Ownership, pipeline |
| `roles/builder.md` | Промпт Строителя: реализация, Security Checklist, паттерны |
| `roles/validator.md` | Промпт Валидатора: проверка, обратная связь, шкала диссонанса |
| `roles/coherent.md` | Промпт Когерента: синхронизация, L1/L2/L3, Kill-Switch |
| `CLAUDE.md` | Auto-Bootstrap: 14 invariants, 6-step loading, Domain Awareness, KILL-TEST |
| `BOOTSTRAP_LESSONS.md` | 30 уроков холодного старта (BL-1..BL-32) |
| `glossary.md` | Единый глоссарий терминов ODTOE -> EraDev |
| `LOADING_PROTOCOL.md` | Agent Loading Protocol: порядок загрузки файлов |

---

## Принципы

- **Мультипликативность**: B = F * E * (1-sigma) * Lambda. Ноль в любом компоненте = ноль на выходе.
- **Андон**: право и обязанность остановиться при обнаружении проблемы.
- **Hansei**: рефлексия процесса, а не результата. Не "код плохой", а "почему процесс привёл к плохому коду".
- **Yokoten**: урок из одного инцидента обобщается на все аналогичные случаи.
- **Спиральный зазор**: каждый цикл оставляет ~2% незамкнутости, питающей следующий виток.
- **Defense-in-Depth**: одного уровня enforcement недостаточно (BL-30). Всегда минимум 3 слоя.

---

*EraDev v10 | 2026-04-12*
