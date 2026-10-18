# Praktikum Pertemuan 6 — Flutter Fundamental

## 1. Pendahuluan

Folder ini berisi implementasi praktikum Flutter Fundamental Pertemuan 6. Materi praktikum membahas tema aplikasi, routing dan navigasi, serta animasi.

Praktikum dibagi menjadi empat bagian utama dan satu latihan mandiri. Setiap bagian berfokus pada konsep tertentu agar mahasiswa dapat mempelajari, menjalankan, dan menguji kode secara bertahap.

Seluruh bagian menggunakan satu proyek Flutter dan satu file `pubspec.yaml`. Setiap bagian memiliki file `main.dart` tersendiri agar dapat dijalankan secara terpisah.

## 2. Prasyarat

Sebelum memulai praktikum, pastikan:

- Flutter SDK sudah terpasang.
- VS Code atau editor lain telah tersedia.
- Perangkat Android atau emulator dapat digunakan untuk menjalankan aplikasi.
- Mahasiswa memahami dasar widget dan state pada Flutter.
- Proyek praktikum berhasil dibuat menggunakan `flutter create`.

Praktikum Bagian A–D tidak membutuhkan paket tambahan menurut modul.

## 3. Struktur Folder

```text id="7xv8x0"
praktikum/
├── README.md
└── praktikum_6/
    ├── lib/
    ├── bagian-a-tema/
    │   └── main.dart
    ├── bagian-b-routing-hero/
    │   └── main.dart
    ├── bagian-c-animasi/
    │   └── main.dart
    ├── bagian-d-navigasi-tab/
    │   └── main.dart
    ├── latihan-mandiri/
    │   └── main.dart
    ├── pubspec.yaml
    └── ...
```

Folder tersebut merupakan struktur yang digunakan untuk memisahkan setiap bagian praktikum. File `main.dart` pada masing-masing folder berfungsi sebagai entry point saat menjalankan bagian terkait.

## 4. Materi Praktikum

### Bagian A — Tema Terang/Gelap dan Warna Tema

Bagian ini memperkenalkan pengaturan tema aplikasi dengan `ThemeData`, `ThemeMode`, dan `colorSchemeSeed`.

`ValueNotifier` digunakan untuk menyimpan nilai yang dapat berubah, sedangkan `ListenableBuilder` membantu membangun ulang bagian antarmuka yang bergantung pada perubahan nilai tersebut.

Target pembelajaran:

- Mengubah tampilan antara tema terang dan gelap.
- Memilih warna tema dari beberapa opsi.
- Menggunakan `Theme.of(context)` untuk membaca gaya dan warna tema.
- Memahami bagaimana perubahan nilai memengaruhi tampilan aplikasi.

### Bagian B — Named Routes, Argumen, dan Hero

Bagian ini membahas navigasi dari daftar menuju halaman detail.

Data item dikirim menggunakan argumen pada `Navigator.pushNamed()`. Rute detail diproses melalui `onGenerateRoute`, kemudian informasi item ditampilkan di halaman tujuan.

Target pembelajaran:

- Memahami navigasi berdasarkan nama rute.
- Mengirim dan menerima argumen.
- Menggunakan `onGenerateRoute`.
- Menghubungkan dua widget `Hero` melalui tag yang sama.
- Membuat transisi visual antara daftar dan detail.

### Bagian C — Animasi

Bagian ini membahas perbedaan animasi implisit dan eksplisit.

Animasi implisit mempermudah perubahan tampilan tanpa mengelola controller secara langsung. Animasi eksplisit memberikan kontrol terhadap jalannya animasi.

Target pembelajaran:

- Mengubah ukuran dan bentuk menggunakan `AnimatedContainer`.
- Menganimasikan perubahan konten menggunakan `AnimatedSwitcher`.
- Memutar ikon menggunakan `AnimationController` dan `RotationTransition`.
- Menghentikan serta menjalankan kembali animasi.
- Membersihkan controller melalui `dispose()`.

### Bagian D — Navigasi Tab Bawah

Bagian ini menggabungkan halaman Beranda, Animasi, dan Pengaturan.

