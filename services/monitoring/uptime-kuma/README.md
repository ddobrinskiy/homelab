## Uptime Kuma

Self-hosted monitoring tool. Web UI runs on `${KUMA_PORT}`.

### Usage

1. Copy env
   ```bash
   cp env.example .env
   ```
2. Start
   ```bash
   docker compose up -d
   ```
3. Open UI: `http://192.168.0.42:${KUMA_PORT}`

### Notes

- Data persisted at `volumes/uptime-kuma/data`.
- Image pinned to major version `louislam/uptime-kuma:1`.

### Links

- Docs & source: [louislam/uptime-kuma](https://github.com/louislam/uptime-kuma)


