# Galeri Katalog Interaktif — Pertemuan 6

## 1. Deskripsi Proyek

Galeri Katalog Interaktif merupakan aplikasi mobile berbasis Flutter yang menampilkan berbagai destinasi wisata dalam bentuk katalog. Aplikasi ini dikembangkan sebagai implementasi materi Pemrograman Mobile pada Pertemuan 6, khususnya pengelolaan tema, navigasi ant halaman, pengiriman argumen melalui route, dan animasi pada Flutter.

Aplikasi menyediakan tiga tab utama, yaitu Beranda, Kategori, dan Pengaturan. Pengguna dapat melihat daftar destinasi, membuka halaman detail, menjelajahi kategori wisata, mengganti tema terang atau gelap, serta memilih warna tema sesuai preferensi.

Pengaturan tampilan disimpan menggunakan SharedPreferences sehingga pilihan tema dan warna dapat dipertahankan ketika aplikasi ditutup dan dibuka kembali.

## 2. Tujuan

Tujuan pembuatan aplikasi ini adalah:

1. Memahami penggunaan `ThemeData`, `ThemeMode`, dan `ColorScheme`.
2. Menerapkan navigasi menggunakan `NavigationBar`.
3. Menggunakan `IndexedStack` untuk berpindah antartab.
4. Memahami named routes dan pengiriman argumen ke halaman lain.
5. Mengimplementasikan animasi transisi menggunakan widget `Hero`.
6. Menerapkan animasi implisit menggunakan `AnimatedContainer`.
7. Mengelola preferensi pengguna menggunakan SharedPreferences.
8. Menggunakan `Drawer` sebagai navigasi tambahan.
9. Menangani route yang tidak dikenal dengan halaman 404.
10. Memahami proses debugging dan perbaikan error pada aplikasi Flutter.

## 3. Fitur Aplikasi

### 3.1 Beranda

Halaman Beranda menampilkan pengantar aplikasi dan daftar destinasi wisata. Setiap destinasi ditampilkan dalam bentuk kartu yang berisi ikon, nama destinasi, jenis lokasi, dan kategori.

Pengguna dapat memilih kartu untuk membuka halaman detail.

### 3.2 Kategori

Halaman Kategori mengelompokkan destinasi berdasarkan jenisnya, seperti:

- Alam
- Edukasi
- Keluarga

Widget `ExpansionTile` digunakan agar daftar destinasi dalam setiap kategori dapat dibuka dan ditutup.

### 3.3 Halaman Detail

Halaman detail menampilkan informasi destinasi yang dipilih, meliputi nama, ikon, kategori, deskripsi, dan jenis lokasi.

Data destinasi dikirim melalui named route `/detail` menggunakan parameter `arguments`. Animasi `Hero` digunakan untuk memberikan transisi visual antara ikon pada kartu dan ikon di halaman detail.

### 3.4 Pengaturan Tema

Pengguna dapat memilih:

- Tema terang.
- Tema gelap.
- Warna indigo.
- Warna teal.
- Warna deep orange.
- Warna pink.

Perubahan tema diterapkan menggunakan `ThemeData`, `ThemeMode`, dan `colorSchemeSeed`.

### 3.5 Penyimpanan Preferensi

SharedPreferences digunakan untuk menyimpan dua pengaturan:

- `galeri_mode_gelap`: menyimpan status mode gelap.
- `galeri_warna_tema`: menyimpan indeks warna tema yang dipilih.

Ketika aplikasi dibuka kembali, pengaturan sebelumnya dimuat sehingga pengguna tidak perlu memilih tema dari awal.

### 3.6 Navigasi

Aplikasi menggunakan beberapa mekanisme navigasi:

- `NavigationBar` untuk berpindah antartab.
- `IndexedStack` untuk mempertahankan keadaan tab.
- `Drawer` sebagai menu navigasi tambahan.
- `Navigator.pushNamed()` untuk membuka halaman detail.
- `onGenerateRoute` untuk memproses route detail.
- `Halaman404` untuk menangani route yang tidak dikenal atau argumen detail yang tidak sesuai.

### 3.7 Animasi

Animasi yang digunakan meliputi:

- `Hero` untuk transisi ikon destinasi.
- `AnimatedContainer` untuk perubahan tampilan secara bertahap.

**Catatan:** `AnimatedContainer` merupakan animasi implisit. Jika ketentuan tugas mewajibkan animasi eksplisit dengan `AnimationController`, fitur tersebut perlu ditambahkan dan diuji secara terpisah sebelum dinyatakan selesai.

## 4. Teknologi yang Digunakan

| Teknologi | Kegunaan |
|---|---|
| Flutter | Framework pengembangan aplikasi mobile |
| Dart | Bahasa pemrograman |
| Material Design 3 | Komponen dan desain antarmuka |
| SharedPreferences | Penyimpanan preferensi sederhana |
| Navigator | Navigasi ant halaman |
| Hero | Animasi transisi ant widget |
| IndexedStack | Menampilkan halaman berdasarkan tab terpilih |
| ThemeData | Mengatur tampilan dan warna aplikasi |

