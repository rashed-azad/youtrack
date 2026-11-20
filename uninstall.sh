#!/usr/bin/env bash
# Stop and remove the service. Keeps your data unless you pass --purge.
set -euo pipefail
systemctl --user stop youtrack.service 2>/dev/null || true
rm -f ~/.config/containers/systemd/youtrack.container
systemctl --user daemon-reload
if [ "${1:-}" = "--purge" ]; then
  podman unshare rm -rf ~/.local/share/youtrack
  echo "Removed service and data."
else
  echo "Removed service. Data kept in ~/.local/share/youtrack"
fi
