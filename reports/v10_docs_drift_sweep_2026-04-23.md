# v10 Docs Drift Sweep -- 2026-04-23

> Role: [BUILDER]
> Scope: residual "14 invariant" drift after FOUNDATIONS + README update
> Source: META direct request (Invariant 14) -- inventory sweep found 2 residual spots

---

## Builder Result

**Modified artifacts:**
- `/Users/antonpankratov/Downloads/eradev/templates/cross_harness_requirements.md` (line 84: "14 invariants" -> "16 invariants")
- `/Users/antonpankratov/Downloads/eradev/.claude/skills/eradev/templates/cross_harness_requirements.md` (synced mirror via `cp`)

**Context of drift:**
Line 84, R3 (Auto-loading project instructions), rationale line:
- Before: `META identity, 14 invariants, 6 output types, and mandatory loading sequence...`
- After:  `META identity, 16 invariants, 6 output types, and mandatory loading sequence...`

Aligned with `CLAUDE.md` `## Invariants` block (items 1-16, including BL-34 Invariant 15 and BL-35 Invariant 16 added in v10 PLUGY uplift, commit `cb44651`).

**Verification:**
- `diff templates/cross_harness_requirements.md .claude/skills/eradev/templates/cross_harness_requirements.md` -> empty (mirrors identical).
- `grep "14 invariant"` across both files -> 0 matches.
- `grep "16 invariants"` across both files -> 1 match each (line 84), matching CLAUDE.md roster.

**Validation:**
- Only the 2 files in scope were edited. No other edits.
- Source-of-truth file (`templates/`) edited first, mirror overwritten via `cp` (not parallel edit) -> guarantees byte-identical mirror.
- Schema of R1-R8 requirements + compat matrix untouched; only the bootstrap rationale sentence was updated.

**Security & integrity checklist:**
- No secrets, no credentials, no external refs touched.
- Backwards compat: the sentence was a narrative rationale, not a protocol or schema key -> zero downstream consumer impact.
- Invariant-count statement in `cross_harness_requirements.md` now matches `CLAUDE.md` `## Invariants` (source of truth), consistent with README FOUNDATIONS.

**Blast Radius:** LOW (one sentence per file; narrative rationale only; no protocol/schema/config affected).

**B-check:** F=1.0 E=1.0 (1-s)=1.0 L=1.0 => B=1.0
- F: read root file in full, mirror spot-checked at line 84.
- E: fix addresses exactly the drift the inventory sweep flagged.
- (1-sigma): verified against CLAUDE.md source of truth; mirror byte-identical to root.
- Lambda: v10 PLUGY uplift precedent (cb44651) added invariants 15/16; this sweep closes the last residual doc reference.

---

## Notes for Coherencer / lessons

- Drift pattern: when invariant roster is extended (here +2: 14 -> 16), narrative rationale lines in Layer B docs (requirements specs, compat matrices) are a predictable drift site. Worth noting for future invariant-roster additions -- Analyst pre-flight checklist should include `grep -n "N invariant" templates/ README.md` where N is the prior count.
- Skill-mirror pattern: root-first edit + `cp` to `.claude/skills/eradev/templates/` is the standard sync path. Mirror directly only if the template is skill-only (not the case here).
