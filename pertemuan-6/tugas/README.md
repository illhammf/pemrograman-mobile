# Pertemuan 6 — Tugas Galeri Katalog Interaktif

## Deskripsi Tugas

Galeri Katalog Interaktif merupakan aplikasi berbasis Flutter yang menampilkan kumpulan informasi dalam bentuk katalog. Aplikasi ini dibuat untuk menerapkan materi navigasi halaman, pengelolaan tema, serta animasi pada aplikasi mobile.

Pengguna dapat menjelajahi berbagai destinasi, melihat kategori, membuka halaman detail, dan mengubah tampilan aplikasi sesuai preferensi.

## Tujuan

1. Menerapkan navigasi menggunakan `NavigationBar`.
2. Menggunakan `IndexedStack` untuk berpindah antartab.
3. Menerapkan named routes dan mengirim argumen ke halaman detail.
4. Menggunakan widget `Hero` untuk transisi antarhalaman.
5. Menerapkan animasi implisit dan animasi eksplisit.
6. Mengimplementasikan tema terang dan gelap.
7. Menyediakan beberapa pilihan warna tema.
8. Menyimpan pengaturan tema agar tetap digunakan setelah aplikasi dibuka kembali.

## Fitur Aplikasi

- **Beranda:** Menampilkan informasi dan daftar destinasi.
- **Kategori:** Menampilkan destinasi berdasarkan kategori.
- **Pengaturan:** Mengatur mode terang, mode gelap, dan warna tema.
- **Halaman Detail:** Menampilkan informasi destinasi yang dipilih.
- **Navigasi:** Menggunakan `NavigationBar`, `IndexedStack`, dan named routes.
- **Animasi:** Menggunakan `Hero` serta animasi implisit dan eksplisit.
- **Penyimpanan Preferensi:** Menggunakan SharedPreferences untuk menyimpan pilihan tema.

## Teknologi

- Flutter
- Bahasa pemrograman Dart
- Material Design 3
- SharedPreferences

## Struktur Folder

```text
pertemuan-6/
├── doc-tugas/
├── praktikum/
└── tugas/
    ├── README.md
    └── galeri_katalog/
        ├── lib/
        │   └── main.dart
        ├── screenshots/
        ├── android/
        ├── ios/
        ├── pubspec.yaml
        ├── pubspec.lock
        └── README.md
```

## Cara Menjalankan Aplikasi

Masuk ke direktori proyek:

```bash
cd pertemuan-6/tugas/galeri_katalog
```

Unduh dependensi:

```bash
flutter pub get
```

Jalankan aplikasi:

```bash
flutter run
```

## Pengujian

- [ ] Aplikasi dapat dijalankan tanpa error.
- [ ] Tab Beranda, Kategori, dan Pengaturan dapat digunakan.
- [ ] Halaman detail menampilkan destinasi yang dipilih.
- [ ] Transisi Hero berjalan dengan benar.
- [ ] Animasi implisit berjalan.
- [ ] Animasi eksplisit berjalan.
- [ ] Mode terang dan gelap dapat dipilih.
- [ ] Warna tema dapat diubah.
- [ ] Pengaturan tema tetap tersimpan setelah aplikasi dibuka kembali.

## Screenshot

Simpan bukti tampilan aplikasi di folder `galeri_katalog/screenshots/`.

1. `01-beranda-tema-terang.png`
2. `02-beranda-tema-gelap.png`
3. `03-halaman-detail-hero.png`
4. `04-halaman-kategori.png`
5. `05-pengaturan-warna.png`
6. `06-tema-setelah-restart.png`

## Identitas

- **Nama:** Ilham Firmansyah
- **NIM:** 20240801102
- **Jurusan:** Teknik Informatika
- **Mata Kuliah:** Pemrograman Mobile
- **Pertemuan:** 6

## Kesimpulan

Melalui tugas ini, mahasiswa diharapkan mampu menggabungkan navigasi, animasi, pengaturan tema, dan penyimpanan preferensi ke dalam sebuah aplikasi Flutter. <br> 
Aplikasi Galeri Katalog Interaktif menjadi penerapan materi Pertemuan 6 dalam bentuk proyek yang dapat dijalankan dan diuji secara langsung.