# Tugas Pertemuan 4 — Daftar Postingan

## Deskripsi

Tugas Pertemuan 4 adalah membuat aplikasi **Daftar Postingan** menggunakan Flutter.

Aplikasi ini menerapkan konsep pengambilan data dari REST API dan menampilkan hasilnya pada antarmuka aplikasi mobile.

Konsep yang dipelajari meliputi:

- REST API.
- HTTP request.
- Pengambilan data secara asynchronous.
- `Future` dan `async/await`.
- Pemrosesan data JSON.
- Model data.
- `FutureBuilder`.
- Tampilan daftar menggunakan `ListView`.
- Penanganan loading dan error.

## Ketentuan Tugas

Berdasarkan materi Pertemuan 4, aplikasi Daftar Postingan berfokus pada pengambilan dan penampilan data dari API.

### 1. Pengambilan Data

Aplikasi mengambil data postingan dari REST API menggunakan HTTP request.

Data yang diperoleh kemudian diproses agar dapat digunakan oleh aplikasi Flutter.

### 2. Model Data

Data JSON diolah menjadi struktur data yang sesuai agar informasi postingan dapat digunakan dan ditampilkan dengan lebih mudah.

### 3. Halaman Daftar Postingan

Halaman utama digunakan untuk menampilkan daftar postingan yang diperoleh dari API.

Data ditampilkan dalam bentuk daftar sehingga pengguna dapat membaca informasi postingan yang tersedia.

### 4. Asynchronous Programming

Proses pengambilan data menggunakan konsep asynchronous agar aplikasi dapat menunggu hasil request tanpa harus menjalankan seluruh proses secara sinkron.

### 5. Loading dan Error

Aplikasi perlu memperhatikan kondisi saat data sedang dimuat maupun ketika terjadi kesalahan dalam pengambilan data.

Tampilan yang sesuai membantu pengguna memahami kondisi aplikasi.

## Pengumpulan

Berkas dan dokumentasi yang disiapkan untuk pengumpulan meliputi:

- Screenshot halaman daftar postingan.
- Screenshot tampilan loading atau kondisi lainnya yang relevan dengan implementasi.
- Source code aplikasi Flutter.
- README dokumentasi project.
- Tautan repository GitHub.

## Struktur Tugas

```text
tugas/
├── README.md
└── daftar_postingan/
    ├── README.md
    ├── screenshots/
    ├── lib/
    │   └── main.dart
    ├── pubspec.yaml
    └── ...
```

## Identitas

**Nama:** Ilham Firmansyah  
**NIM:** 20240801102  
**Jurusan:** Teknik Informatika  
**Mata Kuliah:** Pemrograman Mobile  
**Pertemuan:** 4

## Status

- [ ] Project Flutter dibuat.
- [ ] Pengambilan data REST API diterapkan.
- [ ] Data JSON diproses.
- [ ] Model data dibuat sesuai kebutuhan aplikasi.
- [ ] `Future` dan `async/await` digunakan.
- [ ] `FutureBuilder` digunakan untuk menangani proses pemuatan data.
- [ ] Daftar postingan ditampilkan.
- [ ] Kondisi loading ditangani.
- [ ] Kondisi error ditangani.
- [ ] Screenshot final ditambahkan.
- [ ] README dan source code disiapkan untuk pengumpulan.
