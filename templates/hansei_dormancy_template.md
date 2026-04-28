# Hansei: Dormancy Audit (4-session window)

> Trigger: Ω_pruned == 0 over the trailing 4-session window (no BL/Inv/Lesson retired via retire-pass).
> Cadence: post-RT-12 every 4 sessions, OR ad-hoc when meta.md §14 item 9 prints Ω_pruned = 0.
> Authoring role: Coherent. Reviewer: META + Operator.
> Anchors: BT-1 Phase 2.3 P-cure (retirement organ); D-cure leverage_factor (axis); M-cure intent_ratio (META discipline).
> Output path: `reports/hansei-dormancy-{YYYY-MM-DD}.md`.

## 1. Window scope

- Sessions covered: S{N-3} .. S{N} (4 sessions, inclusive).
- Date range: {YYYY-MM-DD} .. {YYYY-MM-DD}.
- Commit range: `{HASH_OLDEST}..{HASH_NEWEST}`.
- Ω_pruned (measured): {N}. Healthy threshold: ≥ 1 per window.
- Companion metrics: leverage_factor = {X.XX}, intent_ratio = {X.XX} (from §14 item 9 prints).

## 2. Candidate retirees (T1+T2 falsifiable list)

For each [ACTIVE] non-EMP entry in `projects/{PROJECT}/lessons.md` and root BL files, evaluate:

| ID | Title | freshness | Codified? | Superseded? | Domain still applies? | Verdict |
|---|---|---|---|---|---|---|
| L-_ | _ | _ | yes/no + anchor | yes/no + by-ID | yes/no | RETIRE / KEEP / REVALIDATE |

**EMPs are immortal** — never retire. Skip.

**Verdict legend:**
- RETIRE — content fully codified into framework artifact OR fully superseded by a later [ACTIVE] entry. Move to lessons_archive.md with `retire_pass: true`.
- KEEP — still load-bearing, fresh, not subsumed.
- REVALIDATE — boundary case; reset `valid_from` and re-test next window.

## 3. Load-bearing canary (do NOT retire)

Per BT-1 spec, retirement of a load-bearing BL/Inv must be REJECTED. Run the canary:

- [ ] For each RETIRE candidate, grep the framework corpus for hard references: `grep -rE "({ID}|Invariant {N})" eradev{,_RU}.md meta{,_RU}.md CLAUDE.md roles/ templates/ .claude/ .githooks/`.
- [ ] If the candidate is cited in normative text (not just history/archive), DOWNGRADE verdict from RETIRE → REVALIDATE.
- [ ] Document each rejected retirement in §5 below.

## 4. Retire-pass execution checklist

For each entry approved for retirement:

- [ ] Append entry to `projects/{PROJECT}/lessons_archive.md` using the template at the top of that file. Include `retire_pass: true` in the metadata comment.
- [ ] Mark the source row in `lessons.md` with `[ARCHIVED YYYY-MM-DD]` and the `ended:` date.
- [ ] Stage both files, commit with subject containing `[retire-pass]` (this exempts the commit from D-cure leverage_factor BLOCK and from phantom-newness-check.sh per existing sentinels).
- [ ] After commit, verify `git log --grep='\[retire-pass\]' --since='4 sessions ago'` returns the new commit.
- [ ] Increment Ω_pruned for the next bootstrap §14 item 9 print.

## 5. Rejected retirements (audit trail)

| Candidate ID | Reason rejected | Re-evaluate at session |
|---|---|---|
| _ | load-bearing reference in {file:line} | S{N+4} |

## 6. Dormancy verdict

- [ ] **GREEN** — ≥ 1 retire-pass executed this window, Ω_pruned now ≥ 1. No corrective action.
- [ ] **YELLOW** — 0 retire-pass executed but ≥ 3 KEEP/REVALIDATE rationales documented (corpus genuinely fresh). Schedule next audit at S{N+4}, no escalation.
- [ ] **RED** — 0 retire-pass AND no documented rationale (retirement organ atrophy). Trigger:
  - Spawn Coherent for compression pass on lessons.md (see meta.md §14 item 9-extended BL compression).
  - Re-run this template at S{N+1} (not S{N+4}) — accelerated cadence.
  - If 2 consecutive RED windows: escalate to BT-1 v2 framing review (per BT-1 roadmap §C5 fail-action).

## 7. Hooks & framework alignment (sanity)

- [ ] `.githooks/phantom-newness-check.sh` accepts `[retire-pass]` sentinel (existing override; no new flag added).
- [ ] `.claude/hooks/check-leverage.sh` exempts `[retire-pass]`-tagged commits from LF<0.10 BLOCK (D-cure shipped).
- [ ] `.claude/hooks/enforce-delegation.sh` does NOT misclassify retire-pass edits to lessons_archive.md (Coherent Synthesis output type, ε_meta whitelist).

## 8. Cross-project signal (optional)

If multiple projects retired entries this window:
- Note any pattern (same axis falling dormant across projects → potential framework smell).
- Flag for Visionary review at next RT-1.

---

**Sign-off:** Coherent {agent_id} / META review {date} / Operator ack {date}.
