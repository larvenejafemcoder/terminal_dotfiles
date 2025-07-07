#!/usr/bin/env bash

set -euo pipefail  # Strict mode: fail on errors and unset vars

FONT_DIR="$HOME/.local/share/fonts"
SOURCE_DIR="$(dirname "$(realpath "$0")")"

echo "📦 Installing Nerd Fonts from $SOURCE_DIR to $FONT_DIR"

mkdir -p "$FONT_DIR" || {
  echo "❌ Failed to create font directory: $FONT_DIR" >&2
  exit 1
}

# Copy all .ttf files; track failure
copy_failed=0
while IFS= read -r -d '' fontfile; do
  if ! cp "$fontfile" "$FONT_DIR"; then
    echo "❌ Failed to copy font: $fontfile" >&2
    copy_failed=1
  else
    echo "✔️ Copied: $(basename "$fontfile")"
  fi
done < <(find "$SOURCE_DIR" -type f -name "*.ttf" -print0)

if [ $copy_failed -ne 0 ]; then
  echo "❗ One or more font files failed to copy. Please check permissions and disk space." >&2
  exit 1
fi

echo "🔄 Refreshing font cache..."
if ! fc-cache -f -v > /dev/null 2>&1; then
  echo "❌ Failed to update font cache." >&2
  exit 1
fi

echo "✅ Fonts installed successfully!"

# Optional: verify fonts exist in cache
if ! fc-list | grep -iq "Nerd"; then
  echo "⚠️ Warning: Installed fonts not found in font cache yet." >&2
  echo "Try restarting your terminal or session."
fi
