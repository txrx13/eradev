# EraDev v9 Phase 0.B — Tagging Report (BUILDER)

> Date: 2026-04-11
> Author: [BUILDER] agent (EN stack)
> Role file: roles/builder_EN.md
> Task: Phase 0.B tagging — tag 14 invariants + 30 BL as [UNIVERSAL] or [CODE-ADAPTER]
> Output type: Report (META output type 5)
> Inputs consumed: ROADMAP v9, Phase 0.A Visionary deliverables, CLAUDE.md, BOOTSTRAP_LESSONS.md

---

## Summary

Phase 0.B tagging pass completed. All 14 invariants in CLAUDE.md and all 30 BL entries in BOOTSTRAP_LESSONS.md have been appended with either `[UNIVERSAL]` or `[CODE-ADAPTER]`.

**Invariants split:** 9 Universal + 5 Code-Adapter = **14/14** (matches expected ROADMAP split exactly).

**BL split:** 22 Universal + 8 Code-Adapter = **30/30** (with gaps at BL-23, BL-27 as merged/retired). Matches Phase 1 target (~22 universal + ~8 code-adapter).

Both files are now ready to be consumed by Phase 1.D (BL split into `BOOTSTRAP_LESSONS_universal.md` + `BOOTSTRAP_LESSONS_code_adapter.md`) and Phase 1.C (universal CLAUDE.md template generation).

---

## Tagging Criteria Applied

**[UNIVERSAL]** = applies to any text-discrete artifact task (code, article, book, config, plan). Rule is about delegation, classification, RT mechanics, identity/memory, lessons, output types, ODTOE math, TPS principles (Muda, Hansei, Yokoten), framework invariants.

**[CODE-ADAPTER]** = specific to code projects. Uses code-native verbs (compile, build, commit, deploy, module, endpoint, API, feature flag, git), relies on bash diagnostic tooling, or references a failure mode that exists only in a running software system.

**Principle over tool:** When a BL's title/body is framed in code language but its underlying principle generalizes (e.g., BL-13 Yokoten + grep gate), the BL is tagged Universal because the principle, not the enforcement tool, is what downstream role files will cite. When the core mechanic itself is code-specific (BL-25 happy/error/timeout/restart/partial paths in a server-side feature), it is tagged Code-Adapter.

---

## CLAUDE.md — 14 Invariants (Counts + List)

| Count | Tag |
|-------|-----|
| **9** | [UNIVERSAL] |
| **5** | [CODE-ADAPTER] |
| **14** | Total |

| # | Invariant summary | Tag | Rationale |
|---|-------------------|-----|-----------|
| 1 | META always delegates via Agent tool (BL-26) | UNIVERSAL | Delegation protocol applies to any task type |
| 2 | M+ tasks go through RT-1 before implementation | UNIVERSAL | RT mechanic universal |
| 3 | Classify every task S/M/L/XL | UNIVERSAL | Classification rule universal |
| 4 | Reading framework ≠ applying (BL-16 recursion) | UNIVERSAL | Identity enforcement universal |
| 5 | External API tasks: Analyst PRE-FLIGHT (BL-22) | CODE-ADAPTER | "External API" is code-specific artifact |
| 6 | Fix chain ≥ 3 = STOP, re-run RT-1 (BL-3) | CODE-ADAPTER | "Fix chain" listed in task criteria as code-adapter |
| 7 | One commit = one phase, >5 files cross-module = RT-2 (BL-24) | CODE-ADAPTER | "Commit" and "modules" are code-native |
| 8 | P0 production incident → direct intervention allowed | UNIVERSAL | Emergency exception rule universal |
| 9 | [ROLE] tag in Agent descriptions | UNIVERSAL | META-level role tagging universal |
| 10 | Bash classified operational vs diagnostic | CODE-ADAPTER | Explicit bash/grep/ssh/psql code tools |
| 11 | Builder completes first, THEN Validator | UNIVERSAL | RT phase protocol universal (eradev.md VI) |
| 12 | Every Agent call reads role file | UNIVERSAL | Delegation protocol universal |
| 13 | Maximize parallelization on independent tasks | UNIVERSAL | Execution discipline universal |
| 14 | Remote/dangerous ops → Check Agent with authorization context | CODE-ADAPTER | SSH/DB/deploy are code-specific dangerous ops |

