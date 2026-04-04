# EraDev Synchronization Audit Report

> Validator: Claude Opus 4.6 | Date: 2026-04-02
> Scope: ALL files in eradev/ (excluding reports/)
> Method: Full pairwise comparison of all bilingual file pairs, stale reference scan, file tree validation

---

## 1. eradev.md (EN) vs eradev_RU.md (RU)

### VERSION MISMATCH -- HIGH SEVERITY

| Attribute | eradev.md (EN) | eradev_RU.md (RU) |
|-----------|---------------|-------------------|
| **Version** | **7.1** | **7.0** |
| **Section 0 (Language Policy)** | PRESENT (full dual-language architecture, task routing table) | **MISSING** |
| **S_adjusted formula** | PRESENT (Section III, Adjusted Coherence S_adjusted with 3 diagnostic bands) | **MISSING** |
| **Graduated Activation** | PRESENT (Section IV, GREEN/YELLOW/RED status table) | **MISSING** (binary Andon only) |
| **Bilingual Strategy in True North** | PRESENT (Section I, dual-language coverage paragraph) | **MISSING** |
| **Default weights** | PRESENT ("Default: w1 = w2 = w3 = w4 = 0.25") | **MISSING** |

### Section-by-section comparison

| Section | EN | RU | Match? |
|---------|----|----|--------|
| 0. Language Policy | Present | **ABSENT** | NO |
| I. True North | Has bilingual strategy paragraph | No bilingual paragraph | PARTIAL |
| II. Formula B | w_i defaults stated | No w_i defaults | PARTIAL |
| III. Collective Formulas | Has S_adjusted subsection | **No S_adjusted** | NO |
| IV. Activation Operator | Graduated Activation (GREEN/YELLOW/RED) | Binary pass/fail only | NO |
| V. Five Roles | Identical structure | Identical structure | YES |
| VI. Round Table | Identical | Identical | YES |
| VII. Andon | Identical | Identical | YES |
| VIII. Levels 3-6-9 | Identical | Identical | YES |
| IX. Spiral Gap | Identical | Identical | YES |
| X. Task Classification | Identical | Identical | YES |
| XI. TPS Integration | Identical | Identical | YES |
| XII. Bottleneck Expansion | Identical | Identical | YES |
| XIII. Kill-Switch | Identical | Identical | YES |
| XIV. Jidoka Self-Check | Identical format | Identical format | YES |
| XV. Output Format | Identical | Identical | YES |
| XVI. Glossary table | Identical entries | Identical entries | YES |
| XVII. What Lives Where | Identical structure | Identical structure | YES |

### Summary for this pair
- **4 major sections in EN that are completely absent from RU**: Language Policy, S_adjusted, Graduated Activation, Bilingual Strategy in True North
- **Version number is desynchronized**: 7.1 vs 7.0

---

## 2. meta.md (EN) vs meta_RU.md (RU)

### FULLY SYNCHRONIZED

| Attribute | meta.md (EN) | meta_RU.md (RU) | Match? |
|-----------|-------------|-----------------|--------|
| Sections count | 14 | 14 | YES |
| Section numbering | 1-14 | 1-14 | YES |
| Formulas | All present | All present | YES |
| B formula | B = F * E * (1-sigma) * Lambda | B = F * E * (1-sigma) * Lambda | YES |
| S formula | S = 1 - (2/n(n-1)) * SUM\|Bi-Bj\| | Same | YES |
| Task Classification table | S/M/L/XL with agents, RT, I(C) | Same | YES |
| MM1-MM5 | All present | All present | YES |
| L1/L2/L3 hierarchy | Present | Present | YES |
| Phantom Coherence Detector | Present | Present | YES |
| Lambda Enforcement | Present | Present | YES |
| A3 template | Present | Present | YES |

### Summary
This pair is structurally and semantically synchronized. Pure translation, no content drift.

---

## 3. Role File Pairs

### 3.1 visionary.md (RU) vs visionary_EN.md (EN)

