# RT-14 Analyst — Inv 20 (DOCX-PRIMACY) Cross-Project Corroboration Count

**Author**: Analyst agent (R-3 per `eradev_final_improvement_roadmap_2026-05-19.md` priority list)
**Date**: 2026-05-19
**Scope**: BL-13 Yokoten threshold reading + empirical cross-project DOCX corroboration count
**Operator request (verbatim)**: «делай все максимально параллельно и надежно»

## 1. BL-13 Yokoten — exact threshold text (citation)

Source: `BOOTSTRAP_LESSONS.md:119-124` (mirror: `BOOTSTRAP_LESSONS_universal.md:101-108`)

> **BL-13: Yokoten — One Lesson, All Analogous Cases (+ Grep Gate) [UNIVERSAL]**
> **Rule:** When a lesson is learned from an incident, propagate it horizontally to ALL analogous contexts. After every fix commit, grep the codebase for analogous patterns. A single-site fix is incomplete by definition. Log grep results and either fix all sites or document why each non-fix is safe.

**Critical finding**: BL-13 body **does NOT contain an explicit ≥3 numeric threshold**. The «≥3 cross-project instances» rule cited in `eradev_final_improvement_roadmap_2026-05-19.md:34` originates from the **W8 RT-5 verdict** («HOLD for cross-project corroboration», `meta-hansei-2026-04-27-rt5.md:110`) and the **RU Coherent reading** of BL-13 («cross-project» = different operator-domain project, not same project's multiple artifacts) in `meta_reflection_ru_2026-05-19.md:120`. EN Coherent disagrees (`meta_reflection_en_2026-05-19.md:135` recommends adopt-now).

The threshold is therefore **interpretive, not literal**. Operator decides which interpretation binds.

## 2. Empirical DOCX-corroboration evidence table

Empirical grep over the entire `/Users/antonpankratov/Downloads/eradev/` working tree:

| Source file | DOCX hits | Project | Notes |
|-------------|-----------|---------|-------|
| `BOOTSTRAP_LESSONS.md` | 0 | framework | grep `-i "DOCX\|\.docx\|pandoc"` returned 0 matches |
| `BOOTSTRAP_LESSONS_universal.md` | 0 | framework | same grep, 0 matches |
| `BOOTSTRAP_LESSONS_code_adapter.md` | 0 | framework | same grep, 0 matches |
| `projects/eradev/lessons.md` | 0 | eradev self-dev | same grep, 0 matches |
| `projects/eradev/lessons_archive.md` | 0 | eradev self-dev | same grep, 0 matches |
| `reports/recommendation-eradev-framework-invariant-20-2026-05-19.md:1-139` | many | odtoe-articles (genesis) | THIS is the recommendation file; refers to outside-repo `eradev/projects/odtoe-articles/lessons.md` |
| `reports/meta_reflection_en_2026-05-19.md:14,28,101-121` | several | odtoe-articles (discussion) | L-DOCX-7, L-2CYCLE-VERIFY-MANDATORY, L-VENUE-N, L-FORMAT-PDF-TITLE-VISUAL, L-DOCX-PRIMACY-MANDATORY all cited; **all 5 live in `odtoe-articles` project** |
| `reports/meta_reflection_ru_2026-05-19.md:17,84-95,120` | several | odtoe-articles (discussion) | RU lens classifies as `domain.type=article`, project-scope only |
| `reports/eradev_final_improvement_roadmap_2026-05-19.md:24,34,63` | several | odtoe-articles (discussion) | confirms «1 cross-project instance currently» |

**Trend signal**: `projects/odtoe-articles/lessons.md` referenced as «outside-repo» — the actual file lives in `Downloads/odtoe/eradev/projects/odtoe-articles/` (separate repository per `meta_reflection_en_2026-05-19.md:23` evidence: `git -C /Users/antonpankratov/Downloads/odtoe log` 193 commits vs 2 in `eradev`).

## 3. Cross-project distinct-project count

Per BL-13 Yokoten (RU interpretation, `meta_reflection_ru_2026-05-19.md:120`):
> «5 articles in same project = 1 cross-project instance»

**Distinct projects represented by DOCX-related lessons**:

| Project | Domain | Lessons | Count toward Yokoten |
|---------|--------|---------|----------------------|
| `odtoe-articles` | article | L-DOCX-7, L-VENUE-N, L-2CYCLE-VERIFY-MANDATORY, L-FORMAT-PDF-TITLE-VISUAL, L-DOCX-PRIMACY-MANDATORY (5 lessons across NV-38, NNI-39, UNZ-32, NP-40, GZ-41) | **1** |
| `eradev` (self-dev) | code | 0 DOCX hits | **0** |
| (any other operator-domain) | — | none found | **0** |

**Cross-project total: 1 / 3** (per RU lens strict reading). Per EN lens (`meta_reflection_en_2026-05-19.md:135-141`) the within-project depth (5 articles × 14× compliance improvement) is treated as sufficient — but EN explicitly says «this is recommendation-channel work, not BL-13 strict gate».

## 4. Trend signal — operator queue for foreseeable future

Evidence from `meta_reflection_en_2026-05-19.md:12,23,120-121`:
- **21-day window**: 193 commits in `Downloads/odtoe/` vs 2 commits in `eradev`
- **No other operator-domain project mentioned** as queued in either reflection or final roadmap
- `eradev_final_improvement_roadmap_2026-05-19.md:99-103` (R-8) acknowledges: «requires operator providing tasks» — single-project for foreseeable future is plausible
- RU's example of «book chapter or non-ODTOE preprint» (`meta_reflection_ru_2026-05-19.md:120`) is **hypothetical**, not active

**Trend verdict**: `odtoe-articles` likely the ONLY active operator-domain project in the next 2-3 sessions. Reaching ≥3 cross-project instances would require either (a) operator starts a second article-domain project (e.g., book draft, conference paper from different venue) or (b) framework loosens BL-13 threshold to «≥3 instances any-project» (currently 5/3 met within-project, would be adopt-now).

## 5. Recommendation

**Verdict: DEFER_WITH_GAP** (1/3 cross-project instances; clear gap, partial pathway).

**Gap**: 2 additional cross-project instances needed to satisfy RU-strict BL-13. Pathways:

| Pathway | Description | Operator action | ETA |
|---------|-------------|-----------------|-----|
| A. Wait for organic 2nd project | Operator starts book / non-ODTOE article / другой venue | Discretionary | unknown |
| B. Adopt RU `≥1 cross-project` weaker gate | RU R-2 (`meta_reflection_ru_2026-05-19.md:120`) proposes ≥1; would still need 1 outside-ODTOE confirmation | Discretionary | unknown |
| C. Adopt EN momentum-capture | EN A1 (`meta_reflection_en_2026-05-19.md:135-141`) treats 5/61→58/61 corpus delta as sufficient empirical signal; ships Inv 20 NOW | Operator decision | now |
| D. Domain-skin lift (not Inv) | Per RU R-8 (`meta_reflection_ru_2026-05-19.md:126`): if R-2 promotes, lift into `templates/domain_skin.article.md` (NOT universal Inv). Avoids universalist trap. | Operator decision | next session |

**Analyst recommendation**: pathway **D** — extend `templates/domain_skin.article.md` (and `pre-validator-handoff.sh` hook per RU R-6) NOW with DOCX-state evidence requirements, **deferring** the universal Inv 20 promotion until ≥1 non-ODTOE article instance ships. This:
- Respects L-50 extend>add (Inv 20 currently extends pattern of Inv 18 / Inv 19; lifting to skin is the correct layer for domain-specific rules)
- Closes NP-40-class regression at hook layer immediately (defense-in-depth)
- Preserves universal-Inv slot for genuinely cross-domain rule (when 2nd project corroborates)
- Aligns with W8 RT-5 «HOLD for cross-project corroboration» verdict that has not yet been overridden by operator

## 6. B-check (Analyst self-rating)

- **F (Focus) = 0.92** — read full recommendation report, BL-13 exact text, both reflections, final roadmap, lessons + lessons_archive. All 5 referenced sources empirically grepped.
- **E (Alignment) = 0.90** — operator's exact ask «cross-project corroboration count per BL-13» answered with numeric verdict (1/3) + threshold-text citation. Recommendation given with 4 pathways + explicit Analyst preference.
- **(1−σ) = 0.82** — honest residual: (i) BL-13 numeric threshold is interpretive not literal — σ on which interpretation binds; (ii) trend signal (single-project for foreseeable future) is inference from 21-day window, not guaranteed; (iii) `odtoe-articles` lessons file lives in separate repo not directly readable here — relied on recommendation report + reflections as proxy.
- **Λ (Experience) = 0.85** — applied L-50 extend>add (skin > Inv), L-52 falsifiable (file:line cites throughout), L-57 tight (~80 lines target met), BL-13 grep gate (empirical 0-hit confirmation across 5 framework files).

**B = 0.92 × 0.90 × 0.82 × 0.85 = 0.578** — GREEN (above 0.5 floor); σ-honest residual disclosed.

---

**Sources**:
- `BOOTSTRAP_LESSONS.md:119-124` (BL-13 exact text)
- `BOOTSTRAP_LESSONS_universal.md:101-108` (mirror)
- `reports/recommendation-eradev-framework-invariant-20-2026-05-19.md` (genesis recommendation, read fully)
- `reports/meta_reflection_en_2026-05-19.md:14,23,28,101-121,135-141` (EN lens — adopt-now)
- `reports/meta_reflection_ru_2026-05-19.md:17,84-95,109,120,126` (RU lens — defer per BL-13 strict)
- `reports/eradev_final_improvement_roadmap_2026-05-19.md:24,34,63-66` (operator synthesis — R-3 task spec)
- Empirical grep: 0 DOCX hits across all framework BL + project lessons files
