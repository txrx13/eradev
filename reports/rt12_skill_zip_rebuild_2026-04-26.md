# RT-12 Skill Zip Rebuild — 2026-04-26

**Role**: Builder (5-role topology)
**Task**: Rebuild `eradev-skill.zip` from current `.claude/skills/eradev/` after RT-12 prune Builders modified framework files + skill mirrors. The pre-rebuild zip (mtime 15:52) was OUTDATED relative to skill mirror sources (mtime 17:32-17:33). META commits the bundle next; the deployable artifact must match source-of-truth.

## Build command

```
bash /Users/antonpankratov/Downloads/eradev/scripts/build-skill.sh
```

Verbatim script output:

```
[build-skill] removed stale /Users/antonpankratov/Downloads/eradev/eradev-skill.zip
[build-skill] built /Users/antonpankratov/Downloads/eradev/eradev-skill.zip
[build-skill] size: 435K
[build-skill] OK: SKILL.md contains 'EraDev v10'
[build-skill] OK: role file vocabulary is v10-clean
[build-skill] done
```

Both internal gates passed: v10 header (in SKILL.md first 6 lines) AND v10-clean role-file vocabulary (no v8 tokens like "tested code" / "package/module" / "variable/function" in builder_EN.md).

## Pre-rebuild zip stat

| Field | Value |
|---|---|
| Path | `/Users/antonpankratov/Downloads/eradev/eradev-skill.zip` |
| Size | 439560 bytes (~429 KB) |
| Mtime | 1777207945 (2026-04-26 15:52) |
| sha256 (16-char prefix) | `7cbd9b808a016222` |
| File entries (`unzip -l`) | 54 files |

## Post-rebuild zip stat

| Field | Value |
|---|---|
| Path | `/Users/antonpankratov/Downloads/eradev/eradev-skill.zip` |
| Size | 445048 bytes (~435 KB) |
| Mtime | 1777216170 (2026-04-26 18:09) |
| sha256 (16-char prefix) | `87cb33faafb1739a` |
| File entries (`unzip -l`) | 54 files |

## File-count delta

54 → 54 (no change). Expected: RT-12 prune modified file CONTENT, not the file SET. Source `.claude/skills/eradev/` has 48 regular files; the additional 6 entries in zip are directory entries (eradev/, eradev/core/, eradev/meta/, eradev/roles/, eradev/templates/, eradev/reference/) which `zip -r` records by default.

Size delta: +5488 bytes (+1.25%) — consistent with content edits in core (eradev.md, eradev_RU.md), meta (meta.md, meta_RU.md, BOOTSTRAP_LESSONS.md), and SKILL.md. sha256 changed completely as expected (different content + different mtimes embedded in zip metadata).

## Byte-equality spot-checks

```
diff <(unzip -p eradev-skill.zip eradev/meta/meta.md)        .claude/skills/eradev/meta/meta.md         → BYTE-IDENTICAL
diff <(unzip -p eradev-skill.zip eradev/SKILL.md)            .claude/skills/eradev/SKILL.md             → BYTE-IDENTICAL
diff <(unzip -p eradev-skill.zip eradev/core/eradev.md)      .claude/skills/eradev/core/eradev.md       → BYTE-IDENTICAL
```

All three files chosen because they were touched by RT-12 prune (mtime 17:32-17:33). Zero diff confirms the rebuilt zip is a faithful mirror of the source-of-truth tree at the moment of rebuild.

## Hook bundling — out-of-scope by design

The build script does NOT bundle hooks. Source layout `.claude/skills/eradev/` contains only `{SKILL.md, core/, meta/, roles/, templates/, reference/}` — no `hooks/` subdir, no `*.sh` files. Hooks live separately at `/Users/antonpankratov/Downloads/eradev/.claude/hooks/` (operator-side harness config), which is correct: the deployable skill bundle is skill CONTENT (markdown framework + role files); hook scripts are local-machine harness wiring and ship via different channels. No gap to fix.

## Verdict

**PASS**

- Pre-rebuild zip removed cleanly; post-rebuild zip exists with mtime 18:09 (newer than 15:52 watermark — task constraint met)
- Size 435 KB (within stated ~400-500 KB sane band)
- Both build-script internal gates green (v10 header + v10-clean role vocabulary)
- 3-of-3 byte-equality spot-checks pass on RT-12-touched files
- No git commit performed (per task constraint: META commits the bundle)
- No skill mirror source modified (per task constraint: only rebuild from them)

## Activation Operator (B-check)

```
F (Focus)         = 0.95  — Read builder_EN.md, domain_skin.code.md, build-skill.sh in full;
                            captured pre/post stats; spot-checked 3 files
E (Alignment)     = 0.95  — Output is exactly the rebuilt zip + verification report; ran the
                            canonical script (no improvising — per task constraint and BL-3)
(1-σ) (Consistency) = 0.95 — Zip content byte-identical to source mirrors; both internal gates
                            green; file-count delta explained
Λ (Experience)    = 0.90  — Applied BL-14 (artifact CONTENT gate, not just existence: spot-checked
                            byte-equality on 3 files); BL-3 (no improvising — used the script);
                            BL-22 not applicable (no external API)

B = F · E · (1-σ) · Λ = 0.95 · 0.95 · 0.95 · 0.90 = 0.7716  (uniform weights, code modality)
```

Threshold for code projects: B ≥ 0.5 = green, ≥ 0.7 = strong-green. Result: **0.77 STRONG-GREEN**.

Blast Radius: **LOW** (zip-rebuild is fully reversible; pre-rebuild fingerprint `7cbd9b808a016222` recorded for rollback if needed; no production deploy in this step — META decides whether to commit).
