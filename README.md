# 🔐 Windows Folder Locker

Script sederhana berbasis Windows Batch (`.bat`) untuk menyembunyikan dan menampilkan kembali folder menggunakan verifikasi kata sandi.

## 📌 Deskripsi

**Windows Folder Locker** merupakan proyek sederhana yang dibuat menggunakan Windows Batch Script. Program ini memungkinkan pengguna menyembunyikan folder dari tampilan File Explorer biasa dan menampilkan kembali folder melalui proses verifikasi kata sandi.

Proyek ini dibuat sebagai sarana pembelajaran mengenai penggunaan perintah Command Prompt, pengelolaan direktori, atribut file dan folder, percabangan kondisi, serta validasi kata sandi sederhana.

## ✨ Fitur

- **Pembuatan Folder Otomatis** — Membuat folder `Private` secara otomatis jika belum tersedia.
- **Mengunci Folder** — Menyembunyikan folder menggunakan atribut bawaan Windows.
- **Verifikasi Kata Sandi** — Meminta kata sandi sebelum menampilkan kembali folder.
- **Penggantian Nama Folder** — Menggunakan format nama folder berbasis CLSID.
- **Antarmuka Sederhana** — Menyediakan menu interaktif melalui Command Prompt.
- **Ringan dan Praktis** — Tidak memerlukan instalasi aplikasi tambahan.

## 🛠️ Teknologi yang Digunakan

| Teknologi | Fungsi |
|---|---|
| Windows Batch (`.bat`) | Bahasa scripting utama |
| Command Prompt (CMD) | Menjalankan program |
| `attrib` | Mengatur atribut folder |
| `ren` | Mengubah nama folder |
| `mkdir` | Membuat direktori |

## 📂 Struktur Proyek

```text
Windows-Folder-Locker/
│
├── FolderLocker.bat
└── README.md
```

## ⚙️ Instalasi

### Persyaratan

- Windows 10 atau Windows 11.
- Command Prompt (CMD).
- Tidak memerlukan aplikasi tambahan.

### Langkah Instalasi

1. Clone repository:

```bash
git clone https://github.com/USERNAME/Windows-Folder-Locker.git
```

2. Masuk ke direktori proyek:

```bash
cd Windows-Folder-Locker
```

3. Jalankan program:

```cmd
FolderLocker.bat
```

## 🚀 Cara Penggunaan

### 1. Menjalankan Program Pertama Kali

Saat pertama kali dijalankan, program akan membuat folder bernama:

```text
Private/
```

Masukkan file atau dokumen yang ingin disembunyikan ke dalam folder tersebut.

### 2. Mengunci Folder

Jalankan kembali `FolderLocker.bat`, kemudian pilih:

```text
[1] Lock Folder
```

Program akan melakukan beberapa proses:

- Mengubah nama folder `Private`.
- Menambahkan atribut `Hidden`.
- Menambahkan atribut `System`.

Folder kemudian tidak akan terlihat pada tampilan File Explorer biasa selama file tersembunyi dan file sistem dilindungi tidak ditampilkan.

### 3. Membuka Kunci Folder

Jalankan kembali `FolderLocker.bat`.

Program akan mendeteksi folder yang terkunci dan meminta kata sandi.

Masukkan kata sandi yang telah ditentukan. Jika benar, program akan:

- Menghapus atribut `Hidden`.
- Menghapus atribut `System`.
- Mengembalikan nama folder menjadi `Private`.

## 🔍 Cara Kerja Program

Program memanfaatkan beberapa perintah bawaan Windows untuk mengelola folder.

| Perintah | Fungsi |
|---|---|
| `mkdir` | Membuat direktori baru |
| `ren` | Mengubah nama direktori |
| `attrib +h +s` | Menambahkan atribut Hidden dan System |
| `attrib -h -s` | Menghapus atribut Hidden dan System |
| `set /p` | Menerima input dari pengguna |
| `if` | Memeriksa kondisi |
| `goto` | Mengarahkan alur program ke bagian tertentu |

### Mekanisme Penguncian Folder

Program menggunakan nama folder dengan format CLSID:

```text
Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}
```

Kemudian menjalankan perintah:

```cmd
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
```

Perintah tersebut memberikan atribut tersembunyi dan sistem pada folder.

### Mekanisme Membuka Kunci Folder

Setelah kata sandi berhasil diverifikasi, program menjalankan:

```cmd
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
```

Selanjutnya, nama folder dikembalikan menjadi `Private`.

## 🔑 Pengaturan Kata Sandi

Kata sandi dapat diatur langsung melalui variabel pada script.

Contoh:

```bat
set "PASSWORD=Bebas"
```

Ganti `Bebas` dengan kata sandi yang diinginkan sebelum menjalankan program.

**Catatan:** Kata sandi masih disimpan dalam bentuk teks biasa (plaintext) di dalam file BAT. Siapa pun yang dapat membaca script dapat mengetahui kata sandinya.

## ⚠️ Keterbatasan Keamanan

Proyek ini dibuat untuk tujuan pembelajaran Windows Batch Scripting dan bukan merupakan sistem keamanan penyimpanan data.

Beberapa keterbatasan yang perlu diketahui:

- Atribut Hidden dan System tidak mengenkripsi isi folder.
- Folder masih dapat ditemukan melalui Command Prompt atau pengaturan File Explorer.
- Kata sandi tersimpan dalam bentuk plaintext.
- Mekanisme ini dapat dilewati dengan mengubah atribut dan nama folder secara manual.
- Tidak memberikan perlindungan terhadap akses tidak sah ke file.

**Jangan gunakan program ini untuk melindungi dokumen penting atau informasi rahasia.**

Untuk perlindungan data yang lebih baik, gunakan BitLocker atau VeraCrypt.

## 🔮 Pengembangan Selanjutnya

Beberapa fitur yang berpotensi ditambahkan:

- [ ] Menggunakan hashing untuk verifikasi kata sandi.
- [ ] Membatasi jumlah percobaan kata sandi.
- [ ] Menambahkan pencatatan aktivitas Lock dan Unlock.
- [ ] Menggunakan enkripsi AES untuk melindungi file.
- [ ] Meningkatkan penanganan kesalahan.
- [ ] Membuat antarmuka Command Prompt lebih interaktif.
- [ ] Menambahkan pemeriksaan untuk mencegah perubahan nama folder secara tidak sengaja.

## 🎯 Tujuan Pembelajaran

Melalui proyek ini, beberapa konsep yang dipelajari meliputi:

- Dasar-dasar Windows Batch Scripting.
- Otomatisasi melalui Command Prompt.
- Konsep dasar kontrol akses.
- Pengelolaan atribut file dan direktori Windows.
- Penggunaan percabangan dan alur program.
- Memahami keterbatasan metode penyembunyian folder.

## 👨‍💻 Pengembang

**Muhammad Ariq Mubarak**

## 📄 Lisensi

Proyek ini dibuat untuk keperluan pembelajaran dan penggunaan pribadi. Pengguna diperbolehkan mempelajari, memodifikasi, dan mengembangkan program ini sesuai kebutuhan.