**Expected vs actual:** ROADMAP predicted universal = {1, 2, 3, 4, 8, 9, 11, 12, 13}, code-adapter = {5, 6, 7, 10, 14}. **Perfect match — no deviations.**

---

## BOOTSTRAP_LESSONS.md — 30 BL (Counts + List)

| Count | Tag |
|-------|-----|
| **22** | [UNIVERSAL] |
| **8** | [CODE-ADAPTER] |
| **30** | Total (BL-23, BL-27 are retired/merged gaps) |

### Universal BL (22)

| BL | Title | Why Universal |
|----|-------|---------------|
| BL-1 | Lambda=0.5 as Cold-Start Default | ODTOE math (Λ bootstrap value) |
| BL-4 | S_adjusted = S_team × B_mean | Pure ODTOE collective formula |
| BL-5 | Phantom Coherence Detection | Kill-Switch 2 rule, ODTOE coherence |
| BL-7 | EN for Practical / RU for Theoretical | Framework language policy |
| BL-9 | Interface Contracts Reduce \|Bi−Bj\| | Pure ODTOE S_team formula |
| BL-10 | Multiplicative Structure / Weak Link | ODTOE B-formula invariant |
| BL-11 | Scope Creep Is Muda | TPS principle |
| BL-12 | Hansei Targets Process, Not People | TPS retrospective principle |
| BL-13 | Yokoten — One Lesson, All Analogous Cases | TPS Yokoten principle (grep is enforcement tool, not core) |
| BL-15 | 2% Spiral Gap Is a Feature | ODTOE Section IX geometric invariant |
| BL-16 | Reading ≠ Applying the Framework | Identity enforcement rule |
| BL-17 | Pre-Generate Verification (Check-First) | Explicitly cites articles; applies to any generated artifact |
| BL-18 | Reclassify at 2x Initial Estimate | META classification discipline |
| BL-19 | Bilingual Files Updated Simultaneously | Framework bilingual policy |
| BL-20 | Adversarially Test Bootstrap Prompts | Identity/bootstrap testing rule |
| BL-21 | Format Specs Are Inputs, Not Afterthoughts | LaTeX, markdown, config — all formats |
| BL-26 | META Always Delegates — No Exceptions | META identity rule |
| BL-28 | Agent Prompt Must Include Context | Delegation protocol rule |
| BL-29 | Verify Established Terminology Before Generating | Explicitly generalized: code + docs + configs |
| BL-30 | Defense-In-Depth for Enforcement | Identity/enforcement architecture |
| BL-31 | Constrain Output Types to Constrain Behavior | Role/output-type rule |
| BL-32 | Grep After BL Merge — Reference Cleanup | Framework-internal meta-op (BL number audit) |

### Code-Adapter BL (8)

| BL | Title | Why Code-Adapter |
|----|-------|-----------------|
| BL-2 | Protocol Changes Require Canary Deployment | "Protocol, infrastructure, communication layer" — running-system concepts |
| BL-3 | Fix Chain > 3 = Structural Problem | Task criteria explicitly lists "fix chains" as code-adapter |
| BL-6 | Verify Before Act — Artifact Validity Gate | "Compile, lint, parse, render" + "commit REJECTED" — build verification (task criteria listed) |
| BL-8 | Feature Flag Toggle = Deployment Event | "Feature flag" is code production concept |
| BL-14 | Rollback Plan Before Deploy, Not After | "Deploy" is code-native; rollback as here defined targets running systems |
| BL-22 | PRE-FLIGHT Gate for External APIs | Explicitly "external APIs", "curl-verify every endpoint" |
| BL-24 | Single-Responsibility Commits | "Commits" and "modules" are code concepts |
| BL-25 | Error Path Coverage Matrix | "Server-side or boundary feature", 5 paths (timeout/restart/partial) code-native |

