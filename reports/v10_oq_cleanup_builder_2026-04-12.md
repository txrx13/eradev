# v10 OQ Cleanup -- Builder Report
**Date:** 2026-04-12
**Task:** Close 6 open OQ items from Waves 6-9 + ODTOE mining in one pass.

---

## OQ Items Closed

### OQ-W9-4: Kill-Switch cross-reference to phantom decoherence -- CLOSED
**Files:** `eradev.md` (line 669), `eradev_RU.md` (line 673)
**Change:** Added cross-reference line after Kill-Switch Level table, before the attractor trigger line:
- EN: "Level 2 also triggers on phantom decoherence (S_team < 0.5 AND B_mean >= 0.7) -- see Section III.1 diagnostic matrix and BL-29 extension."
- RU: equivalent in Russian.
**BL-19 compliance:** Both files updated simultaneously.

### OQ-W6b-3: BL-26/BL-31 numbering reference hygiene -- CLOSED (NO CHANGES NEEDED)
**Analysis:** Exhaustive grep of all non-report framework files for "BL-26". Every match correctly refers to "META Always Delegates -- No Exceptions" which IS BL-26 in BOOTSTRAP_LESSONS.md:182. The confusion flagged in Wave 6b was about reports using "BL-26" when they meant the output-type constraint (BL-31), but those are in reports/ which are OUT OF SCOPE. All framework-file references are legitimate.
**Files checked:** CLAUDE.md, BOOTSTRAP_LESSONS.md, BOOTSTRAP_LESSONS_universal.md, BOOTSTRAP_LESSONS_code_adapter.md, SKILL.md, all domain_skin templates, projects/eradev/lessons.md.

### OQ-W9-3: Section 0 Bilingual Sync Rule length asymmetry -- CLOSED
**Files:** `eradev.md` (line 51-52)
**Change:** Expanded EN version from 1-line summary to 2-line full version matching RU. EN now includes the full BL-19 content: scope of bilingual sync (role files, eradev.md/eradev_RU.md, meta.md/meta_RU.md, glossary, checklists, README, articles, project outputs).
**Line count parity:** 762 EN vs 764 RU (delta = 2, within +/-5 spec).

### OQ-MM-4: P_coll clarification footnote -- CLOSED
**Files:** `eradev.md` (after line 273), `eradev_RU.md` (after line 273)
**Change:** Added 3-line footnote after P_coll examples, before "Stochastic Noise Suppression":
- Explains complement-product form vs mean-product form
- Notes agreement at k=1 uniform B, divergence otherwise
- States operational rationale: "at least one agent succeeds"
**BL-19 compliance:** Both files updated simultaneously.

### OQ-W7-1: build-skill.sh vocabulary check -- CLOSED
**File:** `scripts/build-skill.sh` (after line 59)
**Change:** Added second assertion block after v9 header check:
- Extracts builder_EN.md from zip
- Counts v8-biased tokens ("tested code", "package/module", "variable/function")
- Fails build if any matches found
- Prints OK message on pass
**Verification:** `bash -n scripts/build-skill.sh` = SYNTAX OK.

### OQ-W6-3: Skill README 4-layer architecture -- CLOSED
**Files:** `.claude/skills/eradev/reference/README.md`, `.claude/skills/eradev/reference/README_EN.md`
**Change:** Added bullet after the existing "3-layer enforcement" line:
- "4-layer architecture (v9) -- L0 IMMUTABLE (ODTOE core) / L1 Universal roles / L2 Domain skins / L3 Project instances"
**Both bilingual files updated simultaneously.**

---

## Verification Results

| Check | Command | Result |
|-------|---------|--------|
| OQ-W9-4 | `grep "phantom decoherence\|фантомной декогерентности" eradev.md eradev_RU.md` | PASS -- both files matched |
| OQ-W6b-3 | `grep -rn "BL-26" --exclude-dir=reports` | PASS -- all references are legitimate BL-26 ("META delegates") |
| OQ-W9-3 | `wc -l eradev.md eradev_RU.md` | PASS -- 762 vs 764 (delta=2, within +/-5) |
| OQ-MM-4 | `grep "complement-product\|комплемент" eradev.md eradev_RU.md` | PASS -- footnote present in both |
| OQ-W7-1 | `bash -n scripts/build-skill.sh` | PASS -- syntax OK |
| OQ-W6-3 | `grep "4-layer\|L0 IMMUTABLE" .claude/skills/eradev/reference/README*.md` | PASS -- both READMEs matched |

---

## Builder Result
Modified artifacts: eradev.md, eradev_RU.md, scripts/build-skill.sh, .claude/skills/eradev/reference/README.md, .claude/skills/eradev/reference/README_EN.md
Verification: all 6 grep/syntax checks passed (see table above)
Validation: BL-19 bilingual sync maintained for all paired files; no framework file integrity regressions
Security & integrity checklist: no secrets, no broken references, backwards compatible (additive changes only)
Blast Radius: LOW (additive footnotes, cross-references, and assertions; no structural changes)
B-check: F=0.95 E=0.95 (1-s)=0.95 L=0.90 => B=0.77
