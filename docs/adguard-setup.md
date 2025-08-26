# AdGuard Home Setup Guide

## Overview
AdGuard Home is a network-wide ad and tracker blocker that acts as a DNS server.

## Initial Setup

1. **Deploy the service:**
   ```bash
   # From the repository root
   ./scripts/deploy.sh network/adguard up
   ```

2. **Access the setup wizard:**
   - Open your browser to `http://your-server-ip:3000`
   - Follow the initial configuration wizard
   - Set admin username and password
   - Configure upstream DNS servers (e.g., 1.1.1.1, 8.8.8.8)

3. **Configure your network:**
   - **Router method (recommended):** Set your router's DNS to your server's IP
   - **Device method:** Set each device's DNS to your server's IP

## Configuration

### Environment Variables
Edit `services/network/adguard/.env`:
- `ADGUARD_PORT_53`: DNS port (default: 53)
- `ADGUARD_PORT_WEB`: Initial setup port (default: 3000)
- `ADGUARD_PORT_ADMIN`: Admin interface port (default: 3001)
- `TIMEZONE`: Your timezone (e.g., Europe/Moscow)

### Volume Layout
- `volumes/adguard/conf/`: Configuration files
- `volumes/adguard/work/`: Runtime data, logs, statistics

### Recommended Upstream DNS Servers
- Cloudflare: `1.1.1.1`, `1.0.0.1`
- Quad9: `9.9.9.9`, `149.112.112.112`
- Google: `8.8.8.8`, `8.8.4.4`

## Post-Setup

### Admin Interface
After initial setup, access the admin panel at:
- `http://your-server-ip:3001`

### Common Tasks
- **View logs:** `./scripts/deploy.sh network/adguard logs`
- **Restart service:** `./scripts/deploy.sh network/adguard restart`
- **Stop service:** `./scripts/deploy.sh network/adguard down`

### Testing
1. Check if DNS is working: `nslookup google.com your-server-ip`
2. Test ad blocking: Visit a site with ads
3. Check query logs in the admin interface

## Troubleshooting

### Port Conflicts
If port 53 is in use:
1. Stop conflicting service (often `systemd-resolved`)
2. Or change `ADGUARD_PORT_53` in `.env`

### Can't Access Web Interface
- Check if ports are open in firewall
- Verify container is running: `docker ps`
- Check logs: `./scripts/deploy.sh network/adguard logs`