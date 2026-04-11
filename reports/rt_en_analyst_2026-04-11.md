# RT-1 [ANALYST] EN — Universalization of EraDev: File-Level Decomposition

> Date: 2026-04-11
> Role: EN-Analyst (practical decomposition)
> Task type: CONCRETE ARTIFACT (file-level changes) → EN stack
> Scope: Decompose "universalize EraDev" into file edits with dependencies, conflicts, inertia, parallelization plan
> Status: ROLE CONTRIBUTION FOR RT-1 (one of five parallel perspectives)

---

## 0. Activation Operator — Completed

- **A_F (Focus):** Read eradev.md, meta.md, BOOTSTRAP_LESSONS.md, CLAUDE.md, all 5 role files (EN), LOADING_PROTOCOL.md, glossary_EN.md (first 100 lines), all 4 project configs + 3 lessons files, 2 prior reports (multi_agent_frameworks_comparison, rtk_analysis), odtoe/CLAUDE.md, odtoe/AGENTS.md, ODTOE_AI_AGI_EXPANSION_2026.md (sections I–V), `.claude/skills/eradev/SKILL.md`, skill bundle layout, all 3 templates (CLAUDE.md.template, CLAUDE.md.universal, AGENTS.md.template).
- **A_E (Alignment):** The task intent is NOT "rename Builder" — it is to separate **universal orchestration primitives** from **domain embeddings**, so the same core framework routes work to (a) code/infra projects (plugy, academic-lab), (b) scientific-article projects (odtoe-articles), (c) new domains (AGI research, knowledge work, content creation) without core file rewrites.
- **A_sigma (Consistency):** Major resource conflicts identified: (1) role files hardcode code-pipeline vocabulary that clashes with article domain, (2) meta.md Section 7b role selection guide is code-biased, (3) BOOTSTRAP_LESSONS.md contains code-specific BLs that become inactive on non-code projects, (4) glossary maps ODTOE terms to code-specific analogs only. No file-path conflicts because the bilingual pair convention already exists (BL-19).
- **A_Lambda (Experience):** Consulted projects/eradev/lessons.md — particularly EMP5 (scope determines pipeline strictness), lesson 3 (EN +48% B for practical), lesson 6 (Section 0.5 removed: enforcement belongs in META protocol), lesson 13 (RT-1 can REJECT — healthy), BL-19 (bilingual sync), BL-31 (constrain output types to constrain behavior), BL-32 (grep after BL merge). The framework has ALREADY been rebuilt once from scratch (v7.1 → v8) through 25-agent parallel analysis. Universalization is a second self-application of Ψ* = Φ(Ψ*).

**4/4 GREEN.** Proceed to plan.

---

## 1. Core Thesis

**Universalization is NOT about removing the Builder role — the 5-role topology (ODTOE analog) is provably minimal (n_min = ⌈π⌉+1 = 5, MetaGPT converged on the same split independently — see multi_agent_frameworks_comparison lines 165–175). Universalization is about separating the UNIVERSAL OPERATOR LAYER from the DOMAIN BINDING LAYER.**

Current state: role files, BL entries, and meta.md guide all bake a specific domain (software engineering with build/compile/lint/commit/deploy) into files that are advertised as universal. The odtoe-articles project already proves the framework can handle non-code work (LaTeX compilation, plagiarism checks, 50-digit numerical verification) — but only by _overriding_ the role files inside projects/odtoe-articles/config.md's "EraDev Role Mapping for Articles" section. That override is a workaround, not an architecture.

**Target state:** Core files reference abstract operators (Plan → Produce → Verify → Synchronize), and domain bindings live in a new `domains/` directory that projects pick from. Adding a new domain (e.g., AGI research, business analysis, legal drafting) = add one `domains/{domain}.md` file + point the project config at it. Zero edits to core.

---

## 2. Code-Centric Contamination Audit (concrete findings)

Files were grepped for `compile|build|commit|deploy|lint|git|code|pipeline|artifact`. Contamination ranked by Blast Radius.

### HIGH (core files — violate Iron Rule 7 "core isolation")

| File | Line(s) | Content (excerpt) | Problem |
|------|---|---|---|
| `eradev.md` | 43 | Task signals: `implement, fix, deploy, test, build, debug, refactor, configure, migrate, monitor, optimize, integrate` | "Practical" verb set is entirely code-ops. Omits: draft, write, compose, illustrate, derive, cite, verify-source. |
| `eradev.md` | 128–129 | `fix_rate = fix commits / total commits`, `chain_ratio = commits in fix chains` | S_session metric bound to git commit concept. No equivalent for article revisions or research notes. |
| `eradev.md` | 191–205 | Enforcement Gates: PRE-FLIGHT (API curl), BUILD-VERIFY (build/compile/lint), BL-6 "compile, lint, parse, render" | Gates are code-shaped. Article domain uses different gates (Check-First pipeline from odtoe-articles/config.md); these live _inside_ the project config, orphaned from the core. |
| `eradev.md` | 466–480 | Glossary: "Observation result R" → "code, plan, report"; "Fixed Point Ψ*" → "stable release (commit after 5/5 GO)"; "Config lifetime T(C)" → "Stability of deployment" | ODTOE analogs are code-specific. An article glossary would map R → finished manuscript, Ψ* → published version. |
| `eradev.md` | 511 | "IP addresses, port lists, build commands, incident history" | Only code-project examples — signals to readers that EraDev is a "code framework." |
| `meta.md` | 20 | `"when META needs to verify a hypothesis about code/state/service"` | Check Agent described code-centric. Article domain: "verify a hypothesis about formula/citation/corpus consistency." |
| `meta.md` | 108–112 | MM1 example "Go cache → any build cache"; MM2 full pipeline "source→build→artifact→deploy→serve→verify" | Meta-rules use code-only examples. Same rule in article domain: draft → typeset → compile → review → archive. |
| `meta.md` | 141–161 | Section 7b "Role selection guide" — Builder = "coding, implementation"; Validator = "run tests, benchmarks"; "Builder CODES and CREATES" | Selection guide hardcodes code. The entire routing table must be re-expressed in universal terms. |
| `meta.md` | 207–208 | `"3 = single agent self-check (compile, test, lint)"` | Level 3 definition is code-specific. |
| `meta.md` | 216–224 | Commit Archaeology table: "file changed >5x", "fix after feat", "revert/rollback" | Commit-based detection logic only. |
| `meta.md` | 249 | `"pre-push hook or Makefile target"` | Enforcement mechanism examples are code-only. |
| `meta.md` | 269 | Session Entry `"[ ] 10. FIX RATE: After every 10 commits, compute fix rate"` | Checklist item bound to commits. |