| Attribute | RU | EN | Match? |
|-----------|----|----|--------|
| Mission | Same | Same | YES |
| Activation Operator (4 steps) | Present | Present | YES |
| Responsibilities (5 items) | Same | Same | YES |
| Zone Detection | Present | Present | YES |
| Inverted IFR | Present | Present | YES |
| Key Rules (6 items) | Same content | Same content | YES |
| Anti-patterns (4 items) | Same | Same | YES |
| Jidoka Self-Check format | Same | Same | YES |
| Output Format | Same | Same | YES |

**Verdict: FULLY SYNCHRONIZED**

### 3.2 analyst.md (RU) vs analyst_EN.md (EN)

| Attribute | RU | EN | Match? |
|-----------|----|----|--------|
| Mission | Same | Same | YES |
| Activation Operator | Same | Same | YES |
| Responsibilities (5 items) | Same | Same | YES |
| Key Rules (6 items) | Same | Same | YES |
| Bottleneck Expansion Protocol | Present | Present | YES |
| Muri Detector | Present | Present | YES |
| Anti-patterns | Same | Same | YES |
| Jidoka Self-Check | Same format | Same format | YES |
| Output Format | Same | Same | YES |

**Verdict: FULLY SYNCHRONIZED**

### 3.3 builder.md (RU) vs builder_EN.md (EN)

| Attribute | RU | EN | Match? |
|-----------|----|----|--------|
| Mission | Same | Same | YES |
| Activation Operator | Same | Same | YES |
| Responsibilities (4 items) | Same | Same | YES |
| Key Rules (7 items) | Same | Same | YES |
| Security Checklist (4 items) | Same | Same | YES |
| Decision-Point Checklist | Same | Same | YES |
| Anti-patterns (5 items) | Same | Same | YES |
| Jidoka Self-Check | Same format | Same format | YES |
| Output Format | Same | Same | YES |

**Verdict: FULLY SYNCHRONIZED**

### 3.4 validator.md (RU) vs validator_EN.md (EN)

| Attribute | RU | EN | Match? |
|-----------|----|----|--------|
| Mission | Same | Same | YES |
| Activation Operator | Same | Same | YES |
| Responsibilities (5 items) | Same | Same | YES |
| Key Rules (6 items) | Same | Same | YES |
| Managed Dissonance Scale (5 levels) | Same | Same | YES |
| Mura Detector (3 items) | Same | Same | YES |
| Anti-patterns (4 items) | Same | Same | YES |
| Jidoka Self-Check | Same format | Same format | YES |
| Output Format | Same | Same | YES |

**Verdict: FULLY SYNCHRONIZED**

### 3.5 coherent.md (RU) vs coherent_EN.md (EN)

| Attribute | RU | EN | Match? |
|-----------|----|----|--------|
| Mission | Same | Same | YES |
| Activation Operator | Same | Same | YES |
| L1/L2/L3 levels | Same | Same | YES |
| Responsibilities (5 items) | Same | Same | YES |
| Key Rules (6 items) | Same | Same | YES |
| Distinction Crystallization | Same | Same | YES |
| Agent Brief Template | Same | Same | YES |
| Anti-patterns (4 items) | Same | Same | YES |
| Jidoka Self-Check (with S_team) | Same | Same | YES |
| Output Format | Same | Same | YES |

**Verdict: FULLY SYNCHRONIZED**

---

## 4. glossary.md (Bilingual v4.0) vs glossary_EN.md (EN-only v3.0)

### SEVERE DESYNCHRONIZATION -- HIGH SEVERITY

