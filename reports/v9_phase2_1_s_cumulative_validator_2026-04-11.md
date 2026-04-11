# v9 Phase 2.1.S — Cumulative Validator Report (v1 + v2 skin cleanup)

**Role:** [VALIDATOR] (EN stack)
**Phase:** 2.1.S cumulative (closes Builder+Validator cycle for the 2-wave skin cleanup)
**Date:** 2026-04-11
**Upstream role file:** `roles/validator_EN.md`
**Domain:** article (research modality; B_research weights F=0.30 E=0.20 (1-σ)=0.35 Λ=0.15)
**Artifacts verified:**
1. `templates/domain_skin.article.md` (549 → 644 lines cumulative across v1+v2)
2. `projects/odtoe-articles/lessons.md` (129 → 139 lines, +L-36..L-39)

---

## Activation Operator (executed BEFORE verification)

### A_F (Focus) — full reads

- `roles/validator_EN.md` — 88 lines, Mission + Activation Operator + Key Rules + Mura Detector + Jidoka
- `reports/v9_phase2_1_s_skin_cleanup_builder_2026-04-11.md` — 307 lines, v1 Builder report in full (DEF-a/b/c/d anchor map)
- `reports/v9_phase2_1_s_skin_cleanup_v2_2026-04-11.md` — 360 lines, v2 Builder report in full (DEF-e/f/g + L-36..L-39 anchor map, v1 non-conflict table)
- `templates/domain_skin.article.md` — targeted reads: lines 48-60 (vocab row 23), 168-202 (both tables), 239-363 (cite_check ref impl + C5 ladder + C6a/C6b split + sample-size), 440-464 (Check 8 temporal exception), 488-498 (Example 3), 586-622 (Project lessons.md integration)
- `projects/odtoe-articles/lessons.md` — lines 125-139 (L-35 boundary + session header + L-36..L-39)
- Smoke-test reports listed, not re-read in full (non-load-bearing for cumulative verification — the Builder reports already extracted the defect spec)

### A_E (Alignment)

Operator intent: verify 7 defects closed + 4 lessons entries appended cumulative (v1+v2). NOT edit. NOT run cite_check on any article. NOT spawn sub-tasks. Scope: 2 modified files in the repo; no other artifact should be touched.

Verification is against the INTENT of each defect (not just grep presence): DEF-a needs *concrete* bash protocols AND L2 judgment (not just a section header); DEF-e needs a 4-tier ladder with numerical bands AND a computation formula; DEF-f needs 4 provenance categories AND the canonical failure case AND the mechanical aid command; DEF-g needs a Validator routine AND temporal exception inheritance.

### A_σ (Consistency)

Cross-cutting checks performed:
- v1 anchors (row 23, cite_check ref impl, Check 8 temporal exception, sample-size formula) still present post-v2
- C6 → C6a/C6b split propagated to BOTH tables ("six cite_check checks" + "Relationship to 8 verification checks") — verified
- Example 3 still references C6 family (C6 as parent; C6a as the factual-consistency sub-check). The prose on lines 493-494 still reads correctly under the split.
- Check 8 temporal exception still shows Case A (FAIL) vs Case B (LEGACY INFO)
- Modal B-formula unchanged (research weights)
- Line count 644 matches v2 Builder claim exactly
- git scope shows only 2 modified files as expected

### A_Λ (Experience)

Consulted project lessons watchlist (`projects/odtoe-articles/lessons.md`):
- **L-21/L-29/L-30:** bash-idiom style for C1/C3/C4 — v1 Builder's bash blocks match the `comm -23` / `uniq -cd` / `/tmp/c*` pattern.
- **L-22:** independent recomputation requirement — C6a explicitly requires Validator to recompute, not trust.
- **L-25:** quantitative gates — C5 ladder and sample-size contract both follow this pattern.
- **L-31..L-35:** the post-2026-04-04 project rules — DEF-g enumerates them explicitly in the skin.
- **BL-17 (Check-First):** √N sampling formula is the canonical scaling.
- **BL-19:** 8-file set — L-38 entry documents the corpus-wide drift pattern.

No instability watchlist items were violated. The cite_check reference implementation bash uses GNU-coreutils idioms (`comm -23`, `uniq -cd`) — portable to macOS BSD tools per OQ-Cleanup-3 in v1 Builder report (not blocking).

