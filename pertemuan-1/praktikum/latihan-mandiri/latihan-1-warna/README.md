# Latihan Mandiri 1 — Mengubah Warna

## Tujuan

Mengubah warna `AppBar` dan warna teks.

## Contoh

Warna `AppBar`:

```dart
appBar: AppBar(
  backgroundColor: Colors.deepPurple,
  title: const Text('Counter Saya'),
),
```

Warna teks:

```dart
Text(
  '$_count',
  style: const TextStyle(
    fontSize: 48,
    color: Colors.deepPurple,
  ),
),
```

## Hasil

Tampilan aplikasi menggunakan warna yang berbeda pada `AppBar` dan teks counter.