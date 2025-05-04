#!/data/data/com.termux/files/usr/bin/bash

# اسکریپت دانلودر یوتیوب کامل با شخصی‌سازی
# نویسنده: شما (با الهام از barcodeTm و Khansaad1275)
# تاریخ: 4 می 2025
# توضیحات: نصب پیش‌نیازها، دانلود ویدیو/صوت از یوتیوب با منوی پیشرفته، ذخیره در گالری، و اجرای خودکار با اشتراک لینک

clear
kill_color=$'\e[0m'

# تابع نمایش لوگو
show_logo() {
    echo -e "\e[032m" "          ▄▀▄     ▄▀▄"
    echo -e "\e[032m" "         ▄█░░▀▀▀▀▀░░█▄"
    echo -e "\e[032m" "     ▄▄  █░░░░░░░░░░░█  ▄▄"
    echo -e "\e[032m" "    █▄▄█ █░░█░░┬░░█░░█ █▄▄█"
    echo -e "\e[036m" "╔════════════════════════════════════╗"
    echo -e "\e[032m" "║ ♚ پروژه: دانلودر یوتیوب پیشرفته  ║"
    echo -e "\e[032m" "║ ♚ نویسنده: شما (با الهام از barcodeTm) ║"
    echo -e "\e[036m" "╚════════════════════════════════════╝"
}

# تابع نصب پیش‌نیازها
install_prerequisites() {
    echo -e "\e[035mبه‌روزرسانی پکیج‌ها...\n$kill_color"
    pkg update && pkg upgrade -y

    echo -e "\e[032mدرخواست دسترسی به ذخیره‌سازی...\n$kill_color"
    echo -e "\e[032mلطفاً اجازه دسترسی به ذخیره‌سازی رو بدید!"
    sleep 3
    termux-setup-storage
    sleep 5

    echo -e "\e[033mنصب پایتون...\n$kill_color"
    pkg install python -y

    echo -e "\e[034mنصب yt-dlp...\n$kill_color"
    pip install --upgrade pip
    pip install yt-dlp

    echo -e "\e[032mایجاد پوشه YouTubeVideos در گالری...\n$kill_color"
    mkdir -p /storage/emulated/0/Pictures/YouTubeVideos

    echo -e "\e[032mنصب پیش‌نیازها کامل شد!\n$kill_color"
}

# چک کردن نصب yt-dlp و نصب پیش‌نیازها اگر لازم باشه
command -v yt-dlp &>/dev/null || {
    echo -e "\e[031myt-dlp پیدا نشد. شروع نصب پیش‌نیازها...\n$kill_color"
    install_prerequisites
}

# اگر لینک یوتیوب وارد نشده باشه
if [[ -z "$1" ]]; then
    echo -e "\e[031mلطفاً لینک یوتیوب رو وارد کنید! مثال:\n$kill_color"
    echo "./ytd.sh \"https://www.youtube.com/watch?v=VIDEO_ID\""
    exit 1
fi

# نمایش لوگو و منوی انتخاب پیشرفته
show_logo
echo -e "\e[036m╠═▶ [انتخاب فرمت]  ➳"
echo -e "\e[032m╠═▶ 1. صوتی MP3 ♫"
echo -e "\e[032m╠═▶ 2. ویدیو 360p"
echo -e "\e[032m╠═▶ 3. ویدیو 480p"
echo -e "\e[032m╠═▶ 4. ویدیو 720p"
echo -e "\e[032m╠═▶ 5. ویدیو 1080p"
echo -e "\e[032m╠═▶ 6. ویدیو 4K (2160p)"
echo -e "\e[032m╠═▶ 7. خروج"
echo -e "\e[032m╚═:➤  $kill_color"
read -p "گزینه رو وارد کنید (1-7): " option

# تنظیمات پایه دانلود
# ذخیره در گالری با نام تمیز (بدون کاراکترهای غیرضروری)
command='--no-mtime -o /storage/emulated/0/Pictures/YouTubeVideos/%(title)s.%(ext)s --restrict-filenames'

# مدیریت گزینه‌ها
case $option in
    1)
        echo -e "\e[032mدر حال دانلود صوتی MP3...\n$kill_color"
        yt-dlp -x --audio-format mp3 --audio-quality 0 $command "$1"
        ;;
    2)
        echo -e "\e[032mدر حال دانلود ویدیو 360p...\n$kill_color"
        yt-dlp -f "bestvideo[height<=360]+bestaudio/best[height<=360]" $command "$1"
        ;;
    3)
        echo -e "\e[032mدر حال دانلود ویدیو 480p...\n$kill_color"
        yt-dlp -f "bestvideo[height<=480]+bestaudio/best[height<=480]" $command "$1"
        ;;
    4)
        echo -e "\e[032mدر حال دانلود ویدیو 720p...\n$kill_color"
        yt-dlp -f "bestvideo[height<=720]+bestaudio/best[height<=720]" $command "$1"
        ;;
    5)
        echo -e "\e[032mدر حال دانلود ویدیو 1080p...\n$kill_color"
        yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" $command "$1"
        ;;
    6)
        echo -e "\e[032mدر حال دانلود ویدیو 4K...\n$kill_color"
        yt-dlp -f "bestvideo[height<=2160]+bestaudio/best[height<=2160]" $command "$1"
        ;;
    7)
        echo -e "\e[032mخروج از اسکریپت. bye!\n$kill_color"
        exit 0
        ;;
    *)
        echo -e "\e[031mگزینه نامعتبر! لطفاً 1 تا 7 رو انتخاب کنید.\n$kill_color"
        exit 1
        ;;
esac

# پیام موفقیت یا خطا
if [[ $? -eq 0 ]]; then
    echo -e "\e[032mدانلود کامل شد! فایل توی /storage/emulated/0/Pictures/YouTubeVideos ذخیره شده.\n$kill_color"
else
    echo -e "\e[031mخطایی در دانلود رخ داد. لطفاً لینک یا اتصال اینترنت رو چک کنید.\n$kill_color"
fi