**Activation verdict: PROCEED WITH VERIFICATION.**

---

## Per-defect status table

| DEF | Status | Evidence |
|---|---|---|
| **DEF-a** (cite_check command N/A) | **CLOSED** | Section "cite_check reference implementation (C1/C3/C4 L1 automation, C2/C5/C6 L2 judgment)" at line 239; concrete bash blocks for C1 (lines 247-256, `grep -oE` + `comm -23` + `uniq -cd` dup detect), C3 (lines 260-270, DOI/arXiv regex), C4 (lines 274-279, tectonic stderr parse); L2 judgment protocol for C2 (lines 283-289), C5 (lines 291-311), C6a+C6b (lines 313-345) |
| **DEF-b** (C6 missing from vocab table) | **CLOSED** | Row 23 at line 53 with text "**numerical consistency / factual check**" explicitly citing C6 factual consistency, Example 3, config.md Check 2 + Check 7. Total numbered vocabulary rows = **23** (verified via `grep -c '^\| [0-9]+ \|'`) |
| **DEF-c** (Check 8 no temporal exception) | **CLOSED** | Subsection "#### Check 8 temporal exception (pre-2026-04-04 articles)" at line 442; cutoff determination bash (lines 449-453, git log + stat fallback); Case A (line 456, **FAIL**) / Case B (line 457, **LEGACY INFO** with explicit "NOT a Check 8 pass" clarification) / Partial split (line 459); smoke-test precedent `ODTOE_measuring_B_parameter.tex` cited (line 461). Grep `LEGACY INFO\|pre-2026-04-04\|temporal exception` = 5 matches (≥3) |
| **DEF-d** (sample size unspecified) | **CLOSED** | "Sample-size contract" subsection at line 347; formula `sample_size = max(3, ceil(sqrt(total_formulas)))` at line 352 with concrete examples (9→3, 22→5, 50→8, 100→10); mandatory inclusions at lines 356-359 (abstract, main results, appendix/late section); deterministic selection explicitly stated; smoke-test precedent (22 `\tag{}` → 5) at lines 361-363. Grep `sqrt\|sample_size` = 2 matches at lines 352 (formula and comment) |
| **DEF-e** (C5 threshold undefined) | **CLOSED** | "C5 quantitative thresholds" subsection at line 294; computation formula `self_cite_rate = count(in-text ~[N] where author matches primary author) / count(total in-text ~[N])` (line 295-296); 4-tier ladder (lines 298-305): 0-30% **PASS** / 30-50% **PASS WITH NOTES** / 50-70% **PASS WITH NOTES ESCALATED** / ≥70% **FAIL**. Empirical basis note (lines 307-311) cites both smoke tests (27.4% → NOTES, 55.6% → NOTES ESCALATED). Ladder also propagated inline to C5 row in "six cite_check checks" table (line 177) AND to Validator Jidoka Q7 (line 147). |
| **DEF-f** (C6 formula provenance) | **CLOSED** | C6 split into **C6a** (factual consistency, line 313) + **C6b** (formula provenance, line 320); 4 provenance categories enumerated at lines 323-329: (1) Derived, (2) Cited with pointer, (3) Axiomatic / postulated, (4) Conjectured / hypothesized. Failure mode documented at lines 331-335 citing canonical case `ODTOE_phi_fractality.tex` Section III.2 formula `S(ρ_d) ∝ φ^(-|d-d_0|)` attributed to `[3]` → second smoke test DEF-5. Mechanical aid command `grep -B3 -A1 '\\tag{' "$TEX"` at line 336. Temporal exception inheriting DEF-c pattern at lines 340-345. Split propagated to both tables (lines 178-179 for "six cite_check checks", lines 192-193 for "8 verification checks mapping") and to Validator Jidoka Q6 (line 146). Grep `C6a\|C6b\|formula provenance\|derivation chain\|axiomatic\|conjecture\|postulate` = many matches (≥5 required). |
| **DEF-g** (project lessons.md not referenced) | **CLOSED** | Subsection "### Project lessons.md integration (Skin-DEF-g fix)" at line 586. Rule statement (lines 588-592) establishes precedence. ODTOE project rules L-31..L-35 enumerated at lines 597-606 (5 rules). Temporal exception inheriting DEF-c pattern at lines 608-613 (with phi_fractality worked example). **Validator one-line routine** at lines 615-618: "Read `projects/{PROJECT}/lessons.md` → extract project-specific rule list → apply temporal exception per rule → supplement the 6 cite_check sub-checks + 8 config.md checks with project rules. Post-mtime violation = temporal N/A; pre-mtime violation = real defect." "Applies to" line at 620-621 lists Validator/Coherencer/Builder/Analyst. Grep `Project lessons.md integration\|L-31\|L-32\|L-33\|L-34\|L-35` = 6 matches (≥3 required) |

