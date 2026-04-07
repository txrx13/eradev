# EraDev v8 — META-Orchestration

## Что такое EraDev

EraDev -- фреймворк мультиагентной разработки, основанный на теории ODTOE (Observer-Dependent Theory of Everything) и принципах Toyota Production System. META-Orchestrator (Level 9) координирует пять специализированных ролей (Визионер, Аналитик, Строитель, Валидатор, Когерент) через протокол Round Table, обеспечивая коллективную когерентность выше индивидуальной.

Качество каждого агента измеряется формулой B = F * E * (1-sigma) * Lambda, где обнуление любого компонента обнуляет весь результат.

**Ключевые свойства v8:**

- **3-layer enforcement** -- CLAUDE.md (авто-загрузка) + PreToolUse hook (блокирует Edit/Write из главной сессии) + memory persistence (идентичность сохраняется между сессиями)
- **6 output types** -- META производит только: Agent calls, Decisions, Synthesis, Lessons, Reports, Check Agent. Всё остальное = нарушение.
- **Report Funnel** -- Hansei, proposals и аналитические отчёты генерируются через reports/ артефакты по meta-reflection triggers.
- **30 уроков холодного старта** (BL-1..BL-32, gaps at 23/27) -- накопленный опыт Lambda bootstrap.

---

## Структура файлов

```
eradev/
├── README.md                       # Этот файл -- входная точка (RU)
├── README_EN.md                    # Входная точка (EN)
├── CLAUDE.md                       # Auto-Bootstrap для Claude Code (3-layer enforcement)
├── LOADING_PROTOCOL.md             # Порядок загрузки файлов агентом
├── BOOTSTRAP_LESSONS.md            # 30 уроков холодного старта (BL-1..BL-32)
├── eradev.md                       # Конституция (EN): ODTOE, TPS, Round Table, формулы
├── eradev_RU.md                    # Конституция (RU)
├── glossary.md                     # Билингвальный глоссарий ODTOE -> EraDev (44 термина)
├── glossary_EN.md                  # Глоссарий (EN)
├── interfaces.md                   # Интерфейсные контракты ролей (5 схем передачи)
├── visionary.md / _EN.md           # Роль: Визионер
├── analyst.md / _EN.md             # Роль: Аналитик
├── builder.md / _EN.md             # Роль: Строитель
├── validator.md / _EN.md           # Роль: Валидатор
├── coherent.md / _EN.md            # Роль: Когерент
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
│   └── DEPLOY_PROMPT.md            # 8-шаговый deploy для новых проектов
├── projects/
│   ├── {name}/                     # Внешние проекты (config.md + lessons.md)
│   └── eradev/                     # Саморазвитие фреймворка
└── reports/
    ├── HANSEI_TEMPLATE.md          # Шаблон Hansei-рефлексии
    └── *.md                        # RT-отчёты, proposals, hansei-артефакты
```

---

## Enforcement: 3-Layer Defense (BL-30)

META-Orchestrator никогда не пишет код напрямую. Это обеспечивается тремя уровнями:

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

LOAD: eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md,
      eradev/projects/{PROJECT}/config.md, eradev/projects/{PROJECT}/lessons.md

RULES: S-tasks = Builder+Validator. M+ = 5-role RT-1. Bash: operational direct, diagnostic delegate.
KILL-TEST: first action = agent call.

Task: [описание задачи]
```

Подробные инструкции -- в guides выше. Для deploy нового проекта: `templates/DEPLOY_PROMPT.md`.

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
| `visionary.md` | Промпт Визионера: стратегия, True North, Zone Detection |
| `analyst.md` | Промпт Аналитика: декомпозиция, File Ownership, pipeline |
| `builder.md` | Промпт Строителя: реализация, Security Checklist, паттерны |
| `validator.md` | Промпт Валидатора: проверка, обратная связь, шкала диссонанса |
| `coherent.md` | Промпт Когерента: синхронизация, L1/L2/L3, Kill-Switch |
| `CLAUDE.md` | Auto-Bootstrap: 3-layer enforcement, 6 output types, KILL-TEST |
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

*EraDev v8 | 2026-04-07*
