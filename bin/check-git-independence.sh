#!/usr/bin/env bash
set -euo pipefail

show_help() {
  cat <<'EOF'
check-git-independence.sh — verify no parent-child Git coupling

Checks:
  - Root is a Git repo (this script runs from root)
  - No .gitmodules anywhere (no submodules)
  - Each immediate child repo in ./projects/* has its own .git directory
  - Each child repo directory is ignored by the root Git (to avoid tracking)

Usage:
  bash bin/check-git-independence.sh [--verbose]

Exit codes:
  0 = OK, independence enforced
  1 = Violation detected
EOF
}

VERBOSE=0
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  show_help; exit 0
elif [[ "${1:-}" == "--verbose" ]]; then
  VERBOSE=1
fi

log() { (( VERBOSE )) && echo "$*" >&2; }
fail() { echo "FAIL: $*" >&2; exit 1; }

# 1) Root must be a git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  fail "Root is not a Git repository. Run: git init ."
fi
log "Root Git detected: $(git rev-parse --show-toplevel)"

# 2) No submodules at root (ignore child repos under ./projects)
if find . -path ./projects -prune -o -name .gitmodules -print -quit | grep -q .; then
  # Double-check if the found path is under ./projects; if so, ignore
  found_path="$(find . -path ./projects -prune -o -name .gitmodules -print -quit || true)"
  if [[ -n "$found_path" && "$found_path" != ./projects/* ]]; then
    fail ".gitmodules found at $found_path — submodules are not allowed at root"
  fi
fi
log "No root-level .gitmodules present"

# 3) For each ./projects/* that contains a child .git, ensure root ignores it
if [[ -d projects ]]; then
  while IFS= read -r -d '' child; do
    name=$(basename "$child")
    if [[ -d "$child/.git" ]]; then
      log "Child repo detected: projects/$name"
      if git check-ignore -q "projects/$name"; then
        log "Ignored by root: projects/$name"
      else
        fail "projects/$name is not ignored by root Git (.gitignore should ignore projects/)"
      fi
    fi
  done < <(find projects -mindepth 1 -maxdepth 1 -type d -print0)
fi

echo "OK: Git independence verified (no submodules; children ignored; separate .git)"
exit 0