`NavigationBar` digunakan untuk memilih tab, sedangkan `IndexedStack` menampilkan halaman berdasarkan indeks yang aktif.

Target pembelajaran:

- Membuat minimal tiga tab utama.
- Mengubah tab melalui `onDestinationSelected`.
- Mempertahankan state halaman saat berpindah tab.
- Menggabungkan tema, routing, dan animasi ke dalam satu aplikasi.

### Latihan Mandiri

Latihan mandiri memperluas kemampuan yang telah dipelajari melalui:

1. Penyimpanan tema menggunakan SharedPreferences.
2. Drawer untuk navigasi.
3. Transisi halaman menggunakan `PageRouteBuilder` dan `FadeTransition`.
4. Halaman 404 melalui `onUnknownRoute`.
5. Animasi kartu menggunakan `AnimatedOpacity`.

## 5. Cara Menjalankan Praktikum

Masuk ke direktori proyek:

```bash
cd ~/perkuliahan/pemrograman_mobile/pemrograman-mobile/pertemuan-6/praktikum/praktikum_6
```

Ambil dependensi proyek:

```bash
flutter pub get
```

Jalankan bagian yang ingin dipelajari:

```bash
flutter run -t bagian-a-tema/main.dart
```

Untuk bagian lainnya:

```bash
flutter run -t bagian-b-routing-hero/main.dart
flutter run -t bagian-c-animasi/main.dart
flutter run -t bagian-d-navigasi-tab/main.dart
flutter run -t latihan-mandiri/main.dart
```

Pastikan file pada entry point yang dipilih sudah dibuat sebelum menjalankan perintahnya.

## 6. Cara Belajar yang Disarankan

Agar setiap konsep lebih mudah dipahami, lakukan langkah berikut:

1. Baca tujuan dan penjelasan konsep pada bagian yang sedang dipelajari.
2. Jalankan kode yang sudah dibuat.
3. Ubah satu properti atau nilai pada kode, misalnya warna tema, durasi animasi, atau indeks tab.
4. Jalankan kembali aplikasi dan amati perubahannya.
5. Cocokkan hasil dengan checkpoint pada modul.
6. Ambil screenshot setelah fitur berjalan.
7. Catat error yang muncul beserta penyelesaiannya.

Jangan hanya menyalin kode. Cobalah memahami fungsi setiap widget, parameter, dan callback yang digunakan.

## 7. Dokumentasi dan Screenshot

Screenshot digunakan untuk menunjukkan bahwa setiap bagian praktikum telah dijalankan.

Dokumentasi yang disarankan:

- Bagian A: mode terang, mode gelap, dan perubahan warna tema.
- Bagian B: daftar item, halaman detail, dan transisi `Hero`.
- Bagian C: perubahan bentuk, pergantian angka, serta animasi putar.
- Bagian D: ketiga tab dan perubahan tema dari tab Pengaturan.
- Latihan mandiri: pengaturan yang tersimpan dan fitur tambahan yang telah dibuat.

Simpan screenshot dalam folder dokumentasi yang terpisah dan gunakan nama file yang menjelaskan isi gambar.

## 8. Troubleshooting

Jika aplikasi tidak berjalan, periksa beberapa hal berikut:

- Pastikan terminal berada di direktori `praktikum_6`.
- Pastikan file `main.dart` pada entry point yang dipilih tersedia.
- Periksa tanda kurung, import, dan nama kelas.
- Pastikan nama rute yang dipanggil sesuai dengan rute yang didaftarkan.
- Pastikan argumen halaman detail memiliki tipe yang benar.
- Periksa `Hero` agar tag pada halaman asal dan tujuan sesuai.
- Pastikan state berubah ketika tombol ditekan.
- Pastikan `AnimationController` menggunakan ticker provider yang sesuai dan dibersihkan melalui `dispose()`.

## 9. Kesimpulan

Praktikum Pertemuan 6 membantu mahasiswa memahami pengaturan tema, navigasi antarhalaman, navigasi tab, serta animasi pada Flutter.

Dengan menyelesaikan setiap bagian secara bertahap, mahasiswa diharapkan mampu menggabungkan berbagai konsep tersebut dalam aplikasi Galeri/Katalog Interaktif sebagai tugas utama.
