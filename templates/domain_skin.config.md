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

## Purpose / When META Loads This Skin

META loads this skin when a project's `config.md` declares:
- `domain.type: config`
- `domain.skin: templates/domain_skin.config.md`

When loaded, the skin is passed to every spawned role agent in addition to the base role file `roles/{role}_EN.md`. It does NOT replace the role file — it provides a light vocabulary bridge, focus overrides, a heavily-expanded `parse` verification protocol (7 sub-checks P1–P7), RT phase adjustments including an explicit RT-lite tier, examples, and an inherited-vs-overridden BL table specific to configuration artifacts.

**Scope:** YAML, TOML, JSON, INI, `.env`, and Markdown-fenced configs (e.g., EraDev project configs with a `yaml` fence inside `.md`). Infrastructure-as-code manifests (Kubernetes, Terraform, Ansible, systemd units) and schema definitions fall inside this skin's scope as specializations of the general "schema-bound text" shape. See "Known Out-of-Scope" below for what does NOT.

---

## Vocabulary Mapping

The config skin performs a **LIGHT REWRITE with HEAVY verification expansion**. Unlike the `article` skin (wholesale vocabulary rewrite) and unlike the `code` skin (pure identity), configs sit in the middle: most abstract terms transfer directly from the text-modality spine, but the load-bearing definitions change around WHAT a unit is (key-value pair, not function), WHAT verification means (parse + schema + secrets + cross-config, not compile + test), and WHAT defects look like (syntax / schema / secret / dangling-ref / precedence / drift).

Every row below is GROUNDED: the "Where used (evidence)" column cites the role file, BL file, or live config where the abstract term appears.

