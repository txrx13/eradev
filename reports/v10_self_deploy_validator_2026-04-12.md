# Validator Report: v10 Self-Application Deploy (Step 2)

**Date**: 2026-04-23 (operator session date; report filename follows spec convention 2026-04-12)
**Scope**: EraDev framework repo self-application deploy (`/Users/antonpankratov/Downloads/eradev/`)
**Predecessor**: Step 1 Builder returned BLOCK on template regeneration; current `CLAUDE.md` preserved intact.
**Verified by**: [VALIDATOR] per Invariant 14 (META direct request).

## Activation Operator (A_F/A_E/A_sigma/A_Lambda)

- **A_F (Focus)**: Plan = validate deploy artifacts (hooks, CLAUDE.md, git hooks, settings, template drift). Artifact = actual filesystem state. Both read.
- **A_E (Alignment)**: Intent = verify deploy readiness for self-application; template drift is FOLLOW-UP, NOT blocker.
- **A_sigma (Consistency)**: Reconciled spec's `{PROJECT}` expectation against reality (see Finding 1 below).
- **A_Lambda (Experience)**: Priors — BL-16 (read-and-ignore), BL-24 (one commit = one phase), stale-output detection (Key Rule 5).

## Detailed Findings

### 1. Hooks executable — PASS (6/6)
`/Users/antonpankratov/Downloads/eradev/.claude/hooks/`:
- `agent-context-check.sh` — rwxr-xr-x, 3044 B
- `agent-role-tag.sh` — rwxr-xr-x, 747 B
- `bl-tier-check.sh` — rwxr-xr-x, 1823 B (newer, Apr 20)
- `enforce-delegation.sh` — rwxr-xr-x, 2295 B
- `rework-framing-detector.sh` — rwxr-xr-x, 1737 B (newer, Apr 21, supports Invariant 16)
- `rt1-composition-gate.sh` — rwxr-xr-x, 2109 B (newer, Apr 21, supports Invariant 15)

Both required hooks (`enforce-delegation.sh`, `agent-context-check.sh`) present + executable. All 4 newer hooks bonus-present + executable.

### 2. CLAUDE.md correctness — PASS WITH CONTEXT NOTE
- `grep "{PROJECT}"` → **4 matches** (lines 24, 48, 49, 52). Spec expected 0.
  - **A_sigma reconciliation**: These are NOT deploy-time unresolved placeholders. They are intentional protocol prose describing the META loading sequence for **any** active project. Line 52 explicitly instructs "Replace {PROJECT} with the active project name." The framework repo hosts multiple projects (`projects/eradev/`, `projects/plugy/`, `projects/academic-lab/`, `projects/odtoe-articles/`), so hardcoding a single project name would BREAK multi-project operation.
  - **Verdict**: This is a SPEC EXPECTATION MISMATCH, not an artifact defect. The bare placeholder is CORRECT for self-application where META dynamically resolves `{PROJECT}` per-task.
- `grep "EraDev v10"` → **1 match** (line 1). PASS.
- `grep "projects/eradev/"` → **0 matches**. Same reason as above — framework uses generic `projects/{PROJECT}/`. NOT a defect.
- **v10 content audit**:
  - Domain Awareness (v10) section present — line 22. PASS.
  - 3 modalities (text/creative/research) with full weight tables — lines 29-32. PASS.
  - 6-step Mandatory Loading Sequence — lines 45-50 (includes `domain.skin` conditional step 6). PASS.
  - 6 output types with Check Agent — line 18 in table. PASS.
  - Omega note in Session Entry Protocol — line 59 ("Item 9 now computes Omega(H_hist)..."). PASS.
  - CronCreate background extraction note — line 60. PASS.
  - 16 Invariants (including BL-34 composition-hazards and BL-35 rework-framing) — lines 70-85. PASS.

### 3. Git hooks configured — PASS
- `git config core.hooksPath` → `.githooks`. PASS.
- `/Users/antonpankratov/Downloads/eradev/.githooks/pre-commit` — exists, rwxr-xr-x, 742 B. PASS.

