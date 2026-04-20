# Domain Skin: code

> Type: code
> Modality: text (uniform weights 0.25 / 0.25 / 0.25 / 0.25 — v8-compatible default)
> OOD scope: text-discrete
> Parent BL files: `BOOTSTRAP_LESSONS_universal.md` + `BOOTSTRAP_LESSONS_code_adapter.md` (30 total = 22 universal + 8 code-adapter)
> Verify method: `build` (compile + test + lint)
> Upstream roles: `roles/{role}_EN.md` / `roles/{role}.md`
> Upstream math: `eradev.md` Section II.1 (B_text weights) + `eradev.md` Section II.2 (v9 OOD scope)

---

## Purpose

This is the **identity skin** for the `code` modality. Unlike the `article` / `book` / `research` skins, which rewrite role vocabulary for a different artifact class, the code skin does almost nothing: code is the modality that the base role files were originally written for, so the abstract vocabulary (`artifact`, `verify`, `pipeline`, `produce`) already maps directly onto code concepts. This file exists so that project configs with `domain.skin: templates/domain_skin.code.md` resolve to a real file rather than a dangling pointer.

Code is also the **ONE modality that inherits BOTH BL files**: `BOOTSTRAP_LESSONS_universal.md` (22 entries) AND `BOOTSTRAP_LESSONS_code_adapter.md` (8 entries) = 30 total. Non-code modalities inherit only the universal file.

---

## Vocabulary Mapping (Identity — no override)

The abstract role-file vocabulary matches code vocabulary directly. This skin does NOT rewrite any term. Agents load the base role file and interpret each abstract term as its code meaning below.

| Abstract term (role file) | code meaning |
|---|---|
| artifact | source file (`.go`, `.py`, `.ts`, `.rs`, `.md`, `.yaml`, ...) |
| verify | compile + test + lint + type-check |
| produce | write/edit source file |
| validate | run test suite, run linter, run type checker, confirm CI passes |
| pipeline | edit → compile → test → lint → commit → push → deploy |
| deploy | git push to prod / merge to main / CI rollout |
| component / module | package / module / directory |
| section / chapter | file / function / class |

This table is for AGENT CLARITY ONLY — the base role files already use these code-oriented interpretations implicitly. No vocabulary override is applied; the skin is documentationally explicit for consistency with the `article` / `book` / `research` skins that DO override.

---

## Role Focus Overrides (None — refer to base role files)

Code is the baseline modality. Each role uses its base file unchanged. Focus overrides for code would duplicate the base file content.

### Visionary
No override — see `roles/visionary_EN.md` / `roles/visionary.md`. Strategic question: "what is the True North for this codebase, and which proposed change actually moves toward it?"

### Analyst
No override — see `roles/analyst_EN.md` / `roles/analyst.md`. Plan decomposition unit: function, module, API endpoint, test case. Dependency graph: imports, type signatures, schema joins.

### Builder
No override — see `roles/builder_EN.md` / `roles/builder.md`. Production protocol: BL-6 BUILD-VERIFY (compile/test before commit). Activation gate: A_F read all modified files + adjacent files in same package. Output artifact: source file at its canonical path.

### Validator
No override — see `roles/validator_EN.md` / `roles/validator.md`. Verification protocol: run the full test suite (unit + integration + E2E as applicable), run linter, run type checker. Success criteria: all exit codes 0; no new warnings; coverage not regressing.

### Coherencer
No override — see `roles/coherent_EN.md` / `roles/coherent.md`. Cross-artifact consistency: API schemas match between producer and consumer, terminology matches glossary, BL-19 bilingual sync for docs. Drift detection: grep for deprecated symbols, check for duplicate logic, verify test/prod parity.

---

## Verification Protocol (code-specific)

Maps directly to `config.md` `domain.verify.method: build`.

```
method:           build
command:          (project-specific — e.g., "go build ./... && go test ./..." or "pytest" or "npm run build && npm test")
success criteria: all build commands exit 0; all tests pass; linter clean; type checker clean; no new warnings
failure recovery: fix root cause (BL-3 FIX-TO-SPEC gate — 3+ consecutive fixes = STOP, write spec, re-run RT-1)
independence check: Validator runs the pipeline on a clean checkout, not on Builder's workspace; confirms the same result
```

Project-specific commands are declared in each project's `config.md` `domain.verify.command` field — the skin does not hard-code them because every codebase has its own build system.

---

## Checklists

### Pre-Generation Checklist (BL-17 Check-First)
- [ ] Read all files that will be modified IN FULL (not just the diff region)
- [ ] Read adjacent files in the same package/module to understand local conventions
- [ ] Verify interface contracts for any cross-module edits (type signatures, schemas, protobuf, API contracts)
- [ ] Check existing tests for the modified code path — do they still encode the right invariants?
- [ ] For external API work: verify endpoints BEFORE RT-1 (BL-22 PRE-FLIGHT gate)

### Post-Generation Checklist (BL-6 BUILD-VERIFY gate, Jidoka)
- [ ] Build passes (compile/type-check/lint)
- [ ] Unit tests pass
- [ ] Integration tests pass (if applicable)
- [ ] No new linter warnings
- [ ] No new deprecation warnings
- [ ] Git status shows only expected files modified (no accidental staging)
- [ ] Commit message follows project convention

---

## Examples (3 concrete tasks)

