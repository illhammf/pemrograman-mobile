# Latihan Mandiri 4 — Mencegah Nilai Negatif

## Tujuan

Mencegah nilai counter menjadi bilangan negatif.

## Logika

```dart
void _decrement() {
  setState(() {
    if (_count > 0) {
      _count--;
    }
  });
}
```

## Hasil

Ketika nilai counter sudah `0`, tombol `-` tidak akan membuat nilai menjadi negatif.