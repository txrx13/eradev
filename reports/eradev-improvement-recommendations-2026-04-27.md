# EraDev Framework Improvement Recommendations — 2026-04-27

> **Source**: post-delivery operator critique on `ODTOE_hyletic_extension` (Validator RT-2 declared PASS B=0.946 GREEN; three substantive defect classes survived 25/25 gate-list and shipped).
> **Companion Hansei**: `eradev/reports/hansei-meta-2026-04-27-three-critiques.md` (full process metrics, defect enumeration, BL candidates).
> **Scope of THIS document**: framework-file changes only (`eradev/*` paths excluding `eradev/projects/odtoe-articles/`). Recommendations only — **no edits applied** per operator directive *«изменения в eradev основном корпусе НЕЛЬЗЯ делать»*.
> **Audience**: framework maintainer (operator). Each recommendation specifies the file, the diff intent, the rationale, and the residual risk if not applied.

---

## Executive summary

The shipped article had a **PASS verdict that was a false positive**. Root cause is not regex coverage and not a missing tool — it is **gate-listing without gate-execution** at the Validator role. L-35 says verbatim *"Enforcement: `grep -Pn 'ODTOE\_' *.tex = 0 results"*. Empirical re-run on the same file: **19 hits**. The grep was not bypassed; it was not run.

This is structurally identical to L-42 (META skipping Validator after Builder): a rule explicitly stated in checklist form was treated as auto-satisfied. **L-42 patched the META→Builder→Validator handoff. The same patch is now needed at the Validator→META handoff** — Validator must produce evidence, META must reject bare-verdict claims.

Three load-bearing changes, in priority order:

| # | Change | Layer | If applied alone, closes |
|---|--------|-------|--------------------------|
| **R-1** | New Inv 18 in `eradev/CLAUDE.md`: META rejects Validator verdicts without grep stdout evidence | invariant | the entire failure class (gate-listing-without-execution) |
| **R-2** | Validator role-card structural change: every gate produces `{name, command, stdout_excerpt, verdict}` 4-tuple | role-card | Validator self-deception; reorients role from auditor → executor |
| **R-3** | Pre-validator-handoff hook: intercepts Validator output without evidence_block, BLOCKS with re-spawn directive | hook | residual META forgetfulness (defence-in-depth for R-1) |

R-4..R-10 are local hardening that follow once R-1..R-3 are in place.

---

## R-1 (CRITICAL) — Invariant 18: evidence-bearing Validator handoff

### Target file

`eradev/CLAUDE.md` — Invariants section (currently 17 invariants)

### Diff intent (NOT applied)

Add new invariant at the end of the Invariants block:

```markdown
18. **Evidence-bearing Validator handoff**: Validator handoff to META MUST include grep stdout (or equivalent verifiable evidence) for every L-N enforcement gate referenced in checklist. META REJECTS bare-verdict handoffs ("PASS B=0.946 GREEN" without evidence) and re-spawns Validator with explicit evidence requirement. Validator output structure per gate: `{name: L-NN, command: <bash exact>, stdout_excerpt: <first 5 lines or "0 hits">, verdict: PASS/FAIL}`. (Critique 2026-04-27 trio on `ODTOE_hyletic_extension`: L-35 grep returns 19 hits empirically, but Validator declared PASS without running it.) [UNIVERSAL]
```

### Rationale

Currently META trusts the Validator's PASS verdict verbatim. L-42 closed the META-skipping-Validator failure mode. The symmetric failure mode — Validator-skipping-its-own-gates — has no invariant. Inv 18 closes it at the highest possible enforcement layer (META can't claim it didn't know).

### Residual risk if not applied

Same failure mode recurs on next BL-19 delivery. Adding L-48/L-49 lessons without R-1 just adds more rules to a checklist that isn't being executed. **Without R-1, this entire recommendations document is structurally a no-op.**

### Implementation difficulty

Trivial: one paragraph appended to existing Invariants list. No code changes, no hook changes.

---

## R-2 (CRITICAL) — Validator role-card structural rewrite

### Target files

- `eradev/roles/validator_EN.md` (English stack — practical/audit tasks)
- `eradev/roles/validator.md` (Russian stack — theoretical/reflection tasks)

### Diff intent (NOT applied)

In each Validator role-card, the section that lists "checks to perform" (currently descriptive prose) must be restructured to mandate a **4-tuple per check**:

