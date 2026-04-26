# RT-9 ODTOE Audit -- Validator EN Lens (Enforcement Tier)

**Date**: 2026-04-26 | **Role**: [VALIDATOR] EN | **Scope**: enforcement audit only
**Source**: `reports/hansei-rt3-publication-readiness-2026-04-26.md` (ODTOE RT-3 hansei)
**Lens**: BL-33 ladder T1 (type) > T2 (hook) > T3 (checklist) > T4 (docs)

## A_F / A_E / A_σ / A_Λ
- A_F: read hansei + 7 hooks (5×.claude/hooks + 2×.githooks) + BL-33 spec
- A_E: map each ODTOE failure to "what tier would have caught it"; do not re-litigate content
- A_σ: cross-check against L-52 sweep (RT-7) which closed BL-19 Tier-claim falsification
- A_Λ: instability watchlist = "GREEN-but-blind" pattern (Hansei §10: 13 cycles, 0 caught defects)

## Failure × Tier × Hook × Proposed enforcement

| # | ODTOE failure | Hansei layer | Tier required | Existing hook coverage | Why didn't catch | Upgrade path |
|---|---|---|---|---|---|---|
| F1 | `---`/`--` ASCII hyphens rendered literal in PDF | L1 typography | T2 (hook) | NONE — `pre-commit` only checks fix-chain + universality + BL-19 | No hook scans `.tex` body for ASCII dash patterns; no PDF byte/font check | NEW pre-commit `tex-typography.sh`: grep `^[^%]*---[^-]` and `[а-яА-Я] -- ` outside math/code → BLOCK on `domain.type=article` |
| F2 | Slug-citations `[ODTOE-N]` shipped to journal-grade PDF | L1 citation style | T2 (hook) | NONE — universality-gate bans `ODTOE_*\.` filenames, not body slug refs | Banned-pattern regex matches FILENAMES in framework files; in-body `[ODTOE-N]` in project `.tex` is invisible to universality-gate scope filter | NEW pre-commit `pub-slug-scan.sh` scoped to `projects/*/articles/**/*.tex`: zero `\[(?:ODTOE|Slug)-\d+\]` outside `% project-internal` block, OR explicit `.publication-od` allowlist |
| F3 | No agent visually opened compiled PDF across 13 cycles | L2 process | T3 (checklist) → T2 elevation | `agent-context-check.sh` warns NO_FILES but doesn't require PDF read | Validator role file (validator_EN.md §1-9) has no rule "open the rendered artifact"; checklist absent | EXTEND validator_EN.md + validator.md: add Rule 10 "RENDERED ARTIFACT INSPECTION" (read-PDF-as-image, scan ≥5 pages); EXTEND `agent-context-check.sh` to YELLOW when `[VALIDATOR]` prompt on `domain.verify.method=cite_check` lacks `\.pdf` mention |
| F4 | BL-A2 8-check gate declared GREEN despite 2 blockers | L3 framework gap | T4 → T2 | NONE — BL-A2 itself is T3 (checklist) per agent prompt | "Engineering-validity ≠ publication-readiness" is a docs-only distinction; no machine separator | NEW BL-A5 PR-Gate as separate hook `pub-readiness-gate.sh` triggered by `domain.type=article` commits to `articles/`: runs F1+F2 scans + front-matter-completeness check + cross-language parity diff |
| F5 | Coherencer "decision needed" P-02 buried in bundled approval | L5 META protocol | T2 (hook) | NONE | "decision needed" markers are free-text strings in agent reports; no extraction step; META synth is human prose | NEW post-agent hook `od-extraction.sh` (or extend existing `agent-context-check.sh` PostToolUse): scan agent output for `decision needed\|OD-\d+\|operator decision required` → append to `reports/od-open.md`; pre-commit on `articles/` BLOCKS if `od-open.md` has unresolved entries |
| F6 | "5-role consensus" missing naive-reader persona | L4 cultural | T3 (role-file) | NONE | All 5 role files share corpus-fluent vocabulary; "external reader" is implicit, not enumerated | EXTEND `analyst.md` + `analyst_EN.md` with explicit "naive-reader" persona invocation for `cite_check` domain; T3-only acceptable since persona is creative not mechanical |
| F7 | Builder defaulted to slug-form silently (no log) | L5 META | T2 (hook) | NONE | Builder agent output is free-text; "I chose slug-form" is a discretion call invisible to META | EXTEND `agent-context-check.sh` to require `[BUILDER]` prompt on `domain.type=article` to include "## Stylistic decisions log" section; PostToolUse warns if section missing |
| F8 | B-formula = 0.88 across 13 cycles, measured wrong things | L4 cultural | T4 → T3 | NONE | B-formula self-reported by agent; no orthogonal external check | T3 is correct here — extend Validator role rule "B-honesty audit": when `B ≥ 0.85` and operator finds blockers within 60s of artifact open, force `B_post_op = min(B_self, 0.6)` retroactively. Calibration only, not blocking |

