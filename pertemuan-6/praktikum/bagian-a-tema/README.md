# Bagian A — Tema Terang/Gelap dan Warna Tema

## Deskripsi

Bagian A membahas cara mengatur tema aplikasi Flutter menggunakan `ThemeData` dan `ThemeMode`. Pengguna dapat mengganti tampilan terang atau gelap serta memilih warna utama aplikasi.

Materi ini menjadi dasar untuk membuat tampilan yang konsisten dan mudah disesuaikan.

## Tujuan Pembelajaran

- Memahami fungsi `ThemeData`.
- Menggunakan `ThemeMode` untuk mengatur tampilan terang dan gelap.
- Menggunakan `ValueNotifier` untuk menyimpan pilihan tema dan warna.
- Memahami fungsi `ListenableBuilder`.
- Mengakses warna dan gaya teks menggunakan `Theme.of(context)`.

## Konsep yang Digunakan

### 1. ThemeData

`ThemeData` digunakan untuk menentukan gaya visual aplikasi, termasuk warna utama dan tingkat kecerahan.

### 2. ThemeMode

`ThemeMode.light` menggunakan tema terang, sedangkan `ThemeMode.dark` menggunakan tema gelap.

### 3. ValueNotifier

`ValueNotifier` menyimpan nilai yang dapat berubah dan memberi tahu widget yang mendengarkannya ketika nilai diperbarui.

### 4. ListenableBuilder

`ListenableBuilder` membangun ulang bagian antarmuka ketika objek yang didengarkan mengalami perubahan.

### 5. Theme.of(context)

Digunakan untuk membaca tema aktif agar warna dan gaya komponen menyesuaikan tampilan aplikasi.

## Cara Menjalankan

Jalankan perintah berikut dari folder `pertemuan-6/praktikum`:

```bash
flutter run -t bagian-a-tema/main.dart
```

## Pengujian

- [ ] Aplikasi dapat dijalankan.
- [ ] Mode terang dan gelap dapat diubah.
- [ ] Pilihan warna tema berfungsi.
- [ ] Tampilan menyesuaikan tema tanpa restart.
- [ ] Screenshot hasil praktikum disimpan.

## Screenshot

Simpan hasil pengujian di folder `screenshots` jika diperlukan.

## Kesimpulan

Pada bagian ini, mahasiswa mempelajari pengaturan tema secara terpusat dan perubahan tampilan secara dinamis menggunakan fitur Flutter.

Pengaturan tema yang tersimpan setelah aplikasi ditutup akan dikembangkan pada latihan mandiri.
