# Praktikum Pemrograman Mobile — Pertemuan 4

## Flutter Fundamental

**Pertemuan 4: Mengambil Data dari REST API (HTTP, Async, dan FutureBuilder)**

---

## 1. Tujuan Pembelajaran

Setelah menyelesaikan praktikum Pertemuan 4, mahasiswa diharapkan mampu:

1. Menjelaskan pemrograman asinkron di Dart menggunakan `Future`, `async`, dan `await`.
2. Mengambil data dari REST API menggunakan paket `http`.
3. Menguraikan data JSON menjadi data Dart.
4. Membuat class model dengan konstruktor `fromJson`.
5. Menampilkan data asinkron menggunakan `FutureBuilder`.
6. Menangani kondisi loading, error, dan data.
7. Menangani kegagalan jaringan.
8. Menyediakan tombol untuk mencoba memuat data kembali.

---

# 2. Alat dan Bahan

Peralatan yang digunakan:

- Flutter SDK.
- Visual Studio Code atau editor lainnya.
- Emulator atau perangkat Android dari pertemuan sebelumnya.
- Project Flutter baru.
- Koneksi internet.

Project Flutter dapat dibuat dengan:

```bash
flutter create praktikum_4
```

API yang digunakan:

```text
JSONPlaceholder
https://jsonplaceholder.typicode.com
```

API tersebut digunakan sebagai API publik untuk latihan.

Karena API publik dapat sewaktu-waktu lambat atau tidak tersedia, praktikum juga perlu mempertimbangkan mode offline atau data cadangan apabila diperlukan.

---

# 3. Teori Singkat

## 3.1 Pemrograman Asinkron

Mengambil data dari internet membutuhkan waktu.

Jika aplikasi menunggu proses jaringan secara langsung, antarmuka dapat terasa tidak responsif.

Dart menggunakan konsep:

```text
Future
async
await
```

### Future

`Future` adalah objek yang menyimpan hasil yang akan tersedia pada waktu mendatang.

Contoh:

```dart
Future<String>
```

berarti operasi tersebut akan menghasilkan `String` pada suatu waktu nanti.

### async

Fungsi yang melakukan operasi asynchronous dapat ditandai dengan:

```dart
async
```

### await

`await` digunakan untuk menunggu hasil dari sebuah `Future` tanpa memblokir UI.

`await` hanya dapat digunakan di dalam fungsi yang bertanda `async`.

---

# 4. REST API dan JSON

Aplikasi Flutter dapat berkomunikasi dengan server menggunakan HTTP.

Salah satu metode yang digunakan adalah:

```text
GET
```

Data yang diterima dari REST API pada praktikum berbentuk:

```text
JSON
```

Status HTTP yang penting:

| Kode | Arti |
|---|---|
| `200` | Permintaan berhasil |
| `404` | Data atau endpoint tidak ditemukan |
| `500` | Terjadi kesalahan server |

---

# 5. Fungsi Penting

## `http.get()`

Digunakan untuk mengirim HTTP GET request.

Contoh:

```dart
final response = await http.get(uri);
```

Hasilnya berupa:

```text
Future<Response>
```

---

## `jsonDecode()`

Digunakan untuk mengubah teks JSON menjadi struktur data Dart seperti `Map` atau `List`.

Contoh:

```dart
final data = jsonDecode(response.body);
```

---

## `fromJson`

Konstruktor `fromJson` digunakan untuk mengubah data JSON menjadi object model.

Contoh:

```dart
factory Pengguna.fromJson(Map<String, dynamic> json) {
  return Pengguna(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}
```

---

# 6. FutureBuilder

`FutureBuilder` digunakan untuk membangun UI berdasarkan status sebuah `Future`.

Status yang perlu ditangani:

```text
Loading
Error
Data
```

Informasi tersebut dapat diperiksa melalui:

```dart
snapshot.connectionState
snapshot.data
snapshot.error
```

---

# 7. Langkah Praktikum

## Bagian A — Mengenal Future dan FutureBuilder

Pada bagian ini dibuat simulasi pengambilan data tanpa internet.

Fungsi `ambilSalam()` menunggu selama 2 detik sebelum menghasilkan teks.

Konsep yang dipelajari:

- `Future`
- `async`
- `await`
- `FutureBuilder`
- `ConnectionState.waiting`
- `snapshot.hasError`
- `snapshot.data`
- `initState`

Selama proses menunggu, aplikasi menampilkan indikator loading.

Setelah selesai, teks ditampilkan.

### Checkpoint

Selama 2 detik tampil indikator loading kemudian berubah menjadi:

```text
Halo dari masa depan!
```

Future dibuat di `initState()`, bukan di `build()`, agar proses asynchronous tidak dibuat ulang setiap kali widget dibangun kembali.

