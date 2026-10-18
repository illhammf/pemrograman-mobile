# Pertemuan 6 — Tema, Routing dan Navigasi, serta Animasi

## 1. Deskripsi

Pertemuan 6 merupakan bagian dari pembelajaran Flutter Fundamental yang berfokus pada pengembangan tampilan, perpindahan halaman, dan animasi dalam aplikasi mobile.

Pada pertemuan sebelumnya, mahasiswa telah mempelajari widget Flutter, pengelolaan state, form input, asynchronous programming, REST API, dan penyimpanan data lokal. Materi tersebut menjadi dasar untuk membangun aplikasi yang lebih interaktif dan memiliki struktur navigasi yang lebih teratur.

Pada pertemuan ini, mahasiswa akan mempelajari cara mengatur tema aplikasi, berpindah antarhalaman menggunakan named routes, mengirim data ke halaman detail, membuat navigasi tab bawah, serta menerapkan animasi agar perubahan tampilan terasa lebih halus.

Materi kemudian diterapkan dalam tugas akhir berupa aplikasi **Galeri/Katalog Interaktif** dengan tema yang dapat diubah, beberapa tab, halaman detail, dan animasi.

## 2. Tujuan Pembelajaran

Setelah menyelesaikan materi dan praktikum, mahasiswa diharapkan mampu:

1. Membuat tema terang dan gelap menggunakan `ThemeData` dan `ThemeMode`.
2. Menyediakan pilihan warna tema yang dapat diubah oleh pengguna.
3. Menggunakan `Theme.of(context)` agar warna dan gaya komponen mengikuti tema aplikasi.
4. Menerapkan named routes untuk mengatur navigasi antarhalaman.
5. Mengirim argumen dari halaman daftar menuju halaman detail.
6. Menggunakan `onGenerateRoute` untuk menangani navigasi yang membutuhkan argumen.
7. Membuat navigasi tab bawah menggunakan `NavigationBar`.
8. Mempertahankan state tab menggunakan `IndexedStack`.
9. Membuat animasi implisit menggunakan `AnimatedContainer` dan `AnimatedSwitcher`.
10. Membuat animasi eksplisit menggunakan `AnimationController`.
11. Menerapkan transisi `Hero` pada elemen yang berpindah antarhalaman.
12. Menyimpan pengaturan tema menggunakan SharedPreferences dalam latihan mandiri dan tugas utama.

## 3. Materi Pembelajaran

### 3.1 Tema Aplikasi

Tema adalah kumpulan pengaturan visual yang digunakan secara konsisten di seluruh aplikasi. Pengaturan tersebut dapat mencakup warna, tipografi, dan gaya komponen.

Flutter menyediakan `ThemeData` untuk mendefinisikan tema aplikasi. Dengan Material 3, properti `colorSchemeSeed` dapat digunakan untuk menghasilkan skema warna berdasarkan satu warna utama.

Contoh:

```dart
ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.indigo,
  brightness: Brightness.light,
)
```

Properti `brightness` menentukan apakah tema menggunakan tampilan terang atau gelap.

Flutter juga menyediakan `ThemeMode` untuk memilih tema yang digunakan:

- `ThemeMode.light`: selalu menggunakan tema terang.
- `ThemeMode.dark`: selalu menggunakan tema gelap.
- `ThemeMode.system`: mengikuti pengaturan tampilan perangkat.

Contoh penggunaan pada `MaterialApp`:

```dart
MaterialApp(
  theme: temaTerang,
  darkTheme: temaGelap,
  themeMode: ThemeMode.system,
  home: const HalamanUtama(),
)
```

**Mengapa tema penting?**

Tanpa pengaturan tema terpusat, setiap widget mungkin memiliki warna dan gaya yang ditentukan secara manual. Hal tersebut membuat perubahan tampilan menjadi lebih sulit. Dengan tema, tampilan aplikasi dapat disesuaikan dari satu tempat.

### 3.2 Mengakses Tema dengan `Theme.of(context)`

