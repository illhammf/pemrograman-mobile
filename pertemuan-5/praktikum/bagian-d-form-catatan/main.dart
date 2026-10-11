
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Praktikum 5 - Form Catatan',
      debugShowCheckedModeBanner: false,
      home: CatatanPage(),
    );
  }
}

// MODEL
class Catatan {
  final int? id;
  final String judul;
  final String isi;

  const Catatan({
    this.id,
    required this.judul,
    required this.isi,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'judul': judul,
      'isi': isi,
    };
  }

  factory Catatan.fromMap(Map<String, Object?> map) {
    return Catatan(
      id: map['id'] as int,
      judul: map['judul'] as String,
      isi: map['isi'] as String,
    );
  }
}

// DATABASE HELPER
class DbHelper {
  DbHelper._();

  static final DbHelper instance = DbHelper._();
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    final lokasi = p.join(
      await getDatabasesPath(),
      'catatan.db',
    );

    _db = await openDatabase(
      lokasi,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE catatan('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'judul TEXT NOT NULL, '
          'isi TEXT NOT NULL'
          ')',
        );
      },
    );

    return _db!;
  }

  Future<int> tambah(Catatan catatan) async {
    final db = await database;

    return db.insert(
      'catatan',
      catatan.toMap(),
    );
  }

  Future<List<Catatan>> semua() async {
    final db = await database;

    final hasil = await db.query(
      'catatan',
      orderBy: 'id DESC',
    );

    return hasil.map(Catatan.fromMap).toList();
  }

  Future<int> ubah(Catatan catatan) async {
    final db = await database;

    return db.update(
      'catatan',
      catatan.toMap(),
      where: 'id = ?',
      whereArgs: [catatan.id],
    );
  }

  Future<int> hapus(int id) async {
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
  late Future<List<Catatan>> _future;

  @override
  void initState() {
    super.initState();
    _future = DbHelper.instance.semua();
  }

  void _muat() {
    setState(() {
      _future = DbHelper.instance.semua();
    });
  }

  Future<void> _bukaForm([Catatan? catatan]) async {
    await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => FormCatatanPage(catatan: catatan),
      ),
    );

    if (!mounted) return;

    // Muat ulang daftar setelah kembali dari form.
    _muat();
  }

  Future<void> _hapusCatatan(Catatan catatan) async {
    final setuju = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus catatan?'),
          content: Text(
            'Catatan "${catatan.judul}" akan dihapus.',
          ),
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

    if (setuju != true) return;

    try {
      await DbHelper.instance.hapus(catatan.id!);

      if (!mounted) return;

      _muat();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Catatan berhasil dihapus.'),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menghapus catatan: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Saya'),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            onPressed: _muat,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Catatan>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Galat memuat catatan: ${snapshot.error}'),
              ),
            );
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.note_alt_outlined, size: 64),
                    SizedBox(height: 12),
                    Text(
                      'Belum ada catatan',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Tekan tombol + untuk membuat catatan baru.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final catatan = data[index];

              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.description_outlined),
                  ),
                  title: Text(catatan.judul),
                  subtitle: Text(
                    catatan.isi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => _bukaForm(catatan),
                  trailing: IconButton(
                    tooltip: 'Hapus catatan',
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    onPressed: () => _hapusCatatan(catatan),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bukaForm(),
        tooltip: 'Tambah catatan',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// HALAMAN FORM TAMBAH DAN UBAH
class FormCatatanPage extends StatefulWidget {
  final Catatan? catatan;

  const FormCatatanPage({
    super.key,
    this.catatan,
  });

  @override
  State<FormCatatanPage> createState() => _FormCatatanPageState();
}

class _FormCatatanPageState extends State<FormCatatanPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _judul;
  late final TextEditingController _isi;

  bool _menyimpan = false;

  bool get _isBaru => widget.catatan == null;

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
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _menyimpan = true;
    });

    final catatan = Catatan(
      id: widget.catatan?.id,
      judul: _judul.text.trim(),
      isi: _isi.text.trim(),
    );

    try {
      if (_isBaru) {
        await DbHelper.instance.tambah(catatan);
      } else {
        await DbHelper.instance.ubah(catatan);
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isBaru
                ? 'Catatan berhasil ditambahkan.'
                : 'Catatan berhasil diperbarui.',
          ),
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _menyimpan = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyimpan catatan: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isBaru ? 'Catatan Baru' : 'Ubah Catatan',
        ),
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
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
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
                prefixIcon: Icon(Icons.notes),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Isi catatan wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _menyimpan ? null : _simpan,
              icon: _menyimpan
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.save),
              label: Text(
                _menyimpan ? 'Menyimpan...' : 'Simpan',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
