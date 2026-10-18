# Tugas Pertemuan 6 — Galeri/Katalog Interaktif

## 1. Deskripsi

Galeri/Katalog Interaktif adalah aplikasi mobile berbasis Flutter yang menampilkan koleksi destinasi wisata dalam beberapa kategori.

Aplikasi ini dibuat untuk menerapkan materi Pertemuan 6, yaitu tema aplikasi, named routes, navigasi tab, animasi Hero, animasi implisit, animasi eksplisit, serta penyimpanan pengaturan menggunakan SharedPreferences.

Pengguna dapat melihat daftar destinasi, membuka halaman detail, menelusuri kategori, dan mengubah tampilan aplikasi sesuai preferensi.

## 2. Tujuan

- Memahami penggunaan `NavigationBar` dan `IndexedStack`.
- Menerapkan named routes dan argumen untuk halaman detail.
- Membuat transisi `Hero` antara daftar dan detail.
- Menggunakan animasi implisit dan eksplisit.
- Mengatur tema terang/gelap.
- Menyediakan minimal tiga pilihan warna tema.
- Menyimpan pengaturan tema menggunakan SharedPreferences.
- Menggunakan `Theme.of(context)` untuk konsistensi tampilan.

## 3. Fitur Aplikasi

### Beranda

Menampilkan daftar destinasi wisata, seperti pantai, pegunungan, museum, taman kota, air terjun, dan cagar budaya.

### Kategori

Mengelompokkan destinasi berdasarkan kategori. Pengguna dapat membuka kelompok kategori untuk melihat destinasi yang tersedia.

### Pengaturan

Menyediakan pilihan tema terang/gelap dan warna tema. Pengaturan disimpan secara lokal sehingga dapat dimuat kembali saat aplikasi dibuka.

### Halaman Detail

Menampilkan nama, kategori, deskripsi, dan informasi lokasi destinasi yang dipilih. Halaman dibuka melalui named routes dan menggunakan Hero untuk transisi ikon.

### Animasi

Aplikasi menerapkan `AnimatedContainer` pada bagian beranda serta transisi `Hero` pada halaman detail.

## 4. Teknologi

- Flutter
- Dart
- Material 3
- SharedPreferences
- Navigator dan named routes
- NavigationBar dan IndexedStack
- AnimatedContainer dan Hero

## 5. Cara Menjalankan

Pastikan Flutter SDK tersedia dan perangkat atau emulator telah terhubung.

Jalankan dari direktori project:

```bash
flutter pub get
flutter run
```

## 6. Struktur Project

```text
galeri_katalog/
├── README.md
├── screenshots/
├── lib/
│   └── main.dart
├── pubspec.yaml
└── ...
```

## 7. Pengujian

- [ ] Aplikasi dapat dijalankan.
- [ ] Minimal tiga tab tersedia.
- [ ] Destinasi dapat dibuka ke halaman detail.
- [ ] Argumen rute menampilkan destinasi yang benar.
- [ ] Transisi Hero berfungsi.
- [ ] Animasi implisit berfungsi.
- [ ] Animasi eksplisit tersedia pada implementasi aplikasi.
- [ ] Tema terang dan gelap berfungsi.
- [ ] Minimal tiga pilihan warna tersedia.
- [ ] Pengaturan tetap tersimpan setelah aplikasi direstart.
- [ ] Warna dan gaya teks mengikuti tema aplikasi.

## 8. Dokumentasi Screenshot

Simpan screenshot hasil pengujian pada folder `screenshots/`:

- `01-beranda-tema-terang.png`
- `02-beranda-tema-gelap.png`
- `03-halaman-detail-hero.png`
- `04-halaman-kategori.png`
- `05-pengaturan-warna.png`
- `06-tema-setelah-restart.png`

Screenshot harus berasal dari aplikasi yang benar-benar dijalankan.

## 9. Kesimpulan

Aplikasi Galeri/Katalog Interaktif menggabungkan tema, navigasi, animasi, dan penyimpanan pengaturan dalam satu project Flutter.

Melalui aplikasi ini, mahasiswa dapat mempraktikkan konsep yang dipelajari pada Pertemuan 6 dan mengembangkannya lebih lanjut untuk mini proyek pada pertemuan berikutnya.
