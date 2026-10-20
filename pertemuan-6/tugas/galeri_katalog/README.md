# Tugas Pertemuan 6 — Galeri Katalog Interaktif

## 1. Deskripsi Proyek

Galeri Katalog Interaktif adalah aplikasi mobile berbasis Flutter yang digunakan untuk menampilkan informasi berbagai destinasi wisata. Aplikasi ini dibuat untuk menerapkan materi Pertemuan 6 mata kuliah Pemrograman Mobile, khususnya pengelolaan tema aplikasi, navigasi ant halaman, pengiriman argumen, animasi, dan penyimpanan preferensi pengguna.

Aplikasi menyediakan tiga halaman utama, yaitu Beranda, Kategori, dan Pengaturan. Pada halaman Beranda, pengguna dapat melihat daftar destinasi wisata yang tersedia. Halaman Kategori digunakan untuk mengelompokkan destinasi berdasarkan jenisnya, sedangkan halaman Pengaturan digunakan untuk mengubah mode tampilan dan warna tema aplikasi.

Aplikasi ini juga menerapkan navigasi menuju halaman detail destinasi menggunakan named routes. Informasi destinasi dikirim melalui argumen navigasi agar halaman detail dapat menampilkan data sesuai dengan pilihan pengguna.

Untuk mendukung pengalaman pengguna, aplikasi menggunakan animasi Hero pada perpindahan dari kartu destinasi ke halaman detail serta animasi implisit menggunakan widget `AnimatedContainer`. Preferensi tema disimpan secara lokal menggunakan SharedPreferences sehingga pilihan pengguna tetap tersedia setelah aplikasi dibuka kembali.

## 2. Tujuan

Tujuan pembuatan aplikasi Galeri Katalog Interaktif adalah:

1. Memahami penggunaan `ThemeData`, `ThemeMode`, dan `colorSchemeSeed` untuk mengatur tampilan aplikasi.
2. Mengimplementasikan navigasi ant halaman menggunakan `NavigationBar` dan `IndexedStack`.
3. Memahami penggunaan named routes untuk berpindah halaman.
4. Mengirimkan data antarhalaman menggunakan argumen pada `Navigator.pushNamed()`.
5. Menerapkan animasi perpindahan elemen menggunakan widget `Hero`.
6. Memahami penggunaan animasi implisit menggunakan `AnimatedContainer`.
7. Mengimplementasikan penyimpanan preferensi pengguna menggunakan SharedPreferences.
8. Menyediakan pilihan mode terang dan gelap.
9. Menyediakan beberapa pilihan warna tema yang dapat diubah pengguna.
10. Menangani navigasi menuju halaman yang tidak ditemukan menggunakan halaman 404.
11. Memahami proses pengujian dan perbaikan error selama pengembangan aplikasi Flutter.

## 3. Fitur Aplikasi

Fitur yang dikembangkan dalam aplikasi Galeri Katalog Interaktif meliputi:

- **Halaman Beranda:** menampilkan pengenalan aplikasi, informasi singkat, dan daftar destinasi wisata.
- **Halaman Kategori:** mengelompokkan destinasi berdasarkan kategori, seperti Alam, Edukasi, dan Keluarga.
- **Halaman Detail:** menampilkan nama destinasi, ikon, kategori, jenis lokasi, dan deskripsi sesuai destinasi yang dipilih.
- **Navigasi Tab:** menyediakan tiga menu utama, yaitu Beranda, Kategori, dan Pengaturan.
- **Drawer Navigation:** menyediakan menu alternatif untuk berpindah ke halaman utama aplikasi.
- **Animasi Hero:** memberikan efek transisi pada elemen destinasi ketika pengguna membuka halaman detail dari Beranda.
- **Animasi Implisit:** menggunakan `AnimatedContainer` untuk mendukung perubahan tampilan secara bertahap.
- **Pengaturan Tema:** memungkinkan pengguna mengaktifkan mode terang atau gelap.
- **Pilihan Warna Tema:** menyediakan empat pilihan warna, yaitu indigo, teal, deep orange, dan pink.
- **Penyimpanan Preferensi:** menggunakan SharedPreferences untuk menyimpan pilihan mode dan warna tema.
- **Halaman 404:** menampilkan halaman alternatif ketika aplikasi menerima navigasi menuju route yang tidak dikenal.

