# Bagian D — Menampilkan Data dengan FutureBuilder

## Tujuan

Menampilkan data pengguna dari REST API menggunakan `FutureBuilder`.

Pada bagian ini fungsi `ambilPengguna()` dari Bagian C digunakan untuk mengambil data dari JSONPlaceholder dan menampilkannya pada antarmuka.

---

# 1. Konsep

`FutureBuilder` digunakan untuk membangun UI berdasarkan status suatu `Future`.

Pada praktikum ini terdapat tiga kondisi utama:

```text
Loading
Error
Data
```

---

# 2. Loading

Ketika data masih sedang dimuat:

```dart
snapshot.connectionState == ConnectionState.waiting
```

aplikasi menampilkan:

```dart
CircularProgressIndicator()
```

---

# 3. Error

Ketika terjadi kesalahan:

```dart
snapshot.hasError
```

aplikasi menampilkan:

- ikon error;
- pesan error;
- tombol `Coba lagi`.

---

# 4. Data

Jika data berhasil diterima, daftar pengguna ditampilkan dengan:

```dart
ListView.builder
```

Setiap pengguna menggunakan:

```text
CircleAvatar
ListTile
```

Avatar menampilkan huruf pertama nama pengguna.

---

# 5. Future pada initState

Future disimpan pada:

```dart
late Future<List<Pengguna>> _future;
```

Kemudian diinisialisasi pada:

```dart
@override
void initState() {
  super.initState();
  _future = ambilPengguna();
}
```

Tujuannya agar Future tidak dibuat ulang setiap kali `build()` dipanggil.

---

# 6. Memuat Ulang Data

Method:

```dart
void _muatUlang()
```

digunakan untuk membuat Future baru:

```dart
setState(() {
  _future = ambilPengguna();
});
```

Tombol refresh ditempatkan pada AppBar.

---

# 7. Navigasi ke Detail

Ketika pengguna diketuk:

```dart
Navigator.push()
```

digunakan untuk membuka halaman:

```text
DetailPenggunaPage
```

Data pengguna dikirim melalui constructor.

---

# 8. Checkpoint

Setelah aplikasi dijalankan:

1. Indikator loading tampil selama data sedang dimuat.
2. Sebanyak 10 pengguna tampil setelah data berhasil diterima.
3. Tombol refresh dapat digunakan untuk memuat ulang data.
4. Ketika terjadi error, pesan error dan tombol `Coba lagi` ditampilkan.
5. Menekan pengguna membuka halaman detail.

---

# 9. Alur

```text
ambilanPengguna()
       ↓
    Future
       ↓
FutureBuilder
       ↓
 ┌─────┼─────┐
 ↓     ↓     ↓
Loading Error Data
             ↓
        ListView.builder
             ↓
      Pengguna dipilih
             ↓
         Detail Page
```