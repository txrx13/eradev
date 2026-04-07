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

## Bootstrap -- запуск агента

### Автоматический (Claude Code) -- РЕКОМЕНДУЕТСЯ

CLAUDE.md уже находится в корне репозитория. Bootstrap срабатывает **автоматически** при каждой сессии Claude Code. Пользователь просто пишет задачу -- без копирования промптов.

### Для новых проектов -- DEPLOY_PROMPT.md

Вставьте содержимое `templates/DEPLOY_PROMPT.md` в новую сессию Claude Code в корне целевого проекта. Скрипт выполнит 8 шагов:

1. Clone/update eradev
2. Создать AGENTS.md (универсальный -- Codex, Jules, Cursor, Windsurf, Aider)
3. Установить CLAUDE.md
4. Создать .cursorrules (Cursor)
5. Создать enforcement hooks + settings.json (Claude Code + Windsurf)
6. Создать project skeleton (config.md + lessons.md)
7. Сохранить META identity в memory
8. Вывести checklist подтверждения

---

### Ручной (Cursor, Codex, Jules, Windsurf, любые LLM)

Вставьте содержимое `templates/AGENTS.md.template` как system prompt или rules file. Или используйте промт ниже:

```
You are the META-ORCHESTRATOR (EraDev Level 9).
You ALWAYS delegate ALL work via agent calls.

6 OUTPUT TYPES (nothing else):
Agent calls | Decisions | Synthesis | Lessons | Reports | Check Agent

LOAD:
1. eradev/eradev.md
2. eradev/meta.md
3. eradev/projects/{PROJECT}/config.md
4. eradev/projects/{PROJECT}/lessons.md
5. eradev/BOOTSTRAP_LESSONS.md

RULES:
- S-tasks: Builder + Validator. M+: 5-role team (V/A/B/Val/C).
- M+ ALWAYS through RT-1 before implementation.
- Bash: operational (git, ls, cp) = direct. Diagnostic (grep, curl, ssh, jq) = delegate.
- Agent descriptions start with [ROLE] tag.
- KILL-TEST: first action = agent call. edit/code = VIOLATION.

PERSIST: Save META identity + 6 output types + Bash classification to memory.
Classify → RT-1 (if M+) → Build (delegated) → RT-2 → RT-3.

Task: [описание задачи]
```

Замените `{PROJECT}` на имя проекта. Без проекта — уберите шаги 3-4 из LOAD.

---

## Обновление EraDev в существующем проекте

Вставьте этот промт в активную сессию проекта:

```
Обнови eradev инструкции:
1. cd eradev && git pull origin main && cd ..
2. Sync hooks: cp eradev/.claude/hooks/*.sh .claude/hooks/ && chmod +x .claude/hooks/*.sh
3. Sync settings: cp eradev/.claude/settings.json .claude/settings.json
4. Прочитай eradev/CLAUDE.md — сверь 6 output types и 10 invariants
5. Прочитай eradev/eradev.md, eradev/meta.md, eradev/BOOTSTRAP_LESSONS.md
6. Прочитай eradev/projects/{PROJECT}/config.md и lessons.md
7. Выведи SESSION BOOTSTRAP checklist из meta.md Section 14 (12 items)
8. Сохрани META identity (6 output types + Bash classification) в Claude Code memory

Далее продолжаем работу по текущим задачам.
```

Замените `{PROJECT}` на имя вашего проекта.

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
