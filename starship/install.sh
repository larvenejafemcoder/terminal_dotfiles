set -e

echo "Installing StarShip........"
n=5

for ((i = 1; i <= n; i++)); do
  echo " $i"
done

curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "Okay starship done installing, heading to config..."

mkdir -p ~/.config

cat >~/.config/starship.toml <<'EOF'
# Get editor completions based on the config schema
"$schema" = 'https://starship.rs/config-schema.json'
  
# Inserts a blank line between shell prompts
add_newline = true

# Replace the '❯' symbol in the prompt with '➜'
[character] # The name of the module we are configuring is 'character'
success_symbol = '[➜](bold green)'

# The 'success_symbol' segment is being set to '➜' with the color 'bold green'
# Disable the package module, hiding it from the prompt completely
[package]
disabled = true
EOF

echo "🎉 Done! Reloading your shell to apply Starship."

# === DETECT SHELL AND EVAL INIT ===
echo "🔧 Detecting shell..."
SHELL_NAME=$(basename "$SHELL")

echo "👉 Detected shell: $SHELL_NAME"

if command -v starship >/dev/null 2>&1; then
  echo "🔄 Initializing Starship..."
  eval "$(starship init $SHELL_NAME)"
else
  echo "⚠️ Starship not found in PATH!"
fi

starship preset catppuccin-powerline -o ~/.config/starship.toml

echo "🎉 Done! Starship is now active in this session."
