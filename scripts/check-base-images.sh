#!/usr/bin/env bash
set -euo pipefail

failed=0

while IFS= read -r file; do
    if awk '
        toupper($1) == "FROM" {
            image = $2

            if (image !~ /@sha256:[a-fA-F0-9]{64}$/) {
                print FILENAME ":" FNR ": base image must be pinned by SHA256"
                failed = 1
            }
        }
        END { exit failed }
    ' "$file"; then
        :
    else
        failed=1
    fi
done < <(find apps -type f -name 'Containerfile*')

exit "$failed"
