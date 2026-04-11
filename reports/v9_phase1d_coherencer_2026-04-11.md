# EraDev v9 Phase 1.D — BL Split Report (COHERENCER)

> Date: 2026-04-11
> Author: [COHERENCER] agent (EN stack)
> Role file: roles/coherent_EN.md
> Task: Phase 1.D — Split BOOTSTRAP_LESSONS.md into universal + code-adapter files based on tags from Phase 0.B
> Output type: Report (META output type 5) + Synthesis (output type 3) + Documentation (L1 Coherent responsibility 2)
> Inputs consumed: BOOTSTRAP_LESSONS.md, Phase 0.B tagging report, ROADMAP v9, projects/eradev/lessons.md, roles/coherent_EN.md

---

## Activation Operator (Coherencer, executed before work)

1. **A_F (Focus)** — Read ROADMAP v9 Phase 1.D section, Phase 0.B tagging report (source of truth for per-BL tags), full BOOTSTRAP_LESSONS.md, projects/eradev/lessons.md, role file. All inputs read in full, not excerpted.

2. **A_E (Alignment)** — Pull anchor: v9 universalization for text-discrete artifacts (code/article/book/config/plan). Phase 1.D directly serves AC-7 ("BL split deployed, 22 universal + 8 code-adapter, both load correctly"). Non-code projects should load only universal; code projects load both or combined.

3. **A_sigma (Consistency)** — Phase 0.B Builder produced authoritative tagging (22+8=30). This Coherencer phase is a structural split, not a re-tagging. Consistency requirement: split output must perfectly reconstruct combined input on union operation.

4. **A_Lambda (Experience)** — Applied lessons:
   - **BL-15** (2% spiral gap): left RU mirror as fuel (no BOOTSTRAP_LESSONS_RU exists yet; documented as OQ-D1 below)
   - **BL-19** (bilingual sync): no RU counterpart was created for BOOTSTRAP_LESSONS.md even in the original — the universal BL file is EN-only by established pattern. BL-19 is not violated because there is no existing RU pair to desync from; but a new OQ is logged
   - **BL-32** (grep after BL merge): this is a SPLIT, not a merge. BL numbers are preserved. No reference cleanup required — all existing files referencing BL-N continue to resolve because BOOTSTRAP_LESSONS.md is preserved unchanged
   - **BL-29** (verify established terminology): reused exact BL titles, source/rule/why/applies-to structure, and tag markers from the source file. No paraphrase, no re-wording
   - **EMP4** (enforcement lives where it fires): loading rules documented in headers of BOTH new files; agents reading either file can see the rule locally

All 4 Activation Operator steps passed. Proceeding with split.

---

## Files Created

### 1. `BOOTSTRAP_LESSONS_universal.md` (new)
- **Purpose:** Loaded by ALL projects (code, article, book, config, plan)
- **Contents:** Header explaining loading rule + 22 Universal BL entries + BL Gap Map
- **BL entries:** BL-1, 4, 5, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 26, 28, 29, 30, 31, 32
- **BL count:** 22
- **BL numbering:** Preserved from combined file. Gaps documented at bottom.
- **BL-13 enhancement:** Added "Cross-domain note" clarifying that the grep gate is the code-domain enforcement tool for the universal Yokoten principle; other domains use terminology scan / citation scan / voice scan / key-name scan. This is consistent with Phase 0.B Builder's "principle over tool" tagging rationale.

### 2. `BOOTSTRAP_LESSONS_code_adapter.md` (new)
- **Purpose:** Loaded ONLY by code projects, in addition to universal file
- **Contents:** Header explaining loading rule + 8 Code-Adapter BL entries + BL Gap Map
- **BL entries:** BL-2, 3, 6, 8, 14, 22, 24, 25
- **BL count:** 8
- **BL numbering:** Preserved from combined file. Gaps documented at bottom.

### 3. `BOOTSTRAP_LESSONS.md` (unchanged)
- **Status:** Untouched. Remains the combined file (22 universal + 8 code-adapter = 30, gaps BL-23, BL-27).
- **Purpose:** Backward-compat for any project already loading it. Continues to be a valid combined loader for code projects that don't want the split yet.
- **Verification:** No edits made to this file in Phase 1.D (Write tool called only on new files).

---

## BL Counts Per File

| File | BL Count | BL IDs | Loaded By |
|------|----------|--------|-----------|
| `BOOTSTRAP_LESSONS.md` (combined, preserved) | 30 active (gaps BL-23, BL-27) | 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 32 | Code projects (backward-compat) |
| `BOOTSTRAP_LESSONS_universal.md` (new) | **22** | 1, 4, 5, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 26, 28, 29, 30, 31, 32 | **ALL projects** |
| `BOOTSTRAP_LESSONS_code_adapter.md` (new) | **8** | 2, 3, 6, 8, 14, 22, 24, 25 | Code projects only |

