#!/usr/bin/env bash
set -euo pipefail

RUFF="${HOME}/.venvs/ruff/bin/ruff"

if [[ ! -x "$RUFF" ]]; then
    echo "ERROR: Ruff is not installed."
    exit 1
fi

echo "Checking Python syntax..."
python3 -m compileall -q apps/receptionist/app apps/receptionist/tests

echo "Running Ruff linting..."
"$RUFF" check apps/

echo "Checking Python formatting..."
"$RUFF" format --check apps/
