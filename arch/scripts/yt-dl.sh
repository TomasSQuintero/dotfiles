#!/bin/bash

# yt-dlp download script with quality options

# Set download directory
DOWNLOAD_DIR="$HOME/Downloads"

echo "================================"
echo "      yt-dlp Download Menu"     
echo "================================"
echo "1. Best audio + best video"
echo "2. 1080p audio+video"
echo "3. 720p audio+video"
echo "4. Audio-only (mp3)"
echo "5. Playlist (best quality)"
echo "================================"
echo -n "Choose an option (1-5): "
read choice

echo -n "Enter URL: "
read url

case $choice in
    1)
        echo "Downloading best quality to $DOWNLOAD_DIR..."
        yt-dlp -f "bv*+ba/b" --no-warnings --merge-output-format mkv -o "$DOWNLOAD_DIR/%(title)s.%(ext)s" "$url"
        ;;
    2)
        echo "Downloading 1080p to $DOWNLOAD_DIR..."
        yt-dlp -f "bv*[height<=1080]+ba/b[height<=1080]" --no-warnings --merge-output-format mkv -o "$DOWNLOAD_DIR/%(title)s.%(ext)s" "$url"
        ;;
    3)
        echo "Downloading 720p to $DOWNLOAD_DIR..."
        yt-dlp -f "bv*[height<=720]+ba/b[height<=720]" --no-warnings --merge-output-format mkv -o "$DOWNLOAD_DIR/%(title)s.%(ext)s" "$url"
        ;;
    4)
        echo "Downloading audio only to $DOWNLOAD_DIR..."
        yt-dlp -x --audio-format mp3 --audio-quality 0 --no-warnings -o "$DOWNLOAD_DIR/%(title)s.%(ext)s" "$url"
        ;;
    5)
        echo "Downloading playlist to $DOWNLOAD_DIR..."
        yt-dlp -f "bv*+ba/b" --no-warnings --merge-output-format mkv -o "$DOWNLOAD_DIR/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" "$url"
        ;;
    *)
        echo "Invalid option. Please choose 1-5."
        exit 1
        ;;
esac

echo "Download complete!"
