#!/usr/bin/env bash
set -euo pipefail

SEMGREP="${HOME}/.venvs/semgrep/bin/semgrep"

if [[ ! -x "$SEMGREP" ]]; then
    echo "ERROR: Semgrep is not installed."
    echo "Expected: $SEMGREP"
    exit 1
fi

echo "Running Semgrep security scan..."

"$SEMGREP" scan \
    --config p/python \
    --config p/security-audit \
    --error \
    apps/receptionist/
