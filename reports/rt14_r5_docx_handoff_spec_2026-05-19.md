# RT-14 R-5: pre-validator-handoff.sh DOCX-state evidence extension — DESIGN spec

**Author**: [BUILDER] (5-role topology, design-only)
**Date**: 2026-05-19
**Status**: DESIGN — no hook modification this session
**Hook target**: `.claude/hooks/pre-validator-handoff.sh` (currently committed `a3d7a8f`, W6-B, ADVISORY v10.0)
**Source**: roadmap `c5b5f9c` R-5; meta_reflection_ru §R-6; recommendation `recommendation-eradev-framework-invariant-20-2026-05-19.md`

---

## 1. Current hook structure (3-line summary)

`pre-validator-handoff.sh` is a PostToolUse hook gating Agent calls whose `description` starts with `[VALIDATOR]`. It scans the agent's `tool_response` for L-N/BL-N gate references (regex `\b(L|BL)-[0-9]+\b`) and counts {name, command, stdout_excerpt, verdict} 4-tuple labels. Verdict: GATE_COUNT>0 ∧ NAME_COUNT=0 ⇒ bare-verdict failure; default ADVISORY (exit 0), strict mode (`ERADEV_VALIDATOR_STRICT=1`) BLOCKS with exit 2. Inv 18 enforcement at runtime.

## 2. Article-domain DOCX evidence patterns

Per Inv 20 / L-DOCX-PRIMACY-MANDATORY (project-scope only — odtoe-articles `CLAUDE.md` commit `3b7a842`), article-modality Validators MUST inspect DOCX state, not just PDF. Canonical evidence commands and patterns:

| Pattern label | Command (exact) | Required threshold |
|---|---|---|
| themeColor purge | `unzip -p <doc>.docx word/styles.xml \| grep -c 'themeColor="accent1"'` | MUST = 0 |
| Heading color override | `unzip -p <doc>.docx word/styles.xml \| grep -c '<w:color w:val="000000"/>'` | MUST ≥ 5 (Heading1–5) |
| Body justify default | `unzip -p <doc>.docx word/styles.xml \| grep -c '<w:jc w:val="both"/>'` | MUST ≥ 1 in docDefaults |
| Title-zone center | `unzip -p <doc>.docx word/document.xml \| grep -c '<w:jc w:val="center"/>'` | MUST ≥ 3 (P0–P3) |
| Left-align absent | `unzip -p <doc>.docx word/document.xml \| grep -c '<w:jc w:val="left"/>'` | MUST = 0 |

Minimum-viable hook check: gate references include any D-gate ID (`D1`..`D14`) OR L-DOCX-* OR Inv 20 ⇒ require at least one `unzip -p .*\.docx word/(styles|document)\.xml` invocation present in `command:` field of 4-tuples.

## 3. Proposed extension (diff sketch — additive, additive-only)

```bash
# Insertion point: AFTER line 91 (after GATE_COUNT∧NAME_COUNT=0 check),
# BEFORE the "if [ EVIDENCE_OK -eq 1 ]; then exit 0; fi" terminator at line 93.

# Step 3 (NEW): article-domain DOCX-state evidence requirement.
# Triggers iff Validator output references article-modality D-gates or L-DOCX-*.
DOCX_TRIGGER=0
if echo "$OUTPUT" | grep -qiE '\b(D[1-9]|D1[0-4])\b|L-DOCX-[A-Z-]+|Inv(ariant)? 20'; then
  DOCX_TRIGGER=1
fi

if [ "$EVIDENCE_OK" -eq 1 ] && [ "$DOCX_TRIGGER" -eq 1 ]; then
  # Require at least one unzip-DOCX-state command in the evidence block.
  DOCX_CMD_COUNT=$(echo "$OUTPUT" | grep -cE 'unzip\s+-p\s+[^[:space:]]+\.docx\s+word/(styles|document)\.xml')
  if [ "$DOCX_CMD_COUNT" -lt 1 ]; then
    EVIDENCE_OK=0
    REASON="article D-gate(s) referenced but zero unzip-DOCX-state commands present (Inv 18 ext / L-DOCX-PRIMACY)"
  fi
fi
```

**LOC**: ~12 lines net (extension), + 3-line message append to failure path → **~15 LOC total**.

