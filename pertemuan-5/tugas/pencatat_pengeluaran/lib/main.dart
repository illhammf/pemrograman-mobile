
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// ==================== MODEL ====================

class Pengeluaran {
  final int? id;
  final String nama;
  final int jumlah;
  final String kategori;
  final String tanggal;

  const Pengeluaran({
    this.id,
    required this.nama,
    required this.jumlah,
    required this.kategori,
    required this.tanggal,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nama': nama,
      'jumlah': jumlah,
      'kategori': kategori,
      'tanggal': tanggal,
    };
  }

  factory Pengeluaran.fromMap(Map<String, Object?> map) {
    return Pengeluaran(
      id: map['id'] as int,
      nama: map['nama'] as String,
      jumlah: map['jumlah'] as int,
      kategori: map['kategori'] as String,
      tanggal: map['tanggal'] as String,
    );
  }
}

// ==================== DATABASE ====================

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    final lokasi = p.join(
      await getDatabasesPath(),
      'pencatat_pengeluaran.db',
    );

    _database = await openDatabase(
      lokasi,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE pengeluaran (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT NOT NULL,
            jumlah INTEGER NOT NULL,
            kategori TEXT NOT NULL,
            tanggal TEXT NOT NULL
          )
        ''');
      },
    );

    return _database!;
  }

  Future<List<Pengeluaran>> semua() async {
    final db = await database;
    final hasil = await db.query(
      'pengeluaran',
      orderBy: 'tanggal DESC, id DESC',
    );

    return hasil.map(Pengeluaran.fromMap).toList();
  }

  Future<int> tambah(Pengeluaran item) async {
    final db = await database;
    final data = item.toMap()..remove('id');
    return db.insert('pengeluaran', data);
  }

  Future<int> ubah(Pengeluaran item) async {
    final db = await database;
    final data = item.toMap()..remove('id');

    return db.update(
      'pengeluaran',
      data,
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> hapus(int id) async {
    final db = await database;

    return db.delete(
      'pengeluaran',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

// ==================== FORMAT RUPIAH ====================

String formatRupiah(int angka) {
  final teks = angka.toString();
  final hasil = StringBuffer();

  for (int i = 0; i < teks.length; i++) {
    if (i > 0 && (teks.length - i) % 3 == 0) {
      hasil.write('.');
    }
    hasil.write(teks[i]);
  }

  return 'Rp ${hasil.toString()}';
}

String formatTanggal(String nilai) {
  final tanggal = DateTime.tryParse(nilai);
  if (tanggal == null) return nilai;

  final hari = tanggal.day.toString().padLeft(2, '0');
  final bulan = tanggal.month.toString().padLeft(2, '0');

  return '$hari-$bulan-${tanggal.year}';
}

// ==================== APLIKASI DAN PENGATURAN ====================

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _modeGelap = false;
  bool _siap = false;

  @override
  void initState() {
    super.initState();
    _muatPengaturan();
  }

  Future<void> _muatPengaturan() async {
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    setState(() {
      _modeGelap = prefs.getBool('mode_gelap_pengeluaran') ?? false;
      _siap = true;
    });
  }

  Future<void> _ubahTema(bool nilai) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('mode_gelap_pengeluaran', nilai);

    if (!mounted) return;
    setState(() => _modeGelap = nilai);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pencatat Pengeluaran',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: _modeGelap ? ThemeMode.dark : ThemeMode.light,
      home: _siap
          ? HalamanPengeluaran(
              modeGelap: _modeGelap,
              onUbahTema: _ubahTema,
            )
          : const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
    );
  }
}

// ==================== HALAMAN UTAMA ====================

class HalamanPengeluaran extends StatefulWidget {
  final bool modeGelap;
  final ValueChanged<bool> onUbahTema;

  const HalamanPengeluaran({
    super.key,
    required this.modeGelap,
    required this.onUbahTema,
  });

  @override
  State<HalamanPengeluaran> createState() => _HalamanPengeluaranState();
}

class _HalamanPengeluaranState extends State<HalamanPengeluaran> {
  late Future<List<Pengeluaran>> _future;
  String _kategoriFilter = 'Semua';

  final List<String> _kategori = const [
    'Semua',
    'Makanan',
    'Transportasi',
    'Belanja',
    'Pendidikan',
    'Tagihan',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();
    _muat();
  }

  void _muat() {
    _future = DatabaseHelper.instance.semua();
  }

  Future<void> _bukaForm([Pengeluaran? item]) async {
    await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => FormPengeluaranPage(pengeluaran: item),
      ),
    );

    if (!mounted) return;
    setState(_muat);
  }

  Future<void> _konfirmasiHapus(Pengeluaran item) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus pengeluaran?'),
        content: Text('Apakah "${item.nama}" ingin dihapus?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (yakin != true) return;

    await DatabaseHelper.instance.hapus(item.id!);

    if (!mounted) return;

    setState(_muat);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pengeluaran berhasil dihapus')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencatat Pengeluaran'),
        actions: [
          IconButton(
            tooltip: widget.modeGelap ? 'Mode terang' : 'Mode gelap',
            onPressed: () => widget.onUbahTema(!widget.modeGelap),
            icon: Icon(
              widget.modeGelap ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Pengeluaran>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Gagal memuat data: ${snapshot.error}'),
              ),
            );
          }

          final semuaData = snapshot.data ?? [];
          final data = _kategoriFilter == 'Semua'
              ? semuaData
              : semuaData
                  .where((e) => e.kategori == _kategoriFilter)
                  .toList();

          final total = data.fold<int>(
            0,
            (jumlah, item) => jumlah + item.jumlah,
          );

          return RefreshIndicator(
            onRefresh: () async {
              setState(_muat);
              await _future;
            },
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
              children: [
                Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _kategoriFilter == 'Semua'
                              ? 'Total Pengeluaran'
                              : 'Total $_kategoriFilter',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          formatRupiah(total),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text('${data.length} transaksi'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _kategoriFilter,
                  decoration: const InputDecoration(
                    labelText: 'Filter kategori',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.filter_list),
                  ),
                  items: _kategori
                      .map(
                        (kategori) => DropdownMenuItem(
                          value: kategori,
                          child: Text(kategori),
                        ),
                      )
                      .toList(),
                  onChanged: (nilai) {
                    if (nilai == null) return;
                    setState(() => _kategoriFilter = nilai);
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  'Daftar Transaksi',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                if (data.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        const Icon(Icons.receipt_long, size: 56),
                        const SizedBox(height: 12),
                        Text(
                          semuaData.isEmpty
                              ? 'Belum ada pengeluaran.'
                              : 'Tidak ada transaksi untuk kategori ini.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        const Text('Tekan tombol + untuk menambahkan.'),
                      ],
                    ),
                  )
                else
                  ...data.map(
                    (item) => Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(ikonKategori(item.kategori)),
                        ),
                        title: Text(
                          item.nama,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '${item.kategori} • ${formatTanggal(item.tanggal)}',
                        ),
                        trailing: PopupMenuButton<String>(
                          onSelected: (aksi) {
                            if (aksi == 'ubah') {
                              _bukaForm(item);
                            } else if (aksi == 'hapus') {
                              _konfirmasiHapus(item);
                            }
                          },
                          itemBuilder: (_) => const [
                            PopupMenuItem(
                              value: 'ubah',
                              child: Text('Ubah'),
                            ),
                            PopupMenuItem(
                              value: 'hapus',
                              child: Text('Hapus'),
                            ),
                          ],
                        ),
                        onTap: () => _bukaForm(item),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _bukaForm(),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
    );
  }
}

IconData ikonKategori(String kategori) {
  switch (kategori) {
    case 'Makanan':
      return Icons.restaurant;
    case 'Transportasi':
      return Icons.directions_bus;
    case 'Belanja':
      return Icons.shopping_bag;
    case 'Pendidikan':
      return Icons.school;
    case 'Tagihan':
      return Icons.receipt;
    default:
      return Icons.payments;
  }
}

// ==================== FORM TAMBAH DAN UBAH ====================

class FormPengeluaranPage extends StatefulWidget {
  final Pengeluaran? pengeluaran;

  const FormPengeluaranPage({super.key, this.pengeluaran});

  @override
  State<FormPengeluaranPage> createState() => _FormPengeluaranPageState();
}

class _FormPengeluaranPageState extends State<FormPengeluaranPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nama;
  late final TextEditingController _jumlah;

  String _kategori = 'Makanan';
  late DateTime _tanggal;
  bool _menyimpan = false;

  final List<String> _daftarKategori = const [
    'Makanan',
    'Transportasi',
    'Belanja',
    'Pendidikan',
    'Tagihan',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();

    final item = widget.pengeluaran;

    _nama = TextEditingController(text: item?.nama ?? '');
    _jumlah = TextEditingController(
      text: item == null ? '' : item.jumlah.toString(),
    );

    _kategori = item?.kategori ?? 'Makanan';
    _tanggal = item == null
        ? DateTime.now()
        : DateTime.tryParse(item.tanggal) ?? DateTime.now();
  }

  @override
  void dispose() {
    _nama.dispose();
    _jumlah.dispose();
    super.dispose();
  }

  Future<void> _pilihTanggal() async {
    final hasil = await showDatePicker(
      context: context,
      initialDate: _tanggal,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Pilih tanggal pengeluaran',
    );

    if (hasil != null && mounted) {
      setState(() => _tanggal = hasil);
    }
  }

  Future<void> _simpan() async {
    if (!_formKey.currentState!.validate() || _menyimpan) return;

    setState(() => _menyimpan = true);

    try {
      final nilaiJumlah = int.parse(_jumlah.text.trim());

      final item = Pengeluaran(
        id: widget.pengeluaran?.id,
        nama: _nama.text.trim(),
        jumlah: nilaiJumlah,
        kategori: _kategori,
        tanggal: DateTime(
          _tanggal.year,
          _tanggal.month,
          _tanggal.day,
        ).toIso8601String(),
      );

      if (widget.pengeluaran == null) {
        await DatabaseHelper.instance.tambah(item);
      } else {
        await DatabaseHelper.instance.ubah(item);
      }

      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan: $e')),
      );

      setState(() => _menyimpan = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sedangUbah = widget.pengeluaran != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          sedangUbah ? 'Ubah Pengeluaran' : 'Tambah Pengeluaran',
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nama,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Nama pengeluaran',
                hintText: 'Contoh: Makan siang',
                prefixIcon: Icon(Icons.edit_note),
                border: OutlineInputBorder(),
              ),
              validator: (nilai) {
                if (nilai == null || nilai.trim().isEmpty) {
                  return 'Nama pengeluaran wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _jumlah,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jumlah (Rupiah)',
                hintText: 'Contoh: 15000',
                prefixText: 'Rp ',
                prefixIcon: Icon(Icons.payments_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (nilai) {
                if (nilai == null || nilai.trim().isEmpty) {
                  return 'Jumlah wajib diisi';
                }

                final angka = int.tryParse(nilai.trim());

                if (angka == null) {
                  return 'Jumlah harus berupa angka bulat';
                }

                if (angka <= 0) {
                  return 'Jumlah harus lebih dari 0';
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _kategori,
              decoration: const InputDecoration(
                labelText: 'Kategori',
                prefixIcon: Icon(Icons.category_outlined),
                border: OutlineInputBorder(),
              ),
              items: _daftarKategori
                  .map(
                    (kategori) => DropdownMenuItem(
                      value: kategori,
                      child: Text(kategori),
                    ),
                  )
                  .toList(),
              onChanged: (nilai) {
                if (nilai != null) {
                  setState(() => _kategori = nilai);
                }
              },
            ),
            const SizedBox(height: 16),
            InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Tanggal pengeluaran',
                border: OutlineInputBorder(),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(width: 12),
                  Expanded(child: Text(formatTanggal(_tanggal.toIso8601String()))),
                  TextButton(
                    onPressed: _pilihTanggal,
                    child: const Text('Pilih tanggal'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _menyimpan ? null : _simpan,
              icon: const Icon(Icons.save),
              label: Text(_menyimpan ? 'Menyimpan...' : 'Simpan Pengeluaran'),
            ),
          ],
        ),
      ),
    );
  }
}
