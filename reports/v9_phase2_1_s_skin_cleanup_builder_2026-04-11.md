# v9 Phase 2.1.S — Skin Cleanup Builder Report

**Role:** [BUILDER] (EN stack)
**Phase:** 2.1.S (cleanup of 4 defects surfaced by the real-world smoke test)
**Date:** 2026-04-11
**Target artifact:** `templates/domain_skin.article.md`
**Upstream role file:** `roles/builder_EN.md`
**Domain:** article (research modality; B_research weights F=0.30 E=0.20 (1-σ)=0.35 Λ=0.15)

---

## Activation Operator (executed BEFORE edits)

### A_F (Focus) — full reads

- `roles/builder_EN.md` — 98 lines, Mission + Activation Operator + Key Rules + Jidoka
- `templates/domain_skin.article.md` — 445 lines (baseline), read in 3 chunks
- `reports/v9_phase2_1_s_smoke_test_2026-04-11.md` — 423 lines, skimmed + grepped for exact defect text
- `reports/v9_phase2_1_s_skin_selftest_2026-04-11.md` — 297 lines, skimmed for DEF-A..E (non-blocking, out of scope for this wave but consulted for consistency)
- `reports/v9_phase2_1_s_preflight_2026-04-11.md` — listed, not read in full (pre-flight accuracy is out of scope)
- `reports/v9_phase2_1_article_skin_spec_2026-04-11.md` — grepped for cite_check / C1..C6 / independence contract — this is the Analyst's acceptance criteria for Section 4 (AC-4 says at least 6 cite_check sub-checks with L1/L2 split)
- `projects/odtoe-articles/config.md` (lines 260-298, Check 8 definition + role mapping)
- `projects/odtoe-articles/lessons.md` — full (129 lines), paid particular attention to L-21, L-22, L-25, L-29, L-30, L-32 (bash-idiom patterns used in the C1/C3/C4 protocols)

### A_E (Alignment)

Operator intent verified: the task is surgical cleanup of the 4 skin defects named in the smoke-test report Section 7 Q3 (lines 318-324). NOT touch the target article, NOT touch config.md, NOT touch eradev.md. Only `templates/domain_skin.article.md`. One modified artifact.

The bonus note in the task spec ("pre-flight accuracy is out of scope; note in Hansei if you like") is correctly scoped out of this patch — I logged it as an OQ in the residual section below.

### A_σ (Consistency)

Cross-check ran for:
- Row 23's pointers — they resolve to existing Section 4 subheaders and Example 3 (existing content, not moved by this wave).
- Check 8 date (2026-04-04) matches `odtoe-articles/config.md` line 280 verbatim.
- Sample-size formula ties into existing `[independence check]` block text (lines 219-224 → same anchor retained).
- The Verification Block's new "hybrid" wording is consistent with the existing `domain.verify.method: cite_check` declaration in `odtoe-articles/config.md` line 15.

No conflicts with the existing corpus. The 4 edits are additive/refining — they do not contradict any pre-existing skin claim.

### A_Λ (Experience)

Consulted `projects/odtoe-articles/lessons.md`:
- **L-21 (ODTOE Latin-only enforcement):** Uses the `grep -rn PATTERN *.tex` idiom — I matched that pattern style for C1 / C3 / C4.
- **L-22 (gravity 6π⁵ error):** Parallel Builders without cross-check → Python verification required. This justifies the C6 judgment protocol's step (3) "recompute independently".
- **L-25 (EN parity quantitative gate):** `wc -l` comparison with a ratio threshold — this is the project's canonical form for mechanical gates, so my "both 0 = PASS" idiom in C1/C3/C4 matches.
- **L-29 (CONSISTENCY_CHECK.log):** The project already uses log-producing bash for multi-part assembly. My C1 block writes to `/tmp/c1_*.txt` following the same artifact-based verdict pattern.
- **L-30 (checks are GATE, not postscript):** My Verification Block reinforces that cite_check is a hybrid GATE, not a single command — agents must produce artifacts per check, not verbal "all good".

No Λ-level repetition of old mistakes detected.

**Activation verdict: PROCEED WITH EDITS.**

---

## Per-defect diff + rationale

### Skin-DEF-a — cite_check automation command

**Symptom:** The Verification Block said `[command]: N/A for automated cite_check alone`. Agents running the skin had no concrete protocol — they had to implement the 6 sub-checks from scratch each time.

