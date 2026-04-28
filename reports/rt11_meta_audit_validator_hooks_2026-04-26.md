# RT-11 META Audit — Validator Hook Regression Lens

**Date:** 2026-04-26  **Role:** [VALIDATOR]  **Scope:** Hook-only audit (current 9 hooks vs baseline `b1486ed` = 6 hooks; delta past 3 days = +3, +1 advisory→BLOCK)
**Hypothesis under test:** rapid hook accretion (past 3 days) creates false-positive blocks slowing legitimate META work.
**Verdict (executive):** **CONFIRMED for 2/9 hooks.** Top regression: `rework-framing-detector.sh` fires on rhetorical/conditional discussion. Secondary: `rt1-composition-gate.sh` Tier:T2 leak via relative-path glob.

## Per-hook table

| # | Hook | Scope | Override | FP rate (est) | Tier integrity | Verdict |
|---|------|-------|----------|---------------|----------------|---------|
| 1 | `agent-context-check.sh` | Agent — Read directive + role mismatch (BLOCK), 5 advisories | `ERADEV_HOOKS_DISABLED` not honored | LOW (~3%) — clean spec | OK (Tier:T2 via Inv 12) | **KEEP** |
| 2 | `agent-role-tag.sh` | Agent — `[ROLE]` tag prefix in description (BLOCK) | None inline | LOW (~1%) — deterministic | OK (Tier:T2 via Inv 9) | **KEEP** |
| 3 | `bl-tier-check.sh` | Edit/Write to BL files — `### BL-N` heading without `Tier:` line within 30 lines (BLOCK) | `ERADEV_HOOKS_DISABLED=1` | LOW — narrow file scope | OK (BL-33 Tier:T2 self-applied) | **KEEP** |
| 4 | `enforce-delegation.sh` | META Edit/Write whitelist + diagnostic Bash (BLOCK) | None inline (subagent bypass via `agent_id`) | LOW (~5%) — whitelist correct | OK (Inv 1, BL-26) | **KEEP** |
| 5 | `rework-framing-detector.sh` | UserPromptSubmit — regex match + active pivot (BLOCK exit 2 since 2026-04-25) | `ERADEV_HOOKS_DISABLED=1`, verbal authorization | **HIGH (~30-50%)** — fires on discussion/questions | RED — see Top regression #1 | **RELAX** (revert exit 2 → advisory, OR tighten regex) |
| 6 | `rt1-composition-gate.sh` | Edit/Write to `*/reports/rt1_*.md` — needs composition-hazards file if >=2 refactor + parallel mention (BLOCK) | `ERADEV_HOOKS_DISABLED=1` | MEDIUM — case-glob requires absolute path; relative-path Writes silently no-op | RED — Tier:T2 leak (matches L-52 falsification pattern) | **RELAX** (fix glob to handle both abs/rel) |
| 7 | `.githooks/pre-commit` (universality + fix-chain) | Pre-commit, framework files only | `--no-verify`, `.universality-allowlist` | LOW (~5%) — banned-tokens explicit | OK (Tier:T2) | **KEEP** |
| 8 | `.githooks/bl19-bilingual-sync.sh` | Pre-commit, bilingual pairs (3 fixed + roles + skins) | `BL19_OVERRIDE=1`, `--no-verify` | LOW (~2%) — symmetric, schema-aware | OK (Tier:T2 self-applied) | **KEEP** |
| 9 | `.githooks/phantom-newness-check.sh` | Pre-commit, new L/EMP/BL ID headings — keyword overlap >=2 (BLOCK) | `PN_OVERRIDE=1`, `--phantom-checked` sentinel, `ERADEV_HOOKS_DISABLED=1` | MEDIUM (~10-15%) — common keywords (e.g., "verify", "drift") will hit unrelated docs | OK (Tier:T2 closes L-58) | **KEEP** with watchlist |

## Top 3 hook regressions

