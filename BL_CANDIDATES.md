# BL Candidates (staging)

> These are candidate BL entries awaiting the next compression pass.
> Compression triggers when count >= 5.
> Current count: 2
>
> Process (Coherent):
> 1. Read BL_CANDIDATES.md. If fewer than 5 candidates, STOP.
> 2. Read current BOOTSTRAP_LESSONS.md (or split files).
> 3. For each candidate: does an existing BL already cover this failure mode?
>    - Yes: merge candidate insight into existing BL as amendment. No new BL number.
>    - No: identify weakest existing BL for potential merge-and-replace.
> 4. After merge: grep for all old BL-N references, update them.
> 5. Cap stays at 30. No exceptions.
>
> Full Coherent compression protocol: reports/v10_omega_compression_decay_spec_2026-04-12.md Section 2
> Classification taxonomy: PROMOTE / MERGE / DISCARD / DEFER
>
> Format per candidate:
> ### CAND-N: {title}
> **Source:** {report or session}
> **Proposed rule:** {rule}
> **Overlap check:** Does BL-{N} already cover this? Y/N
> **Date:** {ISO date}

### CAND-1: Framework Universality (promotion to universal BL)
- **Type:** NOVEL
- **Evidence:** Universality audit 2026-04-23 found >=11 framework files with project-specific references (project names, author names, operator paths). Iron Rule #7 exists in `projects/{name}/config.md` but wasn't enforced; classic BL-16 Lambda problem (knowledge without enforcement). Session 7 installed Universality Gate in eradev.md Section IV + pre-commit hook.
- **Proposed rule:** Specifics always go to `projects/{PROJECT}/`. Framework core (`eradev.md`, `meta.md`, `CLAUDE.md`, `roles/`, `templates/`) MUST NOT contain project-specific references. Pre-commit hook enforces. Override via `.universality-allowlist` with justification.
- **Overlap check:** No existing BL covers universality at framework-core scope. BL-19 (bilingual sync) and BL-16 (enforcement over knowledge) are related but orthogonal.
- **Extraction timestamp:** 2026-04-23
- **Session project:** eradev

### CAND-2: Refusal-Chain Threshold -> Runbook Handoff (extends BL-3 to authorization refusals)
- **Type:** NOVEL (extension of an existing numeric-threshold pattern, not a new mechanism)
- **Evidence:** Session 2026-07-09 -- a Check Agent ([ANALYST]/[VALIDATOR]) refused a delegated root-SSH + service-restart operation on an external server, three consecutive times, citing structural inability to verify that a quoted "operator's direct request" reflects genuine live human authorization rather than an in-prompt assertion. Invariant 14's existing "quote the operator's request" mechanism failed 3/3 for this reason class. Grepped CLAUDE.md, BOOTSTRAP_LESSONS*.md, BL_CANDIDATES.md, eradev.md, meta.md, glossary*.md, templates/ for "runbook", "authoriz", "refus", "prompt injection", "hand-off.*human" -- zero prior hits on the resolution ("no agent, subagent or META, can produce verifiable proof of live human authorization from inside a prompt; stop delegating the action and hand the class of action to the human's own execution environment instead").
- **Proposed rule:** Extend BL-3's numeric-threshold logic from "consecutive fixes" to "consecutive authorization-verification refusals" for the remote/dangerous-operation category already named in Invariant 14 (SSH, DB writes, service restarts, deploy). Reworded retries carry ~zero information gain per attempt (unlike a fix chain, where each attempt can test a genuinely different hypothesis) because no agent context can carry cryptographic proof of live human presence. 3 consecutive same-reason refusals = STOP (outer ceiling, not a quota); escalate on refusal #1 if the stated reason is already unambiguously this structural class. On STOP, produce a runbook Report (`reports/runbook-<task>-<date>.md`: exact commands, execution order, expected output, rollback plan in BL-8's shape) for the human operator to execute directly, in their own terminal, with their own credentials -- do not relocate execution to META or any other agent. A refusal matching this pattern is a correct (ANDON) outcome, not an agent failure.
- **Overlap check:** BL-3 (Y -- supplies the numeric-threshold-as-STOP shape, extended here from fix chains to refusal chains, a distinct failure class: an agent correctly declining, not an agent incorrectly failing). BL-8 (Y, reused not duplicated -- supplies the rollback-plan shape for the runbook). BL-22 (N -- different moment, pre-RT-1 endpoint/baseline verification vs. execution-time refusal handling). Invariants 1/9/12 (N tension -- confirmed explicitly: this does not have META or any agent execute the operation, so delegation/role-tag/self-load invariants are undisturbed). Landed immediately as a direct Invariant 14 sub-clause in CLAUDE.md (not a new BL-N) because the BL cap is FULL (30/30) and enforcement was needed this session; staged here so the next Coherent compression pass (trigger at >=5 candidates) can decide PROMOTE (fold permanently into BL-3's body, hybrid-retag [CODE-ADAPTER + UNIVERSAL]) vs. DEFER.
- **Extraction timestamp:** 2026-07-09
- **Session project:** eradev
