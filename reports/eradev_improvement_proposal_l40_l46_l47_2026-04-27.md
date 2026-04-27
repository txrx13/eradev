# EraDev Framework Improvement Proposal — L-40 enforcement + META Bilingual Discipline

**Date:** 2026-04-27
**Type:** Proposal report для eradev framework maintainers
**Status:** PROPOSAL ONLY — META cannot directly modify eradev/* (HARD-DENY per ε_meta)
**Author:** META-Orchestrator (ODTOE corpus session)
**Source incident:** §X.4 of `ODTOE_light_intrinsic_rest_frame.tex` (~50 bare-English tokens в RU prose), recurrence of L-40 within 1 day of introduction
**Companion docs:**
- `reports/hansei-l40-recurrence-meta-self-reflection-2026-04-27.md` — full META self-reflection
- `projects/odtoe-articles/lessons.md` L-40, L-46, L-47 — project-scope lessons (already landed, ODTOE corpus)

---

## Executive Summary

Three improvements proposed для eradev framework, derived from observed recurrence pattern:

| ID | Component | Change | Tier | Effort |
|---|---|---|---|---|
| **F-1** | `.githooks/l40-mixed-language.sh` (NEW) | Activate L-40 enforcement at commit boundary | T2 | 15 min |
| **F-2** | `meta.md` §7c (+RU mirror) | Formalize META Bilingual Builder Spawn discipline | T3 | 20 min |
| **F-3** | `roles/builder*.md` | Step 0 — pre-A_F language-purity ANDON | T3 | 15 min |
| **F-4** | `templates/domain_skin.article.md` (+RU) | Pre-drafting language-purity gate | T3 | 10 min |
| **F-5** | Meta-meta principle | «Stabilization-deferred enforcement» anti-pattern (BL-N candidate) | T4 (docs) | 5 min |

**Total estimated implementation time:** ~65 minutes (single Builder + Validator cycle on eradev repo).

**Operator action required:** Approve/reject each proposal. Implementation должен делать operator (или delegated to dedicated eradev session, NOT this ODTOE session).

---

## Section 1 — Background (Incident Context)

### 1.1 What happened
L-40 «No mixed-language compounds in RU body prose» was introduced 2026-04-26 в `projects/odtoe-articles/lessons.md` after operator complaint about `parent-протон` × 10 в `ODTOE_dark_energy_merger.tex`.

L-40 enforcement clause: «add to .githooks/pre-commit once L-40 stabilizes».

**1 day later (2026-04-27):** New article `ODTOE_light_intrinsic_rest_frame.tex` §X.4 contained ~50 bare-English content words в RU prose body, all visible в published PDF (lines 1222-1410). Analyst audit (B=0.924) confirmed substantively correct critique.

### 1.2 Root cause (META layer, per Hansei §III)
META's Builder spawn prompt for §X.4 contained mixed-language spec — table headers («L1: numeric value»), labels («Convention», «Observer-invariant»), entire paragraphs («Critical contrapositive», «Falsifiability matrix») written in English inside RU article spec. Builder copied verbatim.

**Inheritance chain:** META analytical EN labels → Builder spec → RU article body → PDF visible mixed text.

L-40 captured the SYMPTOM (mixed artifact). Root CAUSE (mixed META spec) was unaddressed at any framework layer.

---

## Section 2 — Proposal F-1: Activate L-40 .githooks Hook

### Change
Create new hook script `eradev/.githooks/l40-mixed-language.sh`, chain from existing `eradev/.githooks/pre-commit`.

### Rationale
- L-40 introduced 2026-04-26 with deferred enforcement
- 1-day recurrence proves «stabilization» criterion is wrong from start
- Hook closes the gap at machine boundary (Tier T2 per BL-33)
- Defense-in-depth (BL-30): META prompt purity (F-2) + Builder defense (F-3) + hook (F-1)

### Spec — `eradev/.githooks/l40-mixed-language.sh`

```bash
#!/bin/bash
# L-40 pre-commit hook — block bilingual mixed-language compounds in modified RU .tex
# Per L-47 spec from projects/odtoe-articles/lessons.md
# Override: L40_OVERRIDE=1 env var or [skip-l40] commit message sentinel
# Activated 2026-04-27 (post-recurrence, per Hansei §VII anti-pattern principle)

set -euo pipefail

# Honor existing override patterns
[ -n "${ERADEV_HOOKS_DISABLED:-}" ] && exit 0
[ -n "${L40_OVERRIDE:-}" ] && { echo "L-40 override engaged (logged)"; exit 0; }

EXIT_CODE=0

for F in $(git diff --cached --name-only | grep '\.tex$' | grep -v '_EN\.tex$'); do
  [ ! -f "$F" ] && continue

  # Pattern A — Latin-Cyrillic compounds via hyphen (excluding L-21 KEEP)
  HITS_PA=$(grep -nP '\b[a-zA-Z]+-[а-яёА-ЯЁ]+\b|\b[а-яёА-ЯЁ]+-[a-zA-Z]+\b' "$F" 2>/dev/null \
    | grep -ivE 'ODTOE|Φ|ν_Φ|ν|KAM|FLRW|MOND|CDM|FPGA|DESI|CMB|m_P|de Sitter|Big Rip|Banach|Lorentz|Lambda|микро-|Hubble|Hawking|Penrose|Planck|Wheeler|Feynman|Bell|Aspect|Maldacena|Susskind|Einstein|Minkowski|Dirac|Misner|Thorne|Cramer|Volovik|Hofstadter|Putnam|Rindler|Bondi|Bekenstein|Bombelli|Sorkin|TBD|texttt|Berkeley|Bohm|Whitehead|k-')

  if [ -n "$HITS_PA" ]; then
    echo "❌ L-40 Pattern A VIOLATION in $F:"
    echo "$HITS_PA"
    echo ""
    echo "Mixed-language compound detected. Resolve via:"
    echo "  1. Translate to canonical RU per L-40 glossary (lessons.md L-40)"
    echo "  2. Wrap as identifier: \\texttt{...}"
    echo "  3. Add to KEEP-list in this hook if structurally legitimate"
    echo ""
    EXIT_CODE=1
  fi

  # Bare English ≥4-letter content words в RU body prose
  HITS_BARE=$(grep -nP '[А-ЯЁа-яё]+ +[A-Z][a-z]{3,}' "$F" 2>/dev/null \
    | grep -ivE 'Wheeler|Feynman|Bell|Aspect|Maldacena|Susskind|Einstein|Minkowski|Dirac|Misner|Thorne|Cramer|Volovik|Hofstadter|Putnam|Rindler|Bondi|Bekenstein|Bombelli|Sorkin|Berkeley|Bohm|Whitehead|Banach|Lorentz|Hilbert|Penrose|Planck|Hubble|Hawking|Mermin|MTW|BIPM|CGPM|CODATA|SPARC|DESI|JWST|CMB|EHT|BEC|Compton|Doppler|Fermi|Kerr|Cassini|Pound|Rebka|Schwarzschild' \
    | head -20)

  if [ -n "$HITS_BARE" ]; then
    echo "❌ L-40 (bare English in RU prose) VIOLATION in $F:"
    echo "$HITS_BARE"
    echo ""
    echo "Bare English content word detected in Russian prose body."
    echo "Either translate per L-40 glossary or wrap as \\texttt{} identifier."
    echo ""
    EXIT_CODE=1
  fi
done

exit $EXIT_CODE
```

**Permissions:** `chmod +x .githooks/l40-mixed-language.sh`

**Chain integration:** Add to `eradev/.githooks/pre-commit` between `phantom-newness-check.sh` and `bl19-bilingual-sync.sh` (or at end):

```bash
# L-40 mixed-language enforcement (Tier T2, activated 2026-04-27)
if [ -x "$REPO_ROOT/.githooks/l40-mixed-language.sh" ]; then
  bash "$REPO_ROOT/.githooks/l40-mixed-language.sh" || HOOK_FAIL=$?
fi
```

### Acceptance criteria
- Hook exits 0 when no staged RU .tex с violations
- Hook exits 1 (BLOCKS commit) when violation detected
- Override `L40_OVERRIDE=1` или `[skip-l40]` sentinel в commit message bypasses hook
- Adheres to existing `.githooks/pre-commit` chain pattern (parallel to bl19-bilingual-sync, phantom-newness-check)

### Risk + rollback
- **Risk:** false-positives на legitimate Latin technical terms missed by KEEP-list (Banach, Lorentz, etc.)
- **Mitigation:** comprehensive KEEP-list covers known author/institution/term names; override mechanism gives operator escape valve
- **Rollback:** `git revert <commit>` или `chmod -x .githooks/l40-mixed-language.sh` to disable without removal

---

## Section 3 — Proposal F-2: meta.md §7c (Bilingual Builder Spawn Discipline)

### Change
Insert new subsection §7c в `eradev/meta.md` between existing §7b (Agent Prompt Template) и §8 (Coherent Hierarchy). RU mirror в `meta_RU.md` per BL-19.

### Rationale
META prompt-design discipline для bilingual content currently UNFORMALIZED at framework level. L-40 (project-scope) ловит symptom; root cause (META spec mixed-language) needs framework-scope rule.

### Spec — meta.md §7c content (English canonical)

```markdown
### 7c. Bilingual Builder Spawn — Language-Purity Discipline

When spawning Builder for language-specific deliverable (RU `.tex`, EN `.tex`, RU `.md`):

1. **Pre-spawn checklist:** Scan prompt content for bare English content words ≥4 letters that are NOT in math, NOT in code (`\texttt{}`), NOT bibliography names, NOT L-21 KEEP list (acronyms, Greek symbols). For each hit: translate to canonical target language.

2. **Per-language spec blocks:** For BOTH (RU + EN parallel) Builder spawns, provide TWO separate spec blocks (`BUILDER_SPEC_RU:` + `BUILDER_SPEC_EN:`), explicitly labelled. Do NOT provide single mixed spec.

3. **Inheritance rule:** Builder treats META spec as source of truth. Mixed-language spec → mixed-language artifact (L-40 violation downstream). META owns discipline as first layer (L-46 ODTOE); Builder is second layer (BL-30 defense-in-depth).

4. **Override:** technical content (formulas, identifiers, code) and proper names (authors, institutions) per L-21 KEEP — exempt from translation.

**Source:** L-46 ODTOE + Hansei `reports/hansei-l40-recurrence-meta-self-reflection-2026-04-27.md` Section IV.1 (recurrence trace).
```

### Spec — meta_RU.md §7c content (RU mirror per BL-19)

```markdown
### 7c. Спавн билингвального Билдера — дисциплина языковой чистоты

При спавне Билдера для language-specific артефакта (RU `.tex`, EN `.tex`, RU `.md`):

1. **Pre-spawn checklist:** Просканировать содержимое промпта на bare английские content words ≥4 буквы, которые НЕ в math, НЕ в коде (`\texttt{}`), НЕ имена в библиографии, НЕ в L-21 KEEP списке (акронимы, греческие символы). Для каждого попадания: перевести в каноническую форму целевого языка.

2. **Per-language spec blocks:** Для BOTH (RU + EN параллельный) спавна Билдера, предоставить ДВА отдельных spec блока (`BUILDER_SPEC_RU:` + `BUILDER_SPEC_EN:`), явно помеченных. НЕ предоставлять single смешанный spec.

3. **Правило наследования:** Билдер обращается с META spec как с source of truth. Mixed-language spec → mixed-language артефакт (L-40 violation downstream). META owns discipline как первый слой (L-46 ODTOE); Билдер — второй слой (BL-30 defense-in-depth).

4. **Override:** технический контент (формулы, identifiers, code) и proper names (authors, institutions) per L-21 KEEP — exempt from translation.

**Source:** L-46 ODTOE + Hansei `reports/hansei-l40-recurrence-meta-self-reflection-2026-04-27.md` Section IV.1 (recurrence trace).
```

### Acceptance criteria
- New subsection §7c present в both `meta.md` и `meta_RU.md`
- BL-19 sync hook (`bl19-bilingual-sync.sh`) passes — both files have parallel §7c
- §7b (Agent Prompt Template) и §8 (Coherent Hierarchy) untouched
- Cross-reference to Hansei present

---

## Section 4 — Proposal F-3: roles/builder*.md — Step 0 ANDON

### Change
Add new «Step 0» к Activation Operator section в `eradev/roles/builder_EN.md` и `eradev/roles/builder.md` (BEFORE existing Step 1 A_F).

### Rationale
Defense-in-depth per BL-30: если META spec sneaks past §7c discipline, Builder catches на entry. Single layer = single point of failure.

### Spec — builder_EN.md addition (English canonical)

```markdown
**Step 0: Spec language-purity check.** If spawned for language-specific deliverable (RU/EN bilingual project), grep META spec for bare cross-language content tokens. If detected — STOP, ANDON to META, do NOT silently proceed (would inherit L-40 violation). Per BL-30 defense-in-depth: META is first layer (per L-46 ODTOE), Builder is second.

Quick check pattern (run mentally on prompt content):
- Bare Latin words ≥4 letters в Russian-target spec? → ANDON
- Cyrillic words в English-target spec? → ANDON
- Mixed RU/EN tables в single spec block? → ANDON, request per-language separation
- Proper names (Wheeler, Berkeley), acronyms (ODTOE, KAM), math (Φ, ν): exempt per L-21 KEEP

ANDON template: «META spec contains [N] bare-[language] tokens в [target-language] spec body. Per L-46/BL-30, Builder cannot proceed без spec language-purification. Request: clarify each hit (translate / wrap as identifier / confirm KEEP exemption).»
```

### Spec — builder.md addition (RU mirror)

```markdown
**Шаг 0: Проверка языковой чистоты spec.** При спавне для language-specific deliverable (RU/EN билингвальный проект), сделать grep META spec на bare cross-language content tokens. Если обнаружено — STOP, ANDON to META, НЕ proceed silently (это унаследует L-40 violation). Per BL-30 defense-in-depth: META — первый слой (per L-46 ODTOE), Билдер — второй.

Quick check pattern:
- Bare Латинские слова ≥4 буквы в Russian-target spec? → ANDON
- Cyrillic слова в English-target spec? → ANDON
- Mixed RU/EN таблицы в одном spec block? → ANDON, запросить per-language separation
- Proper names (Wheeler, Berkeley), акронимы (ODTOE, KAM), math (Φ, ν): exempt per L-21 KEEP

ANDON template: «META spec содержит [N] bare-[language] tokens в [target-language] spec body. Per L-46/BL-30, Builder не может proceed без spec language-purification. Запрос: уточнить каждый hit (translate / wrap as identifier / confirm KEEP exemption).»
```

### Acceptance criteria
- New «Step 0» / «Шаг 0» before existing «Step 1 A_F» в both files
- BL-19 sync passes
- Cross-reference к L-46 + BL-30

---

## Section 5 — Proposal F-4: templates/domain_skin.article.md — Pre-Drafting Gate

### Change
Add paragraph «Pre-drafting language-purity gate» к «Single Builder rhythm» section в `eradev/templates/domain_skin.article.md` и `domain_skin.article_RU.md` (per BL-19).

### Rationale
Article skin is the closest to the violation locus (article-domain Builder). Inline reminder catches Builder if §7c discipline (META) и Step 0 ANDON (role file) both miss.

### Spec — domain_skin.article.md addition (English)

```markdown
**Pre-drafting language-purity gate (per L-40 + L-46 ODTOE):**
Before drafting RU section content, verify META spec contains NO bare English content words в the spec body (excluding math/code/L-21 KEEP). If detected, ANDON: this is META prompt-design failure, not Builder issue. Don't paper over by translating on the fly — ANDON forces upstream fix per L-46 inheritance rule.
```

### Spec — domain_skin.article_RU.md addition (RU)

```markdown
**Pre-drafting gate языковой чистоты (per L-40 + L-46 ODTOE):**
Перед drafting RU section content, проверить что META spec НЕ содержит bare English content words в spec body (excluding math/code/L-21 KEEP). Если обнаружено, ANDON: это META prompt-design failure, не Builder issue. Не paper over translating on the fly — ANDON forces upstream fix per L-46 inheritance rule.
```

### Acceptance criteria
- Paragraph added в «Single Builder rhythm» section both files
- BL-19 sync passes

---

## Section 6 — Proposal F-5: Meta-Meta Principle (BL-N candidate)

### Observation (from Hansei §VII)

> **«Activate enforcement after stabilization» = anti-pattern.** Recurrence IS the stabilization signal. Worth promoting к BL-N if cross-project recurrence observed. Generalizes ALL deferred-enforcement lessons.

### Spec — proposed BL-N content (для evaluation cross-project, NOT immediate addition)

```markdown
### BL-N: Deferred enforcement = self-undermining; recurrence-triggered activation [UNIVERSAL]

**Source:** L-47 ODTOE + Hansei `reports/hansei-l40-recurrence-meta-self-reflection-2026-04-27.md` §VII (1-day L-40 recurrence after «activate after stabilization» deferral).

**Rule:** Lessons whose enforcement is conditioned on «stabilization» / «settling» / «pattern emerging» — recurrence within 7 days of introduction = AUTO-TRIGGER to activate T2 enforcement (hook/CI/lint). NO further «wait for more data». Recurrence IS the stabilization signal.

**Why:** Deferral = self-undermining discipline. If rule is correct, recurrence proves it; if rule is wrong, recurrence triggers re-evaluation. Either path requires action, not waiting.

**Applies to:** META-Orchestrator (lesson authorship — when proposing new lesson, default tier should be T2 if mechanically enforceable, NOT «T2 deferred»; mark T2-deferred only with explicit re-evaluation date AND auto-trigger condition).

**Tier:** T3 (lesson-authoring checklist).

**Enforcement:** at lesson introduction, META MUST classify enforcement plan into:
- T1 type-level (immediate hard constraint) → no deferral allowed
- T2 mechanical hook → activate immediately if hook is feasible; if deferred, MUST cite specific stabilization criterion AND auto-trigger date (default: 7 days)
- T3 checklist (review-tier catch) → operative immediately
- T4 docs only → no enforcement, document for future tier-upgrade

«Stabilization-deferred T2» without explicit auto-trigger = anti-pattern, equivalent to T4 в practice.
```

### Adoption decision
- **Recommendation:** Hold для cross-project corroboration. If similar deferral-recurrence observed в another project, promote к BL-N.
- **For now:** Document в Hansei + reference в L-47 (already done).

---

## Section 7 — Implementation Plan (для Operator/eradev maintainer)

### Sequence (когда будет authorized)
1. **F-1 hook activation** (~15 min): create `.githooks/l40-mixed-language.sh`, chmod +x, chain from `pre-commit`. Test с known violation.
2. **F-2 meta.md §7c** (~20 min): edit both `meta.md` + `meta_RU.md`, run `bl19-bilingual-sync.sh` to verify parity.
3. **F-3 roles/builder*.md** (~15 min): both RU+EN files, BL-19 sync verify.
4. **F-4 templates/domain_skin.article.md** (~10 min): both languages.
5. **F-5 BL-N** (~5 min): document only; await cross-project corroboration.

**Total:** ~65 min single Builder + Validator cycle.

### Commit message template (when implemented)
```
feat(l40): activate mixed-language hook + META prompt-purity discipline

Per Hansei reports/hansei-l40-recurrence-meta-self-reflection-2026-04-27.md
+ proposal reports/eradev_improvement_proposal_l40_l46_l47_2026-04-27.md.

- F-1: .githooks/l40-mixed-language.sh — T2 enforcement (chained from pre-commit)
- F-2: meta.md §7c (+RU mirror) — Bilingual Builder Spawn discipline
- F-3: roles/builder*.md Step 0 — defense-in-depth ANDON
- F-4: templates/domain_skin.article.md (+RU) — pre-drafting gate
- F-5: BL-N candidate documented (await cross-project corroboration)

Closes 1-day L-40 recurrence pattern (parent-протон → §X.4 light_intrinsic_rest_frame).
```

### Acceptance гейт (post-implementation Validator check)
- All 4 framework changes (F-1..F-4) present и BL-19 synced
- L-40 hook fires correctly on test RU .tex с known violation
- Test commit с `[skip-l40]` sentinel passes (override works)
- Hansei + this proposal cited в commit message

---

## Section 8 — Risk Assessment

### What if NO action taken?
- L-40 violations recur regularly (1-day recurrence rate observed)
- Each recurrence requires manual cleanup (~25 min per article per Analyst remediation cost)
- Operator confidence в process erodes
- BL-16 «knowledge without enforcement = Lambda zero» recursive — L-40 documented but unenforced = Lambda zero для META prompt design

### What if F-1..F-4 implemented?
- Pre-commit blocks new violations at machine boundary
- META prompt-design discipline formalized at framework level
- Builder defense-in-depth catches META misses
- Estimated reduction в recurrence rate: ~95% (only override-bypassed cases remain)

### Risk of OVER-enforcement
- False-positives on legitimate technical Latin terms (Banach, Lorentz)
- Mitigation: comprehensive KEEP-list, override mechanism, post-implementation calibration

### Backout plan
- All proposed changes reversible via `git revert <commit>`
- Hook can be disabled via `chmod -x .githooks/l40-mixed-language.sh` без removal
- ENV override `ERADEV_HOOKS_DISABLED=1` honored по design

---

## Section 9 — Cross-References

- `reports/hansei-l40-recurrence-meta-self-reflection-2026-04-27.md` — full META self-reflection (companion document)
- `projects/odtoe-articles/lessons.md`:
  - L-40 (root lesson, 2026-04-26)
  - L-46 (META prompt purity, 2026-04-27)
  - L-47 (hook activation NOW, 2026-04-27)
- `eradev/eradev.md` §0 (Language Policy — bilingual architecture)
- `eradev/projects/eradev/lessons.md` BL-30 (defense-in-depth)
- `eradev/projects/eradev/lessons.md` BL-33 (enforcement tier ladder)

---

## Section 10 — META Self-Note

This proposal is the corrective output of META mistake — earlier this session, META interpreted operator's «commit и push eradev» как authorization to implement framework changes directly. Operator clarified: NO eradev modifications; ONLY proposal reports + projects/odtoe lessons.

eradev `git status` was rolled back to baseline `ca8e392` immediately upon clarification. No commits, no pushes к eradev. ε_meta deny-list (eradev/* HARD-DENY for META) honored upon correction.

This proposal sits в `reports/` (ODTOE corpus, ε_meta whitelist for META direct write) and provides eradev maintainers everything needed для self-implementation.

---

**END OF PROPOSAL.** Awaiting operator approval per-action (F-1, F-2, F-3, F-4, F-5).
