import 'package:flutter/material.dart';

class Kontak {
  final String nama;
  final String nomorTelepon;
  final String email;

  const Kontak(
    this.nama,
    this.nomorTelepon,
    this.email,
  );
}

const daftarKontak = [
  Kontak(
    'Annisa Zahra',
    '081234567890',
    'annisa@gmail.com',
  ),
  Kontak(
    'Ibu',
    '082345678901',
    'purwanti@gmail.com',
  ),
  Kontak(
    'Bapak',
    '083456789012',
    'soleman@gmail.com',
  ),
  Kontak(
    'Mamah',
    '084567890123',
    'mmh@gmail.com',
  ),
  Kontak(
    'Ayah',
    '085678901234',
    'yah@gmail.com',
  ),
  Kontak(
    'Achmad Rafli',
    '086789012345',
    'rafli@gmail.com',
  ),

  Kontak(
    'Annisa Zahra',
    '081234567890',
    'annisa@gmail.com',
  ),
  Kontak(
    'Ibu',
    '082345678901',
    'purwanti@gmail.com',
  ),
  Kontak(
    'Bapak',
    '083456789012',
    'soleman@gmail.com',
  ),
  Kontak(
    'Mamah',
    '084567890123',
    'mmh@gmail.com',
  ),
  Kontak(
    'Ayah',
    '085678901234',
    'yah@gmail.com',
  ),
  Kontak(
    'Achmad Rafli',
    '086789012345',
    'rafli@gmail.com',
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Kontak',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const KontakPage(),
    );
  }
}

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  String getHurufAwal(String nama) {
    return nama[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8), // untuk memberikan jarak vertikal di atas dan bawah daftar kontak
        itemCount: daftarKontak.length,
        itemBuilder: (context, index) {
          final kontak = daftarKontak[index];

          return Card(
            margin: const EdgeInsets.symmetric( // Untuk memberikan jarak horizontal dan vertikal di sekitar setiap kartu kontak,
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  getHurufAwal(kontak.nama),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                kontak.nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(kontak.nomorTelepon),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailKontakPage(
                      kontak: kontak,
                    ),
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

class DetailKontakPage extends StatelessWidget {
  final Kontak kontak;

  const DetailKontakPage({
    super.key,
    required this.kontak,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Kontak'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(
                  kontak.nama[0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                kontak.nama,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      kontak.nomorTelepon,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.email),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      kontak.email,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}