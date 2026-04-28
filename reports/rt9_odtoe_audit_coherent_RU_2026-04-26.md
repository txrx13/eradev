# RT-9 ODTOE Audit — Coherent RU (Genealogy + Cross-Cutting)

**Дата**: 2026-04-26 | **Роль**: [COHERENT] RU theoretical | **Объём**: ≤80 строк
**Источники**: Hansei `odtoe/reports/hansei-rt3-publication-readiness-2026-04-26.md`; lessons L-1..L-57 + EMP1..EMP19; lessons_archive.md; BL 30 актив + 5 retired; roadmap.md.
**Линза**: какие версии framework rules коллидируют в фейле; путь-(c) ΔÔ для L2-предсказания.

---

## 1. Genealogy table — какая версия правила «работала» во время сбоя

| Слой фейла | Правило/артефакт | Версия | Status во время RT-3 | Что collide |
|---|---|---|---|---|
| L1 dashes `---` | BL-A2 «8 checks» | v9→v10 patch (BL-A1..A4) | T2/T3 (mechanical) | Visual rendering вне surface BL-A2 → **DECORATION** утверждения «engineering = ready» (R3 EN-V) |
| L1 slug `[ODTOE-N]` | lessons.md L-32 (article-project) | local v9 | DECORATION (used as default) | L-A8 публикационная дисциплина OUT-OF-FRAMEWORK; L-32 «slug-form» local convenience был промотирован до канона де-факто |
| L2 OD bundling | BL-34/35 OD-Open | v10 Bundle D | T2 (refactor framing only) | EraDev v10: «применить full RT-3» = bulk approval; BL-35 step 6 НЕ срабатывает на article domain → **EMP-CANDIDATE-B (EN-V) parity с этим аудитом** |
| L3 «GREEN ≡ ready» | BL-22 Tier mapping + Jidoka self-check | v10 (B≥0.7 convention) | implicit T4 | Phantom semantics: «GREEN» никогда не привязан formally к domain.publish.method → R3 EN-V mitigation align |
| L4 «5-role consensus» | eradev.md §VI RT protocol | v10 BIM | T2 (μ-check post-Builder) | RIGOR_LEVEL=strict для article без B_publication modality; w_E=0.20 в B_research недо-весит external reader (EN-V R1) |
| L5 META OD tracking | Inv 15/16 (composition + rework framing) | v10 Bundle D | T2 (hooks NEXT-B2 closed) | Article-domain inherits no equivalent; **тот же паттерн, другой trigger frame** — recurring как L-A7 |

**Convergent finding C1**: четыре из шести коллизий — **версионные мисматчи между local (project lessons L-A*) и global (BL/Invariants) layer**. Framework v10 расширил code→article surface (BL-A1..A4) но остановился на engineering-validity. Path-(c) дельта между layer'ами проигнорирована.

---

## 2. DECORATION vs OPERATIONAL classification