### HIGH (role files — the biggest single contamination source)

All 5 EN role files (excluding `validator_EN.md` line 23 which still uses "fix commits"):

| File | Count of code-specific tokens | Severity |
|------|---|---|
| `roles/builder_EN.md` | 24+ (compile, git, build, codebase, Go, pnpm, tls, dns) | CRITICAL — the entire "Mission" section says "working, compilable, tested code" |
| `roles/analyst_EN.md` | 8 (pipeline source→build→artifact→deploy, code, packages, kernel modules) | HIGH |
| `roles/validator_EN.md` | 14 (code review, build verification, compiles, test pass, binary, TLS, firewall) | CRITICAL |
| `roles/visionary_EN.md` | 6 (deployed, zero-downtime, rolling/canary/blue-green) | MEDIUM — the core "what & why" question is already domain-agnostic; the code bias is concentrated in the "Key Rules" section |
| `roles/coherent_EN.md` | 4 (deploy/infra, DNS/TLS/systemctl, UI/API) | MEDIUM — S_team monitoring is domain-agnostic; code bias is in the Blast Radius example table |

**Cross-observation:** Every role file has an **Activation Operator section** (A_F → A_E → A_σ → A_Λ) that is 100% domain-agnostic already. The code bias is isolated to (a) "Mission" statements, (b) "Key Rules" tables, (c) "Anti-patterns", (d) "Output Format". This is the easy part: the 4-step boot sequence is the core, and it transfers cleanly.

### HIGH (BOOTSTRAP_LESSONS.md — 32 entries)

Per-entry assessment:

| BL | Universal? | Action |
|----|------------|--------|
| BL-1 Lambda=0.5 cold start | ✅ Universal | Keep |
| BL-2 Canary deploy for protocol changes | ❌ Code-specific | Generalize: "rule changes to coordination/interface layer need staged rollout" |
| BL-3 Fix chain > 3 | ⚠️ Uses word "fix" | Re-express: "3+ consecutive revisions of same artifact = STOP, specify" |
| BL-4 S_adjusted | ✅ Universal | Keep |
| BL-5 Phantom coherence | ✅ Universal | Keep |
| BL-6 Verify before act (code, document, config) | ⚠️ Already broader | Already generalizes — code was just one example. Promote "render/parse/compile" to "produce verified draft" |
| BL-7 EN vs RU | ✅ Universal | Keep |
| BL-8 Feature flag = deployment | ❌ Code-specific | Generalize: "any user-visible behavior change = deployment; define staged rollout regardless of mechanism" |
| BL-9 Interface contracts | ✅ Universal | Keep |
| BL-10 Multiplicative structure | ✅ Universal | Keep |
| BL-11 Scope creep is Muda | ⚠️ Uses "commit" | Re-express: "one task = one scoped output" |
| BL-12 Hansei process not people | ✅ Universal | Keep |
| BL-13 Yokoten + grep gate | ⚠️ Uses "codebase" | Re-express: "grep across all artifacts of the domain" |
| BL-14 Rollback before deploy | ❌ Code-specific | Generalize: "reversal plan before any non-trivial change" |
| BL-15 2% spiral gap | ✅ Universal | Keep |
| BL-16 Reading ≠ applying | ✅ Universal (but uses "writes code") | Minor wording fix |
| BL-17 Pre-generation check | ✅ Universal (explicitly mentions "article, code, config") | Keep |
| BL-18 Reclassification at 2x | ✅ Universal | Keep |
| BL-19 Bilingual sync | ✅ Universal | Keep |
| BL-20 Test bootstrap adversarially | ✅ Universal | Keep |
| BL-21 Format = Step 0 | ✅ Universal (mentions LaTeX/config/markdown) | Keep |
| BL-22 PRE-FLIGHT for external APIs | ❌ Code-specific (curl-verify) | Generalize: "for tasks depending on external sources (APIs, papers, databases, corpora), verify accessibility + shape before starting" |
| BL-24 Single-responsibility commits | ⚠️ Commit-word | Generalize: "single-responsibility deliverables / atomic units of work" |
| BL-25 Error path matrix | ❌ Code-specific | Generalize: "5-path coverage — happy / error / timeout / recovery / partial — for any process with failure modes" |
| BL-26 META always delegates | ✅ Universal (but uses "code") | Minor wording fix |
| BL-28 Agent prompt explicit context | ✅ Universal | Keep |
| BL-29 Verify established terminology | ✅ Universal (explicitly generalizes beyond articles) | Keep |
| BL-30 Defense in depth | ✅ Universal | Keep |
| BL-31 Constrain output types | ✅ Universal | Keep |
| BL-32 Grep after BL merge | ✅ Universal | Keep |

**Summary:** 21/32 BLs are already universal or need only minor wording fixes. 8/32 are code-specific and need generalization. 3/32 use word "fix"/"commit" as token but are universal in spirit. The BL layer is the least contaminated.

### MEDIUM (CLAUDE.md + templates)

- `CLAUDE.md` Invariant 10 (operational vs diagnostic Bash classification) is universal in concept but examples are code-centric.
- `templates/CLAUDE.md.template` and `templates/CLAUDE.md.universal` both inherit the code bias.
- `templates/AGENTS.md.template` is the ECC-aligned variant — a reasonable starting point for universal bootstrap.

