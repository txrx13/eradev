#!/bin/bash
# .githooks/check-bilingual-purity.sh
#
# UNIVERSAL framework-scope pre-commit gate for bilingual content purity.
# Source: F-1 of reports/eradev_improvement_proposal_l40_l46_l47_2026-04-27.md
#         (companion: reports/hansei-l40-recurrence-meta-self-reflection-2026-04-27.md)
#         Wave 7 / Task F-1 universal refactor (Wave 6 reverted: project tokens
#         hardcoded into framework scope = L-43 universality-vs-project violation).
#
# Detection (project-agnostic):
#   Pattern A — Latin-Cyrillic compounds via hyphen:
#               \p{Latin}+-\p{Cyrillic}+   |   \p{Cyrillic}+-\p{Latin}+
#   Pattern B — bare Latin content words >= 4 letters in RU prose body
#               (after pre-strip of math, code, comments, and structural LaTeX
#               commands listed in the universal whitelist).
#
# KEEP-list source — EXTERNAL, per-project:
#   projects/{PROJECT}/articles/.bilingual-keep-list
#     Format: one term per line; '#' starts a comment; commas allowed as
#     separators. Whitespace trimmed.
#   If absent or empty: only the minimal hardcoded UNIVERSAL whitelist is
#   applied — purely structural LaTeX commands/identifiers (no domain tokens).
#   The universal whitelist contains ZERO project-specific terms (no author
#   names, no theorem names, no acronyms tied to any specific corpus).
#
# Scope filter (regex on staged path):
#   ^projects/[^/]+/articles/.+\.(tex|md)$    — included
#   _EN\.(tex|md)$                            — excluded (English mirrors)
#   anything else                             — out of scope (hook PASS-through)
#
# Override mechanisms (any one bypasses the gate):
#   BILINGUAL_PURITY_OVERRIDE=1   env var
#   ERADEV_HOOKS_DISABLED=1       global hook disable (matches sibling hooks)
#   [bilingual-override]          token anywhere in .git/COMMIT_EDITMSG
#
# Exit codes:
#   0 — no violations OR override active OR no in-scope files staged
#   1 — violation detected; commit blocked
#
# Engine: perl -CSDA -Mutf8 (portable PCRE Unicode; macOS BSD grep lacks -P).
#
# Tier: T2 (mechanical hook). Pairs with project-scope L-40 lessons.

set -euo pipefail

# --- Override gate ---------------------------------------------------------
[ -n "${BILINGUAL_PURITY_OVERRIDE:-}" ] && exit 0
[ -n "${ERADEV_HOOKS_DISABLED:-}" ] && exit 0

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0
[ -d "$REPO_ROOT/.git" ] || exit 0

COMMIT_MSG_FILE="$REPO_ROOT/.git/COMMIT_EDITMSG"
if [ -f "$COMMIT_MSG_FILE" ] && grep -qF -- '[bilingual-override]' "$COMMIT_MSG_FILE" 2>/dev/null; then
  exit 0
fi

# --- Identify in-scope staged files ---------------------------------------
# Scope: projects/<PROJECT>/articles/<...>.(tex|md), excluding *_EN.(tex|md).
STAGED_INSCOPE=$(git diff --cached --name-only --diff-filter=ACMR 2>/dev/null \
  | perl -ne 'print if m{^projects/[^/]+/articles/.+\.(tex|md)$} && !m{_EN\.(tex|md)$}' \
  || true)

if [ -z "$STAGED_INSCOPE" ]; then
  exit 0
fi

