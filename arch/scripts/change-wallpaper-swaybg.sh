#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

wallpaper=$(
  while IFS= read -r -d '' file; do
    printf '%s\t%s\n' "$file" "${file##*/}"
  done < <(find "$WALLPAPER_DIR" -type f \( \
    -iname "*.jpg" -o -iname "*.jpeg" -o \
    -iname "*.png" -o -iname "*.gif" -o \
    -iname "*.webp" \) -print0) \
  | fzf --with-nth=2 --delimiter=$'\t' \
        --preview='kitten icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {1} 2>/dev/null' \
        --height=90% --border --prompt="Wallpaper: " \
  | cut -f1
)

[[ -z "$wallpaper" ]] && { kitten icat --clear; exit 0; }

kitten icat --clear
pkill swaybg 2>/dev/null
swaybg -i "$wallpaper" -m fill &>/dev/null &
disown
