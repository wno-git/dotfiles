#!/bin/bash

set -euo pipefail

DATETIME=$(date +'%H:%M')

POWER=$(
    upower --dump | \
        grep -m 1 percentage | \
            tr -d ' %' | \
                cut -d':' -f 2
)

printf -v POWER_ROUND %.f "${POWER}"

echo "${POWER_ROUND}%  ${DATETIME}"
