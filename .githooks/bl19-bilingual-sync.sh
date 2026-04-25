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
