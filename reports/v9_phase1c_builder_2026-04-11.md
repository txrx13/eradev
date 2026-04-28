# EraDev v9 Phase 1.C — Builder Report (Universal CLAUDE.md)

> Date: 2026-04-11
> Author: [BUILDER] agent (EN stack)
> Role file: roles/builder_EN.md
> Task: Phase 1.C — make CLAUDE.md domain-aware; add DOMAIN check to Session Bootstrap; reference `templates/domain_skin.md.template` in loading sequence
> Output type: Report (META output type 5)
> Inputs consumed: Phase 0.A Visionary modal B-formula, Phase 0.A Analyst domain schema, Phase 0.B tagging report, ROADMAP v9, existing templates, existing meta.md Section 14

---

## Activation Operator Log

- **A_F (Focus)**: Read in full — roles/builder_EN.md, CLAUDE.md (project root, with v9 tags already applied from Phase 0.B), templates/CLAUDE.md.template, templates/CLAUDE.md.universal, templates/domain_skin.md.template (via ls verification), meta.md (full including Section 14), reports/v9_phase0a_visionary_2026-04-11.md (modal B-formula weights and selection rule), reports/v9_phase0a_analyst_2026-04-11.md (domain schema + skin template design), reports/v9_phase0b_tagging_2026-04-11.md (current tag state), reports/roadmap_v9_2026-04-11.md.
- **A_E (Alignment)**: Task intent is NOT "redesign CLAUDE.md" — it is "make META aware of the domain block that Phase 1.B adds to project configs, and surface a DOMAIN check in Session Bootstrap so modal B-formula selection is auditable". Additive only. Backward compat is non-negotiable.
- **A_σ (Consistency)**: Three CLAUDE files must stay in sync in structure (all three now carry v9 header + Domain Awareness); meta.md Section 14 must stay referenced as the Session Bootstrap source of truth; item numbering in Section 14 is load-bearing (KILL-TEST references it) → prefer 5b insertion over renumbering 1-13 to avoid rippling.
- **A_Λ (Experience)**: Applied BL-16 (read framework THEN apply — I did not just rewrite from memory), BL-19 (logged RU mirror status as deferred), BL-21 (format spec is an input — Phase 0.A Analyst already gave me the exact `domain:` block field names; I used those verbatim), BL-24 (one commit = one phase — this is all Phase 1.C and will be a single commit), Lesson 8 Check-First (verified domain_skin.md.template exists BEFORE referencing it in CLAUDE.md).

---

## Files modified

1. **`/Users/antonpankratov/Downloads/eradev/CLAUDE.md`** (project root, authoritative)
2. **`/Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template`** (used for new project deployment)
3. **`/Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.universal`** (minimal universal variant)
4. **`/Users/antonpankratov/Downloads/eradev/meta.md`** (Section 14 Session Bootstrap checklist)
5. **`/Users/antonpankratov/Downloads/eradev/reports/v9_phase1c_builder_2026-04-11.md`** (this report, new)

No other files touched. No changes to eradev.md (L0 untouched per ROADMAP Iron Rule).

---

## Diff summary

### 1. CLAUDE.md (project root)

| Change | From | To |
|---|---|---|
| Header | `# EraDev v8 -- Auto-Bootstrap (Claude Code)` | `# EraDev v9 -- Auto-Bootstrap (Claude Code)` |
| New section | (absent) | `## Domain Awareness (v9)` — inserted between META Output Specification (ends line 20) and Mandatory Loading Sequence |
| Mandatory Loading Sequence | 5 steps, no domain awareness | 6 steps; step 2 notes Section 14 has 13 items including 5b DOMAIN; step 4 notes "INCLUDING `domain:` block (v9). Absence of block = default `type=code`"; step 6 is new: "If `domain.skin` is set: Read `templates/domain_skin.{type}.md`" |
| Session Entry Protocol | "Section 14" | "Section 14 (13 items)" + explicit "Item 5b (DOMAIN) MUST be filled" sentence |

