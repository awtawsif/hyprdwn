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
    swww # Wallpaper daemon
    waybar # Status bar
    wl-clipboard # Wayland clipboard utilities
    xdg-utils
    cliphist # Clipboard history
    blueman # Bluetooth manager
    btop # Resource monitor
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
    capitaine-cursors
    otf-font-awesome
    ttf-jetbrains-mono-nerd
    noto-fonts-emoji
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
    firefox # Web browser
    vlc # Media player
    vlc-plugins-base
    vlc-plugins-extra
    ffmpeg # Multimedia framework
)

# AUR packages
YAY_PACKAGES=(
    # --- Theming ---
    tokyonight-gtk-theme-git
    sddm-silent-theme

    # --- Development ---
    visual-studio-code-bin
)

# Confirmation prompt
echo -e "${CYAN}The following packages will be installed:${NC}"
echo -e "${GREEN}Official packages:${NC} ${PACMAN_PACKAGES[*]}"
echo -e "${GREEN}AUR packages:${NC} ${YAY_PACKAGES[*]}"
read -p "Do you want to proceed with the installation? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}Installation aborted.${NC}"
    exit 1
fi

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
