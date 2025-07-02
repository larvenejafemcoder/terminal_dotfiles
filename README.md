# 🧠 KernelGhost's Terminal Dotfiles (empty repo for now)

Minimal dotfiles setup for terminal environments across **GNOME-based Arch/Ubuntu/Debian systems**.

> ⚙️ Zsh + 🖥 Alacritty + 🧪 GNOME Terminal = Clean, fast terminal everywhere.

---

### 📦 Features

- ⚙️ Zsh with `oh-my-zsh`, autosuggestions, syntax highlighting, and aliases
- 🖥 Alacritty config with nerd font, opacity, and style
- 🧪 GNOME Terminal config import/export using `dconf`
- 🧾 One-step installer for most Linux distros

---

### 🚀 Quick Install

```bash
# Clone the dotfiles
git clone https://github.com/larvenejafemcoder/terminal_dotfiles.git ~/dotfiles
cd ~/dotfiles

# Make installer executable
chmod +x install.sh

# Run the installer
./install.sh
````

---

### 🛠 Requirements

Install these first:

**Arch-based:**

```bash
sudo pacman -S zsh curl alacritty dconf
```

**Ubuntu/Debian-based:**

```bash
sudo apt install zsh curl alacritty dconf-cli
```

---

### 📂 Folder Structure

```
terminal_dotfiles/
├── alacritty/              # Alacritty config (alacritty.yml)
├── gnome-terminal/         # GNOME Terminal settings (dconf export)
├── zsh/                    # Zsh config and aliases
├── install.sh              # Setup script
├── README.md
└── LICENSE
```

---

### 💻 Git Usage Basics (For noobies like me)

```bash
# Clone (first time)
git clone https://github.com/larvenejafemcoder/terminal_dotfiles.git

# Push changes
git add .
git commit -m "Update: yoooo zsh tweaks"
git push

# Pull latest changes
git pull

# Check for updates
git fetch
```

---

### 📥 Export Your GNOME Terminal Setup

To save your current GNOME Terminal config:

```bash
dconf dump /org/gnome/terminal/ > gnome-terminal/gnome-terminal.dconf
```

To restore it later:

```bash
dconf load /org/gnome/terminal/ < gnome-terminal/gnome-terminal.dconf
```

---

### 🙌 Author

Maintained by [@larvenejafemcoder](https://github.com/larvenejafemcoder)

---

### 📜 License

MIT – do whatever, just don’t sell it without credit 😤

```

---

---

Yo! 👋 If you're reading this, congrats — you're either lost, curious, or actually trying to rice your terminal like a true nerd 🧠✨

This repo is currently **English-only**, but I *might* add multilingual support (Vietnamese?) if people ever stumble across it — not holding my breath tho 😅

Feel free to fork, break, or fix it. Lemme know if something’s janked — or if you just wanna vibe and improve it 🛠️🔥

