#!/usr/bin/env bash

set -e

BACKUP_DIR="${1:-$HOME/i3-dotfiles-backup-$(date +%Y-%m-%d_%H-%M-%S)}"

mkdir -p "$BACKUP_DIR"

copy_config() {
    NAME="$1"

    if [ -d "$HOME/.config/$NAME" ]; then
        echo "Backing up $NAME..."
        rsync -a --exclude='.git' "$HOME/.config/$NAME" "$BACKUP_DIR/.config/"
    else
        echo "Skipping $NAME (not found)"
    fi
}

mkdir -p "$BACKUP_DIR/.config"

echo "Backing up configs..."

for config in \
    gtk-3.0 \
    gtk-4.0 \
    i3 \
    mpv \
    picom \
    polybar \
    pulse \
    rofi \
    nvim \
    fastfetch \
    btop \
    cava \
    wezterm
do
    copy_config "$config"
done


echo "Backing up extra files..."

[ -f "$HOME/commands.md" ] && cp "$HOME/commands.md" "$BACKUP_DIR/"

# X11 settings
[ -f "$HOME/.Xresources" ] && cp "$HOME/.Xresources" "$BACKUP_DIR/"
[ -f "$HOME/.xinitrc" ] && cp "$HOME/.xinitrc" "$BACKUP_DIR/"

# Shell configs
echo "Backing up shell configs..."

[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$BACKUP_DIR/"
[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$BACKUP_DIR/"
[ -f "$HOME/.zprofile" ] && cp "$HOME/.zprofile" "$BACKUP_DIR/"
[ -f "$HOME/.zshenv" ] && cp "$HOME/.zshenv" "$BACKUP_DIR/"
[ -f "$HOME/.zlogin" ] && cp "$HOME/.zlogin" "$BACKUP_DIR/"

# Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Backing up Oh My Zsh..."
    rsync -a --exclude='.git' "$HOME/.oh-my-zsh/" "$BACKUP_DIR/.oh-my-zsh/"
else
    echo "Skipping Oh My Zsh (not found)"
fi

# Powerlevel10k config
[ -f "$HOME/.p10k.zsh" ] && cp "$HOME/.p10k.zsh" "$BACKUP_DIR/"

# Fonts/themes/icons
[ -d "$HOME/.themes" ] && rsync -a --exclude='.git' "$HOME/.themes/" "$BACKUP_DIR/.themes/"
[ -d "$HOME/.icons" ] && rsync -a --exclude='.git' "$HOME/.icons/" "$BACKUP_DIR/.icons/"
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

echo "Backing up PNG files in ~/.config..."

find "$HOME/.config" -maxdepth 1 -type f -name "*.png" -exec cp {} "$BACKUP_DIR/.config/" \;

# Local application desktop entries
echo "Backing up local application entries..."

if [ -d "$HOME/.local/share/applications" ]; then
    mkdir -p "$BACKUP_DIR/.local/share/applications"
    rsync -a \
        --include='*.desktop' \
        --exclude='*' \
        "$HOME/.local/share/applications/" \
        "$BACKUP_DIR/.local/share/applications/"
else
    echo "Skipping local applications (not found)"
fi


# Local bin scripts
echo "Backing up local bin scripts..."

if [ -d "$HOME/.local/bin" ]; then
    mkdir -p "$BACKUP_DIR/.local/bin"
    rsync -a \
        --include='*.sh' \
        --exclude='*' \
        "$HOME/.local/bin/" \
        "$BACKUP_DIR/.local/bin/"
else
    echo "Skipping ~/.local/bin (not found)"
fi

echo
echo "Done!"
echo "Backup saved to:"
echo "$BACKUP_DIR"
