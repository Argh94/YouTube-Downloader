#!/data/data/com.termux/files/usr/bin/bash

# اسکریپت نصاب دانلودر یوتیوب (اصلاح‌شده برای Termux)
# نویسنده: شما (با الهام از barcodeTm و Khansaad1275)
# تاریخ: 4 می 2025
# توضیحات: نصب پیش‌نیازها، دانلود اسکریپت دانلودر یوتیوب از GitHub و تنظیم برای Termux

set -e  # اگر خطایی رخ داد، اسکریپت متوقف می‌شه

kill_color=$'\e[0m'

# نمایش پیام شروع
echo -e "\e[032mشروع نصب دانلودر یوتیوب...\n$kill_color"

# نصب پیش‌نیازها
echo -e "\e[035mبه‌روزرسانی پکیج‌ها...\n$kill_color"
pkg update -y && pkg upgrade -y

echo -e "\e[032mدرخواست دسترسی به ذخیره‌سازی...\n$kill_color"
echo -e "\e[032mلطفاً اجازه دسترسی به ذخیره‌سازی رو بدید!"
sleep 3
termux-setup-storage
sleep 5

echo -e "\e[033mنصب پایتون و wget...\n$kill_color"
pkg install python wget -y

echo -e "\e[034mنصب yt-dlp...\n$kill_color"
python -m pip install yt-dlp --user >/dev/null

# اضافه کردن مسیر yt-dlp به PATH
echo -e "\e[032mتنظیم PATH برای yt-dlp...\n$kill_color"
export PATH=$PATH:/data/data/com.termux/files/home/.local/bin
echo "export PATH=\$PATH:/data/data/com.termux/files/home/.local/bin" >> ~/.bashrc
source ~/.bashrc

echo -e "\e[032mایجاد پوشه YouTubeVideos در گالری...\n$kill_color"
mkdir -p /storage/emulated/0/Pictures/YouTubeVideos

# دانلود اسکریپت اصلی از GitHub
echo -e "\e[032mدانلود اسکریپت دانلودر از GitHub...\n$kill_color"
YTD_URL="https://raw.githubusercontent.com/Argh94/YouTube-Downloader/refs/heads/main/ytd.sh"
mkdir -p ~/bin
wget -O ~/bin/termux-url-opener "$YTD_URL" || {
    echo -e "\e[031mخطا: دانلود اسکریپت اصلی شکست خورد. لطفاً مطمئن شید که فایل ytd.sh توی مخزن GitHub آپلود شده.\n$kill_color"
    echo -e "\e[031mلینک: $YTD_URL\n$kill_color"
    exit 1
}

# تنظیم دسترسی اجرایی
echo -e "\e[032mتنظیم دسترسی اجرایی...\n$kill_color"
chmod +x ~/bin/termux-url-opener

# چک کردن وجود فایل
if [[ ! -f ~/bin/termux-url-opener ]]; then
    echo -e "\e[031mخطا: فایل termux-url-opener ایجاد نشد. لطفاً لینک GitHub یا اینترنت رو چک کنید.\n$kill_color"
    exit 1
fi

# پیام موفقیت
echo -e "\e[032mنصب کامل شد!\n$kill_color"
echo -e "\e[032mحالا می‌تونید لینک یوتیوب رو از اپ یوتیوب با Termux به اشتراک بذارید.\n$kill_color"
echo -e "\e[032mیا اسکریپت رو دستی اجرا کنید:\n$kill_color"
echo "  ~/bin/termux-url-opener \"https://www.youtube.com/watch?v=VIDEO_ID\""
