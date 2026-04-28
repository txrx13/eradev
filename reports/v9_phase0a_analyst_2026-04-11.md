# v9 Phase 0.A — Analyst Report: domain.md schema + domain: block design

> Date: 2026-04-11
> Role: [ANALYST]
> Task: Phase 0.A schema work — design `domain:` block schema + `templates/domain_skin.md.template`
> Scope: Part of v9 universalization roadmap (reports/roadmap_v9_2026-04-11.md)
> Output type: RT-1 report (Analyst deliverable)

---

## Activation Operator Log

- **A_F (Focus)**: Read roles/analyst_EN.md, projects/eradev/config.md + lessons.md, projects/odtoe-articles/config.md, projects/plugy/config.md, projects/academic-lab/config.md, reports/roadmap_v9_2026-04-11.md. All four existing project configs reviewed for patterns.
- **A_E (Alignment)**: Task intent is NOT "rewrite configs" but "define additive schema for Phase 1 domain adapter layer." Schema must be backward-compatible (existing configs keep working with implicit `type: code`).
- **A_σ (Consistency)**: No conflict with BL-19 (bilingual sync) — `domain:` is a pure YAML data block, language-neutral. No conflict with ODTOE L0 (Sections I-III untouched). No conflict with BL-26 (META delegation) — schema is spec, not runtime.
- **A_Λ (Experience)**: Lessons applied: BL-17 Check-First (odtoe-articles verify: pipeline), BL-19 bilingual sync (applies per-field default), BL-22 external API gate (`verify.method` must include `dry_run` option for deploy tasks), EMP4 enforcement must live where it fires (schema MUST be read by session bootstrap, not buried in docs), EMP5 scope determines pipeline strictness (`verify.method` differs by domain type).

---

## Deliverable 1 — `domain:` block schema (YAML)

### 1.1 Canonical schema

```yaml
domain:
  # REQUIRED: the class of work this project produces
  type: code | article | book | config | plan | research

  # REQUIRED: what gets produced/modified
  artifact:
    primary: source_file | section | chapter | yaml | document | proof | spec
    secondary: [test_file, design_doc, figure, citation_entry, migration_sql]

  # REQUIRED: how we know the artifact is correct
  verify:
    method: build | compile | cite_check | readability | parse | render | dry_run | recompute
    command: "actual shell command or N/A"
    success_criteria: "human-readable description of PASS"

  # REQUIRED: which modal B-formula applies (Phase 0.A theoretical output)
  metrics:
    - name: B_modality
      value: text | creative | research
    - name: strictness
      value: standard | strict | experimental

  # REQUIRED: declare membership in text-discrete scope
  ood_scope: text-discrete | continuous

  # REQUIRED: 2-5 concrete pipeline examples for agents
  examples:
    - "source -> compile -> test -> deploy -> verify"
    - "outline -> draft -> review -> publish"

  # OPTIONAL: subdomain hints for Visionary RT-0 domain detection
  subdomains:
    - "specific task category 1"
    - "specific task category 2"

  # OPTIONAL: hooks into role-specific skin overrides
  skin: "templates/domain_skin.{type}.md"
```

### 1.2 Field specification

| Field | Required | Type | Default | Validation | Notes |
|---|---|---|---|---|---|
| `type` | YES | enum | `code` (implicit for legacy configs without `domain:` block) | Must be one of: code, article, book, config, plan, research | Single value — hybrid projects pick primary and declare secondary in `artifact.secondary` |
| `artifact.primary` | YES | enum | `source_file` (if `type=code`) | Must be one of: source_file, section, chapter, yaml, document, proof, spec | Governs what `[BUILDER]` produces |
| `artifact.secondary` | NO | list of enum | `[]` | Same enum as primary | Free-form secondary artifacts the project also produces |
| `verify.method` | YES | enum | `build` (if `type=code`), `cite_check` (if `type=article`), `readability` (if `type=book`), `parse` (if `type=config`), `dry_run` (if `type=plan`), `recompute` (if `type=research`) | Must be one of listed methods | Drives `[VALIDATOR]` Jidoka gate |
| `verify.command` | YES | string | `N/A` | Must be non-empty if method != `readability\|cite_check` | Actual shell string or `N/A` for non-mechanical methods |
| `verify.success_criteria` | YES | string | empty | Non-empty, human-readable | Used as Validator assertion |
| `metrics[]` | YES | list of {name, value} | `[{name: B_modality, value: text}, {name: strictness, value: standard}]` | B_modality must be text/creative/research; strictness must be standard/strict/experimental | Selects modal B-formula weights |
| `ood_scope` | YES | enum | `text-discrete` | Must be `text-discrete` for v9. `continuous` allowed but project auto-deferred to v10+ | Enforces v9 scope boundary (R5 mitigation) |
| `examples[]` | YES | list of string | N/A | Min 2, Max 5 | Concrete pipelines for agent grounding |
| `subdomains[]` | NO | list of string | `[]` | Free-form | Visionary RT-0 input |
| `skin` | NO | string (path) | `templates/domain_skin.{type}.md` | Relative path from repo root | Points to domain-specific role override |

