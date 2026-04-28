# Template drift: `eradev/templates/CLAUDE.md.template` vs `eradev/CLAUDE.md`

> **Date**: 2026-04-28
> **Trigger**: Operator regen of project root `CLAUDE.md` from template (commit `1ae702f`) — Builder flagged that framework reference copy `eradev/CLAUDE.md` carries 19 invariants + ε_meta canonical anchor, while template has 17 invariants + Inv 17 only.
> **Scope**: precise diff + remediation proposal.
> **Status**: recommendations only. NO framework files modified. Template is HARD-DENY for META direct edit per ε_meta whitelist.

---

## TL;DR

Project root `CLAUDE.md` (regenerated from template) is missing **5 substantive content blocks** that exist in `eradev/CLAUDE.md` framework reference:

1. **§ META Output Specification — ε_meta canonical anchor** subtitle + 5th "First-action class" column + ε_meta whitelist block + HARD-DENY clause
2. **Inv 16 — F1 amendment** (RT-11 OPEN, 2026-04-27): scope-bypass advisory on critique vocabulary
3. **Inv 17 — wording refinement** (minor): explicit FLUX protocol exemption + book/article exploratory segments
4. **Inv 18 — NEW**: Evidence-bearing Validator handoff (4-tuple schema)
5. **Inv 19 — NEW**: Bilingual prompt language-purity

Path-prefix differences (`eradev/eradev.md` in template vs `eradev.md` in framework copy) are **intentional and correct** — template renders for project root context, framework copy renders for eradev-internal context. NOT drift.

---

## Detailed diff

### Block 1 — § META Output Specification

**Current template (line 7-20):**
```markdown
## META Output Specification

You produce EXACTLY 6 output types. Nothing else.

| Output | Format | When |
|--------|--------|------|
| Agent calls | ... | ... |
[6-row table with 3 columns]

Definitive test: "Am I producing one of these 6?" No = VIOLATION, spawn agent instead.
```

