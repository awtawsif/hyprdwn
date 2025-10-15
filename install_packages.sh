#!/bin/bash

# Color definitions
GREEN="\033[0;32m"
RED="\033[0;31m"
CYAN="\033[0;36m"
NC="\033[0m"

echo -e "${CYAN}Installing packages...${NC}"

# Official repository packages
PACMAN_PACKAGES=(
    hyprland hypridle hyprlock hyprpicker hyprpolkitagent hyprshot ly mako
    polkit-kde-agent rofi rofi-emoji swww waybar wl-clipboard
    xdg-desktop-portal-hyprland xdg-utils cliphist blueman
    capitaine-cursors
    otf-font-awesome
    ttf-jetbrains-mono-nerd
    noto-fonts-emoji
    nwg-look
    github-cli
    btop
    exa
    bat
    alacritty
    brightnessctl
    nano
    nano-syntax-highlighting
    mousepad
    bash-completion
    fastfetch
    wget
    man-db
    jq
    xclip
    npm
    thunar
    thunar-volman
    thunar-archive-plugin
    gvfs
    gvfs-mtp
    unrar
    zip
    unzip
    xarchiver
    p7zip
    tumbler
    firefox
)

# AUR packages
YAY_PACKAGES=(
    tokyonight-gtk-theme-git
)

# Install official packages with pacman
if [ ${#PACMAN_PACKAGES[@]} -gt 0 ]; then
    echo -e "${CYAN}Installing official packages with pacman...${NC}"
    if sudo pacman -S --noconfirm "${PACMAN_PACKAGES[@]}"; then
        echo -e "${GREEN}Official packages installed successfully.${NC}"
    else
        echo -e "${RED}Failed to install some official packages.${NC}"
        exit 1
    fi
fi

# Install AUR packages with yay
if [ ${#YAY_PACKAGES[@]} -gt 0 ]; then
    echo -e "${CYAN}Installing AUR packages with yay...${NC}"
    if yay -S --noconfirm "${YAY_PACKAGES[@]}"; then
        echo -e "${GREEN}AUR packages installed successfully.${NC}"
    else
        echo -e "${RED}Failed to install some AUR packages.${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}All packages installed successfully.${NC}"
