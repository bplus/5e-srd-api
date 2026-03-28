#!/bin/bash
# Wrapper for launchd: starts 5e-srd-api Docker Compose stack
set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"
export HOME="/Users/bryan"

cd /Users/bryan/work/5e-srd-api

# Wait for Docker/OrbStack to be available (up to 60s)
for i in $(seq 1 30); do
    if docker info >/dev/null 2>&1; then
        break
    fi
    sleep 2
done

exec docker compose up -d