Widget dapat membaca tema yang sedang aktif melalui `Theme.of(context)`.

Contoh:

```dart
final tema = Theme.of(context);

Text(
  'Selamat Datang',
  style: tema.textTheme.titleLarge,
)
```

Untuk mendapatkan warna dari skema tema:

```dart
final warna = Theme.of(context).colorScheme;

Container(
  color: warna.primaryContainer,
  child: Text(
    'Konten',
    style: TextStyle(color: warna.onPrimaryContainer),
  ),
)
```

Pendekatan ini membuat warna dan teks lebih konsisten ketika pengguna berpindah antara tema terang dan gelap.

### 3.3 Named Routes dan Navigasi

Navigasi merupakan proses berpindah dari satu halaman ke halaman lain. Flutter menyediakan `Navigator` untuk mengelola perpindahan tersebut.

Beberapa metode navigasi yang dipelajari adalah:

| Metode | Fungsi |
|---|---|
| `Navigator.pushNamed()` | Membuka halaman berdasarkan nama rute |
| `Navigator.pop()` | Menutup halaman saat ini dan kembali ke halaman sebelumnya |
| `Navigator.pushReplacementNamed()` | Mengganti halaman saat ini dengan halaman baru |
| `Navigator.pushNamedAndRemoveUntil()` | Membuka halaman baru sekaligus menghapus halaman tertentu dari riwayat navigasi |

Contoh membuka halaman detail:

```dart
Navigator.pushNamed(
  context,
  '/detail',
  arguments: item,
);
```

Pada contoh tersebut, `item` dikirim sebagai argumen agar halaman detail mengetahui data yang perlu ditampilkan.

### 3.4 `onGenerateRoute` dan Argumen

`onGenerateRoute` digunakan untuk membuat rute ketika aplikasi meminta navigasi ke suatu nama rute. Pendekatan ini berguna ketika halaman membutuhkan argumen.

Contoh:

```dart
onGenerateRoute: (settings) {
  if (settings.name == '/detail') {
    final item = settings.arguments as Item;

    return MaterialPageRoute(
      builder: (_) => DetailPage(item: item),
      settings: settings,
    );
  }

  return null;
},
```

Pada contoh tersebut, aplikasi memeriksa nama rute, mengambil argumen, lalu membuat halaman detail berdasarkan data yang diterima.

**Hal yang perlu diperhatikan:** tipe argumen yang dikirim harus sesuai dengan tipe data yang diharapkan halaman tujuan.

### 3.5 Animasi `Hero`

`Hero` membuat elemen visual tampak berpindah secara halus dari satu halaman ke halaman lain.

Misalnya, ikon pada daftar katalog dapat membesar ketika pengguna membuka halaman detail. Agar transisi dikenali oleh Flutter, widget `Hero` pada kedua halaman harus menggunakan tag yang sama.

Contoh:

```dart
Hero(
  tag: 'ikon-flutter',
  child: const CircleAvatar(
    child: Icon(Icons.flutter_dash),
  ),
)
```

Tag tersebut perlu dipasangkan dengan `Hero` yang sesuai pada halaman detail.

### 3.6 Animasi Implisit

Animasi implisit digunakan ketika perubahan nilai properti widget ingin ditampilkan secara otomatis dengan transisi yang halus.

Widget yang dipelajari:

- `AnimatedContainer`
- `AnimatedSwitcher`
- `AnimatedOpacity`

