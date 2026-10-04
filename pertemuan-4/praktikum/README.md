# Praktikum Pertemuan 4

## Mengambil Data dari REST API
### HTTP, Async, dan FutureBuilder

Praktikum Pertemuan 4 membahas pemrograman asynchronous pada Dart, pengambilan data dari REST API menggunakan HTTP, pengolahan JSON menjadi model Dart, penggunaan `FutureBuilder`, penanganan loading dan error, serta navigasi ke halaman detail.

---

# 1. Tujuan Praktikum

Setelah menyelesaikan praktikum ini, mahasiswa diharapkan mampu:

1. Menjelaskan konsep `Future`, `async`, dan `await`.
2. Mengambil data dari REST API menggunakan package `http`.
3. Menguraikan data JSON menjadi data Dart.
4. Membuat class model dengan constructor `fromJson`.
5. Menampilkan data asynchronous menggunakan `FutureBuilder`.
6. Menangani kondisi loading.
7. Menangani kondisi error.
8. Menyediakan mekanisme untuk mencoba kembali mengambil data.
9. Menampilkan detail data dari hasil API.
10. Memahami penanganan kegagalan jaringan.

---

# 2. Struktur Praktikum

```text
praktikum/
├── README.md
│
├── bagian-a-future/
│   ├── README.md
│   └── main.dart
│
├── bagian-b-http/
│   ├── README.md
│   └── main.dart
│
├── bagian-c-model-api/
│   ├── README.md
│   └── main.dart
│
├── bagian-d-futurebuilder/
│   ├── README.md
│   └── main.dart
│
├── bagian-e-detail/
│   ├── README.md
│   └── main.dart
│
├── bagian-f-error-handling/
│   ├── README.md
│   └── main.dart
│
└── latihan-mandiri/
    ├── latihan-1-username-kota/
    ├── latihan-2-refresh-indicator/
    ├── latihan-3-daftar-kosong/
    └── latihan-4-jumlah-pengguna/
```

---

# 3. Konsep Utama

## 3.1 Future

`Future` digunakan untuk merepresentasikan hasil yang akan tersedia pada waktu mendatang.

Pengambilan data dari internet membutuhkan waktu sehingga proses tersebut tidak dapat selalu dilakukan secara langsung.

---

## 3.2 async

Kata kunci `async` digunakan untuk menandai fungsi yang melakukan operasi asynchronous.

Contoh:

```dart
Future<String> ambilData() async {
  ...
}
```

---

## 3.3 await

`await` digunakan untuk menunggu hasil dari sebuah `Future`.

Contoh:

```dart
final response = await http.get(uri);
```

`await` hanya digunakan di dalam fungsi yang bertanda `async`.

---

## 3.4 REST API

REST API digunakan agar aplikasi dapat berkomunikasi dengan server.

Pada praktikum ini digunakan HTTP `GET`.

API yang digunakan:

```text
https://jsonplaceholder.typicode.com
```

---

## 3.5 JSON

Data dari REST API diterima dalam bentuk JSON.

JSON kemudian diubah menjadi struktur data Dart menggunakan:

```dart
jsonDecode()
```

---

## 3.6 Model

Data JSON diubah menjadi object model agar lebih mudah digunakan dalam aplikasi.

Contoh:

```dart
Pengguna.fromJson(...)
```

---

## 3.7 FutureBuilder

`FutureBuilder` digunakan untuk membangun tampilan berdasarkan status suatu `Future`.

Status yang diperhatikan:

```text
Loading
Error
Data
```

Informasi tersebut tersedia melalui `snapshot`.

---

# 4. Bagian A — Mengenal Future dan FutureBuilder

Pada bagian ini dibuat simulasi pengambilan data tanpa koneksi internet.

Fungsi `ambilSalam()` menunggu selama dua detik menggunakan:

```dart
Future.delayed()
```

Setelah dua detik fungsi mengembalikan teks:

```text
Halo dari masa depan!
```

Selama menunggu aplikasi menampilkan:

```text
CircularProgressIndicator
```

Bagian ini memperkenalkan:

- `Future`
- `async`
- `await`
- `FutureBuilder`
- `ConnectionState.waiting`
- `snapshot.hasError`
- `snapshot.data`
- `initState()`

Dokumentasi:

[`bagian-a-future/`](./bagian-a-future/)

---

# 5. Bagian B — Menyiapkan Paket HTTP

Pada bagian ini package `http` digunakan untuk melakukan permintaan HTTP.

Package ditambahkan dengan:

```bash
flutter pub add http
```

