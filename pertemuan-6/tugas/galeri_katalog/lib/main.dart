
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const daftarWarna = <Color>[
  Colors.indigo,
  Colors.teal,
  Colors.deepOrange,
  Colors.pink,
];

const kunciModeGelap = 'galeri_mode_gelap';
const kunciWarnaTema = 'galeri_warna_tema';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GaleriApp());
}

class Destinasi {
  final String nama;
  final String lokasi;
  final String deskripsi;
  final IconData ikon;
  final Color warna;
  final String kategori;

  const Destinasi({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.ikon,
    required this.warna,
    required this.kategori,
  });
}

const daftarDestinasi = <Destinasi>[
  Destinasi(
    nama: 'Pantai',
    lokasi: 'Wisata alam',
    deskripsi:
        'Pantai menawarkan pemandangan laut, pasir, '
        'dan suasana yang cocok untuk menikmati alam.',
    ikon: Icons.beach_access,
    warna: Colors.blue,
    kategori: 'Alam',
  ),
  Destinasi(
    nama: 'Pegunungan',
    lokasi: 'Wisata alam',
    deskripsi:
        'Pegunungan memiliki udara sejuk dan '
        'pemandangan alam yang indah.',
    ikon: Icons.landscape,
    warna: Colors.green,
    kategori: 'Alam',
  ),
  Destinasi(
    nama: 'Museum',
    lokasi: 'Wisata edukasi',
    deskripsi:
        'Museum menjadi tempat untuk mengenal '
        'sejarah, seni, dan kebudayaan.',
    ikon: Icons.museum,
    warna: Colors.orange,
    kategori: 'Edukasi',
  ),
  Destinasi(
    nama: 'Taman Kota',
    lokasi: 'Wisata keluarga',
    deskripsi:
        'Taman kota menyediakan ruang terbuka '
        'untuk berjalan santai dan berkumpul.',
    ikon: Icons.park,
    warna: Colors.teal,
    kategori: 'Keluarga',
  ),
  Destinasi(
    nama: 'Air Terjun',
    lokasi: 'Wisata alam',
    deskripsi:
        'Air terjun menyuguhkan pemandangan air '
        'yang mengalir di tengah lingkungan alami.',
    ikon: Icons.waterfall_chart,
    warna: Colors.cyan,
    kategori: 'Alam',
  ),
  Destinasi(
    nama: 'Cagar Budaya',
    lokasi: 'Wisata sejarah',
    deskripsi:
        'Cagar budaya membantu pengunjung '
        'mempelajari peninggalan masa lalu.',
    ikon: Icons.account_balance,
    warna: Colors.brown,
    kategori: 'Edukasi',
  ),
];

ThemeData buatTema(Color seed, Brightness brightness) {
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seed,
    brightness: brightness,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
  );
}

class GaleriApp extends StatefulWidget {
  const GaleriApp({super.key});

  @override
  State<GaleriApp> createState() => _GaleriAppState();
}

class _GaleriAppState extends State<GaleriApp> {
  ThemeMode _mode = ThemeMode.light;
  Color _warna = Colors.indigo;
  bool _siap = false;

  @override
  void initState() {
    super.initState();
    _muatPengaturan();
  }


  Future<void> _muatPengaturan() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final gelap = prefs.getBool(kunciModeGelap) ?? false;
      final indeks = prefs.getInt(kunciWarnaTema) ?? 0;
      final indeksAman = indeks.clamp(0, daftarWarna.length - 1);

      if (!mounted) return;

      setState(() {
        _mode = gelap ? ThemeMode.dark : ThemeMode.light;
        _warna = daftarWarna[indeksAman];
        _siap = true;
      });
    } catch (error, stackTrace) {
      debugPrint('Gagal memuat pengaturan: $error');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;

      setState(() {
        _mode = ThemeMode.light;
        _warna = Colors.indigo;
        _siap = true;
      });
    }
  }


  Future<void> _ubahMode(ThemeMode mode) async {
    setState(() => _mode = mode);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      kunciModeGelap,
      mode == ThemeMode.dark,
    );
  }

  Future<void> _ubahWarna(Color warna) async {
    setState(() => _warna = warna);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      kunciWarnaTema,
      daftarWarna.indexOf(warna),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_siap) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: _warna,
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      title: 'Galeri Wisata',
      debugShowCheckedModeBanner: false,
      theme: buatTema(_warna, Brightness.light),
      darkTheme: buatTema(_warna, Brightness.dark),
      themeMode: _mode,
      // Untuk mengatur route dinamis, kita bisa menggunakan onGenerateRoute.
      home: GaleriShell(
        mode: _mode,
        warna: _warna,
        onModeChanged: _ubahMode,
        onWarnaChanged: _ubahWarna,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final data = settings.arguments;

          if (data is Destinasi) {
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (context) {
                return DetailDestinasi(destinasi: data);
              },
            );
          }

          return MaterialPageRoute<void>(
            settings: settings,
            builder: (context) => const Halaman404(),
          );
        }

        // Pastikan route yang tidak dikenal selalu punya halaman.
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => const Halaman404(),
        );
      },

    );
  }
}

class GaleriShell extends StatefulWidget {
  final ThemeMode mode;
  final Color warna;
  final ValueChanged<ThemeMode> onModeChanged;
  final ValueChanged<Color> onWarnaChanged;

  const GaleriShell({
    super.key,
    required this.mode,
    required this.warna,
    required this.onModeChanged,
    required this.onWarnaChanged,
  });

  @override
  State<GaleriShell> createState() => _GaleriShellState();
}

