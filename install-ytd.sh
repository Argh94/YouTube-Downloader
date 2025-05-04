#!/data/data/com.termux/files/usr/bin/bash

# YouTube Downloader Installer Script
# Author: You (inspired by barcodeTm and Khansaad1275)
# Date: May 4, 2025
# Description: Installs dependencies, downloads YouTube downloader script from GitHub, and sets up for Termux

set -e  # Stop script on any error

kill_color=$'\e[0m'

# Display start message
echo -e "\e[032mStarting YouTube downloader installation...\n$kill_color"

# Install dependencies
echo -e "\e[035mUpdating packages...\n$kill_color"
pkg update -y && pkg upgrade -y

echo -e "\e[032mRequesting storage access...\n$kill_color"
echo -e "\e[032mPlease grant storage permission!"
sleep 3
termux-setup-storage
sleep 5

echo -e "\e[033mInstalling Python and wget...\n$kill_color"
pkg install python wget -y

echo -e "\e[034mInstalling yt-dlp...\n$kill_color"
python -m pip install yt-dlp --user >/dev/null

# Add yt-dlp path to PATH
echo -e "\e[032mSetting PATH for yt-dlp...\n$kill_color"
export PATH=$PATH:/data/data/com.termux/files/home/.local/bin
echo "export PATH=\$PATH:/data/data/com.termux/files/home/.local/bin" >> ~/.bashrc
source ~/.bashrc

echo -e "\e[032mCreating YouTubeVideos folder in gallery...\n$kill_color"
mkdir -p /storage/emulated/0/Pictures/YouTubeVideos

# Download main downloader script from GitHub
echo -e "\e[032mDownloading downloader script from GitHub...\n$kill_color"
YTD_URL="https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/ytd.sh"
mkdir -p ~/bin
wget -O ~/bin/termux-url-opener "$YTD_URL" || {
    echo -e "\e[031mError: Failed to download main script. Please ensure ytd.sh is uploaded to GitHub.\n$kill_color"
    echo -e "\e[031mLink: $YTD_URL\n$kill_color"
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
