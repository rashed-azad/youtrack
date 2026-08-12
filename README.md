# YouTrack Docker

Local YouTrack installation using Docker Compose.

## Setup

```bash
mkdir -p data conf logs backups
sudo chown -R 13001:13001 data conf logs backups
docker compose up -d
```

Open:

```text
http://192.168.2.200:8081
```

## Backup

Backups are stored in:

```text
./backups/
```

Backup rotation: 1

Sync `backups/` to Google Drive.

## Restore

1. Copy the backup from Google Drive to `./backups/`.
2. Create directories and permissions:

```bash
mkdir -p data conf logs backups
sudo chown -R 13001:13001 data conf logs backups
docker compose up -d
```

3. Open `http://192.168.2.200:8081`.
4. Use the Configuration Wizard to restore the backup.
5. Use the same or newer YouTrack version.