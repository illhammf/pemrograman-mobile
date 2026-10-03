# Bagian C — Navigasi ke Halaman Detail

## Tujuan

Membuat navigasi dari halaman daftar menu ke halaman detail menggunakan `Navigator.push` dan `Navigator.pop`.

## Kode

```dart
import 'package:flutter/material.dart';

class Makanan {
  final String nama;
  final int harga;

  const Makanan(this.nama, this.harga);
}

const daftarMenu = [
  Makanan('Nasi Goreng', 15000),
  Makanan('Mie Ayam', 12000),
  Makanan('Es Teh', 4000),
  Makanan('Ayam Bakar', 20000),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 2',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Menu'),
      ),
      body: ListView.builder(
        itemCount: daftarMenu.length,
        itemBuilder: (context, index) {
          final item = daftarMenu[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              leading: const Icon(Icons.restaurant),
              title: Text(item.nama),
              subtitle: Text('Rp ${item.harga}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(makanan: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Makanan makanan;

  const DetailPage({
    super.key,
    required this.makanan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(makanan.nama),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.restaurant_menu,
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              makanan.nama,
              style: const TextStyle(fontSize: 24),
            ),
            Text('Rp ${makanan.harga}'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Alur Navigasi

```text
Daftar Menu
    │
    │ tekan menu
    ▼
DetailPage
    │
    │ tekan Kembali
    ▼
Daftar Menu
```

## `Navigator.push`

Digunakan untuk membuka halaman detail:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => DetailPage(makanan: item),
  ),
);
```

## `Navigator.pop`

Digunakan untuk kembali:

```dart
Navigator.pop(context);
```

## Pengiriman Data

Data makanan dikirim melalui constructor:

```dart
DetailPage(makanan: item)
```

Kemudian diterima:

```dart
final Makanan makanan;
```

## Checkpoint

- Menekan sebuah menu membuka halaman detail.
- Data nama dan harga sesuai dengan menu yang dipilih.
- Tombol `Kembali` menutup halaman detail.