The `## Domain Awareness (v9)` section contains:
- Three field definitions sourced from Phase 0.A Analyst schema: `type`, `B_modality`, `ood_scope`
- Three modal B-formula weight tuples sourced verbatim from Phase 0.A Visionary (B_text uniform, B_creative dominant on E+1-σ, B_research dominant on 1-σ+F)
- Six `domain.verify.method` values mapped to domain types (build/cite_check/readability/parse/dry_run/recompute) from Phase 0.A Analyst schema Section 1.2
- Explicit Backward Compat clause: absent block → type=code, B_modality=text, ood_scope=text-discrete, verify.method=build → identical v8 behavior (matches Phase 0.A Visionary FM-4 mitigation)
- Domain skin instruction: if `domain.skin` is set, META passes the skin file to every spawned agent alongside the role file (does NOT replace)

### 2. templates/CLAUDE.md.template

Same structural changes as CLAUDE.md project root, adjusted for the `eradev/` path prefix (this template is used for deploys where EraDev sits inside an `eradev/` subdirectory of a host repo):

- `eradev/eradev.md`, `eradev/meta.md`, `eradev/BOOTSTRAP_LESSONS.md` prefixes preserved
- `eradev/templates/domain_skin.md.template` and `eradev/templates/domain_skin.{type}.md` referenced (not the bare `templates/...` path from the project-root CLAUDE.md)
- Roles path stays `eradev/roles/{role}_EN.md` per template convention
- Invariant tags ([UNIVERSAL]/[CODE-ADAPTER]) NOT added to this template — Phase 0.B only tagged the project-root CLAUDE.md; template tagging is out of scope for Phase 1.C (likely Phase 1.A or a dedicated template sync task)
- Invariant 12 still uses older "include FULL CONTENT" phrasing vs project-root's newer "self-load" phrasing — this is a pre-existing discrepancy and left unchanged to keep Phase 1.C scope tight

### 3. templates/CLAUDE.md.universal

Minimal variant — does not carry the full Invariants list. Changes:

- Header v8 → v9
- New `## Domain Awareness (v9)` section (compressed form — pointer to full spec, not full text)
- Loading Sequence extended from 3 items (eradev.md + meta.md + BOOTSTRAP_LESSONS.md) to 5 items (+ projects config + optional domain skin)
- New Invariant bullet: "Domain detection is mandatory at session start. Missing `domain:` block = default `type=code`; unknown type = RED, STOP, ask operator."

### 4. meta.md Section 14

Inserted new item 5b between items 5 (STACK) and 6 (RT-1 PLANNED):

```
[ ] 5b. DOMAIN: Project domain.type = ___ (code/article/book/config/plan/research).
       Modal B-formula: ___ (text/creative/research — selects weights per eradev.md Section II.1).
       OOD scope: ___ (text-discrete = OK, continuous = REJECT for v9).
       Source: projects/{PROJECT}/config.md `domain:` block. Absent block → default type=code, B_modality=text, ood_scope=text-discrete.
       If domain.skin is set: loaded templates/domain_skin.{type}.md alongside role files.
```

**Why 5b and not renumbering 1-13:** Item 7 (INVARIANT CHECK) currently references "re-read steps 1-6". Renumbering would require rippling updates across every historical report that cites "item 8" (Lambda Audit) or "item 12" (KILL-TEST). The 5b form is additive and preserves every existing numeric reference across the codebase. Total item count is now 13 (1-12 + 5b).

Item 7's "re-read steps 1-6" text still resolves correctly because 5b logically sits within the span 1-6 (5b is a sub-item of 5, not a new integer).

---

## Backward Compatibility

### Contract

A project WITHOUT a `domain:` block in its `config.md` MUST behave identically under v9 as it did under v8.

### Enforcement Chain

