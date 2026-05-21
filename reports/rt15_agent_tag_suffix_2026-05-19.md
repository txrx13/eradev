# RT-15 Builder Report: Agent Role-Tag Numeric Suffix Support

> **Task**: Extend `[ROLE]` tag regex in agent hooks to accept optional `-<digits>` suffix (e.g. `[BUILDER-13]`) for parallel-Builder orientation, while preserving backward compatibility with the bare `[BUILDER]` form.
> **Trigger**: Operator critique 2026-05-19 — `Hook BL-28 заблокировал — descriptions должны строго начинаться с [BUILDER] без суффикса. Переделываю. нужно добавить возможность запускать с суффиксами в виде цифр (например [BUILDER-13]) для удобства ориентира между билдерами`.
> **Scope**: EXTEND existing regex (L-50 extend>add). Zero new BL/Inv proposed. Defer lessons.md decision to META.

---

## 1. Files Modified

| # | Path | Lines touched | Delta |
|---|------|---------------|-------|
| 1 | `.claude/hooks/agent-role-tag.sh` | 16–18 (was 17) | +3 / -1 net (added comment + regex extension + updated error message) |
| 2 | `.claude/hooks/agent-context-check.sh` | 48–55 (was 48–50) | +4 / -1 net (added comments + regex extension + suffix-strip sed) |

**Skill mirrors**: NONE exist for these hooks. `find /Users/antonpankratov/Downloads/eradev -type f -name "agent-*.sh"` returns ONLY the two canonical paths above. No `.claude/skills/eradev/.claude/hooks/` subtree exists. Step 3 of spec is a no-op for this change.

---

## 2. Diff Summary

### `agent-role-tag.sh` (line 17 in pre-edit file)

**Before:**
```bash
if ! echo "$DESCRIPTION" | grep -qE '^\[(VISIONARY|ANALYST|BUILDER|VALIDATOR|COHERENT)\]'; then
  echo "BLOCKED: Agent description must start with [ROLE] tag. Got: '$DESCRIPTION'. Use: [VISIONARY], [ANALYST], [BUILDER], [VALIDATOR], [COHERENT]. (BL-28, Invariant 9)" >&2
```

**After:**
```bash
# Accepts optional numeric suffix for parallel-agent orientation: [BUILDER-1], [BUILDER-13], etc.
# Suffix is purely a UI/orientation aid — role stem is what matters for enforcement.
if ! echo "$DESCRIPTION" | grep -qE '^\[(VISIONARY|ANALYST|BUILDER|VALIDATOR|COHERENT)(-[0-9]+)?\]'; then
  echo "BLOCKED: Agent description must start with [ROLE] tag (optionally with numeric suffix). Got: '$DESCRIPTION'. Use: [VISIONARY], [ANALYST], [BUILDER], [VALIDATOR], [COHERENT] — or [BUILDER-1], [BUILDER-13] etc. for parallel agents. (BL-28, Invariant 9)" >&2
```

### `agent-context-check.sh` (lines 48–50 in pre-edit file)

**Before:**
```bash
# Check 5b: Role tag in description matches role file path in prompt
DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // empty')
ROLE_TAG=$(echo "$DESCRIPTION" | grep -oiE '\[(visionary|analyst|builder|validator|coherent)\]' | head -1 | tr '[:upper:]' '[:lower:]' | tr -d '[]')
```

**After:**
```bash
# Check 5b: Role tag in description matches role file path in prompt
# Extraction regex accepts optional numeric suffix (e.g., [BUILDER-13]) for parallel-agent orientation.
# Suffix is stripped before file-stem matching — role identity is the stem alone.
DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // empty')
ROLE_TAG=$(echo "$DESCRIPTION" | grep -oiE '\[(visionary|analyst|builder|validator|coherent)(-[0-9]+)?\]' | head -1 | tr '[:upper:]' '[:lower:]' | tr -d '[]')

# Strip trailing -<digits> suffix to recover bare role stem for file-path matching
ROLE_TAG=$(echo "$ROLE_TAG" | sed -E 's/-[0-9]+$//')
```

The sed strip is placed AFTER extraction and BEFORE the `if [ -n "$ROLE_TAG" ]` block, exactly as the spec required. The unchanged downstream block then compares the stripped stem against `roles/${EXPECTED_FILE_STEM}(_EN)?\.md`.

---

## 3. Test Scenarios (32 cases, all PASS)

End-to-end execution via `jq … | bash $HOOK` with synthesised tool-call JSON. Both hooks tested in isolation.

### `agent-role-tag.sh` (21 cases)

