# Pertemuan 5 — Penyimpanan Lokal (SharedPreferences dan SQLite)

## Deskripsi

Pertemuan 5 membahas cara menyimpan data secara lokal pada aplikasi Flutter agar data atau pengaturan tertentu tidak hilang ketika aplikasi ditutup.

Materi mencakup penyimpanan sederhana menggunakan `shared_preferences`, penyimpanan data terstruktur menggunakan SQLite, operasi CRUD, validasi form, dan pemisahan kode model, akses data, serta UI.

## Tujuan Pembelajaran

Setelah menyelesaikan materi ini, mahasiswa diharapkan mampu:

1. Memilih jenis penyimpanan lokal yang sesuai dengan kebutuhan aplikasi.
2. Menyimpan dan membaca pengaturan menggunakan `shared_preferences`.
3. Membuat database SQLite dan tabel menggunakan `sqflite`.
4. Mengimplementasikan operasi Create, Read, Update, dan Delete (CRUD).
5. Menghubungkan database dengan antarmuka aplikasi Flutter.
6. Memastikan data tetap tersedia setelah aplikasi ditutup dan dibuka kembali.

## 1. Jenis Penyimpanan Lokal

### A. SharedPreferences

`shared_preferences` digunakan untuk menyimpan data sederhana dalam format key-value.

Contoh penggunaan:
- Nama pengguna.
- Pilihan mode gelap.
- Pengaturan aplikasi.
- Jumlah aplikasi dibuka.

