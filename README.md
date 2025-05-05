```bash <(curl -fsSL https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/install-ytd.sh)```
# YouTube Downloader Pro

A sleek and powerful Bash script for downloading YouTube videos and audio in multiple formats using `yt-dlp` on **Termux** (Android). With a clean menu-driven interface, you can effortlessly download videos in resolutions from 360p to 4K or extract high-quality MP3 audio.

## ✨ Features
- Download videos in **360p, 480p, 720p, 1080p, or 4K**.
- Extract **MP3 audio** with top-tier quality.
- Intuitive menu to pick your preferred format.
- Saves files to `/storage/emulated/0/Pictures/YouTubeVideos/` (easily accessible in your gallery).
- Smart error handling with logs saved to `~/ytdlp_errors.log`.
- No authentication required for most videos.
- Optimized for **Termux** on Android with minimal setup.

## 🚀 Quick Start

### Prerequisites
- **Termux**: Download from [F-Droid](https://f-droid.org/en/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app).
- **Internet Connection**: Needed for downloading videos.
- **Storage Access**: Grant Termux permission to save files.

### Installation
1. **Set Up Termux**:
   Open Termux and run these commands to install dependencies (you only need to do this once):
   ```bash
   pkg update -y && pkg upgrade -y
   pkg install python -y
   python -m pip install yt-dlp --user
