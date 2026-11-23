#!/usr/bin/env bash
set -euo pipefail

PIP_AUDIT="${HOME}/.venvs/pip-audit/bin/pip-audit"

if [[ ! -x "$PIP_AUDIT" ]]; then
    echo "ERROR: pip-audit is not installed."
    exit 1
fi

echo "Auditing Python dependencies..."

"$PIP_AUDIT" \
    -r apps/receptionist/requirements.txt

echo "Python dependency audit passed."
