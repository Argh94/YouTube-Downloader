#!/data/data/com.termux/files/usr/bin/bash

# YouTube Downloader Installer Script
# Author: Argh94
# GitHub: https://GitHub.com/Argh94
# Date: May 4, 2025
# Description: Installs dependencies, downloads YouTube downloader script from GitHub, and sets up for Termux

set -e  # Stop script on any error

kill_color=$'\e[0m'

# Display start message
echo -e "\e[032mStarting YouTube downloader installation...\n$kill_color"

# Set a default mirror if none is selected
echo -e "\e[035mChecking mirror configuration...\n$kill_color"
if ! grep -q "mirror" /data/data/com.termux/files/usr/etc/apt/sources.list; then
    echo "deb https://packages-cf.termux.dev/apt/termux-main stable main" > /data/data/com.termux/files/usr/etc/apt/sources.list
fi

# Update packages
echo -e "\e[035mUpdating packages...\n$kill_color"
pkg update -y && pkg upgrade -y

# Request storage access
echo -e "\e[032mRequesting storage access...\n$kill_color"
echo -e "\e[032mPlease grant storage permission and type 'y' when prompted!\n$kill_color"
sleep 3
termux-setup-storage
sleep 5

# Check storage access
echo -e "\e[032mChecking storage access...\n$kill_color"
mkdir -p /storage/emulated/0/Pictures/YouTubeVideos
if [[ ! -w "/storage/emulated/0/Pictures/YouTubeVideos" ]]; then
    echo -e "\e[031mCannot write to YouTubeVideos folder! Check storage permissions.\n$kill_color"
    exit 1
fi

# Add yt-dlp path to PATH before installation
echo -e "\e[032mSetting PATH for yt-dlp...\n$kill_color"
export PATH=$PATH:/data/data/com.termux/files/home/.local/bin
echo "export PATH=\$PATH:/data/data/com.termux/files/home/.local/bin" >> ~/.bashrc
source ~/.bashrc

# Install Python, wget, and coreutils (for numfmt)
echo -e "\e[033mInstalling Python, wget, and coreutils...\n$kill_color"
pkg install python wget coreutils -y

# Install and update yt-dlp
echo -e "\e[034mInstalling and updating yt-dlp...\n$kill_color"
python -m pip install yt-dlp --user >/dev/null
python -m pip install yt-dlp --user --upgrade >/dev/null

# Verify yt-dlp installation
if ! command -v yt-dlp &>/dev/null; then
    echo -e "\e[031mError: yt-dlp installation failed. Please check pip or internet connection.\n$kill_color"
    exit 1
fi

# Create YouTubeVideos folder (already created in storage check)
echo -e "\e[032mYouTubeVideos folder ready in gallery...\n$kill_color"

# Download main downloader script from GitHub
echo -e "\e[032mDownloading downloader script from GitHub...\n$kill_color"
YTD_URL="https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/ytd.sh"
mkdir -p ~/bin
wget -O ~/bin/termux-url-opener "$YTD_URL" || {
    echo -e "\e[031mError: Failed to download main script. Please ensure ytd.sh is uploaded to GitHub.\n$kill_color"
    echo -e "\e[031mLink: $YTD_URL\n$kill_color"
    echo -e "\e[031mCheck if the file exists in the repository or update the YTD_URL variable.\n$kill_color"
    exit 1
}

# Set executable permissions
echo -e "\e[032mSetting executable permissions...\n$kill_color"
chmod +x ~/bin/termux-url-opener

# Check if file exists
if [[ ! -f ~/bin/termux-url-opener ]]; then
    echo -e "\e[031mError: termux-url-opener file not created. Please check GitHub link or internet connection.\n$kill_color"
    exit 1
fi

# Success message
echo -e "\e[032mInstallation completed!\n$kill_color"
echo -e "\e[032mNow you can share YouTube links with Termux from the YouTube app.\n$kill_color"
echo -e "\e[032mOr run the script manually:\n$kill_color"
echo "  ~/bin/termux-url-opener \"https://www.youtube.com/watch?v=VIDEO_ID\""
