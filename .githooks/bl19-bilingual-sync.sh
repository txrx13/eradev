#!/bin/bash
# .githooks/bl19-bilingual-sync.sh
# BL-19 enforcement: bilingual pairs (EN/RU) MUST be staged together in one commit.
#
# Detection: any staged file with a known bilingual mirror -> verify the mirror
# is also staged. If mirror is missing -> BLOCK (exit 1).
#
# Override: set BL19_OVERRIDE=1 in env, OR include "--no-bilingual-sync" anywhere
# in the commit message file (passed by git as $1 to commit-msg hook). For
# pre-commit phase, the env override is the only inline mechanism (commit msg is
# not yet known at pre-commit time). Operators can also use `git commit --no-verify`.
#
# Tier:T2 (hook). Pairs with BL-19 lesson in BOOTSTRAP_LESSONS.md.

set -euo pipefail

# Allow override via env var (logged to stderr for traceability)
if [ "${BL19_OVERRIDE:-0}" = "1" ]; then
    echo "[bl19-bilingual-sync] OVERRIDE: BL19_OVERRIDE=1 -- skipping bilingual check (logged)" >&2
    exit 0
fi

STAGED=$(git diff --cached --name-only --diff-filter=ACMR 2>/dev/null || true)

if [ -z "$STAGED" ]; then
    exit 0
fi

violations=()

# --- Helper: returns 0 if path is in staged list, 1 otherwise ---
is_staged() {
    local target="$1"
    echo "$STAGED" | grep -qE "^${target}\$"
}

# --- 1. Fixed L0/meta pairs ---
FIXED_PAIRS=(
    "eradev.md|eradev_RU.md"
    "meta.md|meta_RU.md"
    "LOADING_PROTOCOL.md|LOADING_PROTOCOL_RU.md"
)

for pair in "${FIXED_PAIRS[@]}"; do
    EN="${pair%|*}"
    RU="${pair#*|}"
    if is_staged "$EN" && ! is_staged "$RU"; then
        violations+=("$EN modified, $RU NOT staged")
    fi
    if is_staged "$RU" && ! is_staged "$EN"; then
        violations+=("$RU modified, $EN NOT staged")
    fi
done

