# Tugas Pertemuan 5 — Pencatat Pengeluaran

## Deskripsi

Tugas Pertemuan 5 adalah membuat aplikasi **Pencatat Pengeluaran** menggunakan Flutter.

Aplikasi ini digunakan untuk mencatat, menampilkan, mengubah, dan menghapus data pengeluaran sehari-hari. Penyimpanan data dilakukan secara lokal menggunakan SQLite, sedangkan SharedPreferences digunakan untuk menyimpan pengaturan sederhana aplikasi.

Melalui tugas ini, mahasiswa menerapkan konsep penyimpanan lokal pada pengembangan aplikasi mobile.

## Konsep yang Dipelajari

Aplikasi menerapkan beberapa konsep berikut:

- SQLite sebagai database lokal.
- SharedPreferences untuk menyimpan pengaturan.
- Operasi CRUD (*Create, Read, Update, Delete*).
- Model data.
- Form input dan validasi.
- Dropdown kategori.
- Pemilihan tanggal.
- Pengambilan dan pengelolaan data secara asynchronous.
- Perhitungan total pengeluaran.
- Filter data berdasarkan kategori.
- Persistensi data setelah aplikasi ditutup dan dibuka kembali.

## Ketentuan Tugas

### 1. Pengelolaan Data Pengeluaran

Aplikasi menyediakan fitur untuk:

- Menambahkan data pengeluaran.
- Menampilkan daftar pengeluaran.
- Mengubah data pengeluaran.
- Menghapus data pengeluaran.

### 2. Struktur Data

Data pengeluaran disimpan dalam tabel `pengeluaran` dengan kolom:

| Kolom | Keterangan |
|---|---|
| `id` | Identitas unik pengeluaran |
| `nama` | Nama atau keterangan pengeluaran |
| `jumlah` | Nominal pengeluaran |
| `kategori` | Kategori pengeluaran |
| `tanggal` | Tanggal transaksi |

### 3. Validasi Formulir

Formulir pengeluaran harus memastikan bahwa:

- Nama pengeluaran wajib diisi.
- Jumlah pengeluaran harus berupa bilangan bulat.
- Jumlah pengeluaran harus lebih dari 0.
- Kategori pengeluaran dipilih dari pilihan yang tersedia.

### 4. Total dan Filter Pengeluaran

Aplikasi menampilkan total pengeluaran berdasarkan data yang ditampilkan dan menyediakan filter untuk membantu pengguna melihat pengeluaran berdasarkan kategori.

### 5. Penyimpanan Pengaturan

Aplikasi menggunakan SharedPreferences untuk menyimpan pengaturan sederhana, yaitu mode tampilan gelap.

### 6. Persistensi Data

Data pengeluaran disimpan menggunakan SQLite sehingga tetap tersedia ketika aplikasi ditutup dan dibuka kembali.

## Pengumpulan

Dokumentasi dan berkas tugas yang disiapkan meliputi:

- Screenshot halaman utama.
- Screenshot formulir tambah pengeluaran.
- Screenshot pemilihan kategori dan tanggal.
- Screenshot data setelah diperbarui.
- Screenshot fitur ubah dan hapus.
- Screenshot filter kategori.
- Screenshot mode gelap.
- Screenshot pengujian setelah aplikasi direstart.
- Source code aplikasi Flutter.
- README dokumentasi project.
- Tautan repository GitHub.

## Struktur Tugas

```text id="d9r1"
tugas/
├── README.md
└── pencatat_pengeluaran/
    ├── README.md
    ├── screenshots/
    ├── lib/
    │   └── main.dart
    ├── pubspec.yaml
    └── ...
```

## Identitas

**Nama:** Ilham Firmansyah  
**NIM:** 20240801102  
**Jurusan:** Teknik Informatika  
**Mata Kuliah:** Pemrograman Mobile  
**Pertemuan:** 5

## Status

- [ ] Project Flutter dibuat.
- [ ] Database SQLite dibuat.
- [ ] Model data pengeluaran dibuat.
- [ ] Fitur tambah pengeluaran dibuat.
- [ ] Daftar pengeluaran ditampilkan.
- [ ] Fitur ubah pengeluaran dibuat.
- [ ] Fitur hapus pengeluaran dibuat.
- [ ] Validasi formulir diterapkan.
- [ ] Kategori pengeluaran diterapkan.
- [ ] Pemilihan tanggal diterapkan.
- [ ] Total pengeluaran ditampilkan.
- [ ] Filter kategori diterapkan.
- [ ] SharedPreferences digunakan untuk menyimpan pengaturan.
- [ ] Mode gelap diterapkan.
- [ ] Persistensi data setelah aplikasi direstart diuji.
- [ ] Screenshot dokumentasi ditambahkan.
- [ ] README dan source code disiapkan untuk pengumpulan.