### LOW (glossary, reports, projects/*)

- `glossary_EN.md` is a mapping table; adding a second mapping column for domain analogs is a small change.
- All `projects/{name}/` files are project-specific — untouched by universalization. They are the intended home of domain-specific content.
- `reports/*` are historical — left alone.

---

## 3. Proposed Architecture: "Domain Binding Layer"

Introduce a new layer between the universal core and project configs:

```
eradev/
  eradev.md                 <-- CORE (domain-agnostic operators only)
  eradev_RU.md              <-- RU twin
  meta.md                   <-- META protocol (domain-agnostic)
  meta_RU.md
  roles/
    {role}_EN.md            <-- ABSTRACT role (4-step A operator, universal output format)
    {role}.md               <-- RU twin
  domains/                  <-- NEW: domain binding layer
    software.md             <-- code/infra domain binding (current role files' code parts)
    software_EN.md
    research-article.md     <-- scientific writing domain (from odtoe-articles config)
    research-article_EN.md
    knowledge-work.md       <-- drafts, reports, memos (future)
    knowledge-work_EN.md
    DOMAIN_TEMPLATE.md      <-- template for adding new domains
  BOOTSTRAP_LESSONS.md      <-- universal lessons (21 kept + 8 generalized + 3 reworded)
  glossary_EN.md            <-- +new "Domain Analog" column (multi-domain mapping)
  projects/
    {name}/
      config.md             <-- declares: domain: software | research-article | ...
```

### How the layers compose at runtime

1. META loads `eradev.md` + `meta.md` + `BOOTSTRAP_LESSONS.md` (all universal, ~600 lines).
2. META reads `projects/{name}/config.md` → `domain: research-article`.
3. META loads `domains/research-article_EN.md` → this file contains the domain-specific verb set, Blast Radius examples, enforcement gates, and role specializations.
4. When spawning an agent, META instructs: "Read `roles/{role}_EN.md` AND `domains/research-article_EN.md`."
5. Agent self-loads both. Role file gives the universal operator; domain file gives the concrete shape.

This is an application of the **ODTOE observer-operator decomposition** that ODTOE_AI_AGI_EXPANSION_2026.md section III.1 advocates: `M̂ = M̂_struct ∘ M̂_meta`. Role files = M̂_meta (universal strategy of observation). Domain files = M̂_struct (concrete structure being observed). Projects supply Ψ (the field of states).

---

## 4. File-Level Decomposition

### 4.1 NEW files (18 = 9 EN + 9 RU counterparts per BL-19)

| # | File | Source of content | Lines est. | Owner (Builder) |
|---|------|-------------------|------------|-----------------|
| N1 | `domains/software_EN.md` | Extract code-specific parts from roles/builder_EN.md, validator_EN.md, analyst_EN.md + all code BLs + academic-lab/plugy examples | ~250 | Builder-A |
| N2 | `domains/software.md` | RU twin | ~300 | Builder-A |
| N3 | `domains/research-article_EN.md` | Extract from projects/odtoe-articles/config.md Check-First + Seven Checks + Role Mapping; make domain-specific (not project-specific) | ~200 | Builder-B |
| N4 | `domains/research-article.md` | RU twin | ~250 | Builder-B |
| N5 | `domains/knowledge-work_EN.md` | New — drafting, reports, memos, non-code non-article knowledge work | ~150 | Builder-C (skeleton only in this cycle) |
| N6 | `domains/knowledge-work.md` | RU twin | ~180 | Builder-C |
| N7 | `domains/DOMAIN_TEMPLATE_EN.md` | Template with required sections (Mission, Verb Set, Blast Radius Ladder, Enforcement Gates, Role Specialization, Verify-Before-Act gate) | ~80 | Builder-D |
| N8 | `domains/DOMAIN_TEMPLATE.md` | RU twin | ~100 | Builder-D |
| N9 | `domains/README.md` | Explains the domain binding layer, how to add a new domain, conformance checklist | ~50 | Builder-D |

### 4.2 MODIFIED files (18 core + 2 templates + 4 project configs = 24)

#### Core universal layer (must become domain-agnostic)

