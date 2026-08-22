#!/bin/bash

# Color definitions
GREEN="\033[0;32m"
RED="\033[0;31m"
CYAN="\033[0;36m"
NC="\033[0m"

echo -e "${CYAN}Installing packages...${NC}"

# Official repository packages
PACMAN_PACKAGES=(
    # --- Hyprland Ecosystem ---
    hyprland
    hypridle
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprshot
    xdg-desktop-portal-hyprland

    # --- System Utilities & Services ---
    sddm # Display manager
    mako # Notification daemon
    polkit-kde-agent # Polkit agent
    rofi # Application launcher
    rofi-emoji
    awww # Wallpaper daemon
    wl-clipboard # Wayland clipboard utilities
    xdg-utils
    cliphist # Clipboard history
    blueman # Bluetooth manager
    htop # Resource monitor
    slurp # Screen region selection
    smartmontools # S.M.A.R.T. disk monitoring
    uwsm
    wireless_tools
    network-manager-applet # Applet for networkmanager
    grim # Screenshot utility
    brightnessctl # Brightness control
    bash-completion
    fastfetch # System information tool
    wget
    man-db
    jq # JSON processor
    xclip # X11 clipboard utility
    npm # Node package manager

    # --- Appearance & Theming ---
    bibata-cursor-theme
    otf-font-awesome
    ttf-jetbrains-mono-nerd
    noto-fonts-emoji
    noto-fonts-extra
    noto-fonts-cjk
    nwg-look # GTK theme switcher

    # --- CLI Tools ---
    github-cli
    exa # ls replacement
    bat # cat replacement
    zoxide # cd replacement
    nano
    nano-syntax-highlighting

    # --- GUI Applications & File Management ---
    alacritty # Terminal emulator
    mousepad # Text editor
    thunar # File manager
    thunar-volman
    thunar-archive-plugin
    gvfs
    gvfs-mtp
    unrar
    zip
    unzip
    xarchiver
    p7zip
    tumbler # Thumbnail generator
    ffmpeg # Multimedia framework
    mpv

    # --- Chaotic-AUR Packages ---
    yay
    tokyonight-gtk-theme-git
)

# AUR packages (remaining packages not in Chaotic-AUR or available in yay)
YAY_PACKAGES=(
    wayle-bin
    sddm-silent-theme
)

# Confirmation prompt
echo -e "${CYAN}The following packages will be installed:${NC}"
echo -e "${GREEN}Packages (Official Repositories):${NC} ${PACMAN_PACKAGES[*]}"
echo -e "${GREEN}Packages (AUR via yay):${NC} ${YAY_PACKAGES[*]}"
read -p "Do you want to proceed with the installation? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}Installation aborted.${NC}"
    exit 1
fi

# Install official repository packages with pacman
if [ ${#PACMAN_PACKAGES[@]} -gt 0 ]; then
    echo -e "${CYAN}Installing packages with pacman (Official Repositories)...${NC}"
    if sudo pacman -S --noconfirm --needed "${PACMAN_PACKAGES[@]}"; then
        echo -e "${GREEN}All official packages installed successfully.${NC}"
    else
        echo -e "${RED}Failed to install some official packages.${NC}"
        exit 1
    fi
fi

# Install AUR packages with yay
if [ ${#YAY_PACKAGES[@]} -gt 0 ]; then
    echo -e "${CYAN}Installing packages with yay (AUR)...${NC}"
    if yay -S --noconfirm "${YAY_PACKAGES[@]}"; then
        echo -e "${GREEN}All AUR packages installed successfully.${NC}"
    else
        echo -e "${RED}Failed to install some AUR packages.${NC}"
        exit 1
    fi
fi
