#!/bin/bash

# Variabel Telegram
BOT_TOKEN="YOUR_TELEGRAM_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"

# File log Snort
SNORT_LOG="/var/log/snort/snort.alert.fast"

# Pastikan log file Snort ada
if [ ! -f "$SNORT_LOG" ]; then
    echo "File log Snort tidak ditemukan di $SNORT_LOG"
    exit 1
fi

# Menjalankan Snort
echo "Menjalankan Snort dan memantau alert secara realtime..."
snort -A fast -c /etc/snort/snort.conf -i enp0s3 > /dev/null 2>&1 &

# PID Snort untuk terminasi nantinya
SNORT_PID=$!

# Fungsi untuk mengirim alert ke Telegram
send_to_telegram() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
        -d chat_id="$CHAT_ID" \
        -d text="$message" > /dev/null
}

# Memantau file log Snort secara realtime
tail -Fn0 "$SNORT_LOG" | while read line; do
    if [[ $line == *"[**]"* ]]; then
        echo "Alert ditemukan: $line"
        send_to_telegram "Snort Alert: $line"
    fi
done

# Membersihkan saat script dihentikan
trap "echo 'Menghentikan Snort'; kill $SNORT_PID; exit" SIGINT SIGTERM
