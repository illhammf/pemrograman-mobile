# Latihan Mandiri 3 — Reset Counter

## Tujuan

Menambahkan tombol yang mengembalikan nilai counter ke `0`.

## Logika

```dart
void _reset() {
  setState(() {
    _count = 0;
  });
}
```

## Hasil

Ketika tombol reset ditekan, nilai counter kembali menjadi `0`.