**All 7 defects CLOSED.**

---

## Lessons entries

| Entry | Status | Evidence |
|---|---|---|
| **L-36** (skin value-additive) | **PRESENT** | Line 133. Cites first smoke test + `ODTOE_measuring_B_parameter.tex` + DEF-1/DEF-4/DEF-6 + Example 3 predicted DEF-4 + 4-layer architecture + B=0.834 Validator PASS. |
| **L-37** (skin not overfit) | **PRESENT** | Line 135. Cites second smoke test + `ODTOE_phi_fractality.tex` + Mar 19 mtime + 6 non-temporal + 4 temporal N/A + structurally different failure profile + orphan `[9]` vs duplicate `[17]`/`[27]` + 55.6% self-cite revealing C5 threshold gap + B=0.875 Validator PASS. |
| **L-38** (BL-19 8-file corpus drift) | **PRESENT** | Line 137. Describes 6/8 at root (first test) + 7/8 (second test) + `.md` files in `для сайта/` + `backup/для сайта/` + mtimes 3 weeks after canonical. Recommends audit script + 8-file invariant check. |
| **L-39** (pre-flight accuracy) | **PRESENT** | Line 139. Cites 3 pre-flight discrepancies: (1) EN-only duplicate biblio → actual RU+EN, (2) 34 tags → actual 22, (3) ~40% self-cite → actual 27%. Sources `reports/v9_phase2_1_s_preflight_2026-04-11.md`. |

**All 4 lessons entries PRESENT.**

**Session header:** "## Session — v9 Phase 2.1.S Smoke Test (April 2026)" at line 131, placed as H2 before L-36..L-39. Matches spec.

---

## Cross-cutting consistency checks

| Check | Status | Evidence |
|---|---|---|
| **v1 anchors intact post-v2** | **PASS** | (a) "cite_check reference implementation" section header at line 239, intact; (b) vocabulary row 23 "numerical consistency / factual check" at line 53, intact; (c) "LEGACY INFO" / "pre-2026-04-04" / "temporal exception" block at lines 442-464, intact (now also referenced by DEF-f C6b at lines 340-345 and DEF-g lines 608-613 as inheritance pattern); (d) sample-size formula `max(3, ceil(sqrt(total_formulas)))` at line 352, intact; `[independence check]` back-reference at line 231 still points to the contract. |
| **C6 examples integrity** | **PASS** | Example 3 at line 489 heading "C6 failure, cite_check blind spot" — prose at lines 491-497 describes a numerical consistency case that maps cleanly onto **C6a** (factual consistency) post-split. The heading "C6 failure" and in-text "running C6 (factual consistency)" at line 493 remain accurate because C6 is the family name and C6a is the factual-consistency sub-check of C6. No regression: the example's semantics are preserved. Ex.1 (C2 failure) and Ex.2 (Coherencer σ failure) untouched. **NOTE:** the Example 3 body still uses plain "C6" rather than "C6a" — this is a *minor* terminological drift but NOT a defect, since the prose context makes the reference to factual consistency unambiguous. See "Defects found" section below — registered as a cosmetic follow-up, not a blocker. |
| **8-check mapping integrity** | **PASS** | Table at lines 185-193 now has 7 rows (C1..C5, C6a, C6b) instead of 6. C6a → Check 7 ("No contradictions WITHIN the article"). C6b → Check 4 + Check 8 (as v2 Builder claimed). Grep on line 193 confirms C6b mapping to "Check 4" and "Check 8 (Rybakov markers, when applicable)". |
| **Line count 644** | **PASS** | `wc -l templates/domain_skin.article.md` = **644** exactly (matches v2 Builder claim). 24 over the 620 soft-cap as acknowledged in v2 Builder report OQ-v2-1 — load-bearing content (4 provenance categories + 5 project rules enumeration + C6 split into 2 table rows in 2 tables). Soft-cap is a guideline, not a hard constraint. Not a blocker. |
| **Vocabulary table 23 rows** | **PASS** | `grep -c '^\| [0-9]+ \|' templates/domain_skin.article.md` = **23** (22 baseline + 1 new C6 row from DEF-b). Matches spec exactly. Note: v1 Builder report line 104 claimed "row count went from 80 → 84" — that was counting ALL table `|`-prefixed lines across the whole file, not numbered vocabulary rows. The task-spec target (≥23 rows in the vocabulary table) is met. |

