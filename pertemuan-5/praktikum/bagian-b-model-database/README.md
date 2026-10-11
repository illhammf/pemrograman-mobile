# Bagian B — Menyiapkan SQLite

## Deskripsi

Bagian ini mempelajari penyimpanan data terstruktur menggunakan SQLite dengan paket `sqflite` dan `path`. Praktikum membuat model `Catatan`, kelas `DbHelper`, dan layar sederhana untuk menguji operasi CRUD.

## Tujuan

1. Membuat model data dengan properti `id`, `judul`, dan `isi`.
2. Mengubah objek menjadi `Map` dan membaca objek dari hasil query.
3. Membuat database dan tabel SQLite.
4. Memahami operasi Create, Read, Update, dan Delete.
5. Menggunakan `whereArgs` untuk parameter query.

## Struktur Tabel

Tabel yang digunakan bernama `catatan`.

| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | INTEGER | Primary key, bertambah otomatis |
| `judul` | TEXT | Judul catatan, wajib diisi |
| `isi` | TEXT | Isi catatan, wajib diisi |

## Struktur File

```text
bagian-b-model-database/
├── main.dart
├── README.md
└── screenshots/
```

## Paket yang Digunakan

- `sqflite` — menjalankan operasi SQLite.
- `path` — membantu membentuk lokasi file database.

Pasang paket dari folder proyek `pertemuan-5/praktikum`:

```bash
flutter pub add sqflite path
```

## Penjelasan Kode

### Model `Catatan`

Model menyimpan data sebuah catatan. Properti `id` dibuat nullable karena ID akan dihasilkan oleh SQLite saat catatan baru dimasukkan.

- `toMap()` mengubah objek menjadi `Map`.
- `fromMap()` mengubah hasil query menjadi objek `Catatan`.

### Kelas `DbHelper`

Kelas ini menjadi tempat pengelolaan database:

- `database` membuka database dan membuat tabel ketika database pertama kali dibuat.
- `tambah()` memasukkan catatan baru.
- `semua()` membaca semua catatan.
- `ubah()` memperbarui catatan berdasarkan ID.
- `hapus()` menghapus catatan berdasarkan ID.

Database disimpan dengan nama `catatan.db` dan menggunakan tabel `catatan`.

### Operasi CRUD

| Operasi | Method | Kegunaan |
|---|---|---|
| Create | `tambah()` | Menyimpan catatan baru |
| Read | `semua()` | Membaca daftar catatan |
| Update | `ubah()` | Mengubah catatan yang dipilih |
| Delete | `hapus()` | Menghapus catatan berdasarkan ID |

Untuk operasi berdasarkan ID, kode menggunakan `where: 'id = ?'` dan `whereArgs: [id]`. Placeholder membantu memisahkan nilai parameter dari teks query SQL.

## Cara Menjalankan

Pastikan terminal berada di folder `pertemuan-5/praktikum`, kemudian jalankan:

```bash
flutter run -t bagian-b-model-database/main.dart
```

Jalankan menggunakan emulator atau perangkat Android.

## Langkah Pengujian

1. Jalankan aplikasi dan pastikan layar Database Catatan muncul.
2. Tekan tombol `+` untuk menambahkan catatan.
3. Isi judul dan isi catatan, kemudian tekan Simpan.
4. Pastikan catatan muncul pada daftar.
5. Gunakan menu pada catatan untuk mengubah data.
6. Pastikan perubahan tampil setelah disimpan.
7. Gunakan menu Hapus dan konfirmasikan penghapusan.
8. Pastikan catatan yang dihapus tidak lagi muncul.
9. Hentikan aplikasi dan jalankan kembali. Pastikan catatan yang tidak dihapus masih tersimpan.

## Screenshot Dokumentasi

Simpan screenshot di folder `screenshots/`:

- `01-daftar-kosong.png` — tampilan ketika belum ada catatan.
- `02-catatan-tersimpan.png` — daftar setelah catatan ditambahkan.
- `03-form-ubah-catatan.png` — form untuk mengubah catatan.
- `04-hasil-crud.png` — hasil pengujian tambah, ubah, dan hapus.

Buat folder screenshot jika belum ada:

```bash
mkdir -p bagian-b-model-database/screenshots
```

## Kesimpulan

SQLite cocok untuk menyimpan data terstruktur yang perlu dibaca dan dikelola kembali. Dengan model `Catatan` dan kelas `DbHelper`, operasi CRUD dapat dipisahkan dari kode antarmuka sehingga pengelolaan data lebih terorganisasi.

## Referensi

- [Flutter — Membaca dan menulis data SQLite](https://docs.flutter.dev/cookbook/persistence/sqlite)
- [Paket sqflite](https://pub.dev/packages/sqflite)
- [Paket path](https://pub.dev/packages/path)