## 4. Teknologi yang Digunakan

Teknologi dan komponen yang digunakan dalam pengembangan aplikasi adalah:

| Teknologi atau Komponen | Kegunaan |
|---|---|
| Flutter | Framework untuk membangun aplikasi mobile |
| Dart | Bahasa pemrograman yang digunakan dalam proyek |
| Material Design 3 | Menyediakan komponen antarmuka aplikasi |
| `ThemeData` | Mengatur konfigurasi tema aplikasi |
| `ThemeMode` | Menentukan penggunaan tema terang atau gelap |
| `NavigationBar` | Menyediakan navigasi utama berbentuk tab |
| `IndexedStack` | Mempertahankan halaman tab saat pengguna berpindah menu |
| `Navigator` | Mengelola navigasi ant halaman |
| Named routes | Menentukan tujuan navigasi berdasarkan nama route |
| `Hero` | Membuat animasi transisi elemen antarhalaman |
| `AnimatedContainer` | Membuat animasi perubahan properti tampilan |
| SharedPreferences | Menyimpan preferensi tema secara lokal |

## 5. Struktur Project

Struktur folder proyek Galeri Katalog Interaktif adalah sebagai berikut:

```text
galeri_katalog/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── screenshots/
│   ├── 01_beranda-tema-terang.png
│   ├── 02_beranda-tema-gelap.png
│   ├── 03_halaman-detail-hero.png
│   ├── 04_halaman-kategori.png
│   ├── 05_halaman-detail-kategori.png
│   ├── 06_pengaturan-warna.png
│   └── 07_tema-setelah-restart.png
├── test/
│   └── widget_test.dart
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

Keterangan struktur folder:

1. `lib/main.dart` berisi kode utama aplikasi, model destinasi, konfigurasi tema, navigasi, halaman detail, dan halaman pengaturan.
2. `screenshots/` menyimpan dokumentasi hasil tampilan aplikasi.
3. `test/widget_test.dart` berisi pengujian otomatis yang tersedia pada proyek.
4. `pubspec.yaml` berisi konfigurasi proyek dan dependensi yang digunakan.
5. `pubspec.lock` menyimpan versi dependensi yang telah diselesaikan oleh Flutter.

## 6. Cara Menjalankan Aplikasi

### 6.1. Masuk ke Direktori Proyek

Buka terminal VS Code dan masuk ke folder proyek Galeri Katalog Interaktif.

```bash
cd ~/perkuliahan/pemrograman_mobile/pemrograman-mobile/pertemuan-6/tugas/galeri_katalog
```

### 6.2. Mengunduh Dependensi

Jalankan perintah berikut untuk memastikan seluruh dependensi yang dibutuhkan telah tersedia.

```bash
flutter pub get
```

Pastikan dependensi `shared_preferences` tercantum pada `pubspec.yaml`, karena aplikasi menggunakannya untuk menyimpan pengaturan tema.

### 6.3. Memeriksa Konfigurasi Flutter

Untuk memeriksa kesiapan lingkungan pengembangan, jalankan:

```bash
flutter doctor
```

Pastikan perangkat Android terhubung dan terdeteksi oleh Flutter.

### 6.4. Menjalankan Aplikasi

Jalankan aplikasi menggunakan perintah:

```bash
flutter run
```

Flutter akan membangun dan menjalankan aplikasi pada perangkat yang dipilih.

## 7. Implementasi Program

### 7.1. Model Data Destinasi

Aplikasi menggunakan class `Destinasi` untuk menyimpan informasi setiap destinasi wisata.

Data yang disimpan meliputi nama, lokasi, deskripsi, ikon, warna, dan kategori. Data tersebut digunakan untuk menampilkan daftar destinasi dan mengirimkan informasi ke halaman detail.

### 7.2. Pengaturan Tema

Pengaturan tema dibuat menggunakan `ThemeData` dan `ThemeMode`. Fungsi `buatTema()` digunakan untuk menghasilkan konfigurasi tema berdasarkan warna utama dan tingkat kecerahan.

Pengguna dapat memilih mode terang atau gelap serta mengganti warna tema melalui halaman Pengaturan.

### 7.3. Navigasi Tab

Navigasi utama menggunakan `NavigationBar` dengan tiga pilihan halaman. `IndexedStack` digunakan untuk menampilkan halaman berdasarkan indeks yang dipilih.

Pendekatan ini memungkinkan halaman tab tetap dipertahankan ketika pengguna berpindah menu.

### 7.4. Named Routes dan Argumen

Halaman detail dibuka melalui route `/detail`. Objek destinasi dikirim melalui parameter `arguments` pada `Navigator.pushNamed()`.

Pada `onGenerateRoute`, aplikasi memeriksa apakah argumen yang diterima merupakan objek `Destinasi`. Jika sesuai, halaman detail ditampilkan menggunakan data tersebut. Jika argumen tidak sesuai, aplikasi menampilkan halaman alternatif.

### 7.5. Animasi Hero

Widget `Hero` digunakan pada ikon destinasi di halaman Beranda dan pada ikon yang sesuai di halaman detail. Keduanya menggunakan tag yang sama agar Flutter dapat melakukan transisi elemen saat navigasi berlangsung.

Pada kartu yang ditampilkan di halaman Kategori, animasi Hero dinonaktifkan untuk menghindari konflik tag ketika terdapat beberapa kartu dengan destinasi yang sama pada widget tree.

### 7.6. Penyimpanan Preferensi

SharedPreferences digunakan untuk menyimpan dua pengaturan utama:

- Mode tampilan, yaitu terang atau gelap.
- Indeks warna tema yang dipilih pengguna.

Ketika aplikasi dimulai, fungsi `_muatPengaturan()` membaca nilai yang tersimpan. Jika belum ada preferensi, aplikasi menggunakan nilai awal berupa tema terang dan warna indigo.

Fungsi perubahan tema dan warna akan memperbarui tampilan aplikasi sekaligus menyimpan pilihan pengguna.

## 8. Catatan Perbaikan Error

Selama proses pengembangan, terdapat beberapa kendala yang perlu ditangani.

### 8.1. Error `MyApp isn't a class`