**All 5 cross-cutting checks PASS (one with a cosmetic NOTE).**

---

## Scope discipline

`git status` output:
```
modified:   projects/odtoe-articles/lessons.md
modified:   templates/domain_skin.article.md
```

Plus 6 untracked reports in `reports/` (all expected: preflight, smoke test, second smoke test, selftest, v1 cleanup Builder, v2 cleanup Builder; this Validator report will be the 7th).

**No modifications to:**
- Role files (`roles/*_EN.md`, `roles/*.md`) — verified not in `git diff`
- BL files (`BOOTSTRAP_LESSONS*.md`) — not in diff
- `CLAUDE.md`, `meta.md`, `eradev.md` — not in diff
- `projects/odtoe-articles/config.md` — not in diff
- Other domain skins (`templates/domain_skin.{creative,config,plan,research}.md` etc.) — not in diff
- `.tex` article files — not in diff (no article files should be touched from skin cleanup phase)

**Scope regression: PASS.**

---

## Edge cases probed

1. **Vocabulary row count ambiguity:** v1 Builder's "80 → 84" claim might suggest rows, but actually refers to all `|`-prefixed lines. I verified the numbered vocabulary row count specifically (`^| N |` pattern) = 23. This matches the task spec requirement.

2. **C6 vs C6a in Example 3:** Post-split, Example 3's heading and body still use plain "C6". I verified the semantics still hold (C6a IS factual consistency, which is what the example describes). Not a defect; cosmetic consistency improvement possible in a future wave.

3. **Line count 644 vs 620 soft-cap:** v2 Builder explicitly documented this as "load-bearing" content. The task spec says "currently at 644 lines" meaning it was expected. Not a blocker.

4. **DEF-g temporal exception pointer:** DEF-g's temporal exception explicitly inherits from DEF-c (not re-inventing). The cross-reference at line 611 says "Same Case A / Case B / Partial split as the Check 8 temporal exception subsection" — verified the DEF-c subsection still exists and the cases are still labeled correctly.

5. **DEF-f pre-cutoff provenance escape hatch:** the temporal exception at lines 340-345 says pre-cutoff articles can PASS C6b via visible-in-PDF provenance. OQ-v2-2 flagged this as unsmoked; I confirm the escape hatch's LOGIC is sound (it inherits the DEF-c pattern) but the EMPIRICAL validation is deferred. Not blocking.

6. **The `[17]`/`[27]` duplicate detection in DEF-a bash:** The C1 block at line 255 uses `grep -oE '\\item\[\{\[[0-9]+\]\}\]' "$TEX" | sort | uniq -cd` — I verified mentally that this catches duplicates (two lines with the same `[N]`). It would catch DEF-1 (first smoke test) directly. OK.

7. **macOS/GNU stat portability in DEF-c bash:** Lines 449-451 include BOTH `stat -f %m` (macOS) AND `stat -c %Y` (GNU). This is the canonical portability pattern from v1 Builder's L-26 sandbox-fallback reference. OK.

---

## Defects found during verification

**None load-bearing.** One cosmetic note:

- **NOTE (cosmetic, not blocking):** Example 3's heading says "C6 failure, cite_check blind spot" and the body text at line 493 says "When running C6 (factual consistency), Validator notes..." — both still use plain "C6" rather than the post-split "C6a". This is semantically correct (C6a IS factual consistency) but could be updated to "C6a" in a future minor wave for terminological consistency with the post-split tables. NOT a defect in this wave — the example remains accurate.

No blocking defects. No fix chain. No regression from v1 Builder's work.

