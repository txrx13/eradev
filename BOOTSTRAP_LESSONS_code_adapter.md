# Code-Adapter Lambda Bootstrap -- Code-Specific Lessons

> **Loading rule:** Loaded ONLY by code projects, in addition to `BOOTSTRAP_LESSONS_universal.md`.
> Non-code projects (articles, books, configs, plans) do NOT load this file.
> Split from BOOTSTRAP_LESSONS.md in EraDev v9 Phase 1.D (2026-04-11).
>
> **Scope:** These 8 lessons are specific to software engineering artifacts. They reference
> code-native mechanics — compile, build, commit, deploy, module, endpoint, API, feature
> flag, rollback, git, server-side features, error paths — and a project working on a
> non-code domain (article, book, config, plan) does not need them. For such projects,
> loading only `BOOTSTRAP_LESSONS_universal.md` is sufficient.
>
> **Code projects** should load BOTH files (or the combined `BOOTSTRAP_LESSONS.md`).
> **Non-code projects** load only `BOOTSTRAP_LESSONS_universal.md`.
>
> **BL numbering preserved from combined BOOTSTRAP_LESSONS.md.** Gaps in this file (all BLs
> not listed here) are either universal lessons (loaded separately by all projects) or
> retired/merged entries. See "BL Gap Map" section at the bottom of this file.

---

### BL-2: Protocol Changes Require Canary Deployment [CODE-ADAPTER]
**Source:** RT analysis (multiple post-mortems)
**Rule:** Any change to protocol, infrastructure, or communication layer MUST go through canary deployment with a 30-minute monitoring window before full rollout.
**Why:** Protocol changes have unbounded blast radius. A broken protocol silently corrupts all downstream agents and outputs. Canary constrains the damage surface and gives time for D(eta) to manifest visibly.
**Applies to:** Builder, Validator, Analyst

---

### BL-3: Fix Chain > 3 = Structural Problem [CODE-ADAPTER]
**Source:** Framework invariant (CHECKLIST fix chain counter)
**Rule:** If 3 or more consecutive fixes occur in sequence, STOP. Do not attempt fix number 4. Return to the specification and re-run RT-1.
**Why:** Three consecutive fixes signal a structural defect, not an execution error. Each fix patches a symptom; the root cause lives upstream. Continuing the fix chain compounds technical debt exponentially. The correct action is Andon: stop the line, find the real constraint (TOC Phase 1).
**Applies to:** Builder, Validator

---

### BL-6: Verify Before Act — Artifact Validity Gate [CODE-ADAPTER]
**Source:** Framework invariant (Activation Operator Step 1-3) + META Hansei Cycle 2 L-017
**Rule:** Before modifying or committing any artifact, verify its current state. Read the file, check the endpoint, confirm the configuration. Before any artifact (code, document, config) can be committed, Builder MUST run the relevant validity check (compile, lint, parse, render) and attach output as proof. An artifact that "looks correct" but was never validated is treated as unverified — commit REJECTED, counted as fix in fix_rate.
**Why:** Stale mental models are the top source of (1-sigma) collapse. "It compiles in my head" is the #1 source of unverified artifacts. Verification costs seconds; a wrong assumption or uncompiled artifact costs a full fix chain (5-10 commits).
**Applies to:** Builder (run validity check + verify state), Validator (require proof artifact), Analyst (verify endpoints pre-RT-1), META (enforce gate)

---

### BL-8: Feature Flag Toggle = Deployment Event [CODE-ADAPTER]
**Source:** RT analysis (Pre-Deploy checklist)
**Rule:** Toggling a feature flag is a deployment event. It requires the same Pre-Deploy checklist as a code deploy: rollback plan, health check, monitoring window.
**Why:** A feature flag flip changes production behavior identically to a code deploy -- users see different code paths. Treating it as "just a config change" bypasses the safety net that catches regressions. Every behavioral change in production, regardless of mechanism, is a deployment.
**Applies to:** Builder, Validator, Analyst

---

