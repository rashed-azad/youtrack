# YouTrack on Podman

Local YouTrack, running rootless with Podman.

## 1. Install Podman (one time)

```bash
sudo apt update
sudo apt install podman podman-compose
```

## 2. Allow it to start on boot (one time)

```bash
loginctl enable-linger $USER
```

## 3. Set your IP and port

```bash
cp .env.example .env
```

Edit `.env` and set `YOUTRACK_HOST` to your machine's IP (and `YOUTRACK_PORT`
if you don't want 8081).

## 4. Start YouTrack

```bash
./setup.sh
```

The script prints the URL to open once it's up.

## Backup

Backups are saved in `./backups/`. Sync that folder to Google Drive yourself.
Backup rotation: 1.

## Restore

1. Copy the backup file from Google Drive into `./backups/`.
2. Run:

```bash
./setup.sh
```

3. Open the URL the script prints.
4. Use the Configuration Wizard to restore the backup.
5. Use the same or a newer YouTrack version.

## Other commands

```bash
podman-compose down      # stop YouTrack
podman-compose logs -f   # view logs
podman ps                # list running containers
```