1. **META session bootstrap (Loading Sequence step 4):** If config.md has no `domain:` block, META injects implicit defaults: `type=code`, `artifact.primary=source_file`, `verify.method=build`, `metrics[B_modality]=text`, `ood_scope=text-discrete`. This exactly matches Phase 0.A Analyst Section 1.3 "Implicit default" specification.
2. **Modal B-formula selection:** `B_modality=text` triggers uniform weights (0.25 each) which are identical to v8's `B = F · E · (1-σ) · Λ` formula. No numerical change.
3. **Session Bootstrap item 5b:** An operator filling the checklist for a v8 legacy project can write `domain.type = code (implicit default, no domain block)` and proceed. The check is auditable, not gate-blocking.
4. **Agent behavior:** Each agent's Jidoka Self-Check still computes B as a geometric mean of F/E/(1-σ)/Λ. For `B_modality=text`, weights are uniform so the computation is unchanged.

### Regression Test Pattern (for Phase 1.E Phantom Check)

For any v8 project config (eradev, plugy, odtoe-articles, academic-lab) WITHOUT a `domain:` block: run a task that would trigger an agent's B-computation under both v8 and v9. Assert:
- B(v9, implicit default) == B(v8, uniform weights) numerically to 4 decimal places
- No new blocking gate fires at Session Bootstrap
- Agent output is byte-identical modulo timestamp (if determinism holds)

This test is NOT part of Phase 1.C — it is deferred to Phase 1.E Phantom Coherence Check.

---

## Cross-file Consistency

| Concept | CLAUDE.md (root) | templates/CLAUDE.md.template | templates/CLAUDE.md.universal | meta.md §14 |
|---|---|---|---|---|
| v9 header | ✓ | ✓ | ✓ | (inherits, not versioned) |
| Domain Awareness section | ✓ (full) | ✓ (full) | ✓ (compressed) | — |
| domain.type enum | code/article/book/config/plan/research | same | same | same |
| B_modality enum | text/creative/research | same | same | same |
| ood_scope enum | text-discrete/continuous | same | same | same |
| Modal B weight tables | full weight tuples | full weight tuples | pointer to eradev.md II.1 | — |
| Domain skin reference | `templates/domain_skin.md.template` | `eradev/templates/domain_skin.md.template` | `eradev/templates/domain_skin.md.template` | `templates/domain_skin.{type}.md` |
| Bootstrap Section 14 reference | "13 items, DOMAIN check at 5b" | "13-item checklist including DOMAIN check at 5b" | "13 items including DOMAIN check at 5b" | item 5b exists |
| Backward compat clause | ✓ explicit | ✓ explicit | ✓ compressed | ✓ in item 5b body |

All three CLAUDE files are structurally parallel. The project-root CLAUDE.md is authoritative (it has the invariant tags from Phase 0.B); the two templates track the same Domain Awareness content with path-prefix adjustments.

---

## What Phase 1.C did NOT do (logged for downstream phases)

1. **No RU mirror of CLAUDE.md / templates** — There is no `CLAUDE_RU.md` convention; CLAUDE.md is a Claude Code harness file, not a bilingual EraDev artifact. BL-19 applies to role files and internal framework docs, not to harness entry points. This is consistent with how v8 handled it. Logged for Phase 1.D COHERENT review if needed.
2. **No tagging of invariants in templates/CLAUDE.md.template** — Phase 0.B only tagged the project-root CLAUDE.md. Template tagging is a separate sync task. Logged for Phase 1.D BL split work.
3. **No loader implementation** — CLAUDE.md DESCRIBES the domain detection; actual YAML parsing of `domain:` block is a runtime concern handled by META's session bootstrap, which is natural-language instructions to the LLM (not code). No separate loader module exists or is needed.
4. **No changes to eradev.md Section II.1** — The modal B-formula Section II.1 is Phase 0.A Visionary's output and lives in eradev.md. Phase 1.C references it but does NOT modify it. L0 iron rule holds (roadmap_v9 Section "v9 Universalization — 4 Layers").
5. **No changes to existing project configs** — Phase 1.B (domain adapter schema) is responsible for adding `domain:` blocks to the 4 existing projects. Phase 1.C only makes META aware that such blocks exist and how to interpret them.
6. **No changes to `.claude/skills/eradev/templates/*` mirror** — The skill mirror is a separate concern; Phase 1.C targets the canonical CLAUDE.md files only. Logged as a follow-up sync task.

---

## Verification Performed

### Grep verification (A_σ consistency check)

