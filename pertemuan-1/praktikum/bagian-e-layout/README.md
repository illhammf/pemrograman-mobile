# Bagian E — Widget Layout Dasar

## Tujuan

Menyusun beberapa widget secara vertikal menggunakan `Column`.

## Kode

Ganti bagian `body` menjadi:

```dart
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        Icons.flutter_dash,
        size: 80,
        color: Colors.blue,
      ),
      SizedBox(height: 16),
      Text(
        'Halo, nama saya Ilham Firmansyah!',
        style: TextStyle(fontSize: 24),
      ),
      Text('NIM: 20240801102'),
    ],
  ),
),
```

## Struktur Widget

```text
Center
└── Column
    ├── Icon
    ├── SizedBox
    ├── Text
    └── Text
```

## Penjelasan

### `Center`

Menempatkan `Column` di tengah.

### `Column`

Menyusun widget secara vertikal.

### `mainAxisAlignment`

Kode:

```dart
mainAxisAlignment: MainAxisAlignment.center
```

digunakan agar isi `Column` berada di tengah.

### `Icon`

Menampilkan ikon Flutter.

### `SizedBox`

Memberikan jarak vertikal antar-widget.

### `Text`

Menampilkan nama dan NIM mahasiswa.

## Checkpoint

Tampilan menampilkan:

- Ikon Flutter.
- Nama mahasiswa.
- NIM.

Ketiganya tersusun vertikal di tengah layar.