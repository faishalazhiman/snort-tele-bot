
# Snort Bot Telegram Bash Shell GNU/Linux

Bot ini memungkinkan  menerima notifikasi alert dari Snort secara realtime melalui Telegram menggunakan Bash Script. Ikuti panduan ini untuk menginstal, mengonfigurasi, dan menjalankan bot.

---

## Persyaratan
- Sistem Operasi: Debian, Ubuntu, atau turunan lainnya.
- Snort versi terbaru.
- Akun Telegram dan akses ke BotFather untuk membuat bot.

---

## Langkah 1: Instalasi Snort

### Instal Snort di Debian/Ubuntu/Mint
Jalankan perintah berikut untuk menginstal Snort:
```bash
sudo apt update
sudo apt install snort -y
```

Pastikan Snort sudah terinstal dengan benar sebelum melanjutkan ke langkah berikutnya.

---

## Langkah 2: Membuat Bot Telegram dan Mendapatkan Token serta Chat ID

### 1. Buat Bot Telegram:
- Buka aplikasi Telegram, cari **BotFather**, dan buat bot baru dengan perintah `/newbot`.
- Berikan nama dan username bot.
- Catat `TOKEN` yang diberikan oleh BotFather.

### 2. Dapatkan Chat ID:
Untuk mendapatkan `CHAT_ID`, gunakan skrip yang tersedia dalam repository ini:
1. Clone repository:
   ```bash
   git clone https://github.com/faishalazhiman/Snort-Bot-Telegram-Shell
   cd Snort-Bot-Telegram-Shell
   chmod +x get_chat_id.sh
   ```
2. Jalankan skrip:
   ```bash
  ./get_chat_id.sh
   ```
3. Kirim pesan ke bot  di Telegram (misalnya: "Halo Bot!").
4. Skrip akan mendeteksi `CHAT_ID`  dan mencetaknya di terminal.

### 3. Verifikasi Token dan Chat ID (Opsional):
 juga bisa memeriksa `CHAT_ID` secara manual dengan mengakses URL API Telegram:
```bash
https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates
```
Gantilah `<YOUR_TOKEN>` dengan token bot.

---

## Langkah 3: Mengunduh dan Mengatur Bot

### Clone Repository
1. Clone repository ke komputer :
   ```bash
   git clone https://github.com/faishalazhiman/Snort-Bot-Telegram-Shell
   ```
2. Masuk ke direktori dan berikan izin eksekusi pada skrip:
   ```bash
   cd Snort-Bot-Telegram-Shell
   chmod +x bot-tele.sh
   ```

### Konfigurasi Token dan Chat ID
1. Edit file `bot-tele.sh` menggunakan editor teks:
   ```bash
   nano bot-tele.sh
   ```
2. Masukkan nilai `BOT_TOKEN` dan `CHAT_ID`:
   ```bash
   BOT_TOKEN="YOUR_TELEGRAM_BOT_TOKEN"
   CHAT_ID="YOUR_CHAT_ID"
   ```
3. Simpan dan tutup file.

---

## Langkah 4: Menjalankan Bot

Jalankan bot dengan perintah:
```bash
./bot-tele.sh
```

Bot akan mulai memantau file log Snort secara realtime. Jika ada alert, bot akan mengirimkan notifikasi ke Telegram.

---

## Troubleshooting

Jika  tidak menerima notifikasi:
1. Pastikan `BOT_TOKEN` dan `CHAT_ID` sudah benar.
2. Verifikasi bahwa Snort menghasilkan alert dan menyimpannya di file log `snort.alert.fast`.
3. Periksa log Snort:
   ```bash
   cat /var/log/snort/snort.alert.fast
   ```
4. Pastikan bot memiliki akses internet.

---

Dengan mengikuti panduan ini,  dapat menerima notifikasi alert Snort di Telegram secara otomatis. Untuk informasi lebih lanjut, buka dokumentasi resmi Snort atau Telegram Bot API.

Semoga bermanfaat! 🎉
Ishal
