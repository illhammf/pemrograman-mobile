# Bagian C — Halaman Daftar Catatan (Read dan Delete)

## Deskripsi

Bagian ini mengimplementasikan halaman daftar catatan menggunakan SQLite. Data dibaca dari database `catatan.db`, ditampilkan dengan `FutureBuilder`, dan dapat dihapus melalui ikon sampah.

## Tujuan

1. Membaca data catatan dari SQLite.
2. Menampilkan data menggunakan `FutureBuilder`.
3. Menampilkan indikator loading, pesan error, dan kondisi daftar kosong.
4. Menghapus catatan berdasarkan ID.
5. Memuat ulang daftar setelah data berubah.

## Konsep yang Dipelajari

### FutureBuilder

`FutureBuilder` digunakan untuk membangun tampilan berdasarkan hasil operasi asynchronous. Pada praktikum ini, `FutureBuilder` menangani empat kondisi:

- **Loading:** menampilkan `CircularProgressIndicator`.
- **Error:** menampilkan pesan kesalahan dan tombol coba lagi.
- **Kosong:** menampilkan pesan bahwa belum ada catatan.
- **Berhasil:** menampilkan catatan menggunakan `ListView.builder`.

### Membaca data

Method `semua()` menjalankan query terhadap tabel `catatan` dan mengurutkan data berdasarkan ID secara menurun.

### Menghapus data

Method `hapus()` menerima ID catatan, kemudian menghapus baris yang sesuai menggunakan `where` dan `whereArgs`.

Setelah penghapusan berhasil, daftar dimuat kembali agar tampilan sesuai dengan isi database.

### RefreshIndicator

`RefreshIndicator` menyediakan fitur tarik ke bawah untuk memuat ulang daftar.

## Struktur File

```text
bagian-c-daftar-catatan/
├── main.dart
├── README.md
└── screenshots/
```

## Persiapan

Dari folder `pertemuan-5/praktikum`, pastikan dependensi sudah tersedia:

```bash
flutter pub add sqflite path
```

Bagian ini menggunakan nama database dan struktur tabel yang sama dengan Bagian B.

## Cara Menjalankan

Jalankan dari folder `pertemuan-5/praktikum`:

```bash
flutter run -t bagian-c-daftar-catatan/main.dart
```

Gunakan emulator atau perangkat Android.

## Langkah Pengujian

1. Jalankan aplikasi dan pastikan halaman Catatan Saya muncul.
2. Jika database sudah berisi data dari Bagian B, pastikan catatan tampil pada daftar.
3. Ketuk salah satu catatan untuk membaca isi lengkapnya.
4. Tekan ikon sampah.
5. Pilih Hapus pada dialog konfirmasi.
6. Pastikan catatan tersebut hilang dari daftar.
7. Coba tombol muat ulang atau tarik daftar ke bawah.
8. Tutup aplikasi sepenuhnya, jalankan kembali, dan pastikan data yang tidak dihapus masih tersimpan.

Jika daftar kosong, tambahkan catatan terlebih dahulu menggunakan aplikasi Bagian B, kemudian jalankan kembali Bagian C.

## Screenshot Dokumentasi

Simpan hasil tangkapan layar di folder `screenshots/`:

- `01-daftar-catatan.png` — daftar catatan yang berhasil dibaca.
- `02-detail-catatan.png` — isi lengkap catatan setelah diketuk.
- `03-konfirmasi-hapus.png` — dialog konfirmasi penghapusan.
- `04-daftar-setelah-hapus.png` — daftar setelah catatan dihapus.
- `05-daftar-kosong.png` — tampilan jika seluruh catatan sudah dihapus.

Buat folder screenshot dengan perintah:

```bash
mkdir -p bagian-c-daftar-catatan/screenshots
```

## Kesimpulan

Halaman daftar catatan membaca data SQLite secara asynchronous dan menampilkan kondisi loading, error, data kosong, serta daftar data. Operasi delete menggunakan ID agar hanya catatan yang dipilih yang dihapus.

## Referensi

- [Flutter — Membaca dan menulis data SQLite](https://docs.flutter.dev/cookbook/persistence/sqlite)
- [Paket sqflite](https://pub.dev/packages/sqflite)
