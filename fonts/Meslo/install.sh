#!/usr/bin/env bash
set -e

# Get the directory of the script itself (so it works no matter where you run it)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "📂 Installing fonts from $SCRIPT_DIR ..."
mkdir -p ~/.local/share/fonts

# Copy all .ttf files from this folder
cp -v "$SCRIPT_DIR"/*.ttf ~/.local/share/fonts/

echo "🔄 Refreshing font cache..."
fc-cache -fv

echo "✅ Fonts installed successfully from $SCRIPT_DIR"

