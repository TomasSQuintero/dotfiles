#!/bin/bash

base_dir="/mnt/hdd/shows"

# Pick the show (show only names in fzf, keep full path)
mapfile -t shows < <(find "$base_dir" -mindepth 1 -maxdepth 1 -type d | sort)
show_name=$(printf "%s\n" "${shows[@]##*/}" | \
    fzf --layout=reverse --prompt "Select show: " --exact) || exit 1
show=$(printf "%s\n" "${shows[@]}" | grep -F "/$show_name" | head -n 1)

# Find seasons
mapfile -t seasons < <(find "$show" -mindepth 1 -maxdepth 1 -type d | sort)

if [ ${#seasons[@]} -eq 0 ]; then
    season="$show"
elif [ ${#seasons[@]} -eq 1 ]; then
    season="${seasons[0]}"
else
    season_name=$(printf "%s\n" "${seasons[@]##*/}" | \
        fzf --layout=reverse --prompt "Select season: " --exact) || exit 1
    season=$(printf "%s\n" "${seasons[@]}" | grep -F "/$season_name" | head -n 1)
fi

# Find episodes
mapfile -t episodes < <(find "$season" -maxdepth 1 -type f \
    \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" \) | sort)

if [ ${#episodes[@]} -eq 0 ]; then
    echo "No video files found in $season"
    exit 1
elif [ ${#episodes[@]} -eq 1 ]; then
    mpv "${episodes[0]}"
else
    episode_name=$(printf "%s\n" "${episodes[@]##*/}" | \
        fzf --layout=reverse --prompt "Select episode: " --exact) || exit 1
    episode=$(printf "%s\n" "${episodes[@]}" | grep -F "/$episode_name" | head -n 1)
    mpv "$episode"
fi
