# Bagian A — Mengenal Future dan FutureBuilder

## Tujuan

Mempelajari dasar pemrograman asynchronous menggunakan `Future`, `async`, `await`, dan `FutureBuilder`.

Pada bagian ini belum menggunakan internet. Pengambilan data disimulasikan menggunakan `Future.delayed()` selama dua detik.

---

## 1. Fungsi `ambilSalam`

Fungsi berikut menunggu selama dua detik:

```dart
Future<String> ambilSalam() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return 'Halo dari masa depan!';
}
```

Fungsi menghasilkan sebuah `Future<String>`.

---

## 2. State Future

Future disimpan dalam variabel:

```dart
late Future<String> _future;
```

Kemudian dijalankan pada `initState()`:

```dart
@override
void initState() {
  super.initState();
  _future = ambilSalam();
}
```

Future dibuat di `initState()` agar tidak dijalankan kembali setiap kali `build()` dipanggil.

---

## 3. FutureBuilder

Tampilan dibangun menggunakan:

```dart
FutureBuilder<String>
```

Status Future diperiksa melalui `snapshot`.

### Loading

Ketika:

```dart
snapshot.connectionState == ConnectionState.waiting
```

ditampilkan:

```dart
CircularProgressIndicator
```

### Error

Jika terjadi kesalahan:

```dart
snapshot.hasError
```

maka pesan error ditampilkan.

### Data

Jika Future selesai:

```dart
snapshot.data
```

ditampilkan pada layar.

---

## 4. Checkpoint

Selama sekitar dua detik aplikasi menampilkan indikator loading.

Setelah proses selesai, tampil:

```text
Halo dari masa depan!
```

---

## 5. Konsep yang Dipelajari

```text
Future
   ↓
async
   ↓
await
   ↓
FutureBuilder
   ↓
Loading / Error / Data
```