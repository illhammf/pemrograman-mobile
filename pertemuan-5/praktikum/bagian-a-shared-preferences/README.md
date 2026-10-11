# Bagian A — SharedPreferences

## Deskripsi

Praktikum ini membahas penyimpanan data sederhana secara lokal menggunakan paket `shared_preferences` pada Flutter. Data yang disimpan tetap tersedia ketika aplikasi dihentikan dan dijalankan kembali.

## Tujuan

Setelah menyelesaikan praktikum ini, mahasiswa mampu:

1. Menggunakan paket `shared_preferences`.
2. Menyimpan dan membaca data sederhana berdasarkan key.
3. Menyimpan nama pengguna.
4. Menyimpan pilihan mode gelap.
5. Menghitung jumlah aplikasi dibuka dan mempertahankan hitungannya.

## Konsep yang Dipelajari

### SharedPreferences

`SharedPreferences` digunakan untuk menyimpan data sederhana dalam bentuk pasangan key-value, seperti nama, pilihan tema, atau pengaturan aplikasi.

Contoh membaca nilai:

```dart
final prefs = await SharedPreferences.getInstance();
final nama = prefs.getString('nama') ?? '';
```

Contoh menyimpan nilai:

```dart
await prefs.setString('nama', 'Budi');
await prefs.setBool('gelap', true);
await prefs.setInt('bukaKe', 1);
```

### Fungsi key yang digunakan

| Key | Tipe data | Kegunaan |
|---|---|---|
| `nama` | String | Menyimpan nama pengguna |
| `gelap` | bool | Menyimpan pilihan mode gelap |
| `bukaKe` | int | Menyimpan jumlah aplikasi dibuka |

### Lifecycle widget

- `initState()` memanggil proses pemuatan data ketika halaman pertama kali dibuat.
- `dispose()` melepaskan `TextEditingController` ketika widget tidak lagi digunakan.
- `setState()` memperbarui tampilan ketika nilai yang ditampilkan berubah.

## Struktur File

```text
bagian-a-shared-preferences/
├── main.dart
├── README.md
└── screenshots/
```

## Persiapan

Dari folder proyek `pertemuan-5/praktikum`, jalankan:

```bash
flutter pub add shared_preferences
```

## Cara Menjalankan

Pastikan terminal berada di folder:

```text
pemrograman-mobile/pertemuan-5/praktikum
```

Kemudian jalankan:

```bash
flutter run -t bagian-a-shared-preferences/main.dart
```

Gunakan emulator Android atau perangkat Android yang terhubung.

## Langkah Pengujian

1. Jalankan aplikasi.
2. Masukkan nama pada kolom Nama.
3. Tekan tombol **Simpan nama**.
4. Aktifkan **Mode gelap**.
5. Catat angka pada bagian Jumlah aplikasi dibuka.
6. Hentikan aplikasi sepenuhnya menggunakan tombol Stop, bukan hot reload.
7. Jalankan aplikasi kembali dengan perintah `flutter run` yang sama.
8. Pastikan nama dan mode gelap masih tersimpan.
9. Pastikan angka jumlah aplikasi dibuka bertambah.

## Screenshot Dokumentasi

Simpan screenshot hasil praktikum pada folder `screenshots/` dengan nama berikut:

- `01-pengaturan-awal.png` — tampilan awal aplikasi.
- `02-nama-tersimpan.png` — nama yang sudah disimpan.
- `03-mode-gelap.png` — tampilan ketika mode gelap aktif.
- `04-data-setelah-restart.png` — bukti nama, tema, dan hitungan tetap tersimpan setelah aplikasi dijalankan kembali.

Buat folder screenshot jika belum tersedia:

```bash
mkdir -p bagian-a-shared-preferences/screenshots
```

## Kesimpulan

`SharedPreferences` dapat digunakan untuk menyimpan pengaturan sederhana secara lokal. Data dibaca kembali saat aplikasi dibuka, sehingga nilai yang sudah disimpan tidak hanya bergantung pada state widget selama aplikasi berjalan.

## Referensi

- [Flutter — Membaca dan menulis data key-value](https://docs.flutter.dev/cookbook/persistence/key-value)
- [Paket shared_preferences](https://pub.dev/packages/shared_preferences)
