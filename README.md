
# Snort Bot Telegram Bash Shell GNU/Linux

Proyek ini menyediakan skrip Bash untuk integrasi real-time antara alert Snort dan Telegram, memungkinkan pengguna menerima notifikasi keamanan jaringan langsung di Telegram.

---

## Persyaratan

- **Sistem Operasi**: Debian, Ubuntu, atau distribusi Linux lainnya.
- **Snort**: Sudah diinstal dan dikonfigurasi untuk menghasilkan alert.
- **Telegram Bot**: Sudah dibuat menggunakan BotFather.

---

## Langkah 1: Instalasi Snort

Untuk menginstal Snort di sistem berbasis Debian/Ubuntu, gunakan perintah berikut:
```bash
sudo apt update
sudo apt install snort -y
```

Pastikan Snort sudah terpasang dengan benar sebelum melanjutkan.

---

## Langkah 2: Membuat Bot Telegram dan Mendapatkan Token serta Chat ID

### Membuat Bot Telegram
1. Buka aplikasi Telegram, cari **BotFather**, lalu buat bot baru dengan perintah `/newbot`.
2. Ikuti petunjuk untuk memberikan nama dan username bot.
3. Catat **TOKEN** API bot Anda yang diberikan oleh BotFather.

### Mendapatkan Chat ID
1. Salin token API bot Anda.
2. Gunakan URL berikut untuk mendapatkan Chat ID:
   ```bash
   https://api.telegram.org/bot<PASTE_TOKEN_API>/getUpdates
   ```
   Ganti `<PASTE_TOKEN_API>` dengan token API bot Anda.
3. Kirim pesan ke bot Anda di Telegram (misalnya: "Halo Bot!") untuk memastikan pesan masuk ke log.
4. Periksa respon dari API dan temukan **Chat ID** Anda di dalam log.

### Mengirim Pesan Uji
Setelah mendapatkan Chat ID, uji bot Anda dengan menggunakan URL berikut:
```bash
https://api.telegram.org/bot<PASTE_TOKEN_API>/sendMessage?chat_id=<CHAT_ID>&text=Coba%20aja
```
Gantilah `<PASTE_TOKEN_API>` dengan token API Anda dan `<CHAT_ID>` dengan Chat ID yang Anda peroleh.

---

## Langkah 3: Unduh dan Konfigurasi Bot

### Clone Repository
1. Clone repository ini ke komputer Anda:
   ```bash
   git clone https://github.com/faishalazhiman/snort-tele-bot.git
   cd snor-tele-bot.git
   chmod +x bot-tele.sh
   ```

### Konfigurasi Token dan Chat ID
1. Edit file `bot-tele.sh` menggunakan editor teks:
   ```bash
   nano bot-tele.sh
   ```
2. Masukkan nilai `BOT_TOKEN` dan `CHAT_ID`:
   ```bash
   BOT_TOKEN="TOKEN_API_TELEGRAM"
   CHAT_ID="CHAT_ID_TELEGRAM"
   ```
3. Simpan dan keluar dari editor.

---

## Langkah 4: Jalankan Bot

Jalankan bot menggunakan perintah berikut:
```bash
./bot-tele.sh
```

Bot akan mulai memantau file log Snort secara real-time. Jika ada alert, bot akan mengirimkan notifikasi ke Telegram Anda.

---

## Troubleshooting

Jika Anda tidak menerima notifikasi:
1. Pastikan `BOT_TOKEN` dan `CHAT_ID` sudah benar.
2. Verifikasi bahwa Snort menghasilkan alert dan menyimpannya di file log `snort.alert.fast`.
3. Cek log Snort:
   ```bash
   cat /var/log/snort/snort.alert.fast
   ```
4. Pastikan bot memiliki koneksi internet.

---

Semoga bermanfaat! 🎉

Ishal
