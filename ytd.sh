#!/data/data/com.termux/files/usr/bin/bash

# YouTube Downloader Script
# Author: Argh94
# GitHub: https://GitHub.com/Argh94
# Date: May 4, 2025
# Description: Downloads YouTube videos/audio with format selection menu

kill_color=$'\e[0m'

# Ensure PATH includes yt-dlp
export PATH=$PATH:/data/data/com.termux/files/home/.local/bin

# Log file for errors
LOG_FILE="/data/data/com.termux/files/home/ytdlp_errors.log"

# Function to install prerequisites
install_prerequisites() {
    echo -e "\e[035mUpdating packages...\n$kill_color"
    pkg update -y && pkg upgrade -y

    echo -e "\e[032mRequesting storage access...\n$kill_color"
    echo -e "\e[032mPlease grant storage permission and type 'y' when prompted!\n$kill_color"
    sleep 3
    termux-setup-storage
    sleep 5

    echo -e "\e[033mInstalling Python...\n$kill_color"
    pkg install python -y

    echo -e "\e[034mInstalling and updating yt-dlp...\n$kill_color"
    python -m pip install yt-dlp --user >/dev/null
    python -m pip install yt-dlp --user --upgrade >/dev/null

    echo -e "\e[032mCreating YouTubeVideos folder in gallery...\n$kill_color"
    mkdir -p /storage/emulated/0/Pictures/YouTubeVideos

    echo -e "\e[032mPrerequisites installation completed!\n$kill_color"
}

# Check if yt-dlp is installed
command -v yt-dlp &>/dev/null || {
    echo -e "\e[031myt-dlp not found. Starting prerequisites installation...\n$kill_color"
    install_prerequisites
}

# Check storage access
if [[ ! -w "/storage/emulated/0/Pictures/YouTubeVideos" ]]; then
    echo -e "\e[031mCannot write to YouTubeVideos folder! Check storage permissions.\n$kill_color"
    mkdir -p /storage/emulated/0/Pictures/YouTubeVideos
    [[ ! -w "/storage/emulated/0/Pictures/YouTubeVideos" ]] && {
        echo -e "\e[031mFailed to create or access YouTubeVideos folder!\n$kill_color"
        exit 1
    }
fi

# Check if YouTube link is provided
if [[ -z "$1" ]]; then
    echo -e "\e[031mPlease provide a YouTube link! Example:\n$kill_color"
    echo "~/bin/termux-url-opener \"https://www.youtube.com/watch?v=VIDEO_ID\""
    exit 1
fi

# Validate YouTube link
if [[ ! "$1" =~ ^https?://(www\.)?(youtube\.com|youtu\.be)/ ]]; then
    echo -e "\e[031mInvalid YouTube URL! Please provide a valid YouTube link.\n$kill_color"
    exit 1
fi

# Check available storage space (at least 50MB)
required_space=50  # in MB
available_space=$(df /storage/emulated/0 | tail -1 | awk '{print $4}' | numfmt --from=iec --to-unit=1M 2>/dev/null)
if [[ -z "$available_space" || $available_space -lt $required_space ]]; then
    echo -e "\e[031mInsufficient storage space! Need at least $required_space MB, but only ${available_space:-0} MB available.\n$kill_color"
    exit 1
fi

# Display logo and format selection menu
echo -e "\e[032m" "          ▄▀▄     ▄▀▄"
echo -e "\e[032m" "         ▄█░░▀▀▀▀▀░░█▄"
echo -e "\e[032m" "     ▄▄  █░░░░░░░░░░░█  ▄▄"
echo -e "\e[032m" "    █▄▄█ █░░█░░┬░░█░░█ █▄▄█"
echo -e "\e[036m" "╔════════════════════════════════════╗"
echo -e "\e[032m" "║ ♚ Project: Advanced YouTube Downloader ║"
echo -e "\e[032m" "║ ♚ Author: Argh94                     ║"
echo -e "\e[032m" "║ ♚ GitHub: https://GitHub.com/Argh94  ║"
echo -e "\e[036m" "╚════════════════════════════════════╝"
echo -e "\e[036m" "╠═▶ [Select Format]  ➳"
echo -e "\e[032m" "╠═▶ 1. Audio MP3 ♫"
echo -e "\e[032m" "╠═▶ 2. Video 360p"
echo -e "\e[032m" "╠═▶ 3. Video 480p"
echo -e "\e[032m" "╠═▶ 4. Video 720p"
echo -e "\e[032m" "╠═▶ 5. Video 1080p"
echo -e "\e[032m" "╠═▶ 6. Video 4K (2160p)"
echo -e "\e[032m" "╠═▶ 7. Exit"
echo -e "\e[032m" "╚═:➤  $kill_color"
read -p "Enter option (1-7): " option

# Base download command with extended retry delay and retries
command='--no-mtime -o /storage/emulated/0/Pictures/YouTubeVideos/%(title)s.%(ext)s --restrict-filenames --retry-sleep 15 --retries 5 --force-ipv4'

# Handle format selection
case $option in
    1)
        echo -e "\e[032mDownloading MP3 audio...\n$kill_color"
        yt-dlp -x --audio-format mp3 --audio.quality 0 $command "$1" 2>>"$LOG_FILE"
        ;;
    2)
        echo -e "\e[032mDownloading 360p video...\n$kill_color"
        yt-dlp -f "bestvideo[height<=360]+bestaudio/best[height<=360]" $command "$1" 2>>"$LOG_FILE"
        ;;
    3)
        echo -e "\e[032mDownloading 480p video...\n$kill_color"
        yt-dlp -f "bestvideo[height<=480]+bestaudio/best[height<=480]" $command "$1" 2>>"$LOG_FILE"
        ;;
    4)
        echo -e "\e[032mDownloading 720p video...\n$kill_color"
        yt-dlp -f "bestvideo[height<=720]+bestaudio/best[height<=720]" $command "$1" 2>>"$LOG_FILE"
        ;;
    5)
        echo -e "\e[032mDownloading 1080p video...\n$kill_color"
        yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" $command "$1" 2>>"$LOG_FILE"
        ;;
    6)
        echo -e "\e[032mDownloading 4K video...\n$kill_color"
        yt-dlp -f "bestvideo[height<=2160]+bestaudio/best[height<=2160]" $command "$1" 2>>"$LOG_FILE"
        ;;
    7)
        echo -e "\e[032mExiting script. Bye!\n$kill_color"
        exit 0
        ;;
    *)
        echo -e "\e[031mInvalid option! Please select 1 to 7.\n$kill_color"
        exit 1
        ;;
esac

# Success or error message
if [[ $? -eq 0 ]]; then
    echo -e "\e[032mDownload completed! File saved in /storage/emulated/0/Pictures/YouTubeVideos\n$kill_color"
else
    echo -e "\e[031mDownload failed. Possible reasons:\n$kill_color"
    echo -e "\e[031m- Too many requests (HTTP 429): Wait 15-20 minutes and try again, or switch network (e.g., from Wi-Fi to mobile data).\n$kill_color"
    echo -e "\e[031m- Authentication required: YouTube Shorts or restricted videos may need authentication. Try a different video or check yt-dlp documentation for cookie setup.\n$kill_color"
    echo -e "\e[031m- Invalid link or internet issue: Check the link and your connection.\n$kill_color"
    echo -e "\e[031mDetailed errors logged to: $LOG_FILE\n$kill_color"
    echo -e "\e[031mTo update yt-dlp, run: python -m pip install yt-dlp --user --upgrade\n$kill_color"
    sleep 5  # Delay to ensure error message is readable
    exit 1
fi
