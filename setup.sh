#!/bin/bash
set -e

if [ ! -f .env ]; then
  cp .env.example .env
  echo "Created .env from .env.example - edit YOUTRACK_HOST/YOUTRACK_PORT if needed, then run this script again."
  exit 1
fi

source .env

mkdir -p data conf logs backups
podman-compose up -d

echo "YouTrack is starting. Open http://$YOUTRACK_HOST:$YOUTRACK_PORT"
