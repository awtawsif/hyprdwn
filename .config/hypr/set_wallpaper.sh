#!/bin/bash

# Lock file to ensure only one instance runs at a time
LOCKFILE="/tmp/set_wallpaper.lock"

# Create a lock file to prevent multiple instances
exec 9>"$LOCKFILE"
if ! flock -n 9; then
    echo "Another instance of the script is already running."
    exit 1
fi

# Define paths for current, temporary, and preloaded wallpapers
CURRENT_WALLPAPER="$HOME/.cache/hypr_wallpaper.jpg"
CURRENT_WALLPAPER_PNG="${CURRENT_WALLPAPER%.jpg}.png"
TMP_WALLPAPER="$HOME/.cache/tmp_wallpaper.jpg"
PRELOAD_WALLPAPER="$HOME/.cache/hypr_wallpaper_preload.jpg"
DEFAULT_WALLPAPER="$HOME/.config/hypr/default_wallpaper.png"

# URL for fetching random wallpapers
WALLPAPER_URL="https://minimalistic-wallpaper.demolab.com/?random"

# Function to download a wallpaper and save it to a specific file
download_wallpaper() {
    if ! curl -s -L -o "$1" "$WALLPAPER_URL"; then
        return 1
    fi
    return 0
}

# Ensure swww daemon is running
if ! pgrep -x "swww-daemon" >/dev/null; then
    swww-daemon &
    sleep 0.5
fi

# Step 1: Use preloaded wallpaper if available
if [ -f "$PRELOAD_WALLPAPER" ]; then
    mv "$PRELOAD_WALLPAPER" "$CURRENT_WALLPAPER"
else
    # Step 2: Download a new wallpaper to the temporary file
    if ! download_wallpaper "$TMP_WALLPAPER"; then
        notify-send "Wallpaper Update Failed" "No internet connection detected. Using default wallpaper." --icon=dialog-error
        # Use a fallback local wallpaper if available
        if [ -f "$DEFAULT_WALLPAPER" ]; then
            cp "$DEFAULT_WALLPAPER" "$CURRENT_WALLPAPER"
        else
            notify-send "Wallpaper Update Failed" "No default wallpaper found." --icon=dialog-error
            exit 1
        fi
    else
        # Step 3: Move the temporary wallpaper to the current wallpaper path
        mv "$TMP_WALLPAPER" "$CURRENT_WALLPAPER"
    fi
fi

# Step 4: Set the wallpaper using swww
swww img "$CURRENT_WALLPAPER" --transition-type any --transition-fps 60 --transition-duration 1

# Step 5: Convert the current wallpaper to PNG for hyprlock
ffmpeg -y -loglevel error -i "$CURRENT_WALLPAPER" "$CURRENT_WALLPAPER_PNG"

# Step 6: Preload the next wallpaper in the background
download_wallpaper "$PRELOAD_WALLPAPER" &

# Release the lock
flock -u 9
