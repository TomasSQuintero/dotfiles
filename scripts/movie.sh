#!/bin/bash

#movie=$(find "/mnt/hdd/films" -type f \( -iname "*.mp4" -o -iname "*.mkv" \) | fzf --layout reverse --prompt "Select movie: " --with-nth=-1 --delimiter='/')
#mpv "$movie"

movie=$(find "/mnt/hdd/films" "/mnt/hdd/00-personal-library/films" -type f \( -iname "*.mp4" -o -iname "*.mkv" \) | \
    sed -e "s|^/mnt/hdd/films/|P/|" \
        -e "s|^/mnt/hdd/00-personal-library/films/|L/|" | \
    fzf --layout=reverse --prompt "Select film: " --exact)

if [ -n "$movie" ]; then
    if [[ "$movie" == P/* ]]; then
        # Remove 'P/' prefix to get relative path inside /mnt/hdd/films/
        rel_path="${movie#P/}"
        mpv "/mnt/hdd/films/$rel_path"
    elif [[ "$movie" == L/* ]]; then
        # Remove 'L/' prefix to get relative path inside /mnt/hdd/00-personal-library/films/
        rel_path="${movie#L/}"
        mpv "/mnt/hdd/00-personal-library/films/$rel_path"
    fi
fi