### 1.3 Backward compatibility rule

**Implicit default (no `domain:` block present in config.md):**

```yaml
domain:
  type: code
  artifact:
    primary: source_file
    secondary: []
  verify:
    method: build
    command: "go build ./... && go test ./..."   # if Go, else detect via repo
    success_criteria: "exit code 0, all tests pass"
  metrics:
    - name: B_modality
      value: text
    - name: strictness
      value: standard
  ood_scope: text-discrete
  examples:
    - "edit -> compile -> test -> commit -> deploy"
```

**Loader behavior (to be implemented in Phase 1.C):**
- On session bootstrap, META reads `projects/{name}/config.md`
- If `domain:` block absent → inject the implicit default above
- If `domain:` block present → validate against schema; on validation error → STOP and emit RT-0 issue
- If `ood_scope: continuous` → log warning "continuous scope deferred to v10+; operating under best-effort text-discrete protocols"

### 1.4 Validation rules (for Phase 1.B Builder)

1. **Enum closure**: All enum fields reject values outside their defined set. Validator on `config.md` load must fail-fast.
2. **Cross-field coherence**:
   - `type=code` + `verify.method=cite_check` → ERROR (mismatch)
   - `type=article` + `verify.method=build` → ERROR (unless article has a compile step, then `verify.method=compile` acceptable)
   - `type=research` + `metrics.B_modality=text` → WARNING (research usually implies `research` modality)
3. **BL-19 bilingual check**: If project has `*_RU.md` or `*_EN.md` suffix convention in artifact paths, require a second `domain:` block or a `bilingual: true` flag (deferred decision — see OQ-A1 below).
4. **Examples minimum**: `examples[]` must have at least 2 entries (single example = under-specified pipeline).
5. **Command executability**: `verify.command` if not `N/A` must be syntactically parseable by POSIX shell (Phase 1.C bash hook check).
6. **Strictness-method compatibility**:
   - `strictness: experimental` + `verify.method: build` → acceptable (rapid iteration)
   - `strictness: strict` + `verify.method: dry_run` → WARNING (dry_run is soft gate)
7. **No nested blocks**: `domain:` is flat up to depth 2. No `domain.verify.subcheck.foo`.

### 1.5 Open Questions (for Phase 1 trial)