| # | File | Change | Size of change | Owner |
|---|------|--------|----------------|-------|
| M1 | `eradev.md` | (1) Section 0 verb table: replace code-only verbs with union across domains; add "Domain Routing" subsection pointing to `domains/`. (2) Glossary section XVI: add "Domain Analog" column (parametrized). (3) Section X/XIV Jidoka: remove code-specific check wording. (4) Enforcement Gates → move code-specific ones to `domains/software_EN.md`, keep universal PRE-FLIGHT/LAMBDA-AUDIT in core. (5) File Map (XVII): add `domains/` entry. (6) Iron Rule 7 updated to reference domain layer. | ~60 lines changed, ~20 added, ~30 removed | Builder-E |
| M2 | `eradev_RU.md` | RU parallel changes | ~70 lines changed | Builder-E |
| M3 | `meta.md` | (1) Section 7b Role Selection Guide: rewrite in domain-agnostic terms. Each role described by its _function_, not by "coding/testing". (2) Check Agent description: verify hypotheses about "artifacts, sources, state". (3) MM1/MM2 examples: add non-code examples. (4) Section 10 Level 3: rewrite without "compile/test/lint". (5) Section 11 Commit Archaeology → "Artifact Archaeology" (commits is one instance). (6) Section 13 enforcement examples: add per-domain enforcement. (7) Session Entry `[10] FIX RATE`: re-express as "revision rate". (8) Agent prompt template: load `domains/{domain}_EN.md` alongside role file. | ~50 lines changed, ~15 added | Builder-F |
| M4 | `meta_RU.md` | RU parallel | ~60 lines changed | Builder-F |
| M5 | `roles/builder_EN.md` | Strip "Mission = compilable code". Mission = "turn plan into verified produced artifact". Key Rules: universal versions only. Domain-specific rules → `domains/software_EN.md`. Security Checklist → `domains/software_EN.md` (not universal). | ~30 lines changed | Builder-G |
| M6 | `roles/builder.md` | RU parallel | ~35 lines changed | Builder-G |
| M7 | `roles/validator_EN.md` | Mission = "verify match against intent". Remove `compiles/tests pass` from generic rules; move to software domain. Keep: pipeline stage verification, fix chain detector (reworded), revert = postmortem, Mura Detector, Managed Dissonance Scale. | ~25 lines changed | Builder-G |
| M8 | `roles/validator.md` | RU parallel | ~30 lines changed | Builder-G |
| M9 | `roles/analyst_EN.md` | Remove "source→build→artifact→deploy→serve→verify" as universal pipeline; make it one example in the software domain. Generic pipeline = "input → plan → produce → verify → deliver". Remove "kernel modules" from system deps example — generalize. | ~20 lines changed | Builder-H |
| M10 | `roles/analyst.md` | RU parallel | ~25 lines changed | Builder-H |
| M11 | `roles/visionary_EN.md` | Remove "zero-downtime, rolling/canary/blue-green" as universal; mark as software-domain. Generic: "continuity plan". Keep Zone Detection, Inverted IFR, AC/FM — all universal. | ~10 lines changed | Builder-H |
| M12 | `roles/visionary.md` | RU parallel | ~12 lines changed | Builder-H |
| M13 | `roles/coherent_EN.md` | Blast Radius Ladder: make it a parametric template with the concrete ladder coming from the domain file. Universal levels: LOW / MEDIUM / HIGH / CRITICAL + abstract definitions. | ~15 lines changed | Builder-H |
| M14 | `roles/coherent.md` | RU parallel | ~18 lines changed | Builder-H |
| M15 | `BOOTSTRAP_LESSONS.md` | Generalize BL-2, BL-8, BL-14, BL-22, BL-25 (5 code-only). Reword BL-3, BL-11, BL-13, BL-16, BL-24, BL-26 (6 that mention "fix/commit/code"). Leave 21 untouched. | ~60 lines changed | Builder-I |
| M16 | `glossary_EN.md` | Add "Domain Analog" expansion: instead of "stable release (commit after 5/5 GO)", say "stable fixed point (examples: software = tagged release; article = published manuscript; knowledge work = approved final)". | ~40 lines changed | Builder-I |
| M17 | `glossary.md` | RU parallel | ~45 lines changed | Builder-I |
| M18 | `LOADING_PROTOCOL.md` | Step 3 updated: add `domains/{domain}_EN.md` as mandatory loading step between role file and project config. | ~15 lines changed | Builder-I |

#### Templates and bootstrap

| # | File | Change | Owner |
|---|------|--------|-------|
| M19 | `templates/CLAUDE.md.template` | Replace code-specific invariant examples. Add `DOMAIN = <pick>` as a placeholder in Mandatory Loading. | Builder-J |
| M20 | `templates/CLAUDE.md.universal` | Mirror changes | Builder-J |
| M21 | `templates/AGENTS.md.template` | Mirror changes; also add the `domains/` loading instruction | Builder-J |
| M22 | `CLAUDE.md` (root) | Add DOMAIN routing step in Mandatory Loading | Builder-J |

#### Project config updates (adapting existing projects to new architecture)

| # | File | Change | Owner |
|---|------|--------|-------|
| M23 | `projects/odtoe-articles/config.md` | Delete inlined "EraDev Role Mapping for Articles" section (now lives in `domains/research-article_EN.md`). Keep: project-specific content (paths, preamble, Seven Checks values, bibliography references). Add `domain: research-article` header. | Builder-K |
| M24 | `projects/plugy/config.md` | Add `domain: software` header. No other changes — project-specific content stays. | Builder-K |
| M25 | `projects/academic-lab/config.md` | Same as plugy | Builder-K |
| M26 | `projects/eradev/config.md` | Add `domain: software` header (EraDev itself is a software project that produces markdown operators — it is self-describing). | Builder-K |

#### Skill bundle mirror

| # | File | Change | Owner |
|---|------|--------|-------|
| M27 | `.claude/skills/eradev/SKILL.md` | Mirror all core changes from M1–M22 | Builder-L |
| M28 | `.claude/skills/eradev/core/*` | Copy M1–M4 | Builder-L |
| M29 | `.claude/skills/eradev/meta/*` | Copy M3–M4 + M15 + M18 | Builder-L |
| M30 | `.claude/skills/eradev/roles/*` | Copy M5–M14 | Builder-L |
| M31 | `.claude/skills/eradev/reference/*` | Copy M16–M17 | Builder-L |
| M32 | `.claude/skills/eradev/domains/*` | NEW — copy N1–N9 | Builder-L |

### 4.3 DELETED files

**None.** Even the most code-biased content is repurposed (moved into `domains/software_EN.md`), not deleted. This preserves all accumulated Lambda.

### 4.4 Grand Totals

- 18 NEW files (9 EN + 9 RU)
- 32 MODIFIED files (18 core + 4 templates/bootstrap + 4 projects + 6 skill bundle, with some overlap)
- 0 DELETED
- **Net files touched: ~50**

This exceeds BL-24's threshold of "5 files from different modules = RT-2 required". **RT-2 is mandatory.**

---

## 5. Dependencies and Parallelization Plan

### Dependency graph

```
N7,N8,N9 (template)                    ─────► N1,N2  (software domain)   ──┐
                                       └────► N3,N4  (article domain)    ──┤
                                       └────► N5,N6  (knowledge-work)    ──┤
                                                                            │
                                                                            ▼
                                   M1,M2 (eradev.md, eradev_RU.md)          │
                                        │                                   │
                                        ▼                                   │
                                   M3,M4 (meta.md, meta_RU.md)              │
                                        │                                   │
                                        ▼                                   │
           ┌────────────────────────────┼───────────────────────┐           │
           ▼                            ▼                       ▼           │
         M5–M14                      M15                     M16–M18        │
   (role files 10)                 (BL)                     (glossary+load) │
           │                            │                       │           │
           └──────────────┬─────────────┴───────────────────────┘           │
                          ▼                                                 │
                      M19–M22 (templates, CLAUDE.md root) ◄─────────────────┘
                          │
                          ▼
                      M23–M26 (project configs) — no cross-dep, parallel
                          │
                          ▼
                      M27–M32 (skill bundle mirror) — final pass
```

