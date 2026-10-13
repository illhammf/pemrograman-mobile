# Tugas Pertemuan 5 — Pencatat Pengeluaran

## Deskripsi

Pencatat Pengeluaran adalah aplikasi Flutter untuk mencatat dan mengelola pengeluaran sehari-hari. Aplikasi menggunakan SQLite untuk menyimpan data transaksi secara lokal dan SharedPreferences untuk menyimpan pilihan mode gelap.

## Fitur Aplikasi

1. **Daftar pengeluaran:** menampilkan nama, jumlah, kategori, dan tanggal transaksi.
2. **Tambah pengeluaran:** memasukkan data transaksi melalui form.
3. **Ubah pengeluaran:** mengedit transaksi yang sudah tersimpan.
4. **Hapus pengeluaran:** menghapus transaksi setelah konfirmasi.
5. **Validasi form:** nama wajib diisi dan jumlah harus berupa angka bulat lebih dari nol.
6. **Dropdown kategori:** Makanan, Transportasi, Belanja, Pendidikan, Tagihan, dan Lainnya.
7. **Total pengeluaran:** menghitung jumlah seluruh transaksi pada daftar atau kategori yang sedang dipilih.
8. **Filter kategori:** menyaring transaksi berdasarkan kategori.
9. **Format Rupiah:** menampilkan jumlah dengan pemisah ribuan.
10. **Mode gelap:** pilihan tema disimpan menggunakan SharedPreferences.
11. **Penyimpanan permanen:** transaksi tetap tersedia setelah aplikasi ditutup dan dibuka kembali.

## Teknologi

- Flutter
- Dart
- SQLite menggunakan paket `sqflite`
- Paket `path`
- SharedPreferences

## Struktur Proyek

```text
pencatat_pengeluaran/
├── lib/
│   └── main.dart
├── screenshots/
│   ├── 01-halaman-utama.png
│   ├── 02-form-tambah.png
│   ├── 03-validasi-form.png
│   ├── 04-daftar-pengeluaran.png
│   ├── 05-form-ubah.png
│   ├── 06-konfirmasi-hapus.png
│   ├── 07-filter-kategori.png
│   ├── 08-mode-gelap.png
│   └── 09-data-setelah-restart.png
├── pubspec.yaml
└── README.md
```

## Cara Menjalankan

Dari folder proyek, jalankan:

```bash
flutter pub get
flutter run
```

Gunakan emulator atau perangkat Android untuk menjalankan aplikasi.

## Struktur Database

Tabel `pengeluaran` mempunyai kolom:

| Kolom | Tipe | Keterangan |
|---|---|---|
| id | INTEGER | Primary key, bertambah otomatis |
| nama | TEXT | Nama pengeluaran |
| jumlah | INTEGER | Jumlah dalam Rupiah |
| kategori | TEXT | Kategori pengeluaran |
| tanggal | TEXT | Tanggal transaksi |

Database disimpan dengan nama `pencatat_pengeluaran.db`.

## Pengujian

- Tambahkan beberapa pengeluaran dengan kategori berbeda.
- Pastikan nama kosong ditolak.
- Pastikan jumlah kosong, bukan angka, nol, atau angka negatif ditolak.
- Ubah salah satu transaksi dan periksa hasilnya.
- Hapus transaksi dan uji tombol Batal serta Hapus.
- Periksa total pengeluaran dan filter kategori.
- Aktifkan mode gelap, tutup aplikasi, lalu buka kembali untuk memastikan pengaturan tersimpan.
- Tutup aplikasi sepenuhnya, buka kembali, lalu pastikan transaksi masih ada.

## Kesimpulan

Aplikasi ini menerapkan CRUD menggunakan SQLite, validasi input, perhitungan total pengeluaran, filter kategori, serta penyimpanan pengaturan sederhana menggunakan SharedPreferences. Data transaksi disimpan secara lokal agar tetap tersedia setelah aplikasi ditutup.
