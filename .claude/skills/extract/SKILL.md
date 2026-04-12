---
name: extract
description: "Manual background instinct extraction. Reads recent session context, compares against BL, writes candidates to BL_CANDIDATES.md."
---

# /extract -- Manual Instinct Extraction

Run the background instinct extraction prompt on demand.

## When to use
- Before ending a session (capture patterns before context evaporates)
- After a significant event (fix chain, enforcement violation, novel pattern)
- When the operator notices a pattern worth capturing

## Process
Read `templates/extraction_prompt.md` and execute its protocol against the current session context.

The extraction prompt will:
1. Read `BL_CANDIDATES.md` for existing candidates
2. Read `BOOTSTRAP_LESSONS.md` for current BL entries
3. Reflect on recent session work (last 5-10 tool results)
4. Write at most 1 candidate if a DRIFT or NOVEL pattern is found
5. Report result: wrote a candidate or found nothing new
