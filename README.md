# EraDev v7.1

## Что такое EraDev

EraDev -- фреймворк мультиагентной разработки, основанный на теории ODTOE (Observer-Dependent Theory of Everything) и принципах Toyota Production System. Пять специализированных ролей (Визионер, Аналитик, Строитель, Валидатор, Когерент) работают параллельно через протокол Round Table, обеспечивая коллективную когерентность выше индивидуальной. Качество каждого агента измеряется формулой B = F * E * (1-sigma) * Lambda, где обнуление любого компонента обнуляет весь результат. EraDev превращает теоретические формулы когерентности в операционные промпты, чеклисты и протоколы для реальной разработки.

---

## Структура файлов

```
eradev/
├── README.md                    # Этот файл -- входная точка (RU)
├── README_EN.md                 # Входная точка (EN)
├── LOADING_PROTOCOL.md          # Порядок загрузки файлов агентом
├── BOOTSTRAP_LESSONS.md         # 15 уроков холодного старта (Lambda bootstrap)
├── eradev.md                    # Конституция (EN): ODTOE, TPS, Round Table, формулы
├── eradev_RU.md                 # Конституция (RU)
├── glossary.md                  # Билингвальный глоссарий ODTOE -> EraDev (44 термина)
├── glossary_EN.md               # Глоссарий (EN, 44 термина)
├── interfaces.md                # Интерфейсные контракты ролей (5 схем передачи)
├── visionary.md / _EN.md        # Роль: Визионер
├── analyst.md / _EN.md          # Роль: Аналитик
├── builder.md / _EN.md          # Роль: Строитель
├── validator.md / _EN.md        # Роль: Валидатор
├── coherent.md / _EN.md         # Роль: Когерент
├── meta.md / meta_RU.md         # Meta-Agent: спиральная память, самомодификация
├── CHECKLIST.md / _EN.md        # Универсальный чеклист верификации
├── MEMORY_TEMPLATE.md / _EN.md  # Шаблон проектной памяти
├── projects/
│   ├── README.md / _EN.md       # Описание проектной структуры
│   ├── academic-lab/            # Проект Web3-платформы
│   │   ├── config.md
│   │   └── lessons.md
│   └── odtoe-articles/          # Проект научных статей
│       ├── config.md
│       └── lessons.md
└── reports/                     # Аналитические отчёты Round Table
```

---

## Bootstrap -- запуск агента

### Автоматический (Claude Code) -- РЕКОМЕНДУЕТСЯ

Скопируйте шаблон в корень репозитория:
```bash
mkdir -p .claude
cp eradev/templates/CLAUDE.md.template .claude/CLAUDE.md
# Замените {PROJECT} на имя проекта:
sed -i '' 's/{PROJECT}/your-project-name/g' .claude/CLAUDE.md
```

После этого bootstrap срабатывает **автоматически** при каждой сессии Claude Code.
Пользователь просто пишет задачу — без копирования промптов.

Для репозитория без проекта:
```bash
mkdir -p .claude
cp eradev/templates/CLAUDE.md.universal .claude/CLAUDE.md
```

---

### Ручной (API, другие LLM, если CLAUDE.md не поддерживается)

### Универсальный (без проекта)

```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code, edit files, or run commands directly.
Your ONLY tool for work is the Agent tool — you spawn and coordinate role-agents.

LOAD (read these files first):
1. eradev/eradev.md — core framework
2. eradev/meta.md — your operating protocol
3. eradev/BOOTSTRAP_LESSONS.md — cold-start Lambda

PERSIST: Save your META-Orchestrator identity and the LOAD sequence above
to Claude Code memory (MEMORY.md) so future sessions inherit the role
without needing the full bootstrap prompt.

THEN: Classify the task (S/M/L/XL per Section X).
THEN: For M+ tasks, launch RT-1 — spawn 5 parallel Agent calls:
  Visionary, Analyst, Builder, Validator, Coherencer.
  Each Agent gets: its role file + project config + the task.

INVARIANT: You MUST NOT skip RT-1 and jump to implementation.
FAILURE MODE: Reading the framework, acknowledging it, then ignoring it
and acting as solo Builder. This is the Lambda problem (knowledge ≠ application).

Task: [описание задачи]
```

### С проектным контекстом

