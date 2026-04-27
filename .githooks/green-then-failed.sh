#!/bin/bash
# green-then-failed.sh
# Post-commit ADVISORY hook: detect Validator-GREEN commits that get reverted
# or hot-fixed within a 7-day window. Source: F2 (Tier 3) of
# reports/eradev_full_roadmap_2026-04-26.md.
#
# Behavior:
#   1. If HEAD's commit message contains a Validator GREEN marker
#      (regex: `B-check:.*GREEN` OR `B[ -]?check.*GREEN` OR `Validator:.*GREEN`),
#      append `<hash> <epoch>` to `.git/eradev_green_log`.
#   2. If HEAD's subject matches `^(revert|fix|hotfix)[:(]` (case-insensitive),
#      scan the log for any GREEN commit within the last 7 days and append an
#      advisory entry to `reports/green_failures.md`.
#
# This hook is ADVISORY ONLY — it ALWAYS exits 0, never blocks anything.
# Disable with ERADEV_HOOKS_DISABLED=1.

set -u

[ -n "${ERADEV_HOOKS_DISABLED:-}" ] && exit 0

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0
[ -d "$REPO_ROOT/.git" ] || exit 0

LOG_FILE="$REPO_ROOT/.git/eradev_green_log"
REPORT_FILE="$REPO_ROOT/reports/green_failures.md"
WINDOW_SECONDS=$((7 * 24 * 60 * 60))

HASH=$(git rev-parse HEAD 2>/dev/null) || exit 0
NOW=$(date +%s)
SUBJECT=$(git log -1 --format=%s HEAD 2>/dev/null || echo "")
BODY=$(git log -1 --format=%B HEAD 2>/dev/null || echo "")

# --- 1. Record GREEN commits ------------------------------------------------
if echo "$BODY" | grep -qiE '(B[-_ ]?check[^A-Za-z]*.*GREEN|Validator[^A-Za-z]*.*GREEN)'; then
  echo "$HASH $NOW" >> "$LOG_FILE" 2>/dev/null || true
fi

# --- 2. On revert/fix/hotfix subjects, look back for GREEN within window ----
if echo "$SUBJECT" | grep -qiE '^(revert|fix|hotfix)[:(]'; then
  [ -f "$LOG_FILE" ] || exit 0

  matches=()
  while IFS=' ' read -r ghash gts; do
    [ -z "${ghash:-}" ] && continue
    [ -z "${gts:-}" ] && continue
    # Skip self (defensive — fix/revert commits should not be in the log).
    [ "$ghash" = "$HASH" ] && continue
    age=$(( NOW - gts ))
    if [ "$age" -ge 0 ] && [ "$age" -le "$WINDOW_SECONDS" ]; then
      matches+=("$ghash:$gts")
    fi
  done < "$LOG_FILE"

  if [ ${#matches[@]} -gt 0 ]; then
    mkdir -p "$REPO_ROOT/reports" 2>/dev/null || true
    {
      if [ ! -s "$REPORT_FILE" ]; then
        printf '%s\n' \
          '# GREEN-then-failed Advisory Log' \
          '' \
          'Source: F2 (Tier 3) — `reports/eradev_full_roadmap_2026-04-26.md`.' \
          'Hook: `.githooks/green-then-failed.sh` (post-commit, advisory only).' \
          'Pattern: Validator marked GREEN, then revert/fix/hotfix landed within 7 days.' \
          'Trigger: feed each entry into the next Hansei pass — possible Validator overconfidence.' \
          '' \
          '---' \
          ''
      fi
      ts_iso=$(date -u +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || date -u)
      echo "## $ts_iso — fix/revert $HASH"
      echo ""
      echo "Subject: $SUBJECT"
      echo ""
      echo "GREEN commits within 7-day window:"
      for m in "${matches[@]}"; do
        ghash="${m%%:*}"
        gts="${m##*:}"
        # Portable epoch->date: try GNU `date -d @`, fall back to BSD `date -r`.
        if gdate=$(date -u -d "@$gts" +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null); then
          :
        else
          gdate=$(date -u -r "$gts" +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || echo "$gts")
        fi
        gsubj=$(git log -1 --format=%s "$ghash" 2>/dev/null || echo "(unknown)")
        echo "- $ghash ($gdate) — $gsubj"
      done
      echo ""
    } >> "$REPORT_FILE" 2>/dev/null || true
  fi
fi

exit 0