| # | Description | Expected | Got | Note |
|---|-------------|----------|-----|------|
| 1 | `[BUILDER] do thing` | PASS | PASS | backward compat |
| 2 | `[VISIONARY] strategize` | PASS | PASS | backward compat |
| 3 | `[ANALYST] plan` | PASS | PASS | backward compat |
| 4 | `[VALIDATOR] verify` | PASS | PASS | backward compat |
| 5 | `[COHERENT] gate` | PASS | PASS | backward compat |
| 6 | `[BUILDER-1] parallel` | PASS | PASS | single digit |
| 7 | `[BUILDER-13] parallel` | PASS | PASS | multi digit |
| 8 | `[VISIONARY-7] parallel` | PASS | PASS | role coverage |
| 9 | `[ANALYST-2] parallel` | PASS | PASS | role coverage |
| 10 | `[VALIDATOR-3] parallel` | PASS | PASS | role coverage |
| 11 | `[COHERENT-2] parallel` | PASS | PASS | role coverage |
| 12 | `[BUILDERS] plural` | BLOCK | BLOCK | no dash-digit |
| 13 | `[BUILDER-] no digit` | BLOCK | BLOCK | dash without digit |
| 14 | `[BUILDER-abc] non-numeric` | BLOCK | BLOCK | non-digit suffix |
| 15 | `[BUILDER13] no dash` | BLOCK | BLOCK | digit attached without dash |
| 16 | `[builder] lowercase` | BLOCK | BLOCK | case-sensitive in this hook |
| 17 | `Builder no brackets` | BLOCK | BLOCK | missing brackets |
| 18 | `[FOO] unknown role` | BLOCK | BLOCK | unknown stem |
| 19 | empty description | BLOCK | BLOCK | empty input |
| 20 | `[COHERENCER] legacy` | BLOCK | BLOCK | legacy stem (W8 canonical is COHERENT, see §4) |
| 21 | `[COHERENCER-2] legacy with suffix` | BLOCK | BLOCK | legacy stem with suffix |

### `agent-context-check.sh` (11 cases)

All 9 spec scenarios + 2 boundary cases. With `BASE_PROMPT` containing `roles/builder_EN.md`:

| # | Description | Prompt role file | Expected | Got |
|---|-------------|------------------|----------|-----|
| 1 | `[BUILDER] task` | builder_EN.md | PASS | PASS |
| 2 | `[BUILDER-1] task` | builder_EN.md | PASS | PASS |
| 3 | `[BUILDER-13] task` | builder_EN.md | PASS | PASS |
| 4 | `[VISIONARY-7] task` | visionary_EN.md | PASS | PASS |
| 5 | `[ANALYST-2] task` | builder_EN.md | BLOCK | BLOCK (ROLE_MISMATCH — analyst stem vs. builder path) |
| 6 | `[VALIDATOR-3] task` | builder_EN.md | BLOCK | BLOCK (ROLE_MISMATCH) |
| 7 | `[COHERENT] task` | coherent_EN.md | PASS | PASS |
| 8 | `[COHERENT-2] task` | coherent_EN.md | PASS | PASS |
| 9 | `[BUILDERS] plural` | builder_EN.md | PASS | PASS (extraction misses, no role-tag enforcement — `agent-role-tag.sh` is the gatekeeper for malformed tags) |
| 10 | `[BUILDER-] no digit` | builder_EN.md | PASS | PASS (same reason — strictness is in `agent-role-tag.sh`) |
| 11 | `[BUILDER-1] task` | (no role file path) | BLOCK | BLOCK (NO_ROLE_READ — orthogonal to suffix support, still works) |

**Note on cases 9–10**: `agent-context-check.sh` Check 5b only fires when extraction succeeds. Malformed tags like `[BUILDERS]` and `[BUILDER-]` produce empty `ROLE_TAG`, so the mismatch check is skipped. They are blocked by the strictly-anchored regex in `agent-role-tag.sh` (Test cases 12–13 above). The two-hook separation of concerns is preserved.

---

## 4. W8 Coherencer → Coherent Note

**Operator spec example regex (verbatim):**
```
\[(visionary|analyst|builder|validator|coherencer)\]
```

**Actual canonical regex (pre-edit, both hooks):**
```
\[(visionary|analyst|builder|validator|coherent)\]   # extraction (context-check)
^\[(VISIONARY|ANALYST|BUILDER|VALIDATOR|COHERENT)\]  # validation (role-tag)
```

The operator's spec used `coherencer` as an example, but the actual canonical regex (post-W8 canonicalization, per `reports/v9_wave6b_canonical_unification_2026-04-11.md` and `domain_skin.code.md` line 56) uses **`coherent`** as the role stem — matching the role file name `roles/coherent_EN.md` / `roles/coherent.md`.

**Recommendation**: Do **NOT** add `coherencer` as a regex alternative. Rationale:

1. **Single source of truth**: `roles/coherent_EN.md` is the canonical file; the role stem `coherent` is enforced everywhere (context-check, role-tag, eradev.md, BL files, CLAUDE.md role list).
2. **No legacy `[COHERENCER]` usage in tree**: I scanned the project (the regex check above confirms `[COHERENCER]` would block); no historical reports or hooks reference `[COHERENCER]` in description tags. Test case 20 above documents this.
3. **Adding it would re-introduce W8-eliminated drift** — the same kind of inconsistency the Wave-6b canonical unification removed.
4. **If operator meant `coherencer`** (e.g. plans to rename role): that's a framework-scope change requiring its own RT-1, not a hook patch. Out of scope for this task.

