#!/usr/bin/env bash
# Install or update YouTrack as a rootless user service. No sudo.
# Usage: ./install.sh
set -euo pipefail
cd "$(dirname "$0")"

if [ ! -f .env ]; then
  cp .env.example .env
  echo "Created .env from .env.example - edit YOUTRACK_HOST/YOUTRACK_PORT if needed, then run this script again."
  exit 1
fi
source .env

mkdir -p ~/.config/containers/systemd ~/.local/share/youtrack/{data,conf,logs,backups}
sed "s/@YOUTRACK_HOST@/$YOUTRACK_HOST/g; s/@YOUTRACK_PORT@/$YOUTRACK_PORT/g" youtrack.container.in > ~/.config/containers/systemd/youtrack.container

podman pull docker.io/jetbrains/youtrack:2026.2.19840
systemctl --user daemon-reload
systemctl --user restart youtrack.service

echo "YouTrack is starting. Open http://$YOUTRACK_HOST:$YOUTRACK_PORT"