### Example 1: Fix a bug in `auth/login.ts`
- **Input**: "Session token not refreshing on mobile browsers"
- **Domain classification**: type=code, modality=text, verify=build
- **Pipeline**: A_F read `auth/login.ts` + `auth/session.ts` + mobile E2E test → reproduce bug → patch → `npm test` → `npm run build` → commit → push
- **Expected artifact**: `auth/login.ts` edit + potentially 1 new test case in `auth/__tests__/`
- **Verification**: `npm test` all green; `npm run build` exit 0; mobile E2E test now passes
- **B-check**: F=0.9 (read session + login + test), E=0.9 (token refresh is exact intent), 1-σ=0.9 (no conflict with session contract), Λ=0.8 (consulted BL-17/BL-22) → B ≈ 0.87 GREEN

### Example 2: Refactor `services/gateway` to use typed middleware
- **Input**: "Migrate gateway request handlers to the new typed middleware pattern"
- **Domain classification**: type=code, modality=text, verify=build, blast_radius=MEDIUM
- **Pipeline**: A_F read `gateway/router.go` + `middleware/` + affected handlers → draft migration plan → file-ownership assignment if multi-Builder → refactor handler-by-handler → `go build ./...` + `go test ./...` after each handler → commit per handler
- **Expected artifact**: 5-15 handler files + 1 middleware file + updated tests
- **Verification**: `go build ./...` exit 0; `go test ./...` all green; integration test suite passes; no regression in handler response latency
- **B-check**: F=0.9 (read all handlers + middleware contract), E=0.85 (typed middleware is exact intent), 1-σ=0.9 (contract preserved), Λ=0.8 (BL-24 one-commit-one-phase applied) → B ≈ 0.86 GREEN

### Example 3: Add a new gRPC endpoint to `services/ai-provider`
- **Input**: "Expose a new `/v1/chat/completions` endpoint"
- **Domain classification**: type=code, modality=text, verify=build, blast_radius=MEDIUM (protocol change — BL-7 canary mandatory)
- **Pipeline**: A_F read `proto/*.proto` + existing endpoint handlers + client stubs → edit proto → regen Go + Python stubs → implement handler → write test → `go build ./...` + `pytest` → feature flag OFF → canary on 1 node → monitor → rolling → commit
- **Expected artifact**: 1 proto file, 2 regenerated stub files, 1 handler file, 1 test file, 1 config flag
- **Verification**: both Go and Python sides build; proto contract matches between producer and consumer (BL-29 terminology + BL-28 context); canary rollout metrics within bounds
- **B-check**: F=0.9 (read proto + handler + client), E=0.9 (new endpoint is exact intent), 1-σ=0.85 (contract matches both sides), Λ=0.85 (BL-7 canary pattern applied) → B ≈ 0.87 GREEN

---

## Domain-Specific Bootstrap Lessons (code inherits all 8 CODE-ADAPTER BLs)

Code is the ONE modality that inherits BOTH `BOOTSTRAP_LESSONS_universal.md` (22 entries) AND `BOOTSTRAP_LESSONS_code_adapter.md` (8 entries). The adapter file contains:

- BL-2: Logs as PRIMARY source
- BL-3: FIX-TO-SPEC gate (3+ consecutive fixes = STOP)
- BL-6: BUILD-VERIFY gate (compile/test before commit)
- BL-8: Protocol changes = canary mandatory
- BL-14: Artifact content gate (format match, not just existence) — merged into BL-8 in main `BOOTSTRAP_LESSONS.md` 2026-04-20 as part of deployment-event checklist; entry still active in `BOOTSTRAP_LESSONS_code_adapter.md`
- BL-22: PRE-FLIGHT endpoints for external APIs
- BL-24: One commit = one phase
- BL-25: Blast radius dictates process

A fresh agent bootstrapping on a code project should read BOTH files. Non-code modalities should read only the universal file.

---

## Known Out-of-Scope (OOD) for code modality

Tasks that look like code but are actually continuous or out of v9 scope (`domain.ood_scope: continuous` → REJECT):

- **Real-time streaming / simulation control** — there is no terminal artifact; the "output" is a continuous event stream. Escalate to Visionary for Kill-Switch Level 2.
- **Live service tuning** — adjusting knobs on a running service based on continuous metrics feedback is flow-based, not text-discrete. OOD for v9.
- **Chat-turn optimization** — optimizing per-conversation-turn behavior is conversational, not code-artifact. OOD for v9.

Agents should escalate these to Visionary RT-0, not auto-proceed. See `eradev.md` Section II.2 for the v9 OOD registry.

---

## B-weight Adjustment (default — no override)

Code modality uses the default uniform weights. This is the v8-compatible default and the backward-compat invariant: `B_text(v9) ≡ B(v8)` for every pre-v9 code project.

| Component | Weight | Rationale |
|---|---|---|
| F | 0.25 | Files read, APIs checked, types understood — all matter equally for working code |
| E | 0.25 | Output matches task intent (not just letter) |
| (1-σ) | 0.25 | No conflicts with existing code, architecture, types, tests |
| Λ | 0.25 | MEMORY.md consulted, past patterns applied, BL-1..BL-32 considered |

Projects MAY override these weights in their own `config.md` `## B-weight Override` section (see `projects/plugy/config.md` for a live example — strict gRPC contract work boosts (1-σ)). The skin does not override; projects override individually.

---

*Last updated: 2026-04-11 (v9 Wave 8)*
*Upstream roles: `roles/{role}_EN.md` / `roles/{role}.md`*
*Upstream math: `eradev.md` Section II.1 (B_text weights) + Section II.2 (OOD scope)*
*Inherits: `BOOTSTRAP_LESSONS_universal.md` (22) + `BOOTSTRAP_LESSONS_code_adapter.md` (8) = 30 total*