# --- 2. roles/*_EN.md <-> roles/*.md (5 pairs) ---
# EN suffix convention: roles/{role}_EN.md, RU canonical: roles/{role}.md
# Iterate staged role files and check mirror.
while IFS= read -r f; do
    [ -z "$f" ] && continue
    case "$f" in
        roles/*_EN.md)
            base="${f%_EN.md}"          # roles/{role}
            ru="${base}.md"             # roles/{role}.md
            if ! is_staged "$ru"; then
                violations+=("$f modified, $ru NOT staged")
            fi
            ;;
        roles/*.md)
            # Skip files already ending in _EN.md (handled above)
            case "$f" in
                roles/*_EN.md) ;;
                *)
                    base="${f%.md}"             # roles/{role}
                    en="${base}_EN.md"          # roles/{role}_EN.md
                    if ! is_staged "$en"; then
                        violations+=("$f modified, $en NOT staged")
                    fi
                    ;;
            esac
            ;;
    esac
done <<< "$STAGED"

# --- 3. templates/domain_skin.{type}.md <-> templates/domain_skin.{type}_RU.md ---
# Pairs: code/article/book/config/plan/research (6 pairs)
while IFS= read -r f; do
    [ -z "$f" ] && continue
    case "$f" in
        templates/domain_skin.*_RU.md)
            # RU side -> compute EN mirror
            type="${f#templates/domain_skin.}"
            type="${type%_RU.md}"
            en="templates/domain_skin.${type}.md"
            if ! is_staged "$en"; then
                violations+=("$f modified, $en NOT staged")
            fi
            ;;
        templates/domain_skin.*.md)
            # Skip RU side (handled above) and the schema template itself
            case "$f" in
                templates/domain_skin.*_RU.md) ;;
                templates/domain_skin.md.template) ;;
                *)
                    type="${f#templates/domain_skin.}"
                    type="${type%.md}"
                    ru="templates/domain_skin.${type}_RU.md"
                    if ! is_staged "$ru"; then
                        violations+=("$f modified, $ru NOT staged")
                    fi
                    ;;
            esac
            ;;
    esac
done <<< "$STAGED"

# --- 4. Skill-mirror sync (BT-3, 2026-04-27) -----------------------------
# When a canonical framework file is staged, its skill-bundle mirror MUST be
# staged in the same commit AND be byte-identical to the canonical version.
# Mirror layout under `.claude/skills/eradev/`:
#   eradev.md, eradev_RU.md           -> core/
#   meta.md, meta_RU.md, LOADING_PROTOCOL.md, BOOTSTRAP_LESSONS.md -> meta/
#   roles/*.md                        -> roles/
#   templates/*.md                    -> templates/
SKILL_ROOT=".claude/skills/eradev"

# Helper: compare canonical staged content vs mirror staged content (or vs
# working tree for unstaged mirror). Uses git's staged blob if mirror is
# staged, otherwise the on-disk mirror file. Returns 0 if equal, 1 if not.
mirror_byte_match() {
    local canon="$1"
    local mirror="$2"
    # Get canonical staged content
    local canon_blob
    canon_blob=$(git diff --cached --diff-filter=ACMR --name-only -- "$canon" | head -1)
    [ -z "$canon_blob" ] && return 0  # canon not staged → nothing to enforce
    # Compare staged canonical vs (staged-mirror if staged, else on-disk mirror)
    local mirror_content
    if is_staged "$mirror"; then
        mirror_content=$(git show ":$mirror" 2>/dev/null || true)
    else
        if [ -f "$mirror" ]; then
            mirror_content=$(cat "$mirror")
        else
            return 1
        fi
    fi
    local canon_content
    canon_content=$(git show ":$canon" 2>/dev/null || true)
    [ "$canon_content" = "$mirror_content" ]
}

# Map canonical -> mirror (single-file pairs)
SKILL_FIXED=(
    "eradev.md|${SKILL_ROOT}/core/eradev.md"
    "eradev_RU.md|${SKILL_ROOT}/core/eradev_RU.md"
    "meta.md|${SKILL_ROOT}/meta/meta.md"
    "meta_RU.md|${SKILL_ROOT}/meta/meta_RU.md"
    "LOADING_PROTOCOL.md|${SKILL_ROOT}/meta/LOADING_PROTOCOL.md"
    "BOOTSTRAP_LESSONS.md|${SKILL_ROOT}/meta/BOOTSTRAP_LESSONS.md"
)

for pair in "${SKILL_FIXED[@]}"; do
    canon="${pair%|*}"
    mirror="${pair#*|}"
    if is_staged "$canon"; then
        if ! is_staged "$mirror"; then
            violations+=("$canon staged, skill mirror $mirror NOT staged")
        elif ! mirror_byte_match "$canon" "$mirror"; then
            violations+=("$canon and $mirror staged but content NOT byte-identical")
        fi
    fi
    # Reverse: if mirror staged, canonical must also be staged
    if is_staged "$mirror" && ! is_staged "$canon"; then
        violations+=("$mirror staged, canonical $canon NOT staged")
    fi
done

# Map roles/*.md and templates/*.md (glob-driven)
while IFS= read -r f; do
    [ -z "$f" ] && continue
    case "$f" in
        roles/*.md)
            mirror="${SKILL_ROOT}/roles/$(basename "$f")"
            if ! is_staged "$mirror"; then
                violations+=("$f staged, skill mirror $mirror NOT staged")
            elif ! mirror_byte_match "$f" "$mirror"; then
                violations+=("$f and $mirror staged but content NOT byte-identical")
            fi
            ;;
        templates/*.md)
            # Skip the schema template itself (no mirror expected)
            case "$f" in
                templates/domain_skin.md.template) ;;
                *)
                    mirror="${SKILL_ROOT}/templates/$(basename "$f")"
                    if [ -f "$mirror" ] || is_staged "$mirror"; then
                        if ! is_staged "$mirror"; then
                            violations+=("$f staged, skill mirror $mirror NOT staged")
                        elif ! mirror_byte_match "$f" "$mirror"; then
                            violations+=("$f and $mirror staged but content NOT byte-identical")
                        fi
                    fi
                    ;;
            esac
            ;;
        "${SKILL_ROOT}"/roles/*.md)
            canon="roles/$(basename "$f")"
            if [ -f "$canon" ] && ! is_staged "$canon"; then
                violations+=("$f staged, canonical $canon NOT staged")
            fi
            ;;
        "${SKILL_ROOT}"/templates/*.md)
            canon="templates/$(basename "$f")"
            if [ -f "$canon" ] && ! is_staged "$canon"; then
                violations+=("$f staged, canonical $canon NOT staged")
            fi
            ;;
    esac
done <<< "$STAGED"

# --- Report and block ---
if [ ${#violations[@]} -gt 0 ]; then
    echo "" >&2
    echo "=== BL-19 BLOCK: bilingual pair drift detected ===" >&2
    printf '  %s\n' "${violations[@]}" >&2
    echo "" >&2
    echo "Fix: stage BOTH files of each bilingual pair in the same commit." >&2
    echo "Override (logged): BL19_OVERRIDE=1 git commit ..." >&2
    echo "Bypass (emergency): git commit --no-verify" >&2
    echo "" >&2
    exit 1
fi

# Silent success (matches universality-gate echo style only on positive scope)
exit 0
