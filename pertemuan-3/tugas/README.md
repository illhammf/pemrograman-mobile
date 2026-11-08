# Tugas Pertemuan 3 — Pemrograman Mobile

Folder ini berisi kumpulan tugas Flutter pada Pertemuan 3 mata kuliah **Pemrograman Mobile**. Terdapat dua proyek aplikasi yang dibuat untuk menerapkan materi pengembangan antarmuka, pengolahan input, validasi form, navigasi, dan pengelolaan state pada Flutter.

## Daftar Proyek

### 1. Daftar Belanja

**Folder:** `daftar_belanja/`

Aplikasi Daftar Belanja merupakan aplikasi sederhana untuk mengelola daftar barang yang ingin dibeli.

Materi dan fitur yang diterapkan:

- Form input nama barang dan jumlah.
- Dropdown untuk memilih kategori barang.
- Validasi input menggunakan `TextFormField`.
- Menampilkan daftar barang menggunakan `ListView.builder`.
- Checkbox untuk menandai barang yang sudah dibeli.
- Menghapus barang dari daftar.
- Menampilkan jumlah barang yang belum dibeli.
- Mengelola state menggunakan `ChangeNotifier`.
- Menggunakan Provider sebagai state management.
- Menerapkan `context.watch` dan `context.read`.
- Navigasi antara halaman daftar dan halaman form.

**Teknologi:** Flutter, Dart, dan Provider.

Dokumentasi lebih lanjut dapat dilihat pada [README Daftar Belanja](daftar_belanja/README.md).

---

### 2. TabungKu Layout

**Folder:** `tabungku_layout/`

TabungKu Layout merupakan rancangan antarmuka aplikasi tabungan yang menampilkan ringkasan saldo dan riwayat transaksi dalam satu halaman.

Proyek ini dibuat untuk menerapkan materi penyusunan layout menggunakan widget dasar Flutter.

Materi dan komponen yang diterapkan:

- `MaterialApp` sebagai komponen utama aplikasi.
- `Scaffold` untuk struktur dasar halaman.
- `AppBar` untuk menampilkan judul halaman.
- `Container` untuk membuat kartu ringkasan tabungan.
- `Card` untuk menampilkan item transaksi.
- `Column` dan `Row` untuk mengatur susunan elemen.
- `Padding` dan `SizedBox` untuk mengatur jarak.
- `Expanded` untuk mengatur pembagian ruang.
- `Text` dan `Icon` untuk menampilkan informasi visual.
- `ListView` untuk menampilkan riwayat transaksi.
- `LinearProgressIndicator` untuk menampilkan progres tabungan.
- Penyesuaian tampilan pada ukuran layar ponsel dan simulasi tablet.

Data transaksi menggunakan data statis (*hard-coded*) sesuai ketentuan tugas.

**Teknologi:** Flutter dan Dart.

Dokumentasi lebih lanjut dapat dilihat pada [README TabungKu Layout](tabungku_layout/README.md).

## Struktur Direktori

```text
tugas/
├── README.md
│
├── daftar_belanja/
│   ├── README.md
│   ├── images/
│   ├── lib/
│   │   └── main.dart
│   ├── test/
│   ├── pubspec.yaml
│   └── ...
│
└── tabungku_layout/
    ├── README.md
    ├── docs/
    │   ├── layar_ponsel_portrait.png
    │   └── layar_tablet.png
    ├── lib/
    │   └── main.dart
    ├── test/
    ├── pubspec.yaml
    └── ...
```

## Identitas

| Keterangan | Informasi |
|---|---|
| Nama | Ilham Firmansyah |
| NIM | 20240801102 |
| Jurusan | Teknik Informatika |
| Mata Kuliah | CIE511 – Pemrograman Mobile |
| Pertemuan | 3 |

## Ringkasan Materi yang Diterapkan

| No. | Proyek | Materi Utama |
|---|---|---|
| 1 | Daftar Belanja | Form Input, Validasi, Dropdown, ListView, Checkbox, Navigasi, Provider, dan ChangeNotifier |
| 2 | TabungKu Layout | Widget Dasar Flutter, Widget Tree, Row, Column, Card, Container, Expanded, dan Responsive Layout |

## Status Pengerjaan

### Daftar Belanja

- [x] Project Flutter dibuat.
- [x] Form Tambah dibuat.
- [x] Validasi input diterapkan.
- [x] Dropdown kategori dibuat.
- [x] Halaman Daftar dibuat.
- [x] Checkbox status pembelian diterapkan.
- [x] Fitur hapus barang dibuat.
- [x] `ChangeNotifier` digunakan.
- [x] Provider digunakan.
- [x] Jumlah barang belum dibeli ditampilkan pada AppBar.
- [x] Dokumentasi proyek dibuat.

### TabungKu Layout

- [x] Project Flutter dibuat.
- [x] Halaman Ringkasan Tabungan dibuat.
- [x] AppBar dan kartu ringkasan dibuat.
- [x] Menu cepat ditampilkan.
- [x] Riwayat transaksi ditampilkan.
- [x] Widget dasar Flutter diterapkan.
- [x] Tata letak disesuaikan untuk layar ponsel.
- [x] Pengujian tampilan ukuran tablet dilakukan melalui simulasi resolusi.
- [x] Screenshot ponsel dan tablet ditambahkan.
- [x] `flutter analyze` berhasil tanpa masalah.
- [x] `flutter test` berhasil.
- [x] Dokumentasi proyek dibuat.

## Kesimpulan

Kedua proyek pada Pertemuan 3 dibuat untuk menerapkan materi dasar pengembangan aplikasi mobile menggunakan Flutter.

Proyek Daftar Belanja berfokus pada pengolahan input, validasi form, navigasi, dan state management menggunakan Provider. Sementara itu, TabungKu Layout berfokus pada penyusunan antarmuka menggunakan widget dasar Flutter serta penyesuaian tata letak pada ukuran layar yang berbeda.

Dengan adanya kedua proyek ini, materi Pertemuan 3 diterapkan melalui dua bentuk pengembangan aplikasi yang berbeda, yaitu pengelolaan data sederhana dan perancangan antarmuka aplikasi.

---

**Repository:** [pemrograman-mobile](https://github.com/illhammf/pemrograman-mobile)

**Lokasi:** `pertemuan-3/tugas/`