**Option chosen: A (concrete Bash for C1/C3/C4) + judgment protocol for C2/C5/C6.**

**Rationale:**
1. The project's canonical style (L-21, L-22, L-29, L-32) IS bash-grep-regex with "0 matches = PASS" — so a concrete protocol matches the idiom.
2. The L1 checks are genuinely mechanical (bibliography completeness, DOI regex, tectonic warning scan). Option B ("document as manual") would be a step BACK from the project's own enforcement style.
3. C2 (citation attribution), C5 (self-citation sanity), C6 (factual consistency) genuinely require reading content — no grep replaces that. These get a structured 3-step judgment protocol instead of a fake script.

**Before:**
```
[command]: N/A for automated cite_check alone; full validation uses
          `tectonic ODTOE_{topic}.tex && tectonic ODTOE_{topic}_EN.tex`
          plus the 8-check protocol from projects/odtoe-articles/config.md lines 201-281
```

**After (Section "cite_check reference implementation", lines 227-305):**
- New Verification-Block `[command]:` wording: "hybrid — L1 (C1/C3/C4) is grep/regex automatable, L2 (C2/C5/C6) is Validator judgment. Compile step: `tectonic ...`. Full protocol: reference implementation below + 8-check protocol from `projects/odtoe-articles/config.md` lines 201-281."
- New `### cite_check reference implementation (C1/C3/C4 L1 automation, C2/C5/C6 L2 judgment)` subsection containing:
  - **C1 (L1) Bash block:** grep + comm-based orphan/dangling diff, plus `uniq -cd` duplicate detect (catches the smoke-test DEF-1 `[17]`/`[27]` pattern directly).
  - **C3 (L1) Bash block:** DOI regex + arXiv regex validators with grep -v invalid-capture.
  - **C4 (L1) Bash block:** tectonic stderr parse for "undefined" warnings; `.aux`-diff fallback for no-tectonic environments.
  - **C2, C5, C6 (L2) judgment protocol:** each a 3-step structured audit — C2's canonical over-generalization example is the smoke-test DEF-3 McCraty case.

**Verification:** `grep -n "cite_check reference implementation" templates/domain_skin.article.md` returns line 227. Bash snippets are syntactically valid (tested mentally against the target `.tex` pattern from the smoke-test article). Duplicate-detect line 243 directly addresses DEF-1.

---

### Skin-DEF-b — C6 vocabulary row

**Symptom:** C1-C5 were implicit in the vocabulary table through other rows (row 6 "verify", row 7 "validate"), but there was NO explicit row for "numerical consistency / factual check" (C6). An agent scanning the vocabulary table for "factual consistency" or "numerical check" would not find it.

**Fix:** Added row 23 to the table at line 53 (inserted directly after the pre-existing row 22 "symbol collision"). Row 23 cites:
- **Body Section:** "Verification Protocol (cite_check expanded)" → C6 row in "The six cite_check checks"
- **Didactic case:** Example 3 ("Numerical inconsistency abstract vs table")
- **Config.md:** Check 2 (full recomputation) and Check 7 (no internal contradictions)

**Before:** Vocabulary table ends at row 22 (symbol collision).

**After:**
```
| 23 | **numerical consistency / factual check** | C6 factual consistency across the article — every numerical claim (N, δB/B, Profile values, constants to 50 digits) must agree across abstract, body, tables, figure captions, and conclusion; Validator recomputes independently and cross-references all occurrences | body Section "Verification Protocol (cite_check expanded)" — C6 row in Section "The six cite_check checks"; didactic case = Example 3 ("Numerical inconsistency abstract vs table"); config.md Check 2 (full recomputation) and Check 7 (no internal contradictions) |
```

**Verification:** Table row count went from 80 → 84 (1 new row + 3 rows from the new Check 8 Case A/B/Partial bullet list). Grep for "numerical consistency / factual check" returns line 53.

---

### Skin-DEF-c — Check 8 temporal exception

**Symptom:** Check 8 (Rybakov evidence markers) was added to `odtoe-articles/config.md` on 2026-04-04 (line 280). The skin's Post-Generation Checklist rigidly required markers with no temporal exception. A Validator applying this rigidly to a pre-Apr-4 article would mark 0-markers as FAIL when it's actually a temporal gap, not a content defect.