# --- Universal structural whitelist ---------------------------------------
# These are purely STRUCTURAL — LaTeX commands, citation keys, ref keys.
# ZERO project-specific tokens. ZERO domain vocabulary.
# Project-specific terms (theorem names, author names, acronyms) MUST live
# in projects/<PROJECT>/articles/.bilingual-keep-list, NOT here.
read -r -d '' UNIVERSAL_STRUCTURAL_PATTERNS <<'PERL_PATTERNS' || true
\\texttt\{[^}]*\}
\\textit\{[^}]*\}
\\textbf\{[^}]*\}
\\emph\{[^}]*\}
\\cite\{[^}]*\}
\\citep\{[^}]*\}
\\citet\{[^}]*\}
\\ref\{[^}]*\}
\\eqref\{[^}]*\}
\\label\{[^}]*\}
\\autoref\{[^}]*\}
\\nameref\{[^}]*\}
\\href\{[^}]*\}\{[^}]*\}
\\url\{[^}]*\}
\\input\{[^}]*\}
\\include\{[^}]*\}
PERL_PATTERNS

# --- Aggregate per-project keep-list ---------------------------------------
# We collect the union of keep-list terms across all in-scope projects whose
# files appear in this commit. Each project's keep-list is read independently;
# absent files contribute nothing.
declare -a KEEP_TERMS=()

# Extract distinct project names from in-scope staged paths.
PROJECTS=$(echo "$STAGED_INSCOPE" \
  | perl -ne 'print "$1\n" if m{^projects/([^/]+)/articles/}' \
  | sort -u)