## 4. Falsifying scenario (concrete test)

Spawn a `[VALIDATOR]` agent with description `[VALIDATOR] D7 alignment check for NP-40.docx` whose output contains:
```
- name: D7 (DOCX alignment)
- command: pdftotext NP-40.pdf - | head -50
- stdout_excerpt: (text dump)
- verdict: PASS
```
Hook MUST emit: `BLOCKED: article D-gate(s) referenced but zero unzip-DOCX-state commands present` and (under `ERADEV_VALIDATOR_STRICT=1`) exit 2. This reproduces the NP-40 incident (Validator `a9ffd68` PDF-only verdict) at the hook layer — the very regression class R-5 targets.

Negative test: same description but command `unzip -p NP-40.docx word/document.xml | grep -c '<w:jc w:val="left"/>'` ⇒ PASS (exit 0). Confirms no false-positive on properly-formed evidence.

## 5. Extension point cited (L-50 extend>add)

- **Primary**: extends **Inv 18** (Evidence-bearing Validator handoff) — same hook file, same evidence-block grammar, adds one trigger-conditional sub-rule. No new Inv. No new BL.
- **Secondary references** (read-only by hook): **L-DOCX-PRIMACY-MANDATORY** + project-Inv 20 (both project-scope in odtoe-articles); hook treats them as data, not as framework-promotion.
- **Tier**: T1 (hook layer), per Inv 33 enforcement ladder (hook > checklist > docs).

## 6. Risk: false positives on non-article projects

- Trigger regex requires `D1`..`D14` OR `L-DOCX-*` OR `Inv(ariant)? 20`. None of these appear in code-modality, book-modality, research-modality Validator output by convention (D-gates are article-only nomenclature per L-DOCX-PRIMACY §Rules 1-8).
- Residual risk: a code-project Validator referencing a fictional "D7" gate (unlikely but possible) → false BLOCK. **Mitigation**: keep ADVISORY (exit 0) as default; strict mode opt-in. Same policy as current hook v10.0.
- Cross-domain bleed test: grep current `BOOTSTRAP_LESSONS*.md` for `\bD[1-9]\b|\bD1[0-4]\b` → expected 0 hits (D-gates live only in odtoe-articles lessons). Confirms regex is article-scoped.

## 7. B-check

- F = 0.90 — read hook in full, role file, code skin, RU meta-reflection, recommendation, roadmap; identified insertion point and trigger regex.
- E = 0.90 — design exactly addresses R-5 (extend hook, not promote Inv); LOC and falsifying scenario stated.
- (1−σ) = 0.85 — uncertainty: trigger regex may need broadening if future articles use D-gates without numbering convention; ADVISORY default preserves safety.
- Λ = 0.90 — applied L-50 extend>add (no new Inv), L-57 tight (under 60 lines target — currently ~55), L-58 grep-evidence (explicit line numbers / hashes throughout), Inv 18 self-binding (this hook is the same evidence-bearing class the spec governs).
- **B = 0.90 × 0.90 × 0.85 × 0.90 = 0.620 GREEN**

## 8. Verdict

**READY_FOR_BUILDER_NEXT_SESSION**

Implementation cost: ~15 LOC additive insertion at line 92 of `.claude/hooks/pre-validator-handoff.sh`, no changes to existing 4-tuple logic, no new hook file, no new Invariant, no new BL entry. Default ADVISORY policy preserved (exit 0); strict-mode BLOCK shares the existing `ERADEV_VALIDATOR_STRICT=1` env-flag. Test plan: shell unit test with two fixture inputs (PDF-only Validator output FAILS; DOCX-state Validator output PASSES). Builder next-session task: write the patch + unit fixture + run hook against both fixtures, then commit `feat(hooks): R-5 extend pre-validator-handoff with DOCX-state evidence (Inv 18 ext)`.

---

*Report path*: `/Users/antonpankratov/Downloads/eradev/reports/rt14_r5_docx_handoff_spec_2026-05-19.md`
*Verdict*: READY_FOR_BUILDER_NEXT_SESSION
*LOC*: ~15
*B*: 0.620 GREEN
*Extension*: Inv 18 (Evidence-bearing Validator handoff)