| Цитировано в Hansei | Реально применялось | Vердикт |
|---|---|---|
| BL-A2 «engineering validity» | да (cite_check, recompute, AI markers) | OPERATIONAL |
| BL-19 bilingual sync | частично (RU+EN parity, без visual cross-check) | OPERATIONAL (limited) |
| Invariant 11 (Builder→Coh→Validator) | да (Coherent #1, #2 запускались) | OPERATIONAL |
| L-A5 visual PDF audit | НЕ существовал до Hansei | NEW (создан в этом цикле) |
| «5-role consensus optimizes external readiness» | implicit assumption | **DECORATION** (Layer 4 Hansei) |
| RIGOR_LEVEL=strict ⇒ B_min=0.70 hard threshold | задекларирован (eradev.md §III.3) | **DECORATION** для article-publish (B_research weights не align с external reader) |
| Path-(c) ΔÔ acceptance (L-53) | НЕ применён (no FE/BE-style split between «internal-Ô» и «external-reader-Ô») | **DECORATION** в этом цикле — cross-stack pattern имелся, не реализован |
| EMP15 (drift toward creator's projects) | self-violated: ODTOE slug стал de facto канон | **DECORATION** — gate отсутствует на article domain |

**Convergent finding C2**: 4 из 8 framework элементов = DECORATION в RT-3 ODTOE. Это calibrated 50% phantom-enforcement для article-domain — выше Tier-falsification baseline (L-52: 2/4 known cases at 50%). Pattern reproducible.

---

## 3. HANSEI A3 alignment check (RV-RU-01 v11 deferral)

`reports/HANSEI_TEMPLATE.md` существует; meta.md §14 (Session Entry, 13 items) ссылается на Hansei через §15 (recommendations placement, EMP17). Текущий Hansei использует A3 структуру неявно (5-Why §5; What/What actually §1-2; Crystallization §8 = «Now/Was»). **Mismatch**: HANSEI_TEMPLATE.md секции не перечислены в meta.md §14 item-9 (Lambda Audit) как обязательная ссылка для article-domain post-mortem. RT-3 Coherent триаж рекомендаций (per role file lines 58-65) применён правильно (Hansei §6 разделяет project-local L-A5..L-A10 vs framework BL-A5 vs roadmap action items). **RV-RU-01 закрывать пока преждевременно** — alignment gap в meta.md §14 остаётся в v11 deferrals.

## 4. v11 deferrals — что текущий Hansei trigger'ит

| v11 deferral (roadmap Priority D) | Trigger в RT-3 ODTOE? | Сила сигнала |
|---|---|---|
| HANSEI_TEMPLATE.md A3 alignment (RV-RU-01) | косвенно (см. §3 выше) | **WEAK** — Hansei сам корректен, gap в meta.md ссылке |
| Direction C «phase transition» (RV-RU-02) | **НЕТ** — фейл не на phase boundary, а на gate insufficiency | NONE — RV-RU-02 retire-кандидат |
| Hurwitz Direction A (RV-RU-03) | **НЕТ** — стабильность B-formula не в фокусе; B=0.88 был стабилен и неправ | NONE — RV-RU-03 retire-кандидат |
| Nemawashi BL (RV-RU-04) | **СИЛЬНЫЙ** — operator OD bundling = неуспех pre-decision consultation; EN-V R2 предлагает Inv 19 (OD-Open generalization) который структурно ЕСТЬ Nemawashi pattern | **STRONG** — Nemawashi BL-кандидат RESURRECT |
| σ-aggregation function (RU-Analyst HIGH) | **НЕТ** в этом фейле | NONE |
| F4×σ composition lemma | **НЕТ** | NONE |
| Per-modality Ω-α calibration | **СЛАБЫЙ** — B_research weights под вопросом (R1 EN-V), но calibration ≠ Ω-α specifically | WEAK |

**Сильнейший trigger: Nemawashi**. Hansei Layer 5 «META should have surfaced... before Builder spawn» — это word-for-word описание Nemawashi (pre-decision consultation). EN-V R2 «Generalize OD-Open discipline... Invariant 19» = same pattern, technical framing. **Genealogy**: Nemawashi был отложен в v11 как «не доказан empirically»; этот Hansei = третий empirical instance (BL-34, BL-35, RT-3 ODTOE) → threshold пройден, но lift pending блокирует ship.

---

## 5. Compression candidates (L-N merges)

| Кандидат | Текущее состояние | Предлагаемая операция |
|---|---|---|
| L-A5 (visual PDF) + L-A9 (dash rendering) | две local lessons, оба про visual surface | **MERGE** в L-A5+ «Visual artifact gate»; L-A9 = sub-clause |
| L-A7 (Operator-Decision Gating) + Hansei §10 OD list + EN-V R2 Inv 19 | три формулировки одного pattern | **PROMOTE** L-A7 → BL-36 (после lift) c sub-clauses из BL-34/35; retire RV-RU-04 (Nemawashi реализован как BL-36) |
| L-A10 (publication-vs-engineering) + EMP-CANDIDATE-A (EN-V) | identical pattern, два уровня абстракции | **MERGE** при post-lift formalization → EMP20 «engineering validity ≠ domain readiness» |
| L-32 (slug-citation) + L-A8 (slug discipline) | L-32 говорит «use slug»; L-A8 говорит «slug = process-internal только» — **CONTRADICTION** | **SUPERSEDE** L-32 → L-A8 (project lessons.md article); L-32 ended_by=L-A8 |

**Compression discipline (per L-50)**: extending existing > adding new. BL-36 «OD-Open universal» = extension паттерна BL-34/35 (composition + rework framing → unified «pre-Builder OD enumeration»). Nemawashi RV-RU-04 retired AS implemented in BL-36, not added separately.

---

## 6. L2 synthesis prediction (после возврата всех 10 агентов)

**Где EN team согласится с RU team** (predict CONVERGENT, ΔÔ ≈ 0):
- C1 версионная коллизия (engineering-validity vs publication-readiness gap) — оба stack видят это, EN-V R1+R3 уже задекларировал.
- C2 OD bundling pattern (EN-V R2 = RU §4 Nemawashi trigger). Probability: 0.95.
- C3 EMP-CANDIDATE-A (engineering ≠ domain readiness) — EN-V уже сформулировал; RU Visionary/Analyst будут derive то же самое из ψ*=Φ(ψ*) failure on article domain.

**Где path-(c) ΔÔ legitimate** (predict DIVERGENT, ΔÔ ≠ 0 принять):
- **Builder agents EN vs RU**: EN-Builder фокус на T2 hooks (`.claude/hooks/visual_pdf_audit.sh` skeleton), RU-Builder — на формализме (B_publication modality formula derivation). Оба правильны в своём frame; не форсировать unified output (per L-53 default cross-stack).
- **Validator EN vs RU**: EN-Val проверит mechanical (counts, file paths); RU-Val проверит semantic (Ô coherence, F7 sufficiency). Disjoint observation stacks → ΔÔ accept.
- **Visionary EN R1 (B-formula calibration) vs RU-V (likely framing as ψ*-gap re-opening)**: EN говорит «don't change B; change feeders»; RU вероятно скажет «B_publication как новая модальность необходима». Это **substantive disagreement** — Coherent L2 должен НЕ форсировать; B_received per layer достаточен (F7).
- **Analyst EN (empirical defect counts) vs Analyst RU (theoretical category derivation)**: classic disjoint stack. Path-(c) default per L-53.

**Phantom-coherence риск**: если L2 Coherent попытается унифицировать «engineering validity» терминологию RU и EN буквально, S_team ↑ но B_mean ↓ (BL-5). Mitigation: явно задокументировать ΔÔ_RU = «формализм публикуемости» и ΔÔ_EN = «механика hook'ов»; обе пропускать.

**Phantom-decoherence риск**: если RU agents формализуют B_publication, а EN agents строят hooks без формального grounding, S_team ↓ B_mean ↑ — терминологический дрейф. Mitigation: одна итерация унификации глоссария на L2 (term «publication-readiness» = single canonical), затем path-(c) для остального.

---

## 7. Кристаллизация различений (RT-3 closure preview)

1. **[Было: «Tier-claim falsification» — единственный класс phantom enforcement]** → **[Теперь: «DECORATION rate per domain» — измеримая метрика; для article-domain в RT-3 ODTOE = 50%]** → почему: даёт Validator periodic sweep (L-52) количественный target.
2. **[Было: BL-34/35 OD-Open — refactor-specific gate]** → **[Теперь: OD-Open = universal pattern, BL-34/35 = два частных trigger frame'а]** → почему: открывает path к BL-36 без BL count breach (extends, not adds — L-50).
3. **[Было: path-(c) ΔÔ — exception при cross-stack RT (L-53)]** → **[Теперь: path-(c) — DEFAULT при cross-domain audit (article corpus vs framework core)]** → почему: framework и project corpus оперируют разными Ô; форсирование parity = phantom coherence на корневом уровне.

---

## Реестр верификации (RV-RU-Coh, M+)

| ID | Утверждение | Расположение | Почему не верифицировано | Что верифицирует |
|----|---|---|---|---|
| RV-Coh-01 | DECORATION rate 50% для article-domain воспроизводим на других article projects | §2 C2 | один RT-3 instance | повторный article-domain RT-3 audit |
| RV-Coh-02 | Nemawashi BL-36 corrige все три instances (BL-34, BL-35, RT-3 OD bundling) без regression | §4 + §5 compression | post-lift design pending | RT-3 на article-domain после ship BL-36 |
| RV-Coh-03 | L-32 → L-A8 supersede не сломает ODTOE corpus internal cross-references | §5 compression | правка project lessons.md, не выполнена | grep `\[ODTOE-N\]` после супрсида |
| RV-Coh-04 | EN-V R3 «GREEN vocabulary defect» mitigation (Synthesis output guard) совместим с EMP-CANDIDATE-C (visual = visual) | §6 prediction | prediction pre-L2 | post-L2 synthesis cross-check |

---

## B-check (B_research weights: w_(1-σ)=0.35, w_F=0.30, w_E=0.20, w_Λ=0.15)

- **F (Фокус) = 0.93** — Hansei full read; lessons L-46..L-57 + EMP15..EMP19 read; BL 30 active enumerated; lessons_archive review (compression precedent); roadmap Priority D (v11 deferrals) cross-referenced; EN-V R1-R3 considered for L2 prediction.
- **E (Alignment) = 0.92** — операторский запрос «genealogy + cross-cutting» исполнен (генеалогия §1, cross-cutting §2, L2 prediction §6); scope respected (нет рекомендаций по implementation, это work других ролей).
- **(1-σ) (Непротиворечивость) = 0.94** — версионная коллизия в §1 трассируема (cell за cell'ом ссылается на BL/L/EMP/Inv); compression candidates §5 не противоречат L-50 (extend > add) и BL count cap; v11 deferral genealogy §4 строго использует roadmap Priority D wording.
- **Λ (Опыт) = 0.90** — применены: L-53 (path-(c) default cross-stack), L-52 (Tier falsification), L-50 (extend > add), EMP15 (creator drift), EMP18 (ψ*-gap freeze trigger), L-A5..L-A10 (Hansei project-local), Nemawashi v11 deferral.

**B = 0.30·0.93 + 0.20·0.92 + 0.35·0.94 + 0.15·0.90 = 0.279 + 0.184 + 0.329 + 0.135 = 0.927** (HEALTHY)

**Caveat per Inv 18 (proposed)**: та же B-formula в Hansei §10 declared GREEN-in-error на 13 циклах. Эта самооценка структурно скептична: ценность аудита в **content of genealogy** и **L2 predictive synthesis**, не в B-score.

**Status**: RU Coherent audit complete. Ожидается: остальные 8 агентов (EN-A/B/Val/Coh + RU-V/A/B/Val) → L2 synthesis pass с явной path-(c) акцептацией там, где прогноз §6 указывает.