1. **rework-framing-detector.sh** — converted from advisory→BLOCK on 2026-04-25 (RT-7 NEXT-B2). **Tested live:** `"стоит ли менять архитектуру тестов?"` (rhetorical question, no rework intent) → BLOCKED. `"архитектурная проблема или нет?"` (discussion) → BLOCKED. Regex `менять архитектуру|полностью менять|архитектурная проблема|...` has **no negation/conditional discrimination** (no "если", "стоит ли", "?", "discussing", "не хочу"). Combined with **active pivot=22 commits past 3 days** → near-permanent BLOCK on any session containing rework vocabulary. **Real impact:** every operator review of architectural decisions now BLOCKS. Recommendation: revert to advisory (`exit 0` + stderr warning) OR add discrimination clause: `grep -v -E '(стоит ли|если|?$|hypothetically|discussion|обсудим)'` before BLOCK exit.

2. **rt1-composition-gate.sh** — case-pattern `*/reports/rt1_*.md` requires path with leading slash. Relative paths (which are common in agent Write calls) silently no-op. **Tested:** `"reports/rt1_test_2026-04-26.md"` → no-match → exit 0 even with explicit composition trigger words. `"/abs/.../reports/rt1_test_..."` → match → fires. This is precisely the **L-52 Tier-claim falsification pattern** — declared T2 but enforcement is path-format-fragile. Recommendation: change glob to `*reports/rt1_*.md` (drop leading slash) or use `[[ "$FILE_PATH" == */reports/rt1_*.md || "$FILE_PATH" == reports/rt1_*.md ]]`.

3. **Hook chain order in `.githooks/pre-commit`** — fix-chain → universality → BL-19 → PN-1 (4 sequential gates). **Cumulative friction:** every commit runs 4 gates; PN-1 alone iterates `git diff --cached` per markdown file × per ID heading × per keyword grep across all `lessons.md`. On large staged sets (e.g. RT-9 with 16 files), this can add 5-10s. **Conflict potential:** universality-gate scans framework files; PN-1 scans markdown additions; could double-block on framework-edit + new-BL combo. Not catastrophic but cumulative cost is rising. Recommendation: `time` benchmark on next 10-file commit; if >5s p50, parallelize PN-1's per-file loop.

## Top 3 healthy hooks

1. **`enforce-delegation.sh`** — clean META whitelist (`reports/`, `lessons.md`, `memory/`, `MEMORY.md`, `BL_CANDIDATES.md`); subagent bypass via `agent_id`; operational-vs-diagnostic Bash classification correct. No FPs found in tested scenarios.
2. **`agent-role-tag.sh`** — single-job hook; deterministic regex match on `^[VISIONARY|ANALYST|BUILDER|VALIDATOR|COHERENT]`; trivially correct. Closes Inv 9 cleanly.
3. **`bl19-bilingual-sync.sh`** — symmetric (EN→RU and RU→EN both fire); schema file (`domain_skin.md.template`) correctly excluded; 10/10 test scenarios passed in original RT-7 NEXT-B1 commit; pairs explicit + glob-driven, no hardcoded project names. Strong universality.

## Tier-claim re-check (L-52 sweep verification)

