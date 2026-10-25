# Tugas Pertemuan 7 — Pemrograman Mobile

Dokumentasi pengerjaan tugas praktikum Pertemuan 7 pada mata kuliah **Pemrograman Mobile**. Folder ini berisi proyek aplikasi Flutter yang mengintegrasikan pengelolaan kegiatan dan pencatatan keuangan dalam satu aplikasi.

## Identitas Proyek

| Informasi | Keterangan |
|---|---|
| Mata Kuliah | Pemrograman Mobile |
| Pertemuan | 7 |
| Jenis Pekerjaan | Tugas Praktikum |
| Nama Proyek | TabungKu |
| Framework | Flutter |
| Bahasa Pemrograman | Dart |
| Database Lokal | SQLite |
| Penyimpanan Preferensi | SharedPreferences |
| Status Pengujian Manual | 12 skenario lulus |

## Deskripsi Tugas

Tugas Pertemuan 7 dikerjakan melalui pengembangan aplikasi **TabungKu**, yaitu aplikasi mobile untuk membantu pengguna mengelola kegiatan harian, mencatat pemasukan dan pengeluaran, memantau tabungan, serta melihat laporan keuangan.

Proyek ini menggabungkan beberapa konsep yang telah dipelajari pada pertemuan sebelumnya, kemudian dikembangkan dengan penyimpanan lokal, navigasi ant halaman, pengelolaan tema, visualisasi progres tabungan, pencarian kegiatan, filter status, dan ekspor laporan CSV.

## Struktur Folder

```text
tugas/
├── README.md
└── tabungku/
    ├── README.md
    ├── lib/
    ├── test/
    ├── screenshots/
    ├── android/
    ├── ios/
    ├── linux/
    ├── macos/
    ├── web/
    ├── windows/
    ├── pubspec.yaml
    └── pubspec.lock
```

**Keterangan:**

- `README.md` pada folder `tugas/` merupakan dokumentasi pengantar pengerjaan tugas.
- `tabungku/` merupakan folder proyek utama aplikasi Flutter.
- `tabungku/README.md` berisi dokumentasi lengkap aplikasi, fitur, teknologi, instalasi, penggunaan, pengujian, dan screenshot.
- `tabungku/lib/` berisi kode sumber aplikasi.
- `tabungku/test/` berisi berkas pengujian Flutter.
- `tabungku/screenshots/` berisi dokumentasi visual aplikasi.
- `tabungku/pubspec.yaml` berisi konfigurasi proyek dan dependensi.

## Fitur yang Dikembangkan

### Fitur Utama

1. Manajemen kegiatan: tambah, lihat, ubah, hapus, dan ubah status.
2. Validasi formulir kegiatan dan transaksi.
3. Penyimpanan data menggunakan SQLite.
4. Ringkasan pemasukan, pengeluaran, dan tabungan bersih.
5. Laporan pengeluaran per kategori dan rekap tujuh hari.
6. Target tabungan dengan indikator progres animasi.
7. Penyimpanan pengaturan tema dan target menggunakan SharedPreferences.
8. Navigasi tiga tab utama dan formulir melalui named route.

### Fitur Tambahan

1. Pencarian kegiatan berdasarkan judul atau kategori.
2. Filter kegiatan berdasarkan status penyelesaian.
3. Ekspor data kegiatan menjadi file CSV.
4. Animasi progres target tabungan.
5. Kustomisasi warna tema dan mode terang/gelap.

## Teknologi yang Digunakan

| Teknologi | Fungsi |
|---|---|
| Flutter | Pengembangan antarmuka dan aplikasi mobile |
| Dart | Bahasa pemrograman |
| Material 3 | Desain komponen antarmuka |
| SQLite | Penyimpanan data kegiatan |
| `sqflite` | Integrasi SQLite |
| `shared_preferences` | Penyimpanan pengaturan pengguna |
| `path_provider` | Mendapatkan direktori penyimpanan sementara |
| `share_plus` | Membuka menu berbagi file |
| CSV | Format ekspor laporan |

## Cara Menjalankan Proyek

Pastikan Flutter SDK sudah terpasang dan perangkat atau emulator tersedia.

Masuk ke direktori proyek:

```bash
cd pertemuan-7/tugas/tabungku
```

Pasang dependensi:

```bash
flutter pub get
```

Periksa kode:

```bash
flutter analyze
```

Jalankan pengujian otomatis:

```bash
flutter test
```

Jalankan aplikasi:

```bash
flutter devices
flutter run
```

Jika proyek sudah tersedia secara lokal, tidak perlu melakukan clone ulang. Cukup buka terminal pada folder proyek `tabungku`.

## Pengujian Fungsional

Berdasarkan pengujian manual yang dilakukan, 12 skenario berikut dinyatakan lulus.

| No. | Skenario | Hasil |
|---:|---|---|
| 1 | Tambah kegiatan | Lulus |
| 2 | Validasi formulir | Lulus |
| 3 | Edit dan hapus kegiatan | Lulus |
| 4 | Perubahan status kegiatan | Lulus |
| 5 | Pencarian dan filter | Lulus |
| 6 | Ringkasan keuangan | Lulus |
| 7 | Laporan keuangan | Lulus |
| 8 | Ekspor CSV | Lulus |
| 9 | Target tabungan | Lulus |
| 10 | Pengaturan tema | Lulus |
| 11 | Persistensi SQLite | Lulus |
| 12 | Navigasi aplikasi | Lulus |

Hasil tersebut merupakan pengujian manual. Status pemeriksaan otomatis tetap mengikuti hasil terbaru dari `flutter analyze` dan `flutter test`.

## Dokumentasi Proyek

Dokumentasi lengkap aplikasi, termasuk screenshot antarmuka dan penjelasan penggunaan, tersedia di:

**[README aplikasi TabungKu](tabungku/README.md)**

Screenshot aplikasi disimpan dalam folder `tabungku/screenshots/`.

## Kesimpulan

Tugas Pertemuan 7 menghasilkan aplikasi TabungKu yang mengintegrasikan pengelolaan kegiatan dan pencatatan keuangan dengan penyimpanan lokal. Aplikasi dilengkapi laporan keuangan, target tabungan, kustomisasi tampilan, pencarian, filter, dan ekspor CSV.

Dokumentasi pada folder ini berfungsi sebagai pengantar pengerjaan tugas, sedangkan README di dalam folder `tabungku/` menjadi dokumentasi teknis dan penggunaan aplikasi secara lengkap.
