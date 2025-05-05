```bash <(curl -fsSL https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/install-ytd.sh)```
# Advanced YouTube Downloader

A simple and powerful Bash script to download YouTube videos and audio in various formats using `yt-dlp` on **Termux** (Android). This script provides a user-friendly menu to select formats like MP3 audio or videos in resolutions from 360p to 4K.

Inspired by [barcodeTm](https://github.com/barcodeTm) and [Khansaad1275](https://github.com/Khansaad1275).

## Features
- Download YouTube videos in **360p, 480p, 720p, 1080p, or 4K**.
- Extract audio as **MP3** with high quality.
- User-friendly menu interface for format selection.
- Saves files to `/storage/emulated/0/Pictures/YouTubeVideos/` (accessible in your gallery).
- Handles errors with detailed logging (`ytdlp_errors.log`).
- Works without authentication for most videos (no cookies required).
- Optimized for **Termux** on Android.

## Prerequisites
- **Termux**: Install from [F-Droid](https://f-droid.org/en/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app).
- **Storage Access**: Grant Termux storage permission during setup.
- **Internet Connection**: Required for downloading videos.

## Installation
Follow these steps to set up the script on Termux:

1. **Update Termux and Install Prerequisites**:
   ```bash
   pkg update -y && pkg upgrade -y
   pkg install python -y
   python -m pip install yt-dlp --user
