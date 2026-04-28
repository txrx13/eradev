# BL Candidates (staging)

> These are candidate BL entries awaiting the next compression pass.
> Compression triggers when count >= 5.
> Current count: 0
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
