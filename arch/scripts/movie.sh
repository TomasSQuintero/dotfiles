#!/bin/bash

#movie=$(find "/mnt/hdd/videos/Peliculas" -type f \( -iname "*.mp4" -o -iname "*.mkv" \) | fzf --layout reverse --prompt "Select movie: " --with-nth=-1 --delimiter='/')
#mpv "$movie"

movie=$(find "/mnt/hdd/videos/Peliculas" "/mnt/hdd/00-personal-library/film/movies" -type f \( -iname "*.mp4" -o -iname "*.mkv" \) | \
    sed -e "s|^/mnt/hdd/videos/Peliculas/|P/|" \
        -e "s|^/mnt/hdd/00-personal-library/film/movies/|L/|" | \
    fzf --layout=reverse --prompt "Select movie: " --exact)

if [ -n "$movie" ]; then
    if [[ "$movie" == P/* ]]; then
        # Remove 'P/' prefix to get relative path inside /mnt/hdd/videos/Peliculas/
        rel_path="${movie#P/}"
        mpv "/mnt/hdd/videos/Peliculas/$rel_path"
    elif [[ "$movie" == L/* ]]; then
        # Remove 'L/' prefix to get relative path inside /mnt/hdd/00-personal-library/film/movies/
        rel_path="${movie#L/}"
        mpv "/mnt/hdd/00-personal-library/film/movies/$rel_path"
    fi
fi