Contoh:

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 500),
  width: besar ? 200 : 100,
  height: 100,
  decoration: BoxDecoration(
    color: besar ? Colors.indigo : Colors.teal,
    borderRadius: BorderRadius.circular(
      besar ? 50 : 8,
    ),
  ),
)
```

Ketika nilai `besar` berubah melalui `setState`, Flutter menganimasikan perubahan ukuran, warna, dan sudut selama durasi yang ditentukan.

`AnimatedSwitcher` digunakan untuk menganimasikan pergantian widget atau konten. Pada contoh penghitung, `ValueKey` yang berbeda membantu Flutter mengenali bahwa widget teks telah berubah.

### 3.7 Animasi Eksplisit

Animasi eksplisit digunakan ketika pengembang memerlukan kontrol lebih besar terhadap jalannya animasi, seperti memulai, menghentikan, mengulang, atau mengatur urutannya.

Komponen pentingnya adalah:

- `AnimationController`
- `Animation`
- `RotationTransition`
- `SingleTickerProviderStateMixin`

Contoh inisialisasi:

```dart
late final AnimationController controller;

@override
void initState() {
  super.initState();

  controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();
}

@override
void dispose() {
  controller.dispose();
  super.dispose();
}
```

`AnimationController` harus diakhiri melalui `dispose()` ketika state widget tidak lagi digunakan agar sumber daya animasi dibersihkan dengan benar.

### 3.8 Navigasi Tab Bawah

`NavigationBar` menyediakan navigasi untuk berpindah di antara beberapa bagian utama aplikasi.

Contohnya adalah tab Beranda, Animasi, dan Pengaturan.

`IndexedStack` digunakan untuk menampilkan halaman berdasarkan indeks yang dipilih. Keuntungannya adalah state halaman dapat dipertahankan ketika pengguna berpindah tab.

Contoh:

```dart
IndexedStack(
  index: indeksTerpilih,
  children: const [
    BerandaTab(),
    AnimasiTab(),
    PengaturanTab(),
  ],
)
```

Berbeda dengan navigasi menuju halaman detail menggunakan `Navigator`, tab bawah digunakan untuk berpindah di antara bagian utama aplikasi.

## 4. Langkah Praktikum

### Bagian A — Tema Terang/Gelap dan Warna Tema

Pada bagian ini, mahasiswa membuat aplikasi dengan pilihan mode terang atau gelap dan beberapa pilihan warna tema.

Materi yang digunakan:

- `ThemeData`
- `ThemeMode`
- `ValueNotifier`
- `ListenableBuilder`
- `Theme.of(context)`

**Checkpoint:** perubahan mode dan warna langsung memengaruhi tampilan aplikasi tanpa perlu menjalankan ulang aplikasi.

### Bagian B — Named Routes, Argumen, dan Hero

Pada bagian ini, mahasiswa membuat daftar item dan halaman detail. Pengguna dapat memilih item, mengirim data melalui named routes, lalu melihat animasi `Hero` saat berpindah halaman.

**Checkpoint:** memilih item membuka halaman detail, ikon mengalami transisi, dan pengguna dapat kembali ke halaman daftar.

### Bagian C — Animasi

Pada bagian ini, mahasiswa mengimplementasikan tiga demonstrasi:

1. `AnimatedContainer` untuk mengubah bentuk dan ukuran.
2. `AnimatedSwitcher` untuk menganimasikan perubahan angka.
3. `AnimationController` dengan `RotationTransition` untuk memutar ikon.

**Checkpoint:** setiap animasi berjalan sesuai interaksi dan animasi eksplisit dapat dihentikan serta dijalankan kembali.

### Bagian D — Navigasi Tab Bawah

Pada bagian ini, mahasiswa menggabungkan halaman Beranda, Animasi, dan Pengaturan menggunakan `NavigationBar` dan `IndexedStack`.

**Checkpoint:** pengguna dapat berpindah tab, membuka halaman detail, melihat animasi, dan mengubah tema dari tab Pengaturan.

## 5. Latihan Mandiri

Latihan mandiri terdiri dari lima pengembangan:

1. Menyimpan mode gelap dan warna tema menggunakan SharedPreferences, lalu memuatnya ketika aplikasi dimulai.
2. Menambahkan Drawer pada halaman utama untuk berpindah tab.
3. Menggunakan `PageRouteBuilder` dan `FadeTransition` untuk transisi halaman detail.
4. Menambahkan `onUnknownRoute` untuk menampilkan halaman 404.
5. Menambahkan demonstrasi `AnimatedOpacity` untuk memudarkan dan memunculkan kartu.

Latihan ini menggabungkan konsep navigasi, animasi, dan penyimpanan lokal yang telah dipelajari pada pertemuan sebelumnya.

## 6. Tugas Utama — Galeri/Katalog Interaktif

Mahasiswa membuat aplikasi Galeri/Katalog Interaktif dengan tema bebas, misalnya katalog produk, galeri tempat wisata, atau profil diri.

### Ketentuan

1. Memiliki minimal tiga tab menggunakan `NavigationBar`.
2. Menggunakan named routes dengan argumen untuk halaman detail.
3. Menggunakan `Hero` pada halaman detail.
4. Memiliki minimal dua jenis animasi, termasuk animasi implisit dan eksplisit.
5. Menyediakan tema terang dan gelap.
6. Menyediakan minimal tiga pilihan warna tema.
7. Menyimpan pengaturan tema agar tetap tersedia setelah aplikasi ditutup.
8. Menggunakan `Theme.of(context)` untuk warna dan gaya tampilan, bukan mengatur warna secara manual pada setiap widget.

### Berkas yang Dikumpulkan

- Screenshot mode terang.
- Screenshot mode gelap.
- Screenshot halaman detail.
- Source code atau tautan repository GitHub.

Aplikasi ini juga menjadi dasar untuk pengembangan mini proyek pada Pertemuan 7.

## 7. Rubrik Penilaian

| Komponen | Bobot |
|---|---:|
| Praktikum Bagian A–D | 30% |
| Latihan mandiri | 20% |
| Tugas Galeri/Katalog | 40% |
| Kerapian kode dan konsistensi tema | 10% |

## 8. Pertanyaan Refleksi

1. Apa perbedaan animasi implisit dan eksplisit? Kapan masing-masing digunakan?
2. Mengapa dua widget `Hero` harus memiliki tag yang sama?
3. Apa keuntungan menggunakan `Theme.of(context)` dibandingkan menulis warna secara langsung pada widget?
4. Apa perbedaan perpindahan tab menggunakan `IndexedStack` dan perpindahan halaman menggunakan `Navigator`?
5. Mengapa `AnimationController` perlu diakhiri dengan `dispose()`?

Pertanyaan ini dapat digunakan untuk mengevaluasi pemahaman setelah menyelesaikan praktikum.

## 9. Troubleshooting

| Masalah | Hal yang Perlu Diperiksa |
|---|---|
| Rute tidak ditemukan | Periksa nama rute serta konfigurasi `routes` dan `onGenerateRoute`. |
| Animasi `Hero` tidak berjalan | Pastikan tag pada kedua halaman sama dan tidak bentrok. |
| Tema tidak berubah | Pastikan perubahan nilai memicu pembangunan ulang widget atau `MaterialApp`. |
| Sebagian warna tidak mengikuti tema | Gunakan warna dari `Theme.of(context).colorScheme`. |
| `AnimatedContainer` tidak bergerak | Pastikan nilai propertinya berubah melalui state dan durasinya telah ditentukan. |
| `AnimatedSwitcher` tidak terlihat berubah | Gunakan key yang berbeda ketika konten berganti. |
| Terjadi masalah `vsync` | Periksa penggunaan `SingleTickerProviderStateMixin` pada state widget. |

## 10. Referensi

- [Flutter Themes](https://docs.flutter.dev/cookbook/design/themes)
- [Named Routes](https://docs.flutter.dev/cookbook/navigation/named-routes)
- [Flutter Animations](https://docs.flutter.dev/ui/animations)
- [Hero Animations](https://docs.flutter.dev/ui/animations/hero-animations)

## 11. Identitas

**Nama:** Ilham Firmansyah  
**NIM:** 20240801102  
**Jurusan:** Teknik Informatika  
**Mata Kuliah:** Pemrograman Mobile  
**Pertemuan:** 6