while IFS= read -r proj; do
  [ -z "$proj" ] && continue
  KEEP_FILE="$REPO_ROOT/projects/$proj/articles/.bilingual-keep-list"
  [ -f "$KEEP_FILE" ] || continue
  # Strip comments (#...), split on commas/whitespace, drop empties.
  while IFS= read -r term; do
    [ -z "$term" ] && continue
    KEEP_TERMS+=("$term")
  done < <(perl -CSDA -Mutf8 -ne '
    s/#.*//;                         # strip comments
    s/^\s+|\s+$//g;                  # trim
    next if /^$/;
    for my $tok (split /[,\s]+/, $_) {
      next if $tok eq "";
      print "$tok\n";
    }
  ' "$KEEP_FILE")
done <<< "$PROJECTS"

# Deduplicate keep terms.
if [ ${#KEEP_TERMS[@]} -gt 0 ]; then
  IFS=$'\n' KEEP_TERMS=($(printf '%s\n' "${KEEP_TERMS[@]}" | awk '!seen[$0]++'))
  unset IFS
fi

# Build a perl-side keep-set. Use a temp file (newline-delimited) instead of
# an env var: NUL-delimited values get clobbered by bash command substitution,
# and very long keep-lists could exceed env-size limits on some systems.
KEEP_FILE_TMP=""
if [ ${#KEEP_TERMS[@]} -gt 0 ]; then
  KEEP_FILE_TMP=$(mktemp -t bilingual-keep.XXXXXX)
  trap 'rm -f "$KEEP_FILE_TMP" 2>/dev/null' EXIT
  printf '%s\n' "${KEEP_TERMS[@]}" > "$KEEP_FILE_TMP"
fi

# --- Detection pass --------------------------------------------------------
EXIT_CODE=0
violations_summary=()

while IFS= read -r FILE; do
  [ -z "$FILE" ] && continue
  [ ! -f "$REPO_ROOT/$FILE" ] && continue

  # Run perl detector. Keep-list passed via temp file (KEEP_FILE env);
  # structural patterns passed via env (line-delimited).
  HITS=$(KEEP_FILE="$KEEP_FILE_TMP" \
         STRUCTURAL_PATTERNS="$UNIVERSAL_STRUCTURAL_PATTERNS" \
         perl -CSDA -Mutf8 -e '
    use strict;
    use warnings;

    # Build keep-set from temp file (newline-delimited, comments + commas pre-stripped).
    my %keep;
    my $kf = $ENV{KEEP_FILE} // "";
    if (length $kf && -f $kf) {
      open(my $kfh, "<:utf8", $kf) or warn "cannot open keep-file: $!";
      while (my $kl = <$kfh>) {
        chomp $kl;
        $kl =~ s/^\s+|\s+$//g;
        next if $kl eq "";
        $keep{$kl} = 1;
      }
      close($kfh) if $kfh;
    }

    # Build structural patterns list (one per non-empty line).
    my @structural;
    my $sp = $ENV{STRUCTURAL_PATTERNS} // "";
    for my $line (split /\n/, $sp) {
      $line =~ s/^\s+|\s+$//g;
      next if $line eq "";
      push @structural, $line;
    }

    my $file = $ARGV[0];
    open(my $fh, "<:utf8", $file) or exit 0;
    my @hits;
    my $lineno = 0;

    while (my $line = <$fh>) {
      $lineno++;
      my $orig = $line;
      chomp $line;

      # Pre-strip: remove LaTeX line comments (% ...) — but not escaped \%.
      $line =~ s/(?<!\\)%.*$//;

      # Pre-strip: remove inline math $...$ and $$...$$.
      $line =~ s/\$\$[^\$]*\$\$//g;
      $line =~ s/\$[^\$]*\$//g;

      # Pre-strip: remove structural LaTeX commands per universal whitelist.
      for my $pat (@structural) {
        $line =~ s/$pat//g;
      }

      # Pre-strip: remove fenced/inline markdown code (`...`).
      $line =~ s/`[^`]*`//g;

      # --- Pattern A: Latin-Cyrillic compounds via hyphen ---
      while ($line =~ /(\b\p{Latin}+-\p{Cyrillic}+\b|\b\p{Cyrillic}+-\p{Latin}+\b)/g) {
        my $tok = $1;
        # Apply project keep-list: skip if the Latin half (or whole token) is in keep-set.
        my $latin_part = $tok;
        $latin_part =~ s/-.*$// if $tok =~ /^\p{Latin}/;
        $latin_part =~ s/^.*-// if $tok =~ /^\p{Cyrillic}/;
        next if exists $keep{$tok};
        next if exists $keep{$latin_part};
        push @hits, "  L$lineno [Pattern A: compound] $tok";
      }

      # --- Pattern B: bare Latin content words >= 4 letters in RU prose ---
      # Only flag when the line contains Cyrillic text (i.e., this is RU prose,
      # not a stray English-only line in a config block).
      next unless $line =~ /\p{Cyrillic}/;

      while ($line =~ /(?<![\w-])(\p{Latin}{4,})(?![\w-])/g) {
        my $tok = $1;
        next if exists $keep{$tok};
        # Case-insensitive fallback: a keep-list entry written in one casing
        # also matches the same token in any other casing.
        my $found_ci = 0;
        for my $k (keys %keep) {
          if (lc($k) eq lc($tok)) { $found_ci = 1; last; }
        }
        next if $found_ci;
        push @hits, "  L$lineno [Pattern B: bare-Latin] $tok";
      }
    }
    close($fh);

    print join("\n", @hits), "\n" if @hits;
  ' "$REPO_ROOT/$FILE" || true)

  # Strip trailing whitespace/empty lines.
  HITS=$(printf '%s' "$HITS" | sed -E 's/[[:space:]]+$//' | awk 'NF')

  if [ -n "$HITS" ]; then
    violations_summary+=("$FILE")
    {
      echo ""
      echo "BLOCKED: bilingual-purity violation in $FILE"
      echo "$HITS"
    } >&2
    EXIT_CODE=1
  fi
done <<< "$STAGED_INSCOPE"

if [ $EXIT_CODE -ne 0 ]; then
  {
    echo ""
    echo "Bilingual-purity gate (.githooks/check-bilingual-purity.sh)"
    echo "Files with violations: ${#violations_summary[@]}"
    echo ""
    echo "Resolutions (pick one):"
    echo "  1. Translate the flagged term to canonical RU."
    echo "  2. Wrap as identifier (e.g. \\texttt{...}) — structural, exempt."
    echo "  3. Add the term to projects/<PROJECT>/articles/.bilingual-keep-list"
    echo "     if it is a legitimate proper-name/acronym for that project corpus."
    echo "  4. Override (operator-authorized):"
    echo "       BILINGUAL_PURITY_OVERRIDE=1 git commit ..."
    echo "     OR include '[bilingual-override]' in the commit message."
    echo ""
  } >&2
fi

exit $EXIT_CODE
