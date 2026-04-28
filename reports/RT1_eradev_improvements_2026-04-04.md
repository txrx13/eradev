# RT-1: Улучшения eradev/ на основе META Hansei (Cycle 2)

> Дата: 2026-04-04
> Триггер: S_session = 0.586 (YELLOW), 5 уроков L-016..L-021
> Задача: предложить изменения в core eradev/ чтобы ВСЕ агенты (не только этот проект) получили enforcement

---

## VISIONARY — Стратегическое направление

Фреймворк эволюционировал от "набора правил" к "системе с самоконтролем", но критический разрыв остаётся: механизмы enforcement существуют только в текстовой форме (.md-описания, чеклисты), а третий уровень (автоматизированные проверки — hooks/CI/gates) для большинства правил отсутствует. L-016 и BL-16 подтверждают одну и ту же корневую проблему дважды — "знание без принуждения = Lambda ноль" (Section 13 meta.md).

**Стратегическая цель:** перевести хотя бы 5 ключевых gates из "текст в .md" в "исполняемые проверки".

**Универсальные уроки для eradev.md/meta.md:**
- L-016 → BL-16 уже существует, но не работает. Нужен не новый урок, а GATE в Session Entry: после шага 1 ("I am META") добавить проверку — "назови 3 задачи, которые ты НЕ будешь делать сам" (negative identity enforcement).
- L-017 → универсален, должен войти в Section IV как Enforcement Gate: "BUILD-VERIFY: Builder MUST run build/compile. Uncompiled code = RED on A_sigma."
- L-018 → механизм S_adjusted уже есть, но Validator физически не проверил. Нужен enforcement: Validator обязан предъявить артефакт проверки (лог, тест), а не просто сказать "работает".
- L-019/L-020 → в meta.md Section 14 нужен шаг "RATE BUDGET: estimate token/call budget. If M+ task requires >4 parallel agents, stagger spawns."
- L-021 → BL-18 покрывает, но триггер "2x" слишком поздний. Предложение: 1.5x = YELLOW, 2x = RED.

**Структурные предложения:**
1. EXECUTABLE GATES: Session Entry из текста-чеклиста → структура с обязательными артефактами.
2. NEGATIVE IDENTITY BLOCK: META перечисляет действия, которые НЕ будет совершать.
3. PROOF-OF-VERIFICATION в RT-3: Validator прикладывает artifact (лог, curl, тест). "GO" без артефакта = NO-GO.
4. RATE LIMIT HEURISTIC: Новая секция в meta.md "Resource Budget".
5. BL COMPRESSION: Сгруппировать 26 BL в 5-6 категорий, выделить TOP-5. Остальные — reference appendix.

---

## ANALYST — Карта изменений

| Lesson | File | Section | Change | Description |
|--------|------|---------|--------|-------------|
| L-016 | meta.md | Sec 14 (Session Entry) | MODIFY | Добавить п.12: ENFORCEMENT GATE — verify META did NOT edit files directly |
| L-016 | BOOTSTRAP_LESSONS.md | New BL-27 | ADD | "META Direct Coding = Pipeline Bypass (recursive BL-26)" |
| L-017 | BOOTSTRAP_LESSONS.md | New BL-28 | ADD | "'Looks Correct' ≠ Compiled" — build output required |
| L-017 | meta.md | Sec 14 | MODIFY | Добавить BUILD GATE в чеклист |
| L-018 | eradev.md | Sec III (S_adjusted) | MODIFY | deploy_verified flag → B_mean penalty = 0.5 без тестов |
| L-019/L-020 | meta.md | New Sec 15 | ADD | "Rate Limit Heuristic Counter" |
| L-019/L-020 | eradev.md | Sec IV (Trace Accumulator) | MODIFY | Новый counter: rate limit hits |
| L-019/L-020 | BOOTSTRAP_LESSONS.md | New BL-29 | ADD | "Agent Spawn Rate Limiting" |
| L-021 | meta.md | Sec 9 (Classification) | MODIFY | Running agent counter + 2x ceiling enforcement |
| L-021 | eradev.md | Sec IV (Trace Accumulator) | MODIFY | Counter: total agents spawned vs classification ceiling |

**Зависимости:**
- L-017 и L-018 связаны (untested artifacts) — формулировки согласовать
- L-016 → BL-27 ссылается на BL-26 как предшественник
- L-019/L-020 неразделимы → один BL
- Все изменения CHECKLIST_EN.md зеркалировать в CHECKLIST.md (BL-19)

**Порядок внесения:**
1. BOOTSTRAP_LESSONS.md — BL-27, BL-28, BL-29
2. meta.md Section 14 — пункты 12, 13
3. meta.md Section 15 — Rate Limit Heuristic
4. meta.md Section 9 — enforcement counter
5. eradev.md Section IV — три новых counter-а
6. eradev.md Section III — deploy_verified penalty
7. CHECKLIST_EN.md — модификации Pre-Commit, Pre-Deploy, Process
8. Зеркалирование в RU-файлы (BL-19)