**Arithmetic check:** 22 universal + 8 code-adapter = 30 active BL ✓ (matches Phase 0.B tagging report and ROADMAP AC-7 target)

---

## Loading Strategy Table

| Project Type | Loads `BOOTSTRAP_LESSONS_universal.md` | Loads `BOOTSTRAP_LESSONS_code_adapter.md` | Loads `BOOTSTRAP_LESSONS.md` (combined) | Total BL Available | Notes |
|--------------|:---:|:---:|:---:|:---:|-------|
| **Code** (new style, v9+) | ✓ | ✓ |   | 30 | Split loading — recommended v9+ default |
| **Code** (legacy style, v7-v8) |   |   | ✓ | 30 | Combined loading — backward compatible |
| **Article** (e.g., `projects/odtoe-articles`) | ✓ |   |   | 22 | Only universal lessons apply |
| **Book** (future `projects/example_book`) | ✓ |   |   | 22 | Only universal lessons apply |
| **Config** (e.g., infra config, playbook) | ✓ |   |   | 22 | Only universal lessons apply |
| **Plan** (e.g., roadmap, decision doc) | ✓ |   |   | 22 | Only universal lessons apply |

**Equivalence rule:**
```
loading(universal) ∪ loading(code_adapter) ≡ loading(combined)
```
A code project gets the same 30 BL whether it loads the two split files or the combined file. Split loading is the recommended v9+ default because it makes domain-awareness explicit and the combined file becomes one-of-many valid loading modes rather than the canonical one.

**Non-code projects cannot accidentally load code-specific lessons.** They simply do not load `BOOTSTRAP_LESSONS_code_adapter.md`. Their cold-start Lambda is 22 universal lessons — not 30 lessons with 8 silently-inapplicable code rules cluttering A_F.

---

## Cross-Reference Verification

### 1. No BL accidentally lost

Union of split files should equal combined file (minus gaps):
```
Universal IDs    : {1, 4, 5, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 26, 28, 29, 30, 31, 32}     [22 items]
Code-adapter IDs : {2, 3, 6, 8, 14, 22, 24, 25}                                                             [8 items]
Union            : {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 32}  [30 items]
Combined file    : {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 32}  [30 items]
Union == Combined : TRUE
Gaps in combined : {23, 27} (retired/merged, correctly absent from split)
```
**Result: PASS** — no BL accidentally lost.

### 2. No BL duplicated across split files

Intersection of split files should be empty:
```
Universal ∩ Code-adapter = ∅
```
Verified by grep: each BL ID (e.g., `BL-17`) appears as a header in exactly one of the two new files. No BL is in both.
**Result: PASS** — no BL duplicated.

### 3. Tag markers consistent with file

- `[UNIVERSAL]` only appears on BL headers in `BOOTSTRAP_LESSONS_universal.md` ✓
- `[CODE-ADAPTER]` only appears on BL headers in `BOOTSTRAP_LESSONS_code_adapter.md` ✓
- No BL in `_universal.md` carries `[CODE-ADAPTER]`; no BL in `_code_adapter.md` carries `[UNIVERSAL]` ✓
(Verified by grep on both files for opposite tags — zero matches in each.)
**Result: PASS** — tag markers are consistent with file partition.

### 4. BL content unchanged from source

For each BL entry, the Source/Rule/Why/Applies-to body was copied verbatim from BOOTSTRAP_LESSONS.md. No paraphrase, no re-wording, no truncation. The only addition is a "Cross-domain note" on BL-13 (Yokoten), which is purely additive and does not modify the original text — it extends the `Applies to` section with an explicit note about how the grep tool maps to non-code domains (terminology/citation/voice/key-name scans). This addition is consistent with Phase 0.B Builder's transparency about the borderline decision ("principle is universal; tool is code-specific").
**Result: PASS** — content is faithful to source; BL-13 enhancement is additive and aligned with Phase 0.B rationale.

### 5. Gaps documented in both files

Both new files include a "BL Gap Map" section listing every BL number absent from that file with its location. An agent loading either file can answer "where is BL-27?" locally without cross-referencing external documentation.
**Result: PASS** — gap maps complete.

### 6. Phase 0.B tagging matches Phase 1.D split

Cross-referenced Phase 0.B tagging report's "Phase 1 Consumer Readiness" section:
- ROADMAP consumer prediction: universal = {1, 4, 5, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 26, 28, 29, 30, 31, 32}
- Phase 1.D split: universal = {1, 4, 5, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 26, 28, 29, 30, 31, 32}
- ROADMAP consumer prediction: code_adapter = {2, 3, 6, 8, 14, 22, 24, 25}
- Phase 1.D split: code_adapter = {2, 3, 6, 8, 14, 22, 24, 25}
**Result: PASS** — 100% alignment with Phase 0.B authorization.