### Optimal parallelization (per Invariant 13 — maximize parallelization)

**Phase 0 — Template & Core Spec (SEQUENTIAL, ~30 min):**
1. Builder-D writes N7, N8, N9 (template + README). This is the interface contract (BL-9) for all 3 domain builders. It MUST complete before domain builders start.

**Phase 1 — Domain Extraction (PARALLEL, 3 builders):**
2. Builder-A: N1, N2 (software domain) — extracts code bits from role files
3. Builder-B: N3, N4 (article domain) — extracts from odtoe-articles/config.md
4. Builder-C: N5, N6 (knowledge-work skeleton) — net-new content

**All three work in parallel, with Coherencer enforcing consistency against N7 template (File Ownership: each builder owns the 2 files of their domain).**

**Phase 2 — Core Universalization (PARALLEL where possible):**
5. Builder-E: M1, M2 (eradev.md + RU twin) — independent; starts once N1-N6 exist
6. Builder-F: M3, M4 (meta.md + RU twin) — independent; starts once N1-N6 exist

**Builder-E and Builder-F in parallel. Not M1→M3 because eradev.md and meta.md edit disjoint topics.**

**Phase 3 — Role & BL & Glossary (PARALLEL):**
7. Builder-G: M5–M8 (builder, validator role files RU+EN) — 4 files
8. Builder-H: M9–M14 (analyst, visionary, coherent role files RU+EN) — 6 files
9. Builder-I: M15, M16, M17, M18 (BL + glossary + LOADING_PROTOCOL) — 4 files

**Three builders in parallel. File Ownership: no overlap.**

**Phase 4 — Bootstrap + Projects (PARALLEL):**
10. Builder-J: M19–M22 (templates, CLAUDE.md root)
11. Builder-K: M23–M26 (project configs)

**Phase 5 — Skill Bundle Mirror (SEQUENTIAL tail):**
12. Builder-L: M27–M32 — runs last because it's a snapshot of all prior phases. Uses `cp` to mirror files, no manual edits. This could be a deterministic script (`scripts/sync_skill.sh`).

### Critical path length

Phase 0 → 1 → 2 → 3 → 4 → 5 = **6 sequential stages**, each containing parallelism. Estimated duration: 4–6 hours of agent work if run in parallel within phases. Without parallelization: 12–18 hours.

---

## 6. File Ownership Protocol (BL-24, Section X)

Per Invariant 11 and eradev.md Section X: when 2+ Builders work in parallel, Analyst assigns files. Above table is the canonical ownership map. No file is owned by two builders. Shared constant: `N7 DOMAIN_TEMPLATE_EN.md` is read-only for A/B/C; writable only by D. After Phase 1, all domain files become read-only for subsequent phases.

---

## 7. Resource Conflicts

### Git operations (no conflict, but discipline needed)
- All builders should commit on separate feature branches or as ordered sequential commits within `feat/universalize` branch.
- BL-24: one commit = one phase; this task = >5 files from different modules → **RT-2 required** (automatic per BL-24 and Invariant 7).

### File-path conflicts
- No file is edited by two builders in the same phase (File Ownership enforced).
- The only potential collision is between Phase 5 mirror and late edits to any core file; mitigation = freeze core edits when Phase 5 starts.

### Terminology conflicts (the real risk — BL-29)
- Three parallel Builders (A, B, C) in Phase 1 must use the **same abstract vocabulary** for domain description. Without coordination, A might call it "Verify Before Act", B might call it "Pre-Generation Check", C might call it "Reality Check".
- **Mitigation:** N7 DOMAIN_TEMPLATE_EN.md defines the canonical section headers AND required terms. All domain files inherit them by copy. Coherencer checks terminology at end of Phase 1.

### Loading protocol backward compatibility
- The new `domains/{domain}_EN.md` loading step adds a 5th mandatory read for every role agent. Context budget impact: +100–300 lines per agent. With Claude Opus 4.6 (1M tokens) this is negligible per LOADING_PROTOCOL.md line 49.
- **Old role agents (without domain loading step) will still work** — the role files remain self-contained for universal content. The domain file adds domain-specific rules, not replaces anything.
- **Risk:** an agent that ignores the domain file will default to universal rules. This is a soft-fail, not a hard-fail. Hook enforcement can check for the presence of the domain load directive in the agent prompt (future work).

### Enforcement hook conflicts (low risk)
- `.claude/settings.json` currently enforces Bash classification and other gates. Universalization does not change Bash semantics, so hooks are unaffected.

---

## 8. Pipeline (Source → Verify, Universal Form)

Per analyst_EN.md Key Rule 1 "Full pipeline in the plan":

```
1. SOURCE (read current state):
   - Read current eradev.md, meta.md, all role files, BOOTSTRAP_LESSONS.md
   - Read projects/odtoe-articles/config.md (extract domain content)
   - Confirm .claude/skills/eradev/ mirror is current

2. DECOMPOSE (this report):
   - File-level plan (done)
   - Dependency graph (done)
   - File ownership (done)

3. PRODUCE (Builder phase):
   - Phase 0–5 as laid out above

4. BUILD / RENDER (verify each modified .md):
   - Markdown syntax check (no broken tables, no orphan headers)
   - Cross-reference check: every `[BL-N]`, `[SectionN]`, `projects/{name}/` link resolves
   - Bilingual parity: every EN change has a corresponding RU change (BL-19)

5. ADVERSARIAL TEST (BL-20):
   - Spin up a Check Agent with the new CLAUDE.md root + domain loader
   - Give it a concrete article task from odtoe domain
   - Verify it self-loads domains/research-article_EN.md and behaves correctly
   - Give it a concrete code task from plugy domain
   - Verify it self-loads domains/software_EN.md and behaves correctly
   - Give it a mixed task; verify Language Stack routing still works

6. SYNCHRONIZE (Coherencer):
   - terminology audit across all new + modified files
   - glossary index updated
   - LOADING_PROTOCOL updated and tested

7. VERIFY (Validator):
   - Re-run all existing projects (plugy, academic-lab, odtoe-articles, eradev) mentally —
     does any existing lesson break? Does any role invariant get weaker?
   - Specifically: does the odtoe-articles Check-First pipeline still fire from the new
     domain binding layer?

8. DELIVER:
   - One commit per phase (Phase 0, 1, 2, ..., 5) per BL-24
   - Bilingual commits per BL-19 (EN+RU in same commit)
   - Skill bundle sync as final commit
```

