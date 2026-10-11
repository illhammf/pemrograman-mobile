# Bagian D — Form Tambah dan Ubah Catatan

## Deskripsi

Bagian ini mengimplementasikan form untuk menambah dan mengubah catatan menggunakan Flutter dan SQLite. Satu halaman form digunakan untuk kedua operasi. Jika tidak menerima objek catatan, form digunakan untuk menambah data baru. Jika menerima objek catatan, form menampilkan data yang sudah ada untuk diubah.

## Tujuan

1. Membuat form tambah dan ubah catatan.
2. Menggunakan `TextEditingController` untuk mengelola input.
3. Memvalidasi judul dan isi catatan.
4. Menyimpan data baru dengan operasi Create.
5. Memperbarui data dengan operasi Update.
6. Menggunakan `Navigator` untuk berpindah halaman dan kembali ke daftar.

## Konsep yang Dipelajari

### Form dan validasi

`Form` dan `GlobalKey<FormState>` digunakan untuk memeriksa input sebelum disimpan. Judul dan isi catatan wajib diisi.

### TextEditingController

Controller digunakan untuk membaca input pengguna dan mengisi form dengan data lama ketika catatan sedang diubah.

### Tambah dan ubah

- Jika `widget.catatan == null`, aplikasi menjalankan `DbHelper.instance.tambah()`.
- Jika catatan sudah tersedia, aplikasi menjalankan `DbHelper.instance.ubah()` berdasarkan ID catatan.

### Navigasi dan pemuatan ulang

Halaman daftar membuka form menggunakan `Navigator.push()`. Setelah kembali dari form, daftar dimuat ulang agar perubahan terbaru terlihat.

## Struktur File

```text
bagian-d-form-catatan/
├── main.dart
├── README.md
└── screenshots/
```

## Persiapan

Pastikan paket `sqflite` dan `path` sudah terpasang di proyek `pertemuan-5/praktikum`:

```bash
flutter pub add sqflite path
```

## Cara Menjalankan

Dari folder `pertemuan-5/praktikum`, jalankan:

```bash
flutter run -t bagian-d-form-catatan/main.dart
```

Gunakan emulator atau perangkat Android.

## Langkah Pengujian

1. Jalankan aplikasi.
2. Tekan tombol `+` untuk membuka form catatan baru.
3. Coba tekan Simpan ketika judul atau isi masih kosong. Pastikan validasi muncul.
4. Isi judul dan isi catatan, lalu tekan Simpan.
5. Pastikan aplikasi kembali ke daftar dan catatan baru muncul.
6. Ketuk catatan yang sudah ada.
7. Pastikan form terisi dengan data sebelumnya.
8. Ubah judul atau isi, lalu simpan.
9. Pastikan perubahan tampil pada daftar.
10. Hentikan aplikasi sepenuhnya dan jalankan kembali untuk memastikan data tetap tersimpan.

## Screenshot Dokumentasi

Simpan screenshot pada folder `screenshots/`:

- `01-form-catatan-baru.png` — form tambah catatan.
- `02-validasi-form.png` — pesan validasi ketika input wajib masih kosong.
- `03-daftar-setelah-tambah.png` — daftar setelah catatan ditambahkan.
- `04-form-ubah-catatan.png` — form yang sudah terisi data lama.
- `05-daftar-setelah-ubah.png` — daftar setelah catatan diperbarui.

Buat folder screenshot jika belum tersedia:

```bash
mkdir -p bagian-d-form-catatan/screenshots
```

## Kesimpulan

Satu form dapat digunakan untuk operasi Create dan Update dengan memeriksa apakah objek catatan tersedia. Validasi membantu mencegah input kosong, sedangkan navigasi dan pemuatan ulang memastikan daftar menampilkan data terbaru.

## Referensi

- [Flutter — Membaca dan menulis data SQLite](https://docs.flutter.dev/cookbook/persistence/sqlite)
- [Paket sqflite](https://pub.dev/packages/sqflite)
