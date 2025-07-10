#!/usr/bin/env bash
set -e
set -x  # <-- this enables printing every command before execution

echo "== krnl_terminal setup started =="

# 1. Install zsh if missing using yay
if ! command -v zsh >/dev/null 2>&1; then
  echo "Installing zsh with yay..."
  yay -S --noconfirm zsh
else
  echo "Zsh already installed."
fi

# 2. Install Oh My Zsh if missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  # Disable auto-chsh and auto-run zsh to avoid interruptions
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed."
fi

# 3. Clone Powerlevel10k theme if missing
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
  echo "Cloning Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
  echo "Powerlevel10k already cloned."
fi

# 4. Force set Powerlevel10k theme in .zshrc
echo "Forcing Powerlevel10k theme in .zshrc"
if grep -q '^ZSH_THEME=' "$HOME/.zshrc"; then
  sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"
else
  echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >>"$HOME/.zshrc"
fi

# 5. Add plugins to .zshrc (git, z, sudo, extract)
if grep -q '^plugins=' "$HOME/.zshrc"; then
  sed -i 's/^plugins=.*/plugins=(git z sudo extract)/' "$HOME/.zshrc"
else
  echo 'plugins=(git z sudo extract)' >>"$HOME/.zshrc"
fi

# 6. Download and install FiraCode Medium Nerd Fonts
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

BASE_URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium"

FONTS=(
  "Fira Code Medium Nerd Font Complete.ttf"
  "Fira Code Medium Nerd Font Complete Mono.ttf"
  "Fira Code Medium Nerd Font Complete Mono.otf"
  "Fira Code Medium Nerd Font Complete.otf"
)

echo "Downloading FiraCode Medium Nerd Fonts..."

for fontfile in "${FONTS[@]}"; do
  curl -fLo "$FONT_DIR/$fontfile" "$BASE_URL/$fontfile"
done

echo "Refreshing font cache..."
fc-cache -fv

echo "== krnl_terminal setup complete! =="
echo "IMPORTANT:"
echo "- Set your terminal font to 'Fira Code Medium Nerd Font' or 'Fira Code Medium Nerd Font Mono'."
echo "- Restart your terminal emulator."
echo "- Run 'exec zsh' to reload your shell."
echo "- On first start, Powerlevel10k will launch its config wizard — follow it!"
