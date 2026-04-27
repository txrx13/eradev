#!/bin/bash
# phantom-newness-check.sh
# Pre-commit gate: detect proposed "new" knowledge IDs (L-N / EMP-N / BL-N)
# whose titles semantically overlap existing entries in the knowledge base.
# Source: L-58 (pre-grep mandate), EMP6 ext, PN-1 hook task (RT-10 Wave A B2).
# Rationale: phantom newness = sister of phantom decoherence (BL-29).
#            Proposing "new" knowledge already documented = recursive BL-16.
#
# Exit codes:
#   0 — no overlap detected, OR override active (PN_OVERRIDE / commit sentinel / disabled)
#   1 — overlap detected; commit blocked
#
# Override mechanisms:
#   PN_OVERRIDE=1            — operator override env var
#   ERADEV_HOOKS_DISABLED=1  — global hook disable (matches sibling hooks)
#   commit message contains '--phantom-checked' sentinel (read from .git/COMMIT_EDITMSG if present)

set -euo pipefail

[ -n "${PN_OVERRIDE:-}" ] && exit 0
[ -n "${ERADEV_HOOKS_DISABLED:-}" ] && exit 0

REPO_ROOT=$(git rev-parse --show-toplevel)

# Sentinel check: if a prepared commit message contains a bypass token, skip.
# Accepted sentinels:  --phantom-checked  OR  [novel-add]
COMMIT_MSG_FILE="$REPO_ROOT/.git/COMMIT_EDITMSG"
if [ -f "$COMMIT_MSG_FILE" ] && grep -qE -- '(--phantom-checked|\[novel-add\])' "$COMMIT_MSG_FILE" 2>/dev/null; then
  exit 0
fi

# Universal: iterate all projects/*/lessons.md (avoids project-name hardcoding).
# Static knowledge-base anchors (repo-root level) listed explicitly.
EXISTING_FILES=(
  "$REPO_ROOT/BOOTSTRAP_LESSONS.md"
  "$REPO_ROOT/eradev.md"
  "$REPO_ROOT/FOUNDATIONS.md"
)
# Add all project lessons.md (and archives) dynamically — no project-name hardcoding.
for proj_lessons in "$REPO_ROOT"/projects/*/lessons.md "$REPO_ROOT"/projects/*/lessons_archive.md; do
  [ -f "$proj_lessons" ] && EXISTING_FILES+=("$proj_lessons")
done

# Filter the static anchors to only those that exist on disk.
FILTERED=()
for f in "${EXISTING_FILES[@]}"; do
  [ -f "$f" ] && FILTERED+=("$f")
done
EXISTING_FILES=("${FILTERED[@]}")

