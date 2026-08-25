<div align="center">

#  HyprDwn  

**A sleek, modern, and personalized Hyprland environment with a stunning Tokyo Night theme.**

</div>

**HyprDwn** provides a complete, ready-to-use configuration for a beautiful and functional Arch Linux desktop using the Hyprland compositor. It automates the setup process, from installing packages to copying configuration files, allowing you to get up and running with a consistent and visually appealing workflow in minutes.

---

## ✨ Features

-   **Window Manager**: [Hyprland](https://hyprland.org/) - A dynamic tiling Wayland compositor with smooth animations, configured entirely in **Lua** (`hyprland.lua` + modular `modules/*.lua` files).
-   **Status Bar**: [Wayle](https://github.com/wayle-rs/wayle) - A modern, configurable desktop shell for Wayland compositors.
-   **Display Manager**: [SDDM](https://github.com/sddm/sddm) with the [Silent](https://github.com/uiriansan/SilentSDDM) theme - A modern display manager.
-   **Package Management**: [Chaotic-AUR](https://aur.chaotic.cx/) - Pre-compiled AUR packages for faster installation.
-   **Application Launcher**: [Rofi](https://github.com/davatorium/rofi) - A versatile and themeable application launcher, including an emoji picker (`rofi-emoji`) and a clipboard history helper.
-   **Terminal**: [Alacritty](https://alacritty.org/) - A fast, GPU-accelerated terminal emulator.
-   **File Manager**: [Thunar](https://docs.xfce.org/xfce/thunar/start) - A lightweight file manager with volume management and archive plugin support.
-   **Wallpapers**: [boorupaper](https://github.com/awtawsif/boorupaper) - Anime wallpaper manager that fetches from booru-style image boards and Wallhaven, applied via the `awww` wallpaper daemon.
-   **Screen Lock & Idle**: `hyprlock` and `hypridle` for locking and power management.
-   **Theme**: [Tokyo Night](https://github.com/Fausto-Korps/Tokyo-Night-GTK-Theme) - A clean, dark theme for GTK applications.
-   **Icons & Cursors**: Font Awesome, Bibata cursor theme, and Noto Emoji for a consistent look.
-   **Fonts**: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/) for excellent readability and glyph support.
-   **Shell Enhancements**: `exa` for modern directory listings, `bat` for syntax-highlighted file previews, and `zoxide` for smart directory navigation — all wired up in a customized `.bashrc`.
-   **And much more**: Includes essential utilities for notifications (`mako`), clipboard management (`cliphist`), screen capture (`hyprshot`, `grim`, `slurp`), system monitoring (`htop`, `fastfetch`), brightness control (`brightnessctl`), Bluetooth (`blueman`), multimedia (`mpv`, `ffmpeg`), and session management (`uwsm`).

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
-   Install all necessary packages using `pacman` and `yay`.
-   Back up your existing `.config` directory to `~/.config.bak.<timestamp>`.
-   Copy all the configuration files to your `~/.config` directory, along with `.bashrc` and `.profile`.
-   Copy `sddm.conf` to `/etc/` and the Silent theme metadata to `/usr/share/sddm/themes/silent/`.
-   Set up your home directory with standard user folders (Documents, Downloads, Pictures, Projects, Videos).
-   Optionally configure Git user settings.
-   Enable the **SDDM** display manager.

After the script finishes, reboot your system, and you should be greeted by the SDDM login screen with the Silent theme.

---

## 📦 Package Sources

This setup uses multiple package sources to provide a complete desktop experience:

- **Official Repositories**: Core system packages and most applications via `pacman`
- **Chaotic-AUR**: Pre-compiled AUR packages for faster installation, including:
  - `tokyonight-gtk-theme-git` - Tokyo Night GTK theme
  - `yay` - AUR helper
- **AUR via yay**: Additional packages available in the AUR:
  - `wayle-bin` - Status bar
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

3. **Status Bar Not Appearing**: Check if Hyprland is running properly and restart Wayle:
   ```bash
   wayle panel restart
   ```

4. **Script Permission Issues**: Make sure scripts are executable:
   ```bash
   chmod +x setup.sh install_packages.sh
   ```

---

## ⌨️ Keybindings

Keybindings are managed in `~/.config/hypr/modules/keybindings.lua`. Here are some of the defaults:

| Key Combination             | Action                                      |
| --------------------------- | ------------------------------------------- |
| `Super + Return`            | Open Alacritty (Terminal)                   |
| `Super + F`                 | Open Thunar (File Manager)                  |
| `Super + D`                 | Open Rofi (Application Launcher)            |
| `Super + B`                 | Open Zen Browser                            |
| `Super + Shift + Q`         | Close active window                         |
| `Super + Shift + E`         | Exit Hyprland session                       |
| `Super + Space`             | Toggle floating window                      |
| `Super + Shift + R`         | Restart Wayle panel and reload Hyprland     |
| `Super + Shift + F`         | Toggle fullscreen                           |
| `Super + Shift + Return`    | Toggle status bar                           |
| `Super + Ctrl + S`          | Rotate screen 180°                          |
| `Super + R`                 | Random safe-for-work wallpaper              |
| `Alt + R`                   | Random questionable wallpaper               |
| `Alt + Shift + R`           | Random explicit wallpaper                   |
| `Super + Shift + Backspace` | Toggle keybind passthrough (disable binds)  |
| `Alt + Print`               | Screenshot active display                   |
| `Super + Print`             | Screenshot active window                    |
| `Super + Shift + Print`     | Screenshot a region                         |
| `Super + [h/j/k/l]`         | Move focus between windows                  |
| `Super + Shift + [h/j/k/l]` | Move window                                 |
| `Super + [1-9]`             | Switch to workspace 1-9                     |
| `Super + Shift + [1-9]`     | Move active window to workspace 1-9         |
| `Super + Shift + 0`         | Move active window to workspace 10          |
| `Super + S`                 | Toggle special workspace (scratchpad)       |
| `Super + Shift + S`         | Move active window to special workspace     |
| `Super + Mouse Wheel`       | Scroll through workspaces                   |
| `Super + LMB / RMB drag`    | Move / resize windows                       |
| `XF86 Audio Keys`           | Volume control, mute, and media playback    |
| `XF86 Brightness Keys`      | Screen brightness up/down                   |

Screenshots are saved to `~/Pictures/Screenshots`.

---

## 📂 Configuration Structure

All configurations are located in the `.config` directory, organized by application:

-   **`hypr/`**: Contains the main `hyprland.lua` entry point and modular Lua configurations (`modules/`) for monitors, autostart, environment variables, look and feel, gestures, input, keybindings, window rules, tabbed windows, and cursor settings. Also includes `hypridle.conf` and `hyprlock.conf`, plus the default wallpaper.
-   **`wayle/`**: Status bar configuration (`config.toml`, `runtime.toml`), styles, and themes.
-   **`rofi/`**: Includes the `config.rasi`, the Tokyo Night theme, and a `clipboard.sh` helper for `cliphist`.
-   **`alacritty/`**: Manages the `alacritty.toml` terminal configuration with a separate Tokyo Night color scheme file.
-   **`boorupaper/`**: Wallpaper manager configuration (server selection, ratings, discovered tags).
-   **`mako/`**: Configuration for the notification daemon.
-   **`nwg-look/`**: GTK theme and appearance settings.
-   **`fastfetch/`**: System information tool configuration.
-   **`nano/`**: Nano editor configuration with syntax highlighting.
-   **`Thunar/`**: File manager configuration.

### Customization Tips

- **Hyprland**: Edit `~/.config/hypr/modules/keybindings.lua` for custom keybindings
- **Status Bar**: Modify `~/.config/wayle/config.toml` to customize modules and actions
- **Theme**: Use `nwg-look` to easily switch GTK themes and icons
- **Terminal**: Customize `~/.config/alacritty/alacritty.toml` for terminal appearance
- **Wallpapers**: Edit `~/.config/boorupaper/boorupaper.conf` to change image sources

Feel free to explore and modify these files to further personalize your setup.

---

## 🗂️ Project Structure

```
hyprdwn/
├── .config/                 # All configuration files
│   ├── alacritty/           # Terminal configuration + Tokyo Night theme
│   ├── boorupaper/          # Wallpaper manager configuration
│   ├── fastfetch/           # System info tool config
│   ├── hypr/                # Hyprland (Lua) config, idle/lock, and modules/
│   ├── mako/                # Notification daemon config
│   ├── nano/                # Nano editor config
│   ├── nwg-look/            # GTK appearance settings
│   ├── rofi/                # Launcher config, themes, clipboard helper
│   ├── Thunar/              # File manager config
│   └── wayle/               # Status bar config, styles, themes
├── setup.sh                 # Main setup script
├── install_packages.sh      # Package installation script
├── .bashrc                  # Bash configuration
├── .profile                 # Shell profile
├── sddm.conf                # SDDM display manager config
├── metadata.desktop         # SDDM Silent theme metadata
└── README.md                # This file
```

---

## 🤝 Contributing

Contributions are welcome! Feel free to submit issues and enhancement requests.