## Top-5 enforcement gaps ranked by leverage

1. **GAP-1 (F1+F2): no `.tex`/article-domain pre-commit content scanner.** Highest leverage — single new hook `pub-content-scan.sh` covers both dash typography AND slug-citation, scoped to `domain.type=article`. T2 closure of two blockers from one cycle. Estimated cost: ~80 LOC bash, regex-driven.
2. **GAP-2 (F4): BL-A5 Publication-Readiness Gate as separate hook.** Currently BL-A5 is proposed only in hansei §6 prose. Without hook, BL-A5 inherits the same T4→T3 fragility as BL-A2. Implement as `.githooks/pub-readiness-gate.sh` that runs F1+F2+front-matter+parity for any commit touching `projects/*/articles/`.
3. **GAP-3 (F5): OD-Open extraction is currently zero infrastructure.** "Decision needed" is a free-text social convention. Without extraction hook, recurrence is guaranteed. Highest META-leverage — fixes class of failures, not single instance. Implement as PostToolUse on Agent tool: append matches to `reports/od-open.md`; pre-commit BLOCKS on unresolved entries when `articles/` files staged.
4. **GAP-4 (F3): Validator role lacks "rendered artifact inspection" rule.** Current Rule 5 "Stale output detection" addresses freshness (timestamp/hash) but NOT visual content. Rule 7 "ARTIFACT CONTENT AUDIT" mentions "first 20-50 bytes" — code-domain framing, not PDF-domain. T3 fix: explicit Rule 10 in validator role files (EN+RU pair). Cheap, immediate, RU-side parallel.
5. **GAP-5 (F7): Builder stylistic-decisions log section.** Currently Builder discretion is invisible. T2-extend `agent-context-check.sh`: warn if `[BUILDER]` prompt on article domain lacks "## Stylistic decisions log" instruction. Forces META to surface OD-relevant choices ahead of commit.

## Tier-claim falsification scan (post L-52)

L-52 closed BL-19 (bilingual sync) by upgrading T4-claim → real T2 hook. RT-9 reveals **3 NEW falsification candidates**:

| Falsification | Claim | Reality | Severity |
|---|---|---|---|
| FALSE-1 | BL-A2 declared as 8-check engineering gate (implicitly T2-grade) | All 8 checks are T3 (agent checklist), no machine enforcement; no `.githooks/bla2-gate.sh` exists | HIGH — same shape as BL-19 pre-L-52 |
| FALSE-2 | Hansei §6 BL-A5 PR-Gate "PR-Gate runs AFTER V-Gate" treated as live | BL-A5 is currently a proposal in hansei prose; no hook, no role-file rule; effectively T4 | HIGH — same recursive BL-16 trap |
| FALSE-3 | Invariant 17 (CLAUDE.md) "META MUST maintain explicit OD-Open list" | No persistence layer (`od-open.md` does not exist); no hook to extract; relies on META vigilance = T4 | MEDIUM — recurring class but currently single ODTOE instance |

**NEW periodic Validator sweep item proposed:**
After every multi-cycle XL task hansei, run "Tier-claim survey": for each invariant/BL referenced in failure chain, verify Tier-claim matches actual hook/role-file/docs presence. Cadence: post-hansei, before commit. Append findings to `reports/tier-claim-falsification-<date>.md`. Codify as Coherencer audit duty (matches RT-8 closure pattern from L-52).

## Output verdict

**PASS WITH NOTES** — enforcement audit complete; 8 failures mapped, 5 gaps ranked, 3 NEW falsifications surfaced.

**B-check (B_text, uniform 0.25 weights):**
- F (Focus) = 0.93 — read all 7 hooks, hansei, BL-33; no gaps in source coverage
- E (Alignment) = 0.91 — stayed in enforcement-tier lens; resisted re-litigating publication content
- (1-σ) (Consistency) = 0.90 — tier classifications align with BL-33 ladder + L-52 closure pattern; no contradiction with RT-8 honesty doctrine
- Λ (Experience) = 0.88 — applied L-52 falsification template; cited concrete hook scopes; instability watchlist (GREEN-blind) acknowledged

**B = 0.25·0.93 + 0.25·0.91 + 0.25·0.90 + 0.25·0.88 = 0.9050 (HEALTHY)**

Caveat per Hansei §10: same B-formula previously declared GREEN in error. This Validator pass should itself receive RU-Val cross-check for formal verification depth (per META directive). Confidence in single-lens GREEN: REDUCED.
