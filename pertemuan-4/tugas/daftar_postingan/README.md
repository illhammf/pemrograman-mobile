# Tugas Pertemuan 4 — Daftar Postingan

## 1. Deskripsi

Aplikasi **Daftar Postingan** dibuat menggunakan Flutter untuk mengambil dan menampilkan data dari REST API. Aplikasi menggunakan endpoint `/posts` untuk menampilkan daftar postingan dan endpoint `/posts/{id}/comments` untuk mengambil komentar pada postingan yang dipilih.

Tugas ini menerapkan HTTP request, JSON parsing, model Dart dengan `fromJson`, `Future`, `async/await`, `FutureBuilder`, navigasi antarhalaman, serta penanganan loading dan error.

## 2. Tujuan

- Mengambil data postingan dari REST API.
- Mengubah JSON menjadi objek model `Post` dan `Komentar`.
- Menampilkan daftar judul dan potongan isi postingan.
- Menampilkan isi postingan dan komentar pada halaman detail.
- Mengambil komentar menggunakan `Future` terpisah.
- Menampilkan loading, error, dan tombol **Coba lagi** pada daftar postingan maupun komentar.
- Memisahkan kode model, service API, dan UI.

## 3. Endpoint API

API yang digunakan adalah JSONPlaceholder.

| Kegunaan | Metode | Endpoint |
|---|---|---|
| Mengambil daftar postingan | `GET` | `https://jsonplaceholder.typicode.com/posts` |
| Mengambil komentar sebuah postingan | `GET` | `https://jsonplaceholder.typicode.com/posts/{id}/comments` |

`{id}` diganti dengan ID postingan yang sedang dibuka. Contohnya, komentar untuk postingan nomor 1 diambil dari `/posts/1/comments`.

## 4. Struktur Project

```text
 daftar_postingan/
 ├── README.md
 ├── screenshots/
 │   ├── 01-daftar-postingan.png
 │   ├── 02-detail-postingan-komentar.png
 │   ├── 03-error-daftar-postingan.png
 │   └── 04-error-komentar.png
 └── lib/
     ├── main.dart
     ├── models/
     │   ├── post.dart
     │   └── komentar.dart
     ├── services/
     │   └── api_service.dart
     └── pages/
         ├── post_list_page.dart
         └── post_detail_page.dart
```

Folder `screenshots/` digunakan untuk menyimpan bukti pengujian aplikasi. Nama file screenshot sebaiknya mengikuti nama di atas agar gambar langsung muncul pada bagian dokumentasi di README ini.

## 5. Penjelasan File

### `lib/main.dart`

File utama yang menjalankan aplikasi dan membuka halaman `PostListPage`.

### `lib/models/post.dart`

Model `Post` menyimpan data postingan:

- `userId`
- `id`
- `title`
- `body`

Method factory `Post.fromJson()` mengubah data JSON menjadi objek `Post`.

### `lib/models/komentar.dart`

Model `Komentar` menyimpan data komentar:

- `postId`
- `id`
- `name`
- `email`
- `body`

Method factory `Komentar.fromJson()` mengubah data JSON menjadi objek `Komentar`.

### `lib/services/api_service.dart`

File ini bertanggung jawab untuk mengambil data dari REST API. Service menyediakan fungsi untuk mengambil daftar postingan dan komentar berdasarkan ID postingan. Pemeriksaan status HTTP dilakukan sebelum response diubah menjadi model.

### `lib/pages/post_list_page.dart`

Halaman utama menampilkan daftar postingan dengan judul dan potongan isi. Halaman menggunakan `FutureBuilder` untuk menangani status loading, error, dan data. Setiap postingan dapat ditekan untuk membuka halaman detail.

### `lib/pages/post_detail_page.dart`

Halaman detail menampilkan judul dan isi lengkap postingan, kemudian mengambil komentar melalui `Future` terpisah. Bagian komentar juga menampilkan loading, error, dan tombol **Coba lagi**.

## 6. Fitur Aplikasi

1. Mengambil dan menampilkan daftar postingan dari endpoint `/posts`.
2. Menampilkan judul serta potongan isi setiap postingan.
3. Membuka halaman detail saat postingan ditekan.
4. Menampilkan isi lengkap postingan.
5. Mengambil dan menampilkan komentar melalui endpoint `/posts/{id}/comments`.
6. Menampilkan indikator loading saat data sedang dimuat.
7. Menampilkan pesan error apabila request gagal.
8. Menyediakan tombol **Coba lagi** pada daftar postingan dan bagian komentar.
9. Menyediakan tombol refresh untuk memuat ulang daftar atau komentar.
10. Menangani kondisi ketika daftar postingan atau komentar kosong.

## 7. Cara Menjalankan Aplikasi

Buka terminal di folder project `daftar_postingan`, kemudian jalankan:

```bash
flutter pub get
flutter run
```

Pastikan perangkat atau emulator memiliki koneksi internet.

Untuk Android, periksa file `android/app/src/main/AndroidManifest.xml`. Pastikan izin internet berikut berada di dalam tag `<manifest>` dan sebelum tag `<application>`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

## 8. Skenario Pengujian

### Pengujian 1 — Daftar Postingan

1. Jalankan aplikasi dengan koneksi internet aktif.
2. Tunggu sampai loading selesai.
3. Pastikan daftar postingan tampil dengan judul dan potongan isi.
4. Ambil screenshot dan simpan sebagai `screenshots/01-daftar-postingan.png`.

### Pengujian 2 — Detail Postingan dan Komentar

