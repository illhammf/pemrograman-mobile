# Bagian E — Halaman Detail

## Tujuan

Membuat halaman detail yang menampilkan informasi lengkap dari pengguna yang dipilih.

---

# 1. Data yang Ditampilkan

Halaman detail menampilkan:

- Email.
- Nomor telepon.
- Website.

---

# 2. Mengirim Data

Data pengguna dikirim dari halaman daftar ke halaman detail melalui constructor:

```dart
DetailPenggunaPage(
  pengguna: pengguna,
)
```

Halaman detail menerima object:

```dart
final Pengguna pengguna;
```

---

# 3. Navigator.push

Ketika pengguna diketuk:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => DetailPenggunaPage(
      pengguna: pengguna,
    ),
  ),
);
```

Aplikasi membuka halaman detail.

---

# 4. Tampilan Detail

Data ditampilkan menggunakan beberapa `ListTile`.

### Email

```dart
ListTile(
  leading: const Icon(Icons.email),
  title: Text(pengguna.email),
)
```

### Telepon

```dart
ListTile(
  leading: const Icon(Icons.phone),
  title: Text(pengguna.phone),
)
```

### Website

```dart
ListTile(
  leading: const Icon(Icons.language),
  title: Text(pengguna.website),
)
```

---

# 5. Checkpoint

Mengetuk salah satu pengguna pada halaman daftar membuka halaman detail yang menampilkan:

```text
Email
Telepon
Website
```