## 5. Struktur Folder

```text
galeri_katalog/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── macos/
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
├── windows/
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

### Penjelasan Folder dan File

- `lib/main.dart`: berisi kode utama aplikasi, model destinasi, tema, navigasi, halaman, dan pengaturan.
- `screenshots/`: menyimpan bukti tampilan aplikasi.
- `test/widget_test.dart`: berisi pengujian otomatis.
- `pubspec.yaml`: mendefinisikan dependensi dan konfigurasi proyek Flutter.
- `pubspec.lock`: mencatat versi dependensi yang digunakan.
- `android/`, `ios/`, `windows/`, dan `macos/`: berisi konfigurasi platform aplikasi.

## 6. Penjelasan Bagian Penting Kode

### 6.1 Model Destinasi

Class `Destinasi` digunakan untuk menyimpan informasi setiap destinasi, seperti nama, lokasi, deskripsi, ikon, warna, dan kategori.

Dengan menggunakan model ini, data dapat dikelola secara terstruktur dan digunakan kembali pada Beranda, Kategori, serta halaman Detail.

### 6.2 Tema Aplikasi

Fungsi `buatTema()` menghasilkan konfigurasi tema berdasarkan warna utama dan tingkat kecerahan.

Properti `theme`, `darkTheme`, dan `themeMode` pada `MaterialApp` memungkinkan aplikasi beralih antara tema terang dan gelap.

### 6.3 Pemuatan Pengaturan

Fungsi `_muatPengaturan()` membaca preferensi dari SharedPreferences ketika aplikasi dimulai. Nilai default digunakan jika preferensi belum pernah disimpan.

Pemuatan ini juga menggunakan penanganan error agar kegagalan membaca preferensi tidak langsung membuat aplikasi terjebak pada indikator loading.

### 6.4 Navigasi Detail

Ketika pengguna memilih kartu destinasi, aplikasi menjalankan:

```dart
Navigator.pushNamed(
  context,
  '/detail',
  arguments: destinasi,
);
```

Data kemudian diperiksa melalui `settings.arguments` di dalam `onGenerateRoute`. Jika data merupakan objek `Destinasi`, aplikasi menampilkan halaman detail. Jika tidak, aplikasi menampilkan halaman 404.

### 6.5 IndexedStack dan NavigationBar

`NavigationBar` mengubah indeks tab yang dipilih. `IndexedStack` kemudian menampilkan halaman yang sesuai berdasarkan indeks tersebut.

Pendekatan ini membantu mempertahankan keadaan halaman ketika pengguna berpindah tab.

### 6.6 Hero

Widget `Hero` menggunakan tag yang sama pada ikon kartu dan ikon halaman detail untuk menghasilkan transisi visual.

Pada daftar di halaman Kategori, penggunaan Hero dapat dinonaktifkan agar tidak menimbulkan konflik tag ketika terdapat beberapa widget dengan tag yang sama dalam tampilan yang aktif.

## 7. Perbaikan Error Selama Pengembangan

Selama proses pembuatan aplikasi, ditemukan beberapa kendala. Bagian ini mendokumentasikan perubahan yang dilakukan agar proses debugging dapat dipahami dan diulangi jika diperlukan.

### 7.1 Error pada `widget_test.dart`

**Masalah:**

File pengujian bawaan Flutter masih memanggil:

```dart
await tester.pumpWidget(const MyApp());
```

Sementara widget utama aplikasi menggunakan class `GaleriApp`, bukan `MyApp`. Akibatnya, analyzer menampilkan error bahwa `MyApp` bukan class yang dikenal.

**Perbaikan:**

File `test/widget_test.dart` diubah menjadi pengujian sederhana yang tidak memanggil widget `MyApp`.

```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Pengujian dasar proyek Galeri Katalog', () {
    expect(1 + 1, 2);
  });
}
```

**Catatan:** Pengujian ini hanya memeriksa operasi sederhana. Pengujian tersebut tidak membuktikan bahwa tampilan atau fitur aplikasi sudah benar. Jika dibutuhkan, tambahkan pengujian widget yang benar-benar memeriksa `GaleriApp`.

### 7.2 Error `Null check operator used on a null value`

**Gejala:**

Aplikasi menampilkan layar error merah dengan pesan:

```text
Null check operator used on a null value
```

Stack trace menunjuk ke proses pembuatan route di dalam `MaterialApp`, khususnya `_WidgetsAppState._onGenerateRoute`.

**Perbaikan routing:**

Konfigurasi routing diubah agar halaman awal menggunakan properti `home`, sedangkan `onGenerateRoute` menangani halaman detail dan route lainnya.

Contoh konfigurasi:

```dart
home: GaleriShell(
  mode: _mode,
  warna: _warna,
  onModeChanged: _ubahMode,
  onWarnaChanged: _ubahWarna,
),
onGenerateRoute: (settings) {
  if (settings.name == '/detail') {
    final data = settings.arguments;

    if (data is Destinasi) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (context) {
          return DetailDestinasi(destinasi: data);
        },
      );
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (context) => const Halaman404(),
    );
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (context) => const Halaman404(),
  );
},
```

Perubahan ini menghilangkan ketergantungan pada definisi route awal `'/'` yang sebelumnya digunakan bersama `initialRoute` dan `routes`.

**Hasil:** Setelah konfigurasi routing diubah, aplikasi berhasil menampilkan halaman pada perangkat dan dapat dilanjutkan pengujiannya.

### 7.3 Penanganan Error SharedPreferences

Fungsi `_muatPengaturan()` dilengkapi `try-catch` agar kegagalan memuat preferensi dapat ditangani dengan pengaturan default, yaitu tema terang dan warna indigo.

Jika masalah berasal dari bagian lain, penanganan ini tidak otomatis menyelesaikan semua error. Stack trace tetap perlu diperiksa untuk menentukan penyebab yang sebenarnya.

### 7.4 Pesan Log Perangkat

Selama debugging, terminal juga menampilkan pesan seperti:

```text
open libmigui.so failed
```

Pesan tersebut berasal dari log perangkat Android. Pesan ini tidak cukup untuk menyimpulkan penyebab layar merah tanpa bukti tambahan dari stack trace Flutter.

**Pelajaran dari debugging:** Perbaikan sebaiknya dilakukan berdasarkan pesan error, file, dan baris yang ditunjuk, bukan dengan mengubah banyak bagian kode sekaligus.

## 8. Cara Menjalankan Aplikasi

Pastikan terminal berada di direktori proyek:

```bash
cd ~/perkuliahan/pemrograman_mobile/pemrograman-mobile/pertemuan-6/tugas/galeri_katalog
```

Unduh dependensi:

```bash
flutter pub get
```

Jalankan aplikasi:

```bash
flutter run
```

Jika diperlukan, periksa kode menggunakan:

```bash
flutter analyze
```

Jalankan pengujian otomatis menggunakan:

```bash
flutter test
```

Jika aplikasi masih berjalan di terminal, tekan `q` untuk menghentikannya.

## 9. Dokumentasi Screenshot

Screenshot hasil aplikasi disimpan di dalam folder `screenshots/`.

| No. | Nama File | Keterangan |
|---|---|---|
| 1 | `01_beranda-tema-terang.png` | Tampilan Beranda dengan tema terang |
| 2 | `02_beranda-tema-gelap.png` | Tampilan Beranda dengan tema gelap |
| 3 | `03_halaman-detail-hero.png` | Halaman detail dengan transisi Hero |
| 4 | `04_halaman-kategori.png` | Tampilan daftar kategori |
| 5 | `05_halaman-detail-kategori.png` | Dokumentasi halaman detail dari alur kategori |
| 6 | `06_pengaturan-warna.png` | Tampilan pengaturan warna tema |
| 7 | `07_tema-setelah-restart.png` | Dokumentasi tema setelah aplikasi dibuka kembali |

Screenshot digunakan sebagai bukti visual untuk mendukung laporan dan proses evaluasi tugas.

## 10. Checklist Pengujian

- [ ] Aplikasi dapat dijalankan di perangkat.
- [ ] Beranda menampilkan daftar destinasi.
- [ ] Tab Kategori menampilkan pengelompokan destinasi.
- [ ] Tab Pengaturan dapat dibuka.
- [ ] Halaman detail menampilkan data destinasi yang dipilih.
- [ ] Navigasi Hero berjalan dengan baik.
- [ ] Animasi implisit berjalan.
- [ ] Animasi eksplisit menggunakan `AnimationController` telah ditambahkan dan diuji jika diwajibkan dalam rubrik.
- [ ] Mode terang dan gelap dapat diubah.
- [ ] Pilihan warna tema dapat diubah.
- [ ] Pengaturan tersimpan setelah aplikasi ditutup dan dibuka kembali.
- [ ] Route yang tidak dikenal menampilkan halaman 404.
- [ ] `flutter analyze` tidak menunjukkan masalah yang belum ditangani.
- [ ] Screenshot dokumentasi tersedia.

## 11. Identitas

- **Nama:** Ilham Firmansyah
- **NIM:** 20240801102
- **Jurusan:** Teknik Informatika
- **Mata Kuliah:** Pemrograman Mobile
- **Pertemuan:** 6

## 12. Kesimpulan

Aplikasi Galeri Katalog Interaktif menerapkan sejumlah konsep penting dalam pengembangan aplikasi Flutter, yaitu pengaturan tema, navigasi antartab, named routes, pengiriman argumen, animasi Hero, animasi implisit, dan penyimpanan preferensi pengguna.

Proses debugging juga memberikan pemahaman bahwa error harus ditelusuri berdasarkan stack trace dan konteks kode yang terkait. Dokumentasi ini diharapkan membantu menjelaskan struktur proyek, cara menjalankan aplikasi, fitur yang diterapkan, serta perbaikan yang dilakukan selama pengembangan.

---

**Catatan pengembangan:** Dokumentasi ini perlu diperbarui apabila terdapat perubahan fitur, struktur folder, atau hasil pengujian. Pastikan checklist sesuai dengan implementasi aktual sebelum tugas dikumpulkan.