**Framework `eradev/CLAUDE.md` (analogous block):**
```markdown
## META Output Specification (ε_meta canonical anchor)

You produce EXACTLY 6 output types. Nothing else.

This table is the canonical anchor **ε_meta** — referenced by `enforce-delegation.sh`
whitelist semantics, by `meta.md §14` intent_ratio computation, and by all downstream
BT-1 phases. Single source of truth for "what counts as a legitimate META first-action."

| # | Output | Format | When | First-action class |
|---|--------|--------|------|-------------------|
| 1 | Agent calls | ... | ... | INTENT (counts toward intent_ratio numerator) |
| 2 | Decisions | ... | ... | INTENT |
| 3 | Synthesis | ... | ... | OUTPUT (Edit/Write to whitelisted paths only) |
| 4 | Lessons | projects/{name}/lessons.md entries | After completed tasks | OUTPUT (Edit/Write to whitelisted paths only) |
| 5 | Reports | reports/ artifacts (Hansei, proposals) | At meta-reflection triggers | OUTPUT (Edit/Write to whitelisted paths only) |
| 6 | Check Agent | ... | ... | INTENT |

ε_meta whitelist (paths META MAY directly Edit/Write — enforced by `.claude/hooks/enforce-delegation.sh`):
- `reports/*.md`
- `projects/*/lessons.md`
- `~/.claude/projects/*/memory/*.md`
- `MEMORY.md` at any project root
- `BL_CANDIDATES.md`

Any Edit/Write outside ε_meta whitelist = VIOLATION → delegate to [BUILDER]. Framework-scope paths (CLAUDE.md, eradev.md, meta.md, BL, roles/, templates/, hooks, skill mirrors) are HARD-DENY regardless of whitelist match.

Definitive test: "Am I producing one of these 6?" No = VIOLATION, spawn agent instead.
```

**Impact of missing block**: project root CLAUDE.md does NOT explicitly tell META which paths it can directly Edit/Write. Currently this knowledge lives only in framework reference. Operationally OK (because `.claude/hooks/enforce-delegation.sh` enforces it at machine boundary), but conceptually weak — META reads project CLAUDE.md and doesn't see ε_meta whitelist explicitly.

**Severity**: MEDIUM. Hook enforces correctly; documentation gap only.

---

### Block 2 — Invariant 16 F1 amendment

**Current template (line 85):**
```markdown
16. Operator message matching rework-framing regex ("менять архитектуру" | "полностью менять" | "full rework" | "from scratch" | "architecture is wrong" | "completely change" | "архитектурная проблема") during active refactor = mandatory rework-discipline audit. Spawn Validator FIRST for risk matrix; produce `reports/hansei-architectural-rework-<date>.md` with interlocked sequence + operator decision matrix; block Builder spawn until operator sign-off. (BL-35) [UNIVERSAL]
```

**Framework reference adds:**
```markdown
**F1 amendment (RT-11 OPEN, 2026-04-27):** Operator critique vocabulary outside the rework-framing regex ("нарушены инструкции" | "ты не делаешь" | "почему ты не…" | "violation" | "you didn't…" | "you're not following" | "нарушение инвариант") triggers a **scope-bypass advisory** (non-blocking, emitted by `.claude/hooks/rework-framing-detector.sh`). On any critique trigger, META MUST (a) re-classify the reframed task per Inv 3 BEFORE responding, (b) state the classification explicitly, (c) constrain response to the critique itself — no scope expansion, no parallel framework reform, no extra refactors unless operator explicitly asks. Source: `reports/rt11_meta_audit_odtoe_session_2026-04-26.md` §F1, `reports/eradev_full_roadmap_2026-04-26.md` Tier 3 F1. [UNIVERSAL]
```

**Impact**: F1 advisory hook fires correctly (operator-side), but project root CLAUDE.md doesn't document the protocol META must follow on trigger. META loaded from project root sees only the BL-35 hard-block branch, not the F1 soft-advisory branch. **This was triggered live in this session 2026-04-28 — META correctly applied F1 from working memory of `eradev/CLAUDE.md`, but a fresh session bootstrapping only from project root would miss it.**

**Severity**: HIGH. Behavioral protocol gap.

---

### Block 3 — Invariant 17 wording refinement (MINOR)

**Current template (line 86-87):**
```markdown
17. **τ_cycle primacy**: ... primary operator of cognitive convergence — not signal fidelity when convergent output is the goal. ... For exploratory/emergent segments (FLUX protocol, eradev §VI.1): cycle length is a configuration parameter — long cycles (incubation) permitted, NOT a fix chain. ...
**Tier:** T3 (Coherent audit cadence). ...
```

**Framework reference (slightly refined):**
```markdown
17. **τ_cycle primacy**: ... primary operator of cognitive convergence — not signal fidelity. ... For exploratory/emergent segments (book body, article introduction/discussion, prototype research, creative prose), cycle length is a configuration parameter, not a latency target — long cycles (incubation) are legitimate and NOT a fix chain (BL-3 does not fire on iteration count for FLUX segments, see `eradev.md` §VI.1 FLUX RT Protocol). ...
```

**Impact**: framework version is more concrete about which segment types qualify (book body, article intro/discussion, etc) and explicitly states BL-3 non-firing on FLUX iteration count. Template version is more abstract.

**Severity**: LOW. Same intent, slightly different phrasing.

---

### Block 4 — Invariant 18 (NEW, missing in template)

**Framework reference adds entire new invariant:**
```markdown
18. **Evidence-bearing Validator handoff**: Validator handoff to META MUST include grep stdout (or equivalent verifiable evidence) for every L-N enforcement gate referenced in checklist. META REJECTS bare-verdict handoffs ("PASS B=0.946 GREEN" without evidence) and re-spawns Validator with explicit evidence requirement. Validator output structure per gate: `{name: L-NN, command: <bash exact>, stdout_excerpt: <first 5 lines or "0 hits">, verdict: PASS/FAIL}`. (Critique 2026-04-27 trio: L-35 grep returns 19 hits empirically, but Validator declared PASS without running it.) [UNIVERSAL]
```

**Impact**: project root CLAUDE.md has NO mention of L-50-class evidence-bearing handoff requirement. META loaded from project root could accept bare-verdict Validator output without rejection. **In this session 2026-04-28 the L-50 4-tuple discipline was applied because META had access to lessons.md L-50 + the framework reference; a future session may not.**

**Severity**: HIGH. Same severity class as Inv 16 F1 — load-bearing behavioral protocol absent from project root.

---

### Block 5 — Invariant 19 (NEW, missing in template)

**Framework reference adds entire new invariant:**
```markdown
19. **Bilingual prompt language-purity**: When META spawns a Builder for language-specific output (RU article, EN article, etc.), the Builder spec MUST be language-pure for that target language. META MUST translate EN labels/headers/tables to target language BEFORE Builder spawn. Builder is NOT expected to translate spec content — Builder copies verbatim. Mixed-language spec → mixed-language artifact (L-40 recurrence pattern, 2026-04-27 incident on `light_intrinsic_rest_frame.tex` §X.4). [UNIVERSAL]
```

**Impact**: project root CLAUDE.md doesn't document the L-46-class inheritance pattern. META spawning bilingual Builders from project root context could deliver mixed-language artefacts.

**Severity**: MEDIUM. Project lessons.md L-46 covers this in detail; CLAUDE.md is the awareness duplicate.

---

## Path-prefix differences (NOT drift, intentional)

| Template (`eradev/templates/CLAUDE.md.template`) | Framework reference (`eradev/CLAUDE.md`) |
|--------------------------------------------------|------------------------------------------|
| `eradev/eradev.md` | `eradev.md` |
| `eradev/meta.md` | `meta.md` |
| `eradev/BOOTSTRAP_LESSONS.md` | `BOOTSTRAP_LESSONS.md` |
| `eradev/roles/{role}_EN.md` | `roles/{role}_EN.md` |
| `eradev/templates/domain_skin.{type}.md` | `templates/domain_skin.{type}.md` |

**Why this is correct, not drift**: when project root CLAUDE.md is loaded by META at session bootstrap, paths must be resolvable from project root (which is one level up from `eradev/`). Hence `eradev/` prefix in template. When `eradev/CLAUDE.md` is loaded from within eradev/ (as a framework-side reference for self-bootstrap of EraDev's own development sessions), the prefix is omitted. Both are correct in their respective contexts; the template's prefix MUST stay.

**No action needed for path prefixes.**

---

## Remediation proposal

### Strategy A — Update template to include all 5 blocks (recommended)

Edit `eradev/templates/CLAUDE.md.template` to add:
1. ε_meta canonical anchor block in § META Output Specification (preserve `eradev/` path prefix in any path references)
2. F1 amendment to Inv 16
3. Wording refinement to Inv 17
4. New Inv 18 (evidence-bearing Validator handoff)
5. New Inv 19 (bilingual prompt language-purity)

Then regen project root `CLAUDE.md` to pick up the changes.

**Cost**: 1 Builder edit on the template (~50 line diff) + 1 Builder regen of project root CLAUDE.md.

**Constraint**: `eradev/templates/CLAUDE.md.template` is HARD-DENY for META direct edit per ε_meta whitelist. **Operator must authorize a Builder spawn explicitly for this framework-scope edit** (per Inv 1 — "S-tasks: Builder + Validator agents").

### Strategy B — Defer until next eradev wave (lowest cost)

Accept current drift; project root CLAUDE.md works correctly because:
- ε_meta enforcement happens at hook layer regardless of CLAUDE.md content
- Inv 18/L-50 is documented in `projects/odtoe-articles/lessons.md` (committed)
- Inv 19/L-46 is documented in `projects/odtoe-articles/lessons.md`
- F1 advisory works at hook layer (`rework-framing-detector.sh`)

Risk: fresh session bootstrapping ONLY from project root CLAUDE.md (not eradev/) would miss Inv 16 F1 + Inv 18 + Inv 19 documentation. Hooks still enforce, but META wouldn't know WHY they fire.

### Strategy C — Hybrid (compromise)

Add ONLY the load-bearing additions: Inv 16 F1 amendment + Inv 18 + Inv 19 + ε_meta canonical anchor block. Skip Inv 17 wording refinement (low-impact). 

Cost: smaller diff, still single Builder spawn.

---

## META recommendation

**Strategy A** — full template sync. Reasons:
1. Drift is documented now (this report); deferring repeats the same gap.
2. ε_meta canonical anchor block is THE documentation of META's allowed-write paths; project root readers should see it.
3. Inv 18 and Inv 19 are load-bearing invariants from THIS session's pipeline. Without them in CLAUDE.md, future META instances can re-encounter L-50-class bare-verdict bugs.
4. Cost is ~1 Builder spawn (template edit) + ~1 Builder spawn (regen) = 2 spawns total.

**If Strategy A is authorized**: spawn `[BUILDER]` with explicit `## Operator's direct request:` block citing this report's recommendation, edit template per Block 1-5 specifications above (preserve `eradev/` path prefix throughout), then regen project root CLAUDE.md.

---

## Cross-references

- `eradev/CLAUDE.md` (framework reference, 19 invariants)
- `eradev/templates/CLAUDE.md.template` (project-root template source, 17+1 invariants)
- `/Users/antonpankratov/Downloads/odtoe/CLAUDE.md` (project root, regenerated commit `1ae702f` 2026-04-28)
- `projects/odtoe-articles/lessons.md` L-46 (bilingual prompt purity, parallel to Inv 19)
- `projects/odtoe-articles/lessons.md` L-50 (Validator gate-execution discipline, parallel to Inv 18)
- `eradev/reports/hansei-meta-2026-04-27-three-critiques.md` (origin of L-50 / Inv 18)
- `reports/rt11_meta_audit_odtoe_session_2026-04-26.md` §F1 (origin of Inv 16 F1 amendment)

---

> **Authored by**: META-Orchestrator (Claude, EraDev Level 9), 2026-04-28.
> **Status**: recommendations only — no framework files modified.
> **Next step**: operator authorizes Strategy A/B/C; if A or C, META spawns [BUILDER] for template edit + regen.