1. **No stale "EraDev v8" in in-scope files:**
   - Grep `EraDev v8` across `/Users/antonpankratov/Downloads/eradev/templates/` and root `CLAUDE.md` → 0 matches in scope (CLAUDE.md, templates/CLAUDE.md.template, templates/CLAUDE.md.universal all now show v9)
   - Historical reports and the skill mirror still contain "v8" — correctly unchanged (out of Phase 1.C scope)

2. **v9 + Domain Awareness present in all 3 CLAUDE files:**
   - `CLAUDE.md:1` → `# EraDev v9 -- Auto-Bootstrap (Claude Code)`
   - `CLAUDE.md:22` → `## Domain Awareness (v9)`
   - `templates/CLAUDE.md.template:1` → `# EraDev v9 -- Auto-Bootstrap (Claude Code)`
   - `templates/CLAUDE.md.template:22` → `## Domain Awareness (v9)`
   - `templates/CLAUDE.md.universal:1` → `# EraDev v9 -- Auto-Bootstrap (Claude Code)`
   - `templates/CLAUDE.md.universal:7` → `## Domain Awareness (v9)`

3. **meta.md Section 14 item 5b present:**
   - `meta.md:264` → `[ ] 5b. DOMAIN: Project domain.type = ___ (code/article/book/config/plan/research).`
   - Item 5 (STACK) at line 263, item 6 (RT-1 PLANNED) at line 269 — correct insertion point.
   - Item 7 INVARIANT CHECK still references "re-read steps 1-6" — still resolves correctly because 5b is within the 1-6 logical span.

### Structural verification

- All 3 CLAUDE files parse as markdown (headings open and close, no orphan list items, no unclosed code fences) — verified via full Read after each edit.
- meta.md Section 14 code fence still closes correctly at `=== BOOTSTRAP COMPLETE — PROCEED ===` → ``` → `### Mid-Session Reclassification (BL-18)` — verified via full Read of lines 252-295.
- Field names in Domain Awareness sections match Phase 0.A Analyst schema exactly (`domain.type`, `domain.artifact.primary`, `domain.verify.method`, `domain.metrics[B_modality]`, `domain.ood_scope`, `domain.skin`) — no drift.
- Modal B-formula weights match Phase 0.A Visionary Section 1.2 exactly (B_text 0.25/0.25/0.25/0.25; B_creative 0.20/0.30/0.30/0.20; B_research 0.30/0.20/0.35/0.15) — no drift.

### Domain skin template existence check (Lesson 8 Check-First)

- `ls templates/` confirmed `domain_skin.md.template` exists (4517 bytes, created 2026-04-11 16:18)
- Did NOT write a new domain_skin file — that is Phase 2.A work per roadmap_v9. Phase 1.C only REFERENCES the template.

---

## Security & Integrity Checklist

- [x] No secrets in plaintext — all changes are markdown documentation
- [x] Defaults are safe for fresh install — `domain:` block absence defaults to v8 behavior, no silent mode changes
- [x] Backwards compatibility preserved — explicit contract in every CLAUDE file + meta.md §14 item 5b
- [x] No leaked private information — none
- [x] No libel / no misattribution — Phase 0.A attributions retained where referenced
- [x] No accidental spoilers — additive to existing framework, nothing retracted
- [x] No path traversal risks — all references are repo-relative
- [x] Every cited file resolves — verified: templates/domain_skin.md.template exists, eradev.md exists, meta.md exists
- [x] Bilingual sync — not applicable to CLAUDE.md harness file; logged for Phase 1.D

---

## Blast Radius

**MEDIUM.** Phase 1.C changes the entry point for every EraDev session (CLAUDE.md auto-loads), so a miswritten invariant or a broken Domain Awareness rule propagates to every subsequent agent spawn.

Mitigations applied:
1. Structural parallel across all 3 CLAUDE files — any drift is grep-detectable
2. Explicit Backward Compat clause in every file — legacy projects are protected
3. Item 7 (INVARIANT CHECK) in meta.md §14 still resolves correctly — tested via full Read
4. No changes to L0 (eradev.md), so ODTOE math is untouched
5. KILL-TEST in item 12 of meta.md §14 is unchanged — the scope of Phase 1.C was to ADD 5b, not to modify existing items

