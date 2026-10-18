# Bagian C — Animasi pada Flutter

## 1. Deskripsi

Bagian C mempelajari cara membuat animasi pada aplikasi Flutter. Animasi digunakan untuk memberikan umpan balik visual ketika pengguna melakukan interaksi, seperti mengubah bentuk kotak, menambah angka, dan memutar ikon.

Praktikum ini mencakup animasi implisit menggunakan `AnimatedContainer` dan `AnimatedSwitcher`, serta animasi eksplisit menggunakan `AnimationController` dan `RotationTransition`.

## 2. Tujuan Pembelajaran

Setelah menyelesaikan praktikum, mahasiswa diharapkan mampu:

- Memahami perbedaan animasi implisit dan eksplisit.
- Mengubah properti widget menggunakan animasi.
- Menggunakan `setState()` untuk memperbarui nilai yang memicu animasi.
- Memahami fungsi `duration` dan `curve`.
- Menggunakan `ValueKey` pada `AnimatedSwitcher`.
- Mengontrol animasi menggunakan `AnimationController`.
- Menggunakan `RotationTransition`.
- Membersihkan controller melalui `dispose()`.

## 3. Konsep yang Digunakan

### 3.1 AnimatedContainer

`AnimatedContainer` menganimasikan perubahan properti seperti ukuran, warna, margin, dan bentuk.

Pada praktikum ini, tombol mengubah ukuran, warna, dan sudut kotak.

Properti penting:

- `duration`: menentukan lama animasi.
- `curve`: menentukan karakter perubahan animasi.
- `width` dan `height`: mengatur ukuran.
- `decoration`: mengatur tampilan kotak.

### 3.2 AnimatedSwitcher

`AnimatedSwitcher` menganimasikan pergantian widget anak.

Dalam praktikum ini, angka penghitung berubah ketika tombol ditekan. `ValueKey` digunakan agar Flutter mengenali perubahan identitas widget.

### 3.3 AnimationController

`AnimationController` digunakan untuk mengontrol jalannya animasi secara langsung.

Controller dapat dimulai, dihentikan, dan diulang. Karena membutuhkan ticker provider, state widget menggunakan `SingleTickerProviderStateMixin`.

Controller harus dibersihkan melalui `dispose()` agar sumber daya animasi tidak terus digunakan setelah widget selesai.

### 3.4 RotationTransition

`RotationTransition` memutar widget berdasarkan nilai animasi. Pada praktikum ini, ikon pengaturan berputar secara berulang dan dapat dihentikan melalui tombol.

## 4. Fitur Praktikum

- Kotak berubah ukuran, warna, dan bentuk.
- Angka penghitung berubah dengan transisi skala.
- Ikon pengaturan berputar secara berulang.
- Animasi putaran dapat dihentikan dan dijalankan kembali.
- Tampilan menggunakan warna dari tema aplikasi.

## 5. Cara Menjalankan

Jalankan dari direktori `pertemuan-6/praktikum`:

```bash
flutter run -t bagian-c-animasi/main.dart
```

## 6. Pengujian

- [ ] Aplikasi berhasil dijalankan.
- [ ] Tombol Ubah Bentuk mengubah tampilan kotak.
- [ ] Tombol Tambah Angka mengubah angka dengan animasi.
- [ ] Ikon pengaturan berputar.
- [ ] Tombol Berhenti menghentikan putaran.
- [ ] Tombol Putar Kembali menjalankan animasi lagi.
- [ ] Tidak terdapat error pada terminal.

## 7. Screenshot

Simpan screenshot pada folder `pertemuan-6/praktikum/screenshots/`:

- `07-animated-container.png`
- `08-animated-switcher.png`
- `09-animation-controller.png`

## 8. Kesimpulan

Praktikum ini memperkenalkan dua pendekatan utama animasi pada Flutter. Animasi implisit cocok untuk perubahan tampilan yang sederhana, sedangkan animasi eksplisit cocok ketika pengembang membutuhkan kontrol terhadap jalannya animasi.

Pemahaman ini menjadi dasar untuk menggabungkan animasi dengan navigasi dan tema pada bagian praktikum berikutnya.
