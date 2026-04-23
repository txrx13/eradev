# v10 AGENTS.md.template Drift Fix — Builder Report

**Date:** 2026-04-23
**Role:** [BUILDER]
**Scope:** Close last v10 drift item in `templates/AGENTS.md.template`.

## Summary

Fixed stale `v9` version markers in `templates/AGENTS.md.template`, synced to skill mirror, rebuilt `eradev-skill.zip`. All four verifications pass. One-line-scope task expanded by A_sigma check to include a second identical drift line (line 77) — kept in scope because both are the same pattern (version marker on v10 overlay).

## Modified Artifacts

1. `/Users/antonpankratov/Downloads/eradev/templates/AGENTS.md.template`
   - Line 43: `## Domain Awareness (v9)` → `## Domain Awareness (v10)`
   - Line 77: `` `domain:` block (v9) `` → `` `domain:` block (v10) `` (A_sigma: same drift pattern, parent CLAUDE.md line 48 uses v10)
2. `/Users/antonpankratov/Downloads/eradev/.claude/skills/eradev/templates/AGENTS.md.template`
   - Synced via `cp` from root. `diff` → empty.
3. `/Users/antonpankratov/Downloads/eradev/eradev-skill.zip`
   - Rebuilt via `scripts/build-skill.sh`. Size: **361K** (previous commit: identical size range).

## Preserved (NOT Changed)

- Line 48: `(REJECT if continuous — v9 scope)` — historic OOD scope ref, parent CLAUDE.md line 27 keeps identical `v9 scope` wording. Semantic reference, not a version marker.

## Verification

| Check | Expected | Actual |
|-------|----------|--------|
| `grep "Domain Awareness (v9)"` on root + mirror | 0 matches | 0 matches |
| `grep "Domain Awareness (v10)"` on root + mirror | 2 matches | 2 matches |
| `unzip -p eradev-skill.zip ...` → grep Domain Awareness | `(v10)` | `(v10)` |
| `diff root mirror` | empty | empty |
| `build-skill.sh` exit code | 0 | 0 |
| `build-skill.sh` v10 assertions | pass | OK SKILL.md v10 + OK role files v10-clean |

## Security & Integrity

- [x] No secrets; docs-only edit
- [x] Backward compat preserved (text-only version marker)
- [x] Zip content verified (first-line check on extracted file)

## Blast Radius

**LOW.** Documentation version marker in a template file. No runtime behavior change. Affects operator perception of skill version only.

## B-check

- F = 1.0 (read full AGENTS.md.template + parent CLAUDE.md for convention cross-ref)
- E = 1.0 (addresses intent: close drift, rebuild zip with fix)
- (1-σ) = 1.0 (parent CLAUDE.md convention matched on both v10 and preserved v9-scope; no conflicts)
- Λ = 1.0 (applied BL pattern from commits 181d685 / cb44651: root → mirror → zip rebuild)
- **B = 1.0**