| Hook | Claimed Tier | Hook fires when expected? | Notes |
|------|-------------|---------------------------|-------|
| BL-33 (bl-tier-check) | T2 | YES — fires on missing `Tier:` within 30 lines | OK |
| BL-19 (bl19-bilingual-sync) | T2 | YES — symmetric | OK |
| BL-35 (rework-framing) | T1-enforced | YES but FIRES TOO BROADLY (regression #1) | **PROBLEM: scope creep, not Tier integrity** |
| BL-34 (rt1-composition-gate) | T2 | PARTIAL — abs paths fire, rel paths leak | **Tier:T2 leak — L-52 pattern recurrence** |
| L-58 (phantom-newness PN-1) | T2 | YES — tested in RT-10 Wave A B2 | OK |
| Universality Gate | T2 | YES — banned tokens block | OK |
| Inv 9 (agent-role-tag) | T2 | YES | OK |
| Inv 12 (agent-context-check) | T2 | YES | OK |

**L-52 sweep claim "4/4 closed":** **3/4 actually closed, 1 leak** (BL-34 rt1-composition-gate via path-glob asymmetry). Recommend re-open L-52 with note: "Tier-T2 hooks must accept BOTH absolute and relative paths from Write tool; case-glob `*/path/...` is fragile."

## Block incidents past 3 days

Searched `reports/` for "BLOCKED" / "Universality Gate" / "hook fired":

| Report | Block type | Legitimate (TP) or FP? |
|--------|-----------|-----------------------|
| rt10_wavea_b2_pn1_hook (PN-1 self-test) | Tested intentionally | TP (test scenarios) |
| rt10_wavea_b1_pr_gate (universality block on hardcoded `odtoe-articles`) | Real | **TP — caught recursive universality violation** |
| rt7_next_b1_bl19_hook (BL-33 caught wrong Tier scope on first edit) | Real | **TP — self-test caught error before commit** |
| rt7_next_b2_rework_detector (BL-35 advisory→BLOCK) | Implementation, no incident | N/A |
| rt5_full_audit_validator (mentions BLOCKED in audit context) | Reference only | N/A |

**Verdict:** all 3 real-incident blocks were **true positives** at time of commit. **However**, my live regex tests on `rework-framing-detector.sh` show **future FP risk is high** (~30-50%) because it activates on any rhetorical/conditional architectural question during the active 22-commit-past-3-days pivot window. The current session's operator message ("eradev начал намного больше ошибаться") and the audit prompts containing "архитектура" / "rework" do not trigger because the hook only sees *new* `UserPromptSubmit` text — but that means **operator messages with archive-rework vocabulary will block the entire session start** until manual override.

## enforce-delegation.sh audit (specific)

- **META Write whitelist correct?** YES. Pattern: `(/reports/[^/]+\.md$|/projects/[^/]+/lessons\.md$|/memory/[^/]+\.md$|/MEMORY\.md$|/BL_CANDIDATES\.md$)`. All 6 META output types covered (the 6th — Check Agent — is delegated, not written).
- **Bash classification:** operational allowlist (git, ls, cd, pwd, mkdir, cp, rm, mv, zip, unzip, chmod, diff, wc, echo, cat) is reasonable; diagnostic blocklist (grep, rg, curl, wget, ssh, psql, redis-cli, jq, yq, dig, nslookup, netstat, lsof, docker, kubectl) matches Inv 10 spec.
- **Over-blocking found?** Minor: `cat` is allowed for pipes but META using `cat` as a Read replacement (anti-pattern per system instructions) would slip through. Not a hook bug — system-prompt issue.
- **Subagent bypass via `agent_id`:** correct — without it, agents would be META-blocked. Verified with test inputs.

## B-check (B_text, hook audit)

- F=0.90 — read all 9 hooks, settings.json, recent reports, baseline diff
- E=0.95 — verdict aligns with operator hypothesis (regression confirmed in 2/9)
- (1-σ)=0.90 — no contradictions; one note: rework-framing FP rate is estimated, not measured (no telemetry)
- Λ=0.95 — L-52 Tier-falsification pattern recognized in BL-34 rt1-composition-gate (deja vu)
- **B = 0.90 × 0.95 × 0.90 × 0.95 = 0.732** (GREEN)

## Verdict: **PASS WITH NOTES** — 7/9 KEEP, 2/9 RELAX

**Action items for META synthesis:**
1. **rework-framing-detector**: revert exit 2 → exit 0 + stderr advisory, OR add negation/discrimination guard. Single-line fix.
2. **rt1-composition-gate**: fix case-glob to accept relative paths. 1-line `case` extension.
3. **L-52 sweep claim**: re-audit with "path-format robustness" lens; document as Tier:T2 minimum requirement.
4. No removals proposed. Hook chain healthy in aggregate; the 2 regressions are surgical (single-line fixes), not architectural.

**Out of scope:** Analyst empirical complement (parallel per Inv 14 META direct) covers RT-1/RT-9 fix chains + framework-deterioration symptoms beyond hooks.