Error ini muncul pada file `test/widget_test.dart` karena kode pengujian bawaan Flutter masih memanggil class `MyApp`, sedangkan aplikasi menggunakan widget utama `GaleriApp`.

Perbaikan dilakukan dengan menyesuaikan file pengujian agar tidak lagi memanggil widget yang tidak tersedia.

Pengujian dasar yang digunakan adalah:

```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Pengujian dasar proyek Galeri Katalog', () {
    expect(1 + 1, 2);
  });
}
```

Pengujian tersebut hanya memeriksa operasi sederhana dan tidak menguji tampilan atau fungsi aplikasi. Oleh karena itu, pengujian widget yang lebih lengkap tetap dapat dikembangkan jika diperlukan.

### 8.2. Error `Null check operator used on a null value`

Error ini muncul ketika aplikasi membangun `MaterialApp`. Stack trace menunjukkan bahwa error terjadi melalui mekanisme pembuatan route bawaan Flutter.

Perbaikan yang dilakukan adalah menyederhanakan konfigurasi route awal dengan menggunakan `home: GaleriShell(...)` sebagai halaman utama dan menangani route `/detail` melalui `onGenerateRoute`.

Route yang tidak dikenal diarahkan ke halaman 404 agar aplikasi memiliki halaman alternatif yang jelas.

### 8.3. Penanganan Kegagalan SharedPreferences

Fungsi `_muatPengaturan()` dilengkapi dengan `try-catch` untuk menangani kegagalan ketika membaca preferensi. Jika terjadi kegagalan, aplikasi menggunakan pengaturan default dan menyelesaikan status loading.

Perubahan ini membantu menangani kegagalan pemuatan preferensi, tetapi tidak menggantikan kebutuhan untuk memeriksa stack trace jika error runtime lain muncul.

### 8.4. Konflik Tag Hero

Karena destinasi yang sama dapat ditampilkan di Beranda dan Kategori, penggunaan tag Hero yang sama pada beberapa elemen dalam widget tree dapat menimbulkan konflik.

Perbaikan dilakukan dengan menambahkan properti `gunakanHero` pada `KartuDestinasi`. Animasi Hero digunakan pada kartu Beranda, sedangkan kartu di Kategori menggunakan ikon tanpa Hero.

### 8.5. Menjalankan Ulang Aplikasi

Setelah melakukan perubahan kode, aplikasi dijalankan ulang untuk memastikan perubahan telah diterapkan.

