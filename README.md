# Pemrograman Mobile

Repository pembelajaran dan praktikum **Pemrograman Mobile** menggunakan **Flutter dan Dart**.

Repository ini berisi dokumentasi materi, langkah-langkah praktikum, latihan mandiri, source code, dan tugas dari setiap pertemuan.

Project ini dibuat sebagai dokumentasi proses pembelajaran selama mengikuti mata kuliah Pemrograman Mobile.

---

## Identitas

| Keterangan | Data |
|---|---|
| Nama | Ilham Firmansyah |
| NIM | 20240801102 |
| Jurusan | Teknik Informatika |
| Mata Kuliah | Pemrograman Mobile |
| Framework | Flutter |
| Bahasa | Dart |

---

# Daftar Pertemuan

Repository ini disusun berdasarkan pertemuan pada mata kuliah Pemrograman Mobile.

Setiap folder pertemuan memiliki struktur:

```text
pertemuan-x/
├── README.md
├── doc-tugas/
├── praktikum/
└── tugas/
```

### Keterangan Struktur

| Folder | Isi |
|---|---|
| `README.md` | Catatan materi pembelajaran berdasarkan modul |
| `doc-tugas/` | Modul/dokumen asli yang diberikan |
| `praktikum/` | Langkah praktikum, source code, dan latihan mandiri |
| `tugas/` | Tugas utama pada pertemuan tersebut |

---

# 🟦 Pertemuan 1 — Flutter Fundamental

### Topik

**Pengenalan Flutter, Instalasi, dan Aplikasi Pertama**

Materi yang dipelajari:

- Pengenalan Flutter dan Dart
- Instalasi dan verifikasi Flutter
- `flutter doctor`
- Membuat project Flutter
- Struktur project Flutter
- `MaterialApp`
- `Scaffold`
- `AppBar`
- `Center`
- `Column`
- `Text`
- `Icon`
- `SizedBox`
- `StatelessWidget`
- `StatefulWidget`
- `setState()`
- Hot reload
- Aplikasi Counter

### Latihan Mandiri

- Mengubah warna AppBar dan teks
- Menambahkan tombol decrement
- Menambahkan tombol reset
- Mencegah nilai counter menjadi negatif

### Tugas

Membuat aplikasi **Kartu Perkenalan** yang menampilkan:

- Foto atau ikon
- Nama
- NIM
- Jurusan
- Hobi

📁 [`Pertemuan 1`](./pertemuan-1/)

---

# 🟩 Pertemuan 2 — Layout, ListView, dan Navigasi

### Topik

**Layout, ListView, dan Navigasi Antar Halaman**

Materi yang dipelajari:

- `Container`
- `Padding`
- `Row`
- `Column`
- `Expanded`
- `ListView.builder`
- `Card`
- `ListTile`
- Model data menggunakan class Dart
- `Navigator.push`
- `Navigator.pop`
- Pengiriman data antar halaman
- Halaman detail

### Latihan Mandiri

Membangun dan mengembangkan aplikasi daftar menu:

- Menambahkan menu
- Menambahkan deskripsi
- Mengganti `Card` dengan `Container`
- Membuat sudut membulat
- Memformat harga dengan pemisah ribuan

### Tugas

Membuat aplikasi **Daftar Kontak** dengan:

- Minimal 6 kontak
- Nama
- Nomor telepon
- Email
- `ListView.builder`
- `ListTile`
- Avatar berdasarkan huruf pertama nama
- Halaman detail kontak
- Navigasi kembali

📁 [`Pertemuan 2`](./pertemuan-2/)

---

# 🟨 Pertemuan 3 — Form Input dan State Management

### Topik

**Form Input dan State Management**

Materi yang dipelajari:

- `TextField`
- `TextEditingController`
- `dispose()`
- `Form`
- `TextFormField`
- Validasi input
- Dropdown
- Checkbox
- `SnackBar`
- State lokal dengan `setState`
- `ChangeNotifier`
- Provider
- `ChangeNotifierProvider`
- `context.watch`
- `context.read`
- `notifyListeners()`
- State management antar halaman