---

## Mura Detector (Round Table 2 cross-section)

- [x] **Terminology consistent?** Yes. C1-C5 unchanged; C6 becomes C6a+C6b consistently across: table 1 (six cite_check), table 2 (mapping to 8 checks), L2 judgment block, Verification Block `[failure recovery]`, Validator Jidoka (Q6/Q7). Only minor note: Example 3 still uses plain "C6" but this is consistent with the family-name usage.
- [x] **Response depth uniform?** Yes. All 7 defects fixed with comparable specificity: concrete bash OR concrete numerical thresholds OR enumerated categories OR concrete L-N listing. No shallow fixes next to deep fixes.
- [x] **Decisions not contradicting each other?** Yes. v1 and v2 edits are additive; the non-conflict matrix in v2 Builder report is correct (verified by reading both anchor regions). No contradictions.
- [x] **Cross-section consistency?** Yes. Claims about C6b mechanism in the table, L2 block, Jidoka Q, and Verification Block `[failure recovery]` all describe the same 4-provenance-label protocol. No drift.

---

## Jidoka Self-Check

```
=== JIDOKA SELF-CHECK (B_research) ===
B-diagnostics:
  F (Focus):        0.90 — Read validator_EN.md, both Builder reports in full,
                           targeted reads of all 7 defect anchor regions in the
                           skin file, both lessons.md boundary regions, ran
                           verification greps per the task spec's acceptance
                           criteria. Smoke-test reports not re-read in full
                           (Builder reports already distilled the defect spec)
                           — minor F discount for that.
  E (Alignment):    0.95 — Verified each defect against INTENT not just format:
                           DEF-a has concrete bash AND L2 judgment; DEF-e has
                           computation formula AND 4-tier ladder AND empirical
                           basis; DEF-f has 4 categories AND canonical case AND
                           mechanical aid AND temporal exception; DEF-g has
                           enumeration AND one-line routine AND temporal
                           exception AND "applies to" list. Cross-cutting
                           checks (v1 anchors post-v2, Example 3 integrity,
                           8-check mapping, line count, vocab row count)
                           all verified.
  (1-σ) (Consistency): 0.92 — v1/v2 non-conflict confirmed (4 v1 anchors intact);
                              C6 split cleanly propagated to both tables + L2
                              block + verification block + Jidoka Q-list; no
                              contradictions between sections. Minor σ: Example 3
                              still uses plain "C6" rather than "C6a" post-split
                              (cosmetic, flagged as note).
  Λ (Experience):   0.90 — BL-17 Check-First, L-21/L-29/L-30 bash idiom
                           verification, BL-19 8-file set pattern in L-38,
                           L-31..L-35 enumeration in DEF-g all consulted.
                           No repetition of prior mistakes.

B_research = F^0.30 · E^0.20 · (1-σ)^0.35 · Λ^0.15
           = 0.90^0.30 · 0.95^0.20 · 0.92^0.35 · 0.90^0.15

Computing:
  0.90^0.30 = exp(0.30 · -0.10536) ≈ 0.9689
  0.95^0.20 = exp(0.20 · -0.05129) ≈ 0.9898
  0.92^0.35 = exp(0.35 · -0.08338) ≈ 0.9713
  0.90^0.15 = exp(0.15 · -0.10536) ≈ 0.9843

B = 0.9689 · 0.9898 · 0.9713 · 0.9843
  ≈ 0.916

Threshold: B ≥ 0.5 AND min(F,E,(1-σ),Λ) ≥ 0.3 → PASS, no Andon.
No consecutive fix chain (verification-only, no fixes applied).
```

**B = 0.916. No Andon.**

---

## Verdict

## Validator Report (Phase 2.1.S Cumulative — v1 + v2 skin cleanup)

**Verified:** 7 skin defects + 4 lessons.md entries cumulative

