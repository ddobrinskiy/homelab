#!/bin/bash

# Homelab Service Deployment Script
# Usage: ./deploy.sh [service-category/service-name] [action]
# Example: ./deploy.sh network/adguard up
# Actions: up, down, restart, logs

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if service path is provided
if [ -z "$1" ]; then
    print_error "Service path is required!"
    echo "Usage: $0 [service-category/service-name] [action]"
    echo "Available services:"
    find services -name "docker-compose.yml" -type f | sed 's|services/||' | sed 's|/docker-compose.yml||'
    exit 1
fi

SERVICE_PATH="$1"
ACTION="${2:-up}"

# Navigate to the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

SERVICE_DIR="services/$SERVICE_PATH"

# Check if service directory exists
if [ ! -d "$SERVICE_DIR" ]; then
    print_error "Service directory '$SERVICE_DIR' does not exist!"
    exit 1
fi

# Check if docker-compose.yml exists
if [ ! -f "$SERVICE_DIR/docker-compose.yml" ]; then
    print_error "docker-compose.yml not found in '$SERVICE_DIR'!"
    exit 1
fi

# Check if .env file exists, warn if not
if [ ! -f "$SERVICE_DIR/.env" ] && [ -f "$SERVICE_DIR/.env.example" ]; then
    print_warning ".env file not found. Creating from .env.example..."
    cp "$SERVICE_DIR/.env.example" "$SERVICE_DIR/.env"
    print_warning "Please edit $SERVICE_DIR/.env before continuing."
    read -p "Press Enter to continue or Ctrl+C to abort..."
fi

print_status "Working with service: $SERVICE_PATH"
print_status "Action: $ACTION"

cd "$SERVICE_DIR"

case "$ACTION" in
    "up")
        print_status "Starting service..."
        docker-compose up -d
        print_success "Service started successfully!"
        ;;
    "down")
        print_status "Stopping service..."
        docker-compose down
        print_success "Service stopped successfully!"
        ;;
    "restart")
        print_status "Restarting service..."
        docker-compose down
        docker-compose up -d
        print_success "Service restarted successfully!"
        ;;
    "logs")
        print_status "Showing logs..."
        docker-compose logs -f
        ;;
    "pull")
        print_status "Pulling latest images..."
        docker-compose pull
        print_success "Images updated!"
        ;;
    *)
        print_error "Unknown action: $ACTION"
        echo "Available actions: up, down, restart, logs, pull"
        exit 1
        ;;
esac