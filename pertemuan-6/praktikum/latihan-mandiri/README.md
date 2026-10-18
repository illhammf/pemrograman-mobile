# Latihan Mandiri — Pertemuan 6

## 1. Deskripsi

Latihan mandiri ini mengembangkan aplikasi Flutter dari materi tema, routing, navigasi, dan animasi pada Pertemuan 6.

Aplikasi menggabungkan penyimpanan pengaturan menggunakan SharedPreferences, navigasi tab dan Drawer, transisi FadeTransition, penanganan rute tidak dikenal, serta animasi AnimatedOpacity.

## 2. Tujuan Pembelajaran

- Menyimpan pengaturan tema secara lokal.
- Memuat kembali pengaturan saat aplikasi dimulai.
- Membuat Drawer untuk berpindah halaman atau tab.
- Membuat transisi halaman menggunakan FadeTransition.
- Menampilkan halaman 404 untuk rute yang tidak dikenal.
- Menerapkan AnimatedOpacity pada sebuah kartu.

## 3. Fitur

1. Tema terang dan gelap.
2. Empat pilihan warna tema.
3. Penyimpanan tema menggunakan SharedPreferences.
4. Drawer dengan menu Beranda, Animasi, dan Pengaturan.
5. Navigasi tab bawah menggunakan NavigationBar.
6. Transisi halaman detail menggunakan FadeTransition.
7. Halaman 404 melalui onUnknownRoute.
8. Animasi AnimatedOpacity pada kartu.

## 4. Cara Menjalankan

Jalankan dari direktori `pertemuan-6/praktikum`:

```bash
flutter pub get
flutter run -t latihan-mandiri/main.dart
```

## 5. Pengujian

- [ ] Aplikasi berhasil dijalankan.
- [ ] Mode gelap dapat diaktifkan.
- [ ] Warna tema dapat diubah.
- [ ] Pengaturan tema bertahan setelah aplikasi ditutup dan dibuka kembali.
- [ ] Drawer dapat digunakan untuk berpindah tab.
- [ ] Halaman detail menggunakan FadeTransition.
- [ ] Rute yang tidak dikenal menampilkan halaman 404.
- [ ] AnimatedOpacity dapat meredupkan dan menerangkan kartu.

## 6. Screenshot

Simpan screenshot pada folder `pertemuan-6/praktikum/screenshots/`:

- `15-pengaturan-tema.png`
- `16-drawer.png`
- `17-fade-transition.png`
- `18-halaman-404.png`
- `19-animated-opacity.png`
- `20-tema-setelah-restart.png`

## 7. Kesimpulan

Latihan mandiri menggabungkan konsep tema, penyimpanan lokal, navigasi, dan animasi menjadi aplikasi yang lebih lengkap. Pengaturan tema dapat dipertahankan setelah aplikasi dibuka kembali, sedangkan Drawer, transisi halaman, halaman 404, dan AnimatedOpacity memperkaya pengalaman pengguna.