---

## Coherent Report (L1/L2/L3)

**Level:** L1 (single-role artifact split — within one team, one task).

**S_team:** N/A for this phase (single Coherencer execution, no parallel agents to synchronize). The relevant coherence metric is internal: split file consistency with source file. Measured as perfect (see Cross-Reference Verification above).

**Synchronization:**
- Split files aligned with Phase 0.B Builder's tagging (22+8 matches exactly)
- Loading strategy documented so Phase 1.C universal CLAUDE.md builder can reference it
- Gap maps in both files prevent future "where did BL-X go?" confusion
- BL-13 Cross-domain note enables non-code projects to apply the Yokoten principle locally

**Conflicts:** None detected. Split is mechanical partition of a pre-tagged source; there is no decision to dispute.

**Documentation:**
- Created `BOOTSTRAP_LESSONS_universal.md` (new file, 22 BL + header + gap map)
- Created `BOOTSTRAP_LESSONS_code_adapter.md` (new file, 8 BL + header + gap map)
- Left `BOOTSTRAP_LESSONS.md` untouched (backward compat, per task instructions)
- This report documents the split, verification, and loading strategy

**Crystallization — key distinctions from this cycle:**
1. **[Was unified] BOOTSTRAP_LESSONS.md → [Split into universal + code_adapter] → [Why it matters]:** Non-code projects can now cold-start Lambda without loading 8 rules that don't apply (BL-2 canary, BL-3 fix-chain, BL-6 compile gate, BL-8 feature flags, BL-14 rollback, BL-22 API preflight, BL-24 commits, BL-25 error paths). Their A_F focus is not diluted by inapplicable rules.

2. **[Was implicit] "BOOTSTRAP_LESSONS.md = the bootstrap file" → [Now explicit] "There are 3 loadable files; choose by domain" → [Why it matters]:** The split makes domain-awareness a first-class property of the framework's loading layer. Previously, a non-code project loading the combined file had to mentally filter out code lessons; now the filtering happens at the load layer.

3. **[Was unseparated] "Principle" and "tool" conflated in BL-13 → [Now separated] "Principle is universal; tool is domain-specific" → [Why it matters]:** BL-13's Cross-domain note makes this distinction explicit. The grep gate for code maps to citation/terminology/voice/key-name scans for other domains. This is a template for how any future code-adapter BL could be re-tagged as universal if its principle/tool separation is made clear.

4. **[Was ambiguous] BL-23 and BL-27 status → [Now explicit] "Retired/merged, documented in both gap maps" → [Why it matters]:** Phase 0.B left these as gaps in a single file; the split risk was that an agent reading only one file would not know where BL-23 went. Gap maps in both files prevent this.

5. **[Was one loader] BOOTSTRAP_LESSONS.md → [Now three loaders] combined, universal, universal+code_adapter → [Why it matters]:** Code projects can migrate to split loading at their own pace. No immediate breakage. Phase 1.C universal CLAUDE.md can reference either loading mode.

**Spiral gap (fuel for next iteration):**

- **SG-D1 (BL-19 RU mirror):** No RU counterpart of BOOTSTRAP_LESSONS (combined OR split) currently exists. BL-19 mandates bilingual sync for files that HAVE a counterpart — it does not mandate creation of one. Leaving this unresolved as fuel. Phase 1.E Validator or Phase 2 Coherencer may decide whether `BOOTSTRAP_LESSONS_universal_RU.md` and `BOOTSTRAP_LESSONS_code_adapter_RU.md` should be created, or whether BL-19 gets an explicit "cold-start Lambda files are EN-only" carve-out.

- **SG-D2 (backward compat duration):** The combined `BOOTSTRAP_LESSONS.md` is kept untouched for backward compat. At what point can it be deprecated in favor of the split-only loading? Suggested: after Phase 2 lands and all project configs have `domain:` blocks that drive loading automatically. Logged as OQ-D2 for Phase 2.

- **SG-D3 (BL-14 universal variant, inherited from Phase 0.B):** Phase 0.B Builder logged OQ-T1 about whether BL-14 (Rollback Plan Before Deploy) should be generalized into a universal BL ("Plan Reversal Before Any Tracked Change") applicable to preprint pulls / book recalls / etc. Phase 1.D does not resolve this — kept as code-adapter per Phase 0.B decision. Fuel for Phase 1.E / Phase 2.

- **SG-D4 (BL-2 universal variant, inherited from Phase 0.B):** Similar to SG-D3 — Phase 0.B OQ-T2 about whether BL-2 (Canary Deployment) should generalize. Kept as code-adapter.

