# Latihan 2 — RefreshIndicator

## Tujuan

Menambahkan fitur pull-to-refresh pada daftar pengguna.

## Fitur

Pengguna dapat menarik daftar ke bawah untuk meminta data terbaru.

## Implementasi

Menggunakan:

```dart
RefreshIndicator
```

dengan:

```dart
onRefresh: _refreshData
```

## Pengujian
1. Jalankan aplikasi.
2. Tampilkan daftar pengguna.
3. Tarik daftar ke bawah.
4. Indikator refresh akan muncul.
5. Data dimuat kembali dari API.

---