## WUD (What's Up Docker?)

Keep containers up-to-date. Web UI runs on `${WUD_PORT}`.

### Usage

1. Copy env
   ```bash
   cp env.example .env
   ```
2. Start
   ```bash
   docker compose up -d
   ```
3. Open UI: `http://192.168.0.42:${WUD_PORT}`

### Notes

- Reads Docker events via `/var/run/docker.sock` (mounted read-only).
- Persists state in `volumes/wud/store`.
- Optional basic auth via `WUD_AUTH_BASIC_ADMIN_USER` and `WUD_AUTH_BASIC_ADMIN_HASH`.

### Links

- Docs & source: [getwud/wud](https://github.com/getwud/wud)