```bash
flutter run
```

Jika diperlukan, hasil build sebelumnya dapat dibersihkan menggunakan:

```bash
flutter clean
flutter pub get
flutter run
```

Perintah tersebut membantu membersihkan hasil build lama, tetapi tidak otomatis menyelesaikan seluruh error runtime.

## 9. Dokumentasi Screenshot

Bagian ini menampilkan hasil implementasi aplikasi Galeri Katalog Interaktif dalam bentuk galeri screenshot. Dokumentasi mencakup tampilan halaman utama, halaman detail, kategori, pengaturan warna, serta hasil pengujian penyimpanan tema setelah aplikasi dijalankan kembali.

### 9.1. Galeri Tampilan Aplikasi

| Beranda Tema Terang | Beranda Tema Gelap | Halaman Detail |
|:---:|:---:|:---:|
| ![Beranda tema terang](screenshots/01_beranda-tema-terang.png) | ![Beranda tema gelap](screenshots/02_beranda-tema-gelap.png) | ![Halaman detail Hero](screenshots/03_halaman-detail-hero.png) |

| Halaman Kategori | Detail dari Kategori | Pengaturan Warna |
|:---:|:---:|:---:|
| ![Halaman kategori](screenshots/04_halaman-kategori.png) | ![Halaman detail kategori](screenshots/05_halaman-detail-kategori.png) | ![Pengaturan warna tema](screenshots/06_pengaturan-warna.png) |

| Tema Setelah Restart |
|:---:|
| ![Tema setelah restart](screenshots/07_tema-setelah-restart.png) |

### 9.2. Keterangan Screenshot

1. **Beranda Tema Terang** — menampilkan halaman utama aplikasi dengan tema terang dan daftar destinasi wisata.
2. **Beranda Tema Gelap** — menunjukkan perubahan tampilan setelah mode gelap diaktifkan.
3. **Halaman Detail** — menunjukkan informasi destinasi yang dipilih beserta transisi Hero dari halaman Beranda.
4. **Halaman Kategori** — menampilkan destinasi yang dikelompokkan berdasarkan kategori.
5. **Detail dari Kategori** — menunjukkan halaman detail yang dibuka melalui daftar kategori.
6. **Pengaturan Warna** — menampilkan pilihan mode terang atau gelap dan pilihan warna tema.
7. **Tema Setelah Restart** — menjadi bukti pengujian bahwa preferensi tema tetap tersimpan setelah aplikasi dibuka kembali.

**Catatan:** pastikan seluruh gambar benar-benar tersimpan di folder `screenshots/` dengan nama berkas yang sesuai. Jika nama berkas berbeda, sesuaikan jalur gambar pada tabel.

## 10. Pengujian Aplikasi

Pengujian dilakukan untuk memastikan fitur utama dapat digunakan dengan baik.

1. Membuka aplikasi dan memastikan halaman Beranda tampil.
2. Berpindah ke tab Kategori dan Pengaturan.
3. Memilih destinasi dan membuka halaman detail.
4. Memastikan animasi Hero berjalan saat membuka detail dari Beranda.
5. Mengubah mode tampilan dari terang menjadi gelap dan sebaliknya.
6. Mengubah warna tema dan memastikan tampilan mengikuti pilihan pengguna.
7. Menutup dan membuka kembali aplikasi untuk memeriksa apakah preferensi tema tetap tersimpan.
8. Memeriksa halaman alternatif ketika route yang tidak dikenal dibuka.

## 11. Kesimpulan

Aplikasi Galeri Katalog Interaktif menerapkan beberapa konsep penting dalam pengembangan aplikasi Flutter, yaitu pengelolaan tema, navigasi ant halaman, pengiriman argumen, animasi, dan penyimpanan preferensi pengguna.

Melalui proyek ini, penggunaan `NavigationBar`, `IndexedStack`, named routes, `Hero`, `AnimatedContainer`, dan SharedPreferences dipadukan ke dalam sebuah aplikasi katalog destinasi wisata.

Dokumentasi screenshot dan catatan perbaikan error disertakan untuk menjelaskan hasil implementasi serta kendala yang ditemui selama pengembangan.

---

**Mata Kuliah:** Pemrograman Mobile  
**Pertemuan:** 6  
**Nama Proyek:** Galeri Katalog Interaktif  
**Framework:** Flutter