- **OQ-A1**: Single `domain:` block per project, or bilingual `domain_EN:` + `domain_RU:`? Current proposal: single block, bilingual parity is about artifact files, not schema values.
- **OQ-A2**: Should `verify.method` accept a list (multi-method verification, e.g., `[build, dry_run]`)? Current proposal: single method in v9, list in v10 if pattern emerges.
- **OQ-A3**: Where does B-weight override live — here in `domain:` block or separate `b_weights:` top-level? Current answer: separate (plugy already uses top-level `B-weight Override` section — keep it that way, don't mix structural metadata with quality weights).
- **OQ-A4**: Should `artifact.primary` be a schema-defined enum, or free-form with convention? Current proposal: enum for v9 (catches typos + forces convergence), free-form path in v10 if new domains emerge.

---

## Deliverable 2 — `templates/domain_skin.md.template`

### 2.1 Purpose

A domain skin is a lightweight override contract: instead of rewriting the 5 role files per domain (which would multiply file count 5 × N_domains = unsustainable), a project points at ONE skin file that lists vocabulary remappings + role-focus overrides + domain-specific verification protocol. The role files themselves stay abstract (Phase 1.A vocabulary refactor). The skin file is the BRIDGE between abstract roles and concrete domain.

Analogy: role files are the class; skin is the mixin.

### 2.2 Template structure (to be written to `templates/domain_skin.md.template`)

```markdown
# Domain Skin: {DOMAIN_NAME}

> Type: code | article | book | config | plan | research
> Modality: text | creative | research
> Applies to projects where `config.md` contains `domain.type: {DOMAIN_NAME}`

---

## Vocabulary Mapping

This skin overrides the abstract role-file vocabulary for {DOMAIN_NAME} tasks. When an agent sees these generic terms, it reads them as the domain-specific meanings below.

| Abstract term (role file) | {DOMAIN_NAME} meaning |
|---|---|
| artifact | {e.g., "source file" / "section" / "chapter"} |
| verify | {e.g., "compile + test" / "citation check" / "readability pass"} |
| produce | {e.g., "write code" / "draft prose" / "derive equation"} |
| validate | {e.g., "run tests" / "fact-check" / "independent recomputation"} |
| pipeline | {e.g., "edit->compile->test->deploy" / "outline->draft->review->publish"} |
| deploy | {e.g., "git push to prod" / "submit to journal" / "publish manuscript"} |

---

## Role Focus Overrides

Each role retains its Activation Operator and Jidoka protocol from `roles/{role}_EN.md`. This section adds DOMAIN-SPECIFIC focus.

### Visionary
- Strategic question: {what does "True North" mean in this domain?}
- OOD detection: {which tasks in this domain are actually continuous/out-of-scope for v9?}
- Domain anti-patterns: {3-5 failure modes specific to this domain}

### Analyst
- Plan decomposition unit: {what is one "step" — function, paragraph, citation, config key?}
- Dependency graph: {what are the canonical edges — imports, refs, predecessors?}
- Resource conflicts: {domain-specific resources — ports, formulas, page numbers, stylesheets}
- File Ownership: {who owns which artifact when 2+ Builders run?}

### Builder
- Production protocol: {domain-specific write steps}
- Activation gate: {pre-write check — e.g., Check-First, lint pre-flight, format reference read}
- Output artifact: {extension + location convention}
- Anti-patterns: {domain-specific Builder pitfalls}

### Validator
- Verification protocol: {exact steps, exact commands}
- Success criteria: {what PASS looks like}
- Failure handling: {what Validator does on FAIL — rollback, patch, escalate}
- Independence rule: {e.g., "recompute formulas independently, don't trust prior results"}

### Coherent
- Cross-artifact consistency: {what must match across files — glossary, formula IDs, version numbers}
- Bilingual sync (BL-19): {how RU/EN sync applies in this domain}
- Drift detection: {what signals phantom coherence specific to this domain}

---

## Verification Protocol ({DOMAIN_NAME}-specific)

This maps directly to `config.md` `domain.verify.method`.

```
[method name]: {method from enum}
[command]: {shell command or N/A}
[success criteria]: {assertion in prose}
[failure recovery]: {what to do if validation fails — re-run, fix, escalate}
[independence check]: {what "independent verification" means here}
```

---

## Checklists

### Pre-Generation Checklist (Check-First, BL-17)
- [ ] Item 1 — {domain-specific pre-check}
- [ ] Item 2 — ...
- [ ] Item N — ...

### Post-Generation Checklist (Jidoka gate)
- [ ] Item 1 — {domain-specific post-check}
- [ ] Item 2 — ...
- [ ] Item N — ...

---

## Examples (3 concrete tasks)

### Example 1: {Short task title}
- **Input**: {what the user asked}
- **Domain classification**: type={X}, verify={Y}
- **Pipeline**: step1 -> step2 -> step3 -> step4
- **Expected artifact**: {file list + locations}
- **Verification**: {exact command + PASS criteria}

### Example 2: {Short task title}
- ...

### Example 3: {Short task title}
- ...

---

## Domain-Specific Bootstrap Lessons

If any BL entries are tagged `[CODE-ADAPTER]` in BOOTSTRAP_LESSONS.md, list the {DOMAIN_NAME}-specific equivalents here. These are the lessons a fresh agent should read BEFORE spawning an agent on a {DOMAIN_NAME} task.

- DL-1: {domain lesson 1}
- DL-2: {domain lesson 2}
- ...

---

## Known Out-of-Scope (OOD)

Tasks that look like {DOMAIN_NAME} but are actually continuous or out of v9 scope:
- {pattern 1 — why it's OOD}
- {pattern 2 — why it's OOD}

Agents should escalate these to Visionary RT-0, not auto-proceed.

---

## B-weight Adjustment (if any)

{If this domain requires non-default B-weights, list them here. Default: w_F=w_E=w_{1-σ}=w_Λ=0.25.}

| Component | Weight | Rationale |
|---|---|---|
| F | 0.25 | ... |
| E | 0.25 | ... |
| (1-σ) | 0.25 | ... |
| Λ | 0.25 | ... |

---

*Last updated: YYYY-MM-DD*
*Upstream roles: roles/{role}_EN.md*
*Upstream math: eradev.md Section II*
```

### 2.3 Template design choices + rationale

1. **Vocabulary table first**: Agents hit this before any prose. It's the fastest bridge from abstract role file → domain action.
2. **Per-role focus override, NOT replacement**: Skin adds, doesn't subtract. Activation Operator + Jidoka stay intact. This preserves BL-26 (full role-file inclusion in agent prompts) even when skin is active.
3. **Examples section mandatory**: 3 concrete examples are enough to ground an agent in a new domain without triggering Muri (>5 subtasks).
4. **Bootstrap lessons section**: Carries the Phase 1.D BL split — code-specific lessons stay in code adapter, domain-specific lessons live here.
5. **OOD section explicit**: Mitigation for R5 (scope creep). Each skin declares what it is NOT. Visionary escalation path is built-in.
6. **B-weight override optional**: Only plugy currently overrides. Default keeps the table empty. When overridden, rationale is required (plugy pattern).

---

## Deliverable 3 — Three Concrete Examples

### Example 3.1 — Code project (`projects/eradev` self-project)

Existing `projects/eradev/config.md` has no `domain:` block. Proposed addition:

```yaml
domain:
  type: code
  artifact:
    primary: source_file
    secondary: [design_doc, test_file, role_file]
  verify:
    method: build
    command: "markdown-lint *.md && shellcheck scripts/*.sh"
    success_criteria: "all markdown files parse cleanly, all shell scripts pass shellcheck, bilingual pairs present (BL-19)"
  metrics:
    - name: B_modality
      value: text
    - name: strictness
      value: strict
  ood_scope: text-discrete
  examples:
    - "edit role file -> update RU mirror -> verify bilingual sync -> git commit"
    - "add BL entry -> update BOOTSTRAP_LESSONS -> tag [UNIVERSAL|CODE-ADAPTER] -> commit"
    - "propose architectural change -> RT-1 (5 agents) -> synthesize -> commit"
  subdomains:
    - "framework-core"
    - "role-files"
    - "bootstrap-lessons"
    - "project-configs"
  skin: "templates/domain_skin.code.md"
```

**Notes for eradev:** `B_modality=text` not `creative` — eradev artifacts are text-discrete markdown, not creative prose. `strictness=strict` because framework changes need bilingual sync + RT gates. `verify.command` uses markdown linting instead of compile (no binary output), but method stays `build` because the conceptual step is "produce valid deployable artifact."

---

### Example 3.2 — Article project (`projects/odtoe-articles`)

Proposed addition to existing `projects/odtoe-articles/config.md`:

```yaml
domain:
  type: article
  artifact:
    primary: section
    secondary: [formula, citation_entry, figure, bibliography_item]
  verify:
    method: cite_check
    command: "tectonic ODTOE_{topic}.tex && tectonic ODTOE_{topic}_EN.tex"
    success_criteria: "PDF compiles cleanly (both RU+EN), all 8 verification checks PASS, bibliography DOIs resolve, 50-digit precision on all constants, all 8 artifact files present per BL-19"
  metrics:
    - name: B_modality
      value: research
    - name: strictness
      value: strict
  ood_scope: text-discrete
  examples:
    - "Check-First (8 items) -> draft RU .tex -> compile -> translate EN -> compile -> DOCX -> MD -> 7 checks -> commit all 8 files"
    - "add new formula -> recompute 50-digit -> trace dependents -> update conclusions -> re-run Check 2"
    - "cite new paper -> verify DOI -> tag [FACT: source] -> update bibliography both RU+EN"
  subdomains:
    - "odtoe-corpus"
    - "latex-xelatex"
    - "bibliography"
    - "50-digit-precision"
  skin: "templates/domain_skin.article.md"
```

**Notes for odtoe-articles:** `B_modality=research` because article generation is theorem+proof work, not narrative. `verify.method=cite_check` is the KEY differentiator — this is the exact thing that a `build` method would miss. The success criteria baked in the BL-19 8-file requirement. Strictness is `strict` (science work, no shortcuts). Existing Check-First pipeline maps directly onto `skin` file's Pre-Generation Checklist section.

---

### Example 3.3 — Book project (NEW, hypothetical — `projects/example-book`)

Hypothetical project: Anton is writing a book that synthesizes ODTOE for general readers.

```yaml
# projects/example-book/config.md

domain:
  type: book
  artifact:
    primary: chapter
    secondary: [section, illustration, glossary_entry, front_matter, back_matter]
  verify:
    method: readability
    command: "pandoc chapter_{N}.md -o chapter_{N}.pdf && check_readability.py chapter_{N}.md"
    success_criteria: "Flesch reading ease >= 50 (general reader target), no chapter exceeds 8000 words, cross-refs resolve, glossary coverage >= 90% of technical terms"
  metrics:
    - name: B_modality
      value: creative
    - name: strictness
      value: standard
  ood_scope: text-discrete
  examples:
    - "outline chapter -> draft prose -> cross-ref check -> glossary update -> readability pass -> commit"
    - "introduce new concept -> check prior mentions -> add glossary entry -> bidirectional link -> re-run coherence"
    - "reader feedback incident -> trace to chapter -> rewrite section -> preserve voice -> re-readability"
  subdomains:
    - "chapters"
    - "glossary"
    - "illustrations"
    - "front-matter"
  skin: "templates/domain_skin.book.md"
```

**Notes for example-book:** `B_modality=creative` because book prose requires narrative/voice coherence, not just factual accuracy — different weight profile from article or code. `verify.method=readability` is a SOFT gate (no binary PASS/FAIL), so strictness is `standard` not `strict`. The Flesch-score gate is a Validator assertion, not a blocker — this differs from article which has hard DOI resolution gates. Subdomains hint at what a chapter-level Builder sees vs. a glossary-level Builder.

---

## Implementation Plan (handoff to Phase 1.B Builder)

Task inertia: **M** (touches 4 existing configs + creates 1 template + no code runtime changes, pure additive YAML)

### Files
1. **Create**: `templates/domain_skin.md.template` — content from Deliverable 2.2 above
2. **Modify**: `projects/eradev/config.md` — append `## Domain` section with YAML from Example 3.1
3. **Modify**: `projects/odtoe-articles/config.md` — append `## Domain` section with YAML from Example 3.2
4. **Modify**: `projects/plugy/config.md` — append `## Domain` section (NOT specified in this report; Builder derives from existing tech stack: `type: code`, `verify.method: build`, `command: go build ./... && pytest`, `strictness: strict`, `B_modality: text`). The existing `B-weight Override` stays as separate section, does NOT merge into `domain:`.
5. **Modify**: `projects/academic-lab/config.md` — append `## Domain` section (NOT specified; Builder derives: `type: code`, `verify.method: build`, `command: go build ./...`, `strictness: strict`, `B_modality: text`, noting existing Iron Rule "NEVER modify servers manually").

### Dependencies
- **Parallelizable**: All 4 config.md modifications can be done in parallel (4 independent Builders). File Ownership: each Builder owns 1 config file.
- **Sequential**: Template file must exist BEFORE configs reference `skin: templates/domain_skin.{type}.md`.
- **Not this phase**: `templates/domain_skin.code.md`, `domain_skin.article.md`, `domain_skin.book.md` concrete instances — those are Phase 2.A deliverables, not Phase 0.A. Only the `.template` file is produced now.

### File Ownership (when 2+ Builders)
- Builder A → `templates/domain_skin.md.template` + `projects/eradev/config.md`
- Builder B → `projects/odtoe-articles/config.md`
- Builder C → `projects/plugy/config.md`
- Builder D → `projects/academic-lab/config.md`

All Builders MUST wait for Coherent gate before Validator starts (Invariant 11: sequential Builder→Validator, parallel within phase).

### Pipeline
```
1. [ANALYST] (this report)
    -> 2. [COHERENT] cross-check schema against L0 invariants
        -> 3a. [BUILDER A] templates/domain_skin.md.template
        -> 3b. [BUILDER B] eradev config (example 3.1 inline)
        -> 3c. [BUILDER C] odtoe-articles config (example 3.2 inline)
        -> 3d. [BUILDER D] plugy config (derived)
        -> 3e. [BUILDER E] academic-lab config (derived)
            -> 4. [COHERENT] BL-19 + schema validation gate
                -> 5. [VALIDATOR] all files parse, all schemas valid, no L0 changes
                    -> 6. git commit (single commit, per Invariant 7)
```

### Resource conflicts
- **None**: Pure markdown edits, no port/process conflicts
- **BL-19 bilingual sync**: None of the 4 config.md files have _RU.md mirrors (project configs are already single-language EN by convention). Template file: NOT bilingual per se, but the `{DOMAIN_NAME}` placeholder keeps it language-neutral.

### System dependencies
- None beyond existing toolchain (markdown, git)
- Phase 1.C Builder will need YAML parser (`yq`) for the loader validation — flag for Phase 1.C, not this phase

### Backward compatibility guarantee
- Existing configs WITHOUT `domain:` block continue to work via the implicit default (Section 1.3 above)
- No CLAUDE.md, meta.md, eradev.md changes in this deliverable
- Phase 1.C (Universal CLAUDE.md) will add the loader that reads `domain:` on session bootstrap — that is the work that actually activates the schema

---

## B-check (Jidoka Self-Check)

```
=== JIDOKA SELF-CHECK ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.90 -- Read all 4 project configs, role file, roadmap, lessons.
                          Missing: templates/ existing files (read AGENTS.md.template + CLAUDE.md.template only listed, not opened fully)
  E (Alignment):   0.95 -- Deliverables 1, 2, 3 all produced. Schema is additive,
                          template is abstract, examples cover code+article+book as requested.
  (1-σ):           0.85 -- No conflict with L0, BL-19, BL-26. Open Questions recorded for
                          ambiguities (OQ-A1..A4). One minor: B-weight override placement
                          decision left as OQ-A3 — mild inconsistency with plugy pattern.
  Λ (Experience):  0.85 -- Applied BL-17, BL-19, BL-22, EMP4, EMP5 explicitly.
                          Applied Check-First pattern from odtoe-articles to the
                          Pre-Generation Checklist section of the template.
  B = F * E * (1-σ) * Λ = 0.90 * 0.95 * 0.85 * 0.85 = 0.617
```

**B = 0.617 > 0.5 → no Andon. Report delivered.**

**Component minima:** min(0.90, 0.95, 0.85, 0.85) = 0.85 > 0.3 → no single-component failure.

---

## Open Questions (Spiral Gap)

- **OQ-A1**: Bilingual schema duplication — single `domain:` or mirrored `domain_EN:`/`domain_RU:`? (Phase 1 trial)
- **OQ-A2**: `verify.method` as single value or list? (Phase 1 trial, accept in v10 if pattern emerges)
- **OQ-A3**: B-weight override placement — in `domain:` block or separate top-level section? (Current: separate, matching plugy. Revisit if 2+ projects want to couple weights to domain type.)
- **OQ-A4**: `artifact.primary` free-form or enum? (Current: enum for v9, free-form candidate for v10)
- **OQ-A5**: How does the `skin` field path resolve when running from `projects/{name}/config.md` vs. from repo root? Absolute or relative? (Recommend: always relative from repo root, consistent with existing `roles/{role}_EN.md` references.)

---

## Handoff Summary

Next actors:
- **[COHERENT]** — review schema for L0 safety + BL-19 compatibility BEFORE Builder work begins
- **[BUILDER]** (5 parallel) — implement files per Implementation Plan
- **[VALIDATOR]** — schema parse + absence of L0 changes
- **META-Orchestrator** — coordinate Phase 0.B tagging work in parallel with this schema work (per roadmap)

This deliverable is READY for Phase 1.B consumption. Phase 0.A schema portion complete.

---

*Analyst report complete. B=0.617. Handoff to Coherent + Builder chain.*
