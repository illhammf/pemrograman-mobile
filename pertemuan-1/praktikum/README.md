# Praktikum Pertemuan 1

## Flutter Fundamental

Praktikum Pertemuan 1 membahas pengenalan Flutter, instalasi dan verifikasi lingkungan pengembangan, pembuatan proyek pertama, struktur proyek Flutter, penggunaan widget dasar, serta widget interaktif menggunakan `StatefulWidget`.

Praktikum terdiri dari:

1. Bagian A — Instalasi dan Verifikasi
2. Bagian B — Membuat Proyek Flutter Pertama
3. Bagian C — Mengenal Struktur Proyek
4. Bagian D — Aplikasi Hello Flutter
5. Bagian E — Widget Layout Dasar
6. Bagian F — Widget Interaktif (`StatefulWidget`)
7. Latihan Mandiri

---

## Struktur Praktikum

```text
praktikum/
├── README.md
├── bagian-a-instalasi/
├── bagian-b-project-pertama/
├── bagian-c-struktur-project/
├── bagian-d-hello-flutter/
├── bagian-e-layout/
├── bagian-f-counter/
└── latihan-mandiri/
    ├── latihan-1-warna/
    ├── latihan-2-decrement/
    ├── latihan-3-reset/
    └── latihan-4-no-negatif/
```

---

# Bagian A — Instalasi dan Verifikasi

Pada bagian ini dilakukan persiapan lingkungan pengembangan Flutter.

Perintah utama:

```bash
flutter doctor
```

Apabila diperlukan:

```bash
flutter doctor --android-licenses
```

Checkpoint:

- Flutter terdeteksi.
- Android toolchain terdeteksi.
- Perangkat atau emulator dapat digunakan.
- Tidak terdapat masalah utama pada lingkungan pengembangan.

Dokumentasi lengkap terdapat pada:

[`bagian-a-instalasi/`](./bagian-a-instalasi/)

---

# Bagian B — Membuat Proyek Flutter Pertama

Membuat proyek Flutter:

```bash
flutter create praktikum_1
```

Masuk ke project:

```bash
cd praktikum_1
```

Menjalankan aplikasi:

```bash
flutter run
```

Checkpoint:

Aplikasi counter bawaan Flutter berhasil dijalankan dan tombol `+` dapat menambah angka.

Dokumentasi:

[`bagian-b-project-pertama/`](./bagian-b-project-pertama/)

---

# Bagian C — Mengenal Struktur Proyek

File dan folder penting:

| File/Folder | Fungsi |
|---|---|
| `lib/main.dart` | Kode utama aplikasi |
| `pubspec.yaml` | Konfigurasi project dan dependensi |
| `android/` | Konfigurasi Android |
| `ios/` | Konfigurasi iOS |
| `test/` | Berkas pengujian |

Dokumentasi:

[`bagian-c-struktur-project/`](./bagian-c-struktur-project/)

---

# Bagian D — Hello Flutter

Pada bagian ini dibuat aplikasi sederhana yang menampilkan nama mahasiswa.

Widget yang digunakan:

- `MaterialApp`
- `Scaffold`
- `AppBar`
- `Center`
- `Text`

Struktur widget:

```text
MaterialApp
└── Scaffold
    ├── AppBar
    └── Center
        └── Text
```

Dokumentasi:

[`bagian-d-hello-flutter/`](./bagian-d-hello-flutter/)

---

# Bagian E — Widget Layout Dasar

Pada bagian ini digunakan:

- `Center`
- `Column`
- `Icon`
- `SizedBox`
- `Text`

Tampilan terdiri dari ikon, nama, dan NIM yang tersusun secara vertikal di tengah layar.

Dokumentasi:

[`bagian-e-layout/`](./bagian-e-layout/)

---

# Bagian F — Widget Interaktif

Bagian ini memperkenalkan:

- `StatefulWidget`
- `State`
- variabel state
- `setState()`
- `FloatingActionButton`

Aplikasi yang dibuat adalah aplikasi Counter.

Dokumentasi:

[`bagian-f-counter/`](./bagian-f-counter/)

---

# Latihan Mandiri

## Latihan 1 — Mengubah Warna

Mengubah warna `AppBar` dan teks.

[`latihan-1-warna/`](./latihan-mandiri/latihan-1-warna/)

## Latihan 2 — Tombol Decrement

Menambahkan tombol `Icons.remove` untuk mengurangi nilai counter.

[`latihan-2-decrement/`](./latihan-mandiri/latihan-2-decrement/)

## Latihan 3 — Tombol Reset

Menambahkan tombol untuk mengembalikan nilai counter ke `0`.

[`latihan-3-reset/`](./latihan-mandiri/latihan-3-reset/)

## Latihan 4 — Mencegah Nilai Negatif

Menambahkan kondisi agar nilai counter tidak kurang dari `0`.

[`latihan-4-no-negatif/`](./latihan-mandiri/latihan-4-no-negatif/)

---

# Checkpoint

Checkpoint yang harus diselesaikan:

- [x] Flutter berhasil diverifikasi
- [x] Project Flutter berhasil dibuat
- [x] Counter bawaan berhasil dijalankan
- [x] Struktur project dipahami
- [x] Hello Flutter berhasil dibuat
- [x] Layout dengan `Column` berhasil dibuat
- [x] Counter menggunakan `StatefulWidget` berhasil dibuat
- [x] Latihan mandiri 1 selesai
- [x] Latihan mandiri 2 selesai
- [x] Latihan mandiri 3 selesai
- [x] Latihan mandiri 4 selesai

---

## Identitas Praktikum

**Nama:** Ilham Firmansyah  
**NIM:** 20240801102  
**Mata Kuliah:** Pemrograman Mobile  
**Pertemuan:** 1  
**Topik:** Flutter Fundamental