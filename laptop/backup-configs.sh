#!/usr/bin/env bash

set -e

BACKUP_DIR="${1:-$HOME/i3-dotfiles-backup-$(date +%Y-%m-%d_%H-%M-%S)}"

mkdir -p "$BACKUP_DIR"

copy_config() {
    NAME="$1"

    if [ -d "$HOME/.config/$NAME" ]; then
        echo "Backing up $NAME..."
        cp -a "$HOME/.config/$NAME" "$BACKUP_DIR/.config/"
    else
        echo "Skipping $NAME (not found)"
    fi
}

mkdir -p "$BACKUP_DIR/.config"

echo "Backing up configs..."

for config in \
    dconf \
    gtk-3.0 \
    gtk-4.0 \
    i3 \
    mpv \
    picom \
    polybar \
    pulse \
    rofi \
    wezterm
do
    copy_config "$config"
done


echo "Backing up extra files..."

# X11 settings
[ -f "$HOME/.Xresources" ] && cp "$HOME/.Xresources" "$BACKUP_DIR/"
[ -f "$HOME/.xinitrc" ] && cp "$HOME/.xinitrc" "$BACKUP_DIR/"

# Shell configs
[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$BACKUP_DIR/"
[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$BACKUP_DIR/"

# Fonts/themes/icons
[ -d "$HOME/.themes" ] && cp -a "$HOME/.themes" "$BACKUP_DIR/"
[ -d "$HOME/.icons" ] && cp -a "$HOME/.icons" "$BACKUP_DIR/"
[ -d "$HOME/.local/share/fonts" ] && cp -a "$HOME/.local/share/fonts" "$BACKUP_DIR/.local-share-fonts"


echo "Saving package lists..."

pacman -Qqe > "$BACKUP_DIR/pacman-packages.txt"

if command -v yay >/dev/null 2>&1; then
    yay -Qqe > "$BACKUP_DIR/yay-packages.txt"
fi

if command -v paru >/dev/null 2>&1; then
    paru -Qqe > "$BACKUP_DIR/paru-packages.txt"
fi


echo "Exporting dconf settings..."

if command -v dconf >/dev/null 2>&1; then
    dconf dump / > "$BACKUP_DIR/dconf-settings.ini"
fi


echo
echo "Done!"
echo "Backup saved to:"
echo "$BACKUP_DIR"