**Per-defect status:**
- DEF-a: **CLOSED** — cite_check reference implementation section at line 239; concrete bash for C1/C3/C4; L2 judgment for C2/C5/C6
- DEF-b: **CLOSED** — vocabulary row 23 at line 53; 23 numbered rows total
- DEF-c: **CLOSED** — Check 8 temporal exception at line 442; FAIL vs LEGACY INFO split; cutoff bash; smoke-test precedent
- DEF-d: **CLOSED** — sample-size formula `max(3, ceil(sqrt(N)))` at line 352; mandatory inclusions at lines 356-359
- DEF-e: **CLOSED** — C5 quantitative thresholds at line 294; 4-tier ladder (0-30/30-50/50-70/≥70%); both smoke tests as calibration data
- DEF-f: **CLOSED** — C6 split into C6a + C6b at lines 313/320; 4 provenance categories; canonical case `S(ρ_d) ∝ φ^(-|d-d_0|)` cited; `grep -B3 -A1 '\\tag{'` mechanical aid; temporal exception inherited
- DEF-g: **CLOSED** — Project lessons.md integration at line 586; L-31..L-35 enumerated; Validator one-line routine; temporal exception inherited; applies-to role list

**Lessons entries:**
- L-36: **PRESENT** (line 133)
- L-37: **PRESENT** (line 135)
- L-38: **PRESENT** (line 137)
- L-39: **PRESENT** (line 139)
- Session header "## Session — v9 Phase 2.1.S Smoke Test (April 2026)": PRESENT at line 131

**Cross-cutting checks:**
- v1 anchors post-v2: **PASS**
- C6 examples integrity: **PASS** (with cosmetic note on Example 3 retaining plain "C6")
- 8-check mapping integrity: **PASS** (C6a → Check 7, C6b → Check 4 + Check 8)
- Line count 644: **PASS** (actual 644; 24 over 620 soft-cap; load-bearing per v2 Builder OQ-v2-1)
- Vocabulary table 23 rows: **PASS** (actual 23 numbered rows)

**Scope regression:** **PASS** (only `templates/domain_skin.article.md` and `projects/odtoe-articles/lessons.md` modified; no role files, BL files, CLAUDE.md, meta.md, eradev.md, config.md, other skins, or .tex files touched)

**Defects found during verification:**
- None load-bearing.
- 1 cosmetic note: Example 3 (line 489, line 493) still uses plain "C6" rather than post-split "C6a". Semantically correct (C6a = factual consistency sub-check), non-blocking, terminological polish deferred to a future minor wave.

**Verdict:** **PASS WITH NOTES**

**Notes:**
1. Line count 644 is 24 over the 620 soft-cap; v2 Builder documented this as load-bearing and recommended META raise the soft-cap to 650-680 in Hansei. Supported — the overshoot is content-driven, not slack.
2. Example 3 still uses plain "C6" post-split. Cosmetic; can be addressed in a follow-up minor wave or left as-is since the family-name usage is still semantically correct.
3. OQ-v2-2 (C6b pre-cutoff provenance escape hatch) remains unsmoked empirically. Logic is sound; empirical validation deferred to a future smoke test on an article with explicit Postulate/Conjecture prose blocks.

**B-check:** F=0.90 E=0.95 (1-σ)=0.92 Λ=0.90 → B_research ≈ 0.916 (no Andon)

---

## Hand-off to META

The 7 skin defects and 4 lessons entries from the 2-wave Phase 2.1.S cleanup are all verified closed. The cumulative state of the 2 modified artifacts is consistent with the intent spec. Scope discipline intact. No regressions. No fix chain.

**META next steps per task spec:**
1. Write Phase 2.1.S Hansei report
2. Commit the 2 modified files + this Validator report + the 2 Builder reports + the preflight/smoke-test/selftest/second-smoke-test reports
3. Greenlight Phase 2.2 (next domain skin)

**Do NOT run a third smoke test.** The skin is at Phase 2.1 maturity. Third smoke test recommended only if a future phase discovers a new failure class.

Optional follow-up (not blocking):
- Minor wave to update Example 3 terminology from "C6" to "C6a" for post-split consistency
- Minor wave to raise the skin soft-cap from 620 to ~680 lines if further content additions are planned
- Renumber the duplicate L-33 entry in lessons.md (v2 Builder OQ-v2-3) in a separate housekeeping wave

---

*Validator: [VALIDATOR] EN stack, Phase 2.1.S cumulative wave*
*Session: v9 Phase 2.1.S (skin + smoke test + v1 cleanup + v2 cleanup + cumulative validation)*
*Next owner: META (Phase 2.1.S Hansei + commit)*
*Generated: 2026-04-11*