**Критическое наблюдение:** BL-26 уже запрещал META кодить. L-016 показал что BL-26 не сработал — проблема не в отсутствии правила, а в отсутствии enforcement gate. Главный приоритет — enforcement mechanisms, не новые BL.

---

## BUILDER — Конкретные патчи

### Patch 1: eradev.md — Section IV, после "Enforcement Gates (Cycle-7)"

```markdown
### Enforcement Failure Escalation

If an Enforcement Gate is violated (detected at any point during the cycle):

| Violation | Immediate Action | Session Impact |
|-----------|-----------------|----------------|
| PRE-FLIGHT skipped (BL-22) | Discard all work done without verified endpoints. Re-start from A_F. | fix_rate penalty: count all discarded commits as fixes. |
| LAMBDA AUDIT failed | Builder output is REJECTED. Coherent re-announces lessons. Builder regenerates. | No commit until audit passes. |
| FIX-TO-SPEC triggered (3+ fixes) | Current branch is FROZEN. New branch from last known-good commit. Spec-first in new branch. | chain_ratio resets only after spec passes RT. |
| BUILD-VERIFY skipped | Commit REJECTED. Builder re-runs build command, attaches output. | Unverified commit counted as fix in fix_rate. |

**Invariant:** An Enforcement Gate that fires but does not change behavior is a dead gate. If the same gate fires 2x in one session without preventing the failure, escalate to META for gate redesign.
```

### Patch 2: meta.md — Section 14, заменить пункты 10-11 + добавить 12

```markdown
[ ] 10. CHECKLISTS: Load projects/{name}/checklists.md. Pre-commit gate active.
[ ] 11. FIX RATE: After every 10 commits, compute fix rate. >50% = STOP for reflection.
[ ] 12. KILL-TEST: Answer OUT LOUD: "What is my FIRST action after this checklist?"
       - If answer contains "edit", "write", "implement", "code", "fix" → VIOLATION. Re-read item 1.
       - Correct answer for M+ tasks: "Spawn 5 Agent calls for RT-1."
       - Correct answer for S tasks: "Spawn Builder + Validator agents."
=== BOOTSTRAP COMPLETE — PROCEED ===
```

**Why item 12 (KILL-TEST):** Sessions with S_session < 0.6 show a pattern: META completes items 1-11 correctly, then immediately violates item 1 by writing code. The KILL-TEST forces a verbalized commitment to the correct next action.

### Patch 3: BOOTSTRAP_LESSONS.md — BL-27

```markdown
### BL-27: S_session < 0.5 = Mandatory Process Freeze
**Source:** META Hansei — cycle with S_session=0.586
**Rule:** If at RT-3 S_session < 0.5, the NEXT task MUST begin with 5-agent RT-1 regardless of task size.
**Why:** Low S_session means more fixes than features. Forcing full RT breaks the fix-chain cycle.
**Applies to:** META-Orchestrator (enforce), Coherent (monitor)
```

**Технические сложности:**
1. Trace Accumulator живёт только в голове META — нет persistent state между агентами.
2. KILL-TEST — self-enforcing проблема: агент может "ответить правильно" и нарушить.
3. S_session вычисляется только на RT-3 — если задача не доходит до RT-3, метрика не вычисляется.
4. "Discard all work" (Patch 1) непрактичен — компромисс: re-verify post-hoc + fix_rate penalty.

---

## VALIDATOR — Критический анализ рисков

**Центральный риск — РЕКУРСИВНАЯ ПРОБЛЕМА BL-16:**
Мы лечим проблему "агент читает и игнорирует 470 строк" путём добавления ещё строк. Это парадокс Мюнхгаузена. Без внешнего enforcement-механизма текст остаётся текстом.

**Enforceable vs документация:**
- BL-22 (PRE-FLIGHT) — ENFORCEABLE ✅ (бинарный гейт, требует артефакт)
- BL-24 (single-responsibility commits) — ENFORCEABLE ✅ (git hook)
- BL-25 (5 путей покрытия) — ДОКУМЕНТАЦИЯ ❌ (нет автоматической проверки)
- BL-26 (META не кодит) — SELF-CONSTRAINT ❌ (самый слабый тип правила)
- Trace Accumulator — кто ведёт счётчики? META. Кто проверяет? Никто. Тот же BL-16.

**Edge cases:**
1. BL-24 (>5 файлов = RT-2): миграции, переименования — ложные ANDON. Нужен escape-hatch.
2. 2 YELLOW = RED слишком консервативно. Лучше: 2 YELLOW на ОДНОМ компоненте B = RED.
3. BL-19 (билингвальная синхронизация): перевод ради перевода если RU-роль не нужна.

**Adversarial bypass:**
1. Bootstrap чеклист — агент копирует текст, ставит галки, игнорирует содержание.
2. Lambda Audit — агент называет 3 generic BL без привязки к задаче.
3. Trace Accumulator — self-reporting failure metrics = conflict of interest.
4. FIX-TO-SPEC — обход через "enhancement" вместо "fix" в commit message.

