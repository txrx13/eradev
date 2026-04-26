# RT-9 ODTOE Hansei Audit — Builder EN (Implementability)

**Date**: 2026-04-26 | **Lens**: Builder EN — implementability/tooling | **Source**: `reports/hansei-rt3-publication-readiness-2026-04-26.md`
**Anti-bloat principle**: every proposal must catch a defect that B-formula cannot — or be rejected as theatre.

## A. Failure → Hook/Tool Mapping

| # | Failure (Hansei) | Existing catch? | Why missed | Mechanizable? |
|---|---|---|---|---|
| F1 | `---`/`--` rendered literally in PDF | NONE — `cite_check` is source-side | No agent ran `pdftotext` or visual Read | YES — `grep -nP '(?<!\\)(---|--)(?!-)' *.tex` + render diff |
| F2 | `[ODTOE-N]` slug-citations in publication body | NONE — slug passes C1/C3 (resolves to bibitem) | C1/C3 verify resolution, not style | YES — regex `\[(ODTOE|Slug)-\d+\]` zero-tolerance in `verify.method=cite_check` |
| F3 | `decision needed` flagged but bypassed by Builder default | NONE — META synthesis re-bundles ODs | No OD-Open ledger; bundle approval | PARTIAL — text marker `<<DECISION-NEEDED>>` greppable; ledger needs convention |
| F4 | No agent opened compiled PDF | NONE — `verify.method=cite_check` is source-only | "Build" not in article verify chain | YES — Validator checklist mandate: PDF Read in JIDOKA |
| F5 | Front-matter incomplete (no keywords/affil/data-statement) | NONE | BL-A2 covers science, not journal form | YES — schema/skeleton check (markdown lint, presence regex) |
| F6 | Cross-language semantic drift not caught structurally | PARTIAL — BL-19 hook checks staging, not content | BL-19 is file-pair gate, not parity diff | PARTIAL — section-count + formula-count diff feasible; semantic drift = LLM-grader |

## B. Top 5 Builder-Actionable Additions (ranked ROI)

| Rank | Addition | File:line target | Effort | Tier | False+ rate | Maint | ROI (sessions/year) | Verdict |
|---|---|---|---|---|---|---|---|---|
| 1 | **Slug-citation lint** (`scripts/lint-slug-cites.sh`) — regex `\[(ODTOE|Slug|TODO|FIXME)-[0-9A-Z]+\]` block on staged `.tex/.md` when `domain.type=article` AND `domain.publication=true` | NEW: `.githooks/slug-cite-lint.sh` + wire into `.githooks/pre-commit:83` | S | T2 (hook) | Low (~2%; legitimate slug uses are project-internal lessons.md only) | Trivial — single regex | All article projects (ODTOE, future). Catches F2 zero-cost. | **SHIP** |
| 2 | **PDF visual-audit mandate in Validator role file** — add JIDOKA item: "PDF Read pass: open compiled PDF via Read tool (image rendering), scan abstract + 3 random pages for `---`, `--`, slug-cites, equation overflow, table clipping" | EDIT: `roles/validator_EN.md` + `roles/validator.md` — add clause to "Key Rules" | S | T1 (role doctrine) | Zero (manual) | Zero — text only | Catches F1+F4 universally. Forces visual gate without new infra. | **SHIP** |
| 3 | **`scripts/dash-lint.sh`** — `grep -nE '(?<![-\\])(---|--)(?!-)' *.tex` + presence of `\textemdash`/U+2014/U+2013 audit; reports lines with ASCII dashes in body text (skip preamble + comments) | NEW: `.githooks/dash-lint.sh` invoked from `pre-commit` when `*.tex` staged AND project config has `domain.typography_strict=true` | S | T2 (hook) | Medium (~10% — code blocks, URLs); needs preamble-stripper. Mitigation: opt-in via config flag. | Low | Catches F1 mechanically (~80% of cases). PDF Read covers remaining 20% (rendering oddities). | **SHIP w/ opt-in flag** |
| 4 | **OD-Open ledger marker convention** — `<<DECISION-NEEDED: id | summary>>` HTML-comment marker in any agent output; META must surface BEFORE next Builder spawn. Hook: `agent-context-check.sh` advisory if Coherencer output contains marker but no operator response in next prompt | EDIT: `.claude/hooks/agent-context-check.sh:80` — append OD-Open detection clause; new template `templates/od_open_ledger.md` | M | T2 (hook+convention) | Low — markers are explicit | Medium — convention enforcement | Catches F3 framework-wide (not just article). High leverage. | **SHIP** |
| 5 | **`scripts/article-frontmatter-check.sh`** — schema check on `.tex` for required tokens: `\title`, `\author`, abstract block (≤300 words), `\keywords`/`keywords:`, data-availability statement, conflict-of-interest. Block when `domain.publication_target` is set in config | NEW: `.githooks/article-frontmatter-check.sh` invoked when `domain.type=article` + `domain.publication_target` present | M | T3 (project-domain hook) | Low — explicit token list | Low — extend list per journal target | Catches F5. ODTOE + future article projects. ROI lower (only at submission boundary). | **SHIP, lower priority** |

