# Bagian C — Model dan Fungsi Pengambil Data

## Tujuan

Membuat model Dart dari data JSON dan membuat fungsi asynchronous untuk mengambil data pengguna dari REST API.

---

## 1. Endpoint API

Endpoint yang digunakan:

```text
https://jsonplaceholder.typicode.com/users
```

API tersebut mengembalikan daftar pengguna dalam format JSON.

---

## 2. Field Data

Data pengguna memiliki beberapa field utama:

- `id`
- `name`
- `email`
- `phone`
- `website`

---

## 3. Model `Pengguna`

Dibuat class:

```dart
class Pengguna
```

dengan properti:

```text
id
name
email
phone
website
```

---

## 4. Constructor `fromJson`

Data JSON diubah menjadi object `Pengguna` menggunakan:

```dart
factory Pengguna.fromJson(Map<String, dynamic> json)
```

Contoh:

```dart
factory Pengguna.fromJson(Map<String, dynamic> json) {
  return Pengguna(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    website: json['website'] as String,
  );
}
```

---

## 5. Fungsi Pengambil Data

Dibuat fungsi:

```dart
Future<List<Pengguna>> ambilPengguna()
```

Fungsi tersebut:

1. Membuat URI API.
2. Mengirim HTTP GET menggunakan `http.get()`.
3. Menunggu response menggunakan `await`.
4. Memeriksa `statusCode`.
5. Mengubah response JSON menggunakan `jsonDecode()`.
6. Mengubah setiap item menjadi object `Pengguna`.
7. Mengembalikan `List<Pengguna>`.

---

## 6. Penanganan Status HTTP

Jika status response bukan `200`, fungsi melempar `Exception`.

Contoh:

```dart
if (response.statusCode != 200) {
  throw Exception(
    'Gagal memuat data (kode ${response.statusCode})',
  );
}
```

Error tersebut nantinya dapat ditangani oleh `FutureBuilder`.

---

## 7. Checkpoint

- Model `Pengguna` berhasil dibuat.
- Constructor `fromJson` berhasil dibuat.
- Fungsi `ambilPengguna()` berhasil dibuat.
- Tidak terdapat error kompilasi.