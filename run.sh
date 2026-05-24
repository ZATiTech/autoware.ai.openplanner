#!/usr/bin/env bash
set -euo pipefail

MSG="${1:-start_processing}"

printf "[base_app][%s] run.sh invoked with msg='%s'\n" "$HOSTNAME" "$MSG" 

# Send the HTTP request to processor_app and wait for response
printf "[base_app] Sending request to processor_app and waiting...\n" 

# Use curl to block until processor_app replies
RESP=$(curl -fsS --retry 5 --retry-delay 1 \
    "http://processor_app:5000/process?from=base_app&msg=${MSG}")

printf "[base_app] Received response from processor_app: %s\n" "$RESP" 
