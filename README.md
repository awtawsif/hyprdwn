<div align="center">

#  HyprDwn  

**A sleek, modern, and personalized Hyprland environment with a stunning Tokyo Night theme.**

</div>

**HyprDwn** provides a complete, ready-to-use configuration for a beautiful and functional Arch Linux desktop using the Hyprland compositor. It automates the setup process, from installing packages to copying configuration files, allowing you to get up and running with a consistent and visually appealing workflow in minutes.

---

## ✨ Features

-   **Window Manager**: [Hyprland](https://hyprland.org/) - A dynamic tiling Wayland compositor with smooth animations.
-   **Application Launcher**: [Rofi](https://github.com/davatorium/rofi) - A versatile and themeable application launcher.
-   **Status Bar**: [Waybar](https://github.com/Alexays/Waybar) - A highly customizable Wayland bar for Hyprland.
-   **Terminal**: [Alacritty](https://alacritty.org/) - A fast, GPU-accelerated terminal emulator.
-   **File Manager**: [Thunar](https://docs.xfce.org/xfce/thunar/start) - A modern and lightweight file manager.
-   **Theme**: [Tokyo Night](https://github.com/Fausto-Korps/Tokyo-Night-GTK-Theme) - A clean, dark theme for GTK applications.
-   **Icons & Cursors**: Font Awesome, Capitaine Cursors, and Noto Emoji for a consistent look.
-   **Fonts**: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/) for excellent readability and glyph support.
-   **Shell Enhancements**: `exa` for modern directory listings and `bat` for syntax-highlighted file previews.
-   **And much more**: Includes essential utilities for notifications (`mako`), clipboard management (`cliphist`), screen capture (`hyprshot`), and system monitoring (`btop`).

---

## 🚀 Installation

Setting up your Hyprland environment is simple. The `setup.sh` script handles everything for you.

**Prerequisites:**
*   A fresh Arch Linux installation. This setup is designed for a **clean Arch Linux installation**. For best results, start with a minimal installation that does not include a desktop environment. If you are using the `archinstall` script, select the **'minimal' profile** to ensure there are no conflicting configurations.
*   `git` installed (`sudo pacman -S git`).

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
-   Install `yay` (an AUR helper) if it's not already present.
-   Use `pacman` and `yay` to install all the necessary packages listed in `install_packages.sh`.
-   Back up your existing `.config` directory to `~/.config.bak.<timestamp>`.
-   Copy all the configuration files to your `~/.config` directory.
-   Set up your home directory with standard user folders.
-   Enable the `ly` display manager.

After the script finishes, reboot your system, and you should be greeted by the Ly login screen.

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

-   **`hypr/`**: Contains the main `hyprland.conf` and modular configuration files for keybindings, window rules, and more.
-   **`waybar/`**: Holds the `config.jsonc` and `style.css` for the status bar.
-   **`rofi/`**: Includes the `config.rasi` and the Tokyo Night theme.
-   **`alacritty/`**: Manages the `alacritty.toml` terminal configuration.
-   **`mako/`**: Configuration for the notification daemon.
-   **`nwg-look/`**: GTK theme and appearance settings.

Feel free to explore and modify these files to further personalize your setup.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