# Deduplicate.
if [ ${#EXISTING_FILES[@]} -gt 0 ]; then
  IFS=$'\n' EXISTING_FILES=($(printf '%s\n' "${EXISTING_FILES[@]}" | awk '!seen[$0]++'))
  unset IFS
fi

STAGED=$(git diff --cached --name-only --diff-filter=AM | grep '\.md$' || true)

violations=()

# Skip the heading-ID scan when knowledge-base anchors are missing OR when no
# markdown files are staged — but extensions below (templates/) may still run.
if [ ${#EXISTING_FILES[@]} -gt 0 ] && [ -n "$STAGED" ]; then

# Process each staged markdown file.
while IFS= read -r file; do
  [ -z "$file" ] && continue
  [ ! -f "$REPO_ROOT/$file" ] && continue

  # Pull staged additions only (lines beginning with '+', excluding the file header '+++').
  ADDITIONS=$(git diff --cached -- "$file" | grep '^+' | grep -v '^+++' || true)
  [ -z "$ADDITIONS" ] && continue

  # Extract NEW ID heading lines:
  #   ### L-58: Title
  #   ### EMP18: Title
  #   ### BL-36: Title
  # NOTE: BSD grep treats `\n` inside [...] as literal 'n', not newline. Use `.*`
  # which `grep -E` constrains to a single line by default.
  ID_LINES=$(echo "$ADDITIONS" \
    | grep -oE '^\+###[[:space:]]+(L-[0-9]+|EMP[0-9]+|BL-[0-9]+):.*' \
    | sort -u || true)

  [ -z "$ID_LINES" ] && continue

  while IFS= read -r idline; do
    [ -z "$idline" ] && continue
    ID=$(echo "$idline" | grep -oE '(L-[0-9]+|EMP[0-9]+|BL-[0-9]+)' | head -1)
    TITLE_RAW=$(echo "$idline" | sed -E "s/^\+###[[:space:]]+${ID}:[[:space:]]*//" | tr -d '\r')
    # Pure-bash slice avoids macOS head -c quirks under pipefail.
    TITLE="${TITLE_RAW:0:120}"

    # Skip if the ID already existed at HEAD — this is an edit (typo / wording
    # update), not a new entry. Phantom newness is only about NEW additions.
    if git show HEAD:"$file" 2>/dev/null | grep -qE "^###[[:space:]]+${ID}:"; then
      continue
    fi

    # Tokenize title — keep ASCII + Cyrillic word chars, length ≥ 4, lowercase.
    KEYWORDS=$(echo "$TITLE" \
      | tr '[:upper:]' '[:lower:]' \
      | tr -c 'a-zабвгдеёжзийклмнопрстуфхцчшщъыьэюя' ' ' \
      | awk '{for(i=1;i<=NF;i++) if(length($i)>=4) print $i}' \
      | sort -u \
      | head -8)

    [ -z "$KEYWORDS" ] && continue

    # Score: count distinct keyword matches across existing files.
    matched_keywords=()
    matched_files=()
    while IFS= read -r kw; do
      [ -z "$kw" ] && continue
      hit=$(grep -lE -- "$kw" "${EXISTING_FILES[@]}" 2>/dev/null | head -1 || true)
      if [ -n "$hit" ]; then
        matched_keywords+=("$kw")
        matched_files+=("$hit")
      fi
    done <<< "$KEYWORDS"

    # Heuristic: if ≥2 distinct keywords overlap AND a single file appears in
    # the matched_files list, flag as suspected phantom newness.
    if [ ${#matched_keywords[@]} -ge 2 ]; then
      top_file=$(printf '%s\n' "${matched_files[@]}" | sort | uniq -c | sort -rn | awk 'NR==1{$1=""; sub(/^ */,""); print}')
      kw_summary=$(printf '%s,' "${matched_keywords[@]}" | sed 's/,$//')
      rel_top=${top_file#"$REPO_ROOT/"}
      violations+=("${ID} '${TITLE}' — keywords [${kw_summary}] overlap with ${rel_top}")
    fi
  done <<< "$ID_LINES"
done <<< "$STAGED"

fi  # end heading-ID scan guard

# ----------------------------------------------------------------------------
# Extension 1: New Invariant lines in CLAUDE.md "## Invariants" section.
# A genuine new invariant is a numbered top-level list item (e.g. "18. ...").
# Re-numbering existing items is NOT phantom newness; we focus on additions
# whose lead phrase semantically overlaps an existing invariant or BL entry.
# ----------------------------------------------------------------------------
if echo "$STAGED" | grep -qx 'CLAUDE.md'; then
  CLAUDE_ADDS=$(git diff --cached -- CLAUDE.md | grep '^+' | grep -v '^+++' || true)
  # Numbered invariant lines in additions, e.g. "+18. Some new rule..."
  INV_LINES=$(echo "$CLAUDE_ADDS" \
    | grep -oE '^\+[0-9]+\.[[:space:]]+[A-ZА-Я*][^$]{10,}' \
    | sort -u || true)
  if [ -n "$INV_LINES" ]; then
    while IFS= read -r line; do
      [ -z "$line" ] && continue
      # Strip the leading "+N. " prefix; keep first 120 chars of the rule body.
      BODY=$(echo "$line" | sed -E 's/^\+[0-9]+\.[[:space:]]+//' | tr -d '\r')
      BODY="${BODY:0:120}"
      KEYWORDS=$(echo "$BODY" \
        | tr '[:upper:]' '[:lower:]' \
        | tr -c 'a-zабвгдеёжзийклмнопрстуфхцчшщъыьэюя' ' ' \
        | awk '{for(i=1;i<=NF;i++) if(length($i)>=4) print $i}' \
        | sort -u \
        | head -8)
      [ -z "$KEYWORDS" ] && continue
      mk=()
      mf=()
      while IFS= read -r kw; do
        [ -z "$kw" ] && continue
        hit=$(grep -lE -- "$kw" "${EXISTING_FILES[@]}" 2>/dev/null | head -1 || true)
        if [ -n "$hit" ]; then
          mk+=("$kw")
          mf+=("$hit")
        fi
      done <<< "$KEYWORDS"
      if [ ${#mk[@]} -ge 3 ]; then
        top_file=$(printf '%s\n' "${mf[@]}" | sort | uniq -c | sort -rn | awk 'NR==1{$1=""; sub(/^ */,""); print}')
        kw_summary=$(printf '%s,' "${mk[@]}" | sed 's/,$//')
        rel_top=${top_file#"$REPO_ROOT/"}
        violations+=("Invariant '${BODY:0:60}...' — keywords [${kw_summary}] overlap with ${rel_top}")
      fi
    done <<< "$INV_LINES"
  fi
fi

# ----------------------------------------------------------------------------
# Extension 2: New template files added under templates/.
# A genuinely new template should not have keyword overlap with an existing
# template's filename or first heading.
# ----------------------------------------------------------------------------
NEW_TEMPLATES=$(git diff --cached --name-only --diff-filter=A | grep -E '^templates/[^/]+$' || true)
if [ -n "$NEW_TEMPLATES" ]; then
  EXISTING_TEMPLATES=()
  for t in "$REPO_ROOT"/templates/*; do
    [ -f "$t" ] && EXISTING_TEMPLATES+=("$t")
  done
  while IFS= read -r newt; do
    [ -z "$newt" ] && continue
    base=$(basename "$newt")
    # Tokenize the whole basename (split on . _ - and digits) — this handles
    # multi-dot filenames like CLAUDE.md.template2 → "claude md template".
    stem="$base"
    KEYWORDS=$(echo "$stem" \
      | tr '[:upper:]' '[:lower:]' \
      | tr -c 'a-zабвгдеёжзийклмнопрстуфхцчшщъыьэюя' ' ' \
      | awk '{for(i=1;i<=NF;i++) if(length($i)>=4) print $i}' \
      | sort -u \
      | head -8)
    [ -z "$KEYWORDS" ] && continue
    mk=()
    mf=()
    while IFS= read -r kw; do
      [ -z "$kw" ] && continue
      # Search existing template *names*, not staged file itself.
      for et in "${EXISTING_TEMPLATES[@]}"; do
        # Skip if it IS the new file (already on disk in some flows).
        [ "$et" = "$REPO_ROOT/$newt" ] && continue
        ebase=$(basename "$et")
        if echo "$ebase" | grep -qiE -- "$kw"; then
          mk+=("$kw")
          mf+=("$et")
          break
        fi
      done
    done <<< "$KEYWORDS"
    if [ ${#mk[@]} -ge 2 ]; then
      top_file=$(printf '%s\n' "${mf[@]}" | sort | uniq -c | sort -rn | awk 'NR==1{$1=""; sub(/^ */,""); print}')
      kw_summary=$(printf '%s,' "${mk[@]}" | sed 's/,$//')
      rel_top=${top_file#"$REPO_ROOT/"}
      violations+=("Template '${newt}' — name keywords [${kw_summary}] overlap with existing ${rel_top}")
    fi
  done <<< "$NEW_TEMPLATES"
fi

if [ ${#violations[@]} -gt 0 ]; then
  {
    echo ""
    echo "BLOCKED: PHANTOM-NEWNESS detected (PN-1 / L-58 / EMP6 ext / BL-29 sister)"
    echo "Proposed knowledge IDs may already be documented:"
    printf '  - %s\n' "${violations[@]}" | head -20
    echo ""
    echo "Resolutions (pick one):"
    echo "  1. Re-frame as extension of existing entry (L-50 supersede / temporal triple)."
    echo "  2. Run manual grep audit; if genuinely novel, override:"
    echo "       PN_OVERRIDE=1 git commit ..."
    echo "     OR include '--phantom-checked' or '[novel-add]' anywhere in the commit message."
    echo "  3. Drop the proposed ID and reference the existing entry instead."
    echo ""
  } >&2
  exit 1
fi

exit 0
