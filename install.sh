#!/usr/bin/env bash
# ==============================================================================
# ⚙ STEAMPUNK EMERALD & GOLD ARCH LINUX RICE INSTALLER
# Window Manager: Niri (Wayland)
# ==============================================================================
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

GREEN="\033[1;38;2;120;196;93m"
GOLD="\033[1;38;2;222;192;126m"
RESET="\033[0m"

echo -e "${GOLD}"
cat << 'BANNER'
  ⚙   ❖ ═══════════════════════════════════════════════════════ ❖   ⚙
         STEAMPUNK ARCH LINUX CLOCKWORK SANCTUARY DOTFILES
                       Niri Wayland Desktop
  ⚙   ❖ ═══════════════════════════════════════════════════════ ❖   ⚙
BANNER
echo -e "${RESET}"

echo -e "${GOLD}[*] Starting deployment from: ${DOTFILES_DIR}${RESET}"

# Create required directories
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/Pictures/Wallpapers"

# 1. Link Wallpapers
echo -e "${GREEN}[+] Deploying wallpapers to ~/Pictures/Wallpapers...${RESET}"
for wp in "$DOTFILES_DIR"/wallpapers/*; do
    [ -e "$wp" ] || continue
    ln -sf "$wp" "$HOME/Pictures/Wallpapers/"
done

# Set default wallpaper symlink if not present
if [ ! -e "$HOME/.config/wallpaper.jpg" ]; then
    ln -sf "$HOME/Pictures/Wallpapers/5k-steampunk-emerald-observatory-art.png" "$HOME/.config/wallpaper.jpg"
fi

# 2. Link .config directories & files
echo -e "${GREEN}[+] Linking .config files...${RESET}"
CONFIG_ITEMS=(
    "niri"
    "waybar"
    "kitty"
    "fastfetch"
    "cava"
    "rofi"
    "mako"
    "lines"
    "gtk-3.0"
    "gtk-4.0"
    "fontconfig"
    "environment.d"
    "electron-flags.conf"
    "xdg-desktop-portal"
    "xdg-desktop-portal-wlr"
    "OpenRGB"
    "YouTube Music Desktop App"
    "vesktop"
    "vesktop-flags.conf"
)

for item in "${CONFIG_ITEMS[@]}"; do
    SRC="$DOTFILES_DIR/.config/$item"
    DEST="$HOME/.config/$item"

    if [ -e "$SRC" ]; then
        if [ -e "$DEST" ] && [ ! -L "$DEST" ]; then
            mkdir -p "$BACKUP_DIR/.config"
            mv "$DEST" "$BACKUP_DIR/.config/"
            echo -e "    Backed up existing $item to $BACKUP_DIR/.config/"
        fi
        ln -sfn "$SRC" "$DEST"
        echo -e "    Linked .config/$item"
    fi
done

# Fish shell configs (merged carefully)
mkdir -p "$HOME/.config/fish/conf.d" "$HOME/.config/fish/functions"
if [ -f "$DOTFILES_DIR/.config/fish/config.fish" ]; then
    ln -sf "$DOTFILES_DIR/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
fi
if [ -f "$DOTFILES_DIR/.config/fish/conf.d/fish_frozen_theme.fish" ]; then
    ln -sf "$DOTFILES_DIR/.config/fish/conf.d/fish_frozen_theme.fish" "$HOME/.config/fish/conf.d/fish_frozen_theme.fish"
fi
if [ -f "$DOTFILES_DIR/.config/fish/functions/fish_prompt.fish" ]; then
    ln -sf "$DOTFILES_DIR/.config/fish/functions/fish_prompt.fish" "$HOME/.config/fish/functions/fish_prompt.fish"
fi

# 3. Link custom scripts in ~/.local/bin
echo -e "${GREEN}[+] Deploying custom CLI utilities to ~/.local/bin...${RESET}"
for bin in "$DOTFILES_DIR"/.local/bin/*; do
    [ -e "$bin" ] || continue
    name="$(basename "$bin")"
    ln -sf "$bin" "$HOME/.local/bin/$name"
    chmod +x "$bin"
    echo -e "    Installed $name"
done

echo -e "\n${GOLD}✔ All configurations and clockwork tools deployed successfully!${RESET}"
echo -e "${GREEN}Restart Niri or reload Waybar (pkill waybar && waybar &) to enjoy! ⚙🌿${RESET}\n"
