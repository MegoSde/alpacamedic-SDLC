#!/usr/bin/env bash
set -euo pipefail

cd apps/receptionist

if [[ ! -x ".venv/bin/python" ]]; then
    echo "ERROR: Python environment not found."
    echo "Create it and install requirements-dev.txt."
    exit 1
fi

.venv/bin/python -m pytest -v tests/