### BL-14: Rollback Plan Before Deploy, Not After [CODE-ADAPTER]
**Source:** RT analysis (Pre-Deploy checklist)
**Rule:** Document the rollback procedure BEFORE executing any deployment. If you cannot describe how to undo a change, you do not have permission to make it.
**Why:** Under incident pressure, cognitive load peaks and decision quality drops. A pre-written rollback plan is executed mechanically when needed, bypassing the degraded decision-making of a stressed team. Writing it beforehand also forces you to verify that rollback is actually possible.
**Applies to:** Builder, Analyst, Validator

---

### BL-22: PRE-FLIGHT Gate for External APIs [CODE-ADAPTER]
**Source:** Cycle-7 analysis — F=0 in 3/9 incidents (16/42 fixes traced to unverified endpoints)
**Rule:** Before RT-1 begins on any task involving external APIs, Analyst MUST curl-verify every endpoint the task depends on. Before DEPLOY, Validator MUST re-verify all endpoints against the production environment. Produce a VERIFIED ENDPOINTS artifact listing each URL, HTTP status, and response shape. Unverified endpoint = Builder BLOCK (RED on A_F) at RT-1, Validator BLOCK (RED on A_sigma) at deploy.
**Why:** Hallucinating that an endpoint exists, returns a certain schema, or behaves a certain way is the top source of F=0 collapse in boundary tasks. Verification costs seconds; a fix chain on a nonexistent endpoint costs 10+ commits.
**Applies to:** Analyst (RT-1 execution), Validator (deploy re-verification), Builder (must refuse to start without artifact), META (enforce gate)

---

### BL-24: Single-Responsibility Commits [CODE-ADAPTER]
**Source:** Cycle-7 — big bang commits (16 files, 14 files) made rollback catastrophic
**Rule:** One commit = one phase. A commit that touches >5 files from different modules requires RT-2 review before merge. If a single task produces changes across many modules, split into sequential commits by phase (e.g., schema first, then logic, then tests).
**Why:** Large cross-module commits have unbounded blast radius. When they break, you cannot revert one module without reverting all. Small, single-responsibility commits are cheap to revert, easy to bisect, and self-documenting.
**Applies to:** Builder (commit discipline), Validator (commit review gate), META (enforce at RT-2)

---

### BL-25: Error Path Coverage Matrix [CODE-ADAPTER]
**Source:** Cycle-7 — E=0 in 2/9 incidents (gossip protocol, badge system) due to missing error handling
**Rule:** For every server-side or boundary feature, Builder MUST cover 5 paths before marking complete: (1) happy path, (2) error/exception path, (3) timeout path, (4) restart/recovery path, (5) partial failure path. Validator checks coverage at RT-3.
**Why:** Happy-path-only code is demo code, not production code. Timeout and restart paths are where real systems fail. Covering all 5 paths at build time costs 20% more effort; discovering missing paths in production costs 10x.
**Applies to:** Builder (implementation), Validator (coverage check), Analyst (include paths in decomposition)

---

## BL Gap Map (this file only)

Gaps in this code-adapter file, with the location of the missing BL:

| BL # | Status | Location |
|------|--------|----------|
| BL-1 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-4 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-5 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-7 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-9 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-10 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-11 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-12 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-13 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-15 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-16 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-17 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-18 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-19 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-20 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-21 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-23 | Retired | Merged/retired (see BOOTSTRAP_LESSONS.md budget header) |
| BL-26 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-27 | Retired | Merged into BL-6 (per BL-32 reference cleanup lesson) |
| BL-28 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-29 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-30 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-31 | Universal | `BOOTSTRAP_LESSONS_universal.md` |
| BL-32 | Universal | `BOOTSTRAP_LESSONS_universal.md` |

**Totals in this file:** 8 Code-Adapter BL entries.
**Across both split files:** 22 universal + 8 code-adapter = 30 active BL (BL-23, BL-27 retired).

---

*Split generated 2026-04-11 by EraDev v9 Phase 1.D [COHERENCER]. Source of truth for tagging: `reports/v9_phase0b_tagging_2026-04-11.md` (Builder) + this file (Coherencer).*