Contoh penyimpanan nilai:

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setString('nama', 'Ilham');
```

Contoh membaca nilai:

```dart
final prefs = await SharedPreferences.getInstance();
final nama = prefs.getString('nama') ?? '';
```

Gunakan nilai bawaan dengan operator `??` apabila nilai belum pernah disimpan.

### B. SQLite

SQLite merupakan database lokal yang cocok untuk data terstruktur, seperti catatan, transaksi, dan pengeluaran.

Pada Flutter, materi ini menggunakan paket:
- `sqflite` untuk operasi database SQLite.
- `path` untuk membantu menyusun lokasi database.

SQLite menyimpan data dalam tabel yang mempunyai kolom dan baris.

Contoh tabel catatan:

| Kolom | Tipe | Keterangan |
|---|---|---|
| `id` | INTEGER | Primary key dengan autoincrement |
| `judul` | TEXT | Judul catatan |
| `isi` | TEXT | Isi catatan |

### C. Perbedaan SharedPreferences dan SQLite

| Aspek | SharedPreferences | SQLite |
|---|---|---|
| Bentuk data | Key-value | Tabel dan baris |
| Penggunaan | Pengaturan sederhana | Data terstruktur |
| Contoh | Tema aplikasi | Catatan dan transaksi |
| Operasi utama | Membaca dan menyimpan nilai | CRUD dan query |

## 2. Konsep CRUD

CRUD adalah empat operasi dasar dalam pengelolaan data.

| Operasi | Arti | Contoh pada sqflite |
|---|---|---|
| Create | Menambah data | `db.insert()` |
| Read | Membaca data | `db.query()` |
| Update | Mengubah data | `db.update()` |
| Delete | Menghapus data | `db.delete()` |

### Contoh penggunaan

Menambah data:

```dart
await db.insert('catatan', catatan.toMap());
```

Membaca data:

```dart
final rows = await db.query('catatan');
```

Mengubah data:

```dart
await db.update(
  'catatan',
  catatan.toMap(),
  where: 'id = ?',
  whereArgs: [catatan.id],
);
```

Menghapus data:

```dart
await db.delete(
  'catatan',
  where: 'id = ?',
  whereArgs: [id],
);
```

## 3. Keamanan Query Database

Hindari menyusun query SQL dengan menyambungkan teks masukan pengguna secara langsung.

Gunakan placeholder `?` dan `whereArgs`:

```dart
where: 'id = ?',
whereArgs: [id],
```

Pendekatan ini membantu memisahkan perintah SQL dari nilai yang digunakan dalam query.

## 4. Struktur Model dan Akses Database

### Model

Model merepresentasikan data aplikasi sebagai objek Dart.

Contoh model `Catatan` memiliki:
- `id`
- `judul`
- `isi`
- `toMap()` untuk mengubah objek menjadi data yang dapat disimpan.
- `fromMap()` untuk membentuk objek dari hasil query.

### Database Helper

Kelas `DbHelper` bertanggung jawab untuk:
- Membuka atau membuat database.
- Membuat tabel.
- Menambahkan data.
- Mengambil data.
- Mengubah data.
- Menghapus data.

### UI

UI menampilkan data kepada pengguna dan menyediakan form untuk menambah atau mengubah data.

Pemisahan model, akses database, dan UI membuat kode lebih terstruktur serta mudah dirawat.

## 5. Versi Database

SQLite menggunakan versi database untuk mengelola perubahan struktur tabel.

### `onCreate`

Dipanggil saat database pertama kali dibuat. Bagian ini digunakan untuk membuat tabel awal.

### `onUpgrade`

Dipanggil ketika versi database yang diminta lebih tinggi daripada versi yang tersimpan. Bagian ini dapat digunakan untuk menambahkan kolom atau mengubah skema database.

Apabila struktur tabel berubah, versi database perlu dinaikkan dan perubahan skema perlu ditangani dengan benar.

## 6. Asynchronous Programming

Operasi penyimpanan lokal dapat menggunakan `Future` dan `async/await`.

Contoh:

```dart
Future<void> simpanData() async {
  await DbHelper.tambah(catatan);
}
```

Penggunaan `await` memungkinkan operasi asynchronous diselesaikan sebelum proses berikutnya dijalankan.

Setelah `await`, periksa `mounted` sebelum menggunakan `context` atau melakukan `setState` apabila widget mungkin sudah tidak aktif.

## 7. Bagian Praktikum

Pertemuan 5 terdiri atas:

- **Bagian A — SharedPreferences:** menyimpan nama, mode gelap, dan jumlah aplikasi dibuka.
- **Bagian B — Menyiapkan SQLite:** membuat model `Catatan` dan helper database.
- **Bagian C — Daftar Catatan:** membaca dan menghapus catatan.
- **Bagian D — Form Catatan:** menambah dan mengubah catatan.
- **Latihan Mandiri:** konfirmasi penghapusan, pencarian, penambahan kolom tanggal, dan penyimpanan pilihan urutan.

Kode setiap bagian didokumentasikan di folder `praktikum/`.

## 8. Tugas Utama — Pencatat Pengeluaran

Tugas utama adalah membuat aplikasi pencatat pengeluaran dengan fitur:

1. Menampilkan daftar pengeluaran.
2. Menambah pengeluaran.
3. Mengubah pengeluaran.
4. Menghapus pengeluaran.
5. Memvalidasi nama, jumlah, dan kategori.
6. Menampilkan total pengeluaran.
7. Menyimpan satu pengaturan dengan `shared_preferences`.
8. Memastikan data tetap ada setelah aplikasi ditutup dan dibuka kembali.

Tabel pengeluaran memiliki kolom:
- `id`
- `nama`
- `jumlah`
- `kategori`
- `tanggal`

Detail implementasi, pengujian, dan dokumentasi screenshot tugas terdapat pada `tugas/pencatat_pengeluaran/README.md`.

## 9. Kesimpulan

Penyimpanan lokal memungkinkan aplikasi mempertahankan data setelah aplikasi ditutup. `shared_preferences` sesuai untuk pengaturan sederhana, sedangkan SQLite sesuai untuk data terstruktur yang membutuhkan operasi CRUD.

Dengan memisahkan model, akses database, dan UI, aplikasi menjadi lebih mudah dikembangkan dan dipelihara.

## Referensi

- Flutter: https://docs.flutter.dev/cookbook/persistence/key-value
- Flutter SQLite: https://docs.flutter.dev/cookbook/persistence/sqlite
- SharedPreferences: https://pub.dev/packages/shared_preferences
- sqflite: https://pub.dev/packages/sqflite