---

## 9. System Dependencies (Beyond Markdown)

- **No new tools required.** All changes are text edits to `.md` files.
- **Existing tooling needed:** grep (delegated to Check Agent per Invariant 10), `cp` (operational), `diff --stat` (Builder pre-commit), markdown-link-check (optional for Validator).
- **Git:** same workflow as current; no new branches or hooks needed.

---

## 10. Inertia Assessment I(C)

Per eradev.md Section X and meta.md Section 9: `I(C) = files × coupling × legacy_factor`.

- **files ≈ 50** (18 new + 32 modified)
- **coupling ≈ 3** (medium — bilingual twins always paired, role files share A_F…A_Λ structure, BL interlink, skill bundle mirror)
- **legacy_factor ≈ 2** (EraDev has 32 BLs, existing projects depending on current wording — high Lambda to preserve)

**I(C) ≈ 50 × 3 × 2 = 300.**

Classification ladder from meta.md Section 9:

| Size | I(C) |
|------|------|
| S | < 5 |
| M | 5–20 |
| L | 20–50 |
| XL | > 50 |

**I(C) = 300 → XL.** This task demands: 10+ agents across multiple teams (12 builders proposed here), 3+ RT cycles + L2 coherence, possibly L3 if framework drift detected. This confirms RT-2 mandatory (BL-24) and reclassification from M to XL (BL-18) if the task was pitched as smaller.

**Reclassification announcement (per meta.md Section 14 Mid-Session Reclassification):**

```
=== RECLASSIFICATION ===
Previous: M (implicit in task wording "universalize EraDev")
New: XL (I(C) = 300, files = 50, teams = 12 builders across 5 phases)
Trigger: Analyst decomposition revealed 50-file scope and 6 sequential phases
Action: Invoke L2 Coherencer, mandatory RT-2 gate between Phase 1 and Phase 2,
        optional RT-3 per-phase gate.
```

---

## 11. Risk Register (for Visionary to price)

| ID | Risk | Probability | Impact | Mitigation |
|----|------|-------------|--------|------------|
| R1 | Terminology drift across parallel domain writers | HIGH | HIGH | N7 template with required canonical terms; Coherencer end-of-Phase-1 audit |
| R2 | odtoe-articles project breaks after M23 edit | MEDIUM | CRITICAL | Adversarial test (Phase 5, step 5) before commit; keep backup of config.md |
| R3 | New `domains/` layer read as optional and ignored (Lambda=0 recurrence) | HIGH | HIGH | Hook enforcement: check agent prompt contains "Read domains/{domain}" |
| R4 | Bilingual sync drift during 50-file edit | MEDIUM | MEDIUM | BL-19 enforcement; single commit per EN+RU pair |
| R5 | Over-abstracting core leaves it vague; role files lose "bite" | MEDIUM | HIGH | Kill-Switch: if Jidoka Self-Check B drops <0.5 post-universalization, revert and keep domain logic inline as fallback |
| R6 | Loading budget creep from +1 file per agent | LOW | LOW | 1M context supports it; LOADING_PROTOCOL already allows this |
| R7 | Skill bundle drift (.claude/skills) desyncs from project root | MEDIUM | LOW | Deterministic mirror script in Phase 5; grep check in Validator |
| R8 | "AGI research" mentioned in task — could be false signal of scope | HIGH | LOW | Out of scope: knowledge-work domain is skeletal; full AGI domain is future work, separate RT cycle |

---

## 12. API Design — How Scientific-Book Agents Differ from Code Agents

The task prompt explicitly asks: "how do scientific-book agents differ from code agents?"

| Axis | Code agents (software domain) | Article agents (research-article domain) | Universal core |
|------|-------------------------------|-------------------------------------------|----------------|
| **Produce** | Write source code that compiles | Write manuscript that typesets cleanly | Produce verified artifact |
| **Verify** | Build passes, tests pass, lint clean | 7 Checks pass (formulas recomputed, bibliography resolves, plagiarism <10%) | Verify against acceptance criteria |
| **Blast Radius** | LOW=UI, MED=API, HIGH=deploy, CRIT=DNS/TLS | LOW=typo, MED=section restructure, HIGH=formula correction (affects chain), CRIT=axiom change (affects corpus) | Abstract 4-rung ladder with domain-parametric examples |
| **Fix chain trigger** | 3+ consecutive code fixes | 3+ consecutive formula/text revisions | 3+ consecutive revisions of same artifact |
| **PRE-FLIGHT gate** | curl-verify API endpoints | DOI-verify bibliography entries, corpus cross-reference check | Verify external sources before work begins |
| **BUILD-VERIFY gate** | go build / cargo build / pnpm build | tectonic compile + pandoc render + 50-digit formula recompute | Produce + verify before commit |
| **Andon trigger** | Contradiction with existing code | Contradiction with existing ODTOE corpus / glossary | Any contradiction with existing Ψ |
| **Security checklist** | TLS, auth, input sanitization, port scan | Plagiarism check, AI-marker scan, source tampering | Domain-parametric |
| **Level 3 self-check** | compile + test + lint | compile + formula recompute + bib resolve | Universal: "run the domain's verification tools" |
| **Fix-to-spec trigger** | 3+ fixes on same component | 3+ revisions on same section | Universal: stop and re-spec |

