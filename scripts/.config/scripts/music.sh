#!/bin/bash

#la idea de este script es listar todas las posibles artist/album dentro del music_dir
music_dir="/mnt/hdd/music"
#music_dir="/home/tom/Music"
output_file="albums.txt"

find "$music_dir" -mindepth 2 -maxdepth 2 -type d \
    | sed "s|$music_dir/||" \
    | sort > "$output_file"