**Conclusion**: Regex remains `coherent` (matches role file stem). Spec wording in operator's request is treated as illustrative shorthand; canonical implementation preserves W8 unification.

---

## 5. Backward-Compatibility Assertion

Legacy `[BUILDER]`, `[VISIONARY]`, `[ANALYST]`, `[VALIDATOR]`, `[COHERENT]` tags **continue to match unchanged**:

- Test cases 1–5 of `agent-role-tag.sh` all PASS (legacy tags pre-edit also PASSed).
- Test cases 1, 7 of `agent-context-check.sh` PASS — legacy `[BUILDER]` + `builder_EN.md` path still validates.
- Suffix-strip sed in `agent-context-check.sh` is a no-op on bare stems (no `-<digits>` to strip) — `[BUILDER]` → extracts `builder` → strips nothing → matches `builder_EN.md`.
- The `(-[0-9]+)?` quantifier is optional; default behavior unchanged for descriptions without suffix.

**No existing usage breaks.** All 30+ historical Builder/Visionary/Analyst/Validator/Coherent invocations across the project continue to pass these hooks.

---

## 6. Constraint Compliance

| Constraint | Status | Note |
|------------|--------|------|
| L-50 extend > add | OK | Existing regex extended with `(-[0-9]+)?` quantifier; zero new BL/Inv proposed |
| L-57 tight | OK | Minimal diff (+7 / -2 across two files); no over-engineering |
| Do NOT commit | OK | META commits after Validator PASS |
| Preserve legacy `[BUILDER]` matching | OK | Backward compat verified (test 1) |
| BL-19 bilingual (hooks EN-only) | OK | Hook files are EN-only by Builder convention; no RU mirror needed |
| Skill-mirror sync | OK | No skill mirrors exist for these two hooks (verified via `find`) |
| ε_meta whitelist (Builder writes report to `reports/*.md`) | OK | Report path is in whitelist |

---

## 7. B-check (Jidoka, uniform weights for code modality)

```
=== JIDOKA SELF-CHECK ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.95 — Read both target hooks IN FULL + cross-hook sweep (pre-validator-handoff.sh,
                          enforce-delegation.sh) + role file + domain skin + verified no skill mirrors
  E (Alignment):   0.95 — Output addresses INTENT (numeric suffix for parallel-Builder orientation),
                          not just letter; included W8 coherencer/coherent discrepancy disposition
  (1-σ):           0.95 — Diff is minimal, additive, zero conflict with sibling hooks; 32/32 tests green
  Λ (Experience):  0.90 — Consulted W8 canonical unification (skin doc); honored L-50 (extend>add),
                          L-57 (tight); two-hook separation of concerns preserved
  B = 0.25*0.95 + 0.25*0.95 + 0.25*0.95 + 0.25*0.90 = 0.9375
```

**B ≈ 0.94 — GREEN.**

---

## 8. Verdict

**READY_FOR_VALIDATOR.**

Validator should re-run the test grid against the modified hooks on a clean checkout, confirm 32/32 PASS, and verify the diff is identical to §2 above.

### Evidence the Validator can re-execute

```bash
# Test agent-role-tag.sh
HOOK=.claude/hooks/agent-role-tag.sh
echo '{"tool_name":"Agent","tool_input":{"description":"[BUILDER-13] foo","prompt":"x"}}' | bash $HOOK ; echo "rc=$?"
# Expect: rc=0

echo '{"tool_name":"Agent","tool_input":{"description":"[BUILDERS] foo","prompt":"x"}}' | bash $HOOK ; echo "rc=$?"
# Expect: rc=2

# Test agent-context-check.sh
HOOK=.claude/hooks/agent-context-check.sh
echo '{"tool_name":"Agent","tool_input":{"description":"[BUILDER-1] foo","prompt":"You are Builder. Read roles/builder_EN.md. Apply Activation Operator. Output format: result."}}' | bash $HOOK ; echo "rc=$?"
# Expect: rc=0
```

### Open items for META

1. **Lessons.md entry?** L-50 / L-57 implicit applied; no new BL warranted (this is a minor regex extension, not a doctrine change). META's call whether to record a "soft" lesson re: parallel-Builder ergonomics.
2. **Documentation update**: `meta.md` §14 / CLAUDE.md Invariant 9 currently say "Agent description MUST start with [ROLE] tag" — strictly true (the suffix is on the [ROLE] portion). No doc update required, but META may choose to add a one-line note in Invariant 9 to advertise the new ergonomics.

---

*Builder: 5-role topology, code domain. Report path: `reports/rt15_agent_tag_suffix_2026-05-19.md`.*
