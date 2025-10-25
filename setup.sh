#!/bin/bash

# Color definitions
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"
NC="\033[0m"

# --- Function to setup yay ---
setup_yay() {
    if ! command -v yay &> /dev/null; then
        echo -e "${YELLOW}Setting up yay...${NC}"
        sudo -v # Refresh sudo credentials
        if git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin; then
            cd /tmp/yay-bin || { echo -e "${RED}Failed to cd into /tmp/yay-bin${NC}"; return 1; }
            if makepkg -si --noconfirm; then
                cd - || { echo -e "${RED}Failed to cd back${NC}"; return 1; }
                rm -rf /tmp/yay-bin
                echo -e "${GREEN}yay has been installed successfully.${NC}"
            else
                echo -e "${RED}Failed to build and install yay.${NC}"
                cd - || { echo -e "${RED}Failed to cd back${NC}"; return 1; }
                rm -rf /tmp/yay-bin
                return 1
            fi
        else
            echo -e "${RED}Failed to clone yay repository.${NC}"
            return 1
        fi
    else
        echo -e "${GREEN}yay is already installed.${NC}"
    fi
}

# --- Function to copy config files ---
copy_configs() {
    echo -e "${CYAN}Copying config files...${NC}"

    # Backup existing .config directory
    if [ -d "$HOME/.config" ]; then
        echo -e "${YELLOW}Backing up existing .config directory...${NC}"
        mv "$HOME/.config" "$HOME/.config.bak.$(date +%Y%m%d-%H%M%S)"
        echo -e "${GREEN}Backup created.${NC}"
    fi

    # Copy .config directory
    if cp -r .config "$HOME/"; then
        echo -e "${GREEN}.config directory copied successfully.${NC}"
    else
        echo -e "${RED}Failed to copy .config directory.${NC}"
        return 1
    fi

    # Copy .bashrc and .profile
    if cp -f .bashrc "$HOME/" && cp -f .profile "$HOME/"; then
        echo -e "${GREEN}.bashrc and .profile copied successfully.${NC}"
    else
        echo -e "${RED}Failed to copy .bashrc or .profile.${NC}"
        return 1
    fi

    # Copy SDDM config
    echo -e "${CYAN}Copying SDDM configuration...${NC}"
    if sudo cp -f sddm.conf /etc/; then
        echo -e "${GREEN}sddm.conf copied to /etc/ successfully.${NC}"
    else
        echo -e "${RED}Failed to copy sddm.conf to /etc/.${NC}"
        return 1
    fi

    # Copy SDDM theme metadata
    echo -e "${CYAN}Copying SDDM theme metadata...${NC}"
    if [ ! -d "/usr/share/sddm/themes/silent/" ]; then
        echo -e "${YELLOW}Creating directory /usr/share/sddm/themes/silent/...${NC}"
        sudo mkdir -p "/usr/share/sddm/themes/silent/"
    fi
    if sudo cp -f metadata.desktop /usr/share/sddm/themes/silent/; then
        echo -e "${GREEN}metadata.desktop copied to /usr/share/sddm/themes/silent/ successfully.${NC}"
    else
        echo -e "${RED}Failed to copy metadata.desktop to /usr/share/sddm/themes/silent/.${NC}"
        return 1
    fi

    echo -e "${CYAN}Sourcing .profile...${NC}"
    # shellcheck source=/dev/null
    source "$HOME/.profile"
    echo -e "${GREEN}.profile sourced.${NC}"
}

# --- Function to setup user directories ---
setup_user_dirs() {
    echo -e "${CYAN}Setting up user directories...${NC}"

    # Create a list of useful directories
    user_dirs=(
        "$HOME/Documents"
        "$HOME/Downloads"
        "$HOME/Pictures"
        "$HOME/Projects"
        "$HOME/Videos"
    )

    for dir in "${user_dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
            echo -e "${GREEN}Created directory: $dir${NC}"
        else
            echo -e "${YELLOW}Directory already exists: $dir${NC}"
        fi
    done

    # Remove .bash_profile if it exists
    if [ -f "$HOME/.bash_profile" ]; then
        echo -e "${YELLOW}Removing .bash_profile...${NC}"
        rm "$HOME/.bash_profile"
        echo -e "${GREEN}.bash_profile removed.${NC}"
    fi
}

# --- Main function ---
main() {
    echo -e "${CYAN}Starting setup...${NC}"

    setup_yay || { echo -e "${RED}Failed to setup yay. Aborting.${NC}"; exit 1; }
    ./install_packages.sh || { echo -e "${RED}Package installation failed. Aborting.${NC}"; exit 1; }
    copy_configs || { echo -e "${RED}Config copy failed. Aborting.${NC}"; exit 1; }
    setup_user_dirs
    setup_git
    sudo systemctl enable sddm.service

    echo -e "${GREEN}Setup completed successfully!${NC}"
}

# --- Function to setup git ---
setup_git() {
    echo -e "${CYAN}Setting up git...${NC}"
    read -p "Do you want to setup your git username and email? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "Enter your git username: " git_username
        read -p "Enter your git email: " git_email
        git config --global user.name "$git_username"
        git config --global user.email "$git_email"
        echo -e "${GREEN}Git username and email have been set.${NC}"
    else
        echo -e "${YELLOW}Skipping git setup.${NC}"
    fi
}

# --- Run main ---
main "$@"
