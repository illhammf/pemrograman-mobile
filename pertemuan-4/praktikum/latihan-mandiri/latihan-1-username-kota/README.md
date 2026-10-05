# Latihan 1 — Username dan Kota

## Tujuan

Menambahkan data `username` dan `city` dari REST API.

## Data JSON Bersarang

Kota diambil dari:

```dart
json['address']['city']
```

## Perubahan Model

Model Pengguna ditambahkan:
```dart
final String username;
final String city;
```

Kemudian ***fromJson()*** mengambil data tersebut.

## Hasil

Halaman daftar menampilkan nama dan username.

Halaman detail menampilkan:
- Username
- Kota
- Email
- Telepon
- Website

---
