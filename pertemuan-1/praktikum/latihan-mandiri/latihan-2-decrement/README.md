# Latihan Mandiri 2 — Tombol Decrement

## Tujuan

Menambahkan tombol untuk mengurangi nilai counter menggunakan `Icons.remove`.

## Logika

```dart
void _decrement() {
  setState(() {
    _count--;
  });
}
```

Tombol:

```dart
FloatingActionButton(
  onPressed: _decrement,
  child: const Icon(Icons.remove),
),
```

## Hasil

Tombol `-` dapat mengurangi nilai counter.