Untuk Android, permission internet perlu tersedia agar aplikasi dapat mengakses jaringan.

Permission:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

Dokumentasi:

[`bagian-b-http/`](./bagian-b-http/)

---

# 6. Bagian C — Model dan Fungsi Pengambil Data

API pengguna:

```text
https://jsonplaceholder.typicode.com/users
```

Data pengguna memiliki field:

- `id`
- `name`
- `email`
- `phone`
- `website`

Dibuat model:

```text
Pengguna
```

Model menggunakan constructor:

```dart
Pengguna.fromJson(...)
```

Fungsi pengambil data:

```dart
Future<List<Pengguna>> ambilPengguna()
```

Fungsi melakukan:

1. Membuat URI.
2. Mengirim HTTP GET.
3. Memeriksa status response.
4. Menguraikan JSON.
5. Mengubah JSON menjadi object `Pengguna`.

Dokumentasi:

[`bagian-c-model-api/`](./bagian-c-model-api/)

---

# 7. Bagian D — Menampilkan Data dengan FutureBuilder

Data pengguna ditampilkan menggunakan:

```dart
FutureBuilder<List<Pengguna>>
```

Aplikasi menangani tiga kondisi:

## Loading

Menampilkan:

```text
CircularProgressIndicator
```

## Error

Menampilkan pesan error dan tombol:

```text
Coba lagi
```

## Data

Menampilkan pengguna dengan:

```text
ListView.builder
```

Setiap pengguna menggunakan:

```text
CircleAvatar
ListTile
```

AppBar memiliki tombol refresh untuk memuat ulang data.

Dokumentasi:

[`bagian-d-futurebuilder/`](./bagian-d-futurebuilder/)

---

# 8. Bagian E — Halaman Detail

Ketika pengguna dipilih, aplikasi membuka halaman detail.

Halaman detail menampilkan:

- Email.
- Nomor telepon.
- Website.

Data pengguna dikirim ke halaman detail melalui constructor.

Navigasi menggunakan:

```dart
Navigator.push()
```

Dokumentasi:

[`bagian-e-detail/`](./bagian-e-detail/)

---

# 9. Bagian F — Percobaan Penanganan Galat

Terdapat dua percobaan.

## Percobaan 1 — Endpoint Tidak Ditemukan

URL diubah menjadi:

```text
https://jsonplaceholder.typicode.com/userz
```

Kemudian diamati error dengan kode:

```text
404
```

Setelah itu URL dikembalikan ke endpoint yang benar.

---

## Percobaan 2 — Tidak Ada Koneksi Internet

Koneksi internet perangkat atau emulator dimatikan.

Kemudian tombol refresh ditekan.

Pesan error jaringan diamati.

Setelah internet kembali aktif, tombol:

```text
Coba lagi
```

digunakan untuk mengambil data kembali.

Dokumentasi:

[`bagian-f-error-handling/`](./bagian-f-error-handling/)

---

# 10. Latihan Mandiri

## Latihan 1 — Username dan Kota

Menambahkan field:

```text
username
kota
```

Kota berasal dari JSON bersarang:

```dart
json['address']['city']
```

Data ditampilkan pada halaman detail.

---

## Latihan 2 — RefreshIndicator

Membungkus daftar menggunakan:

```dart
RefreshIndicator
```

agar pengguna dapat melakukan pull-to-refresh.

---

## Latihan 3 — Daftar Kosong

Jika data yang diterima kosong, tampilkan:

```text
Tidak ada data
```

---

## Latihan 4 — Jumlah Pengguna

Setelah data berhasil dimuat, tampilkan jumlah pengguna pada AppBar.

Contoh:

```text
Daftar Pengguna (10)
```

---

# 11. Checkpoint

Checkpoint praktikum:

- [ ] Bagian A berhasil menampilkan loading kemudian teks.
- [ ] Bagian B package HTTP berhasil dipasang.
- [ ] Bagian C model dan fungsi pengambil data berhasil dibuat.
- [ ] Bagian D menampilkan loading, error, dan data.
- [ ] Bagian D tombol refresh berfungsi.
- [ ] Bagian E detail pengguna berhasil dibuka.
- [ ] Bagian F error 404 berhasil diuji.
- [ ] Bagian F error jaringan berhasil diuji.
- [ ] Latihan mandiri selesai.

---

# 12. Identitas

**Nama:** Ilham Firmansyah  
**NIM:** 20240801102  
**Jurusan:** Teknik Informatika  
**Mata Kuliah:** Pemrograman Mobile  
**Pertemuan:** 4