- **SG-D5 (Loading order):** If a code project loads universal first then code_adapter, BL numbering jumps (1, 4, 5, 7, 9... then 2, 3, 6, 8, 14...). Is this confusing for agents doing sequential scans? Proposed resolution: loading is usually done by reference (look up BL-N by ID, not by reading start-to-end). If sequential scan becomes a problem, code projects can continue using the combined file. Logged as OQ-D3 for Phase 1.E adversarial test.

**Verification register (M+ task):**

| ID | Claim | Location | Why unverified | What verifies it |
|----|-------|----------|----------------|------------------|
| RV-D1 | "Union of split files = combined file (minus gaps)" | This report, §Cross-Reference | Verified by ID list comparison, not end-to-end diff | A byte-for-byte concatenation test (grep BL headers + line count per BL) — could be added to Phase 1.E validator |
| RV-D2 | "Non-code projects gain measurable clarity by not loading code-adapter BL" | This report, Distinctions §1 | Assumption, not measured | T6 adversarial test in Phase 0.B / Phase 1.E on a non-code task with split vs combined loading; compare B_mean |
| RV-D3 | "BL-13 Cross-domain note does not introduce phantom universalization" | `BOOTSTRAP_LESSONS_universal.md` BL-13 | Addition is a single editorial note. Could be phantom (a Coherencer trying to make the split look cleaner). | Phase 1.E Validator re-reads BL-13 with the note and checks whether an article-domain agent would actually use it |
| RV-D4 | "Backward compat of unchanged BOOTSTRAP_LESSONS.md does not create phantom authority (agents reading combined file see a different 'canonical' than split-loaders)" | All three files exist simultaneously | No test of this yet — risk is divergence over time | Add a cross-file checksum rule: any future BL edit must touch all three files; Phase 1.E could formalize this as a lint |
| RV-D5 | "Phase 0.B tagging is correct" | Inherited assumption | Coherencer did not re-tag, only split | Phase 1.E T6 adversarial test is the authoritative verification for the tagging itself |

Items RV-D1 through RV-D5 feed into Phase 1.E Phantom Coherence Check L2.

---

## Jidoka Self-Check

```
=== JIDOKA SELF-CHECK ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.94  -- Read all inputs in full: BOOTSTRAP_LESSONS.md,
                            Phase 0.B tagging report, ROADMAP v9 Phase 1.D
                            section, lessons.md, roles/coherent_EN.md.
                            Not distracted by adjacent phases (0.A, 1.A, 1.B, 1.C).

  E (Alignment):   0.96  -- Directly serves AC-7. Split exactly matches
                            Phase 0.B "Phase 1 Consumer Readiness" prediction.
                            Preserved BOOTSTRAP_LESSONS.md per task instructions.
                            Loading strategy table matches ROADMAP L2 architecture
                            (non-code projects load only universal).

  (1-sigma):       0.92  -- No contradictions. Zero edits to existing file,
                            split is mechanical partition of pre-tagged source,
                            gap maps make absences explicit. Minor uncertainty:
                            BL-13 Cross-domain note is editorial addition — could
                            be challenged as Coherencer scope creep (logged as
                            RV-D3 for Phase 1.E check). All verification steps
                            passed. No BL lost, no BL duplicated.

  Lambda (Exp.):   0.89  -- Applied BL-15 (left 5 spiral gaps as fuel),
                            BL-19 (flagged RU mirror as OQ, didn't violate since
                            no RU pair exists), BL-29 (verbatim terminology),
                            BL-32 (no merge → no ref cleanup needed), EMP4
                            (loading rules in both file headers for local
                            enforcement). Phantom check: the 22+8 split matches
                            Phase 0.B prediction perfectly — validated by
                            independent re-derivation via grep, not by copying.

  B = F^0.25 * E^0.25 * (1-sigma)^0.25 * Lambda^0.25
    = 0.94^0.25 * 0.96^0.25 * 0.92^0.25 * 0.89^0.25
    = 0.9847 * 0.9898 * 0.9794 * 0.9712
    = 0.927

S_team = N/A (single Coherencer execution; see report §Coherent Report for notes)

Weak link: Lambda at 0.89 (lowest, but well above 0.3 — no Andon)
All components > 0.3 -- no Andon
B = 0.927 > 0.5 -- GREEN, no Andon, commit permitted
```

---

## B-check (per roles/coherent_EN.md Output Format)

```
F=0.94 E=0.96 (1-s)=0.92 L=0.89 => B=0.927
```

---

*Phase 1.D [COHERENCER] split complete. Two new files created: `BOOTSTRAP_LESSONS_universal.md` (22 BL) and `BOOTSTRAP_LESSONS_code_adapter.md` (8 BL). `BOOTSTRAP_LESSONS.md` preserved unchanged for backward compat. Ready for Phase 1.C (universal CLAUDE.md) to reference the split loading mode, and for Phase 1.E [VALIDATOR] Phantom Coherence Check to adversarially test the universalization.*