| Attribute | glossary.md (v4.0) | glossary_EN.md (v3.0) |
|-----------|-------------------|----------------------|
| **Version** | **v4.0** | **v3.0** |
| **Format** | Bilingual (EN + RU in every cell) | EN-only |
| **Total terms** | **44** | **30** |
| **Canonical Forms table** | PRESENT (44 entries, deprecated aliases column) | **ABSENT** |
| **S_adjusted** | PRESENT (#38) | **ABSENT** |
| **Graduated Activation** | PRESENT (#39) | **ABSENT** |
| **Interface Contract** | PRESENT (#40) | **ABSENT** |
| **Lambda Bootstrap** | PRESENT (#41) | **ABSENT** |
| **Language Policy** | PRESENT (#42) | **ABSENT** |
| **Kill-Switch** | PRESENT (#43) | **ABSENT** |
| **Absorbing States** | PRESENT (#44) | **ABSENT** |
| **Used by (roles) column** | PRESENT in every row | **ABSENT** |
| **n_min calculation** | Present in Key Numerical Values | **ABSENT** |
| **RU definitions** | Present in every row | N/A (EN-only file) |
| **Observation Levels table** | Has bilingual labels | EN-only labels |
| **Five Roles table** | 6 columns (EN name, RU name, question, operator, B, operations) | 4 columns (role, question, operator, operations) |
| **Absorbing States table** | 5 columns (EN state, RU state, B, EN desc, RU desc) | 4 columns (state, B, desc, indicator) |
| **core/{role}.md reference** | PRESENT in O_hat row (#11) | PRESENT in O_hat row (#22) |

### Terms present in glossary.md but MISSING from glossary_EN.md (14 terms):
1. Coherence Cluster (#35)
2. Cluster Hierarchy (#36)
3. Damper Capacity (#37)
4. S_adjusted (#38)
5. Graduated Activation (#39)
6. Interface Contract (#40)
7. Lambda Bootstrap (#41)
8. Language Policy (#42)
9. Kill-Switch (#43)
10. Absorbing States (#44)
11. Coherence Dynamics dB/dt (#18 in v4.0 -- present but different format)
12. Perveance P (#19 in v4.0)
13. Focus F / Alignment E / Entropy sigma / Experience Lambda as separate entries (#6-9 in v4.0 -- in v3.0 they exist but numbered differently)

### Summary
glossary_EN.md is a STALE version (v3.0) with only 30 terms. glossary.md is the current canonical version (v4.0) with 44 terms in bilingual format. The EN-only file has not been updated to match.

---

## 5. CHECKLIST.md (RU) vs CHECKLIST_EN.md (EN)

### FULLY SYNCHRONIZED

| Section | RU | EN | Match? |
|---------|----|----|--------|
| 1. Pre-Commit (10 items) | Present | Present | YES |
| 2. Pre-Deploy (10 items) | Present | Present | YES |
| 3. Security Baseline (10 items) | Present | Present | YES |
| 4. RT-3 Acceptance Criteria | Present | Present | YES |
| 4.1 Functionality (4 items) | Same | Same | YES |
| 4.2 Coherence/ODTOE (4 items) | Same | Same | YES |
| 4.3 Process (5 items) | Same | Same | YES |
| 4.4 Documentation (3 items) | Same | Same | YES |
| 5. Severity Levels (BLOCK/WARN/INFO) | Same | Same | YES |

**Verdict: FULLY SYNCHRONIZED. All items, severity levels, and notes match.**

---

## 6. MEMORY_TEMPLATE.md (RU) vs MEMORY_TEMPLATE_EN.md (EN)

### FULLY SYNCHRONIZED

| Section | RU | EN | Match? |
|---------|----|----|--------|
| 1. Iron Rules | Same format | Same format | YES |
| 2. Patterns (with role tags) | Same | Same | YES |
| 3. Mega-Patterns | Same | Same | YES |
| 4. Metrics table | Same formulas, thresholds | Same | YES |
| 5. Decision Log | Same | Same | YES |
| 6. A3 Templates | Same | Same | YES |
| 7. Quick Start (5 steps) | Same | Same | YES |
| HTML comments (guidelines) | Same | Same | YES |

**Verdict: FULLY SYNCHRONIZED**

---

## 7. README.md (RU) vs README_EN.md (EN)

### PARTIAL DESYNCHRONIZATION -- MEDIUM SEVERITY

| Attribute | README.md (RU) | README_EN.md (EN) |
|-----------|---------------|-------------------|
| **Title version** | **"EraDev v3.0"** (STALE) | **"EraDev v7.1"** (CORRECT) |
| **Footer version** | "EraDev v7.1" (correct) | "EraDev v7.1" (correct) |
| **Description paragraph** | Longer, includes "EraDev turns theoretical formulas..." sentence | Shorter, omits that sentence |
| **File tree** | Shows `experiment_en/` directory | **Does not show** `experiment_en/` |
| **File tree** | Shows only `{role}.md` (RU only, no EN pairs) | Shows `{role}.md / _EN.md` pairs |
| **File tree** | Shows `meta.md` only | Shows `meta.md / meta_RU.md` |
| **File tree** | Missing `BOOTSTRAP_LESSONS.md` | **Present**: `BOOTSTRAP_LESSONS.md` |
| **File tree** | Missing `interfaces.md` | **Present**: `interfaces.md` |
| **File tree** | Missing `eradev_RU.md` | **Present**: `eradev_RU.md` |
| **File tree** | Missing `README_EN.md` | **Present**: `README_EN.md` |
| **File tree** | Missing `glossary_EN.md` | **Present**: implied by `glossary.md` description |
| **File tree** | Missing `MEMORY_TEMPLATE_EN.md` | **Present**: implied by `_EN.md` pattern |
| **Bootstrap prompts** | 3 variants (universal, with project, 2 project examples) | Same 3 variants | YES |
| **Quick Start sections** | 6 sections | 6 sections | YES |
| **Core File References table** | 10 files listed (no `_EN` pairs) | 11 files listed (with `_EN` pairs, `interfaces.md`, `BOOTSTRAP_LESSONS.md`) |
| **Principles** | 5 principles | 5 principles | YES |

### Summary
- README.md title says "v3.0" but footer says "v7.1" -- internal inconsistency.
- README.md file tree is stale: missing 6+ files that exist on disk, references non-existent `experiment_en/` directory.
- README_EN.md file tree is more current and accurate.

---

## 8. projects/README.md (RU) vs projects/README_EN.md (EN)

### FULLY SYNCHRONIZED

| Section | RU | EN | Match? |
|---------|----|----|--------|
| 1. Project Directory Structure | Same tree | Same tree | YES |
| 2. Initializing MEMORY.md (4 steps) | Same | Same | YES |
| 3. Initializing spiral_log.md | Same | Same | YES |
| 4. Filling in config.md | Same rules | Same rules | YES |
| 5. Transferring Patterns | Same | Same | YES |
| 6. Adapting Roles (small/medium/large) | Same | Same | YES |
| 7. Project Readiness Checklist (7 items) | Same | Same | YES |

**Verdict: FULLY SYNCHRONIZED**

---

## 9. Stale Reference Checks

### 9.1 References to non-existent "core/" path

| File | Line | Reference | Status |
|------|------|-----------|--------|
| `glossary.md` | 75 | "R = O_hat(Psi); defined in core/{role}.md" | **STALE** -- no `core/` directory exists |
| `glossary_EN.md` | 32 | "O_hat is defined in core/{role}.md" | **STALE** -- no `core/` directory exists |

Role files live at `eradev/{role}.md` and `eradev/{role}_EN.md`, not `core/{role}.md`.

### 9.2 Stale version "v3.0" (should be v7.1)

| File | Line | Content | Status |
|------|------|---------|--------|
| `README.md` | 1 | "# EraDev v3.0" | **STALE** (footer says v7.1) |
| `glossary_EN.md` | 1 | "# EraDev Unified Glossary v3.0" | **STALE** (glossary.md is v4.0) |
| `glossary_EN.md` | 92 | "EraDev v3.0 | 2026-04-02" | **STALE** |
| `LOADING_PROTOCOL.md` | 98 | "EraDev v3.0 | Agent Loading Protocol" | **STALE** |

### 9.3 eradev_RU.md version "7.0" (should be 7.1)

| File | Line | Content | Status |
|------|------|---------|--------|
| `eradev_RU.md` | 3 | "Версия: 7.0" | **STALE** (eradev.md is 7.1) |

### 9.4 Old S_adjusted formula (with w_role)

No occurrences of `w_role` found anywhere. The current formula `S_adjusted = S_team * B_mean` is consistent wherever S_adjusted appears (eradev.md, glossary.md, BOOTSTRAP_LESSONS.md, interfaces.md). **PASS.**

### 9.5 S_adjusted presence check

| File | S_adjusted present? |
|------|-------------------|
| eradev.md (EN) | YES (Section III) |
| eradev_RU.md (RU) | **NO** -- missing entirely |
| glossary.md (v4.0) | YES (#38) |
| glossary_EN.md (v3.0) | **NO** -- missing |
| meta.md (EN) | NO (uses Phantom Coherence Detector qualitative, not S_adjusted formula) |
| meta_RU.md (RU) | NO (same) |
| BOOTSTRAP_LESSONS.md | YES (BL-4) |
| interfaces.md | YES (coherencer_output schema has `s_adjusted` field) |

### 9.6 Non-existent `experiment_en/` directory

README.md file tree references `experiment_en/` but this directory does not exist on disk.

### 9.7 Non-existent `roles/` and `templates/` directories

eradev.md (EN) Section XVII and eradev_RU.md Section XVII both reference:
- `roles/` -- "Role prompts (universal + project overlay)"
- `templates/` -- "A3, agent launch, result format"

Neither directory exists on disk. Role files live at top level (`eradev/{role}.md`).

---

## 10. File Tree Validation (README vs Disk)

### README.md (RU) file tree -- PROBLEMS FOUND

| Listed in README.md | Exists on disk? | Issue |
|---------------------|----------------|-------|
| `experiment_en/` | NO | Directory does not exist |
| `eradev_RU.md` | YES | **NOT listed** in RU README file tree |
| `README_EN.md` | YES | **NOT listed** |
| `BOOTSTRAP_LESSONS.md` | YES | **NOT listed** |
| `interfaces.md` | YES | **NOT listed** |
| `glossary_EN.md` | YES | **NOT listed** |
| `MEMORY_TEMPLATE_EN.md` | YES | **NOT listed** |
| `analyst_EN.md` | YES | **NOT listed** |
| `builder_EN.md` | YES | **NOT listed** |
| `validator_EN.md` | YES | **NOT listed** |
| `coherent_EN.md` | YES | **NOT listed** |

### README_EN.md file tree -- MINOR ISSUES

The EN README uses compact notation (`{role}.md / _EN.md`) which covers both variants. However:

| Listed in README_EN.md | Exists on disk? | Issue |
|------------------------|----------------|-------|
| `glossary_EN.md` | YES | Not explicitly listed (only `glossary.md` is listed) |
| All other files | YES | Correctly listed |

### eradev.md / eradev_RU.md Section XVII file tree

Both reference `roles/` and `templates/` directories that **do not exist**. Role files are at the top level, not in a `roles/` subdirectory.

---

## 11. interfaces.md Role Reference Check

interfaces.md defines 5 handoff contracts:

| Contract | From -> To | Roles referenced correctly? |
|----------|-----------|---------------------------|
| 1. Visionary -> Analyst | Visionary, Analyst | YES |
| 2. Analyst -> Builder | Analyst, Builder | YES |
| 3. Builder -> Validator | Builder, Validator | YES |
| 4. Validator -> Coherencer | Validator, Coherencer | YES |
| 5. Coherencer -> All Roles | Coherencer, All | YES |

The contract names use "Coherencer" consistently (matching glossary.md canonical form). All YAML schemas reference correct role names. The `s_adjusted` field is present in the Coherencer output schema. **PASS.**

---

## 12. Additional Findings

### 12.1 LOADING_PROTOCOL.md -- version stale

Footer says "EraDev v3.0" -- should be v7.1.

### 12.2 BOOTSTRAP_LESSONS.md -- no EN/RU pair

BOOTSTRAP_LESSONS.md exists only in EN. No RU counterpart. This may be intentional per Language Policy (cross-project lessons in EN), but it is inconsistent with other files that have bilingual pairs.

### 12.3 interfaces.md -- no RU counterpart

interfaces.md exists only in EN. No RU counterpart. Per Language Policy this is correct (interface contracts are execution-layer, EN-only).

### 12.4 LOADING_PROTOCOL.md -- no RU counterpart

Same rationale as interfaces.md -- loading protocol is operational, EN-only.

### 12.5 Glossary role name inconsistency

- glossary.md uses "Coherencer" (canonical per Canonical Forms table)
- glossary_EN.md uses "Coherent" (deprecated alias per glossary.md row #1)
- coherent.md / coherent_EN.md are named with "coherent" (deprecated form in filename)
- interfaces.md uses "Coherencer" (canonical)

### 12.6 meta.md vs meta_RU.md: no version header

Neither meta.md nor meta_RU.md contain a version number. All other core files have version tags.

---

## SUMMARY TABLE OF ISSUES

| # | File(s) | Issue | Severity |
|---|---------|-------|----------|
| 1 | `eradev_RU.md` | Version 7.0 instead of 7.1 | **HIGH** |
| 2 | `eradev_RU.md` | Missing Section 0 (Language Policy) -- entire section absent | **HIGH** |
| 3 | `eradev_RU.md` | Missing S_adjusted formula and 3 diagnostic bands | **HIGH** |
| 4 | `eradev_RU.md` | Missing Graduated Activation (GREEN/YELLOW/RED) | **HIGH** |
| 5 | `eradev_RU.md` | Missing Bilingual Strategy paragraph in True North | **MEDIUM** |
| 6 | `eradev_RU.md` | Missing default weights (w1=w2=w3=w4=0.25) | **MEDIUM** |
| 7 | `glossary_EN.md` | Stale v3.0 (should be v4.0), missing 14 terms | **HIGH** |
| 8 | `glossary.md` | Reference to non-existent `core/{role}.md` path (line 75) | **MEDIUM** |
| 9 | `glossary_EN.md` | Reference to non-existent `core/{role}.md` path (line 32) | **MEDIUM** |
| 10 | `README.md` | Title says "v3.0", footer says "v7.1" -- internal contradiction | **HIGH** |
| 11 | `README.md` | File tree references non-existent `experiment_en/` directory | **MEDIUM** |
| 12 | `README.md` | File tree missing 10+ files that exist on disk | **MEDIUM** |
| 13 | `LOADING_PROTOCOL.md` | Footer says "v3.0" instead of v7.1 | **MEDIUM** |
| 14 | `eradev.md`, `eradev_RU.md` | Section XVII references non-existent `roles/` and `templates/` directories | **MEDIUM** |
| 15 | `glossary_EN.md` | Uses deprecated "Coherent" instead of canonical "Coherencer" | **LOW** |
| 16 | `meta.md`, `meta_RU.md` | No version header (all other core files have one) | **LOW** |
| 17 | `BOOTSTRAP_LESSONS.md` | No RU counterpart (may be by design per Language Policy) | **LOW** |
| 18 | `interfaces.md` | No RU counterpart (by design per Language Policy) | **LOW** |

---

## STATISTICS

| Category | Count |
|----------|-------|
| File pairs checked | 8 |
| Fully synchronized | 6 (meta, 5 roles, checklists, memory template, projects/README) |
| Partially desynchronized | 1 (README.md vs README_EN.md) |
| Severely desynchronized | 2 (eradev.md vs eradev_RU.md, glossary.md vs glossary_EN.md) |
| HIGH severity issues | 5 |
| MEDIUM severity issues | 7 |
| LOW severity issues | 4 |
| Stale "v3.0" references | 4 files |
| Stale "core/" references | 2 files |
| Non-existent directories referenced | 3 (`experiment_en/`, `roles/`, `templates/`) |

---

## RECOMMENDED ACTIONS (priority order)

1. **[HIGH]** Update `eradev_RU.md` to v7.1: add Section 0 (Language Policy), S_adjusted formula, Graduated Activation, Bilingual Strategy, default weights.
2. **[HIGH]** Update `glossary_EN.md` to v4.0: add 14 missing terms, Canonical Forms table, bilingual format, "Used by" column.
3. **[HIGH]** Fix `README.md` title from "v3.0" to "v7.1".
4. **[MEDIUM]** Update `README.md` file tree to match actual disk structure (remove `experiment_en/`, add missing files).
5. **[MEDIUM]** Fix `core/{role}.md` references in both glossary files to `{role}.md` / `{role}_EN.md`.
6. **[MEDIUM]** Update `LOADING_PROTOCOL.md` footer version from v3.0 to v7.1.
7. **[MEDIUM]** Fix Section XVII in both `eradev.md` and `eradev_RU.md`: replace `roles/` and `templates/` with actual flat file layout.
8. **[LOW]** Standardize role name to "Coherencer" in `glossary_EN.md` and consider renaming `coherent.md` / `coherent_EN.md` files.
9. **[LOW]** Add version headers to `meta.md` and `meta_RU.md`.

---

*Report generated by Validator Agent | EraDev sync_audit | 2026-04-02*
