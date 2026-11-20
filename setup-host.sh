#!/usr/bin/env bash
# One-time system setup. The ONLY sudo step.
set -euo pipefail

if ! command -v podman >/dev/null; then
  sudo apt update && sudo apt install -y podman podman-compose
fi

echo "Done. Now run ./install.sh (no sudo)."