The biggest residual risk is Phase 1.C describing modal B-formula weights in CLAUDE.md BEFORE eradev.md Section II.1 actually contains the formula. If the roadmap's Phase 0.A theoretical work has not yet been COMMITTED to eradev.md as a new Section II.1, then CLAUDE.md's pointer `per eradev.md Section II.1` is a dangling reference. **Mitigation:** CLAUDE.md still contains the full weight tuples inline, so it is self-contained even if eradev.md Section II.1 is not yet written. The `per eradev.md Section II.1` phrase is a forward reference that becomes live when Phase 0.A outputs are folded into eradev.md (tracked as Phase 1 follow-up; not a Phase 1.C deliverable per roadmap).

---

## Handoff

**Next actors per roadmap_v9:**
- **[VALIDATOR]** Phase 1.C — schema parse check on all 3 CLAUDE files + meta.md §14; assert Backward Compat contract holds on at least 1 legacy project config
- **[COHERENT]** Phase 1.D — BL split into universal + code-adapter files + tag templates/CLAUDE.md.template invariants + sync skill mirror if required
- **[VALIDATOR]** Phase 1.E — Phantom Coherence Check (fresh-agent independence test on the universalization as a whole)
- **[BUILDER]** future — fold Phase 0.A Visionary deliverables (modal B-formula, Ω formalization, OOD scope) into eradev.md as new Section II.1 / extension of Section III / new Section on OOD. This is NOT Phase 1.C work — Phase 1.C only REFERENCES these outputs.

---

## Open Questions (Spiral Gap)

- **OQ-1C-1:** Should the Domain Awareness section in CLAUDE.md eventually live in eradev.md Section II.1 instead (with CLAUDE.md carrying only a pointer)? Current: duplicated for self-containment. Revisit in v9.1 if CLAUDE.md file size becomes an issue.
- **OQ-1C-2:** When `domain.type` is absent, should META emit a YELLOW warning ("legacy v8 project, defaulting to code mode") or silently proceed? Current: silent (backward-compat safety over operator telemetry). Revisit if Phase 1.E phantom check reveals silent mode confusion.
- **OQ-1C-3:** The 5b form preserves numeric references but complicates ordinality-based iteration ("run items 1-5" is ambiguous — does it include 5b?). Is this worth renumbering in v10? Current: keep 5b, it is explicit enough.
- **OQ-1C-4:** `templates/CLAUDE.md.template` still uses v8-era Invariant 12 phrasing ("include FULL CONTENT") while project-root CLAUDE.md uses v8.x+ "self-load" phrasing. Should Phase 1.D sync these, or is the template deliberately behind? Current: Phase 1.C did not touch invariant phrasing; logged for Phase 1.D.
- **OQ-1C-5:** `.claude/skills/eradev/templates/` mirror was NOT synced. If operators deploy via the skill install path, they will get v8 templates until the skill mirror is updated. Should Phase 1.D also sync the skill mirror, or is there a dedicated skill release cadence? Current: deferred, logged for Phase 1.D.

---

## Builder Result

**Modified artifacts:**
- `/Users/antonpankratov/Downloads/eradev/CLAUDE.md` — v8→v9 header, new Domain Awareness section, extended Loading Sequence, updated Session Entry Protocol
- `/Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.template` — same structural changes with `eradev/` path prefix
- `/Users/antonpankratov/Downloads/eradev/templates/CLAUDE.md.universal` — compressed Domain Awareness + new domain-detection invariant
- `/Users/antonpankratov/Downloads/eradev/meta.md` — new item 5b DOMAIN in Section 14 Session Bootstrap checklist (between items 5 and 6)
- `/Users/antonpankratov/Downloads/eradev/reports/v9_phase1c_builder_2026-04-11.md` — this report