| # | Abstract term (role file / BL) | Config meaning | Where used (evidence) |
|---|---|---|---|
| 1 | **artifact** | a single config file (`.yaml`, `.toml`, `.json`, `.ini`, `.env`, `.conf`), OR a stanza/block inside one, OR a key-value pair with its precedence context, OR a YAML-fenced code block inside a Markdown file | `analyst_EN.md` line 7 ("An 'artifact' is any discrete element..."); `projects/eradev/config.md` line 8 (yaml fence inside .md); `projects/plugy/config.md` line 17 (yaml fence inside .md) |
| 2 | **function** | a key-value pair — the smallest addressable unit of a config (`port: 3000`, `debug: true`, `DATABASE_URL=postgres://...`) | Analogous to `builder_EN.md` "smallest addressable unit"; `projects/plugy/config.md` line 19 shows `type: code` as the canonical key-value shape |
| 3 | **module / file** | a config section or stanza — a named block of related keys (`domain:` in `projects/*/config.md`, `[server]` stanza in TOML, top-level object in JSON) | `projects/odtoe-articles/config.md` lines 9-34 (`domain:` stanza); `projects/eradev/config.md` lines 9-34 (`domain:` stanza) |
| 4 | **API / API endpoint** | schema definition / interface contract — the declared shape a config must match (JSON Schema, OpenAPI spec, protobuf, the tool's documented keys, or an implicit contract the tool expects) | `analyst_EN.md` Responsibilities 3 ("Interface design"); code-adapter BL-22 PRE-FLIGHT — the config analog is "verify schema BEFORE writing" |
| 5 | **test / tests pass** | parse + schema validate + secrets scan + dangling-ref scan — all mechanical checks return 0 | `validator_EN.md` Key Rules; Section 4 of this skin |
| 6 | **verify** | run P1 + P2 + P3 + P4 — the 4 mechanical sub-checks from Section 4 | `analyst_EN.md` line 24 (verify = domain-substituted check) |
| 7 | **validate** | run all 7 parse sub-checks (P1–P7), including the interpretive P5–P6 | `validator_EN.md` line 7 (validation = "run the checks") |
| 8 | **build / compile** | parse — the config file is read by the tool's parser without syntax error, OR if YAML-in-Markdown, the fenced block parses cleanly as YAML | Analogous to code skin's `build`; `projects/eradev/config.md` line 15 (`verify.method: build` — proxy for "markdown parses + shell script parses") |
| 9 | **runtime** | tool load time / startup validation time — the moment the target tool reads the config and may reject it; blast-radius proxy for production impact | `builder_EN.md` Key Rules 4 ("blast radius"); a tool restarting with a bad config affects every downstream user in the same window |
| 10 | **spec / specification** | the SCHEMA — the tool's documented or machine-readable description of what keys are allowed, required, or forbidden (JSON Schema `$schema`, OpenAPI contract, protobuf `.proto`, Kubernetes CRD, systemd man-page) | `analyst_EN.md` "Implementation Plan" output format; code-adapter BL-22 "verified endpoints artifact" maps to "verified schema artifact" |
| 11 | **bug / defect** | syntax error OR schema violation OR dangling reference OR inline secret OR precedence conflict OR cross-config drift — the 6 config-specific failure classes | `validator_EN.md` line 20 ("B-diagnostics of defects"); direct analog of "code doesn't compile" |
| 12 | **refactor** | restructure config hierarchy — reorganize stanzas, split one file into many, promote inline values to references, without changing the effective configuration | `builder_EN.md` Key Rules 7 (refactor = restructure without semantics change) |
| 13 | **code review** | schema audit + secrets scan — a reviewer confirms keys match the schema, no inline credentials are present, no dangling references remain | Analogous to `visionary_EN.md` Example 2 (peer review); BL-30 defense-in-depth |
| 14 | **PR / pull request** | a proposed config revision submitted for RT review — a delta on a prior config, or a fresh config for a new tool/service | `builder_EN.md` Decision-Point Checklist |
| 15 | **commit** | a signed-off config revision that has passed parse + schema + secrets scan and is ready to be loaded by the tool | All 4 live project configs are committed Markdown with YAML fences |
| 16 | **deploy / push to prod** | hot-reload OR service restart OR re-parse-on-next-read — for IaC: `terraform apply` / `kubectl apply`; for service configs: SIGHUP / restart; for env files: next process spawn | Analogous to code skin "deploy"; `projects/plugy/config.md` lines 34-36 (autodeploy picks up config changes) |
| 17 | **production** | the currently-loaded config the running tool is using — may DIFFER from the file on disk if the tool has not been reloaded since the last edit | `validator_EN.md` Key Rules 4 (revert = postmortem); the "loaded state" vs "file state" distinction is config-specific and matters for verification |
| 18 | **feature / feature flag** | a config-level toggle — a boolean or enum key that gates behavior (`enabled: true`, `mode: strict`, `feature_flags.new_ui: on`). **BL-8 applies DIRECTLY**: config flags ARE the deployment mechanism — every behavioral change in production is a release event regardless of whether the tool has a "feature flag" concept | `builder_EN.md` Key Rules 6 ("feature flags / staged rollouts = release event"); code-adapter BL-8 lifted here |
| 19 | **smoke test** | 2-minute header pass — run the parser, read the first 10 lines, confirm (a) correct format identifier, (b) required top-level keys, (c) schema version declaration. A coarse completeness check before the full parse sweep. | Analogous to `validator_EN.md` Key Rules 5 ("stale output detection") |
| 20 | **glossary / canonical terms** | the tool's key naming conventions — the canonical vocabulary the tool expects (`host` not `hostname`, `port` not `port_number`, `timeout` not `timeout_ms`). BL-29 applied to configs | `BOOTSTRAP_LESSONS_universal.md` BL-29 ("verify established terminology before generating") |
| 21 | **rollback / revert** | restore the prior config — via VCS (git revert), via a versioned config store (Consul KV, etcd, AWS Parameter Store versioning), or via a saved backup. If the tool was reloaded with the bad config, rollback also requires a second reload | Analogous to code-adapter BL-14; config-specific adaptation at BL-C3 below |
| 22 | **canary / staged rollout** | partial rollout — apply the new config to ONE instance / ONE service / ONE environment first, monitor for failure, then roll to the remaining fleet. For multi-tenant configs: one tenant first. For multi-region: one region first | Analogous to code-adapter BL-2; config-specific adaptation at BL-C1 below |

**Unified with the live reference configs — CRITICAL for Builder/Validator:**
The 4 live reference configs (`projects/eradev/config.md`, `projects/plugy/config.md`, `projects/academic-lab/config.md`, `projects/odtoe-articles/config.md`) all use the YAML-fenced-in-Markdown pattern. This is the canonical shape for EraDev project configs. The skin is GENERAL for configs — standalone YAML/TOML/JSON files are equally in scope — but the nested format is the empirical reference. Every live config also carries a `## Notes` section explaining the rationale for field choices — this is a structural pattern the skin recommends for non-trivial configs.

If an agent detects a contradiction between this skin's Role Focus Overrides and the vocabulary table above, **the vocabulary table WINS** and the agent must escalate to META before proceeding. If an agent detects a contradiction between this skin and a live reference config, the agent flags it as an Open Question in the output, not silently resolves it.

---

## Role Focus Overrides

Each role retains its Activation Operator (A_F, A_E, A_σ, A_Λ) and Jidoka self-check from `roles/{role}_EN.md` **unchanged**. The skin adds DOMAIN-SPECIFIC focus anchors, artifact definitions, failure modes, and Jidoka specializations for config-authoring.

### Visionary (config focus)

- **FIRST focus anchor (A_F override):** Read the operator's ORIGINAL request verbatim. Identify WHAT is being configured (which tool / subsystem / environment), WHICH environment the config targets (dev, staging, prod, per-developer local), and WHAT the secrets policy is (inline forbidden → reference vault / env vars / GitHub Secrets). True North = *what tool-plus-environment does this config serve, and what is its secrets policy?* Visionary's output is a single paragraph: tool + environment + schema version + secrets policy.
- **What the role considers "the artifact":** The config's PURPOSE — the tool it serves, the environment it targets, the schema version it commits to. NOT the keys (that's Analyst), NOT the file (that's Builder). At RT-0 Visionary speaks at the level of "this config sets up service X for environment Y at schema version Z, secrets are stored at vault path W."
- **Primary failure mode:** Approving a config without naming the SCHEMA VERSION it targets. A config "for package.json" without naming the npm schema version is a v1-vs-v2 time bomb waiting for the next tool version bump. Mitigation: Visionary's output MUST include a schema version declaration (or explicit "no schema — tool uses duck typing" note), otherwise the plan does not proceed to RT-1.
- **Secondary failure mode:** Approving a config for production without verifying the secrets policy (inline vs vault vs env var). Inline secrets in prod = immediate credential-rotation incident.
- **Jidoka self-check (config specialization):**
  - Q1: Is the target tool + target version NAMED (not "some YAML config", but "npm schema v7 for package.json")? If no → YELLOW on E, escalate before RT-1.
  - Q2: Is the target environment explicit (dev / staging / prod / local-override)? An environment-ambiguous config is a precedence time bomb.
  - Q3: Is the secrets policy declared? (inline = NEVER-for-prod; env var = OK; vault reference = preferred for prod). If "we'll figure it out later" = RED on 1-σ, block RT-1.
  - Q4: Is the config's purpose discrete (a specific file or stanza) or continuous (live-tuned parameters that change every minute)? Continuous = OOD, route to `continuous` scope and reject.

### Analyst (config focus)

- **FIRST focus anchor (A_F override):** Read the TOOL SCHEMA (documented or machine-readable — JSON Schema, OpenAPI, protobuf, CRD, `.proto`, man-page). Read EXISTING configs in the project that target the same tool (BL-29 — re-use established key names and stanza shapes). Read the precedence chain for this config class (defaults → system → environment → project → user). THEN enumerate required vs optional keys. Primary artifact is the KEY ENUMERATION TABLE + the PRECEDENCE MAP + the cross-config dependency list.
- **What the role considers "the artifact":** A structured plan with the 9 required parts in the Deliverable Template below. Anything short of these 9 parts is incomplete for config work.
- **Primary failure mode:** Building a "correct looking" config without reading the schema — keys are plausible but not valid for the target version (e.g., `memory: 512M` when the schema requires `memory: "512Mi"`, or `maxAge: 3600` when the schema requires `maxAgeSeconds: 3600`). This is BL-21 (format-first) + BL-29 (terminology) + BL-17 (pre-generate verification) all at once. Mitigation: Jidoka Q1 scores A_F = 0.0 (Andon) if the schema was not read before drafting the key enumeration.
- **Secondary failure mode:** Hallucinating a schema — "I assume this tool has a `retries` key" — without verifying.
- **Jidoka self-check (config specialization):**
  - Q1: Have I READ the schema for the target tool + version? If no → A_F = 0.0 → Andon. Cite the schema file or URL.
  - Q2: Does my key enumeration match the schema verbatim (no renamed keys, no inferred keys, no deprecated keys from a prior version)? (1-σ)
  - Q3: For every key marked as a secret, have I specified its SOURCE (vault path / env var name / runtime injector)? Inline secret values = RED on E.
  - Q4: For every cross-config dependency, have I specified which OTHER config files must update in lockstep? (BL-9 interface contracts)
  - Q5: Is the precedence map explicit (which layer the config sits in + which keys it overrides from lower layers + which keys higher layers override from it)? Without this, P5 precedence sanity in Validator will fail.

- **Deliverable template (config-specific — Analyst MUST produce all 9 parts):**
  ```
  ## Config Plan (Analyst output for configs)
  1. Tool: [name]
  2. Schema: [name, version, validator, URL or path]
  3. Environment: [dev/staging/prod/local]
  4. Precedence layer: [defaults | system | env | project | user]
  5. Required keys:
     key | type | default | notes
     ...
  6. Optional keys:
     key | type | when-to-use | default if omitted
     ...
  7. Forbidden keys (deprecated in this schema version):
     key | replaced by | reason
     ...
  8. Secrets:
     key | source (vault/env/injector) | rotation policy
     ...
  9. Cross-config dependencies:
     other-file | shared resource | must agree on
     ...
  Dangling-ref targets:
     env var name | expected source | fallback (if any)
     ...
  Known OOD: [what NOT to put in this config class]
  Open Questions: [BL-15 spiral gap]
  B-check: F=_ E=_ (1-σ)=_ Λ=_ → B=_
  ```

### Builder (config focus)

- **FIRST focus anchor (A_F override):** Read the Analyst plan verbatim. Read the tool schema Analyst cited (verify it matches the version). Read EXISTING project configs for the same tool (for format reference — indent style, key ordering conventions, comment conventions). Then write the config. Do NOT polish prose (there is no prose in a config) — polish STRUCTURE: consistent indentation, consistent key ordering, inline comments where the tool supports them (YAML `#`, TOML `#`, JSON does NOT support comments).
- **What the role considers "the artifact":** The single config file (`.yaml`, `.toml`, `.json`, `.ini`, `.env`, or YAML-fenced Markdown block). The artifact is NOT a draft in the chat thread — it is a SAVED FILE at a canonical path that passes the parser. Builder must NOT mark Done until the file exists and parses cleanly.
- **Primary failure mode:** Silently committing inline secrets. Builder copy-pastes a working example from stackoverflow that includes a real API key, polishes it, commits it, and now the repo has a credential exfiltration problem. Mitigation: Jidoka Q4 runs the P3 secrets scan BEFORE marking Done, and BL-C2 pre-commit hook enforces it structurally.
- **Secondary failure mode:** Indent drift — mixed tabs and spaces, or the wrong nesting depth. This is a P1 parse failure caught downstream, but Builder should catch it at write-time.
- **Tertiary failure mode:** Duplicate keys — YAML technically permits duplicate keys in some parsers (last-wins) but schemas usually reject them. Builder must ensure no duplicate top-level or nested keys.
- **Fourth failure mode:** Environment variable typos that resolve to empty strings silently (`${DATBASE_URL}` instead of `${DATABASE_URL}` — the tool sees an empty string and may start in degraded mode without erroring).
- **Jidoka self-check (config specialization):**
  - Q1: Have I read the Analyst plan's key enumeration in full? (F)
  - Q2: Does every key I wrote exist in the schema Analyst cited, with the exact name + type? (E)
  - Q3: Does the file parse cleanly in the target format (YAML/TOML/JSON/INI/ENV)? (BL-C2 pre-commit gate)
  - Q4: Does the file pass the secrets scan — no inline passwords / API keys / tokens / private keys? (1-σ — P3)
  - Q5: Are there any duplicate top-level or nested keys?
  - Q6: Does every `${VAR}` / `$VAR` / `<ref:...>` reference resolve to a defined source? (P4)
  - Q7: Does the indent style match the project's existing configs (2 spaces / 4 spaces / tabs — pick one, stick to it)? (Λ — BL-29)

### Validator (config focus)

- **FIRST focus anchor (A_F override):** Read the Analyst plan + Builder's polished config file. Run all 7 parse sub-checks from Section 4 (P1–P7). Validator does NOT skip any — each catches a specific failure mode, and parse in aggregate is the gate.
- **What the role considers "the artifact":** The config file AS THE TOOL WILL SEE IT — including the layered precedence chain (defaults → envs → project → user) in the environment where it will run. Validator simulates the tool at the highest-stakes moment: the instant it loads the config during a cold start or a hot reload. If the tool is a schema validator itself (Kubernetes API server, npm, pip), Validator may actually run the real validator.
- **Primary failure mode:** Running P1 alone and declaring PASS while the config has schema violations, inline secrets, or cross-config drift. P1 catches syntax errors but NOT the other 6 failure classes. Validator MUST run ALL 7 P-checks. This is the distinction between `verify.method: parse` (the PRIMARY label) and the FULL validation gate (all 7 P sub-checks). BL-17 + the 7-check structure together prevent this failure.
- **Secondary failure mode:** Trusting Builder's schema citation without re-verification. Builder may have read the wrong schema version (v7 when the tool is on v8). Validator re-verifies the schema version declaration against the tool's actual expected schema and re-runs P2 with the correct schema.
- **Tertiary failure mode:** Validator runs the schema validator but IGNORES its warnings (only checks exit code). Warnings in schema validators are often the first signal of a deprecated key that will become an error in the next version. Validator must ALSO read the warning list and flag deprecated keys.
- **Jidoka self-check (config specialization):**
  - Q1: Have I run all 7 P checks, not just P1 (parse)?
  - Q2: Have I confirmed the SCHEMA VERSION declaration in the config matches the tool's current expected schema version? (P7)
  - Q3: Have I captured the schema validator's WARNINGS (not just errors) and flagged any deprecated keys? (proactive P2)
  - Q4: Have I scanned the file for inline secrets using the curated regex list from Section 4.2? (P3)
  - Q5: Have I resolved every env var reference against the target environment's env file? (P4)
  - Q6: If this config has cross-config siblings (package.json + Dockerfile + docker-compose), have I verified same-resource values agree? (P6)
  - Q7: If the tool supports precedence layering, have I checked that precedence rules are unambiguous for every key? (P5)

### Coherencer (config focus)

- **FIRST focus anchor (A_F override):** Read the full config + any cross-config siblings in the project + the project glossary (BL-29). Coherencer cares about *this config's fit with its siblings and with the project's established conventions*, not just the config in isolation.
- **What the role considers "the artifact":** The config + (all other configs it interacts with in the same project) = config system. Coherencer checks that the CURRENT config (a) uses the same key naming conventions as its siblings, (b) agrees with its siblings on shared-resource values (ports, versions, endpoints), (c) declares the same schema version if it's from the same tool family, and (d) uses the project's established precedence layering.
- **Primary failure mode:** "Terminology drift across configs" — one config calls a key `hostname`, another calls it `host`, another calls it `server_host`. Or: one config uses `port: 3000` (integer) while a sibling uses `port: "3000"` (string). These are silent contradictions that may not break parse (each file parses independently) but break the system when the two configs are combined.
- **Secondary failure mode:** Phantom coherence — every config looks independently valid, every schema is honored, but the configs disagree on what the system IS. Example: `package.json` says `"version": "2.1.0"`, `pyproject.toml` says `version = "1.9.3"`, both parse, both schemas valid, but the project has two conflicting version declarations and the release pipeline picks one silently.
- **Tertiary failure mode:** Cross-config dangling references — config A references env var `DATABASE_URL` and config B references env var `DB_URL`; neither file is wrong in isolation, but the two configs cannot be in the same deployment without also having an alias table.
- **Jidoka self-check (config specialization):**
  - Q1: Does every config in the project use the same key naming convention (snake_case / camelCase / kebab-case)? Mixed is a σ failure. (BL-29)
  - Q2: For every shared resource (port, version, endpoint, hostname), do ALL configs that reference it agree on the value AND the type? (1-σ — P6)
  - Q3: Does every config declare the same schema version (when from the same tool family)? (P7)
  - Q4: For each piece of project identity (name, version, description), do all configs that declare it agree verbatim?
  - Q5: Are env var references consistent across configs (same name, same expected source, same fallback)?
  - Q6: Independent spot-check — pick 3 keys at random from this config, grep the project for the same key name in other configs, check that values agree when they should.

**Cross-config consistency rule (BL-C4 enforcement):** Coherencer is the ENFORCER of the cross-config consistency protocol. Commit is BLOCKED if P6 (cross-config consistency) fails for any shared resource.

---

## Verification Protocol (`parse` expanded)

The skin's verification section maps directly to `domain.verify.method: parse`. Parse is expanded into 7 concrete sub-checks (P1–P7), split into L1 (mechanical, per-commit) and L2 (interpretive, pre-activation / pre-deploy).

### The seven parse sub-checks

| # | Check | What it catches | Who runs it | L1 or L2 | Mechanism |
|---|---|---|---|---|---|
| **P1** | **Parse syntax** — the file parses cleanly in its declared format (YAML / TOML / JSON / INI / ENV / Markdown-fenced) without a fatal parser error | Indentation errors, missing commas, unclosed quotes, mixed tabs/spaces, stray commas in JSON, unescaped colons | Validator | **L1** | Mechanical — run the canonical parser (`yq . file.yaml`, `toml parse`, `jq . file.json`, per-format for INI/ENV); non-zero exit = FAIL |
| **P2** | **Schema validation** — the file passes the declared schema (JSON Schema, OpenAPI, protobuf descriptor, Kubernetes API validator, or tool-specific validator like `npm install --dry-run` / `docker-compose config`) | Unknown keys, wrong types, missing required keys, deprecated keys (if validator reports them), out-of-range values | Validator | **L1** (formal schema) / **L2** (duck-typed — judgment) | Mechanical if schema exists; interpretive otherwise |
| **P3** | **Secrets scan** — no inline credentials appear as literal values; all credentials are references to env vars / vault paths / secret stores | Accidental `api_key: "real-key-here"`; `.env.example` with real values; embedded JWTs; PEM blocks | Validator + Coherencer | **L1** | Mechanical — curated regex list (see 4.2); any non-placeholder hit = FAIL |
| **P4** | **Dangling reference resolution** — every `${VAR}`, `$VAR`, `<ref:key>`, `%(key)s`, or tool-specific interpolation resolves to a defined source in the target environment, OR has an explicit fallback | Typos in env var names (`DATBASE_URL` vs `DATABASE_URL`); references to secrets not present in the vault; orphan placeholders; missing fallback values | Validator | **L1** | Mechanical — grep for interpolation patterns, diff against the target env file / vault manifest |
| **P5** | **Precedence sanity** — when multiple layers (defaults / env / project / user) define the same key, the precedence rule is unambiguous and documented; no key is set in two layers with different values without explicit override annotation | Silent overrides where the lower layer's value is shadowed by a higher layer without the operator realizing; "why isn't my setting taking effect?" confusion | Validator | **L2** | Interpretive — requires reading the precedence rules and reasoning about which layer wins for each key |
| **P6** | **Cross-config consistency** — when 2+ configs describe the SAME resource (service port in app config == Dockerfile EXPOSE == docker-compose port mapping; package version in package.json == pyproject.toml == CHANGELOG.md), the values agree exactly | Port drift; version drift; endpoint drift; hostname drift; credential source drift | Coherencer | **L2** | Interpretive — requires enumerating shared resources per project and confirming all references agree |
| **P7** | **Schema version alignment** — the schema version declared in the file matches the actual keys used; no v1 keys in a v2 file; no deprecated keys in the current version | Tool-version upgrade defects; copy-pasted older configs; "it worked on the old version" regressions | Validator | **L1** (version machine-checkable) / **L2** (non-machine-readable) | Mechanical when the schema exposes version; interpretive otherwise |

### L1 (mechanical) vs L2 (interpretive) split

- **L1 (mechanical, per-commit):** P1, P2 (when schema formal), P3, P4, P7 (when version machine-checkable). These should run on EVERY config revision commit — ideally as a pre-commit hook (BL-C2 below makes this a structural requirement).
- **L2 (interpretive, pre-deploy):** P5, P6, and the fallback variants of P2/P7 when schemas are duck-typed. These require thoughtful reading and run once before the config is declared ACTIVATED / DEPLOYED.

### Secrets scan (P3) curated regex list — include verbatim in every config-skin use

```
- Generic password/secret pattern:  (password|passwd|pwd|secret|api_key|apikey|access_key|private_key|token|auth|credential)\s*[:=]\s*["']?[^\s"'{}$<>]{8,}["']?
- AWS access key:                    AKIA[0-9A-Z]{16}
- AWS secret key:                    (?<![0-9A-Za-z])[0-9a-zA-Z/+]{40}(?![0-9A-Za-z])
- GitHub token:                      ghp_[0-9A-Za-z]{36,}  |  gho_[0-9A-Za-z]{36,}  |  ghs_[0-9A-Za-z]{36,}  |  ghr_[0-9A-Za-z]{36,}
- OpenAI / Anthropic key:            sk-[A-Za-z0-9]{32,}  |  sk-ant-[A-Za-z0-9]{32,}
- Private key block:                 -----BEGIN (RSA |DSA |EC |OPENSSH )?PRIVATE KEY-----
- JWT token:                         ey[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}
- Bearer token:                      [Bb]earer\s+[A-Za-z0-9_\-\.=]{20,}
```

**Placeholder whitelist** (hits matching these are NOT failures): `xxxxxxx`, `<your-api-key-here>`, `<your-api-key>`, `REPLACE_ME`, `REPLACE_ME_WITH_YOUR_KEY`, `${VARIABLE}`, `${ENV_VAR}`, `CHANGE_ME`, `your-secret-here`, `example-token`, `dummy-value`. Projects MAY add placeholder tokens to this list in their own `config.md` but MUST NOT remove any. Projects MAY add additional regex patterns (Stripe keys `sk_live_...`, Slack tokens `xox[baprs]-...`, etc.) — additions only, no removals.

### Relationship to the code-skin `build` and plan-skin `dry_run`

The code skin's `verify.method: build` checks "does the code compile + test + lint?" The plan skin's `verify.method: dry_run` checks "can a reader execute the plan?" The config skin's `verify.method: parse` checks "can the tool load the config without error?" — a direct and distinct verification modality. A Builder coming from code should think of `parse` as "compile + lint + security scan + cross-file consistency check, all fused."

| Code skin check | Plan skin analog | Config skin analog |
|---|---|---|
| `compile` (does it typecheck?) | DR1 + DR2 (do steps make sense without gaps?) | **P1 + P2** (does the parser accept it + does the schema accept it?) |
| `test` (do unit tests pass?) | DR3 + DR5 (resources named + criteria measurable?) | **P3 + P4** (no inline secrets + no dangling refs?) |
| `lint` (style violations?) | DR6 + BL-29 glossary scan (terminology consistent?) | **P7 + BL-29 glossary scan** (schema version aligned + key names consistent?) |
| `integration tests` (modules cooperate?) | DR4 (phases cooperate at handoffs) | **P5 + P6** (precedence sane + cross-config consistent?) |

### Verification block (paste into agent prompts)

```
method:           parse
command:          L1 checks (P1, P2-formal, P3, P4, P7-machine-readable) are mechanical.
                  Concrete commands per format:
                    YAML:   yq . "$FILE"
                            + schema: yq eval -P . "$FILE" | ajv validate -s schema.json -d -
                            (fallback: python -c "import yaml; yaml.safe_load(open('$FILE'))")
                    TOML:   python -c "import tomllib; tomllib.load(open('$FILE','rb'))" (py>=3.11)
                            or: toml parse "$FILE"
                    JSON:   jq . "$FILE" (+ ajv validate -s schema.json -d "$FILE")
                    INI:    python -c "import configparser; c=configparser.ConfigParser(); c.read('$FILE')"
                    ENV:    grep -vE '^\s*(#|$)' "$FILE" | grep -nvE '^[A-Za-z_][A-Za-z0-9_]*=.*$'
                            (any hit = parse fail)
                    YAML-fenced in Markdown:
                            extract fence with: awk '/^```yaml$/,/^```$/' "$FILE"
                            pipe into the YAML parser above
                            ALSO run Markdown lint on the outer file (2-pass parse)
                  Secrets scan (P3):
                    grep -inE '<curated regex list from Section 4.2>' "$FILE"
                    (any hit not matching placeholder whitelist = FAIL)
                  Dangling-ref scan (P4):
                    grep -oE '(\$\{[A-Z_]+\}|\$[A-Z_]+|<ref:[^>]+>)' "$FILE" \
                      | sort -u \
                      | while read ref; do diff against target env file / vault manifest; done
                  L2 checks (P5, P6, P2-duck-typed, P7-non-machine-readable) are interpretive
                  and require a human / agent reader.
success criteria: ALL 7 P checks PASS — parser accepts the file AND schema validator accepts
                  the file AND secrets scan returns zero non-placeholder hits AND all dangling
                  refs resolve AND precedence is documented AND cross-config consistency
                  holds AND schema version aligns with keys used.
failure recovery: specific per check —
                  P1 fail -> fix syntax (re-indent, escape quotes, fix commas)
                  P2 fail -> remove unknown keys, add required keys, fix types, upgrade schema
                             if keys are from newer version
                  P3 fail -> move secret to vault/env var, replace inline value with reference,
                             rotate the leaked credential if the file was ever committed, grep
                             history for other leak sites (BL-13 Yokoten)
                  P4 fail -> fix env var typo, add fallback value, or declare the env var as
                             required in the deployment manifest
                  P5 fail -> document the precedence rule explicitly, annotate overrides, or
                             remove the duplicate key from the lower-precedence layer
                  P6 fail -> unify values across all configs; make the canonical value live in
                             ONE place and reference it from the others
                  P7 fail -> upgrade deprecated keys to current schema, or downgrade schema
                             version declaration to match actual keys used
independence check: Validator runs parse checks on the FILE AS COMMITTED, not on Builder's
                    in-progress draft. The schema validator runs with the SAME VERSION of the
                    schema the tool will actually use in production, not Builder's local copy.
                    For cross-config P6, Validator reads SIBLING configs fresh from disk, not
                    from Builder's summary. Phantom coherence detection (BL-5) applied to
                    configs: if Builder and Validator both say PASS but neither actually ran
                    the parser or the schema validator, flag PHANTOM PARSE. BL-C2 pre-commit
                    gate makes this impossible in the normal path.
```

---

## RT Phase Protocol for Configs

Code projects use the canonical phase protocol from `eradev.md` Section VI (Visionary → Analyst → Builder → Validator → Coherencer). Configs need adjustments because the work profile is different: config work is often small; schemas are the primary spec; secrets are a structural concern that can justify full RT even for tiny files.

### RT invocation points

1. **RT-0 (Visionary solo, RECOMMENDED): purpose capture + secrets policy + schema version.** Before any RT-1. Runs when the operator proposes a new config or a major revision. Visionary alone evaluates: what tool, what environment, what secrets policy, what schema version. A YES from Visionary unlocks RT-1. Output is a single-paragraph decision.
2. **RT-1 (tier-dependent — full 5-role OR RT-lite 3-role): decomposition + write + validate.** Produces the Analyst key enumeration + Builder's written config + Validator's P1–P4 + P7 pass + Coherencer's cross-config scan. Tier choice depends on config size + stakes (see decision tree below). Builder does NOT release the config until RT-1 approves.
3. **RT-2 (mandatory for production/infra configs, optional for dev-local): pre-deploy gate.** Before the config is declared ACTIVATED (deployed to the tool, loaded into production, merged to main). Runs the full 7-check parse sweep including interpretive P5–P6, BL-29 glossary scan, and secrets re-scan from a clean checkout.

### RT-lite vs full 5-role — size and stakes decision tree

Not every config needs a 5-role RT. A 20-line dev-local `.env` file with no secrets and no precedence interaction is over-engineered at full RT. But a 200-line Kubernetes deployment manifest with secrets, precedence, and cross-config coupling is catastrophically under-engineered at RT-lite.

```
IS the config production or infrastructure?
  production / staging / IaC / secrets file / deploy manifest / CI secrets
    -> FULL 5-ROLE RT always (regardless of size)

IS the config small (<50 lines) AND pure-data (no secrets, no precedence, no cross-config)?
  yes -> RT-lite (3 roles): Visionary + Builder + Validator
         skip Analyst (Builder absorbs the schema-read duty)
         skip Coherencer (no cross-config surface)

IS the config medium (50-200 lines) OR has secrets OR has precedence?
  yes -> FULL 5-role RT

IS the config large (>200 lines) OR touches multiple tools OR has multi-layer precedence?
  yes -> FULL 5-role RT with mandatory RT-2 pre-deploy
```

**RT-lite rules when applied:**
- Visionary RT-0 still mandatory — needed for schema version + purpose
- Analyst skipped — Builder's own Check-First (BL-17) absorbs the schema read
- Validator still runs all 7 P checks (parse is still the load-bearing gate)
- Coherencer skipped — but the cross-config scan is REPLACED by a Builder self-check ("no sibling configs reference the same resource")
- If ANY P5/P6 concerns surface during Validator's pass, RT-lite ESCALATES to full RT-1

**Single Builder vs split:** Single Builder for S/M/L configs. Exception: XL multi-tool configs (e.g., a mono-repo config.yaml that drives both a Go service and a Python service via different sections) — Analyst may split work across two Builders by tool boundary (File Ownership rule from `analyst_EN.md` Responsibility 4). Coherencer gate is MANDATORY between Builder completion and Validator RT-2 to catch cross-tool drift.

### Pipeline block

```
Config pipeline (FIXED):
RT-0 (Visionary solo, RECOMMENDED) -> purpose + environment + secrets policy + schema version
Tier decision                       -> RT-lite (S dev-local pure-data) OR full 5-role (else)
RT-1 (tier-dependent)               -> Analyst key enumeration (skip if RT-lite)
                                    -> Builder writes config
                                    -> Validator runs P1-P4 + P7 (L1 mechanical)
                                    -> Coherencer runs cross-config scan (skip if RT-lite)
Pre-commit gate (BL-C2)             -> parser + secrets scan runs automatically
RT-2 (mandatory prod/infra, optional dev-local) ->
                                       full 7-check parse + L2 interpretive (P5, P6)
                                     + BL-29 glossary scan + secrets re-scan from clean checkout
Commit config file                  -> tool hot-reloads / restarts / next-spawn reads new config
Activation announcement             -> note in deploy log or team channel (BL-C1)
```

---

## Checklists

### Pre-Generation Checklist (Check-First, BL-17 + BL-21 + BL-C4)
- [ ] Read the tool's SCHEMA (JSON Schema, OpenAPI, protobuf, CRD, man-page, documented keys) for the TARGET version
- [ ] Read EXISTING sibling configs in the project (BL-29 — same key naming conventions, stanza shapes, indent style)
- [ ] Read the precedence chain for this config class (defaults → system → env → project → user)
- [ ] Enumerate cross-config dependencies (which other files share resources with this config)
- [ ] Enumerate every env var / vault path / runtime injector the config will reference, and confirm each exists in the target environment (BL-C4 PRE-FLIGHT)
- [ ] Declare the secrets policy: inline forbidden → vault / env / injector
- [ ] For production/infra configs: Visionary RT-0 complete with schema version + environment + secrets policy + rollback plan captured

### Post-Generation Checklist (Jidoka + BL-C2 gate)
- [ ] P1 — parser runs clean on the file (exit 0) in its target format
- [ ] P2 — schema validator runs clean (exit 0 + zero deprecation warnings, or warnings triaged)
- [ ] P3 — secrets scan returns zero non-placeholder hits
- [ ] P4 — every interpolation reference resolves against the target environment
- [ ] P5 — precedence layering documented for every key shared across layers
- [ ] P6 — same-resource values agree across sibling configs (ports, versions, endpoints)
- [ ] P7 — schema version declaration matches actual keys used
- [ ] BL-29 — key naming convention matches project glossary (snake_case / camelCase / kebab-case uniform)
- [ ] BL-C2 pre-commit hook installed and green for the commit
- [ ] For production activation: BL-C3 rollback plan documented in 5 bullets
- [ ] Jidoka self-check per role executed (no ANDON)

---

## Examples (3 concrete tasks)

### Example 1: YAML indentation error (P1 / P2 syntax + schema)

- **Input:** "Add a new `resources` block under the `services.api` stanza in `docker-compose.yml` with `limits: { cpus: '0.5', memory: 512M }` and `reservations: { cpus: '0.25', memory: 256M }`."
- **Scenario:** Builder edits `docker-compose.yml`, adds the `resources` block under the existing `services.api` stanza. Builder uses 2-space indent but the file uses 4-space for nested keys. Specifically, the `limits:` key is indented 2 spaces instead of 4 — one level too shallow. Builder saves and declares Done.
- **What Validator finds:** Running P1 (`yq . docker-compose.yml`), the parser fails at line N with `mapping values are not allowed here` — YAML interprets the shallow `limits:` as a sibling of `services.api`, not a child of `resources`. The file is syntactically invalid. **P1 FAILS immediately.** P2 is moot — the file does not parse, so the schema validator cannot see it.
- **Catching role:** **Validator** (P1 is the load-bearing check; Builder's Jidoka Q3 "does the file parse cleanly" should have caught it but did not because Builder marked Done without running the parser).
- **Phase:** **RT-1** (parse is the PRIMARY L1 gate, not a deferred one).
- **Fix:** Re-indent the `limits:` and `reservations:` keys to 4 spaces (matching the file convention). Run `yq . docker-compose.yml` — exit 0, P1 PASS. Run `docker-compose config` (the tool's own schema validator) — exit 0, P2 PASS. Commit.
- **Why Builder's Jidoka Q3 should have caught it (process defect for Hansei):** BL-C2 pre-commit gate mandates running the parser before marking Done. This example illustrates what happens when Builder skips BL-C2. Retro: install the pre-commit hook structurally.
- **B-check:** F=0.7 (read file but missed indent convention), E=0.9 (intent clear), (1-σ)=0.3 (violated file convention), Λ=0.5 → B ≈ 0.60 YELLOW. Post-fix B ≈ 0.90 GREEN.

### Example 2: Inline secret in `.env.example` (P3 secrets scan)

- **Input:** "Create a `.env.example` file documenting the environment variables needed by the service."
- **Scenario:** Builder wants to show developers what `OPENAI_API_KEY` looks like. Builder copies a real working key from their local `.env` into `.env.example` "just for reference", polishes the rest of the file, declares Done. Builder intends to replace the real value with a placeholder "before committing" but forgets.
- **What Validator finds:** Running P3 (secrets scan with the curated regex list from Section 4.2), Validator hits the `sk-[A-Za-z0-9]{32,}` pattern on the `OPENAI_API_KEY` line. The value does not match the placeholder whitelist (`xxxxxxx`, `<your-api-key-here>`, `REPLACE_ME`, `${VARIABLE}`). **P3 FAILS with 1 non-placeholder hit.** Validator ALSO flags this for Coherencer because the file has been committed to git history — the credential is exfiltrated and must be rotated (BL-13 Yokoten: grep git history for other leak sites).
- **Catching role:** **Validator** (P3 is mechanical; runs at RT-1 if BL-C2 pre-commit hook is installed, otherwise at RT-2 pre-deploy).
- **Phase:** **RT-2** pre-deploy secrets scan (when BL-C2 is not installed). If BL-C2 is installed, the pre-commit hook catches it BEFORE the commit lands, at which point the rotation step is unnecessary.
- **Fix:**
  1. Replace the real `sk-...` value with a placeholder (`OPENAI_API_KEY=sk-REPLACE_ME_WITH_YOUR_KEY`) or a clear pattern (`OPENAI_API_KEY=<your-api-key>`).
  2. If the real value was ever committed: ROTATE the real API key at the provider (OpenAI dashboard → revoke → issue new key).
  3. Update the local `.env` with the new key.
  4. Document the setup step in `README.md` ("copy `.env.example` to `.env`, fill in real values from team vault").
  5. Grep git history for other leak sites (`git log -p | grep -iE 'sk-[A-Za-z0-9]{32,}'` and similar for every pattern in the curated list).
  6. Install BL-C2 pre-commit hook so this cannot happen again.
- **Why P1 alone would miss this:** P1 (parse) says PASS — a `.env` file with one valid line is syntactically fine. Only P3 (secrets scan) catches the inline credential. This is the canonical case for why `parse` in the config skin is NOT just "run the parser" — it is a FAMILY of checks, and P3 catches the failure class P1 cannot see.
- **B-check:** F=0.6 (skipped Check-First on placeholder whitelist), E=0.8 (intent clear), (1-σ)=0.2 (secrets exfiltration), Λ=0.4 → B ≈ 0.50 YELLOW (would be RED after ANDON if the key is real). Post-fix B ≈ 0.88 GREEN.

### Example 3: Port drift across related configs (P6 cross-config consistency)

- **Input:** "Set up a containerized service with `package.json` declaring the runtime port, `Dockerfile` exposing the same port, and `docker-compose.yml` mapping the port to the host."
- **Scenario:** Builder writes the 3 files in sequence. `package.json` has `"main": "server.js"` and `scripts.start` of `PORT=3000 node server.js`. `Dockerfile` has `EXPOSE 3001` (Builder copy-pasted from a stackoverflow example and forgot to change it). `docker-compose.yml` maps `3000:3000` (matching package.json). All 3 files parse cleanly (P1 PASS). All 3 files have no secrets (P3 PASS). Each file is individually valid.
- **What Coherencer finds:** Running P6 (cross-config consistency), Coherencer enumerates shared resources: PORT. Looking at the 3 configs: package.json says 3000, Dockerfile says 3001, docker-compose says 3000. **Drift detected.** The container will expose 3001 but the app listens on 3000 — the container port mapping will fail silently and the service will be unreachable from the host. **P6 FAILS.**
- **Catching role:** **Coherencer** (P6 is Coherencer-owned because it requires reading MULTIPLE configs and cross-referencing them — Validator owns single-config checks; Coherencer owns cross-config checks).
- **Phase:** **RT-2** (P6 is L2 interpretive, runs at pre-deploy). Could also be caught at Coherencer's cross-config scan during RT-1 for M+ configs.
- **Fix:** Unify to ONE port. Pick 3000 as the canonical value (matching package.json and docker-compose). Update Dockerfile to `EXPOSE 3000`. Re-run P6 — all 3 configs agree. Commit the Dockerfile fix + a comment in README documenting that the service runs on port 3000 (single source of truth for future edits). Coherencer records a note for future P6 scans: "when package.json / Dockerfile / docker-compose describe a port, they must ALL agree."
- **Why P1 / P2 alone would miss this:** P1 (parse) runs on one file at a time — each file parses independently. P2 (schema) validates each file against its own schema — package.json against npm schema, Dockerfile against Docker schema, docker-compose against Compose schema. Each schema is honored. The failure is RELATIONAL — the three files disagree with each other. P6 is the ONLY check that looks across configs.
- **B-check:** F=0.8 (read 3 schemas), E=0.9 (intent clear), (1-σ)=0.3 (cross-config drift), Λ=0.6 (missed BL-29 shared-resource enumeration) → B ≈ 0.65 YELLOW. Post-fix B ≈ 0.90 GREEN.

---

## Domain-Specific Bootstrap Lessons

The config skin inherits all 22 universal BL unchanged from `BOOTSTRAP_LESSONS_universal.md`. Two code-adapter BL transfer unchanged. Four code-adapter BL are adapted into the `BL-C` namespace (separate budget, does NOT count against the main 30-BL budget). One code-adapter BL is lifted into the vocabulary table. One is lifted into the P-check list. **Zero are pure N/A.**

### Universal BL (22 entries — all inherited unchanged, applicability notes)

| BL | Title | Applicability to config work |
|---|---|---|
| BL-1 | Lambda=0.5 as Cold-Start Default | Unchanged — fresh config project starts with Λ=0.5; accumulates as sibling configs land |
| BL-4 | S_adjusted = S_team × B_mean | Unchanged — Coherencer at RT-2 computes S_adjusted from the 5 role B scores |
| BL-5 | Phantom Coherence Detection | Unchanged — config manifestation: "Builder and Validator both say PASS but neither actually ran the parser or secrets scan" (see P1 + P3 independence check) |
| BL-7 | EN for Practical, RU for Theoretical | Unchanged — config authoring is practical (EN); multi-tool IaC architecture is theoretical (RU) |
| BL-9 | Interface Contracts Between Roles | Unchanged — Analyst→Builder contract = key enumeration + precedence map; Builder→Validator contract = parsed + schema-valid file + secrets-clean status |
| BL-10 | Multiplicative B Structure | Unchanged — weights are `text` profile (F=E=(1-σ)=Λ=0.25) per Modality choice below |
| BL-11 | Scope Creep is Muda | **Critical for configs** — "while editing the port, I noticed the timeout could also be tuned" = SEPARATE revision, not a silent addition |
| BL-12 | Hansei Targets Process | Unchanged — post-deploy reflection is about why P3 missed a secret, not who committed the file |
| BL-13 | Yokoten — One Lesson, All Analogous Cases | **Critical for configs** — if a secret leaks in one config, grep the entire repo (history included) for the same credential pattern in all other configs |
| BL-15 | 2% Spiral Gap | Unchanged — every config ships with some open questions; Open Questions section is mandatory in non-trivial configs |
| BL-16 | Reading the Framework ≠ Applying It | Unchanged — META must still delegate config work to agents, not edit configs directly |
| BL-17 | Pre-Generate Verification = Prevention | **Critical for configs** — read SCHEMA + existing project configs + precedence rules BEFORE drafting keys |
| BL-18 | Scope Reclassification at 2× Estimate | Unchanged — if a "quick config tweak" spawns 50+ parse-fix commits, reclassify the task |
| BL-19 | Bilingual Files Simultaneous | Limited — most configs are English-only (tool schemas are in English). If the project has RU+EN docs ABOUT the config, both must update together; the config file itself is typically one language |
| BL-20 | Adversarially Test Bootstrap | Unchanged — test the config skin against a trial config before deploying the skin |
| BL-21 | Format Specifications Are Inputs | **Most critical for configs** — the tool's schema IS the format specification; reading it BEFORE generation is non-negotiable |
| BL-26 | META Always Delegates | Unchanged — META never edits configs directly |
| BL-28 | Agent Prompt Must Include Explicit Context | Unchanged — config-task agent prompts must name the skin file path AND role file path AND schema file path |
| BL-29 | Verify Established Terminology Before Generating | **Critical for configs** — configs MUST use the tool's canonical key names (`host` not `hostname`); drift here breaks tooling invisibly |
| BL-30 | Defense-In-Depth | Unchanged — config verification has layers: Builder Jidoka + parse + schema + secrets scan + Coherencer cross-config + Validator P1–P7 sweep |
| BL-31 | Constrain Output Types | Unchanged — Builder's output is the single saved config file, not prose explanations |
| BL-32 | Grep After BL Merge | Unchanged — if key naming conventions change (`timeout_ms` → `timeout`), grep all sibling configs for orphan references |

### Code-adapter BL (8 entries — individual treatment)

| BL | Title | Verdict for configs | Config equivalent |
|---|---|---|---|
| **BL-2** | Protocol Changes Require Canary Deployment | Config equivalent: **BL-C1** | Major config activation (prod IaC apply, service config, secret rotation) is a release event requiring canary. See BL-C1 below. |
| **BL-3** | Fix Chain > 3 = Structural Problem | **Transfers unchanged** | "3+ consecutive parse/schema fix attempts on the same file = STOP, re-read the schema, re-run RT-1." No new BL-C needed. Symptom: thrashing on indentation or schema errors usually means the wrong schema version is being targeted. |
| **BL-6** | Verify Before Act — Artifact Validity Gate | Config equivalent: **BL-C2** | Before committing any config, Builder MUST run the parser + schema validator + secrets scan. Commit REJECTED otherwise. See BL-C2 below. |
| **BL-8** | Feature Flag Toggle = Deployment Event | **LIFTED INTO VOCABULARY ROW 18** (not a separate BL-C) | Config flags ARE the deployment mechanism — BL-8 applies DIRECTLY to configs with no adaptation. A config toggle is a deploy event regardless of whether the tool has a "feature flag" concept. |
| **BL-14** | Rollback Plan Before Deploy | Config equivalent: **BL-C3** | Before activating a production config, Builder MUST document the rollback procedure. See BL-C3 below. |
| **BL-22** | PRE-FLIGHT Gate for External APIs | Config equivalent: **BL-C4** | Before RT-1 on any config, Analyst MUST verify the target schema is CURRENT (tool version matches) and every env var / vault path exists in the target environment. See BL-C4 below. |
| **BL-24** | Single-Responsibility Commits | **Transfers unchanged** | "One commit = one config scope" — do not change the port AND the timeout AND the log level in one commit. No new BL-C needed. |
| **BL-25** | Error Path Coverage Matrix | **LIFTED INTO P5 + P6** (not a separate BL-C) | Configs do not have runtime error paths in the code sense, but the precedence sanity check (P5) + cross-config consistency check (P6) together encode the "what happens if the config is partially-applied or conflicts" concern that BL-25 encodes for code. |

**Summary:** 2 code-adapter BL transfer unchanged (BL-3, BL-24); 4 have config equivalents (BL-2→C1, BL-6→C2, BL-14→C3, BL-22→C4); 1 lifted into vocabulary row 18 (BL-8); 1 lifted into P5+P6 (BL-25). **Zero are pure N/A** — every code-adapter BL finds a home in the config domain.

### Config-specific BL (BL-C namespace — separate budget, 4 entries)

These 4 BL live in the config skin ONLY. They do NOT add to the main 30-BL budget. They are loaded by the config domain adapter layer.

**BL-C1: Config Activation is a Release Event (adaptation of BL-2)**
- **Source:** Adapted from BL-2 for the config domain.
- **Rule:** Activating a production / staging / infrastructure config (deploying to the tool, triggering a reload, rolling a new IaC apply, flipping a feature flag in production) is a release event. It requires: a canary phase (apply to ONE instance / one region / one tenant first), a 15-minute monitoring window before full rollout, and a pre-written rollback plan (BL-C3). Major activations MUST be announced in writing to all stakeholders whose systems depend on the configured tool.
- **Why:** Configs have unbounded blast radius — a broken production config can take down every downstream user of the service in the same instant the tool reloads. Canary + monitoring + rollback plan constrain the damage surface and give time for failure signals to manifest. `projects/plugy/config.md` autodeploy precedent applies: production configs deploy automatically, and automation without canary = immediate blast.
- **Applies to:** Visionary (approve activation), Builder (prepare canary), Validator (pre-activation gate at RT-2), META (enforce gate for production-tier configs).

**BL-C2: Parse + Secrets Scan Before Commit (adaptation of BL-6)**
- **Source:** Adapted from BL-6 for the config domain.
- **Rule:** Before committing any config revision, Builder MUST (a) run the format-specific parser (yq for YAML, toml for TOML, jq for JSON, configparser for INI, per-format for ENV) and confirm exit code 0; (b) run the secrets scan (curated regex list from Section 4.2) and confirm zero non-placeholder hits; (c) run the schema validator if one exists (ajv, tool-specific validator) and confirm exit code 0. Commit is REJECTED if any of the three fails. Enforcement MUST be structural — a pre-commit hook is the canonical mechanism (BL-30 defense-in-depth).
- **Why:** A config file that "looks right" in the editor but fails the parser is the config equivalent of unverified code. A config file with an inline secret is a credential-exfiltration incident. Both fail modes are cheap to prevent (seconds per check) and expensive to recover (hours per parse-thrash, days per credential rotation). The canonical incident is Example 2 (OpenAI API key in `.env.example`): without BL-C2 the leak is caught at RT-2; with BL-C2 it cannot commit.
- **Applies to:** Builder (write hook, run checks), Validator (require proof of hook running), META (enforce gate), Coherencer (verify hook exists in new projects).

**BL-C3: Rollback-Ready Before Activation (adaptation of BL-14)**
- **Source:** Adapted from BL-14 for the config domain.
- **Rule:** Before a new config is declared ACTIVE in production or infrastructure, the author must document the rollback procedure: (a) which prior commit or config-store version is the restore target; (b) exact commands to restore (git revert + tool reload / config-store restore / IaC apply of prior version); (c) exact verification steps to confirm the restore worked (smoke test, health check, parse check of the restored file); (d) estimated time to complete the rollback (under 5 minutes for service configs, under 30 minutes for IaC). If the rollback procedure cannot be documented in 5 bullets, the activation is NOT permitted — the ambiguity of rollback is itself a defect.
- **Why:** Under incident pressure (production is down, stakeholders are paging), cognitive load peaks and decision quality drops. A pre-written rollback plan executes mechanically when needed. Writing it beforehand also forces Builder to verify that rollback is actually possible — sometimes it surfaces that the prior config was NEVER saved anywhere (no git commit, no config store version, no backup) and the config is forward-only without Builder realizing.
- **Applies to:** Visionary (approve plan), Builder (write it), Coherencer (store in project MEMORY.md), Validator (block activation if missing).

**BL-C4: Schema + Environment PRE-FLIGHT (adaptation of BL-22)**
- **Source:** Adapted from BL-22 for the config domain.
- **Rule:** Before RT-1 begins on any config task, Analyst MUST verify: (a) the tool's current schema (not a stale copy from a prior version) is readable and parse-able — if machine-readable (JSON Schema, OpenAPI, protobuf), actually open it; if documentation, read the relevant section; (b) the schema version declared in the target config matches the tool's current expected schema version; (c) every env var / vault path / runtime injector referenced by the config actually exists in the target environment (not "we will set it up later"); (d) every cross-config sibling (files that share resources with this config) is enumerated upfront. Produce a VERIFIED CONTEXT artifact (a table: schema | version | url/path | confirmed; env var | target env | confirmed; sibling config | shared resource | confirmed). Unverified context = Builder BLOCK (RED on A_F) at RT-1, Validator BLOCK at RT-2.
- **Why:** Hallucinating that a schema "probably has a `retries` key" is the top F=0 failure in config work — analogous to hallucinating an API endpoint in code work. Verifying the schema costs minutes; discovering a non-existent key mid-draft costs a full fix-chain. The 4 live reference configs (eradev, plugy, academic-lab, odtoe-articles) all declare their schema in the Notes section — empirical evidence of the BL-C4 discipline.
- **Applies to:** Analyst (RT-1 execution), Validator (RT-2 re-verification), Builder (refuse to start without artifact), META (enforce gate).

### BL budget summary

- Universal BL inherited: **22** (unchanged)
- Code-adapter BL that transfer unchanged: **2** (BL-3, BL-24)
- Code-adapter BL with config equivalents: **4** (BL-2→C1, BL-6→C2, BL-14→C3, BL-22→C4)
- Code-adapter BL lifted into vocabulary row 18: **1** (BL-8)
- Code-adapter BL lifted into P-check: **1** (BL-25 → P5 + P6)
- Config-specific BL (BL-C namespace, separate budget): **4** (BL-C1..C4)

**Total BL a config agent carries: 22 universal + 2 transferred code-adapter + 4 BL-C = 28 BL.**

BL-8 and BL-25 are still ACTIVE, carried via the vocabulary/P-check lifts, not as standalone entries. BL-8's insight ("every behavioral change in production regardless of mechanism is a deployment") is preserved through vocab row 18 + BL-C1. BL-25's insight ("cover all failure paths") is preserved through P5 + P6 interpretive gates.

---

## Known Out-of-Scope (OOD) for config modality

Tasks that look like config but are actually continuous or out of v9 scope (`domain.ood_scope: continuous` → REJECT):

- **Runtime-mutable in-memory state** (Redis/Consul/etcd keys that represent *current state*, not declarative spec) — the "config" is a live event stream, not a text-discrete artifact. Escalate to Visionary RT-0 Kill-Switch Level 2.
- **Continuous runtime parameter tuning** (autoscaler threshold streams, adaptive rate limiters that change every minute, feature-flag values driven by A/B test metrics) — flow, not text. OOD for v9.
- **AI-driven hyper-parameter auto-configuration** during training (learning-rate schedules, batch-size adaptation, layer-count search) — continuous-valued optimization loop, not a discrete config artifact. OOD.
- **Secret rotation events themselves** (the runtime operation of rotating a key) — meta-config about rotation *policy* is in scope, but the actual rotation *event* is a runtime operation.
- **Tool-specific DSLs that are really code** (Jenkinsfile pipeline code, GitHub Actions with inline shell, Terraform `locals {}` with function calls) — treat as `code` modality and use `templates/domain_skin.code.md`.
- **Dynamic type coercion contracts in JSON** where the consumer silently reshapes input — this is a data-contract concern better served by a `schema` or `protocol` modality if one is added in v10.

Agents should escalate these to Visionary RT-0, not auto-proceed. See `eradev.md` Section II.2 for the v9 OOD registry.

---

## B-weight Adjustment (default — no override)

The config skin uses the default **uniform** weights (`B_text`). This is the v8-compatible default and the backward-compat invariant: `B_text(v9) ≡ B(v8)` for every pre-v9 code/config project.

| Component | Weight | Rationale |
|---|---|---|
| F | 0.25 | Schema read + existing sibling configs + precedence rules read — all matter equally. Missing any = hallucinated keys. |
| E | 0.25 | Every key matches the operator's actual intent (not `default_port: 3000` when they asked for `port: 3000`). |
| (1-σ) | 0.25 | No two keys conflict; cross-config references agree; key naming consistent with project glossary. |
| Λ | 0.25 | BL-29 established naming conventions; MEMORY.md of past configs informs key choices. |

**Why `text`, not `research` or `creative`:** No single component dominates config-authoring. Configs are not theorem/proof work (no formal proof chain, so (1-σ)=0.35 research-dominance is unwarranted). Configs are not narrative prose (no voice, no reader arc, so E+σ creative-dominance is misaligned). The uniform profile is empirically the profile the 4 live project configs already compute under — no migration needed.

**v10 future hook (DEFERRED):** `eradev.md` line 144 names `B_config` as a candidate modality with σ-dominant weights, hypothesizing that infrastructure-as-code especially benefits from high (1-σ) because cross-config consistency dominates. **This is a v10+ research direction. v9 does NOT ship `B_config`** — configs use `B_text`. If a project explicitly wants σ-weighted configs (production IaC with strict schema contracts, gRPC multi-language protobuf manifests), they can override per-project via `config.md` `## B-weight Override` section (precedent: `projects/plugy/config.md`). The skin does not override; projects override individually.

---

*Last updated: 2026-04-11 (v9 Phase 2.A)*
*Upstream roles: `roles/{role}_EN.md`*
*Upstream math: `eradev.md` Section II.1 line 117 (B_text weights) + Section II.2 line 152 (v9 OOD scope) + Section II.1 line 144 (`B_config` v10 hook DEFERRED)*
*Upstream BL: `BOOTSTRAP_LESSONS_universal.md` (22 inherited) + 2 transferred code-adapter + 4 BL-C = 28 total*
*Live reference configs: `projects/eradev/config.md`, `projects/plugy/config.md`, `projects/academic-lab/config.md`, `projects/odtoe-articles/config.md`*
*Siblings: `templates/domain_skin.code.md` (text modality, identity skin), `templates/domain_skin.article.md` (research modality, full override), `templates/domain_skin.plan.md` (text modality, parallel sibling), `templates/domain_skin.book.md` (creative modality), `templates/domain_skin.research.md` (research modality)*
