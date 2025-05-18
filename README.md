
# Advanced YouTube Downloader

![GitHub](https://img.shields.io/github/license/Argh94/YouTube-Downloader)
![GitHub last commit](https://img.shields.io/github/last-commit/Argh94/YouTube-Downloader)
![GitHub issues](https://img.shields.io/github/issues/Argh94/YouTube-Downloader)
![Visitor Count](https://komarev.com/ghpvc/?username=Argh94&YouTube-Downloader&label=ProfileViews)

![image](https://github.com/Argh94/YouTube-Downloader/blob/main/IMG_20250518_204014.jpg)

# YouTube Downloader Installer Script

This repository contains an automated script to install the **Advanced YouTube Downloader Script** on Termux. It ensures all dependencies are installed, required permissions are granted, and the downloader script is set up for seamless YouTube video/audio downloading.

## Features

- **Automated Installation**:
  - Installs required dependencies (`yt-dlp`, `ffmpeg`, `python`, and more)
  - Configures Termux for storage access
  - Downloads and sets up the downloader script
- **Ease of Use**:
  - Automatically handles YouTube links shared with Termux
  - Saves downloads directly to your gallery
- **Error Handling**:
  - Provides troubleshooting messages for common issues

## Quick Installation

Run the following command in Termux:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/install-ytd.sh)
```

This command will:
1. Install all required dependencies.
2. Grant necessary storage permissions.
3. Download and set up the **Advanced YouTube Downloader Script**.

## Usage

### Downloading Videos or Audio from YouTube

1. **Share a YouTube Link**:
   - Open the YouTube app.
   - Share any video link to Termux.
   - The script will automatically handle the download.

2. **Manual Execution**:
   Run the script directly with a YouTube URL:
   ```bash
   ~/bin/termux-url-opener "https://www.youtube.com/watch?v=VIDEO_ID"
   ```
   Replace `VIDEO_ID` with the actual YouTube video ID or full URL.

### Output Location

All downloaded files are saved to:
```
/storage/emulated/0/Pictures/YouTubeVideos
```

## Troubleshooting

### Common Errors and Fixes

- **yt-dlp Installation Failed**:
  - Ensure you have an active internet connection.
  - Manually update `yt-dlp`:
    ```bash
    python -m pip install yt-dlp --user --upgrade
    ```

- **Cannot Write to YouTubeVideos Folder**:
  - Grant storage permissions in Termux:
    ```bash
    termux-setup-storage
    ```

- **Main Script Download Failed**:
  - Verify the script URL in the repository (`ytd.sh`).
  - Manually download the script using `wget`:
    ```bash
    wget -O ~/bin/termux-url-opener "https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/ytd.sh"
    chmod +x ~/bin/termux-url-opener
    ```

## Updating `yt-dlp`

To ensure the latest version of `yt-dlp`, run:
```bash
python -m pip install yt-dlp --user --upgrade
```

## Author

- **Name**: Argh94
- **GitHub**: [Argh94](https://github.com/Argh94)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
