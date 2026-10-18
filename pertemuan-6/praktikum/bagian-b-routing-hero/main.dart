
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Model data untuk setiap item.
class Item {
  final String nama;
  final IconData ikon;
  final Color warna;
  final String deskripsi;

  const Item(
    this.nama,
    this.ikon,
    this.warna,
    this.deskripsi,
  );
}

// Data yang ditampilkan pada halaman beranda.
const List<Item> daftarItem = [
  Item(
    'Flutter',
    Icons.flutter_dash,
    Colors.blue,
    'Flutter adalah framework untuk membangun '
        'aplikasi dari satu basis kode.',
  ),
  Item(
    'Musik',
    Icons.music_note,
    Colors.pink,
    'Musik dapat menjadi sarana hiburan dan '
        'ekspresi melalui suara dan irama.',
  ),
  Item(
    'Kamera',
    Icons.camera_alt,
    Colors.orange,
    'Kamera digunakan untuk mengambil foto '
        'dan mengabadikan momen.',
  ),
  Item(
    'Peta',
    Icons.map,
    Colors.green,
    'Peta membantu pengguna memahami lokasi '
        'dan menemukan arah perjalanan.',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 6 - Routing dan Hero',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BerandaPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final arguments = settings.arguments;

          if (arguments is Item) {
            return MaterialPageRoute<void>(
              builder: (context) {
                return DetailPage(item: arguments);
              },
              settings: settings,
            );
          }

          return MaterialPageRoute<void>(
            builder: (context) => const HalamanError(),
          );
        }

        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => const HalamanError(),
        );
      },
    );
  }
}

// Halaman utama yang menampilkan daftar item.
class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Jelajahi Katalog',
            style: tema.textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Pilih salah satu item untuk melihat detailnya.',
            style: tema.textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          for (final item in daftarItem)
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Hero(
                  tag: 'ikon-${item.nama}',
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: item.warna,
                    child: Icon(
                      item.ikon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                title: Text(
                  item.nama,
                  style: tema.textTheme.titleMedium,
                ),
                subtitle: Text(
                  item.deskripsi,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: item,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

// Halaman detail yang menerima data melalui arguments.
class DetailPage extends StatelessWidget {
  final Item item;

  const DetailPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.nama),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'ikon-${item.nama}',
                child: CircleAvatar(
                  radius: 64,
                  backgroundColor: item.warna,
                  child: Icon(
                    item.ikon,
                    color: Colors.white,
                    size: 64,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                item.nama,
                style: tema.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                item.deskripsi,
                style: tema.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: tema.colorScheme.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Data halaman ini diterima melalui '
                          'named routes.',
                          style: tema.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman untuk rute yang tidak valid.
class HalamanError extends StatelessWidget {
  const HalamanError({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Tidak Ditemukan'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 72,
                color: tema.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                '404 - Halaman tidak ditemukan',
                style: tema.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Rute yang diminta tidak tersedia.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                child: const Text('Kembali ke Beranda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
