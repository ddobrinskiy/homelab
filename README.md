# Homelab Docker Monorepo

A centralized repository for managing all homelab Docker services and their configurations.

## 🏗️ Structure

```
homelab/
├── services/           # Docker Compose configurations
│   └── network/
│       └── adguard/   # AdGuard Home DNS server
├── volumes/           # Persistent data volumes
│   └── adguard/       # AdGuard configuration and data
├── scripts/           # Automation scripts
├── docs/             # Documentation
└── README.md         # This file
```

## 🚀 Quick Start



## 📁 Volume Management

- **Tracked in Git**: Directory structure (`.gitkeep` files)
- **Ignored**: Actual volume contents (configurations, logs, databases)
- **Backup Strategy**: The `volumes/` directory structure is preserved for easy backup scripting

## 🔧 Environment Variables

Each service includes a `.env.example` file with all configurable options. Copy this to `.env` and customize as needed.

## 📚 Documentation

- Service-specific guides: `docs/`
- Troubleshooting: Check individual service documentation

## 🛠️ Management Scripts

Coming soon in the `scripts/` directory:
- `deploy.sh` - Deploy specific services
- `backup.sh` - Backup volume data
- `update.sh` - Update service images

## 🔒 Security

- All `.env` files are gitignored
- Use `.env.example` as templates
- Never commit secrets to version control

## ⚙️ Radarr ↔ Transmission (RPC whitelist)

If Transmission runs outside Docker (e.g., desktop app) and "Only allow these IP addresses" is enabled, you must allow Docker containers to reach Transmission's RPC:

- Add the Docker bridge subnet to the whitelist, for example `172.17.0.0/16`, or a broad rule like `172.*.*.*`.
- Alternatively, add the Radarr container's IP (inspect with `docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' radarr`).
- You can also temporarily disable the whitelist to test connectivity.

This avoids "Failed to authenticate with Transmission. It may be necessary to add Radarr's IP address to RPC whitelist." when adding the download client in Radarr.