**Key insight:** Every code-specific rule has a clean structural analog in the article domain. The _operator_ (Verify Before Act, Fix Chain = Spec Gap, Verify Established Terminology) is universal; the _domain_ determines what counts as verification, fix, terminology. This is the ODTOE observer-operator decomposition: the operator is universal (M̂_meta), the domain is concrete (M̂_struct).

**Knowledge-work domain (future)** — proposed sketch:
- Produce = draft document (memo, report, summary)
- Verify = fact-check all claims (each assertion has a source, a reasoning trace, or a marker [OPEN])
- Blast Radius: LOW=internal memo, MED=team document, HIGH=stakeholder report, CRIT=legal/compliance filing
- Level 3 self-check: re-read draft, verify no hallucinated facts, verify tone matches audience

This extends naturally to business analysis, legal drafting, executive summaries, etc.

---

## 13. Relationship to Prior Research (Lambda lookup)

Per Activation Step A_Λ, I consulted accumulated lessons and prior reports:

1. **multi_agent_frameworks_comparison_2026-04-11.md:** MetaGPT independently converged on 5 software roles mirroring EraDev. This proves the 5-role topology is not domain-specific — it's a stable attractor for collaborative intelligence. **Universalization is consistent with this finding**: we preserve the 5 roles, only the domain-specific language of their outputs changes.

2. **rtk_analysis_2026-04-11.md:** NEW-4 (Compound Command Lexer) showed that operator-classification can work at multiple granularities. The domain binding layer is similar: we classify _work_ at the domain level, not just the tool level.

3. **ODTOE_AI_AGI_EXPANSION_2026.md section III.1:** The two-level operator M̂ = M̂_struct ∘ M̂_meta is literally what universalization is implementing in the file layer. Role file = M̂_meta (strategy). Domain file = M̂_struct (concrete). Project config = Ψ (state). This is a direct application of ODTOE cybernetics.

4. **lessons.md lesson 6 (Section 0.5 removal):** "Enforcement mechanisms belong in the META protocol, not in the universal core." The same principle: **domain-specific mechanisms belong in the domain layer, not in the universal core.** This is the lesson extended one level.

5. **lessons.md EMP5 (scope determines pipeline strictness):** Different domains have different Blast Radius ladders, different enforcement gates. Embedding a single code-specific ladder in the core violates EMP5. Domain layer resolves this.

6. **BL-19 (bilingual sync):** All new and modified files must have their RU/EN counterpart updated in the same commit. This is non-negotiable.

7. **BL-31 (constrain output types to constrain behavior):** By separating domain from core, we constrain what a role agent can say: if the domain file doesn't list "write code", then the software domain binding constrains it to "write code" and the article domain binding constrains it to "write LaTeX". Structural constraint > behavioral reminder.

8. **Lesson 3 (EN +48% B for practical tasks):** This entire decomposition is an EN task — it's a concrete artifact transformation with files, paths, and commits. The EN stack is correct here. A parallel RU analyst could produce the theoretical framing (the ODTOE derivation of why the domain binding layer is mathematically necessary) — that would complement this report.

---

## 14. What This Report Does NOT Cover (Spiral Gap ~2%)

Honest open questions for RT-2 or next cycle:

1. **Domain-file schema enforcement:** Should the N7 template be a strict YAML frontmatter contract (à la ECC SKILL.md)? Currently proposed as markdown sections. Schema + validator could catch drift structurally.
2. **Automatic domain detection:** Currently projects declare their domain in `config.md`. Could META auto-detect from the first task signal? Probably yes for obvious cases, no for mixed projects.
3. **Migration path for existing BL entries that mention "fix/commit":** The report proposes rewording, but alternative is dual-form (software-BL + universal-BL twins). Need Visionary input on which is cleaner.
4. **Full AGI-research domain:** Explicitly marked future work. The ODTOE expansion suggests 3 new components (M̂_struct ∘ M̂_meta, Lyapunov guardian, phase-transition condition) — if implemented, they likely need their own domain file, not just a knowledge-work extension.
5. **Skill bundle split:** Should each domain have its own skill bundle (`eradev-software`, `eradev-article`)? Or one bundle with runtime switching? I lean toward runtime switching for now to avoid fragmentation.
6. **How Invariant 10 (Bash classification) changes per domain:** Article domain has its own diagnostic commands (tectonic, pandoc, tex2md.py). Should the hook be domain-aware? Out of scope for this cycle.

---

## 15. Output Format — Implementation Plan Summary

```
## Implementation Plan: Universalize EraDev
Task inertia: XL (I(C) ≈ 300)
Files: 50 total
  NEW: 18 (9 EN + 9 RU)
    - domains/software{,_EN}.md  (N1, N2)
    - domains/research-article{,_EN}.md  (N3, N4)
    - domains/knowledge-work{,_EN}.md  (N5, N6)
    - domains/DOMAIN_TEMPLATE{,_EN}.md  (N7, N8)
    - domains/README.md  (N9)
  MODIFIED: 32
    - core: eradev.md, eradev_RU.md, meta.md, meta_RU.md (M1–M4)
    - roles: 10 files across 5 roles × 2 langs (M5–M14)
    - references: BL, glossary, LOADING_PROTOCOL (M15–M18)
    - bootstrap: templates + root CLAUDE.md (M19–M22)
    - projects: 4 config.md files (M23–M26)
    - skill bundle: mirror (M27–M32)

Dependencies:
  Phase 0 (template): N7, N8, N9 first — sequential
  Phase 1 (domains):  N1+N2, N3+N4, N5+N6 — parallel (3 builders)
  Phase 2 (core):     M1+M2, M3+M4 — parallel (2 builders)
  Phase 3 (roles/BL): role files 4, role files 6, BL+glossary — parallel (3 builders)
  Phase 4 (bootstrap+projects): templates, project configs — parallel (2 builders)
  Phase 5 (skill sync): deterministic mirror — sequential tail

File Ownership: see section 4. No overlaps. Phase gates enforce ordering.

Pipeline: source(read) → decompose(this report) → produce(Phase 0–5)
        → build/render(md lint) → adversarial test → synchronize(Coherencer)
        → verify(Validator) → deliver(6 commits)

Resource conflicts:
  - Terminology drift (HIGH) → N7 template + Coherencer audit
  - odtoe-articles regression (HIGH) → adversarial test before M23 commit
  - Silent domain layer ignorance (HIGH) → hook enforcement in future BL
  - Bilingual drift (MED) → per-commit EN+RU pairing
  - Skill bundle desync (MED) → deterministic mirror script

System dependencies: markdown editing only. No new tools. grep delegated
  to Check Agent. cp operational. git operational.

Reclassification: M → XL (I(C)=300). RT-2 mandatory. L2 Coherencer.

Scientific-book vs code agents: SAME 5 roles, SAME Activation Operator,
  DIFFERENT domain binding layer. Operator is universal (M̂_meta);
  domain is concrete (M̂_struct). Universal form of every code-specific
  rule has a clean structural analog in the article domain.
```