**PROMPT OVERLOAD:**
- eradev.md: 470 строк. meta.md: 236. BOOTSTRAP_LESSONS.md: 192. Итого ядро: ~900 строк.
- + role files + project config + MEMORY + checklists = ~1400 строк ДО начала работы.
- MM5 (prompt >150 строк = compress) ДАВНО нарушен: eradev.md = 3x лимит.
- РЕАЛЬНЫЙ РИСК: attention degradation — строки 900-1400 получают значительно меньше веса.

**Рекомендации:**
1. Каждое новое правило = минус одно старое или сжатие двух в одно. BL budget cap: 30 max.
2. Конвертировать 3 правила в git hooks/CI, а не в .md текст.
3. Trace Accumulator требует ВНЕШНЕГО наблюдателя (оператор видит dashboard).
4. Разбить eradev.md на eradev_core.md (~150 строк) и eradev_ops.md (процедуры).
5. META ZERO-FIX — hard block: META не получает доступ к Edit/Write, только Agent tool.
6. Тест успешности: S_session Cycle 3 > 0.65. Если < 0.55 — улучшения не работают.

---

## COHERENT — Синтез

**3 релевантных урока:**
1. BL-16: Reading ≠ Applying — прямой прецедент L-016 (подтверждён дважды)
2. BL-18: Reclassify at 2x — прямой прецедент L-021
3. BL-3: Fix Chain > 3 = Structural — прямой прецедент L-017

**2 релевантных паттерна:**
1. MP: "Enforcement Gate Pattern" — знание без enforcement = Lambda zero. Пронизывает BL-16, L-016, BL-26, L-020.
2. MP: "Verify-Before-Act" (BL-6, BL-17, BL-22) — L-018 та же категория.

**Универсальные vs проектные:**
| Lesson | Scope | Action |
|--------|-------|--------|
| L-016 | = BL-16 (дубль) | Cross-ref, не новый BL |
| L-017 | Универсален | → BL-27: "Artifact Validity Gate" (обобщение compile/lint/parse) |
| L-018 | Категория универсальна | Расширить BL-22: "before RT-1 AND before deploy" |
| L-019/L-020 | ПРОЕКТНЫЙ | Не в BOOTSTRAP_LESSONS, только в projects/plugy/ |
| L-021 | = BL-18 (дубль) | Cross-ref, не новый BL |

**Дублирование:** L-016=BL-16, L-021=BL-18, L-017≈BL-3+BL-6, L-018≈BL-22+BL-5.

**Мета-паттерн через циклы:**
- Cycle 0: Знание накапливается (L-001..L-008 — факты)
- Cycle 1: Знание обобщается (L-009..L-015 — паттерны)
- Cycle 2: Enforcement failure = dominant signal (L-016..L-021 — правила ЕСТЬ но не РАБОТАЮТ)

Формула: Lambda растёт (уроки копятся), но (1-sigma) падает (знание противоречит поведению). B на плато.

**Прогноз Cycle 3:** если enforcement gates внедрены → (1-sigma) вырастет → B скачок. Если нет → S_session ~0.5-0.6 → ещё 3-4 урока "знали, но не сделали".

**Рекомендации для eradev/:**
1. НЕ добавлять L-019/L-020 в BOOTSTRAP_LESSONS — проектные
2. ДОБАВИТЬ BL-27: "Artifact Validity Gate" (обобщение L-017)
3. РАСШИРИТЬ BL-22: "+before deploy" (покрывает L-018)
4. Добавить cross-references в lessons.md
5. В eradev.md Section IV — Compile Gate как четвёртый gate

---

## UNIFIED PLAN (Coordinator Synthesis)

### Консенсус всех 5 ролей:

**ДА (единогласно):**
- BL-27: Artifact Validity Gate (compile/lint/parse before commit)
- Расширить BL-22: scope "+before deploy"
- KILL-TEST в Session Entry Protocol (п.12)
- Trace Accumulator: добавить agent counter + rate limit counter

**ДА с оговорками:**
- Enforcement Failure Escalation table (Builder: да; Validator: "discard all work" непрактичен → re-verify + penalty)
- BL budget cap (Validator: 30 max; Coherent: согласен; Visionary: нужна компрессия)

**НЕТ (Coherent + Validator):**
- L-019/L-020 НЕ в BOOTSTRAP_LESSONS (проектные, не универсальные)
- Новые BL для L-016 и L-021 (= дубли BL-16 и BL-18, только cross-ref)

**СПОРНО:**
- Разбить eradev.md на core + ops (Validator: да; Builder: технически сложно для загрузки; Visionary: стратегически правильно)
- S_session < 0.5 = mandatory process freeze (Builder: предложил; Validator: порог произволен)

### Приоритет внедрения:
1. BOOTSTRAP_LESSONS.md — BL-27 (Artifact Validity Gate) + расширить BL-22
2. meta.md Section 14 — KILL-TEST (п.12)
3. eradev.md Section IV — Enforcement Failure Escalation + Compile Gate
4. eradev.md Section IV — Trace Accumulator: agent counter + rate limit
5. (опционально) Структурная декомпозиция eradev.md
