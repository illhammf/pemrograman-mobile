
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Mandiri Pertemuan 5',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const CatatanPage(),
    );
  }
}

// MODEL CATATAN
class Catatan {
  final int? id;
  final String judul;
  final String isi;
  final String dibuat;

  const Catatan({
    this.id,
    required this.judul,
    required this.isi,
    required this.dibuat,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'judul': judul,
      'isi': isi,
      'dibuat': dibuat,
    };
  }

  factory Catatan.fromMap(Map<String, Object?> map) {
    return Catatan(
      id: map['id'] as int,
      judul: map['judul'] as String,
      isi: map['isi'] as String,
      dibuat: map['dibuat'] as String,
    );
  }
}

// DATABASE SQLITE
class DbHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    final lokasi = p.join(
      await getDatabasesPath(),
      'latihan_catatan.db',
    );

    _database = await openDatabase(
      lokasi,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE catatan (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            judul TEXT NOT NULL,
            isi TEXT NOT NULL,
            dibuat TEXT NOT NULL
          )
        ''');
      },
      onUpgrade: (db, versiLama, versiBaru) async {
        if (versiLama < 2) {
          await db.execute(
            'ALTER TABLE catatan ADD COLUMN dibuat TEXT',
          );

          await db.execute(
            "UPDATE catatan SET dibuat = datetime('now') "
            "WHERE dibuat IS NULL",
          );
        }
      },
    );

    return _database!;
  }

  static Future<int> tambah(Catatan catatan) async {
    final db = await database;
    return db.insert(
      'catatan',
      catatan.toMap()..remove('id'),
    );
  }

  static Future<List<Catatan>> semua({
    String kata = '',
    String urutan = 'terbaru',
  }) async {
    final db = await database;

    final hasil = await db.query(
      'catatan',
      where: kata.trim().isEmpty ? null : 'judul LIKE ?',
      whereArgs: kata.trim().isEmpty ? null : ['%${kata.trim()}%'],
      orderBy: urutan == 'terbaru'
          ? 'dibuat DESC, id DESC'
          : 'dibuat ASC, id ASC',
    );

    return hasil.map(Catatan.fromMap).toList();
  }

  static Future<int> ubah(Catatan catatan) async {
    final db = await database;
    return db.update(
      'catatan',
      catatan.toMap()..remove('id'),
      where: 'id = ?',
      whereArgs: [catatan.id],
    );
  }

  static Future<int> hapus(int id) async {
    final db = await database;
    return db.delete(
      'catatan',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

// HALAMAN DAFTAR CATATAN
class CatatanPage extends StatefulWidget {
  const CatatanPage({super.key});

  @override
  State<CatatanPage> createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  final TextEditingController _pencarian = TextEditingController();

  late Future<List<Catatan>> _futureCatatan;
  String _urutan = 'terbaru';
  bool _siap = false;

  @override
  void initState() {
    super.initState();
    _futureCatatan = DbHelper.semua();
    _inisialisasi();
  }

  Future<void> _inisialisasi() async {
    final prefs = await SharedPreferences.getInstance();
    final simpanan = prefs.getString('urutan_catatan') ?? 'terbaru';

    if (!mounted) return;

    setState(() {
      _urutan = simpanan;
      _siap = true;
      _muatCatatan();
    });
  }

  void _muatCatatan() {
    _futureCatatan = DbHelper.semua(
      kata: _pencarian.text,
      urutan: _urutan,
    );
  }

  Future<void> _ubahUrutan(String? nilai) async {
    if (nilai == null) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('urutan_catatan', nilai);

    if (!mounted) return;

    setState(() {
      _urutan = nilai;
      _muatCatatan();
    });
  }

  void _cari(String kata) {
    setState(_muatCatatan);
  }

  Future<void> _bukaForm([Catatan? catatan]) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FormCatatanPage(catatan: catatan),
      ),
    );

    if (!mounted) return;

    setState(_muatCatatan);
  }

  Future<void> _konfirmasiHapus(Catatan catatan) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: const Text('Hapus catatan ini?'),
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
        );
      },
    );

    if (yakin != true) return;

    await DbHelper.hapus(catatan.id!);

    if (!mounted) return;

    setState(_muatCatatan);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Catatan berhasil dihapus')),
    );
  }

  String _formatTanggal(String nilai) {
    final tanggal = DateTime.tryParse(nilai);
    if (tanggal == null) return nilai;

    final t = tanggal.toLocal();
    final hari = t.day.toString().padLeft(2, '0');
    final bulan = t.month.toString().padLeft(2, '0');

    return '$hari-$bulan-${t.year} '
        '${t.hour.toString().padLeft(2, '0')}:'
        '${t.minute.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _pencarian.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Saya'),
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Urutan catatan',
            icon: const Icon(Icons.sort),
            initialValue: _urutan,
            onSelected: _ubahUrutan,
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'terbaru',
                child: Text('Terbaru'),
              ),
              PopupMenuItem(
                value: 'terlama',
                child: Text('Terlama'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: _pencarian,
              onChanged: _cari,
              decoration: InputDecoration(
                hintText: 'Cari berdasarkan judul...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  tooltip: 'Bersihkan pencarian',
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _pencarian.clear();
                    _cari('');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Catatan>>(
              future: _futureCatatan,
              builder: (context, snapshot) {
                if (!_siap ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Terjadi galat: ${snapshot.error}'),
                  );
                }

                final catatan = snapshot.data ?? [];

                if (catatan.isEmpty) {
                  return Center(
                    child: Text(
                      _pencarian.text.isEmpty
                          ? 'Belum ada catatan.\nTekan + untuk menambahkan.'
                          : 'Catatan tidak ditemukan.',
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    setState(_muatCatatan);
                    await _futureCatatan;
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 90),
                    itemCount: catatan.length,
                    itemBuilder: (context, index) {
                      final item = catatan[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.note_alt_outlined),
                          ),
                          title: Text(
                            item.judul,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.isi,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Dibuat: ${_formatTanggal(item.dibuat)}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          isThreeLine: true,
                          onTap: () => _bukaForm(item),
                          trailing: IconButton(
                            tooltip: 'Hapus catatan',
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () => _konfirmasiHapus(item),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bukaForm(),
        tooltip: 'Tambah catatan',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// FORM TAMBAH DAN UBAH CATATAN
class FormCatatanPage extends StatefulWidget {
  final Catatan? catatan;

  const FormCatatanPage({super.key, this.catatan});

  @override
  State<FormCatatanPage> createState() => _FormCatatanPageState();
}

class _FormCatatanPageState extends State<FormCatatanPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _judul;
  late final TextEditingController _isi;
  bool _menyimpan = false;

  @override
  void initState() {
    super.initState();
    _judul = TextEditingController(
      text: widget.catatan?.judul ?? '',
    );
    _isi = TextEditingController(
      text: widget.catatan?.isi ?? '',
    );
  }

  @override
  void dispose() {
    _judul.dispose();
    _isi.dispose();
    super.dispose();
  }

  Future<void> _simpan() async {
    if (!_formKey.currentState!.validate() || _menyimpan) return;

    setState(() => _menyimpan = true);

    try {
      final catatanLama = widget.catatan;

      final catatan = Catatan(
        id: catatanLama?.id,
        judul: _judul.text.trim(),
        isi: _isi.text.trim(),
        dibuat: catatanLama?.dibuat ?? DateTime.now().toIso8601String(),
      );

      if (catatanLama == null) {
        await DbHelper.tambah(catatan);
      } else {
        await DbHelper.ubah(catatan);
      }

      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan catatan: $e')),
      );

      setState(() => _menyimpan = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sedangUbah = widget.catatan != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(sedangUbah ? 'Ubah Catatan' : 'Catatan Baru'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _judul,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Judul',
                hintText: 'Masukkan judul catatan',
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
              validator: (nilai) {
                if (nilai == null || nilai.trim().isEmpty) {
                  return 'Judul wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _isi,
              textCapitalization: TextCapitalization.sentences,
              minLines: 4,
              maxLines: 8,
              decoration: const InputDecoration(
                labelText: 'Isi catatan',
                hintText: 'Tuliskan isi catatan',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              validator: (nilai) {
                if (nilai == null || nilai.trim().isEmpty) {
                  return 'Isi catatan wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _menyimpan ? null : _simpan,
              icon: const Icon(Icons.save),
              label: Text(_menyimpan ? 'Menyimpan...' : 'Simpan Catatan'),
            ),
          ],
        ),
      ),
    );
  }
}
