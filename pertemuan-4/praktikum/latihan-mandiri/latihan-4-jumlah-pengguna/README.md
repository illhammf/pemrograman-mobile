# Latihan 4 — Jumlah Pengguna

## Tujuan

Menampilkan jumlah pengguna yang berhasil dimuat pada AppBar.

## Contoh

Jika API mengembalikan 10 pengguna:

```text
Daftar Pengguna (10)
```

## Implementasi

Jumlah data diperoleh dengan:
```dart
snapshot.data!.length
```

dan ditampilkan setelah ***snapshot.hasData*** bernilai true.

## Hasil

Jumlah pengguna berubah sesuai jumlah data yang berhasil diterima
dari API.

---

## Cara menjalankan masing-masing latihan

Karena semua punya `main.dart` sendiri, dari folder:

```bash
cd ~/perkuliahan/pemrograman_mobile/pemrograman-mobile/pertemuan-4/praktikum
```

jalankan misalnya Latihan 1:
```sh
flutter run -t latihan-mandiri/latihan-1-username-kota/main.dart
```

Latihan 2:
```sh
flutter run -t latihan-mandiri/latihan-2-refresh-indicator/main.dart
```

Latihan 3:
```sh
flutter run -t latihan-mandiri/latihan-3-daftar-kosong/main.dart
```

Latihan 4:
```sh
flutter run -t latihan-mandiri/latihan-4-jumlah-pengguna/main.dart
```