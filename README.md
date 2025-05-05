```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/install-ytd.sh)

# Advanced YouTube Downloader

![GitHub](https://img.shields.io/github/license/Argh94/YouTube-Downloader)
![GitHub last commit](https://img.shields.io/github/last-commit/Argh94/YouTube-Downloader)
![GitHub issues](https://img.shields.io/github/issues/Argh94/YouTube-Downloader)

**Advanced YouTube Downloader** is a powerful and user-friendly script designed for downloading YouTube videos and audio directly on your Android device using **Termux**. Whether you want to save YouTube Shorts, full-length videos, or extract high-quality audio, this script offers a seamless experience with multiple format and resolution options.

Developed by **[Argh94](https://github.com/Argh94)**, this project is perfect for anyone looking to download YouTube content effortlessly with a customizable and robust tool.

## Features

- **Multiple Format Options**: Download videos in resolutions from 360p to 4K (2160p) or extract audio as MP3.
- **YouTube Shorts Support**: Seamlessly download YouTube Shorts and regular videos.
- **Automatic Video and Audio Merging**: Combines video and audio streams into a single `.mp4` file using `ffmpeg`.
- **Customizable File Naming**: Saves files with meaningful names (title + video ID) to avoid naming issues.
- **Robust Error Handling**: Handles common issues like network errors, authentication requirements, and insufficient storage.
- **Cookie Support**: Optional authentication for downloading restricted videos (e.g., age-restricted Shorts).
- **Notification Support**: Displays download completion notifications via Termux (requires `termux-api`).
- **Lightweight and Fast**: Optimized for Termux on Android with minimal dependencies.
- **Open Source**: Fully customizable and maintained under the [MIT License](#license).

## Prerequisites

Before using the script, ensure you have the following:

- **Android Device**: Running Android 7.0 or higher.
- **Termux**: Install the Termux app from [F-Droid](https://f-droid.org/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app/releases). (Note: Google Play version is outdated and not recommended.)
- **Termux:API (Optional)**: For download completion notifications, install the [Termux:API app](https://f-droid.org/packages/com.termux.api/) from F-Droid or Google Play.
- **Storage Access**: Grant Termux storage permission to save files in `/storage/emulated/0/Pictures/YouTubeVideos`.
- **Internet Connection**: Stable Wi-Fi or mobile data for downloading videos.

## Installation

Follow these steps to set up the Advanced YouTube Downloader on your device:

### Step 1: Install Termux
1. Download and install **Termux** from [F-Droid](https://f-droid.org/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app/releases).
2. Open Termux and update the package list:
   ```bash
   pkg update && pkg upgrade -y