### Praktikum

Membangun aplikasi **Daftar Tugas** menggunakan Provider.

Fitur yang dipelajari:

- Menambahkan tugas
- Menandai tugas sebagai selesai
- Menghapus tugas
- Menghitung tugas selesai
- Berbagi state antar halaman

### Latihan Mandiri

- Validasi judul minimal 3 karakter
- Menghapus semua tugas selesai
- Menampilkan SnackBar setelah tugas ditambahkan
- Menampilkan pesan ketika daftar tugas kosong

### Tugas

Membuat aplikasi **Daftar Belanja** dengan:

- Form tambah barang
- Validasi nama barang
- Validasi jumlah
- Validasi jumlah lebih dari 0
- Dropdown kategori
- Daftar barang
- Checkbox status sudah dibeli
- Fitur hapus
- `ChangeNotifier`
- Provider
- Jumlah barang belum dibeli pada AppBar

📁 [`Pertemuan 3`](./pertemuan-3/)

---

# 🚧 Pertemuan Berikutnya

Repository ini akan terus dikembangkan seiring bertambahnya materi praktikum.

Rencana struktur:

```text
pertemuan-1/
pertemuan-2/
pertemuan-3/
pertemuan-4/
pertemuan-5/
...
```

Setiap pertemuan akan menggunakan struktur dokumentasi yang sama agar isi repository tetap konsisten dan mudah dipelajari kembali.

---

# 🛠️ Teknologi

Teknologi yang digunakan dalam repository ini:

- **Flutter**
- **Dart**
- **Visual Studio Code**
- **Android SDK**
- **Provider**

---

# 📂 Struktur Repository

```text
pemrograman-mobile/
│
├── README.md
│
├── pertemuan-1/
│   ├── README.md
│   ├── doc-tugas/
│   ├── praktikum/
│   └── tugas/
│
├── pertemuan-2/
│   ├── README.md
│   ├── doc-tugas/
│   ├── praktikum/
│   └── tugas/
│
└── pertemuan-3/
    ├── README.md
    ├── doc-tugas/
    ├── praktikum/
    └── tugas/
```

---

# 🎯 Tujuan Repository

Repository ini digunakan sebagai:

- Dokumentasi perjalanan belajar Pemrograman Mobile.
- Tempat menyimpan source code praktikum.
- Catatan materi setiap pertemuan.
- Dokumentasi latihan mandiri.
- Tempat pengumpulan tugas.
- Arsip project Flutter yang dapat dipelajari kembali.

---

# 📖 Cara Menggunakan Repository

Untuk melihat materi suatu pertemuan, buka folder pertemuan yang ingin dipelajari.

Contoh:

```text
pertemuan-1/
```

kemudian:

```text
README.md
```

untuk membaca catatan materi.

Folder:

```text
praktikum/
```

berisi source code dan dokumentasi praktik.

Folder:

```text
tugas/
```

berisi project dan dokumentasi tugas.

---

# 📌 Status Pembelajaran

| Pertemuan | Materi | Praktikum | Latihan | Tugas |
|---|---|---|---|---|
| Pertemuan 1 | ✅ | ✅ | ✅ | ✅ |
| Pertemuan 2 | ✅ | ✅ | ✅ | ✅ |
| Pertemuan 3 | ✅ | ✅ | ✅ | ✅ |
| Pertemuan 4 | ⏳ | ⏳ | ⏳ | ⏳ |
| Pertemuan berikutnya | ⏳ | ⏳ | ⏳ | ⏳ |

---

## 📌 Catatan

Repository ini merupakan dokumentasi pembelajaran pribadi untuk mata kuliah Pemrograman Mobile.

Materi dan struktur project disusun berdasarkan modul praktikum dan tugas yang diberikan selama perkuliahan.