#!/usr/bin/env bash
# Sibling of the code_flow menu (port 8766). This catalog uses 8767.
set -euo pipefail
PORT="${1:-8767}"
BIND="${2:-127.0.0.1}"
cd "$(dirname "$0")"
echo "Robot Benchmark Atlas  →  http://${BIND}:${PORT}/"
exec python3 -m http.server "$PORT" --bind "$BIND"