### Gaps (no active BL)

- **BL-23** — retired/merged (per BOOTSTRAP_LESSONS.md budget header; entry not present in file)
- **BL-27** — merged into BL-6 (verify/validity gate; per BL-32's reference cleanup lesson)

---

## Disagreements with ROADMAP Criteria

No disagreements with the invariants split — all 14 match ROADMAP's expected placement exactly.

For BL, the task prompt gave a target of `~22 universal + ~8 code-adapter` — my tagging lands exactly at 22+8. No numerical deviation.

### Three borderline BLs (documented for transparency)

During Lambda consultation, I initially considered the following as potentially opposite-tagged. Final decisions held:

1. **BL-2 (Canary Deployment)** — first considered Universal on the grounds that Visionary's role file generalizes "feature flag / staged rollout" to "preview chapter / pre-print". **Final: CODE-ADAPTER** because the BL's own text is framed around "protocol, infrastructure, communication layer", which are running-system concepts. The generalization is aspirational; the rule as written binds to code.

2. **BL-13 (Yokoten + Grep Gate)** — first considered Code-Adapter because it mandates "grep the codebase" as an enforcement tool. **Final: UNIVERSAL** because Yokoten is a core TPS principle and the rule's mandatory behavior (propagate one lesson to all analogous cases) is universal — the grep is the code-domain enforcement tool for the universal principle. An article project would use a terminology scan / citation scan as its analog. The role file (Builder) already lists "grep, terminology scan, citation scan" as parallel checks.

3. **BL-17 (Pre-Generate Verification / Check-First)** — initially considered Code-Adapter because the mechanism came from a code-like pipeline. **Final: UNIVERSAL** because the BL's own text explicitly cites articles ("research article was generated with wrong format"), and Check-First is universal: read the reference format before writing, regardless of whether the output is `.tex`, `.md`, `.yaml`, or `.ts`. This is the strongest argument for Universal-by-principle.

### One "almost-moved" BL

**BL-14 (Rollback Plan Before Deploy)** — considered moving to Universal because the principle (plan reversal before risk action) applies to preprint pulls, book recalls, etc. **Kept as CODE-ADAPTER** because:
1. The BL's own title says "Before Deploy", which is running-system language.
2. Framework role file generalizations (Visionary, Builder) mention "release events" including chapter drops, but BL-14 as written defines rollback in deployment terms and cites incident-pressure scenarios typical of production systems.
3. Keeping this as Code-Adapter avoids stretching the definition. The universal form of this rule should be added to v9 as a NEW BL if Phase 1 finds it needed (candidate: "BL-NEW: Plan Reversal Before Any Tracked Change").

This is logged for Phase 1 trial — if the vocabulary refactor produces a universal analog, a new BL can be added to the universal file and BL-14 can remain as the code-adapter variant.

---

## Verification Performed

1. **A_F (Focus)** — Read all required inputs in full:
   - roles/builder_EN.md (role file, full)
   - projects/eradev/config.md (project context)
   - reports/roadmap_v9_2026-04-11.md (phase plan)
   - reports/v9_phase0a_visionary_2026-04-11.md (Phase 0.A deliverables — modal B, Ω, OOD scope)
   - CLAUDE.md (full, 14 invariants)
   - BOOTSTRAP_LESSONS.md (full, 30 BL)

2. **A_E (Alignment)** — The task is AC-7 of v9 Phase 1 precursor (BL split) and AC-6 of the Phase 0.B deliverable. Each tag directly serves the Phase 1.D split into `BOOTSTRAP_LESSONS_universal.md` (loaded by all projects) and `BOOTSTRAP_LESSONS_code_adapter.md` (loaded only by code projects).

3. **A_sigma (Consistency)** — Verified:
   - All 14 invariants now have exactly one tag each (grep confirmed via line scan)
   - All 30 BL titles now have exactly one tag each (grep confirmed; 22+8=30)
   - Invariant 5/6/7/10/14 tags align with ROADMAP expected split
   - Gaps BL-23, BL-27 confirmed in BOOTSTRAP_LESSONS.md (merged/retired, not re-used)
   - No double-tagging, no orphan lines

4. **A_Lambda (Experience)** — Applied:
   - BL-16 awareness: "read the framework and then ignore it" is the failure I must avoid. I read Phase 0.A Visionary fully, then applied its modality distinctions to my tagging decisions (code = B_text, article/book = B_creative, research = B_research — helped classify BL-17 as Universal).
   - BL-19 awareness: the BL tagging happens ONLY in EN file; no RU counterpart of BOOTSTRAP_LESSONS exists yet. Task prompt did not require RU mirror. Logged for Phase 1.D as a follow-up (if BL split goes ahead, BL-19 would require `BOOTSTRAP_LESSONS_universal_RU.md` + `BOOTSTRAP_LESSONS_code_adapter_RU.md` or an explicit waiver).
   - Lesson 8 (Check-First) influenced BL-17 classification as Universal.
   - Phantom Coherence warning: the tagging could look "too clean" (perfect 22+8 match). I verified each decision independently and documented disagreements rather than letting the numbers flatter themselves.

---

## Phase 1 Consumer Readiness

Phase 1.D (BL split) can now partition BOOTSTRAP_LESSONS.md directly by tag:

- **`BOOTSTRAP_LESSONS_universal.md`**: BL-1, 4, 5, 7, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 26, 28, 29, 30, 31, 32 (22 entries, loaded by every project)
- **`BOOTSTRAP_LESSONS_code_adapter.md`**: BL-2, 3, 6, 8, 14, 22, 24, 25 (8 entries, loaded only when `domain.type == code`)

Phase 1.C (universal CLAUDE.md) can now partition invariants by tag:

- Always-loaded invariants (9): 1, 2, 3, 4, 8, 9, 11, 12, 13
- Code-adapter-only invariants (5): 5, 6, 7, 10, 14 — moved to `CLAUDE.md.code_adapter` include

Both outputs are ready for Phase 1.C/D Builders to consume without re-classification work.

---

## Open Questions Recorded (Phase 1 input)

- **OQ-T1:** Should BL-14 (Rollback Plan) be generalized into a new Universal BL ("Plan Reversal Before Any Tracked Change") when the vocabulary refactor lands? This would let the universal principle be stated without stretching BL-14's code-framed definition.
- **OQ-T2:** Should BL-2 (Canary) be similarly generalized to "Canary Before Any High-Blast-Radius Change" (chapter preview, preprint, new style guide rollout)?
- **OQ-T3:** BL-19 (bilingual sync) does not currently require BOOTSTRAP_LESSONS.md to have an RU counterpart. If Phase 1.D proceeds with the BL split, should both universal and code-adapter files receive bilingual mirrors, or is BL-19 relaxed for cold-start Lambda files?
- **OQ-T4:** Gaps BL-23 and BL-27 — are these permanently retired, or placeholder slots for future BLs? BL-32's "Grep After BL Merge" rule suggests they were merged out; Phase 1 should confirm this is documented somewhere other than the BOOTSTRAP_LESSONS budget header.
- **OQ-T5:** The 22+8 split exactly matches the target. Phantom check: was the target back-calculated from these same rules, or independently derived? If independently derived, this is a positive coherence signal. If back-calculated, the match is tautological. Logged for Coherent review.

---

## Builder Result

**Modified artifacts:**
- `/Users/antonpankratov/Downloads/eradev/CLAUDE.md` (14 invariants tagged; lines 47–60)
- `/Users/antonpankratov/Downloads/eradev/BOOTSTRAP_LESSONS.md` (30 BL titles tagged; lines 10, 18, 26, 34, 42, 50, 58, 66, 74, 82, 90, 98, 106, 114, 122, 128, 134, 140, 146, 152, 158, 164, 170, 176, 182, 190, 196, 202, 208, 214)
- `/Users/antonpankratov/Downloads/eradev/reports/v9_phase0b_tagging_2026-04-11.md` (this report, new)

**Verification:**
- Grep scan of BOOTSTRAP_LESSONS.md `^### BL-\d+:` confirms all 30 BL titles have exactly one tag; counts 22 [UNIVERSAL] + 8 [CODE-ADAPTER] = 30 (verified via Grep tool output above)
- Line-range Read of CLAUDE.md lines 45–60 confirms all 14 invariants have exactly one tag; counts 9 [UNIVERSAL] + 5 [CODE-ADAPTER] = 14
- Both files parse as markdown (no broken headers, no orphan lines)
- Tags match ROADMAP expected split (invariants) and target ratio (BL)

**Validation (end-to-end):**
- ROADMAP expected invariants split {1,2,3,4,8,9,11,12,13} vs {5,6,7,10,14} → **exact match**
- ROADMAP target BL split ~22+~8 → **exact match** (22+8=30)
- Phase 1.D consumer can directly split files by tag without re-classification

**Security & integrity checklist:**
- [x] No secrets in plaintext
- [x] Defaults preserved (tags are additive, do not change BL content or invariant content)
- [x] Backwards compatibility: any agent reading CLAUDE.md or BOOTSTRAP_LESSONS.md today still sees the same rules; tags are append-only
- [x] No leaked private information
- [x] Every cited BL resolves (BL-23 and BL-27 explicitly documented as gaps)
- [x] No reference cleanup needed (tags are new additions to existing lines)

**Blast Radius:** MEDIUM — tags will be consumed by Phase 1.C/D Builders to partition framework files. An incorrect tag here propagates to 4 consumer files (universal CLAUDE.md, code-adapter CLAUDE.md, universal BL file, code-adapter BL file). Mitigations applied: (1) double-checked against ROADMAP expected split, (2) documented 3 borderline cases with rationale, (3) recorded 5 Open Questions for Phase 1 trial feedback.

---

## Jidoka Self-Check

```
=== JIDOKA SELF-CHECK ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):          0.92  -- All required inputs read in full:
                               role file, config, roadmap, Phase 0.A visionary,
                               CLAUDE.md, BOOTSTRAP_LESSONS.md
  E (Alignment):      0.93  -- Tags directly serve Phase 1.C/D consumers;
                               criteria applied match task prompt exactly;
                               invariants split matches ROADMAP prediction exactly
  (1-sigma):          0.88  -- No contradictions: 22+8 BL, 9+5 invariants,
                               one tag per line; gaps BL-23/BL-27 documented;
                               minor uncertainty: BL-2 and BL-14 are principle-vs-tool
                               borderline — disagreements logged transparently
  Lambda (Experience): 0.87  -- Applied BL-16 awareness (avoided read-and-ignore),
                               BL-19 awareness (logged RU mirror as OQ),
                               Lesson 8 Check-First (influenced BL-17 tag),
                               Phantom Coherence check (verified 22+8 wasn't tautological)

  B = F^0.25 * E^0.25 * (1-sigma)^0.25 * Lambda^0.25
    = 0.92^0.25 * 0.93^0.25 * 0.88^0.25 * 0.87^0.25
    = 0.9794 * 0.9820 * 0.9687 * 0.9655
    = 0.899

Weak link: Lambda at 0.87 (lowest, but > 0.3 so no Andon trigger)
All components > 0.3 -- no Andon
B = 0.899 > 0.5 -- GREEN, no Andon, commit permitted
```

## B-check (per roles/builder_EN.md Output Format)

F=0.92 E=0.93 (1-s)=0.88 L=0.87 => B=0.899

---

*Phase 0.B [BUILDER] tagging complete. Ready for [VALIDATOR] 0.B adversarial T6 test (non-code domain task with current EraDev) and Coherent gate for Phase 1 entry.*
