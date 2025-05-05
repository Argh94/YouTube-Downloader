```bash <(curl -fsSL https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/install-ytd.sh)```
# YouTube Downloader Pro

A sleek and powerful Bash script for downloading YouTube videos and audio in multiple formats using `yt-dlp` on **Termux** (Android). With an intuitive menu-driven interface, you can effortlessly download videos in resolutions from 360p to 4K or extract high-quality MP3 audio.

## ✨ Features
- Download videos in **360p, 480p, 720p, 1080p, or 4K**.
- Extract **MP3 audio** with top-tier quality.
- Clean and user-friendly format selection menu.
- Saves files to `/storage/emulated/0/Pictures/YouTubeVideos/` (accessible in your gallery).
- Smart error handling with logs saved to `~/ytdlp_errors.log`.
- No authentication required for most videos.
- One-command installation for seamless setup.

## 🚀 Quick Start

### Prerequisites
- **Termux**: Download from [F-Droid](https://f-droid.org/en/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app).
- **Internet Connection**: Required for downloading videos and setup.
- **Storage Access**: Termux will request permission during installation.

### Installation
Install everything with a single command (you only need to run this once):
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/install-ytd.sh)

This command:
- Installs dependencies (`python`, `yt-dlp`).
- Requests storage access (type `y` when prompted).
- Downloads the script to `~/bin/termux-url-opener`.
- Sets up a download folder in `/storage/emulated/0/Pictures/YouTubeVideos/`.

After installation, the script is ready to use—no need to reinstall!

### Verify Setup
Check if `yt-dlp` is installed:
```bash
yt-dlp --version