---

## 16. B-check (Jidoka Self-Check, Analyst)

```
=== JIDOKA SELF-CHECK — Analyst, RT-1 ===
B-diagnostics:
  F (Focus):       0.90  — Read all mandatory files + core + all role files +
                          all 4 project configs + prior reports + odtoe refs +
                          ODTOE_AGI_EXPANSION. Missed: did not read
                          `.claude/settings.json` hook details; partial glossary
                          (first 100 lines); did not exhaustively trace every
                          grep hit. Deduction: -0.10.
  E (Alignment):   0.90  — Task intent = "decompose universalization into
                          concrete files/changes". Report delivers file list,
                          dependencies, ownership, parallelization,
                          inertia, conflicts, pipeline, risk register,
                          and domain API comparison. Covered all 6
                          Analyst deliverables enumerated in prompt.
                          Deduction: -0.10 for uncertainty on whether
                          "M̂_struct ∘ M̂_meta" framing is what operator wanted
                          or too theoretical for EN stack.
  (1-σ):           0.85  — No resource conflicts missed that I'm aware of.
                          Bilingual twins accounted for. File Ownership has
                          no overlaps. Skill bundle mirror resolves .claude
                          drift. Potential residual σ: I did NOT run grep
                          across all role files for every code token — sampled.
                          Deduction: -0.15.
  Λ (Experience):  0.85  — Consulted eradev lessons.md (EMP5, lesson 6, lesson 3),
                          BOOTSTRAP_LESSONS (BL-16/19/24/26/29/31), prior
                          reports (multi_agent, rtk), ODTOE_AI_AGI_EXPANSION.
                          Applied the Ψ* = Φ(Ψ*) principle directly
                          (universalization is a second self-application).
                          Deduction: -0.15 because I did not read
                          ALL lessons files (academic-lab has 27 lessons,
                          plugy has 27, odtoe-articles has ~20 — sampled
                          each for patterns but did not cross-reference each
                          against the universalization proposal).

  B = 0.90 × 0.90 × 0.85 × 0.85 = 0.585
```

**B = 0.585 ≥ 0.5** → No Andon. All 4 components ≥ 0.3 → no weak-link collapse. Report stands for RT-1 synthesis.

**Banality:** 3/10 — this decomposition is not template; the domain-binding layer + M̂_struct ∘ M̂_meta framing is novel to EraDev, directly derived from Activation Step A_Λ on lessons.md EMP5 + lesson 6. Not boilerplate.

**Spiral gap ~2%:** 6 open questions listed in Section 14. These fuel the next cycle.

---

## Sources (external research used)

- [Best Multi-Agent Frameworks in 2026: LangGraph, CrewAI, AutoGen](https://gurusup.com/blog/best-multi-agent-frameworks-2026)
- [AgentOrchestra: A Hierarchical Multi-Agent Framework for General-Purpose Task Solving (arXiv)](https://arxiv.org/html/2506.12508v1)
- [ThinkTank: A Framework for Generalizing Domain-Specific AI Agent Systems into Universal Collaborative Intelligence Platforms (arXiv)](https://arxiv.org/html/2506.02931v1)
- [PaperOrchestra: Multi-Agent Framework for Automated Research Paper Writing (arXiv)](https://arxiv.org/abs/2604.05018)
- [AI Agent Orchestration Patterns (Microsoft Learn)](https://learn.microsoft.com/en-us/azure/architecture/ai-ml/guide/ai-agent-design-patterns)
- [Multi-Agent Collaboration Mechanisms: A Survey of LLMs (arXiv)](https://arxiv.org/html/2501.06322v1)
- [LangGraph: Agent Orchestration Framework](https://www.langchain.com/langgraph)
- [The Orchestration of Multi-Agent Systems (arXiv)](https://arxiv.org/html/2601.13671v1)

Local references:
- `/Users/antonpankratov/Downloads/eradev/eradev.md`
- `/Users/antonpankratov/Downloads/eradev/meta.md`
- `/Users/antonpankratov/Downloads/eradev/BOOTSTRAP_LESSONS.md`
- `/Users/antonpankratov/Downloads/eradev/roles/{visionary,analyst,builder,validator,coherent}_EN.md`
- `/Users/antonpankratov/Downloads/eradev/projects/{eradev,plugy,academic-lab,odtoe-articles}/{config,lessons}.md`
- `/Users/antonpankratov/Downloads/eradev/reports/multi_agent_frameworks_comparison_2026-04-11.md`
- `/Users/antonpankratov/Downloads/eradev/reports/rtk_analysis_2026-04-11.md`
- `/Users/antonpankratov/Downloads/odtoe/ODTOE_AI_AGI_EXPANSION_2026.md`
- `/Users/antonpankratov/Downloads/odtoe/{CLAUDE,AGENTS}.md`

---

*EraDev v8 | RT-1 [ANALYST] EN | Universalization decomposition | 2026-04-11*