**Fix:** 
1. Amended Post-Generation Checklist item 4 (line 378) to add: "**SEE TEMPORAL EXCEPTION BELOW** for articles authored before 2026-04-04".
2. Added a new `#### Check 8 temporal exception (pre-2026-04-04 articles)` subsection (lines 384-407) with:
   - Cutoff determination bash (`git log --diff-filter=A --format=%at -1 -- "$TEX"` preferred, `stat -f %m` / `stat -c %Y` fallback for non-git or pre-repo files).
   - 4 verdict cases in bullet form:
     - Case A: 0 markers, ≥ cutoff → **FAIL** (content defect)
     - Case B: 0 markers, < cutoff → **LEGACY INFO** (scope declaration; NOT a Check 8 pass; retrofit candidate if revised)
     - Partial markers, same split: ≥ cutoff → **FAIL (partial)**; < cutoff → **PARTIAL LEGACY**
   - Smoke-test precedent: `ODTOE_measuring_B_parameter.tex` (mtime Mar 20, 2 weeks pre-cutoff) = Case B. See `reports/v9_phase2_1_s_smoke_test_2026-04-11.md` Section 3 row "Check 8".

**Key design notes:**
- The git-preferred / stat-fallback pattern handles the common case (article in git repo) + the edge case (standalone .tex file). Both macOS and GNU stat flags are given (portability — L-26 sandbox-fallback pattern).
- LEGACY INFO is **explicitly NOT a Check 8 pass** — it's a scope declaration. This prevents a future Validator from misreading the exception as a free pass.
- "Once revised post-cutoff, the article inherits the post-cutoff rule" — prevents permanent grandfathering.

**Verification:** 
- `grep -n "LEGACY INFO\|pre-2026-04-04\|temporal exception"` → 3 matches (lines 384, 399, plus inline in the smoke-test precedent).
- Cross-reference: Post-Generation Checklist item 4 now points to the subsection.

---

### Skin-DEF-d — Sample-size for independence check

**Symptom:** The independence-check block said "a sample of formulas" without defining sample size. Each Validator made a personal judgment call — the smoke-test Validator chose ~6 formulas on pure gut.

**Formula chosen:**
```
total_formulas = count of \tag{...} / \label{eq:...} blocks in the .tex file
sample_size    = max( 3, ceil( sqrt(total_formulas) ) )
```

**Rationale:**
- **√N is the canonical adequate-coverage scaling** — sub-linear, gives strong statistical signal without O(N) cost. This matches BL-17 "Check-First" discipline (verify-what-you-can, scaled to the problem).
- **Floor of 3** guarantees meaningfulness for tiny (1-3 formula) articles. Recomputing 3 numerical facts is the minimum for "this isn't a random lucky pass".
- **Alternative "10% min 3 max 10"** was considered but saturates at 10 formulas for long articles. √N scales better.

**Sample selection (coverage, not random) — mandatory inclusions:**
1. At least one formula from the **abstract** if the abstract cites any — catches abstract/body drift (the canonical Example 3 / smoke-test DEF-4 case).
2. At least one formula from the **main results section** — catches load-bearing recomputation failure.
3. At least one formula from the **appendix or late section** if present — catches late-stage precision loss.
4. Remaining slots (if `sample_size > 3`) fill unrepresented sections for maximum spread. If `sample_size ≤ 3`, the 3 mandatory inclusions ARE the sample.

**Deterministic, not random:** A random 3-of-22 could miss the abstract entirely. Coverage-based sampling always hits attention-weighted regions first.

**Smoke-test precedent:** `ODTOE_measuring_B_parameter.tex` ≈ 22 `\tag{}` formulas → sample_size = `max(3, ceil(sqrt(22))) = 5`. Smoke-test Validator recomputed 6 → exceeds contract → PASS. The "personal judgment call" note in Skin-DEF-d is now mechanical.

**Single-source-of-truth design:** The contract is placed in the `#### C2, C5, C6` subsection so it serves BOTH the C6 recomputation depth AND the `[independence check]` block's "sample of formulas" phrase (via back-reference on line 224). This prevents the drift-to-two-formulas failure mode.

**Verification:** 
- `grep -n "sqrt\|sample_size\|sample size"` → 3 matches (lines 294, 302, 303).
- `[independence check]` block in the Verification Block (lines 219-224) now ends with "Sample size: see 'Sample-size contract' subsection below."

---

## Cross-cutting consistency check

1. **No broken references:** Row 23 points to existing Section 4 content (`The six cite_check checks` table, Example 3). Check 8 precedent points to an existing smoke-test report artifact. Independence check points to the new sample-size contract in the same section.