```markdown
## Validator output structure (mandatory)

For EVERY enforcement gate referenced (L-1 .. L-N, AMP1..AMP6), produce a 4-tuple:

| Field | Required | Example |
|-------|----------|---------|
| `name` | yes | `L-35` |
| `command` | yes | `grep -Pn 'ODTOE\\_' /path/to/article.tex` |
| `stdout_excerpt` | yes | `58:Расширение монадологического слоя \texttt{ODTOE\_dynamic\_attractor}` (first 5 hits, or literal `"0 hits"` if pass) |
| `verdict` | yes | `FAIL — 19 hits found, expected 0` or `PASS — 0 hits` |

**Soft policy → hard policy migration**: in v10.0 this is a structured-output recommendation. In v10.1 (or upon any failure to comply), `enforce-delegation.sh` rejects Validator handoffs lacking the 4-tuple format. **Verb discipline**: gates are EXECUTED, not enumerated. A gate without `command:` and `stdout_excerpt:` does not exist.
```

### Rationale

Current Validator role-card is descriptive ("verify L-35 grep returns 0"). A descriptive instruction lets the Validator agent self-deceive: it reads "verify" and emits "verified" without binding action to evidence. The 4-tuple structure makes the binding constructively impossible to skip — there is no field for "I checked it" without a `command:` line. **Reorients the Validator from "auditor who signs" to "executor who reports".**

### Residual risk if not applied

Same as R-1; in fact R-1 and R-2 together are the load-bearing pair. R-1 makes META the gatekeeper; R-2 makes the Validator structurally unable to skip. Either alone is robust; both together is fail-safe.

### Implementation difficulty

Moderate: requires careful editing of two role-card files. Risk of breakage if existing role-card content has implicit dependencies on current structure. Recommend pilot on one role-card (English Validator), validate one BL-19 delivery cycle, then mirror to RU.

---

## R-3 (HIGH) — Pre-validator-handoff hook

### Target file

`eradev/.claude/hooks/pre-validator-handoff.sh` (NEW)

### Diff intent (NOT applied)

