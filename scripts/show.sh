#!/bin/bash

base_dir="/mnt/hdd/shows"

# Pick the show (clean name in fzf)
mapfile -t shows < <(find "$base_dir" -mindepth 1 -maxdepth 1 -type d | sort)
show_name=$(printf "%s\n" "${shows[@]##*/}" | \
    fzf --layout=reverse --prompt "Select show: " --exact) || exit 1
show=$(printf "%s\n" "${shows[@]}" | grep -F "/$show_name" | head -n 1)

# Find seasons
mapfile -t seasons < <(find "$show" -mindepth 1 -maxdepth 1 -type d | sort)

if [ ${#seasons[@]} -eq 0 ]; then
    mpv "$show"
elif [ ${#seasons[@]} -eq 1 ]; then
    mpv "${seasons[0]}"
else
    season_name=$(printf "%s\n" "${seasons[@]##*/}" | \
        fzf --layout=reverse --prompt "Select season: " --exact) || exit 1
    season=$(printf "%s\n" "${seasons[@]}" | grep -F "/$season_name" | head -n 1)
    mpv "$season"
fi