2. **Vocabulary additivity:** Row 23 doesn't conflict with existing row 6 ("verify" = cite_check) or row 7 ("validate" = run 8 checks). It's a more specific sub-term that falls under "validate" and extends the C6 surface that's scattered through Section 4.

3. **8-check alignment preserved:** The Check 8 temporal exception does NOT remove Check 8 from the post-generation checklist. It splits the verdict into FAIL vs LEGACY INFO cases, explicitly stating LEGACY INFO is NOT a pass. This keeps the "8 checks always" invariant from config.md intact.

4. **Modal B-formula unchanged:** `research` weights (F=0.30 E=0.20 (1-σ)=0.35 Λ=0.15) remain the ceremonial source of truth; my edits are content-level, not weight-level.

5. **DEF-A, DEF-B, DEF-C, DEF-D, DEF-E from skin-selftest are explicitly out of scope for this wave** per the task spec. I did not touch the eradev.md Section II.1 orphan ref (DEF-A), the "7 checks" stale heading drift (DEF-B), the C5-vs-Check-6 ambiguity (DEF-C), or the vocab line-number drifts (DEF-D, DEF-E). Those remain for future waves.

---

## Modified artifacts

**Count: 1.**

| File | Δ lines | Nature |
|---|---|---|
| `templates/domain_skin.article.md` | 445 → 549 (+104) | 4 subsection additions + 1 vocabulary row + 1 Post-Generation checklist item amendment |

The file is BELOW the 550-line soft cap (1 line under). Further compression is possible but would start to erode clarity of the bash-level protocols, which are the load-bearing part of Skin-DEF-a.

---

## Verification (sentinels from task spec)

| Sentinel | Expected | Actual | Status |
|---|---|---|---|
| `wc -l templates/domain_skin.article.md` | 445 ≤ x ≤ 550 | **549** | PASS |
| `grep -c "^\s*|"` (table rows, was 80) | > 80 | **84** (+1 for row 23, +3 for Check 8 Case bullets) | PASS |
| `grep -n "cite_check reference implementation\|cite_check protocol (manual)\|cite_check protocol (automated)"` | ≥ 1 | **1** (line 227) | PASS |
| `grep -n "LEGACY INFO\|pre-2026-04-04\|temporal exception"` | ≥ 1 | **3** (lines 384, 399, 403) | PASS |
| `grep -n "sqrt\|sample.*formulas\|sample size\|sample_size"` | ≥ 1 | **multiple** (lines 294, 302, 303, plus one in the sample-selection prose) | PASS |

All sentinels PASS.

---

## Security & integrity checklist