Create a new hook that triggers on Validator agent output (PostToolUse on Validator's terminal report). The hook scans the report for the 4-tuple structure mandated by R-2 and:

- If 4-tuple present and verdicts coherent → PASS, allow handoff to META.
- If 4-tuple absent or any gate has missing `command:`/`stdout_excerpt:` → BLOCK with explicit message:
  ```
  BLOCKED: Validator handoff lacks evidence block (Inv 18 / R-2).
  Re-spawn Validator with directive:
  "For each L-N gate referenced, produce {name, command, stdout_excerpt, verdict} 4-tuple. Bare verdicts will not be accepted."
  ```

### Rationale

R-1 (META invariant) and R-2 (Validator role-card) live in `.md` files — they are normative, not executable. A hook makes the rule **enforceable at the runtime layer**. Defence-in-depth: if META forgets Inv 18 (because reading instructions and ignoring them is the known failure mode per BL-16), the hook still catches the bare-verdict handoff.

### Residual risk if not applied

R-1 + R-2 alone are normatively complete but rely on META and Validator self-discipline. Self-discipline failed once (this session); without R-3 it can fail again. **R-3 is the BL-16-aware backstop.**

### Implementation difficulty

Moderate: hook scripts in `eradev/.claude/hooks/` are bash; existing `enforce-delegation.sh` is the pattern to mirror. The hook's regex-detection of 4-tuple structure needs careful design (false positives BLOCK legitimate work; false negatives let bare verdicts through). Suggested initial regex: presence of `command:\s*grep` near each `name:\s*L-[0-9]+` reference.

---

## R-4 (MEDIUM) — AMP6 8-check → 10-check extension

### Target file

`eradev/templates/article_verification_checklist.md` (if exists; otherwise `eradev/templates/` location TBD by maintainer)

OR if no such template file exists in `eradev/templates/`, this lives in `projects/odtoe-articles/lessons.md` AMP6 entry (project-scoped, not framework-scoped).

### Diff intent (NOT applied — recommendation only)

Add two new mandatory checks to AMP6 (currently 8 checks):

- **Check #9 — cite-key↔target match**: every `~[N]` in body must resolve to an `\item N` in `\begin{thebibliography}`; every `\item N` must be cited at least once in body. Command: `grep -nP '~\[\d+' *.tex` (body cites) cross-referenced with `\item` count in bibliography. EN article had 6+ wrong `~[11]` cites pointing to Maldacena while body meant `unified_operator`; RU article had 0 such mismatches.
- **Check #10 — body-inline metadata leak**: outside `\begin{thebibliography}` block, body must contain ZERO of `ISSN|ISBN|arXiv:|DOI:|Vol\.|No\.~?[0-9]`. Command: `awk '/begin\{thebibliography\}/{f=1} !f' *.tex | grep -nP 'ISSN|ISBN|arXiv:|DOI:|Vol\.|No\.~?[0-9]'` → 0 hits = PASS.

### Rationale

Operator critique #3 is precisely Check #10. Cite-key mismatch [11] would have been caught by Check #9. Both are mechanical greps; the gap is that they aren't on the AMP6 list.

### Residual risk if not applied

Critique #3-class defects can recur. Bibliographic metadata duplicated inline reads as "footnote dump" to journal reviewers; cite-key mismatch is a hard-fail in any peer review.

### Implementation difficulty

Trivial: extend AMP6 list by two items.

---

## R-5 (MEDIUM) — Pre-publication scaffolding scrub template

### Target file

`eradev/templates/article_pre_publication_checklist.md` (NEW; or as appendix to existing AMP5/AMP6 template)

### Diff intent (NOT applied)

Add a pre-publication scrub stage between Builder-final and Validator-RT-2. Scrubs the following from `.tex` source:

- LaTeX comment scaffolding: `% [(FACT|DERIVATION|HYPOTHESIS|OPEN):.*]` patterns. ~70 instances in EN hyletic_extension, ~40 in RU.
- META process tags in body: `META D[0-9]+`, `L-Open-[0-9]+`, `[L-[0-9]+,?\s*L-[0-9]+]` lesson-ID lists.
- Tool/precision details in section/subsection titles: e.g., `mpmath dps=60` belongs in body Methods, not in title.
- Filesystem paths: `\texttt{/tmp/.*}`, `\.py`, `\.md`, `\.tex` in body prose (not bibliography).

Scrub command (composable):
```bash
# 1. LaTeX scaffolding comments
grep -nP '^%\s*\[(FACT|DERIVATION|HYPOTHESIS|OPEN):' "$ARTICLE.tex" && echo "FAIL: scrub before publication"

# 2. META process tags
grep -nP 'META D[0-9]+|L-Open-[0-9]+|\[L-\d+(,\s*L-\d+)+\]' "$ARTICLE.tex" && echo "FAIL: scrub before publication"

# 3. Filesystem paths
grep -nP '\\texttt\{/[a-z/]+|\.tex|\.md|\.py' "$ARTICLE.tex" | grep -v 'thebibliography' && echo "FAIL: scrub before publication"
```

### Rationale

These scaffolding patterns are project-internal META-tag conventions that ship in `.tex` source distribution and leak into the `.md` derivative. Invisible in PDF but operator can read source — and did. Operator critique #2 is precisely this.

### Residual risk if not applied

Critique #2-class defects can recur in any future article that uses META-scaffolding conventions during draft.

### Implementation difficulty

Easy: new template file with three grep commands.

---

## R-6 (MEDIUM) — Document the runtime-stall pattern

### Target file

`eradev/meta.md` Section 14 (Session Entry Protocol) appendix, OR `eradev/BOOTSTRAP_LESSONS.md` as new BL entry

### Diff intent (NOT applied)

Add explicit policy on background-agent runtime stalls:

```markdown
### Runtime-stall policy (Inv 17 τ_cycle primacy operationalisation)

Background agent silent for ≥15 minutes since last transcript write = declare timeout.
- META MAY proceed with synthesis using available data from agents that DID return.
- Stalled agent's branch is downgraded to "best-effort"; do NOT block on its return.
- Stall MUST be noted in Hansei (transparency).

Empirical basis: 2 stall events observed 2026-04-27 session (operator critique trio diagnostic phase + earlier session). Pattern: TaskOutput returns "No task found"; transcript file exists but unmodified for 15+ minutes; no completion notification arrives.
```

### Rationale

Without this policy, META waits indefinitely on stalled agents (operator must intervene with «он завис?»), violating Inv 17 τ_cycle primacy. Stalls are runtime flakiness (not framework design issue), but the *response* to stalls is a framework concern.

### Residual risk if not applied

Cycle latency on every background-agent stall requires operator-prompt intervention. Sub-optimal but not catastrophic.

### Implementation difficulty

Easy: add 1 paragraph to meta.md or BL.

---

## R-7 (LOW) — Optional: parallel Validator (RU + EN cross-check)

### Target file

`eradev/CLAUDE.md` Invariant 13 amplification, or new operational note

### Diff intent (NOT applied)

For any BL-19 8-file delivery (RU + EN article pair), spawn Validator twice in parallel:
- Validator-RU on RU `.tex/.pdf/.docx/.md`
- Validator-EN on EN `.tex/.pdf/.docx/.md`

Cross-check: verdicts on shared structural items (bibliography entry count, citation count, section heading parity) MUST agree. Disagreement = both Validators re-spawn.

### Rationale

Single Validator is single-point-of-failure. Inv 13 already mandates max parallelization for independent work — RU and EN articles are disjoint stacks (per operator's earlier critique 2026-04-25: "почему ты 2 5ки RU и EN не запустил параллельно сразу?"). Parallel Validators close the residual single-Validator-self-deception risk.

### Residual risk if not applied

Acceptable if R-1+R-2+R-3 hold. R-7 is defence-in-depth on R-1+R-2.

### Implementation difficulty

Easy: extend Inv 13 amplification with one explicit clause.

---

## R-8 (LOW) — Cite_check verification method clarification

### Target file

`eradev/eradev.md` Section II.1 modal B-formula table (where `verify.method` is listed per domain)

### Diff intent (NOT applied)

For domain `type=article`, `verify.method=cite_check` currently lacks operational definition. Recommend:

```markdown
### `cite_check` (domain.verify.method for article/research)

`cite_check` MUST execute, in order:
1. Body→bibliography orphan check: every `~[N]` resolves to an `\item N`. Command: see AMP6 Check #9.
2. Bibliography→body orphan check: every `\item N` cited at least once in body.
3. Body-metadata leak check: see AMP6 Check #10.
4. Bibliography canonical-form check: each entry conforms to L-32 ODTOE preprint format or standard journal-article format.
5. L-35 enforcement grep with extended pattern: see L-35 amendment proposed in `projects/odtoe-articles/lessons.md`.
```

### Rationale

`verify.method=cite_check` is named in the domain awareness block but not operationalised. The article failures suggest the abstract method name was treated as auto-satisfying (similar pattern to L-35 grep being listed but not run).

### Residual risk if not applied

Ambiguity in what cite_check means; each Validator may interpret differently.

### Implementation difficulty

Easy: 1 paragraph added to eradev.md Section II.1.

---

## R-9 .. R-10 — Reserved

R-9 and R-10 slots are reserved for cross-project BL promotion candidates after L-48/L-49/L-50 prove themselves on 2+ articles in the odtoe corpus. Premature BL promotion is anti-pattern (per BL-3 fix-chain discipline applied to lesson promotion).

---

## Summary table — minimum viable framework hardening

If operator authorises only the load-bearing trio:

| # | Layer | File | Diff size |
|---|-------|------|-----------|
| **R-1** | Invariant | `eradev/CLAUDE.md` | +1 paragraph (Inv 18) |
| **R-2** | Role-card | `eradev/roles/validator_{EN,_}.md` | +1 section per file (output structure) |
| **R-3** | Hook | `eradev/.claude/hooks/pre-validator-handoff.sh` | new file (~30 lines bash) |

Total framework footprint: 2 new paragraphs in 3 files + 1 new hook file. Closes the entire failure mode.

R-4..R-8 are local hardening; recommended but not load-bearing if R-1..R-3 hold.

---

## Cross-references

- **Companion Hansei (process metrics, BL candidates)**: `eradev/reports/hansei-meta-2026-04-27-three-critiques.md`
- **Project-scoped lessons (separate document, modifiable per ε_meta whitelist)**: `projects/odtoe-articles/lessons.md` will gain L-48 (scientific voice), L-46 (bibliography canonical-form), L-47 (Validator gate-execution discipline), and L-35 amendment.
- **Article cleanup (separate phase)**: `ODTOE_hyletic_extension.{tex,EN.tex,_*.pdf,_*.docx,_*.md}` and `ODTOE_dynamic_attractor.{tex,_EN.tex,_*}` will be cleaned by Builder + Validator-RT-2 in a follow-up phase. NOT included in this recommendations document.

---

> **Authored by**: META-Orchestrator (Claude, EraDev Level 9), 2026-04-27.
> **Status**: recommendations only — NO framework files modified. Operator authorisation required before any R-N is implemented.
> **Repo**: this report committed to `eradev` per operator directive *«закоммитить в eradev/»*.
