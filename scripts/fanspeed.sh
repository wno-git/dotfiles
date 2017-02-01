#!/bin/bash

set -euo pipefail

# Adjust the minimum RPM of the fan in a MacBook Pro

echo "$1" > /sys/devices/platform/applesmc.768/fan1_min
