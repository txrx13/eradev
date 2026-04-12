# BL Candidates (staging)

> These are candidate BL entries awaiting the next compression pass.
> Compression triggers when count >= 5.
> Current count: 0
>
> Process (Coherencer):
> 1. Read BL_CANDIDATES.md. If fewer than 5 candidates, STOP.
> 2. Read current BOOTSTRAP_LESSONS.md (or split files).
> 3. For each candidate: does an existing BL already cover this failure mode?
>    - Yes: merge candidate insight into existing BL as amendment. No new BL number.
>    - No: identify weakest existing BL for potential merge-and-replace.
> 4. After merge: grep for all old BL-N references, update them.
> 5. Cap stays at 30. No exceptions.
>
> Full Coherencer compression protocol: reports/v10_omega_compression_decay_spec_2026-04-12.md Section 2
> Classification taxonomy: PROMOTE / MERGE / DISCARD / DEFER
>
> Format per candidate:
> ### CAND-N: {title}
> **Source:** {report or session}
> **Proposed rule:** {rule}
> **Overlap check:** Does BL-{N} already cover this? Y/N
> **Date:** {ISO date}

(no candidates yet)
