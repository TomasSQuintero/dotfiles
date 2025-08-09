#!/bin/bash

# Wallpaper directory
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Check if wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory $WALLPAPER_DIR does not exist"
    exit 1
fi

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Config file $CONFIG_FILE does not exist"
    exit 1
fi

# Use fzf to select a wallpaper file
# This will show image files with common extensions
selected_wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.bmp" -o -iname "*.gif" -o -iname "*.webp" \) | fzf --preview 'kitten icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {} 2>/dev/null || echo "Preview not available for {}"' --height 90% --border --prompt "Select wallpaper: ")

# Check if user selected a file (didn't cancel)
if [ -z "$selected_wallpaper" ]; then
    kitten icat --clear
    echo "No wallpaper selected. Exiting."
    exit 0
fi

# Create backup of original config
cp "$CONFIG_FILE" "$CONFIG_FILE.bak"

# Create temporary file for new config
temp_file=$(mktemp)

# Write the new $wallpth line first
echo "\$wallpath = $selected_wallpaper" > "$temp_file"

# Skip the first line of original config and append the rest
tail -n +2 "$CONFIG_FILE" >> "$temp_file"

# Replace the original config with the new one
mv "$temp_file" "$CONFIG_FILE"

kitten icat --clear 

echo "Wallpaper updated successfully!"
#echo "New wallpaper path: $selected_wallpaper"
#echo "Config backup saved as: $CONFIG_FILE.bak"

# Optional: Reload hyprpaper if it's running
if pgrep -x "hyprpaper" > /dev/null; then
    echo "Restarting hyprpaper..."
    killall hyprpaper
    nohup hyprpaper > /dev/null 2>&1 &
fi