**Verification:** Grep confirms all 3 CLAUDE files contain `# EraDev v9` and `## Domain Awareness (v9)`; meta.md line 264 contains `[ ] 5b. DOMAIN`. Full Read of each file confirms structural integrity (no orphan lines, no broken headings, no unclosed code fences). Phase 0.A field names and modal weight tuples match verbatim (no drift).

**Validation (end-to-end):** A v8 legacy project with no `domain:` block will (1) pass Loading Sequence step 4 via implicit default, (2) produce `domain.type = code` on Session Bootstrap item 5b, (3) select B_modality=text with uniform weights, (4) compute B identical to v8. Contract traceable from CLAUDE.md Domain Awareness → meta.md §14 item 5b → Phase 0.A Analyst Section 1.3 → Phase 0.A Visionary Section 1.5.

**Security & integrity checklist:** passed all 9 items above.

**Blast Radius:** MEDIUM. Mitigations applied: structural parallel across 3 files + Backward Compat clause + L0 untouched + KILL-TEST unchanged.

---

## Jidoka Self-Check

```
=== JIDOKA SELF-CHECK ===
Banality score: 3/10 — domain-aware loading and modal B-formula selection are
                      novel as of v9 (Phase 0.A theoretical work). Not template.

B-diagnostics (rate 0.0-1.0):
  F (Focus):          0.92  -- Read in full: roles/builder_EN.md, CLAUDE.md (root),
                               templates/CLAUDE.md.template, templates/CLAUDE.md.universal,
                               meta.md (full), Phase 0.A visionary report, Phase 0.A
                               analyst report, Phase 0.B tagging report, roadmap_v9.
                               Checked templates/ directory contents (ls) for
                               domain_skin.md.template existence before referencing.
                               Minor gap: did not open templates/domain_skin.md.template
                               contents (only verified existence) since Phase 1.C does
                               not require modifying it.
  E (Alignment):      0.93  -- Task prompt was very specific: bump v8→v9, add Domain
                               Awareness section, reference domain_skin.md.template,
                               add 5b to Section 14, backward compat. Every one of
                               those items delivered. No scope creep (did not tag
                               template invariants, did not sync skill mirror, did not
                               write Phase 2.A skin files).
  (1-σ):              0.90  -- Three CLAUDE files structurally parallel; domain schema
                               field names match Phase 0.A Analyst verbatim; modal
                               weights match Phase 0.A Visionary verbatim; meta.md §14
                               item numbering preserved (5b vs renumber trade-off
                               documented); backward compat contract consistent across
                               all 4 files. One minor inconsistency acknowledged and
                               logged (OQ-1C-4): template Invariant 12 still uses older
                               phrasing — deliberately out of Phase 1.C scope.
  Λ (Experience):     0.88  -- Applied BL-16 (read framework, don't rewrite from memory),
                               BL-19 (logged RU/skill-mirror sync as deferred, not
                               silently dropped), BL-21 (used Phase 0.A specs verbatim),
                               BL-24 (one commit = one phase — kept scope tight),
                               Lesson 8 Check-First (verified domain_skin.md.template
                               exists BEFORE writing the reference), Lesson 2 phantom
                               coherence awareness (logged OQ-1C-5 as possible silent
                               drift vector rather than assuming alignment).

  B = F^0.25 · E^0.25 · (1-σ)^0.25 · Λ^0.25
    = 0.92^0.25 · 0.93^0.25 · 0.90^0.25 · 0.88^0.25
    ≈ 0.9794 · 0.9820 · 0.9740 · 0.9687
    ≈ 0.908

Weak link: Λ at 0.88 (lowest, well above 0.3)
All components > 0.3 — no Andon
B = 0.908 > 0.5 — GREEN, no Andon, commit permitted
```

## B-check (per roles/builder_EN.md Output Format)

F=0.92 E=0.93 (1-σ)=0.90 Λ=0.88 → B=0.908

---

*Phase 1.C [BUILDER] complete. CLAUDE.md is now domain-aware. META will read `domain:` on session bootstrap, surface DOMAIN check as item 5b, and select modal B-formula per Phase 0.A Visionary weights. Ready for [VALIDATOR] 1.C schema parse + backward compat regression test.*