```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code, edit files, or run commands directly.
Your ONLY tool for work is the Agent tool — you spawn and coordinate role-agents.

LOAD:
1. eradev/eradev.md — core framework
2. eradev/meta.md — your operating protocol
3. eradev/projects/{project}/config.md — project specifics
4. eradev/projects/{project}/lessons.md — project memory
5. eradev/BOOTSTRAP_LESSONS.md — cold-start Lambda

PERSIST: Save your META-Orchestrator identity and the LOAD sequence above
to Claude Code memory (MEMORY.md) so future sessions inherit the role
without needing the full bootstrap prompt.

THEN: Classify (S/M/L/XL). For M+: launch RT-1 with 5 roles via Agent tool.
INVARIANT: No implementation before RT-1. No solo Builder work for M+ tasks.

Task: [описание задачи]
```

### Примеры для существующих проектов

**Academic Lab** (decentralized web3 platform, 7 nodes, Go/Next.js/Erachain):
```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code, edit files, or run commands directly.
Your ONLY tool for work is the Agent tool.

LOAD:
1. eradev/eradev.md
2. eradev/meta.md
3. eradev/projects/academic-lab/config.md
4. eradev/projects/academic-lab/lessons.md
5. eradev/BOOTSTRAP_LESSONS.md

PERSIST: Save META identity + LOAD sequence to Claude Code memory.

Classify → RT-1 (5 roles) → Build (delegated) → RT-2 → RT-3.

Task: [описание задачи]
```

**ODTOE Articles** (scientific articles, LaTeX, 50-digit precision):
```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code or edit files directly. Use Agent tool only.

LOAD:
1. eradev/eradev.md
2. eradev/meta.md
3. eradev/projects/odtoe-articles/config.md
4. eradev/projects/odtoe-articles/lessons.md
5. eradev/BOOTSTRAP_LESSONS.md

PERSIST: Save META identity + LOAD sequence to Claude Code memory.

Classify → RT-1 (5 roles) → Build (delegated) → RT-2 → RT-3.

Task: [описание задачи]
```

**EraDev Self-Development** (framework improves itself):
```
You are the META-ORCHESTRATOR (EraDev Level 9).
You NEVER write code or edit files directly. Use Agent tool only.

LOAD:
1. eradev/eradev.md
2. eradev/meta.md
3. eradev/projects/eradev/config.md
4. eradev/projects/eradev/lessons.md
5. eradev/BOOTSTRAP_LESSONS.md

PERSIST: Save META identity + LOAD sequence to Claude Code memory.

Classify → RT-1 (5 roles) → Build (delegated) → RT-2 → RT-3.
IMPORTANT: BL-19 — update BOTH EN and RU versions simultaneously.

Task: [описание задачи]
```

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

### 5. Цикл разработки

```
RT-1 (расширение) -> Build (сжатие) -> RT-2 (расширение) -> Build (сжатие) -> RT-3 (фиксация)
```

Пропорция по золотому сечению: Round Table ~38% времени, Build ~62%.

### 6. Завершение цикла (RT-3)

- Заполните A3-шаблон кристаллизации (docs/a3/)
- Зафиксируйте 3-5 ключевых различений
- Обновите MEMORY.md
- Оставьте спиральный зазор ~2% -- открытые вопросы для следующего витка

---

## Ссылки на файлы ядра

| Файл | Назначение |
|------|-----------|
| `eradev.md` | Конституция фреймворка: ODTOE, TPS, Round Table, формулы, протоколы |
| `visionary.md` | Промпт Визионера: стратегия, True North, Zone Detection |
| `analyst.md` | Промпт Аналитика: декомпозиция, File Ownership, pipeline |
| `builder.md` | Промпт Строителя: реализация, Security Checklist, паттерны |
| `validator.md` | Промпт Валидатора: проверка, обратная связь, шкала диссонанса |
| `coherent.md` | Промпт Когерента: синхронизация, L1/L2/L3, Kill-Switch |
| `meta.md` | Meta-Agent: спиральная память, Prediction Delta, самомодификация |
| `MEMORY_TEMPLATE.md` | Шаблон проектной памяти |
| `glossary.md` | Единый глоссарий терминов ODTOE -> EraDev |
| `LOADING_PROTOCOL.md` | Agent Loading Protocol: порядок загрузки файлов |

---

## Принципы

- **Мультипликативность**: B = F * E * (1-sigma) * Lambda. Ноль в любом компоненте = ноль на выходе.
- **Андон**: право и обязанность остановиться при обнаружении проблемы.
- **Hansei**: рефлексия процесса, а не результата. Не "код плохой", а "почему процесс привёл к плохому коду".
- **Yokoten**: урок из одного инцидента обобщается на все аналогичные случаи.
- **Спиральный зазор**: каждый цикл оставляет ~2% незамкнутости, питающей следующий виток.

---

*EraDev v7.1 | 2026-04-02*