### 4. Settings.json — PASS
- File: `/Users/antonpankratov/Downloads/eradev/.claude/settings.json` (1058 B, valid JSON, 52 lines).
- Hook wiring verified: PreToolUse matchers route Edit|Write|Bash → `enforce-delegation.sh`; Edit|Write → `bl-tier-check.sh` + `rt1-composition-gate.sh`; Agent → `agent-role-tag.sh` + `agent-context-check.sh`. UserPromptSubmit → `rework-framing-detector.sh`. All paths resolvable.

### 5. Template parity (INFO, not blocker) — DRIFTED
`/Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template`:
- Header: `# EraDev v10 -- Auto-Bootstrap` — v10 (NOT v9, corrects Step 1 Builder's claim; header itself is current).
- Domain Awareness section: `## Domain Awareness (v9)` — **DRIFTED** (should be v10 per self-application).
- Omega note: **MISSING** (grep returned 0 matches).
- CronCreate note: **MISSING** (grep returned 0 matches).
- Line count: template 103 vs current 105 — delta consistent with the 2 missing notes.

**Impact**: Consumer-facing drift. New projects bootstrapping from the EraDev template would NOT get the v10 Omega + CronCreate guidance, and would see a `(v9)` marker inside a `v10` header — internal inconsistency.

**Tag**: `TEMPLATE-DRIFT-FOLLOWUP` — schedule as separate task; does NOT block current self-application deploy.

### 6. Path-prefix convention — CORRECT (documented)
- Self-application CLAUDE.md uses bare paths: `eradev.md`, `roles/{role}_EN.md`, `templates/domain_skin.{type}.md`, `projects/{PROJECT}/config.md`.
- Consumer template uses prefixed paths: `eradev/eradev.md`, etc. (not re-verified in detail — out of scope for this step).
- Each is correct for its context; no action needed.

## Jidoka Self-Check
```
=== JIDOKA SELF-CHECK ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.90 -- Plan + all 5 artifact classes read; spec contradictions surfaced.
  E (Alignment):   0.95 -- Verified against INTENT (deploy ready? yes), not naive grep-count.
  (1-sigma):       0.90 -- Reconciled {PROJECT} spec/reality mismatch explicitly; no silent contradiction.
  Lambda:          0.85 -- BL-16, BL-24, Key Rule 5 (stale output), Invariant 15/16 hooks checked.
  B = 0.90 * 0.95 * 0.90 * 0.85 = 0.654  -> above 0.5 threshold, no ANDON.
```

## Summary Line

```
Hooks executable:          PASS (6 files checked: 2 required + 4 newer)
CLAUDE.md no placeholder:  PASS WITH CONTEXT NOTE (4 {PROJECT} refs are intentional protocol prose, not deploy drift; framework is multi-project)
CLAUDE.md v10 content:     PASS (Domain Awareness v10, 6 loading steps, 6 output types w/ Check Agent, Omega note, CronCreate note, 16 Invariants)
Git hooksPath:             PASS (.githooks, pre-commit executable)
Settings.json:             PASS (valid JSON, 4 PreToolUse matchers + 1 UserPromptSubmit wiring all 6 hooks)
Template parity (info):    DRIFTED (TEMPLATE-DRIFT-FOLLOWUP: v9 marker in Domain Awareness section; Omega note missing; CronCreate note missing — consumer template only)
Verdict:                   PASS WITH NOTES
B-check: F=0.90 E=0.95 (1-s)=0.90 L=0.85 => B=0.654
```

## Verdict rationale

**PASS WITH NOTES** — self-application deploy artifacts are current and correct. META may proceed to Step 3 (framework load + SESSION BOOTSTRAP checklist).

**Notes for META to carry forward**:
1. `TEMPLATE-DRIFT-FOLLOWUP`: bring `templates/CLAUDE.md.template` Domain Awareness header to (v10) and add Omega + CronCreate notes. Separate task.
2. Future validator spec updates: clarify that `{PROJECT}` in self-application `CLAUDE.md` is expected prose, not a deploy-time substitution target (avoid re-triggering this spec/reality reconciliation).
