<div align="center">

#  HyprDwn  

**A sleek, modern, and personalized Hyprland environment with a stunning Tokyo Night theme.**

</div>

**HyprDwn** provides a complete, ready-to-use configuration for a beautiful and functional Arch Linux desktop using the Hyprland compositor. It automates the setup process, from installing packages to copying configuration files, allowing you to get up and running with a consistent and visually appealing workflow in minutes.

---

## ✨ Features

-   **Window Manager**: [Hyprland](https://hyprland.org/) - A dynamic tiling Wayland compositor with smooth animations.
-   **Display Manager**: [SDDM](https://github.com/sddm/sddm) with Silent theme - A modern display manager.
-   **Package Management**: [Chaotic-AUR](https://aur.chaotic.cx/) - Pre-compiled AUR packages for faster installation.
-   **Application Launcher**: [Rofi](https://github.com/davatorium/rofi) - A versatile and themeable application launcher.
-   **Status Bar**: [Waybar](https://github.com/Alexays/Waybar) - A highly customizable Wayland bar for Hyprland.
-   **Terminal**: [Alacritty](https://alacritty.org/) - A fast, GPU-accelerated terminal emulator.
-   **File Manager**: [Thunar](https://docs.xfce.org/xfce/thunar/start) - A modern and lightweight file manager.
-   **Theme**: [Tokyo Night](https://github.com/Fausto-Korps/Tokyo-Night-GTK-Theme) - A clean, dark theme for GTK applications.
-   **Development**: [Visual Studio Code](https://code.visualstudio.com/) - Popular code editor.
-   **Icons & Cursors**: Font Awesome, Capitaine Cursors, and Noto Emoji for a consistent look.
-   **Fonts**: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/) for excellent readability and glyph support.
-   **Shell Enhancements**: `exa` for modern directory listings, `bat` for syntax-highlighted file previews, and `zoxide` for smart directory navigation.
-   **And much more**: Includes essential utilities for notifications (`mako`), clipboard management (`cliphist`), screen capture (`hyprshot`), system monitoring (`btop`), and multimedia (`vlc`).

---

## 🚀 Installation

Setting up your Hyprland environment is simple. The `setup.sh` script handles everything for you.

**Prerequisites:**
*   A fresh Arch Linux installation. This setup is designed for a **clean Arch Linux installation**. For best results, start with a minimal installation that does not include a desktop environment. If you are using the `archinstall` script, select the **'minimal' profile** to ensure there are no conflicting configurations.
*   `git` installed (`sudo pacman -S git`).
*   Internet connection for downloading packages from Chaotic-AUR.

**Steps:**

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/awtawsif/hyprdwn.git
    cd hyprdwn
    ```

2.  **Make the scripts executable:**
    ```bash
    chmod +x setup.sh install_packages.sh
    ```

3.  **Run the setup script:**
    ```bash
    ./setup.sh
    ```

The script will:
-   Set up **Chaotic-AUR** repository for faster package installation.
-   Install all necessary packages using `pacman` (including Chaotic-AUR packages).
-   Back up your existing `.config` directory to `~/.config.bak.<timestamp>`.
-   Copy all the configuration files to your `~/.config` directory.
-   Set up your home directory with standard user folders.
-   Optionally configure Git user settings.
-   Enable the **SDDM** display manager.

After the script finishes, reboot your system, and you should be greeted by the SDDM login screen with the Silent theme.

---

## 📦 Package Sources

This setup uses multiple package sources to provide a complete desktop experience:

- **Official Repositories**: Core system packages and most applications via `pacman`
- **Chaotic-AUR**: Pre-compiled AUR packages for faster installation, including:
  - `tokyonight-gtk-theme-git` - Tokyo Night GTK theme
  - `visual-studio-code-bin` - Visual Studio Code editor
- **AUR via yay**: Additional packages available in the AUR:
  - `sddm-silent-theme` - SDDM login theme

---

## 🔧 Troubleshooting

**Common Issues:**

1. **Chaotic-AUR Key Issues**: If you encounter GPG errors, manually refresh the keys:
   ```bash
   sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
   sudo pacman-key --lsign-key 3056513887B78AEB
   sudo pacman -Syu
   ```

2. **SDDM Not Starting**: Ensure the service is enabled:
   ```bash
   sudo systemctl enable sddm.service
   sudo systemctl start sddm.service
   ```

3. **Waybar Not Appearing**: Check if Hyprland is running properly and restart Waybar:
   ```bash
   killall waybar
   waybar &
   ```

4. **Script Permission Issues**: Make sure scripts are executable:
   ```bash
   chmod +x setup.sh install_packages.sh
   ```

---

## ⌨️ Keybindings

Keybindings are managed in `~/.config/hypr/modules/keybindings.conf`. Here are some of the defaults:

| Key Combination           | Action                                      |
| ------------------------- | ------------------------------------------- |
| `Super + Return`          | Open Alacritty (Terminal)                   |
| `Super + F`               | Open Thunar (File Manager)                  |
| `Super + D`               | Open Rofi (Application Launcher)            |
| `Super + B`               | Open Firefox (Browser)                      |
| `Super + Shift + Q`       | Close active window                         |
| `Super + Shift + E`       | Exit Hyprland session                       |
| `Super + Shift + Space`   | Toggle floating window                      |
| `Super + Shift + R`       | Reload Hyprland and Waybar                  |
| `Super + Shift + F`       | Toggle fullscreen                           |
| `Super + Shift + Return`  | Toggle Waybar                               |
| `Alt + Print`             | Screenshot active display                   |
| `Super + Print`           | Screenshot active window                    |
| `Super + Shift + Print`   | Screenshot a region                         |
| `Super + [h/j/k/l]`       | Move focus (Vim motions)                    |
| `Super + Shift + [h/j/k/l]`| Move window (Vim motions)                   |
| `Super + [1-9]`           | Switch to workspace 1-9                     |
| `Super + Shift + [1-9]`   | Move active window to workspace 1-9         |
| `Super + S`               | Toggle special workspace (scratchpad)       |
| `Super + Shift + S`       | Move active window to special workspace     |
| `Super + Mouse Wheel`     | Scroll through workspaces                   |

---

## 📂 Configuration Structure

All configurations are located in the `.config` directory, organized by application:

-   **`hypr/`**: Contains the main `hyprland.conf` and modular configuration files for keybindings, window rules, autostart, and more.
-   **`waybar/`**: Holds the `config.jsonc` and `style.css` for the status bar.
-   **`rofi/`**: Includes the `config.rasi` and the Tokyo Night theme.
-   **`alacritty/`**: Manages the `alacritty.toml` terminal configuration with Tokyo Night theme.
-   **`mako/`**: Configuration for the notification daemon.
-   **`nwg-look/`**: GTK theme and appearance settings.
-   **`fastfetch/`**: System information tool configuration.

### Customization Tips

- **Hyprland**: Edit `~/.config/hypr/modules/keybindings.conf` for custom keybindings
- **Waybar**: Modify `~/.config/waybar/config.jsonc` to add/remove modules
- **Theme**: Use `nwg-look` to easily switch GTK themes and icons
- **Terminal**: Customize `~/.config/alacritty/alacritty.toml` for terminal appearance

Feel free to explore and modify these files to further personalize your setup.

---

## 🗂️ Project Structure

```
hyprdwn/
├── .config/                 # All configuration files
│   ├── hypr/                # Hyprland configurations
│   ├── waybar/              # Status bar config
│   ├── rofi/                # Application launcher theme
│   ├── alacritty/           # Terminal configuration
│   └── ...                  # Other app configurations
├── setup.sh                 # Main setup script
├── install_packages.sh       # Package installation script
├── .bashrc                  # Bash configuration
├── .profile                 # Shell profile
├── sddm.conf                # SDDM display manager config
├── metadata.desktop         # SDDM theme metadata
└── README.md                # This file
```

---

## 🤝 Contributing

Contributions are welcome! Feel free to submit issues and enhancement requests.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