class _GaleriShellState extends State<GaleriShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final halaman = [
      const BerandaTab(),
      const KategoriTab(),
      PengaturanTab(
        mode: widget.mode,
        warna: widget.warna,
        onModeChanged: widget.onModeChanged,
        onWarnaChanged: widget.onWarnaChanged,
      ),
    ];

    const judul = ['Beranda', 'Kategori', 'Pengaturan'];

    return Scaffold(
      appBar: AppBar(
        title: Text(judul[_index]),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.travel_explore, size: 42),
                    const SizedBox(height: 8),
                    Text(
                      'Galeri Wisata',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Text('Jelajahi berbagai destinasi'),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Beranda'),
                onTap: () => _pilihTab(0),
              ),
              ListTile(
                leading: const Icon(Icons.category_outlined),
                title: const Text('Kategori'),
                onTap: () => _pilihTab(1),
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Pengaturan'),
                onTap: () => _pilihTab(2),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _index,
        children: halaman,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (index) {
          setState(() => _index = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Kategori',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }

  void _pilihTab(int index) {
    setState(() => _index = index);
    Navigator.pop(context);
  }
}

class BerandaTab extends StatelessWidget {
  const BerandaTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Jelajahi Indonesia',
          style: tema.textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Temukan inspirasi perjalanan melalui '
          'koleksi destinasi wisata berikut.',
          style: tema.textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: tema.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                Icons.explore,
                size: 48,
                color: tema.colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Temukan tempat baru, kenali budaya, '
                  'dan nikmati keindahan alam.',
                  style: tema.textTheme.titleMedium?.copyWith(
                    color: tema.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Destinasi Pilihan',
          style: tema.textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        for (final item in daftarDestinasi)
          KartuDestinasi(destinasi: item),
      ],
    );
  }
}

class KategoriTab extends StatelessWidget {
  const KategoriTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final kategori = daftarDestinasi
        .map((item) => item.kategori)
        .toSet()
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Kategori Wisata',
          style: tema.textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        const Text(
          'Pilih kategori untuk melihat destinasi yang tersedia.',
        ),
        const SizedBox(height: 16),
        for (final namaKategori in kategori)
          Card(
            child: ExpansionTile(
              leading: Icon(
                Icons.explore_outlined,
                color: tema.colorScheme.primary,
              ),
              title: Text(namaKategori),
              children: [
                for (final item in daftarDestinasi.where(
                  (item) => item.kategori == namaKategori,
                ))
                  KartuDestinasi(
                    destinasi: item,
                    gunakanHero: false,
                  )
              ],
            ),
          ),
      ],
    );
  }
}

class KartuDestinasi extends StatelessWidget {
  final Destinasi destinasi;
  final bool gunakanHero;

  const KartuDestinasi({
    super.key,
    required this.destinasi,
    this.gunakanHero = true,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: gunakanHero
            ? Hero(
                tag: 'destinasi-${destinasi.nama}',
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: destinasi.warna,
                  child: Icon(
                    destinasi.ikon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            : CircleAvatar(
                radius: 28,
                backgroundColor: destinasi.warna,
                child: Icon(
                  destinasi.ikon,
                  color: Colors.white,
                  size: 30,
                ),
              ),

        title: Text(
          destinasi.nama,
          style: tema.textTheme.titleMedium,
        ),
        subtitle: Text(
          '${destinasi.lokasi} • ${destinasi.kategori}',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detail',
            arguments: destinasi,
          );
        },
      ),
    );
  }
}

class DetailDestinasi extends StatelessWidget {
  final Destinasi destinasi;

  const DetailDestinasi({
    super.key,
    required this.destinasi,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final warna = tema.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(destinasi.nama),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: Hero(
              tag: 'destinasi-${destinasi.nama}',
              child: CircleAvatar(
                radius: 76,
                backgroundColor: destinasi.warna,
                child: Icon(
                  destinasi.ikon,
                  size: 76,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text(
              destinasi.nama,
              style: tema.textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Chip(
              avatar: const Icon(Icons.category_outlined),
              label: Text(destinasi.kategori),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tentang Destinasi',
            style: tema.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            destinasi.deskripsi,
            style: tema.textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.location_on_outlined,
                color: warna.primary,
              ),
              title: const Text('Jenis lokasi'),
              subtitle: Text(destinasi.lokasi),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Kembali ke Galeri'),
          ),
        ],
      ),
    );
  }
}

class PengaturanTab extends StatelessWidget {
  final ThemeMode mode;
  final Color warna;
  final ValueChanged<ThemeMode> onModeChanged;
  final ValueChanged<Color> onWarnaChanged;

  const PengaturanTab({
    super.key,
    required this.mode,
    required this.warna,
    required this.onModeChanged,
    required this.onWarnaChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Pengaturan Tampilan',
          style: tema.textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        const Text(
          'Sesuaikan tampilan aplikasi sesuai preferensi kamu.',
        ),
        const SizedBox(height: 20),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Mode gelap'),
          subtitle: Text(
            mode == ThemeMode.dark
                ? 'Tema gelap aktif'
                : 'Tema terang aktif',
          ),
          value: mode == ThemeMode.dark,
          onChanged: (value) {
            onModeChanged(
              value ? ThemeMode.dark : ThemeMode.light,
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          'Warna Tema',
          style: tema.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            for (final pilihan in daftarWarna)
              Semantics(
                label: 'Pilih warna tema',
                button: true,
                child: GestureDetector(
                  onTap: () => onWarnaChanged(pilihan),
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: pilihan,
                    child: warna == pilihan
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.palette_outlined,
                  color: tema.colorScheme.primary,
                  size: 36,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Pilihan tema disimpan secara lokal '
                    'menggunakan SharedPreferences.',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Halaman404 extends StatelessWidget {
  const Halaman404({super.key});

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
                Icons.travel_explore,
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
                'Halaman yang kamu cari tidak tersedia.',
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
