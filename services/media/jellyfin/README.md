### Jellyfin Media Server

1. **Setup environment variables:**
   ```bash
   cd services/media/jellyfin
   cp .env.example .env
   # Edit .env with your preferred settings
   ```

2. **Create required volumes:**
   ```bash
   mkdir -p ../../../volumes/jellyfin/{config,cache,logs}
   ```

3. **Deploy Jellyfin:**
   ```bash
   docker-compose up -d
   ```

4. **Access the web interface:**
   - Web UI: `http://your-server-ip:8096`
   - Initial setup will guide you through configuration

5. **Media Library Setup:**
   - Media is mounted from `~/Media` (or set `MEDIA_PATH` in .env)
   - Add media libraries in Jellyfin web interface pointing to `/media`
   - Supported formats: Movies, TV Shows, Music, Photos

6. **Network:**
   - Uses custom bridge network with host binding for discovery
   - Web interface: `http://your-server-ip:8096`
   - DLNA discovery: Port 1900 (UDP) - bound to all interfaces
   - Client discovery: Port 7359 (UDP) - bound to all interfaces

7. **Environment Variables:**
   - `JELLYFIN_PORT`: Web interface port (default: 8096)
   - `JELLYFIN_PORT_DLNA`: DLNA discovery port (default: 1900)
   - `JELLYFIN_PORT_CLIENT`: Client discovery port (default: 7359)
   - `MEDIA_PATH`: Path to your media directory (default: ~/Media)
   - `TIMEZONE`: Server timezone (default: UTC)
   - `JELLYFIN_PUBLISHED_SERVER_URL`: Public URL for external access

:info: The media directory is mounted as read-only (`:ro`) for security
