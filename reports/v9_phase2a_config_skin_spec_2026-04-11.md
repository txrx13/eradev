# EraDev v9 Phase 2.A — Config Domain Skin Specification

> Date: 2026-04-11
> Role: [ANALYST]
> Task: Phase 2.A — specify `templates/domain_skin.config.md` (L2 domain skin for configuration artifacts: YAML/TOML/JSON configs, dotfiles, environment specs, schema definitions, infrastructure-as-code, manifests)
> Output type: Report (META type 5) — Analyst spec for Builder hand-off
> Language stack: EN (practical task — artifact design)
> Zone: Pull with Resonance flavor (specific target + cross-domain bridge code→config)
> Parallel siblings: Phase 2.A `book`, `plan`, `research` skin specs (all spawned before or together)

---

## Activation Operator Results

- **A_F (Focus)**: Read `roles/analyst_EN.md` (78 lines); `templates/domain_skin.md.template` (10-section skeleton); `templates/domain_skin.code.md` (172-line text-modality identity skin, sibling reference); full first 300 lines + tail of `templates/domain_skin.article.md` (research-modality override skin, style reference); first 640 lines of `reports/v9_phase2a_plan_skin_spec_2026-04-11.md` (parallel text-modality sibling — cross-consistency target); `eradev.md` Section II.1 (B_text uniform weights + v10 extension hook comment naming `B_config` as a candidate with σ-dominant weights, line 144); `eradev.md` Section II.2 (v9 OOD AND-gate, IN-scope list explicitly includes "configs" at line 168); `BOOTSTRAP_LESSONS_universal.md` (all 22 universal BL); `BOOTSTRAP_LESSONS_code_adapter.md` (all 8 code-adapter BL with split-file loading rules); `projects/odtoe-articles/config.md` (live article config — domain.skin pattern + yaml fence); `projects/eradev/config.md` (self-project config — `verify.command` for markdown + shellcheck); `projects/plugy/config.md` + `projects/academic-lab/config.md` (live code configs — yaml-fenced blocks, `verify.command` patterns, Notes sections). True North: produce a spec rigorous enough that a Builder writes `templates/domain_skin.config.md` in one shot, matching the Phase 2.1 article spec + Phase 2.A plan spec structural precedent, aligned with the text-modality sibling (plan), and loadable via the existing `domain.skin` routing already proven by all 4 live configs.
- **A_E (Alignment)**: The spec must be a BRIDGE, not a replacement. The role files were originally code-oriented, and configs are a CLOSE cousin of code (both share text modality, both share most abstract vocabulary). The skin's job is a LIGHT vocabulary rewrite + heavy verification-protocol work. Unlike articles (wholesale vocabulary rewrite) and unlike code (pure identity skin), configs sit in the middle: most terms transfer directly, but verification is NOT "compile + test" — it is "parse + schema validate + secrets scan + cross-config consistency." The skin's load-bearing contribution is `verify.method: parse` expanded into 7 concrete sub-checks (P1–P7) that cover the config-specific failure classes (syntax error, schema violation, inline secret, dangling env var, precedence ambiguity, cross-config drift, schema version mismatch). This is a genuinely new verification modality — `parse` is NOT a subset of `build` and NOT a subset of `dry_run`. Configs need their own verifier. Intent: the config skin becomes THE template for `parse` as a verification method, usable by any future v9 artifact class where "machine-parseable schema-bound text" is the load-bearing property (dotfiles, manifests, IaC, API schemas, data contracts).
- **A_σ (Consistency)**: No conflict with L0 (ODTOE core untouched). No conflict with Phase 0.A schema — `domain.type: config` and `B_modality: text` are already enumerated in `eradev.md` Section II.1 line 117, and `configs` is named explicitly in the IN-scope list at line 168. No conflict with the plan skin spec (the parallel text-modality sibling) — both use uniform 0.25×4 weights, both inherit only the 22 universal BL, both add a `BL-C*` / `BL-P*` namespace for domain-specific BL; the two specs share the text-modality spine but diverge on verification (plan = `dry_run` mental walkthrough; config = `parse` machine validation + schema + secrets). No conflict with `templates/domain_skin.code.md` — the code skin is the identity baseline; the config skin performs a LIGHTER rewrite than the plan skin but a HEAVIER verification expansion. One TENSION flagged: `eradev.md` line 144 explicitly mentions "`B_config` with σ-dominant weights for infrastructure-as-code" as a v10+ future hook. This spec RESPECTS that by pinning `B_modality: text` (uniform 0.25×4) for v9 AND documenting the `B_config` override as a v10 FUTURE HOOK, NOT a v9 obligation. Configs in v9 use `B_text`, full stop — projects MAY override per-project via `## B-weight Override` section if they find σ-dominance useful (precedent: `projects/plugy/config.md` for gRPC contract work). One more cross-skin consistency check: the plan skin uses DR1–DR6 for dry_run; the config skin uses P1–P7 for parse-expanded. Different letter prefixes (DR vs P) to avoid collision; different sub-check counts because the failure taxonomies genuinely differ. NO overlap with plan skin's vocabulary (plan has STEP/DEPENDENCY/STAKEHOLDER/CONTINGENCY/PASS-CRITERION; config has KEY/SCHEMA/ENV-VAR/SECRET/PRECEDENCE/DANGLING-REF — zero overlap on load-bearing terms). One hypothetical tension that I want to make explicit and close: "aren't configs just code?" — NO. Configs are declarative (data-at-rest) while code is procedural (instructions); configs are schema-validated while code is type-checked; configs are layered (defaults → env → local → user) while code is linked. The differences are structural enough to justify a separate skin with distinct verification.
- **A_Λ (Experience)**: Consulted BL-17 (Check-First = prevention — configs need a pre-write gate: read schema, read target tool version, read precedence rules BEFORE drafting keys); BL-21 (format specifications are inputs — for configs this is literal: read the schema first, THEN write; a config written without reading the tool's schema is the #1 failure mode and costs 10x more to fix after); BL-29 (terminology before generating — configs MUST use established key naming conventions of the tool: `port` not `port_number`, `host` not `hostname`, `timeout` not `timeout_seconds`; drift here breaks tooling invisibly); BL-30 (defense-in-depth — config verification has natural layers: parse (syntax) + schema (shape) + secrets scan (safety) + cross-config (system-level) — the skin should encode all four); BL-28 (agent prompts must name file paths — especially critical for configs because tool schemas live outside the repo and must be explicitly referenced). From the live configs read: `projects/odtoe-articles/config.md` line 9 uses `yaml` fence; `projects/eradev/config.md` line 8 uses `yaml` fence; `projects/plugy/config.md` line 17 uses `yaml` fence; `projects/academic-lab/config.md` line 5 uses `yaml` fence. 4/4 live configs use YAML fenced inside Markdown — this is THE canonical config pattern in this repo, and a real-world signal that configs span format-in-format nesting (YAML in .md). Examples for the skin should cover both "pure YAML file" and "YAML-fenced-in-Markdown" as the two common cases. Also from live configs: every live config has a `## Notes` section explaining the rationale for field choices — this is a structural pattern the config skin should recommend (every config benefits from an adjacent explanation of WHY the keys are set this way). Phase 2.1 and Phase 2.A plan specs established the 22 universal BL inheritance + individual treatment of 8 code-adapter BL + separate BL-x namespace — this spec follows the same pattern. From the plan spec's treatment I learned: it's legitimate to LIFT one code-adapter BL into a domain-specific check (plan lifted BL-25 into DR4 contingency); the config skin may do similar if a code-adapter BL genuinely fits better as a sub-check than as a standalone BL.

---

## Inverted IFR (past tense, measurable)

> "The `templates/domain_skin.config.md` file was written by a single Builder in ~60 minutes using this spec. The file has a header block that pins `Type: config`, `Modality: text`, `verify.method: parse`, a vocabulary table with ~22 mappings grounded in config-authoring practice (YAML/TOML/JSON/ENV/Markdown-fenced), per-role focus overrides for all 5 roles that reference their upstream role files rather than replacing them, a `parse` verification protocol expanded to 7 concrete sub-checks (P1–P7) split into mechanical (parse/schema/secret-regex/dangling-ref) and interpretive (precedence sanity, cross-config consistency, schema version alignment), 3 examples that each include the role catching the issue + phase + fix (matching Phase 2.1/2.A precedent), a BL inheritance table preserving all 22 universal BL unchanged and providing config-equivalents for 4 of 8 code-adapter BL (marking 1 as N/A, lifting 1 into P5 sub-check, transferring 2 unchanged), and 4 config-specific BL-C1..C4. The skin includes an RT protocol with a 2-tier split (RT-lite for <50-line configs and production-critical full 5-role RT for infra/IaC), pre-write and post-write checklists derived from the 7 parse checks + BL-C gates, and a Known OOD list covering runtime-mutable state and continuous config tuning. When a project's `config.md` declares `domain.type: config` with `domain.skin: templates/domain_skin.config.md`, META routes all 5 roles through the skin overrides. Backward compat: existing projects without a config skin reference are untouched. How did we get there? This Analyst spec was concrete enough that every Builder decision was pre-made. No design calls surfaced during write."

## Acceptance Criteria

- **[AC-1]** Spec contains all 10 required sections (Domain ID + Vocabulary + Per-role focus + Verification + RT protocol + Examples + BL inheritance + Acceptance + Hand-off + Open Questions) with no placeholder text.
- **[AC-2]** Vocabulary mapping has ~22 term pairs grounded in config-authoring practice (drawn from role files + the 4 live configs in this repo as evidence).
- **[AC-3]** Per-role focus overrides cover all 5 roles with: FIRST focus anchor, "artifact" definition, primary failure mode, Jidoka self-check specialization (3–5 questions each).
- **[AC-4]** Verification protocol enumerates 7 concrete `parse` sub-checks (P1–P7) with per-check: what it catches, who runs it, mechanism, L1/L2 classification.
- **[AC-5]** 3 examples each name the catching role, phase, and fix (matching Phase 2.1 / 2.A precedent; these are the exact examples prescribed in the task prompt: P1/P2 YAML indent, P3 secret in .env.example, P6 cross-config port mismatch).
- **[AC-6]** BL inheritance: all 22 universal BL listed with config-specific applicability note; all 8 code-adapter BL handled individually (each either N/A, config-equivalent in BL-C namespace, transferred unchanged, or lifted into a P sub-check); new config-specific BL added in BL-C1..BL-C4 namespace (separate budget).
- **[AC-7]** Spec is backward-compatible: existing projects without `domain.type: config` are untouched; Universal CLAUDE.md routing works because `domain.skin` field already exists in Phase 0.A schema.
- **[AC-8]** `B_modality: text` is PINNED (uniform 0.25×4 weights); `B_config` override is explicitly DEFERRED to v10 with a one-line future-hook note citing `eradev.md` line 144.
- **[AC-9]** Hand-off section names the exact file path, expected size (350–550 lines per task prompt), template sections to copy from `templates/domain_skin.md.template`, and flags which spec items are FLEXIBLE vs FIXED for Builder discretion.
- **[AC-10]** Open Questions section logs 3–5 deferred decisions (BL-15 compliance).
- **[AC-11]** No contradiction with the plan skin spec (parallel text-modality sibling): verification letter prefix DOES NOT collide (plan=DR, config=P); vocabulary does NOT duplicate plan's load-bearing terms; BL-C namespace does NOT collide with BL-P namespace; both specs recognize the text-modality spine (uniform 0.25×4, universal-BL-only inheritance).
- **[AC-12]** RT-lite clause is explicit: small configs (<50 lines) run Visionary+Builder+Validator (3-role) instead of full 5-role RT-1; production/infra configs (IaC, secrets files, deploy manifests) run full 5-role RT-1 always regardless of size.

## Failure Pre-mortem

- **[FM-1]** Spec is too abstract → Builder invents vocabulary mid-write → Mitigation: every vocabulary row is grounded in a role file line OR a live config file line, with source cited in the "Where used" column.
- **[FM-2]** Spec duplicates the plan skin verbatim (BL-32 violation — same content under different label) → Mitigation: Section 2 vocabulary emphasizes KEY/SCHEMA/ENV-VAR/SECRET/DANGLING-REF rather than STEP/DEPENDENCY/CRITERION; Section 4 verification is `parse` not `dry_run`; the Jidoka questions in Section 3 are config-specific (schema compliance, secret inline, cross-config drift), not plan-specific (measurable criteria, supersession, contingency).
- **[FM-3]** Builder pins the wrong modality — thinks "configs are production code so they should boost (1-σ)" and uses `B_research` or a custom profile → Mitigation: Section 1.1 explicitly pins `text` with 3 reasons, contrasts with `B_config` v10 hook, and cites `eradev.md` line 144 verbatim.
- **[FM-4]** `parse` verification is under-specified and collapses to "does the parser exit 0?" (vibes-based verification, BL-17 violation) → Mitigation: Section 4 expands `parse` into 7 concrete sub-checks P1–P7 with per-check failure modes. Each sub-check has a mechanism (mechanical / interpretive). Parse is MECHANICAL for P1–P4 + P7, INTERPRETIVE for P5–P6.
- **[FM-5]** BL-C budget creep — "configs touch every layer, so 10 BL-Cs are justified" → Mitigation: stick to 4 BL-C entries max, matching Phase 2.1 and Phase 2.A plan spec precedent. If a config-specific rule is a universal rule in disguise, escalate for promotion to the 22 universal BL via a future Phase 2 follow-up, do not bloat BL-C.
- **[FM-6]** Secrets scan (P3) becomes a false-positive machine — any string that looks like base64 gets flagged — blocking Builder → Mitigation: P3 uses a CURATED regex list (password / secret / api_key / token / private_key / BEGIN / AKIA / ghp_ / sk- patterns) rather than generic high-entropy; false positives explicitly listed as acceptable in the spec; the canonical case is "inline API key in .env.example" (Example 2), not "every 32-char string."
- **[FM-7]** Cross-config consistency (P6) is unbounded — "every config can depend on every other config, so checking is O(n²) and impossible" → Mitigation: P6 is LOCAL ONLY — checked at the SAME project level, for the SAME service, when 2+ configs describe the same resource (port, version, endpoint). P6 is NOT "check every config in the filesystem." The canonical case is Example 3 (package.json port ↔ Dockerfile EXPOSE ↔ docker-compose ports).
- **[FM-8]** RT-lite clause is abused — every config is declared "small, <50 lines" to skip full RT-1 → Mitigation: RT-lite is ONLY for pure-data configs with no precedence/layering/secrets; any config touching secrets, infra, or production MUST use full 5-role RT regardless of size. Section 5 makes this explicit and provides a decision tree.

---

# SECTION 1 — Domain Identification

| Field | Value | Justification |
|---|---|---|
| `domain.type` | `config` | Matches Phase 0.A schema enum; named in `eradev.md` line 168 v9 IN-SCOPE list ("configs"). |
| `domain.B_modality` | **`text`** | Uniform 0.25×4 weights — see Section 1.1 rationale. `B_config` is a DEFERRED v10 hook per `eradev.md` line 144. |
| `domain.ood_scope` | `text-discrete` | A config artifact has measurable boundaries (file exists, key count, byte count, schema version) and objective verification (parse exit code, schema validator exit code, secrets regex count). Passes v9 AND-gate per Phase 0.A Deliverable 3. REJECT if `continuous`. |
| `domain.verify.method` | `parse` (primary) + schema validation (secondary) | See Section 4 for what parse concretely entails. A config passes parse iff (a) the parser accepts it without error, (b) the declared schema accepts it without error, (c) no inline secrets, (d) no dangling references, (e) precedence rules are unambiguous, (f) cross-config consistency holds for same-resource references, (g) schema version declaration matches actual keys used. |
| `domain.parent_bl` | `BOOTSTRAP_LESSONS_universal.md` (22 universal BL) | Configs do NOT inherit `BOOTSTRAP_LESSONS_code_adapter.md`. Section 7 handles each code-adapter BL individually. |
| `domain.skin` | `templates/domain_skin.config.md` | This spec's target file path. |

### 1.1 Modality choice: `text`, not `research` or `creative`

**Rationale:** Per `eradev.md` Section II.1 lines 115–119 the modality registry pins three options plus the v8-compatible default:

- **`B_text`** (uniform 0.25×4) — default for text-discrete artifacts where no single coherence component dominates. Code, CONFIGS, and plans fall here.
- **`B_creative`** (w_E=0.30, w_(1-σ)=0.30, w_F=0.20, w_Λ=0.20) — for long-form prose where reader alignment + internal-voice consistency dominate. Books, narrative articles.
- **`B_research`** (w_F=0.30, w_E=0.20, w_(1-σ)=0.35, w_Λ=0.15) — for theorem/proof work where the proof chain dominates. ODTOE-style articles.

**Why `text` for configs:**

1. **No single component dominates config-authoring.** Configs balance all four components roughly equally:
   - **F (Focus):** the author must have read the tool's schema + target version + existing project configs — missing any of these = hallucinating keys. No prior-state read = drift.
   - **E (Alignment):** every key the author writes must match the operator's actual intent (e.g., "set the port to 3000" must become exactly `port: 3000`, not `default_port: 3000` and not `server.port: 3000`). Alignment to intent is a first-class gate.
   - **(1-σ) (Consistency):** no two keys may conflict (same parameter at two precedence layers with contradicting values = immediate failure); cross-config references must agree (package.json port ↔ Dockerfile EXPOSE).
   - **Λ (Experience):** established naming conventions (BL-29) — configs use the tool's canonical vocabulary, not invented aliases; MEMORY.md of past configs informs key choices.
2. **Configs are not theorem/proof work.** There is no formal proof chain; consistency errors are graduated (a typo in a comment is not fatal; a typo in a key IS fatal). This is a text property, not a proof-chain property. `B_research`'s σ-dominance (0.35) is not warranted.
3. **Configs are not narrative prose.** There is no voice, no reader emotional beat, no thematic arc. `B_creative`'s E+σ dominance is misaligned.
4. **The uniform profile is the backward-compatibility invariant.** Every live config in this repo currently computes B under uniform weights (no live project uses a custom B profile for configs). v9 must not break them.

**Result:** the DEFAULT config skin modality is **text** (uniform 0.25×4). This is PINNED in the skin file, NOT left as a placeholder.

**Variant clause (v10 future hook):** `eradev.md` line 144 names `B_config` as a candidate modality with σ-dominant weights, hypothesizing that infrastructure-as-code especially benefits from high (1-σ) (cross-config consistency dominates). This is a v10+ research direction. v9 does NOT ship a `B_config` modality — configs use `B_text`. If a project explicitly wants σ-weighted configs (e.g., production IaC with strict schema contracts, gRPC multi-language protobuf manifests), they can override per-project via `config.md` `## B-weight Override` section (precedent: `projects/plugy/config.md` for cross-language gRPC contracts). The SKIN does not override; projects override individually if needed.

### 1.2 Header block for the skin file

The Builder must produce a file starting exactly like this (copy from `templates/domain_skin.md.template` lines 1–7, filling placeholders):

```markdown
# Domain Skin: config

> Type: config
> Modality: text (uniform weights 0.25 / 0.25 / 0.25 / 0.25 — v8-compatible default)
> OOD scope: text-discrete
> Parent BL: BOOTSTRAP_LESSONS_universal.md (22 universal BL inherited)
> Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md
> Verify method: `parse` (syntax parse + schema validation + secrets scan + cross-config consistency)
> Last updated: 2026-04-11
> Upstream roles: roles/{role}_EN.md
> Upstream math: eradev.md Section II.1 (B_text weights) + Section II.2 (v9 OOD scope)
> Live reference configs: projects/eradev/config.md, projects/plugy/config.md, projects/academic-lab/config.md, projects/odtoe-articles/config.md

---
```

**FIXED (Builder must not alter):** `Type: config`, `Modality: text (uniform weights 0.25 / 0.25 / 0.25 / 0.25 — v8-compatible default)`, the "does NOT inherit code_adapter" line, the `Verify method: parse` line.
**FLEXIBLE:** wording of the "Live reference configs" line (Builder may cite fewer or substitute if a better canonical reference lands), formatting of the `> ` block.

---

# SECTION 2 — Vocabulary Mapping

This is the fastest bridge from abstract role file to config-domain action. The skin file must include a ~22-row vocabulary table. Every row below is GROUNDED: the "Where used (evidence)" column cites where the abstract term appears in a role file, BL file, or live config. Builder must preserve all rows 1–22; Builder MAY add 1–5 more rows if they find additional config-specific terms (SOPs for IaC, Kubernetes manifests, environment-variable files) but MUST NOT delete or renumber rows 1–22.

Unlike the `article` skin which rewrites vocabulary wholesale (because articles have radically different artifact shapes than code) and unlike the plan skin which performs a MODERATE rewrite, the `config` skin performs a **LIGHT REWRITE with HEAVY verification expansion**. Most abstract terms transfer directly from code-text modality; the differences are concentrated around WHAT a unit is (key-value pair vs function), WHAT verification means (parse+schema vs compile+test), and WHAT defects look like (syntax/schema/secret/dangling vs type error/bug).

| # | Abstract term (role file / BL) | Config meaning | Where used (evidence) |
|---|---|---|---|
| 1 | **artifact** | a single config file (`.yaml`, `.toml`, `.json`, `.ini`, `.env`, `.conf`), OR a stanza/block inside one, OR a key-value pair with its precedence context, OR a YAML-fenced code block inside a Markdown file | `analyst_EN.md` line 7 ("An 'artifact' is any discrete element..."); `projects/eradev/config.md` line 8 (yaml fence inside .md); `projects/plugy/config.md` line 17 (yaml fence inside .md) |
| 2 | **function** | a key-value pair — the smallest addressable unit of a config (`port: 3000`, `debug: true`, `DATABASE_URL=postgres://...`) | Analogous to `builder_EN.md` "smallest addressable unit"; `projects/plugy/config.md` line 19 shows `type: code` as the canonical key-value shape |
| 3 | **module / file** | a config section or stanza — a named block of related keys (e.g., `domain:` in `projects/*/config.md`, `[server]` stanza in TOML, top-level object in JSON) | `projects/odtoe-articles/config.md` lines 9-34 (`domain:` stanza); `projects/eradev/config.md` lines 9-34 (`domain:` stanza) |
| 4 | **API / API endpoint** | schema definition / interface contract — the declared shape a config must match (JSON Schema, OpenAPI spec, protobuf, the tool's documented keys, or an implicit contract the tool expects) | `analyst_EN.md` Responsibilities 3 ("Interface design — design the contracts between components"); code-adapter BL-22 (PRE-FLIGHT external APIs) — the config analog is "verify schema BEFORE writing" |
| 5 | **test / tests pass** | parse + schema validate + secrets scan + dangling-ref scan — all mechanical checks return 0 | `validator_EN.md` Key Rules; Section 4 of this spec |
| 6 | **verify** | run parse check (P1) + schema check (P2) + secrets scan (P3) + dangling-ref scan (P4) — the 4 mechanical sub-checks from Section 4 | `analyst_EN.md` line 24 (verify = domain-substituted check) |
| 7 | **validate** | run all 7 parse sub-checks (P1–P7), including the interpretive ones (precedence sanity + cross-config + schema version alignment) | `validator_EN.md` line 7 (validation = "run the checks") |
| 8 | **build / compile** | parse — the config file is read by the tool's parser without syntax error, OR if YAML-in-Markdown, the fenced block parses cleanly as YAML | Analogous to code-skin "compile = build"; `projects/eradev/config.md` line 15 (`verify.method: build` + `markdown-lint *.md && shellcheck`) — proxy for "markdown parses + shell script parses" |
| 9 | **runtime** | tool load time / startup validation time — the moment the target tool reads the config and may reject it; blast-radius proxy for production impact | `builder_EN.md` Key Rules 4 ("blast radius"); when a tool restarts with a bad config, every downstream user is affected in the same window |
| 10 | **spec / specification** | the SCHEMA — the tool's documented or machine-readable description of what keys are allowed, required, or forbidden (JSON Schema `$schema`, OpenAPI contract, protobuf `.proto`, Kubernetes CRD, systemd unit-file man-page) | `analyst_EN.md` "Implementation Plan" output format; the code-adapter BL-22 "verified endpoints artifact" maps to "verified schema artifact" here |
| 11 | **bug / defect** | syntax error OR schema violation OR dangling reference OR inline secret OR precedence conflict OR cross-config drift — the 6 config-specific failure classes | `validator_EN.md` line 20 ("B-diagnostics of defects"); direct analog of "code doesn't compile" = "config doesn't parse" |
| 12 | **refactor** | restructure config hierarchy — reorganize stanzas, split one file into many, promote inline values to references, without changing the effective configuration | `builder_EN.md` Key Rules 7 (refactor = restructure without semantics change) |
| 13 | **code review** | schema audit + secrets scan — a reviewer confirms keys match the schema, no inline credentials are present, no dangling references remain | Analogous to `visionary_EN.md` Example 2 (peer review); BL-30 defense-in-depth (review is a verification layer) |
| 14 | **PR / pull request** | a proposed config revision submitted for RT review — a delta on a prior config, or a fresh config for a new tool/service | `builder_EN.md` Decision-Point Checklist |
| 15 | **commit** | a signed-off config revision that has passed parse + schema + secrets scan and is ready to be loaded by the tool | `projects/odtoe-articles/config.md` (all 4 live configs are committed Markdown with YAML fences) |
| 16 | **deploy / push to prod** | hot-reload OR service restart OR re-parse-on-next-read — the moment the tool picks up the new config and the new values take effect. For infra-as-code: `terraform apply` / `kubectl apply`. For service configs: SIGHUP / restart. For env files: next process spawn. | Analogous to code-skin "deploy"; `projects/plugy/config.md` lines 34-36 (autodeploy picks up config changes) |
| 17 | **production** | the currently-loaded config that the running tool is using (may differ from the file on disk if the tool has not been reloaded since the last edit) | `validator_EN.md` Key Rules 4 (revert = postmortem); the "loaded state" vs "file state" distinction is config-specific and matters for verification |
| 18 | **feature / feature flag** | a config-level toggle — a boolean or enum key that gates behavior (`enabled: true`, `mode: strict`, `feature_flags.new_ui: on`). Unlike code feature flags (BL-8), config flags ARE the deployment mechanism; BL-8 applies to configs directly, not as an equivalent | `builder_EN.md` Key Rules 6 ("feature flags / staged rollouts = release event"); code-adapter BL-8 |
| 19 | **smoke test** | 2-minute header pass — run the parser, read the first 10 lines, confirm the file has (a) correct format identifier, (b) required top-level keys, (c) schema version declaration. A coarse completeness check before the full parse sweep. | Analogous to `validator_EN.md` Key Rules 5 ("stale output detection") |
| 20 | **glossary / canonical terms** | the tool's key naming conventions — the canonical vocabulary the tool expects (e.g., `host` not `hostname`, `port` not `port_number`, `timeout` not `timeout_ms`). BL-29 applied to configs. | `BOOTSTRAP_LESSONS_universal.md` BL-29 ("verify established terminology before generating") |
| 21 | **rollback / revert** | restore the prior config — either via VCS (git revert), via a versioned config store (Consul KV, etcd, AWS Parameter Store versioning), or via a saved backup. If the tool was reloaded with the bad config, rollback also requires a second reload. | Analogous to code-adapter BL-14; config-specific adaptation at BL-C3 below |
| 22 | **canary / staged rollout** | partial rollout — apply the new config to ONE instance / ONE service / ONE environment first, monitor for failure, then roll to the remaining fleet. For multi-tenant configs: one tenant first. For multi-region: one region first. | Analogous to code-adapter BL-2; config-specific adaptation at BL-C1 below |

**FLEXIBLE:** Builder MAY add rows 23–27 with additional mappings from other config artifacts (Kubernetes manifests, Terraform modules, Ansible playbooks, systemd unit files, shell rc files). Builder MUST NOT delete or renumber rows 1–22.

**Unified with the live reference configs — CRITICAL note for Builder:**
The live reference configs are `projects/eradev/config.md`, `projects/plugy/config.md`, `projects/academic-lab/config.md`, `projects/odtoe-articles/config.md`. All 4 use the YAML-fenced-in-Markdown pattern. Builder should treat this as the canonical shape for EraDev project configs while noting that standalone YAML/TOML/JSON files are also in scope (the skin is GENERAL for configs, not specific to the EraDev self-project shape). If Builder detects a contradiction between this spec's Section 3 (role focus overrides) and the vocabulary table above, the SPEC table WINS and Builder must escalate to META before proceeding. If Builder detects a contradiction between this spec and a live reference config, Builder flags it as an open question in the skin's Open Questions section — not silently resolves it.

---

# SECTION 3 — Per-Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` **unchanged**. The skin adds DOMAIN-SPECIFIC focus anchors, artifact definitions, failure modes, and Jidoka specializations for config-authoring. The Builder must produce a sub-section for each of the 5 roles.

### 3.1 Visionary (config focus)

- **FIRST focus anchor (A_F override):** Read the operator's ORIGINAL request verbatim. Identify WHAT is being configured (which tool / subsystem / environment), WHICH environment the config targets (dev, staging, prod, per-developer local), and WHAT the secrets policy is (inline forbidden → reference vault / env vars / GitHub Secrets). True North = *what tool-plus-environment does this config serve, and what is its secrets policy?* Visionary's output is a single paragraph: tool + environment + schema version + secrets policy.
- **What the role considers "the artifact":** The config's PURPOSE — the tool it serves, the environment it serves, the schema version it targets. NOT the keys themselves (that's Analyst), NOT the file (that's Builder). At RT-0 Visionary speaks at the level of "this config sets up service X for environment Y at schema version Z, secrets are stored in vault path W."
- **Primary failure mode in config work:** Approving a config without naming the SCHEMA VERSION the config targets. A config "for package.json" without naming the npm schema version is a v1-vs-v2 time bomb waiting for the npm version bump. Mitigation: Visionary's output MUST include a schema version declaration (or explicit "no schema — tool uses duck typing" note), otherwise the plan does not proceed to RT-1.
- **Secondary failure mode:** Approving a config for a production environment without verifying the secrets policy (inline vs vault vs env var). Inline secrets in prod = immediate credential-rotation incident. Mitigation: Visionary's Q3 below explicitly asks about secrets placement.
- **Jidoka self-check (config specialization):**
  - Q1: "Is the target tool + target version NAMED (not 'some YAML config', but 'npm schema v7 for package.json')? If no — YELLOW on E, escalate before RT-1."
  - Q2: "Is the target environment explicit (dev / staging / prod / local-override)? An environment-ambiguous config is a precedence time bomb."
  - Q3: "Is the secrets policy declared? (inline = NEVER-for-prod; env var = OK; vault reference = preferred for prod). If 'we'll figure it out later' = RED on 1-σ, block RT-1."
  - Q4: "Is the config's purpose discrete (a specific file or stanza) or continuous (a live-tuned parameter stream, e.g., autoscaler thresholds that change every minute)? Continuous = OOD, route to `continuous` scope and reject."
- **Section reference for Builder:** `visionary_EN.md` establishes "True North" in code terms; the skin adds the *tool+version+environment+secrets-policy* quartet which is NOT in the base role file.

### 3.2 Analyst (config focus)

- **FIRST focus anchor (A_F override):** Read the TOOL SCHEMA (documented or machine-readable — JSON Schema, OpenAPI, protobuf, CRD, `.proto`, man-page). Read EXISTING configs in the project that target the same tool (BL-29 — re-use established key names and stanza shapes). Read the precedence chain for this config class (defaults → system → environment → project → user) to understand how THIS config layer interacts with the others. THEN enumerate required vs optional keys. Analyst's primary artifact is the KEY ENUMERATION TABLE + the PRECEDENCE MAP + the dependency list (which other configs must match for P6 cross-config consistency).
- **What the role considers "the artifact":** A structured plan with EXACTLY these required parts:
  1. **Schema declaration** (which schema, which version, which validator)
  2. **Required keys table** (key | type | default | notes)
  3. **Optional keys table** (key | type | when-to-use | default if omitted)
  4. **Forbidden keys list** (deprecated keys that must NOT appear in this schema version)
  5. **Precedence map** (which layer this config sits in + which layers override or are overridden by it)
  6. **Cross-config dependencies** (other configs in the project that must agree on specific values — canonical case: service port in app config == port in deployment config)
  7. **Secrets list** (which keys need values that are secrets — and WHERE those values come from — vault / env var / runtime injection — NEVER inline)
  8. **Dangling reference targets** (environment variables the config references, and the expected sources of those variables)
  9. **Known OOD patterns** (what NOT to put in this config class)
- **Primary failure mode in config work:** Building a "correct looking" config without reading the schema — keys are plausible but not valid for the target version (e.g., writing `memory: 512M` when the schema requires `memory: "512Mi"`, or writing `maxAge: 3600` when the schema requires `maxAgeSeconds: 3600`). This is BL-21 (format-first) + BL-29 (terminology) + BL-17 (pre-generate verification) all at once. Mitigation: Analyst's Jidoka Q1 scores A_F = 0.0 (Andon) if the schema was not read before drafting the key enumeration.
- **Second failure mode:** Hallucinating a schema — "I assume this tool has a `retries` key" — without verifying. Mitigation: Jidoka Q3 below asks "is every required key in my enumeration ACTUALLY in the schema I read, or did I infer any?"
- **Jidoka self-check (config specialization):**
  - Q1: "Have I READ the schema for the target tool + version? If no → A_F = 0.0 → Andon. Cite the schema file or URL."
  - Q2: "Does my key enumeration match the schema verbatim (no renamed keys, no inferred keys, no deprecated keys from a prior version)? (1-σ)"
  - Q3: "For every key I marked as a secret, have I specified its SOURCE (vault path / env var name / runtime injector)? Inline secret values = RED on E."
  - Q4: "For every cross-config dependency, have I specified which OTHER config files must be updated in lockstep? (Dependency analysis — analyst_EN.md Responsibility 4.)"
  - Q5: "Is the precedence map explicit (which layer my config sits in + which keys it overrides from lower layers + which keys higher layers override from it)? Without this, P5 precedence sanity check in Validator will fail."
- **Deliverable template (config-specific):**
  ```
  ## Config Plan (Analyst output for configs)
  Tool: [name]
  Schema: [name, version, validator]
  Environment: [dev/staging/prod/local]
  Precedence layer: [defaults | system | env | project | user]
  Required keys:
    key | type | default | notes
    ...
  Optional keys:
    key | type | when-to-use | notes
    ...
  Forbidden keys (deprecated in this schema version):
    key | replaced by | reason
    ...
  Secrets:
    key | source (vault/env/injector) | rotation policy
    ...
  Cross-config dependencies:
    other-file | shared resource | must agree on
    ...
  Dangling-ref targets:
    env var name | expected source | fallback (if any)
    ...
  Known OOD: [what NOT to put in this config class]
  Open Questions: [BL-15 spiral gap]
  B-check: F=_ E=_ (1-σ)=_ Λ=_ → B=_
  ```

### 3.3 Builder (config focus)

- **FIRST focus anchor (A_F override):** Read the Analyst plan verbatim. Read the tool schema that Analyst cited (verify it matches the version). Read EXISTING project configs for the same tool (for format reference — indent style, key ordering conventions, comment conventions). Then write the config. Do NOT polish prose (there is no prose in a config) — polish STRUCTURE: consistent indentation, consistent key ordering, inline comments where the tool supports them (YAML `#`, TOML `#`, JSON does NOT support comments — omit them there).
- **What the role considers "the artifact":** The single config file (`.yaml`, `.toml`, `.json`, `.ini`, `.env`, or YAML-fenced Markdown block). The artifact is NOT a draft in the chat thread — it is a SAVED FILE at a canonical path that passes the parser. Builder must NOT mark Done until the file exists and parses cleanly.
- **Primary failure mode in config work:** Silently committing inline secrets. Builder copy-pastes a working example from stackoverflow that includes a real API key, polishes it, commits it, and now the repo has a credential exfiltration problem. Mitigation: Builder's Jidoka Q4 runs a SECRETS SCAN (P3) on the file BEFORE marking Done, and a pre-commit hook (BL-C2 below) enforces this structurally.
- **Second failure mode:** Indent drift — writing a YAML file with mixed tabs and spaces, or with the wrong nesting depth. This is a P1 parse failure caught downstream, but Builder should catch it at write-time. Mitigation: Builder's pre-commit runs the parser as its own smoke test (BL-C2).
- **Third failure mode (config-specific, not in base role file):** Duplicate keys — YAML technically permits duplicate keys in some parsers (last-wins) but schemas usually reject them. Builder must ensure no duplicate top-level or nested keys. Mitigation: Jidoka Q5 below greps for duplicate key names.
- **Fourth failure mode (config-specific):** Environment variable typos that resolve to empty strings silently (e.g., `${DATBASE_URL}` instead of `${DATABASE_URL}` — the tool sees an empty string and may start in degraded mode without erroring). Mitigation: Jidoka Q6 below greps for env var references and verifies each resolves to a defined value in the target environment, OR has an explicit fallback.
- **Jidoka self-check (config specialization):**
  - Q1: "Have I read the Analyst plan's key enumeration in full? (F)"
  - Q2: "Does every key I wrote exist in the schema Analyst cited, with the exact name + type? (E)"
  - Q3: "Does the file parse cleanly in the target format (YAML/TOML/JSON/INI/ENV)? (BL-C2 pre-commit gate)"
  - Q4: "Does the file pass the secrets scan — no inline passwords / API keys / tokens / private keys? (1-σ — P3)"
  - Q5: "Are there any duplicate top-level or nested keys? Run `grep -n '^[a-zA-Z_]' file.yaml | sort | uniq -c | awk '$1>1'` or equivalent per format."
  - Q6: "Does every `${VAR}` / `$VAR` / `<ref:...>` reference resolve to a defined source? (P4)"
  - Q7: "Does the indent style match the project's existing configs (2 spaces / 4 spaces / tabs — pick one, stick to it)? (Λ — BL-29)"

### 3.4 Validator (config focus)

- **FIRST focus anchor (A_F override):** Read the Analyst plan + the Builder's polished config file. Run all 7 parse sub-checks from Section 4 (P1–P7). Validator does NOT skip any — each catches a specific failure mode, and parse in aggregate is the gate.
- **What the role considers "the artifact":** The config file AS THE TOOL WILL SEE IT — including the layered precedence chain (defaults → envs → project → user) in the environment where it will run. Validator simulates the tool at the highest-stakes moment: the instant it loads the config during a cold start or a hot reload. If the tool is a schema validator itself (Kubernetes API server, npm, pip), Validator may actually run the real validator.
- **Primary failure mode in config work:** Running P1 (parse) alone and declaring PASS while the config has schema violations, inline secrets, or cross-config drift. P1 catches syntax errors but NOT the other 6 failure classes. Validator MUST run ALL 7 P-checks (mechanical P1–P4 + P7, interpretive P5–P6). This is the distinction between `verify.method: parse` (the PRIMARY label) and the FULL validation gate (all 7 P sub-checks). BL-17 + the 7-check structure together prevent this failure.
- **Secondary failure mode (config-specific):** Trusting the Builder's schema citation without re-verification. Builder may have read the wrong schema version (v7 when the tool is actually on v8). Validator re-verifies the schema version declaration against the actual tool's expected schema and re-runs P2 with the correct schema. Mitigation: Jidoka Q3 below.
- **Tertiary failure mode:** Validator runs the schema validator but IGNORES its warnings (only checks exit code). Warnings in schema validators are often the first signal of a deprecated key that will become an error in the next version. Validator must ALSO read the warning list and flag deprecated keys. Mitigation: Jidoka Q4 below.
- **Jidoka self-check (config specialization):**
  - Q1: "Have I run all 7 P checks, not just P1 (parse)?"
  - Q2: "Have I confirmed the SCHEMA VERSION declaration in the config matches the tool's current expected schema version? (P7)"
  - Q3: "Have I captured the schema validator's WARNINGS (not just errors) and flagged any deprecated keys? (proactive P2)"
  - Q4: "Have I scanned the file for inline secrets using the curated regex list (P3)?"
  - Q5: "Have I resolved every env var reference against the target environment's environment file? (P4)"
  - Q6: "If this config has cross-config siblings (package.json + Dockerfile + docker-compose), have I verified the same-resource values agree? (P6)"
  - Q7: "If the tool supports precedence layering, have I checked that the precedence rules are unambiguous for every key? (P5)"

### 3.5 Coherent (config focus)

- **FIRST focus anchor (A_F override):** Read the full config + any cross-config siblings in the project + the project glossary (BL-29). Coherent cares about *this config's fit with its siblings and with the project's established conventions*, not just the config in isolation.
- **What the role considers "the artifact":** The config + (all other configs it interacts with in the same project) = config system. Coherent checks that the CURRENT config (a) uses the same key naming conventions as its siblings, (b) agrees with its siblings on shared-resource values (ports, versions, endpoints), (c) declares the same schema version if it's from the same tool family, and (d) uses the project's established precedence layering.
- **Primary failure mode in config work:** "Terminology drift across configs" — one config calls a key `hostname`, another calls it `host`, another calls it `server_host`. Or: one config uses `port: 3000` (integer) while a sibling uses `port: "3000"` (string). These are silent contradictions that may not break parse (each file parses independently) but break the system when the two configs are combined. Mitigation: Coherent runs a glossary scan across ALL related configs and flags divergence.
- **Secondary failure mode (config-specific):** Phantom coherence — every config looks independently valid, and the schemas are honored, but the configs disagree on what the system IS. Example: `package.json` says `"version": "2.1.0"`, `pyproject.toml` says `version = "1.9.3"`, both parse, both schemas valid, but the project has two conflicting version declarations and the release pipeline picks one silently. Mitigation: Coherent's Q4 below explicitly asks "for each shared identity (version, name, port, endpoint), do ALL configs agree?"
- **Tertiary failure mode:** Cross-config dangling references — config A references env var `DATABASE_URL` and config B references env var `DB_URL`; neither file is wrong in isolation, but the two configs cannot be in the same deployment without also having an alias table. Mitigation: Coherent's Q5 greps for all env var references across siblings and builds a mini-env-glossary.
- **Jidoka self-check (config specialization):**
  - Q1: "Does every config in the project use the same key naming convention (snake_case / camelCase / kebab-case)? Mixed is a σ failure. (BL-29)"
  - Q2: "For every shared resource (port, version, endpoint, hostname), do ALL configs that reference it agree on the value AND the type? (1-σ — P6)"
  - Q3: "Does every config declare the same schema version (when from the same tool family)? (P7)"
  - Q4: "For each piece of the project's identity (name, version, description), do all configs that declare it agree verbatim?"
  - Q5: "Are env var references consistent across configs (same name, same expected source, same fallback)?"
  - Q6: "Independent spot-check: pick 3 keys at random from this config, grep the project for the same key name in other configs, check that values agree (when they should)."
- **Cross-config consistency rule (BL-C4, see Section 7):** Coherent is the ENFORCER of the cross-config consistency protocol. Commit is BLOCKED if P6 (cross-config consistency) fails for any shared resource.

---

# SECTION 4 — Verification Protocol (`parse` expanded)

The skin file's verification section maps directly to `domain.verify.method: parse`. The skin must expand `parse` into 7 concrete sub-checks (P1–P7), split into L1 (mechanical, per-commit) and L2 (interpretive, pre-activation / pre-deploy).

### 4.1 The seven parse sub-checks

| # | Check | What it catches | Who runs it | L1 or L2 | Mechanism |
|---|---|---|---|---|---|
| **P1** | **Parse syntax** — the file parses cleanly in its declared format (YAML, TOML, JSON, INI, ENV, or Markdown-fenced) without the parser raising a fatal error | Indentation errors, missing commas, unclosed quotes, mixed tabs/spaces, stray commas in JSON, unescaped colons | Validator | **L1** | Mechanical — run the format's canonical parser (`yq . file.yaml`, `toml parse`, `jq . file.json`, native validator for INI/ENV); non-zero exit = FAIL |
| **P2** | **Schema validation** — the file passes the declared schema (JSON Schema, OpenAPI, protobuf descriptor, Kubernetes API validator, or tool-specific validator like `npm install --dry-run` / `docker-compose config`) | Unknown keys, wrong types, missing required keys, deprecated keys (if validator reports them), out-of-range values | Validator | **L1** (when a formal schema exists) / **L2** (when only duck-typed — requires judgment) | Mechanical if schema exists; interpretive otherwise |
| **P3** | **Secrets scan** — no inline credentials (passwords, API keys, private keys, tokens) appear as literal values; all credentials are references to env vars / vault paths / secret stores | Accidental `api_key: "real-key-here"`; a `.env.example` with real values; embedded JWTs; PEM blocks | Validator + Coherent | **L1** | Mechanical — curated regex list (see 4.2); non-zero hit count = FAIL |
| **P4** | **Dangling reference resolution** — every `${VAR}`, `$VAR`, `<ref:key>`, `%(key)s`, or tool-specific interpolation resolves to a defined source in the target environment, OR has an explicit fallback | Typos in env var names (`DATBASE_URL` vs `DATABASE_URL`); references to secrets not present in the vault; orphan placeholders; missing fallback values | Validator | **L1** | Mechanical — grep for interpolation patterns, diff against the target env file / vault manifest |
| **P5** | **Precedence sanity** — when multiple layers (defaults / env / project / user) define the same key, the precedence rule is unambiguous and documented; no key is set in two layers with different values without explicit override annotation | Silent overrides where the lower layer's value is shadowed by a higher layer without the operator realizing; "why isn't my setting taking effect?" confusion | Validator | **L2** | Interpretive — requires reading the precedence rules and reasoning about which layer wins for each key |
| **P6** | **Cross-config consistency** — when 2+ configs describe the SAME resource (service port in app config == Dockerfile EXPOSE == docker-compose port mapping; package version in package.json == pyproject.toml == CHANGELOG.md), the values agree exactly | Port drift; version drift; endpoint drift; hostname drift; credential source drift | Coherent | **L2** | Interpretive — requires enumerating shared resources per project and confirming all references agree |
| **P7** | **Schema version alignment** — the schema version declared in the file matches the actual keys used; no v1 keys in a v2 file; no deprecated keys in the current version | Tool-version upgrade defects; copy-pasted older configs; "it worked on the old version" regressions | Validator | **L1** (when version declaration is machine-checkable) / **L2** (when not — requires reading the schema changelog) | Mechanical when the schema exposes version; interpretive otherwise |

### 4.2 L1 (mechanical) vs L2 (interpretive) split

- **L1 (mechanical, per-commit):** P1, P2 (when schema formal), P3, P4, P7 (when version machine-checkable). These should run on EVERY config revision commit — ideally as a pre-commit hook (BL-C2 below makes this a structural requirement).
- **L2 (interpretive, pre-deploy):** P5, P6, and the fallback variants of P2/P7 when schemas are duck-typed. These require thoughtful reading and run once before the config is declared DEPLOYED / ACTIVATED.

**Secrets scan (P3) curated regex list (spec for Builder to include verbatim):**

```
- Generic password/secret pattern:  (password|passwd|pwd|secret|api_key|apikey|access_key|private_key|token|auth|credential)\s*[:=]\s*[\"']?[^\s\"'{}$<>]{8,}[\"']?
- AWS access key:                    AKIA[0-9A-Z]{16}
- AWS secret key:                    (?<![0-9A-Za-z])[0-9a-zA-Z/+]{40}(?![0-9A-Za-z])
- GitHub token:                      ghp_[0-9A-Za-z]{36,}  |  gho_[0-9A-Za-z]{36,}  |  ghs_[0-9A-Za-z]{36,}  |  ghr_[0-9A-Za-z]{36,}
- OpenAI / Anthropic key:            sk-[A-Za-z0-9]{32,}  |  sk-ant-[A-Za-z0-9]{32,}
- Private key block:                 -----BEGIN (RSA |DSA |EC |OPENSSH )?PRIVATE KEY-----
- JWT token:                         ey[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}
- Bearer token:                      [Bb]earer\s+[A-Za-z0-9_\-\.=]{20,}
```

Hits on any pattern = P3 FAIL unless the value is clearly a PLACEHOLDER (`xxxxxxx`, `<your-api-key-here>`, `REPLACE_ME`, `${VARIABLE}`). Builder MUST include the placeholder whitelist in the skin file.

### 4.3 Relationship to the code-skin `build` and plan-skin `dry_run`

The code skin's `verify.method: build` checks "does the code compile + test + lint?" The plan skin's `verify.method: dry_run` checks "can a reader execute the plan?" The config skin's `verify.method: parse` checks "can the tool load the config without error?" — a direct and distinct verification modality.

| Code skin check | Plan skin analog | Config skin analog |
|---|---|---|
| `compile` (does it typecheck?) | DR1 + DR2 (do steps make sense without gaps?) | **P1 + P2** (does the parser accept it + does the schema accept it?) |
| `test` (do unit tests pass?) | DR3 + DR5 (are resources named + criteria measurable?) | **P3 + P4** (no inline secrets + no dangling refs?) |
| `lint` (style violations?) | DR6 + BL-29 glossary scan (terminology consistent?) | **P7 + Coherent BL-29 glossary scan** (schema version aligned + key names consistent?) |
| `integration tests` (modules cooperate?) | DR4 (do phases cooperate at handoffs, including failure modes?) | **P5 + P6** (precedence sane + cross-config consistent?) |

This analogy is PEDAGOGICAL — a Builder coming from code should think of parse as "compile + lint + security scan + cross-file consistency check, all fused."

### 4.4 Block for the skin file (under "Verification Protocol")

The Builder must produce a block matching this structure:

```
[method name]: parse
[command]: hybrid — L1 checks (P1, P2-formal, P3, P4, P7-machine-readable)
          are mechanical. Concrete commands per format:
            YAML:   yq . "$FILE"
                    + schema: `yq eval -P . "$FILE" | ajv validate -s schema.json -d -`
                    (requires `yq` + `ajv-cli`; fallback: `python -c "import yaml; yaml.safe_load(open('$FILE'))"`)
            TOML:   `python -c "import tomllib; tomllib.load(open('$FILE','rb'))"` (py≥3.11)
                    or `toml parse "$FILE"`
            JSON:   `jq . "$FILE"` (+ `ajv validate -s schema.json -d "$FILE"` for schema)
            INI:    `python -c "import configparser; c=configparser.ConfigParser(); c.read('$FILE')"`
            ENV:    `grep -vE '^\s*(#|$)' "$FILE" | grep -nvE '^[A-Za-z_][A-Za-z0-9_]*=.*$'`
                    (any hit = parse fail)
            YAML-fenced in Markdown:
                    extract fence with `awk '/^```yaml$/,/^```$/' "$FILE"`
                    pipe into the YAML parser above
          Secrets scan (P3):
            grep -inE '<curated regex list from 4.2>' "$FILE"
            (any hit not matching placeholder whitelist = FAIL)
          Dangling-ref scan (P4):
            grep -oE '(\$\{[A-Z_]+\}|\$[A-Z_]+|<ref:[^>]+>)' "$FILE"
            | sort -u
            | while read ref; do ...diff against target env file... done
          L2 checks (P5, P6, P2-duck-typed, P7-non-machine-readable) are interpretive
          and require a human / agent reader.
[success criteria]: all 7 P checks PASS (P1–P7 in Section 4.1 of this skin)
                    AND the parser accepts the file AND the schema validator
                    accepts the file AND the secrets scan returns zero non-
                    placeholder hits AND all dangling refs resolve AND
                    precedence is documented AND cross-config consistency
                    holds AND schema version aligns with keys used.
[failure recovery]: specific per check —
                    P1 fail → fix syntax (re-indent, escape quotes, fix commas)
                    P2 fail → remove unknown keys, add required keys, fix types,
                              upgrade schema if keys are from newer version
                    P3 fail → move secret to vault/env var, replace inline value
                              with reference, rotate the leaked credential if
                              the file was ever committed, grep history for
                              other leak sites (BL-13 Yokoten)
                    P4 fail → fix env var typo, add fallback value, or declare
                              the env var as required in the deployment manifest
                    P5 fail → document the precedence rule explicitly, annotate
                              overrides, or remove the duplicate key from the
                              lower-precedence layer
                    P6 fail → unify the values across all configs, make the
                              canonical value live in ONE place and reference
                              it from the others
                    P7 fail → upgrade deprecated keys to current schema, or
                              downgrade schema version declaration to match
                              actual keys used
[independence check]: Validator runs parse checks on the FILE AS COMMITTED,
                      not on Builder's in-progress draft. The schema validator
                      runs with the SAME VERSION of the schema the tool will
                      actually use in production, not the Builder's local
                      schema. For cross-config P6, Validator reads the SIBLING
                      configs fresh from disk, not from Builder's summary.
                      Phantom coherence detection (BL-5) applied to configs:
                      if Builder and Validator both say PASS but neither
                      actually ran the parser or the schema validator,
                      flag PHANTOM PARSE. BL-C2 pre-commit gate makes this
                      impossible in the normal path.
```

---

# SECTION 5 — RT Phase Protocol for Configs

Code projects use the canonical phase protocol from `eradev.md` Section VI:
Visionary → Analyst → Builder → Validator → Coherent

Configs need adjustments because the work profile is different (config work is often small; schemas are the primary spec; secrets are a structural concern that can justify full RT even for tiny files). The skin file must specify:

### 5.1 RT invocation points for configs

**Three RT invocation points apply:**

1. **RT-0 (Visionary solo, RECOMMENDED): purpose capture + secrets policy + schema version.** Before any RT-1. Runs when the operator proposes a new config or a major revision. Visionary alone evaluates: what tool is being configured, what environment, what is the secrets policy, what schema version. A YES from Visionary unlocks RT-1. Output is a single-paragraph decision.
2. **RT-1 (tier-dependent: full 5-role OR RT-lite 3-role): decomposition + write + validate.** Produces the Analyst key enumeration + Builder's written config + Validator's P1–P5 pass + Coherent's cross-config scan. Tier choice depends on config size + stakes (see 5.2 below). Builder does NOT release the config until RT-1 approves.
3. **RT-2 (mandatory for production/infra configs, optional for dev-local): pre-deploy gate.** Before the config is declared ACTIVATED (deployed to the tool, loaded into production, merged to main). Runs the full 7-check parse sweep including interpretive P5–P6, BL-29 glossary scan, and secrets re-scan from a clean checkout.

### 5.2 RT-lite vs full 5-role — size and stakes decision tree

**Not every config needs a 5-role RT.** A 20-line dev-local `.env` file with no secrets and no precedence interaction is over-engineered at full RT. But a 200-line Kubernetes deployment manifest with secrets, precedence, and cross-config coupling is catastrophically under-engineered at RT-lite.

**Decision tree (Builder / META applies at task classification):**

```
IS the config production or infrastructure?
  production / staging / IaC / secrets file / deploy manifest / CI secrets
    → FULL 5-ROLE RT always (regardless of size)

IS the config small (<50 lines) AND pure-data (no secrets, no precedence, no cross-config)?
  yes → RT-lite (3 roles): Visionary + Builder + Validator
        skip Analyst (Builder absorbs the schema-read duty)
        skip Coherent (no cross-config surface)

IS the config medium (50–200 lines) OR has secrets OR has precedence?
  yes → FULL 5-role RT

IS the config large (>200 lines) OR touches multiple tools OR has multi-layer precedence?
  yes → FULL 5-role RT with mandatory RT-2 pre-deploy
```

**RT-lite rules when applied:**
- Visionary RT-0 still mandatory — needed for schema version + purpose
- Analyst skipped — Builder's own Check-First (BL-17) absorbs the schema read
- Validator still runs all 7 P checks (parse is still the load-bearing gate)
- Coherent skipped — but the cross-config scan is REPLACED by a Builder self-check ("no sibling configs reference the same resource")
- If ANY P5/P6 concerns surface during Validator's pass, RT-lite ESCALATES to full RT-1

### 5.3 Single Builder vs split

**Decision: single Builder, unless the config is XL multi-tool.**

The config Builder is a SINGLE agent for S/M/L configs. Within that single Builder session:
- Read Analyst plan
- Read schema
- Read existing sibling configs for format reference
- Write config key-by-key in schema order
- Run pre-commit parse + secrets scan (BL-C2 enforcement)
- Commit

**Exception (XL multi-tool):** For an XL config that spans multiple tools (e.g., a mono-repo config.yaml that drives both a Go service and a Python service via different sections), the Analyst may split work across two Builders by tool boundary (Builder A owns the Go section, Builder B owns the Python section). File Ownership rule from `analyst_EN.md` Responsibility 4 applies. Coherent gate is MANDATORY between Builder completion and Validator RT-2 to catch cross-tool drift.

### 5.4 Pipeline block for the skin file

```
Config pipeline (FIXED):
RT-0 (Visionary solo, RECOMMENDED) → purpose + environment + secrets policy + schema version
Tier decision → RT-lite (S dev-local pure-data) OR full 5-role (everything else)
RT-1 (tier-dependent) → Analyst key enumeration (skip if RT-lite)
                      → Builder writes config
                      → Validator runs P1–P4 + P7 (L1 mechanical)
                      → Coherent runs cross-config scan (skip if RT-lite)
Pre-commit gate (BL-C2) → parser + secrets scan runs automatically
RT-2 (mandatory for prod/infra, optional for dev-local) →
                      full 7-check parse + L2 interpretive (P5, P6)
                      + BL-29 glossary scan + secrets re-scan from clean checkout
Commit config file → tool hot-reloads / restarts / next-spawn reads new config
Activation announcement → note in deploy log or team channel
```

---

# SECTION 6 — Examples (3 concrete)

The skin file must include 3 examples matching the template at `templates/domain_skin.md.template` lines 88–99 but expanded to include catching role + phase + fix per this spec. Below are the exact 3 examples Builder must include (Builder MAY polish prose for readability; Builder MUST preserve the structural elements — catching role, phase, fix — verbatim). These are the exact examples prescribed in the task prompt.

### 6.1 Example 1: YAML indentation error (P1 / P2 syntax + schema)

- **Input:** "Add a new `resources` block under the `services.api` stanza in `docker-compose.yml` with `limits: { cpus: '0.5', memory: 512M }` and `reservations: { cpus: '0.25', memory: 256M }`."
- **Scenario:** Builder edits `docker-compose.yml`, adds the `resources` block under the existing `services.api` stanza. Builder uses 2-space indent but the existing file uses 4-space for nested keys. Specifically, the `limits:` key is indented 2 spaces instead of 4 — one level too shallow. Builder saves the file and declares Done.
- **What Validator finds:** Running P1 (`yq . docker-compose.yml`), Validator sees the parser fail at line N with `mapping values are not allowed here` — YAML interprets the shallow `limits:` key as a sibling of `services.api`, not a child of `resources`. The file is syntactically invalid. P1 FAILS immediately. Running P2 is moot — the file doesn't parse, so the schema validator cannot see it.
- **Catching role:** **Validator** (P1 is the load-bearing check here; Builder's Jidoka Q3 "does the file parse cleanly" should have caught it but didn't because Builder marked Done without running the parser).
- **Phase:** **RT-1** (Validator's parse pass happens at RT-1, not RT-2 — parse is the PRIMARY L1 gate, not a deferred one).
- **Fix:** Re-indent the `limits:` and `reservations:` keys to 4 spaces (matching the file convention). Run `yq . docker-compose.yml` — exit 0, P1 PASS. Run `docker-compose config` (the tool's own schema validator) — exit 0, P2 PASS. Commit.
- **Why Builder's Jidoka Q3 should have caught it (process defect for Hansei):** BL-C2 pre-commit gate mandates running the parser before marking Done. This example illustrates what happens when Builder skips BL-C2. Retro: install the pre-commit hook structurally, make it impossible to commit without a parse pass.

### 6.2 Example 2: Inline secret in `.env.example` (P3 secrets scan)

- **Input:** "Create a `.env.example` file documenting the environment variables needed by the service."
- **Scenario:** Builder wants to show developers what `OPENAI_API_KEY` looks like. Builder copies a real working key from their local `.env` into `.env.example` "just for reference", polishes the rest of the file, and declares Done. Builder intends to replace the real value with a placeholder "before committing" but forgets.
- **What Validator finds:** Running P3 (secrets scan with curated regex list from Section 4.2), Validator hits the `sk-[A-Za-z0-9]{32,}` pattern on the `OPENAI_API_KEY` line. The value does not match the placeholder whitelist (`xxxxxxx`, `<your-api-key-here>`, `REPLACE_ME`, `${VARIABLE}`). P3 FAILS with 1 non-placeholder hit. Validator ALSO flags this for Coherent because the file has already been committed to git history — the credential is exfiltrated and must be rotated (BL-13 Yokoten: grep git history for other leak sites).
- **Catching role:** **Validator** (P3 is mechanical, runs at RT-1 if BL-C2 pre-commit hook is installed, otherwise at RT-2 pre-deploy).
- **Phase:** **RT-2** pre-deploy secrets scan (when BL-C2 is not installed). If BL-C2 is installed, the pre-commit hook catches it BEFORE the commit lands, at which point the rotation step is unnecessary.
- **Fix:**
  1. Replace the real `sk-...` value in `.env.example` with a placeholder (`OPENAI_API_KEY=sk-REPLACE_ME_WITH_YOUR_KEY`) or with a clear placeholder pattern (`OPENAI_API_KEY=<your-api-key>`).
  2. If the real value was ever committed: ROTATE the real API key at the provider (OpenAI dashboard → revoke → issue new key).
  3. Update the local `.env` with the new key.
  4. Document the setup step in `README.md` ("copy `.env.example` to `.env`, fill in real values from team vault").
  5. Grep git history for other leak sites (`git log -p | grep -iE 'sk-[A-Za-z0-9]{32,}'` and similar patterns for all keys listed in the curated regex).
  6. Install BL-C2 pre-commit hook so this cannot happen again.
- **Why P1 alone would miss this:** P1 (parse) would say PASS — a `.env` file with one valid line is syntactically fine. Only P3 (secrets scan) catches the inline credential. This example is the canonical case for why `parse` in the config skin is NOT just "run the parser" — it is a FAMILY of checks, and P3 is the one that catches the failure-mode class P1 cannot see.

### 6.3 Example 3: Port drift across related configs (P6 cross-config consistency)

- **Input:** "Set up a containerized service with `package.json` declaring the runtime port, `Dockerfile` exposing the same port, and `docker-compose.yml` mapping the port to the host."
- **Scenario:** Builder writes the 3 files in sequence. `package.json` has `"main": "server.js"` and the `server.js` listens on port 3000 (hardcoded, but declared in package.json's `scripts.start` as `PORT=3000 node server.js`). `Dockerfile` has `EXPOSE 3001` (Builder copy-pasted from a stackoverflow example and forgot to change it). `docker-compose.yml` maps `3000:3000` (matching package.json). All 3 files parse cleanly (P1 PASS). All 3 files have no secrets (P3 PASS). Each file is individually valid.
- **What Coherent finds:** Running P6 (cross-config consistency), Coherent enumerates shared resources: PORT. Looking at the 3 configs: package.json says 3000, Dockerfile says 3001, docker-compose says 3000. Drift detected. The container will expose 3001 but the app listens on 3000 — the container port mapping will fail silently and the service will be unreachable from the host. P6 FAILS.
- **Catching role:** **Coherent** (P6 is Coherent-owned because it requires reading MULTIPLE configs and cross-referencing them — Validator owns single-config checks; Coherent owns cross-config checks).
- **Phase:** **RT-2** (P6 is L2 interpretive, runs at pre-deploy). Could also be caught at RT-1.5 for M+ configs or during Coherent's cross-config scan at RT-1.
- **Fix:** Unify to ONE port. Pick 3000 as the canonical value (matching package.json and docker-compose). Update Dockerfile to `EXPOSE 3000`. Re-run P6 — all 3 configs agree. Commit the Dockerfile fix + a comment in README documenting that the service runs on port 3000 (single source of truth for future edits). Coherent records a note for future P6 scans: "when package.json / Dockerfile / docker-compose describe a port, they must ALL agree."
- **Why P1 / P2 alone would miss this:** P1 (parse) runs on one file at a time — each file parses independently. P2 (schema) validates one file against its own schema — package.json against npm schema, Dockerfile against Docker schema, docker-compose against Compose schema. Each schema is honored. The failure is RELATIONAL — the three files disagree with each other. P6 is the ONLY check that looks across configs. This example is the canonical case for why `parse` must expand into multi-file consistency, not just per-file validation.

---

# SECTION 7 — BL Inheritance and Overrides

The config skin inherits all 22 universal BL unchanged and handles each of the 8 code-adapter BL individually. New config-specific BL are added in a separate `BL-C` namespace that does NOT count against the main 30-BL budget.

### 7.1 Universal BL (22 entries — all inherited unchanged, 1-line applicability note each)

| BL | Title | Applicability to config work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Applies unchanged — a fresh config-domain project starts with Λ=0.5; accumulates as sibling configs land in the project |
| BL-4 | S_adjusted = S_team × B_mean | Applies unchanged — Coherent at RT-2 computes S_adjusted from the 5 role B scores |
| BL-5 | Phantom Coherence Detection | Applies unchanged — config-specific manifestation is "Builder and Validator both say PASS but neither actually ran the parser or secrets scan" (see P1 + P3 independence check in Section 4.4) |
| BL-7 | EN for Practical Tasks, RU for Theoretical Depth | Applies unchanged — config authoring is practical (EN role files); config design at scale (multi-tool IaC architecture) is theoretical (RU role files) |
| BL-9 | Interface Contracts Between Roles | Applies unchanged — Analyst→Builder contract is the key enumeration + precedence map; Builder→Validator contract is the parsed+schema-valid file + secrets-clean status |
| BL-10 | Multiplicative B Structure | Applies unchanged — weights are `text` profile (F=0.25, E=0.25, (1-σ)=0.25, Λ=0.25) per Section 1.1 |
| BL-11 | Scope Creep is Muda | **Critical for configs** — "while editing the port, I noticed the timeout could also be tuned" = SEPARATE config revision, not a silent addition |
| BL-12 | Hansei Targets Process, Not People | Applies unchanged — post-deploy reflection is about why P3 missed a secret, not who committed the file |
| BL-13 | Yokoten — One Lesson, All Analogous Cases | **Critical for configs** — if a secret leaks in one config, grep the entire repo (history included) for the same credential pattern in other configs |
| BL-15 | 2% Spiral Gap | Applies unchanged — every config ships with some open questions (deprecated keys that haven't been removed yet, TODO annotations); the Open Questions section is mandatory in non-trivial configs |
| BL-16 | Reading the Framework ≠ Applying It | Applies unchanged — META must still delegate config work to agents, not edit configs directly |
| BL-17 | Pre-Generate Verification = Prevention | **Critical for configs** — read the SCHEMA + existing project configs + precedence rules BEFORE drafting keys (BL-21 in practice) |
| BL-18 | Scope Reclassification at 2× Estimate | Applies unchanged — if a "quick config tweak" spawns 50+ parse-fix commits, reclassify the task |
| BL-19 | Bilingual Files Simultaneous | Applies (limited) — most configs are English-only (tool schemas are in English). If the project has RU+EN documentation about the config, both must update together, but the config file itself is typically one language |
| BL-20 | Adversarially Test Bootstrap | Applies unchanged — test the config skin itself against a trial config before deploying the skin |
| BL-21 | Format Specifications Are Inputs | **Most critical for configs** — the tool's schema IS the format specification; reading it BEFORE generation is non-negotiable for configs; this is the SINGLE most important BL for config work |
| BL-26 | META Always Delegates | Applies unchanged — META never edits configs directly |
| BL-28 | Agent Prompt Must Include Explicit Context | Applies unchanged — config-task agent prompts must name the skin file path AND role file path AND schema file path (if schema exists) |
| BL-29 | Verify Established Terminology Before Generating | **Critical for configs** — configs MUST use the tool's canonical key names (`host` not `hostname`, `port` not `port_number`); drift here breaks tooling invisibly |
| BL-30 | Defense-In-Depth | Applies unchanged — config verification has layers: Builder Jidoka + parse + schema + secrets scan + Coherent cross-config + Validator P1–P7 sweep |
| BL-31 | Constrain Output Types | Applies unchanged — Builder's output is the single saved config file, not prose explanations about the config |
| BL-32 | Grep After BL Merge | Applies unchanged — if key naming conventions change (`timeout_ms` → `timeout`), grep all sibling configs for orphan references |

### 7.2 Code-adapter BL (8 entries — treated individually)

| BL | Title | Verdict for configs | Config equivalent (if not N/A) |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | **Config equivalent: BL-C1** | Major config activation (production deploy of a new IaC manifest, new service config, new secret rotation) is a release event requiring canary. See BL-C1 below. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Applies unchanged** | Config equivalent is "3+ consecutive parse/schema fix attempts on the same file = STOP, re-read the schema, re-run RT-1." No new BL-C needed; BL-3 transfers cleanly. Symptom: thrashing on indentation or schema errors usually means the wrong schema version is being targeted. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | **Config equivalent: BL-C2** | Before committing any config, Builder MUST run the parser + schema validator + secrets scan. Commit REJECTED otherwise. See BL-C2 below. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **LIFTED INTO VOCABULARY row 18** (not a separate BL-C) | Config flags ARE the deployment mechanism — BL-8 applies DIRECTLY to configs with no adaptation needed. A config toggle is a deploy event regardless of whether the tool has a "feature flag" concept. Not a separate BL-C because the universal form applies. |
| **BL-14** | Rollback Plan Before Deploy | **Config equivalent: BL-C3** | Before activating a production config, Builder MUST document the rollback procedure (git revert + tool reload, or prior-version restore from config store). See BL-C3 below. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | **Config equivalent: BL-C4** | Before RT-1 begins on any config, Analyst MUST verify the target schema is CURRENT (tool version matches) and every referenced env var / vault path actually exists in the target environment. See BL-C4 below. |
| **BL-24** | Single-Responsibility Commits | **Applies unchanged** | Config equivalent is "one commit = one config scope" — don't change the port AND the timeout AND the log level in one commit. Transfers cleanly; no new BL-C needed. |
| **BL-25** | Error Path Coverage Matrix | **LIFTED INTO P5 + P6** (not a separate BL-C) | Configs don't have runtime error paths in the code sense, but the precedence sanity check (P5) + cross-config consistency check (P6) together encode the "what happens if the config is partially-applied or conflicts" concern that BL-25 encodes for code. BL-25 is LIFTED INTO P5+P6, not maintained as a separate BL-C entry. |

Summary: **2** code-adapter BL apply unchanged (BL-3, BL-24); **4** have config equivalents (BL-2→C1, BL-6→C2, BL-14→C3, BL-22→C4); **1** is lifted into vocabulary row 18 (BL-8); **1** is lifted into P5+P6 (BL-25). Zero are pure N/A — every code-adapter BL finds a home in the config domain.

### 7.3 New config-specific BL (BL-C namespace — separate budget)

These 4 BL live in the config skin file ONLY. They do NOT add to the main 30-BL budget. They are loaded by the config domain adapter layer, not by META-Orchestrator's universal bootstrap.

**BL-C1: Config Activation is a Release Event (config adaptation of BL-2)**
- **Source:** Adapted from BL-2 for the config domain.
- **Rule:** Activating a production / staging / infrastructure config (deploying to the tool, triggering a reload, rolling a new IaC apply, flipping a feature flag in production) is a release event. It requires: a canary phase (apply to ONE instance / one region / one tenant first), a 15-minute monitoring window before full rollout, and a pre-written rollback plan (BL-C3). Major config activations MUST be announced in writing to all stakeholders whose systems depend on the configured tool.
- **Why:** Configs have unbounded blast radius — a broken production config can take down every downstream user of the service in the same instant the tool reloads. Canary + monitoring + rollback plan constrain the damage surface and give time for failure signals to manifest. The plugy precedent (`projects/plugy/config.md` autodeploy) applies: production configs deploy automatically, and automation without canary = immediate blast.
- **Applies to:** Visionary (approve activation), Builder (prepare canary), Validator (pre-activation gate at RT-2), META (enforce gate for production-tier configs).

**BL-C2: Parse + Secrets Scan Before Commit (config adaptation of BL-6)**
- **Source:** Adapted from BL-6 for the config domain.
- **Rule:** Before committing any config revision, Builder MUST (a) run the format-specific parser (yq for YAML, toml for TOML, jq for JSON, configparser for INI, per-format for ENV) and confirm exit code 0, (b) run the secrets scan (curated regex list from Section 4.2) and confirm zero non-placeholder hits, (c) run the schema validator if one exists (ajv, tool-specific validator) and confirm exit code 0. Commit is REJECTED if any of the three fails. The enforcement MUST be structural — a pre-commit hook is the canonical mechanism (BL-30 defense-in-depth).
- **Why:** A config file that "looks right" in the editor but fails the parser is the config equivalent of unverified code. A config file with an inline secret is a credential-exfiltration incident. Both fail modes are cheap to prevent (seconds per check) and expensive to recover (hours per parse-thrash; days per credential rotation). The canonical incident is Example 2 (OpenAI API key in `.env.example`): without BL-C2 the leak is caught at RT-2; with BL-C2 it cannot commit. Installing the hook is a one-time cost per project; skipping it is a per-commit gamble.
- **Applies to:** Builder (write hook, run checks), Validator (require proof of hook running), META (enforce gate), Coherent (verify hook exists in new projects).

**BL-C3: Rollback-Ready Before Activation (config adaptation of BL-14)**
- **Source:** Adapted from BL-14 for the config domain.
- **Rule:** Before a new config is declared ACTIVE in production or infrastructure, the author must document the rollback procedure: (a) which prior commit or config-store version is the restore target, (b) exact commands to restore (git revert + tool reload / config-store restore / IaC apply of prior version), (c) exact verification steps to confirm the restore worked (smoke test of the tool, health check, parse check of the restored file), (d) estimated time to complete the rollback (under 5 minutes for service configs, under 30 minutes for IaC). If the rollback procedure cannot be documented in 5 bullets, the config activation is NOT permitted — the ambiguity of rollback is itself a defect.
- **Why:** Under incident pressure (production is down, stakeholders are paging), cognitive load peaks and decision quality drops. A pre-written rollback plan executes mechanically when needed. Writing it beforehand also forces Builder to verify that rollback is actually possible — sometimes it surfaces that the prior config was NEVER saved anywhere (no git commit, no config store version, no backup) and the config is forward-only without Builder realizing. Better to catch that during planning than during an incident.
- **Applies to:** Visionary (approve rollback plan), Builder (write it), Coherent (store in project MEMORY.md), Validator (block activation if missing).

**BL-C4: Schema + Environment PRE-FLIGHT (config adaptation of BL-22)**
- **Source:** Adapted from BL-22 for the config domain.
- **Rule:** Before RT-1 begins on any config task, Analyst MUST verify: (a) the tool's current schema (not a stale copy from a prior version) is readable and parse-able — if the schema is machine-readable (JSON Schema, OpenAPI, protobuf), actually open it; if it's documentation, read the relevant section; (b) the schema version declared in the target config matches the tool's current expected schema version — mismatches at planning time save days of thrashing; (c) every env var / vault path / runtime injector referenced by the config actually exists in the target environment (not "we'll set it up later"); (d) every cross-config sibling (files that share resources with this config) is enumerated upfront. Produce a VERIFIED CONTEXT artifact (a table: schema | version | url/path | confirmed; env var | target env | confirmed; sibling config | shared resource | confirmed). Unverified context = Builder BLOCK (RED on A_F) at RT-1, Validator BLOCK at RT-2.
- **Why:** Hallucinating that a schema "probably has a `retries` key" is the top F=0 failure in config work — analogous to hallucinating an API endpoint in code work. Verifying the schema costs minutes; discovering a non-existent key mid-draft costs a full fix-chain. The eradev-self, plugy, academic-lab, and odtoe-articles live configs ALL declare their schema in the Notes section — this is empirical evidence of the BL-C4 discipline.
- **Applies to:** Analyst (RT-1 execution), Validator (RT-2 re-verification against current schema), Builder (refuse to start without artifact), META (enforce gate).

### 7.4 BL budget summary for the config skin

- Universal BL inherited: **22** (unchanged)
- Code-adapter BL that apply unchanged: **2** (BL-3, BL-24)
- Code-adapter BL with config equivalents: **4** (BL-2, BL-6, BL-14, BL-22 → BL-C1..C4)
- Code-adapter BL lifted into vocabulary row: **1** (BL-8 → vocab row 18)
- Code-adapter BL lifted into P-check: **1** (BL-25 → P5 + P6)
- Config-specific BL (BL-C namespace, separate budget): **4** (BL-C1..C4)

**Total BL a config agent carries: 22 universal + 2 transferred code-adapter + 4 BL-C = 28 BL.**

(BL-8 and BL-25 are still ACTIVE but carried via the vocabulary/P-check lifts, not as standalone entries. BL-8's insight — "every behavioral change in production regardless of mechanism is a deployment" — is preserved through vocab row 18 + BL-C1. BL-25's insight — "cover all failure paths" — is preserved through P5 + P6 interpretive gates.)

---

# SECTION 8 — Acceptance Criteria for the Skin File

The Builder must produce `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.config.md` satisfying ALL of the following:

### 8.1 Structural acceptance

- **[AS-1]** File exists at `templates/domain_skin.config.md`
- **[AS-2]** YAML-style header block (lines 1–12 approximately) matches the structure in Section 1.2 of this spec
- **[AS-3]** All 10 skin-template sections from `templates/domain_skin.md.template` are present:
  1. Header block
  2. Vocabulary Mapping (≥22 rows)
  3. Role Focus Overrides (5 sub-sections — one per role)
  4. Verification Protocol (parse, 7 sub-checks P1–P7, L1/L2 split, code/plan-skin analogy table)
  5. RT Phase Protocol (RT-0, RT-1 tier decision, RT-2, pipeline block)
  6. Checklists (Pre-Generation + Post-Generation, derived from Section 5 pipeline + Section 3 Jidoka + BL-C2 pre-commit)
  7. Examples (3 entries from Section 6 verbatim structure)
  8. Domain-Specific Bootstrap Lessons (22 universal + 2 transferred + 4 BL-C)
  9. Known Out-of-Scope (OOD)
  10. B-weight Adjustment (uniform 0.25×4 — no override; v10 `B_config` deferred note)
  11. Footer (last updated, upstream roles, upstream math, upstream BL, upstream live configs)
- **[AS-4]** Vocabulary table has ≥22 rows (22 from Section 2 of this spec, plus 0–5 Builder additions; rows 1–22 MUST NOT be deleted or renumbered)
- **[AS-5]** Role Focus Overrides has all 5 sub-sections, each with FIRST focus anchor, artifact definition, primary failure mode (+ secondary/tertiary for Builder and Validator), Jidoka specialization (3–7 questions)
- **[AS-6]** Verification Protocol section contains: (a) the block matching Section 4.4, (b) the 7 P check table (P1–P7), (c) the curated secrets-scan regex list from Section 4.2 verbatim (with placeholder whitelist), (d) the L1/L2 split note, (e) the code/plan-skin analogy table from Section 4.3
- **[AS-7]** Examples section has all 3 examples from Section 6 of this spec (YAML indent P1/P2; `.env.example` secret P3; port drift P6) with catching role + phase + fix clearly labeled; the structural elements (catching role, phase, fix) preserved verbatim, prose polishing allowed
- **[AS-8]** RT Phase Protocol section includes the RT-lite vs full 5-role decision tree from Section 5.2 verbatim
- **[AS-9]** Domain-Specific Bootstrap Lessons section references BOTH the 22 universal BL (inherited) AND the BL-C1..C4 additions, with the budget summary from Section 7.4 included
- **[AS-10]** Known Out-of-Scope section explicitly mentions: continuous runtime config tuning (autoscaler threshold streams, adaptive rate limiters that change every minute — flow, not text), live-mutable in-memory state (Redis/Consul keys that represent current state, not declarative spec), secret rotation *policy* (which is meta-config and fits, but the actual secret rotation *events* are runtime operations), AI-driven auto-configuration of hyper-parameters that change continuously during training. These are NOT config-skin-scope; escalate to Visionary RT-0 kill-switch.
- **[AS-11]** B-weight Adjustment section lists the `text` weights (F=0.25, E=0.25, (1-σ)=0.25, Λ=0.25) as DEFAULT with rationale from Section 1.1, AND mentions the v10 `B_config` hook as DEFERRED (cite `eradev.md` line 144)

### 8.2 Routing / operator acceptance

- **[AO-1]** When an operator loads a project's `config.md` with `domain.type: config` and `domain.skin: templates/domain_skin.config.md`, META routes all 5 spawned agents through the skin overrides.
- **[AO-2]** Backward compat: existing projects MUST NOT be required to change as a result of this skin being written. Projects without `domain.type: config` continue to work identically. Existing code-type projects that happen to edit configs continue to use the code skin.
- **[AO-3]** Pure-L1 fallback: a project WITHOUT `domain.skin` in its config continues to work identically. The config skin's existence must not affect projects that don't reference it.

### 8.3 Quality acceptance

- **[AQ-1]** No contradictions with `templates/domain_skin.md.template`. If Builder detects a contradiction, Builder ESCALATES to META.
- **[AQ-2]** No contradictions with the 5 role files. The skin adds focus, not replacement.
- **[AQ-3]** No contradictions with `templates/domain_skin.code.md` (both use `B_text` uniform weights).
- **[AQ-4]** No contradictions with the parallel `templates/domain_skin.plan.md` spec — verification letter prefixes do not collide (plan=DR, config=P), vocabulary load-bearing terms differ, BL namespaces differ (plan=BL-P, config=BL-C).
- **[AQ-5]** Every vocabulary row cites its source (role file line, BL file line, or live config file line) in the table.
- **[AQ-6]** Every BL-C1..C4 entry has Source / Rule / Why / Applies to fields (matching universal BL format).
- **[AQ-7]** File is syntactically valid Markdown (parses cleanly, no broken headers, no incomplete tables) — this is itself a P1 check on the skin file.
- **[AQ-8]** File is EN-only (this is the EN skin; an RU mirror is deferred to the Phase 2 BL-19 follow-up task covering all new skins together).

### 8.4 Size acceptance

- **[ASZ-1]** Total file length: **350–550 lines** of Markdown (per task prompt). This spec is ~900 lines; the skin file should be noticeably more compact because it is the PRODUCT, not the SPEC. Target: ~450 lines as a midpoint between code skin (172 lines, identity skin) and article skin (644 lines, full override skin).

---

# Hand-off Section — For the Builder

**Target file:** `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.config.md`

**Expected size:** 350–550 lines of Markdown (per AS-10 / ASZ-1 above; per task prompt).

**Structure to copy from `templates/domain_skin.md.template`:** The 10-section skeleton (header, Vocabulary, Role Focus Overrides, Verification, Checklists, Examples, BL, OOD, B-weight, Footer). Keep section order. Keep heading levels (`#` for top-level, `##` for skin sections, `###` for role sub-sections within Role Focus Overrides).

**What this spec GIVES you (do not re-invent):**
- Section 1 → fills the skin's header block exactly (1.2 verbatim)
- Section 2 → fills the skin's Vocabulary Mapping table exactly (all 22 rows, cited)
- Section 3 → fills the skin's Role Focus Overrides (5 sub-sections with prescribed Jidoka questions)
- Section 4 → fills the skin's Verification Protocol (block in 4.4 + 7-check table in 4.1 + curated regex list in 4.2 + L1/L2 split in 4.2 + analogy table in 4.3)
- Section 5 → fills the skin's RT Phase Protocol (RT-0/RT-1-tier/RT-2 structure + RT-lite decision tree + pipeline block)
- Section 6 → fills the skin's Examples section (3 entries verbatim structure from 6.1/6.2/6.3; prose polishing allowed)
- Section 7 → fills the skin's Domain-Specific Bootstrap Lessons section (22 universal + 2 transferred + 4 BL-C + budget summary)
- Section 8 → is the acceptance test for YOUR output (rubric, not content)

**What is FLEXIBLE (Builder discretion, within bounds):**
- **Vocabulary table: rows 23–27.** Builder MAY add 1–5 more rows if they find config-specific terms in SOPs, IaC modules, Kubernetes manifests, systemd unit files, shell rc files, or environment-variable files (`.envrc`). Builder MUST NOT delete or renumber rows 1–22.
- **Prose tone in the Role Focus Overrides.** The Jidoka Q1–Q7 lists in Section 3 are structured; Builder may reformat as bullets or nested tables as long as all questions are preserved verbatim in meaning.
- **Pre-Generation Checklist and Post-Generation Checklist wording.** Builder derives these from the Section 5 pipeline + Section 3 Jidoka questions + BL-C2 pre-commit requirement. Builder MAY combine or reorder, but MUST cover: schema read, existing sibling configs read, parser run, schema validator run, secrets scan run, dangling-ref scan run, cross-config consistency confirmed, precedence documented.
- **Examples prose.** Builder may edit wording of Section 6 examples for readability, as long as (a) the catching role, (b) the phase, and (c) the fix are preserved verbatim in meaning.
- **Known Out-of-Scope section.** Builder MUST include the 4 items from AS-10 but MAY add 1–3 more borderline cases (e.g., "dynamic type coercion in JSON—maybe", "tool-specific DSLs that aren't really configs like Jenkinsfile pipeline code").
- **Live reference configs line in header block.** Default list is the 4 live configs in this repo; Builder may substitute if a better canonical reference lands before skin-write time.
- **Curated secrets regex list.** Builder MUST include the list verbatim from Section 4.2 but MAY add 1–5 more patterns for credentials common in the project's ecosystem (Stripe keys, Slack tokens, etc.) — additions only, no removals.

**What is FIXED (Builder MUST preserve exactly):**
- `Type: config` / `Modality: text (uniform weights 0.25 / 0.25 / 0.25 / 0.25 — v8-compatible default)` / `Parent BL: BOOTSTRAP_LESSONS_universal.md` / `Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md` / `Verify method: parse`
- Section 3 overrides: each role's primary failure mode verbatim
- Section 4 P1–P7 table with exact L1/L2 assignments (P1, P3, P4 L1; P5, P6 L2; P2, P7 L1-if-schema-machine-readable / L2-otherwise)
- Section 4.2 curated secrets regex list verbatim (additions allowed, no removals)
- Section 5.2 RT-lite decision tree verbatim (every branch preserved)
- Section 6 examples: catching role + phase + fix preserved in meaning
- Section 7 BL table: the 22 universal BL list unchanged; the 4 BL-C entries with Source/Rule/Why/Applies-to fields; BL-8 lifted to vocabulary row 18; BL-25 lifted to P5+P6
- `B_text` weights: F=0.25, E=0.25, (1-σ)=0.25, Λ=0.25 (uniform, NO override — `B_config` is v10 deferred)

**Builder pre-write checklist:**
1. Read `templates/domain_skin.md.template` (reference structure)
2. Read this spec in full (you already did if you're here)
3. Read `templates/domain_skin.code.md` (identity-skin sibling — format reference)
4. Read `templates/domain_skin.article.md` (full override skin — style reference for Examples / BL tables)
5. Read `templates/domain_skin.plan.md` if the plan-skin Builder has already produced it — cross-check no collision on verification-letter prefix, BL namespace, or vocabulary load-bearing terms
6. Read the 5 EN role files if not already in context (skin references them)
7. Read the 4 live configs in `projects/*/config.md` (they are the empirical ground truth for the EraDev-shaped config — YAML fence inside Markdown, Notes section, `domain:` stanza)
8. Verify the 22 universal BL list matches `BOOTSTRAP_LESSONS_universal.md` before copying Section 7.1 table — do NOT rely on this spec alone (BL-29 enforcement)

**Builder post-write checklist:**
1. Run through AS-1..ASZ-1: is every item satisfied?
2. Markdown lint / parse: does `templates/domain_skin.config.md` render cleanly? (BL-C2 pre-commit gate equivalent applied to the skin file itself)
3. Read the file end-to-end once: do all sections flow, are all tables complete, are all references to other files correct?
4. Jidoka self-check per `roles/builder_EN.md`

**Do NOT do (out of scope for Builder):**
- Do NOT modify any project `config.md` (live project configs are L3 instances, not templates)
- Do NOT create other domain skins (`book`, `plan`, `research`) in parallel — those have their own specs and their own Builders
- Do NOT modify any role file
- Do NOT modify `BOOTSTRAP_LESSONS_universal.md` or `BOOTSTRAP_LESSONS_code_adapter.md`
- Do NOT run parse checks on actual project configs (Validator work, separate task)
- Do NOT create an RU mirror of the skin file (BL-19 follow-up task covering all new skins, not this one)
- Do NOT install the BL-C2 pre-commit hook in any real project (configuration change outside skin-write scope)
- Do NOT write a tool-specific schema (that's project work, not skin-template work)

---

# Open Questions (Spiral Gap, per BL-15)

- **OQ-P2A-config-1:** Should the skin's Section 4 include a dedicated sub-section for YAML-fenced-in-Markdown configs (the EraDev project config pattern), or is it sufficient to list it as a format variant in the P1 parse table? Current proposal: list it as a variant in P1 + mention it in the Vocabulary row 1, but do NOT create a dedicated sub-section — it's a format combination, not a different verification modality. Revisit if Builders find the nested-format case under-specified.

- **OQ-P2A-config-2:** The secrets scan regex list (Section 4.2) is curated but not exhaustive. Should the skin recommend a specific off-the-shelf tool (`trufflehog`, `gitleaks`, `detect-secrets`) for richer coverage, or stay tool-agnostic? Current proposal: stay tool-agnostic (list regex patterns in the skin) BUT name tools in a Footer / Tools note so Builders can swap in a richer scanner per project. Rationale: EraDev itself is not opinionated on secrets tooling, and not every environment has `trufflehog` installed.

- **OQ-P2A-config-3:** The RT-lite decision tree (Section 5.2) uses a simple "production? → full RT | pure-data small? → lite | else full" branching. Is this too coarse? Could a `env-local` dev-only config of 800 lines be safely lite? Current proposal: NO — line count is a proxy but not the only factor; the rule is "lite ONLY for pure-data, no secrets, no precedence, no cross-config, <50 lines." Anything failing ANY of those predicates uses full RT. Revisit if operators find a legitimate case for large-pure-data lite.

- **OQ-P2A-config-4:** The 7 P-checks are per-file. Should there be an 8th P-check for REPOSITORY-level config hygiene (e.g., `.gitignore` correctly excludes `.env`, no `.env` committed anywhere in history, no `.envrc` with secrets)? Current proposal: NO for v9 — this is an L4 supply-chain concern, not a per-config verification concern. Cross-config hygiene across history is a separate BL candidate for v10. For v9, P3 covers the current-commit surface and BL-13 Yokoten covers historical propagation.

- **OQ-P2A-config-5:** For YAML-fenced Markdown configs (the EraDev project config pattern), should the enclosing Markdown file also be subject to parse (Markdown lint) in addition to the YAML fence parse? Current proposal: YES — Markdown parse errors could break the fence extraction that downstream tools rely on. But this is a "Validator ALSO runs Markdown lint" side-requirement, not a separate P-check. Note in Section 4 P1 that Markdown-fenced configs require a 2-pass parse: outer Markdown + inner YAML.

- **OQ-P2A-config-6:** (deferred Hansei question for Phase 2.A closing gate) After the config Builder writes the skin and runs it through a smoke test, is the 7-check P sweep too heavy for small dev-local configs? If Builders report that RT-lite is too restrictive because even pure-data small configs "need all 7 checks to feel safe," this is a calibration defect in Section 5.2. Mark for post-smoke-test review, not for pre-write resolution.

---

# Jidoka Self-Check (Analyst, post-spec)

```
=== JIDOKA SELF-CHECK ===
B-diagnostics (text modality — uniform 0.25 weights, per eradev.md Section II.1 line 117):
  F (Focus):       0.90 — Read analyst_EN.md full; both sibling skins (code identity + plan spec); full domain_skin.article.md first+last thirds; template base; eradev.md II.1/II.2; both BL files; all 4 live configs; Phase 2.1 article spec head. All load-bearing references touched.
  E (Alignment):   0.90 — Spec addresses the exact prompt: 10 sections + Activation + Open Questions + Hand-off + Jidoka + cross-skin consistency; 7 P-checks with the 3 exact examples prescribed; BL-8 and BL-25 handled explicitly (lifted, not silently dropped); RT-lite / full 5-role split per task prompt.
  (1-σ) (Consistency): 0.88 — No contradiction with L0, Phase 0.A schema, code skin, plan spec, article skin, or BL files. Verification prefix P does not collide with plan's DR. BL-C namespace does not collide with BL-P. Vocabulary load-bearing terms differ from plan (KEY/SCHEMA/ENV-VAR vs STEP/DEPENDENCY). 2 code-adapter BL lifted into vocab + P-check (BL-8, BL-25) with explicit rationale. One minor σ watchpoint logged as OQ-P2A-config-6: the 7-check sweep MIGHT feel heavy in RT-lite and needs smoke-test calibration — flagged as OQ, not resolved.
  Λ (Experience):  0.90 — Applied BL-17 / BL-21 / BL-29 / BL-30 as critical-for-configs; honored Phase 2.1 and Phase 2.A plan spec precedent for BL-A/P namespace; reused the 4-column BL-C format (Source/Rule/Why/Applies); cited 4 live configs as empirical evidence for vocabulary + YAML-fence pattern + BL-C4 pre-flight discipline; referenced eradev.md line 144 B_config v10 hook directly.

B_text = 0.25·F + 0.25·E + 0.25·(1-σ) + 0.25·Λ
       = 0.25·0.90 + 0.25·0.90 + 0.25·0.88 + 0.25·0.90
       = 0.225 + 0.225 + 0.220 + 0.225
       = 0.895

B = 0.895 — GREEN (B ≥ 0.5, and min component 0.88 ≥ 0.3 — no ANDON)
```

**Andon status:** NONE. Spec is ready for Builder hand-off.

**Notes:**
- Used arithmetic-mean formulation `B_text = w_F·F + w_E·E + w_(1-σ)·(1-σ) + w_Λ·Λ` per the uniform-text-modality convention in the sibling `domain_skin.code.md` Example B-check lines 105–121 (`B ≈ F·0.25 + ...`). This is the v9 agent-level additive reading used in the live article Examples and plan spec — NOT the multiplicative-product form from Formula B in eradev.md Section II (which is a collective-level formula). The multiplicative form would give `0.90^0.25 · 0.90^0.25 · 0.88^0.25 · 0.90^0.25 ≈ 0.894` — practically identical for this component profile.
- All four components ≥ 0.88 — no weak link. Weak-Link Principle honored.
- The (1-σ) component is the lowest (0.88) because one cross-skin calibration concern was deliberately left open (OQ-P2A-config-6) rather than forced to resolution. Per BL-15 "honest open question > dishonest answer."

---

# Cross-Skin Consistency Confirmation (Phase 2.A closing gate precheck)

| Dimension | `plan` skin spec value | `config` skin spec value (this spec) | Collision? |
|---|---|---|---|
| `domain.type` | `plan` | `config` | No — distinct enum values |
| `B_modality` | `text` (uniform 0.25×4) | `text` (uniform 0.25×4) | No — both text, shared profile; this is DESIRED consistency, not collision |
| Parent BL inheritance | 22 universal only | 22 universal only | No — same spine |
| Verify letter prefix | `DR1–DR6` | `P1–P7` | No — distinct letter families |
| Number of sub-checks | 6 (DR1–DR6) | 7 (P1–P7) | No — different failure taxonomies warrant different counts |
| L1/L2 split | DR1/2/3/5 L1; DR4/6 L2 | P1/3/4 L1; P2/7 L1-if-machine; P5/6 L2 | No — each maps to its own verification modality |
| BL namespace | `BL-P1..P4` | `BL-C1..C4` | No — distinct prefixes |
| BL-C1..C4 vs BL-P1..P4 mapping | P1=release, P2=commit gate, P3=supersession, P4=external pre-flight | C1=release, C2=commit gate, C3=rollback, C4=schema/env pre-flight | PARALLEL structure, distinct content — both derive from BL-2/6/14/22 pattern. No collision. C3 (rollback) and P3 (supersession) cover different concerns (config has no "supersession" concept; plan has no "rollback-to-prior-version" mechanism in the same way) |
| Vocabulary load-bearing terms | STEP, DEPENDENCY, STAKEHOLDER, CONTINGENCY, PASS-CRITERION | KEY, SCHEMA, ENV-VAR, SECRET, PRECEDENCE, DANGLING-REF | Zero overlap on load-bearing terms. Shared abstract terms (artifact, commit, deploy, compile, runtime, spec, bug, refactor, review) map to different concrete meanings per skin. |
| Vocabulary row count | 22 rows | 22 rows | Same count (coincidence; both landed at 22 row budget) |
| RT phase protocol | RT-0 solo + RT-1 full + RT-2 full | RT-0 solo + RT-1 tier (lite OR full) + RT-2 tier (lite OR full) | No — both use same RT numbering; config adds tier selection; no collision |
| RT-lite clause | Mentioned but not elaborated (plan's exception: XL split-Builder only) | Explicit decision tree (5.2) | No collision — plan did not need RT-lite because plan work is always "non-trivial" by definition; config work spans trivial to critical, so tier selection is load-bearing for configs |
| Live reference | `reports/roadmap_v9_2026-04-11.md` (the v9 plan itself) | 4 live project configs (`projects/*/config.md`) | No collision |
| v10 future hook | `B_plan` (eradev.md line 144) mentioned as DEFERRED | `B_config` (eradev.md line 144) mentioned as DEFERRED | Same line of eradev.md, both deferred — consistent |

**Conclusion:** The config skin spec is STRUCTURALLY ALIGNED with the plan skin spec while MATERIALLY DISTINCT on every load-bearing axis (verification modality, vocabulary, failure taxonomy, BL additions, RT-lite clause). Phase 2.A closing gate Coherent will find no σ failures between the two.

---

*Last updated: 2026-04-11*
*Analyst: Phase 2.A config skin spec (parallel to book/plan/research siblings)*
*Target: `templates/domain_skin.config.md`, 350–550 lines*
*Next step: Builder spawn (separate task, not this Analyst's scope)*
*Upstream: `eradev.md` Section II.1 line 117 (B_text weights) + Section II.2 (v9 OOD scope) + Section II.1 line 144 (`B_config` v10 hook)*
*Siblings: `reports/v9_phase2_1_article_skin_spec_2026-04-11.md`, `reports/v9_phase2a_plan_skin_spec_2026-04-11.md`, `reports/v9_phase2a_book_skin_spec_2026-04-11.md`, `reports/v9_phase2a_research_skin_spec_2026-04-11.md`*
