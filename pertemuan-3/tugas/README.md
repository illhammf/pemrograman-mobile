# Tugas Pertemuan 3 — Daftar Belanja

## Deskripsi

Tugas Pertemuan 3 adalah membuat aplikasi **Daftar Belanja** menggunakan Flutter.

Aplikasi menerapkan konsep:

- Form input.
- Validasi data.
- Dropdown.
- Checkbox.
- ListView.
- Navigasi antar halaman.
- `ChangeNotifier`.
- Provider.
- `context.watch`.
- `context.read`.

## Ketentuan Tugas

Berdasarkan modul Pertemuan 3, aplikasi harus memiliki dua bagian utama:

### 1. Halaman Form Tambah

Form harus menyediakan:

- Nama barang.
- Jumlah barang.
- Kategori barang.

Ketentuan validasi:

- Nama barang wajib diisi.
- Jumlah barang wajib diisi.
- Jumlah barang harus berupa angka.
- Jumlah barang harus lebih dari 0.
- Kategori wajib dipilih.
- Setiap input memiliki validasi.

### 2. Halaman Daftar

Halaman daftar harus:

- Menampilkan semua barang.
- Memungkinkan barang dicentang sebagai sudah dibeli.
- Memungkinkan barang dihapus.
- Menampilkan jumlah barang yang belum dibeli pada AppBar.

### 3. State Management

State aplikasi disimpan pada satu `ChangeNotifier` dan dibagikan kepada halaman menggunakan Provider.

### 4. Pengumpulan

Yang dikumpulkan:

- Screenshot halaman Form Tambah.
- Screenshot halaman Daftar.
- Screenshot yang menunjukkan pesan error validasi.
- Berkas `main.dart` atau tautan repository GitHub.

## Struktur Tugas

```text
tugas/
├── README.md
└── daftar_belanja/
    ├── README.md
    ├── images/
    ├── lib/
    │   └── main.dart
    └── ...
```

## Identitas

**Nama:** Ilham Firmansyah  
**NIM:** 20240801102  
**Jurusan:** Teknik Informatika  
**Mata Kuliah:** Pemrograman Mobile  
**Pertemuan:** 3

## Status

- [x] Project Flutter dibuat.
- [x] Form Tambah dibuat.
- [x] Validasi input dibuat.
- [x] Dropdown kategori dibuat.
- [x] Halaman Daftar dibuat.
- [x] Checkbox sudah dibeli dibuat.
- [x] Fitur hapus barang dibuat.
- [x] `ChangeNotifier` digunakan.
- [x] Provider digunakan.
- [x] Jumlah barang belum dibeli ditampilkan pada AppBar.
- [x] Screenshot final ditambahkan.