#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR"

echo "🌸 Starting Faelina Discord Music Bot..."

if ! command -v node &> /dev/null; then
    echo "[ERROR] Node.js is not installed. Please install Node.js v18+."
    exit 1
fi

if [ ! -d "node_modules" ]; then
    echo "[INFO] Installing dependencies..."
    npm install
fi

if [ ! -f ".env" ] && [ -f ".env.example" ]; then
    echo "[WARN] .env not found! Copying .env.example..."
    cp .env.example .env
    echo "[INFO] Please configure your .env file with your Discord Bot TOKEN."
fi

exec node index.js
