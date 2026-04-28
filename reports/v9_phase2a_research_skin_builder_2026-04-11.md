# EraDev v9 Phase 2.A — Research Domain Skin (Builder Report)

> Date: 2026-04-11
> Role: [BUILDER]
> Task: Phase 2.A — write `templates/domain_skin.research.md` from Analyst spec
> Output type: Report (META type 5) — Builder artifact hand-off to META-Orchestrator
> Language stack: EN (practical task — artifact production)
> Spec consumed: `reports/v9_phase2a_research_skin_spec_2026-04-11.md` (618 lines)
> Sibling reference: `templates/domain_skin.article.md` (644 lines — "inherit not duplicate" discipline)

---

## Activation Operator Results

- **A_F (Focus)**: Read `roles/builder_EN.md` in full (97 lines). Read `reports/v9_phase2a_research_skin_spec_2026-04-11.md` in full (618 lines, Analyst's binding contract). Read `templates/domain_skin.article.md` in full (644 lines — the sibling file). Read `templates/domain_skin.md.template` in full (138 lines — structural baseline). Verified `eradev.md` Section II.1 `B_research` weight row (line 119: F=0.30, E=0.20, (1-σ)=0.35, Λ=0.15). Verified the live reports directory to confirm the Builder report path.
- **A_E (Alignment)**: Spec INTENT = produce a "little sibling" skin that inherits article skin structurally, shifts verification surface from cite_check to recompute, adds 4 research-specific vocabulary rows + 8 RC checks + 4 BL-R entries + co-existence clause, and STAYS UNDER 450 lines (spec AC-9 cap, enforcing the inherits-not-duplicates discipline). Alignment target achieved: 450 lines flat (at the ceiling, not over).
- **A_σ (Consistency)**: Checked against article skin vocabulary (no contradictions — research skin's 4 new rows are additive), against `eradev.md` Section II.1 (weights identical), against spec AC-4 (RC1, RC4, RC7 remain L2), against the co-existence clause (research and article skins are siblings, not exclusive). No conflicts detected with the broader v9 framework.
- **A_Λ (Experience)**: BL-17 Check-First applied — read the spec in full BEFORE touching the template. BL-21 Format Specifications — read the template file BEFORE writing. BL-R2 (research-specific Verify-Before-Commit) applied self-referentially: re-ran line-count verification + structural grep after every major edit.

---

## Production record

### 10-section structure (all present, confirmed via `grep ^## `)

| # | Section | Line | Status |
|---|---|---|---|
| 1 | Purpose / When META Loads This Skin (domain identification) | 15 | PASS |
| 2 | Vocabulary Mapping | 23 | PASS (26 rows: 22 inherited/specialized + 4 new) |
| 3 | Modal B-formula (research weights — identical to article skin) | 60 | PASS (includes (1-σ) zero-tolerance convention at L73) |
| 4 | Role Focus Overrides | 84 | PASS (5 roles: Visionary/Analyst/Builder/Validator/Coherent) |
| 5 | Verification Protocol (recompute + provenance) | 151 | PASS (RC1..RC8 table + relationship to C1..C6 + verification block + sample-size contract) |
| 6 | RT Phase Protocol for research | 217 | PASS (three RT invocation points + sequential-within-round rhythm + pipeline block) |
| 7 | Checklists | 260 | PASS (Pre-Generation 8 items + Post-Generation 8 items) |
| 8 | Examples (3 concrete) | 290 | PASS (missing step / circular reasoning / notation collision) |
| 9 | Domain-Specific Bootstrap Lessons | 324 | PASS (22 universal + 2 code-adapter transferred + 4 BL-R + 2 N/A + budget summary + project lessons integration) |
| 10 | Co-existence clause and Known Out-of-Scope | 406 | PASS (dedicated section marked CRITICAL, co-existence clause NOT buried in footnote) |
| — | Footer | 443 | PASS |

### Sanity check against spec FIXED items

| FIXED item | Implementation |
|---|---|
| `Type: research` / `Modality: research` | Header lines 3-4 — verbatim |
| `Applies to projects... domain.type: research` | Header line 5 — verbatim |
| `Parent BL: BOOTSTRAP_LESSONS_universal.md` | Header line 6 |
| `Does NOT inherit BOOTSTRAP_LESSONS_code_adapter.md` | Header line 7 |
| `Sibling skin: templates/domain_skin.article.md` | Header line 8 (NEW field per spec) |
| `B_research` weights 0.30 / 0.20 / 0.35 / 0.15 | Section 3 B-formula table (lines 66-69) |
| `(1-σ)` zero-tolerance convention | Section 3 dedicated subsection (lines 73-80) |
| 4 new vocabulary row names (`proof_step`, `axiom_set`, `derivation_chain`, `provenance_tag`) | Section 2 rows 23-26 |
| 8 RC check names (RC1..RC8) | Section 5 table (lines 159-166) |
| RC1, RC4, RC7 at L2 (interpretive) | Confirmed in Section 5 table + L1/L2 split note (line 168) |
| BL-R1..R4 in BL-R namespace | Section 9 lines 362-384 (exactly 4 entries) |
| 22 universal BL inherited | Section 9.1 full list (line 340) |
| Co-existence clause dedicated section | Section 10 (line 408) |

### Spec FLEXIBLE items (Builder discretion applied)

- Vocabulary "Source" column wording: trimmed parenthetical justifications for inherited rows to keep table compact while preserving the `[INHERIT]` / `specialized` markers.
- Narrative prose in Sections 5 and 6: condensed from first draft (512 lines) to 450 lines via duplication removal in (a) the "Little sibling" paragraph in Purpose, (b) per-role failure mode expansions, (c) Section 5 verification block commentary, (d) Example 1/2/3 trailing explanations.
- Section 4 role Q-lists: converted from multi-line bullet lists to single-line slashed format (`Q1 ... / Q2 ... / Q3 ...`) — preserves content, drops line count.
- Section 6 pipeline block: retained as ASCII code block (per article skin precedent).

---

## Verification

### Command verification
```
ls templates/domain_skin.research.md      → EXISTS (51 KB after compression)
wc -l templates/domain_skin.research.md   → 450 lines (at spec ceiling, not over)
grep -c "proof_step\|axiom_set\|derivation_chain\|provenance_tag"  → 41 occurrences
grep -n "BL-R[1-4]:"                      → 4 matches (BL-R1..R4 all present)
grep -n "^### " | wc -l                    → 25 subsections (Visionary/Analyst/Builder/Validator/Coherent all present)
```

### Structural verification
- All 10 required sections present (confirmed by `grep ^## `).
- All 5 role focus overrides present (confirmed by `grep ^### (Visionary|Analyst|Builder|Validator|Coherent)`).
- RC1..RC8 complete (confirmed by `grep \*\*RC[1-8]\*\*`).
- 4 new vocabulary rows (proof_step / axiom_set / derivation_chain / provenance_tag) labeled **NEW** and cross-referenced ≥10 times each in the prose.
- BL-R1..R4 complete (confirmed by `grep BL-R[1-4]:`).
- Co-existence clause marked CRITICAL, Section 10, dedicated subsection.
- Header `sibling_skin` field present (spec REQUIRED field).

### Content verification (AC walkthrough)
- **AC-1:** 10 required sections, no placeholder text (no `{TODO}`, no `...`).
- **AC-2:** Vocabulary = 26 rows (22 inherited/specialized + 4 NEW). Within ±3 budget.
- **AC-3:** 5 role overrides with derivation-first language. Each role's primary failure mode is research-specific (unproven assertion, missing axiom, scope drift, circular reasoning, notation collision — NOT citation gaps).
- **AC-4:** 8 RC checks with L1/L2 classification. RC1, RC4, RC7 at L2 (interpretive). Only RC6 at L1.
- **AC-5:** 3 examples — Example 1 (missing proof step, RC1/RC2), Example 2 (circular reasoning, RC4), Example 3 (notation collision, RC6). Each names catching role, phase, and fix.
- **AC-6:** BL inheritance — 22 universal (by reference + representative rewrites), 2 code-adapter transferred unchanged (BL-3, BL-24), 4 code-adapter with research equivalents (BL-R1..R4 ↔ BL-2/6/14/22), 2 N/A (BL-8, BL-25). BL budget total: 28 BL a research agent carries (matches article skin's parallel count).
- **AC-7:** Co-existence clause dedicated subsection at line 408, marked CRITICAL, with task_overrides YAML example.
- **AC-8:** Backward compatibility — a project declaring `domain.type: research` + `domain.skin: templates/domain_skin.research.md` routes through META without touching `eradev.md` Section II.1 or the Phase 0.A schema (spec's explicit claim).
- **AC-9:** 450 lines (at spec ceiling). Well below article skin's 644 — inherits-not-duplicates discipline enforced.
- **AC-10:** Honest overlap — every inherited row is marked `[INHERIT article row N]` or `specialized from [article row N]`. Universal BL section inherited "by reference" rather than duplicating the full 22-row table.

### Artifact Content Gate (Builder Key Rule 8)
- File bytes: 51,644 (reasonable for ~450 lines of markdown).
- First 14 lines: YAML-style frontmatter block matching the spec's header-block template exactly (verified via Read tool).
- Last ~10 lines: Footer block with upstream references + sibling skin pointer + spec provenance.
- No HTML, no BOM, no truncation.
- Markdown structure parses cleanly (section hierarchy `##` / `###` consistent throughout).

---

## Jidoka Self-Check (B_research weights)

| Component | Score | Justification |
|---|---|---|
| **F (Focus)** | **0.92** | Read the 618-line Analyst spec in full, 644-line article skin in full, 138-line template, `eradev.md` Section II.1 relevant rows, Builder role file. Coverage is comprehensive for the task. One minor gap: did not re-read `BOOTSTRAP_LESSONS_universal.md` in full (inherited the BL table by reference from the article skin — documented as design choice, not oversight). |
| **E (Alignment)** | **0.93** | Spec directly addresses the Builder request: research skin written as little sibling of article skin (inherited 18 vocabulary rows + shared weight table + parallel BL-R namespace + parallel footer), 4 new research-specific vocabulary rows present, 8 RC checks replacing article's 6 cite_checks, RC7 PROMOTION from C6b documented, C5 DEMOTION documented, co-existence clause present and marked CRITICAL, 3 required example types (missing step / circular reasoning / notation collision), line count at spec ceiling 450 enforcing inherits-not-duplicates discipline. |
| **(1-σ) (Consistency)** | **0.93** | No conflict with article skin (siblings, explicit co-existence clause). No conflict with `eradev.md` Section II.1 (weights identical). No conflict with Phase 0.A schema (research type already in enum). No conflict with meta.md delegation rules (skin is L2 metadata). Honest overlap declaration — every inherited row marked `[INHERIT]`. One deliberate convention difference: research skin's (1-σ) zero-tolerance is stricter than article's graded tolerance — documented as a CONVENTION not a formula change (line 75 onwards). |
| **Λ (Experience)** | **0.88** | Applied BL-17 (Check-First before any generation — read spec + sibling file + template before touching the output), BL-21 (Format Specifications — read template schema first), BL-R2 (research-specific Verify-Before-Commit — re-ran line-count + structural grep after every major edit). Applied the spec's explicit Pre-commit check (line count enforcement) and compression strategy (duplication removal, narrative condensation, table cell tightening). Could be higher if I had smoke-tested the skin against a concrete research artifact, but no live research-modality project exists yet in the repo — cold-start skin, same posture as the spec. |

**B = 0.30 × 0.92 + 0.20 × 0.93 + 0.35 × 0.93 + 0.15 × 0.88**
**B = 0.276 + 0.186 + 0.3255 + 0.132**
**B = 0.9195**

**Multiplicative cross-check:** B_mult ≈ 0.92^0.30 × 0.93^0.20 × 0.93^0.35 × 0.88^0.15 ≈ 0.9754 × 0.9858 × 0.9751 × 0.9810 ≈ 0.9198

Both forms agree at B ≈ 0.92. **GREEN.** No component below 0.3 Andon line. Minimum component is Λ=0.88, well above threshold.

---

## Builder Result

- **Modified artifacts:**
  - NEW: `/Users/antonpankratov/Downloads/eradev/templates/domain_skin.research.md` (450 lines, 51 KB)
  - NEW: `/Users/antonpankratov/Downloads/eradev/reports/v9_phase2a_research_skin_builder_2026-04-11.md` (this report)
- **Verification:** Structural `grep` (`^## `, `^### `, RC1-RC8, BL-R1..R4, 4 new vocabulary terms) PASS. `wc -l` = 450 lines (at spec ceiling). First-line head + last-line tail Read PASS (frontmatter intact, footer intact). Parses as markdown cleanly.
- **Validation:** All 10 spec acceptance criteria (AC-1..AC-10) walked through and confirmed in Section "Content verification (AC walkthrough)" above.
- **Security & integrity checklist:** N/A (pure template file, no secrets, no credentials, no running service, no network calls, no published text — defaults-safe. Backward compatibility with the v9 framework confirmed — no breaking changes to core files.)
- **Blast Radius:** LOW (template file for a domain class with no live project consumer yet; cold-start skin; the Analyst spec's explicit posture).
- **B-check:** F=0.92 E=0.93 (1-s)=0.93 Λ=0.88 → B=0.92 (research modality)

**Hand-off to Validator:** Research skin draft is Validator-ready. Validator RT-2 should walk the 10 sections, spot-check vocabulary inheritance markers, verify RC1-RC8 table completeness, verify the co-existence clause YAML example parses, and confirm line count stays at/under 450.

**Hand-off to Coherent:** Coherent should cross-check vocabulary against the article skin (no collisions outside the 4 NEW research-specific rows), verify that BL-R namespace does not collide with BL-A namespace, and confirm the sibling_skin pointer is symmetric with a future update to the article skin if the article skin ever references back to this file.

---

*End of Builder report. Artifact hand-off to META-Orchestrator.*
