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