Dokumentasi:

[`praktikum/bagian-a-future/`](./praktikum/bagian-a-future/)

---

# 8. Bagian B — Menyiapkan Paket HTTP

Paket HTTP digunakan untuk melakukan komunikasi dengan REST API.

Install package:

```bash
flutter pub add http
```

Untuk aplikasi Android release, permission internet perlu tersedia pada:

```text
android/app/src/main/AndroidManifest.xml
```

Permission yang digunakan:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

Dokumentasi:

[`praktikum/bagian-b-http/`](./praktikum/bagian-b-http/)

---

# 9. Bagian C — Model dan Fungsi Pengambil Data

API yang digunakan:

```text
https://jsonplaceholder.typicode.com/users
```

Data pengguna memiliki beberapa field:

- `id`
- `name`
- `email`
- `phone`
- `website`

Data JSON diubah menjadi object model `Pengguna`.

Model memiliki konstruktor:

```dart
Pengguna.fromJson(...)
```

Fungsi:

```dart
Future<List<Pengguna>> ambilPengguna()
```

digunakan untuk mengambil data dari API.

Fungsi tersebut:

1. Membuat URI.
2. Mengirim GET request.
3. Memeriksa status response.
4. Menguraikan JSON.
5. Mengubah JSON menjadi object `Pengguna`.

Jika status response bukan `200`, fungsi melempar `Exception`.

Dokumentasi:

[`praktikum/bagian-c-model-api/`](./praktikum/bagian-c-model-api/)

---

# 10. Bagian D — Menampilkan Data dengan FutureBuilder

Pada bagian ini data dari API ditampilkan menggunakan `FutureBuilder`.

Aplikasi menangani tiga kondisi:

### Loading

Menampilkan:

```text
CircularProgressIndicator
```

### Error

Menampilkan pesan kesalahan dan tombol:

```text
Coba lagi
```

### Data

Menampilkan daftar pengguna menggunakan:

```text
ListView.builder
```

Setiap pengguna ditampilkan menggunakan:

```text
ListTile
CircleAvatar
```

Tombol refresh pada AppBar digunakan untuk memuat data kembali.

### Checkpoint

Sebanyak 10 pengguna tampil setelah proses loading singkat.

Dokumentasi:

[`praktikum/bagian-d-futurebuilder/`](./praktikum/bagian-d-futurebuilder/)

---

# 11. Bagian E — Halaman Detail

Ketika pengguna pada daftar diketuk, aplikasi membuka halaman detail.

Halaman detail menampilkan:

- Email.
- Nomor telepon.
- Website.

Navigasi dilakukan menggunakan:

```dart
Navigator.push()
```

Data pengguna dikirim ke halaman detail melalui constructor.

### Checkpoint

Mengetuk pengguna membuka halaman detail yang menampilkan email, telepon, dan website.

Dokumentasi:

[`praktikum/bagian-e-detail/`](./praktikum/bagian-e-detail/)

---

# 12. Bagian F — Percobaan Penanganan Galat

Pada bagian ini dilakukan dua percobaan error.

## Percobaan 1 — Endpoint Tidak Ditemukan

Ubah URL menjadi:

```text
https://jsonplaceholder.typicode.com/userz
```

Amati pesan error dan status:

```text
404
```

Setelah itu kembalikan URL ke endpoint yang benar:

```text
https://jsonplaceholder.typicode.com/users
```

Kemudian tekan:

```text
Coba lagi
```

---

## Percobaan 2 — Tidak Ada Koneksi Internet

Matikan koneksi internet perangkat atau emulator.

Kemudian tekan:

```text
Refresh
```

Amati pesan error jaringan.

Setelah itu nyalakan kembali internet dan tekan:

```text
Coba lagi
```

Dokumentasi:

[`praktikum/bagian-f-error-handling/`](./praktikum/bagian-f-error-handling/)

---

# 13. Latihan Mandiri

## Latihan 1 — Username dan Kota

Tambahkan field:

```text
username
kota
```

Kota berasal dari JSON bersarang:

```dart
json['address']['city']
```

Kemudian tampilkan data tersebut pada halaman detail.

Dokumentasi:

[`latihan-1-username-kota/`](./praktikum/latihan-mandiri/latihan-1-username-kota/)

---

## Latihan 2 — RefreshIndicator

Bungkus `ListView` menggunakan:

```dart
RefreshIndicator
```

agar daftar dapat dimuat ulang dengan cara ditarik ke bawah.

Dokumentasi:

[`latihan-2-refresh-indicator/`](./praktikum/latihan-mandiri/latihan-2-refresh-indicator/)

---

## Latihan 3 — Daftar Kosong

Jika daftar pengguna kosong, tampilkan teks:

```text
Tidak ada data
```

di layar.

Dokumentasi:

[`latihan-3-daftar-kosong/`](./praktikum/latihan-mandiri/latihan-3-daftar-kosong/)

---

## Latihan 4 — Jumlah Pengguna

Setelah data berhasil dimuat, tampilkan jumlah pengguna pada AppBar.

Contoh:

```text
Daftar Pengguna (10)
```

Dokumentasi:

[`latihan-4-jumlah-pengguna/`](./praktikum/latihan-mandiri/latihan-4-jumlah-pengguna/)

---

# 14. Tugas — Daftar Postingan

Buat aplikasi **Daftar Postingan** menggunakan REST API.

Endpoint utama:

```text
/posts
```

Detail komentar:

```text
/posts/{id}/comments
```

Dengan base URL:

```text
https://jsonplaceholder.typicode.com
```

---

## Halaman Utama

Halaman utama harus:

- Menampilkan daftar postingan.
- Menampilkan judul postingan.
- Menampilkan potongan isi postingan.
- Menggunakan `FutureBuilder`.

---

## Halaman Detail

Ketika postingan diketuk, halaman detail harus menampilkan:

- Judul lengkap.
- Isi lengkap.
- Daftar komentar.

Komentar diambil dari endpoint terpisah menggunakan `Future` kedua.

---

## Model

Buat model:

```text
Post
Komentar
```

Keduanya menggunakan:

```text
fromJson
```

untuk mengubah data JSON menjadi object model.

---

## Pemisahan Kode

Kode pengambilan data dipisahkan dari kode UI.

Struktur aplikasi diarahkan agar model, service/API, dan UI tidak tercampur dalam satu bagian kode.

---

## Loading dan Error

Halaman utama dan halaman detail harus menangani:

```text
Loading
Error
Data
```

Pada kondisi error tersedia tombol:

```text
Coba lagi
```

---

## Pengumpulan

Yang dikumpulkan:

1. Screenshot halaman daftar.
2. Screenshot halaman detail.
3. Screenshot tampilan error.
4. Berkas `main.dart` atau tautan repository.

Dokumentasi:

[`tugas/daftar-postingan/`](./tugas/daftar-postingan/)

---

# 15. Rubrik Penilaian

| Komponen | Bobot |
|---|---:|
| Bagian A–E berjalan / checkpoint | 30% |
| Percobaan galat dan latihan mandiri | 20% |
| Tugas Daftar Postingan | 40% |
| Kerapian kode dan pemisahan model/layanan/UI | 10% |
| **Total** | **100%** |

---

# 16. Pertanyaan Refleksi

1. Apa yang terjadi jika `Future` dibuat di dalam `build()` dan bukan di `initState()`? Mengapa?
2. Apa perbedaan `snapshot.hasError` dengan pemeriksaan `response.statusCode`? Mengapa keduanya diperlukan?
3. Mengapa data JSON sebaiknya diubah menjadi class model, bukan langsung digunakan sebagai `Map`?
4. Mengapa UI perlu menyediakan status loading dan error, bukan hanya status data?

---

# 17. Troubleshooting Umum

| Masalah | Solusi |
|---|---|
| `SocketException` / `Failed host lookup` | Periksa koneksi internet emulator dan permission internet |
| Package `http` tidak ditemukan | Jalankan `flutter pub get` lalu restart aplikasi |
| Data dimuat ulang setiap layar berubah | Pindahkan pembuatan `Future` ke `initState()` |
| Error `type 'Null' is not a subtype` | Periksa nama key JSON atau kemungkinan nilai `null` |
| API publik lambat atau tidak tersedia | Tunggu beberapa saat, coba lagi, atau gunakan data JSON cadangan |

---

# 18. Referensi

- Flutter Networking — Fetch Data
- Dart Async dan Await
- Package `http`
- JSONPlaceholder

---

# 19. Ringkasan Pertemuan 4

Pada Pertemuan 4 dipelajari:

1. Pemrograman asynchronous.
2. `Future`.
3. `async`.
4. `await`.
5. REST API.
6. HTTP GET.
7. JSON.
8. `jsonDecode`.
9. Model `fromJson`.
10. Package `http`.
11. `FutureBuilder`.
12. Loading state.
13. Error state.
14. Retry.
15. `ListView.builder`.
16. Navigasi ke halaman detail.
17. Penanganan error jaringan.
18. `RefreshIndicator`.
19. Pengambilan data dari endpoint berbeda.
20. Pemisahan model, layanan/API, dan UI.

---

## Identitas

**Nama:** Ilham Firmansyah  
**NIM:** 20240801102  
**Jurusan:** Teknik Informatika  
**Mata Kuliah:** Pemrograman Mobile  
**Pertemuan:** 4