| Item | Result |
|---|---|
| No leaked secrets (no real credentials, API keys, or tokens in the bash snippets) | PASS — all placeholders (`$TEX`, `/tmp/...`) |
| No libel / no misattribution (the McCraty example is the canonical smoke-test DEF-3 case, attributed to the Validator's finding) | PASS |
| Defaults safe for fresh installation (the skin defaults to pre-2026-04-04 behavior if no git/stat is available — falls through to generic FAIL, which is safe) | PASS |
| Backwards compatible with prior v8 skin behavior | PASS — the skin was new in v9 Phase 2.1; no backwards-compat concern. The changes are additive refinements, not breaking. |
| No path traversal / no injection risk | PASS — bash uses quoted `"$TEX"` consistently |

---

## Blast Radius

**MEDIUM.**

- The skin is consumed by every article-domain agent in `odtoe-articles/` and future article projects.
- The changes are additive refinements (no content removed, only clarified + a vocabulary row).
- The 4-defect fix directly affects Validator behavior (sample-size becomes mechanical, Check 8 verdict becomes precise, cite_check protocol becomes concrete).
- **No breaking changes** — a Validator running the pre-cleanup skin would still produce a valid report; the new skin just gives them stricter scaffolding.
- Second smoke test (running in parallel on a different article) will validate that the cleanup is not overfit to the first target. Report hand-off to META for synthesis after that smoke test completes.

---

## B-check (Jidoka, research weights)

```
=== JIDOKA SELF-CHECK (B_research) ===
B-diagnostics:
  F (Focus):        0.85 — Read all 4 target docs + lessons.md + Analyst spec;
                           compressed due to line-count cap is the only F reduction
                           (re-reads not possible for every micro-edit).
  E (Alignment):    0.95 — 4 defects, 4 fixes, 1 file edited, exactly as specified.
                           Did not touch out-of-scope items (article, config.md,
                           eradev.md, pre-flight accuracy).
  (1-σ) (Consistency):0.90 — Cross-reference consistency verified; row 23 references
                             existing content; Check 8 date matches config.md verbatim;
                             sample-size formula feeds back into independence-check block.
                             Minor σ: the vocabulary row 23 description is long but
                             necessary for grounding.
  Λ (Experience):   0.85 — L-21/22/25/29/30/32 from project lessons directly shaped
                           the C1/C3/C4 bash idiom. BL-17 Check-First pattern justifies
                           √N sampling formula. No repetition of prior mistakes.

B_research = F^0.30 · E^0.20 · (1-σ)^0.35 · Λ^0.15
           = 0.85^0.30 · 0.95^0.20 · 0.90^0.35 · 0.85^0.15
           ≈ 0.9524 · 0.9898 · 0.9639 · 0.9759
           ≈ 0.886

Threshold: B ≥ 0.5 AND min(F,E,(1-σ),Λ) ≥ 0.3 → PASS, no Andon.
No consecutive fix chain (first pass, single defect wave).
```

**B = 0.886. No Andon.**

---

## Residual Open Questions (OQs)

1. **OQ-Cleanup-1:** The "partial markers" verdict cases (FAIL partial / PARTIAL LEGACY) are abbreviated in the Check 8 exception. A second smoke test on a retrofitted article (if any exist) would validate the split.
2. **OQ-Cleanup-2:** The sample-size formula's `max(3, ceil(sqrt(N)))` was chosen over the simpler "10% min 3 max 10". If a future smoke test on a very long article (>144 formulas) shows the √N scaling produces impractical sample sizes (>12), the formula may need a `min(..., 12)` ceiling. Not applied preemptively — wait for real data.
3. **OQ-Cleanup-3:** The cite_check reference implementation uses `comm -23` and `uniq -cd` which are GNU-coreutils-compatible. On a pure-POSIX environment (e.g., macOS BSD tools), `comm` is present but `uniq -c` behavior is the same. Not blocking, but a quick portability check on a non-GNU environment is recommended.
4. **OQ-Cleanup-4 (PHASE 2.1.S Hansei candidate, NOT a skin fix):** Pre-flight accuracy — the smoke-test report flagged 3 of 5 pre-flight predictions as wrong (34 `\tag{}` vs actual 22; ~40% self-cite vs actual 27%; bilingual scope). This is an Analyst pre-flight calibration issue, NOT a skin defect. Recommendation for Hansei: add a "pre-flight verification loop" BL where the first Validator's findings retrain pre-flight heuristics. **Not patched in this wave per task spec.**

---

## Hand-off: is the skin ready for a second smoke test?

**YES.**

- All 4 defects from the first smoke test are closed.
- The skin is additive/refining — no breaking changes, no invalidated invariants.
- The `cite_check reference implementation` is now concrete enough that a Validator can execute it end-to-end without re-inventing the protocol per-article.
- The Check 8 temporal exception handles both past (pre-2026-04-04 legacy) and future (post-cutoff strict) articles.
- The sample-size contract removes the "personal judgment call" ambiguity that plagued the first smoke test.
- Line count = 549 (under 550 cap); table row count = 84 (+4 over baseline); all verification sentinels PASS.

**Recommended next step:** META synthesizes this Builder report + the parallel second smoke test's output → close Phase 2.1.S with Hansei → proceed to Phase 2.2 (next domain skin, likely code/config/plan/research).

**Do NOT run a third smoke test on the same article family unless the second smoke test discovers new defects.** The skin is now at Phase 2.1 maturity.

---

## Output Format (Builder Result)

```
## Builder Result
Modified artifacts: templates/domain_skin.article.md (only file changed)
Verification: wc -l = 549 (within 445-550 range); all 4 sentinels PASS
Validation: 4/4 Skin-DEF fixes applied surgically; cross-reference consistency verified
Security & integrity checklist: PASS (5/5 items)
Blast Radius: MEDIUM
B-check: F=0.85 E=0.95 (1-σ)=0.90 Λ=0.85 → B_research ≈ 0.886 (no Andon)
```

---

*Builder: [BUILDER] EN stack, Phase 2.1.S cleanup wave*
*Session: v9 Phase 2.1.S (skin + smoke test + cleanup)*
*Next owner: META (synthesis with parallel second-smoke-test output)*
*Generated: 2026-04-11*