## C. Rejected (Anti-Bloat)

| Proposal | Why rejected |
|---|---|
| Embed full `texlive` + `tectonic` in CI to render every commit | HIGH maintenance, slow, project-specific. Builder's existing render step + PDF Read covers the catch at fraction of cost. **THEATRE** |
| Auto-LLM "external reader" persona check on every commit | Cost ~5-10x B-formula loop; manual L-A6 sufficient. Add only if F2/F5 recur post-fix. **PREMATURE** |
| New `verify.method=publication_ready` separate from `cite_check` | Duplicates BL-A5 already proposed in Hansei §6; verify.method should remain stable enum. **SCOPE CREEP** — instead extend `cite_check` validator behavior via skin §"Verification Protocol". |
| Section/formula-count parity hook for BL-19 | Already exists conceptually in `bl19-bilingual-sync.sh`; extend that hook rather than new tool. **DUPE** |
| New PreToolUse hook blocking commits when ANY `<<DECISION-NEEDED>>` exists in repo | False-positive heavy (markers in lessons.md/reports/); use advisory in agent-context-check + META protocol enforcement. **OVERREACH** |

## D. Skin / Template Edits (lighter than hooks)

| Target | Edit | Effort |
|---|---|---|
| `templates/domain_skin.article.md` §"Verification Protocol" line ~166 | Add C8: typographic audit (dashes, quotes), C9: front-matter completeness when `publication_target` set | S |
| `templates/domain_skin.article.md` §"Examples" line ~390 | Add Example 4: slug-citation drift (F2) — didactic case for L-A8 | S |
| `roles/validator_EN.md` JIDOKA block | Add "Visual artifact audit" line for renderable artifacts | S |
| `BOOTSTRAP_LESSONS.md` | Append BL-A5 (PR-Gate) per Hansei §6 — universal extension applies to article+book skins | S |
| `templates/cross_harness_requirements.md` | Add row: "Article publication boundary requires PDF Read pass" | S |

## E. Verify-Method Coverage Gap

`domain.verify.method=cite_check` currently covers C1–C7 (Hansei §3 enumerates). Gaps: **typography (C8)**, **front-matter (C9)**, **visual rendering (C10 = mandatory PDF Read)**. These extend cite_check INSIDE the skin — do NOT introduce new verify.method enum (avoids fragmenting `verify.method` registry). BL-A5 = "PR-Gate runs after V-Gate" is a sequencing rule, not a new method.

## F. Recommended Implementation Order (1 RT-1 cycle)

1. Slug-cite lint hook (S) + role file PDF Read mandate (S) — same commit, parallel Builders
2. Dash-lint hook (S, opt-in) — second commit
3. OD-Open ledger convention + agent-context-check extension (M) — third commit, requires META protocol update
4. Front-matter check (M) — fourth commit, ODTOE-driven scope
5. BL-A5 + skin edits (S) — final commit before declaring framework v10.1

Total: ~4–6 hours Builder time, 1 RT-1 + 4 sequential micro-cycles, no Validator block expected (each addition is mechanically testable on existing ODTOE corpus = regression suite).

---

**B-check (B_text, w_F=w_E=w_(1-σ)=w_Λ=0.25)**:
- F = 0.90 — read Hansei full, role file, settings.json, both git hooks, article skin, agent-context hook
- E = 0.92 — output is implementability lens; concrete file:line, effort, tier, ROI; no theoretical drift
- (1-σ) = 0.93 — proposals align with existing hook conventions (`.githooks/pre-commit:83` chaining pattern, `domain.skin` overlay pattern, JIDOKA block format)
- Λ = 0.85 — applied BL-3 (3-fix → STOP) framing on F1-F2 recurrence; applied Invariant 7 (>5 files multi-module → RT-2) check on additions; rejected proposals matching anti-pattern "Over-engineering" from `builder_EN.md:66`

**B = 0.25·0.90 + 0.25·0.92 + 0.25·0.93 + 0.25·0.85 = 0.900 (HEALTHY)**
