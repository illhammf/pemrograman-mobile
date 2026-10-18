# Bagian D — Navigasi Tab Bawah

## 1. Deskripsi

Bagian D menggabungkan konsep tema, navigasi, dan animasi dalam satu aplikasi Flutter. Aplikasi menyediakan tiga tab utama, yaitu Beranda, Animasi, dan Pengaturan.

Navigasi tab menggunakan `NavigationBar`, sedangkan `IndexedStack` digunakan untuk menampilkan halaman berdasarkan tab yang dipilih. Halaman detail tetap dibuka menggunakan named routes dan menampilkan transisi Hero.

## 2. Tujuan Pembelajaran

- Menggabungkan beberapa halaman dalam satu aplikasi.
- Membuat navigasi tab bawah menggunakan `NavigationBar`.
- Mengubah halaman aktif berdasarkan indeks.
- Mempertahankan state halaman menggunakan `IndexedStack`.
- Mengintegrasikan named routes dan argumen.
- Menerapkan transisi Hero.
- Menggabungkan tema terang/gelap dengan animasi.
- Memahami perbedaan navigasi tab dan navigasi halaman detail.

## 3. Struktur Aplikasi

### Beranda

Menampilkan daftar item Flutter, Musik, Kamera, dan Peta. Pengguna dapat memilih item untuk membuka halaman detail.

### Animasi

Menampilkan demonstrasi `AnimatedContainer`, `AnimatedSwitcher`, `AnimationController`, `RotationTransition`, dan `AnimatedOpacity`.

### Pengaturan

Menyediakan saklar mode gelap dan pilihan warna tema. Perubahan diterapkan ke seluruh aplikasi melalui `ValueNotifier` dan `ListenableBuilder`.

### Halaman Detail

Menampilkan informasi item yang dipilih. Data dikirim melalui named routes dan ikon menggunakan Hero untuk transisi visual.

## 4. Konsep Utama

### NavigationBar

`NavigationBar` menyediakan pilihan tab dan melaporkan perubahan indeks melalui `onDestinationSelected`.

### IndexedStack

`IndexedStack` menampilkan satu halaman berdasarkan indeks yang dipilih sambil mempertahankan state halaman lainnya.

### Named Routes

`Navigator.pushNamed()` membuka halaman detail dan mengirim objek item melalui `arguments`. `onGenerateRoute` memproses permintaan menuju rute detail.

### ThemeData

`ThemeData` dan `ThemeMode` mengatur tema terang atau gelap. `Theme.of(context)` digunakan untuk membaca warna serta gaya teks yang mengikuti tema aktif.

## 5. Cara Menjalankan

Jalankan dari direktori `pertemuan-6/praktikum`:

```bash id="tmn7vn"
flutter run -t bagian-d-navigasi-tab/main.dart
```

## 6. Pengujian

- [ ] Aplikasi berhasil dijalankan.
- [ ] Tab Beranda tampil.
- [ ] Tab Animasi menampilkan seluruh demonstrasi.
- [ ] Tab Pengaturan dapat dibuka.
- [ ] Navigasi antar-tab berfungsi.
- [ ] Penghitung animasi tetap mempertahankan nilainya ketika berpindah tab.
- [ ] Ikon pada Beranda membuka halaman detail.
- [ ] Transisi Hero terlihat.
- [ ] Mode gelap mengubah tampilan aplikasi.
- [ ] Pilihan warna tema berfungsi.
- [ ] Tidak terdapat error pada terminal.

## 7. Screenshot

Simpan screenshot pada folder `pertemuan-6/praktikum/screenshots/`:

- `10-navigasi-beranda.png`
- `11-navigasi-animasi.png`
- `12-navigasi-pengaturan.png`
- `13-detail-hero.png`
- `14-mode-gelap.png`

## 8. Catatan

Pengaturan tema pada praktikum ini masih tersimpan selama aplikasi berjalan. Penyimpanan mode dan warna tema menggunakan SharedPreferences akan diterapkan pada latihan mandiri.

## 9. Kesimpulan

Bagian D menyatukan berbagai konsep yang telah dipelajari dalam Pertemuan 6. Dengan `NavigationBar`, `IndexedStack`, named routes, Hero, dan animasi, aplikasi memiliki struktur navigasi yang lebih lengkap dan interaktif.
