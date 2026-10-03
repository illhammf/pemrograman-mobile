# Bagian C — Mengapa Butuh State Management?

## State Lokal

Pada aplikasi sederhana, state dapat disimpan di satu halaman menggunakan:

```dart
setState()
```

Contohnya:
- checkbox;
- teks sementara;
- nilai input pada satu halaman.

### Masalah Ketika Aplikasi Membesar

Bayangkan aplikasi daftar tugas:
``` text
Halaman Daftar
      ↕
   Data Tugas
      ↕
Halaman Tambah
      ↕
Halaman daftar dan halaman tambah sama-sama membutuhkan data tugas.
```

Kalau data terus dikirim menggunakan constructor dan callback antar-halaman, kode dapat menjadi semakin rumit.

## State Bersama

Solusinya adalah menempatkan data pada satu objek bersama yang dapat digunakan oleh beberapa widget atau halaman.

Pada praktikum ini digunakan:

- ChangeNotifier
- Provider

## Konsep Penting
*State lokal*
```text
→ setState()
```

*State bersama*
```text
→ ChangeNotifier + Provider
```

Bagian D kemudian menerapkan konsep tersebut dalam aplikasi Daftar Tugas.


Tidak perlu `main.dart` khusus untuk Bagian C karena modulnya memang berupa **pembahasan konsep sebelum implementasi Provider di Bagian D**. :contentReference[oaicite:8]{index=8}

---

# Bagian D — Daftar Tugas dengan Provider

Nah ini bagian paling besar.

Modul menggunakan:

```text
provider
ChangeNotifier
ChangeNotifierProvider
context.watch
context.read
notifyListeners()
```

dan dua halaman:
```text
TugasPage
TambahPage
```

Dengan fitur tambah, centang, hapus, serta jumlah tugas selesai pada AppBar.

# Pertama, install Provider

Di project Flutter utama:

```text
cd ~/perkuliahan/pemrograman_mobile/pemrograman-mobile/pertemuan-3/praktikum
flutter pub add provider
```

Kemudian:
```text
flutter pub get
```