1. Tekan salah satu postingan.
2. Pastikan halaman detail menampilkan judul dan isi lengkap.
3. Tunggu sampai komentar berhasil dimuat.
4. Pastikan komentar menampilkan nama, email, dan isi komentar.
5. Ambil screenshot dan simpan sebagai `screenshots/02-detail-postingan-komentar.png`.

### Pengujian 3 — Error Daftar Postingan

1. Buka `lib/services/api_service.dart`.
2. Pada fungsi pengambilan postingan, ubah endpoint sementara dari `/posts` menjadi endpoint yang salah, misalnya `/postzzz`.
3. Jalankan ulang aplikasi atau lakukan hot restart.
4. Pastikan halaman daftar menampilkan pesan error dan tombol **Coba lagi**.
5. Ambil screenshot dan simpan sebagai `screenshots/03-error-daftar-postingan.png`.
6. Kembalikan endpoint menjadi `/posts`.
7. Jalankan ulang atau tekan **Coba lagi** setelah kode diperbarui. Pastikan daftar postingan kembali tampil.

**Penting:** Jangan biarkan endpoint salah pada kode akhir yang dikumpulkan.

### Pengujian 4 — Error Komentar

1. Pada fungsi pengambilan komentar di `lib/services/api_service.dart`, ubah endpoint komentar sementara menjadi endpoint yang salah, misalnya `/posts/$postId/commentzzz`.
2. Jalankan ulang aplikasi dan buka salah satu detail postingan.
3. Pastikan bagian komentar menampilkan pesan error dan tombol **Coba lagi**.
4. Ambil screenshot dan simpan sebagai `screenshots/04-error-komentar.png`.
5. Kembalikan endpoint ke `/posts/$postId/comments`.
6. Jalankan ulang atau tekan **Coba lagi** setelah kode diperbarui. Pastikan komentar kembali tampil.

**Penting:** Kembalikan semua endpoint ke URL yang benar setelah pengujian.

## 9. Dokumentasi Screenshot

Simpan semua gambar di folder `screenshots/` yang berada sejajar dengan `README.md`. Gunakan nama file persis seperti yang tercantum di bawah ini.

### Screenshot 1 — Daftar Postingan

**Nama file:** `screenshots/01-daftar-postingan.png`  
**Yang harus terlihat:** halaman utama, beberapa judul postingan, dan potongan isi postingan.

![Screenshot daftar postingan](screenshots/01-daftar-postingan.png)

### Screenshot 2 — Detail Postingan dan Komentar

**Nama file:** `screenshots/02-detail-postingan-komentar.png`  
**Yang harus terlihat:** judul dan isi lengkap postingan, serta daftar komentar yang berhasil dimuat. Atur posisi layar agar bagian isi postingan dan beberapa komentar terlihat sejelas mungkin.

![Screenshot detail postingan dan komentar](screenshots/02-detail-postingan-komentar.png)

### Screenshot 3 — Error Daftar Postingan

**Nama file:** `screenshots/03-error-daftar-postingan.png`  
**Yang harus terlihat:** halaman daftar ketika request postingan gagal, pesan error, dan tombol **Coba lagi**.

![Screenshot error daftar postingan](screenshots/03-error-daftar-postingan.png)

### Screenshot 4 — Error Komentar

**Nama file:** `screenshots/04-error-komentar.png`  
**Yang harus terlihat:** halaman detail ketika request komentar gagal, pesan error komentar, dan tombol **Coba lagi**.

![Screenshot error komentar](screenshots/04-error-komentar.png)

**Catatan:** Modul meminta screenshot daftar, detail, dan tampilan error. Screenshot nomor 1–3 memenuhi kelompok bukti utama tersebut; screenshot nomor 4 disarankan agar penanganan error di bagian komentar juga terdokumentasi.

## 10. Checklist Sebelum Dikumpulkan

### Fungsi Aplikasi

- [ ] Daftar postingan berhasil dimuat dari `/posts`.
- [ ] Judul dan potongan isi postingan tampil.
- [ ] Postingan dapat dibuka ke halaman detail.
- [ ] Halaman detail menampilkan isi lengkap.
- [ ] Komentar berhasil dimuat dari endpoint terpisah.
- [ ] Model `Post` dan `Komentar` memiliki `fromJson`.
- [ ] Daftar postingan memiliki tampilan loading dan error.
- [ ] Daftar postingan memiliki tombol **Coba lagi**.
- [ ] Komentar memiliki tampilan loading dan error.
- [ ] Komentar memiliki tombol **Coba lagi**.
- [ ] Semua endpoint sudah dikembalikan ke URL yang benar.

### Kerapian dan Dokumentasi

- [ ] Kode model, service, dan UI dipisahkan ke folder masing-masing.
- [ ] `flutter pub get` berhasil dijalankan.
- [ ] Aplikasi diuji pada perangkat atau emulator.
- [ ] Screenshot daftar postingan sudah disimpan.
- [ ] Screenshot detail postingan dan komentar sudah disimpan.
- [ ] Screenshot error daftar postingan sudah disimpan.
- [ ] Screenshot error komentar sudah disimpan (disarankan).
- [ ] README sudah menampilkan gambar dari folder `screenshots/`.

## 11. Kesimpulan

Aplikasi Daftar Postingan menerapkan pengambilan data REST API dengan Flutter. Data diubah menjadi model `Post` dan `Komentar`, pengambilan data dipisahkan dalam `ApiService`, dan tampilan menggunakan `FutureBuilder` untuk menangani loading, error, serta data. Halaman detail menggunakan proses pengambilan komentar yang terpisah dan menyediakan fitur mencoba kembali ketika request gagal.
