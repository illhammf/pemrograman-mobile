# Bagian B — Named Routes, Argumen, dan Hero

## 1. Deskripsi

Bagian B membahas navigasi antarhalaman pada Flutter menggunakan named routes. Aplikasi menampilkan daftar item dan memungkinkan pengguna membuka halaman detail berdasarkan item yang dipilih.

Data item dikirim melalui argumen navigasi, sedangkan `onGenerateRoute` digunakan untuk memproses permintaan menuju halaman detail. Transisi `Hero` memberikan efek perpindahan visual pada ikon antara halaman daftar dan detail.

## 2. Tujuan Pembelajaran

Setelah menyelesaikan praktikum ini, mahasiswa diharapkan mampu:

- Memahami penggunaan named routes.
- Membuka halaman menggunakan `Navigator.pushNamed()`.
- Mengirim data menggunakan `arguments`.
- Memproses navigasi melalui `onGenerateRoute`.
- Menampilkan data pada halaman detail.
- Membuat transisi menggunakan widget `Hero`.
- Memahami fungsi `Navigator.pop()` untuk kembali ke halaman sebelumnya.

## 3. Konsep yang Digunakan

### 3.1 Model Data

Kelas `Item` digunakan untuk menyimpan informasi yang diperlukan aplikasi, yaitu nama, ikon, warna, dan deskripsi.

Model membantu mengelompokkan informasi item ke dalam satu objek sehingga lebih mudah dikirim antarhalaman.

### 3.2 Named Routes

Named routes memungkinkan navigasi menggunakan nama rute, misalnya `/detail`.

Contoh:

```dart
Navigator.pushNamed(
  context,
  '/detail',
  arguments: item,
);
```

Pada contoh tersebut, aplikasi membuka halaman detail dan mengirim objek item yang dipilih.

### 3.3 Arguments

Argumen digunakan untuk mengirim informasi dari halaman asal ke halaman tujuan. Dalam praktikum ini, objek `Item` dikirim melalui properti `arguments`.

Halaman tujuan perlu memeriksa tipe data agar informasi yang diterima sesuai dengan kebutuhan halaman.

### 3.4 onGenerateRoute

`onGenerateRoute` memproses navigasi berdasarkan nama rute dan argumen yang diberikan. Dalam praktikum ini, fungsi tersebut digunakan untuk membuat `DetailPage`.

### 3.5 Hero

Widget `Hero` menganimasikan elemen visual yang memiliki tag sama pada dua halaman.

Pada aplikasi ini, ikon item muncul di halaman daftar dan halaman detail. Tag yang sama memungkinkan Flutter menghubungkan kedua elemen tersebut selama transisi.

### 3.6 Navigator.pop

`Navigator.pop(context)` menutup halaman detail dan mengembalikan pengguna ke halaman sebelumnya.

## 4. Fitur Aplikasi

- Menampilkan daftar empat item.
- Menampilkan ikon dan deskripsi setiap item.
- Membuka halaman detail berdasarkan item yang dipilih.
- Mengirim objek item melalui named routes.
- Menganimasikan ikon menggunakan Hero.
- Menyediakan tombol kembali.
- Menampilkan halaman 404 untuk rute yang tidak dikenal.

## 5. Cara Menjalankan

Jalankan dari direktori `pertemuan-6/praktikum`:

```bash
flutter run -t bagian-b-routing-hero/main.dart
```

## 6. Pengujian

- [ ] Aplikasi berhasil dijalankan.
- [ ] Daftar item tampil dengan benar.
- [ ] Memilih item membuka halaman detail yang sesuai.
- [ ] Nama dan deskripsi sesuai dengan item yang dipilih.
- [ ] Animasi Hero terlihat ketika membuka detail.
- [ ] Tombol kembali berfungsi.
- [ ] Halaman error dapat digunakan untuk rute yang tidak ditemukan.

## 7. Screenshot

Simpan screenshot pada folder `pertemuan-6/praktikum/screenshots/` dengan nama:

- `04-daftar-item.png`
- `05-detail-item.png`
- `06-transisi-hero.png`

## 8. Kesimpulan

Praktikum ini memperkenalkan navigasi bernama, pengiriman argumen, dan transisi Hero pada Flutter. Konsep tersebut membantu membangun aplikasi dengan perpindahan halaman yang terstruktur serta pengalaman visual yang lebih interaktif.
