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