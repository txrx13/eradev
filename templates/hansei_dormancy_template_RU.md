# Hansei: Аудит дормантности (4-session окно)

> Триггер: Ω_pruned == 0 за trailing 4-session окно (ни один BL/Inv/Lesson не retired через retire-pass).
> Каденс: пост-RT-12 каждые 4 sessions, ИЛИ ad-hoc когда meta_RU.md §14 item 9 печатает Ω_pruned = 0.
> Авторская роль: Когерент. Reviewer: META + Оператор.
> Якоря: BT-1 Phase 2.3 P-cure (retirement organ); D-cure leverage_factor (axis); M-cure intent_ratio (META discipline).
> Output path: `reports/hansei-dormancy-{YYYY-MM-DD}.md`.

## 1. Область окна

- Sessions покрыто: S{N-3} .. S{N} (4 sessions, включительно).
- Date range: {YYYY-MM-DD} .. {YYYY-MM-DD}.
- Commit range: `{HASH_OLDEST}..{HASH_NEWEST}`.
- Ω_pruned (measured): {N}. Healthy threshold: ≥ 1 за окно.
- Companion metrics: leverage_factor = {X.XX}, intent_ratio = {X.XX} (из §14 item 9 prints).

## 2. Candidate retirees (T1+T2 falsifiable list)

Для каждой [ACTIVE] не-EMP записи в `projects/{PROJECT}/lessons.md` и корневых BL файлах, оценить:

| ID | Title | freshness | Codified? | Superseded? | Domain still applies? | Verdict |
|---|---|---|---|---|---|---|
| L-_ | _ | _ | yes/no + anchor | yes/no + by-ID | yes/no | RETIRE / KEEP / REVALIDATE |

**EMPs immortal** — никогда не retire. Skip.

**Verdict legend:**
- RETIRE — содержание полностью codified в framework artifact ИЛИ полностью superseded более поздней [ACTIVE] записью. Move в lessons_archive.md с `retire_pass: true`.
- KEEP — всё ещё load-bearing, fresh, не subsumed.
- REVALIDATE — boundary case; reset `valid_from` и re-test в следующем окне.

## 3. Load-bearing canary (НЕ retire)

Per BT-1 spec, retirement load-bearing BL/Inv должен быть REJECTED. Запустить canary:

- [ ] Для каждого RETIRE candidate, grep по framework corpus для hard references: `grep -rE "({ID}|Invariant {N})" eradev{,_RU}.md meta{,_RU}.md CLAUDE.md roles/ templates/ .claude/ .githooks/`.
- [ ] Если candidate cited в normative text (не просто history/archive), DOWNGRADE verdict с RETIRE → REVALIDATE.
- [ ] Documentировать каждый rejected retirement в §5 ниже.

## 4. Retire-pass execution checklist

Для каждой записи approved для retirement:

- [ ] Append entry в `projects/{PROJECT}/lessons_archive.md` используя template в начале того файла. Include `retire_pass: true` в metadata comment.
- [ ] Пометить source row в `lessons.md` с `[ARCHIVED YYYY-MM-DD]` и `ended:` датой.
- [ ] Stage оба файла, commit с subject содержащим `[retire-pass]` (это exempts commit от D-cure leverage_factor BLOCK и от phantom-newness-check.sh per existing sentinels).
- [ ] После commit, verify `git log --grep='\[retire-pass\]' --since='4 sessions ago'` возвращает new commit.
- [ ] Increment Ω_pruned для следующего bootstrap §14 item 9 print.

## 5. Rejected retirements (audit trail)

| Candidate ID | Reason rejected | Re-evaluate at session |
|---|---|---|
| _ | load-bearing reference в {file:line} | S{N+4} |

## 6. Dormancy verdict

- [ ] **GREEN** — ≥ 1 retire-pass executed в этом окне, Ω_pruned now ≥ 1. Корректирующее действие не требуется.
- [ ] **YELLOW** — 0 retire-pass executed но ≥ 3 KEEP/REVALIDATE rationales documented (corpus genuinely fresh). Schedule next audit на S{N+4}, без эскалации.
- [ ] **RED** — 0 retire-pass И нет documented rationale (retirement organ atrophy). Триггер:
  - Spawn Когерент для compression pass на lessons.md (см. meta_RU.md §14 item 9-extended BL compression).
  - Re-run этот template на S{N+1} (не S{N+4}) — ускоренный cadence.
  - Если 2 consecutive RED окна: эскалация к BT-1 v2 framing review (per BT-1 roadmap §C5 fail-action).

## 7. Hooks & framework alignment (sanity)

- [ ] `.githooks/phantom-newness-check.sh` принимает `[retire-pass]` sentinel (existing override; новый flag не добавлен).
- [ ] `.claude/hooks/check-leverage.sh` exempts `[retire-pass]`-tagged коммиты от LF<0.10 BLOCK (D-cure shipped).
- [ ] `.claude/hooks/enforce-delegation.sh` НЕ misclassify retire-pass edits в lessons_archive.md (Когерент Synthesis output type, ε_meta whitelist).

## 8. Cross-project signal (optional)

Если несколько проектов retired entries в этом окне:
- Отметить любой pattern (одна и та же axis falling dormant across projects → potential framework smell).
- Flag для Visionary review на next RT-1.

---

**Sign-off:** Когерент {agent_id} / META review {date} / Оператор ack {date}.
