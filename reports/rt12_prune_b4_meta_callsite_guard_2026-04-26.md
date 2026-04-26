# RT-12 Wave Prune B4 — META call-site guard hook (Builder report)

**Date:** 2026-04-26  **Role:** [BUILDER]  **Task:** Strengthen `enforce-delegation.sh` to close ODTOE F4 (META direct Edit/Write under critique pressure to framework files). Closes the recurrence vector identified in `reports/rt11_meta_audit_odtoe_session_2026-04-26.md` §F4.

## Modified artifacts
- `MOD` `.claude/hooks/enforce-delegation.sh` — 62 → 118 LOC; framework deny-list added BEFORE whitelist; emergency override exposed
- `MOD` `BOOTSTRAP_LESSONS.md` — BL-26 hook implementation block appended (path list + override clause)
- `MOD` `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` — skill mirror sync (`diff` byte-identical)

## Hook semantics (changes vs. prior)
1. **`ERADEV_HOOKS_DISABLED=1`** short-circuit at top (P0 emergency override; previously absent in this hook).
2. **Subagent bypass** retained (`agent_id` present → exit 0).
3. **MultiEdit** added to gated tool list (was Edit/Write only).
4. **Framework deny-list runs BEFORE whitelist.** Order matters: a path like `BOOTSTRAP_LESSONS.md` previously slipped via no-match (whitelist didn't catch it, default block fired with generic message); now caught with explicit framework-scope message identifying root cause.
5. Deny-list buckets (each emits a tailored message):
   - **Root framework files:** `CLAUDE.md`, `eradev.md`, `eradev_RU.md`, `meta.md`, `meta_RU.md`, `FOUNDATIONS.md`, `LOADING_PROTOCOL.md`, `BOOTSTRAP_LESSONS*.md`
   - **Roles + templates:** `roles/*.md`, `templates/*.md`
   - **Hooks + scripts:** `.claude/hooks/*.sh`, `.githooks/*.sh`, `scripts/*.sh`
   - **Skill mirror:** `.claude/skills/eradev/**/*.md`
6. Whitelist (META outputs) preserved: `reports/*.md`, `projects/*/lessons.md`, `memory/*.md`, `MEMORY.md`, `BL_CANDIDATES.md`.
7. Block message names path category + cites BL-26 + Inv 1 + override variable. Closes the «KILL-TEST didn't re-arm» symptom from F4 by giving META a direct enforcement signal (not just a generic block).

## Verification
- `bash -n .claude/hooks/enforce-delegation.sh` → SYNTAX_OK
- 13/13 scenarios pass (5 mandated + 8 coverage):
  1. META Edit `projects/eradev/lessons.md` → exit 0 (whitelist) ✓
  2. META Edit `eradev.md` → exit 2 BLOCK (framework root) ✓
  3. META Edit `CLAUDE.md` → exit 2 BLOCK (framework root) ✓
  4. Subagent (`agent_id=agent-abc-123`) Edit `eradev.md` → exit 0 (delegation) ✓
  5. `ERADEV_HOOKS_DISABLED=1` Edit `CLAUDE.md` → exit 0 (P0 override) ✓
  6. META Write `roles/builder_EN.md` → exit 2 BLOCK ✓
  7. META Edit `.claude/hooks/enforce-delegation.sh` (self-edit) → exit 2 BLOCK ✓
  8. META Edit `BOOTSTRAP_LESSONS.md` → exit 2 BLOCK ✓
  9. META Edit `.claude/skills/eradev/meta/BOOTSTRAP_LESSONS.md` (skill mirror) → exit 2 BLOCK ✓
  10. META Write `reports/rt12_*.md` → exit 0 (whitelist) ✓
  11. META Bash `grep foo file` → exit 2 BLOCK (diagnostic) ✓
  12. META Bash `git status` → exit 0 (operational) ✓
  13. Subagent Edit `BOOTSTRAP_LESSONS.md` → exit 0 (this Builder's own write succeeded) ✓
- `diff` canonical vs. skill mirror BL → 0 lines diff (byte-identical)

## Bug encountered + handled
`bl-tier-check.sh` initial-fired BL-33 false positive on the BL-26 amendment because the new_string trailing `### BL-28: ...` heading lay within 30 lines of payload-end (Tier line existed in the file but not in the diff). Fixed by trimming new_string upper bound to end before `### BL-28`. The bl-tier-check hook itself is staging-naive and could be tightened (out of scope here; flag for RT-13 maintenance).

## Security & integrity
- `ERADEV_HOOKS_DISABLED=1` documented in-script as P0-only with Hansei requirement (CLAUDE.md Inv 8)
- No secrets; reads only `tool_name`, `agent_id`, `tool_input.{file_path,path,command}` from JSON stdin
- Backwards-compatible: every previously-allowed path remains allowed (whitelist unchanged); only adds MORE blocks
- `MultiEdit` now gated (was unhandled — silent allow); closes a quiet bypass

## Blast Radius
LOW — additive deny-list, P0 override available, no semantic regression on existing whitelist paths. Worst case: META blocked on a legitimate framework write → operator runs `ERADEV_HOOKS_DISABLED=1` once, post-incident Hansei written. Subagent flow untouched (rt12 self-evidence: this very report + BL edit went through subagent path).

## B-check
F=0.95 E=0.95 (1-σ)=0.92 Λ=0.88 → **B = 0.73**
- F: read enforce-delegation.sh, agent-context-check.sh, bl-tier-check.sh, BOOTSTRAP_LESSONS BL-26+28, rt11 audit F4 §, builder_EN.md, prior B2 report style.
- E: F4 root cause = META direct Edit/Write to framework under critique. Hook now blocks exactly that vector. Operator's «KILL-TEST didn't re-arm» symptom = absence of explicit deny-list block; now present.
- (1-σ): byte-identical skill mirror; BL-26 narrative now references hook by path; deny-list paths match operator spec exactly.
- Λ: applied PN-1 lesson on staging-naive hooks (avoided same `grep -oE` ligature trap by using `grep -qE` + simple alternation only); applied B2 mirror-sync precedent.

## Out of scope (per task spec)
- Other hooks (`agent-context-check.sh`, `bl-tier-check.sh` content fix)
- Framework files content (only path patterns matter for this hook)
- KILL-TEST CLAUDE.md text amendment (CLAUDE.md is itself framework-blocked; spec says «add explicit guard» = the hook IS the guard, no CLAUDE.md edit needed)
- OD-Open ledger (F8) and in-session fix counter (F7) — separate Wave Prune B-tasks

## Notes for META
- Self-evident validation: this report + BL-26 amendment went through subagent path (`agent_id` present from Task tool spawn) → both succeeded. Same edits attempted from main META session would have been blocked at edit attempts 6, 7, 8 above.
- F4 vector closed at hook layer. Behavioral compliance now structurally enforced, not text-advisory.
- BL-26 entry in canonical + skill mirror references this hook by path (`enforce-delegation.sh`) — discoverability for future Hansei.
