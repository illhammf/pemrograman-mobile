# Bagian F — Percobaan Penanganan Galat

## Deskripsi

Bagian F membahas pengujian penanganan galat pada aplikasi Flutter
yang mengambil data dari REST API.

Pada bagian ini dilakukan dua percobaan:

1. Menguji error HTTP 404 dengan menggunakan URL endpoint yang salah.
2. Menguji error jaringan dengan mematikan koneksi internet.

Aplikasi menyediakan tombol "Coba lagi" agar proses pengambilan data
dapat dijalankan kembali setelah masalah diperbaiki.

---

## Tujuan

Setelah menyelesaikan bagian ini, dapat memahami:

- bagaimana menangani response HTTP yang bukan status 200;
- bagaimana `FutureBuilder` menerima error dari `Future`;
- bagaimana menampilkan pesan kesalahan kepada pengguna;
- bagaimana melakukan request ulang dengan tombol "Coba lagi";
- perbedaan error API dengan error koneksi jaringan.

---

## Struktur File

```text
bagian-f-error-handling/
├── main.dart
└── README.md
```

# Konsep Error Handling

Fungsi ambilPengguna() memeriksa status HTTP dari response.
```dart
if (response.statusCode != 200) {
  throw Exception(
    'Gagal memuat data (kode ${response.statusCode})',
  );
}
```

Apabila **status response bukan 200**, fungsi melempar Exception.

Error tersebut kemudian dapat ditangkap oleh FutureBuilder melalui:
```dart
if (snapshot.hasError) {
  ...
}
```

Aplikasi kemudian menampilkan pesan kesalahan dan tombol:
```dart
Coba lagi
```