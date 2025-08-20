#!/usr/bin/env bash
set -euo pipefail

show_help() {
  cat <<'EOF'
secret-scan.sh — lightweight secret pattern scan for the repo

Scans tracked files for common high-risk token patterns and fails on match.

Usage:
  bash bin/secret-scan.sh [--path PATH]

Options:
  --path PATH   Root path to scan (default: current working directory)
  --help        Show this help

Patterns (conservative list):
  - OpenAI: sk-[A-Za-z0-9]{20,}
  - xAI:    xai-[A-Za-z0-9]{20,}
  - GitHub: ghp_[A-Za-z0-9]{36,}
  - AWS:    AKIA[0-9A-Z]{16}

Excludes common vendor and VCS directories.
EOF
}

ROOT="$(pwd)"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --path) ROOT="$2"; shift 2;;
    --help|-h) show_help; exit 0;;
    *) echo "Unknown arg: $1" >&2; show_help; exit 2;;
  esac
done

cd "$ROOT"

grep -RInE \
  --exclude-dir=".git" \
  --exclude-dir="node_modules" \
  --exclude-dir=".venv" \
  --exclude-dir="dist" \
  --exclude-dir="build" \
  --exclude="*.png" --exclude="*.jpg" --exclude="*.jpeg" --exclude="*.gif" \
  --exclude="*.pdf" --exclude="*.svg" --exclude="*.ico" \
  --exclude="*.lock" --exclude="package-lock.json" \
  -E '(sk-[A-Za-z0-9]{20,}|xai-[A-Za-z0-9]{20,}|ghp_[A-Za-z0-9]{36,}|AKIA[0-9A-Z]{16})' \
  . || true > .secret_hits.txt

if [[ -s .secret_hits.txt ]]; then
  echo "Potential secrets detected:" >&2
  cat .secret_hits.txt >&2
  exit 1
else
  echo "OK: No secrets matched conservative patterns."
fi

