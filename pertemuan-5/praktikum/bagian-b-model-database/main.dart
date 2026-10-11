
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
      title: 'Praktikum 5 - SQLite',
      debugShowCheckedModeBanner: false,
      home: DatabasePage(),
    );
  }
}

// Model untuk merepresentasikan satu catatan.
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

// Pengelola database SQLite.
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

  // CREATE: menambahkan catatan.
  Future<int> tambah(Catatan catatan) async {
    final db = await database;
    return db.insert(
      'catatan',
      catatan.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // READ: mengambil semua catatan.
  Future<List<Catatan>> semua() async {
    final db = await database;

    final hasil = await db.query(
      'catatan',
      orderBy: 'id DESC',
    );

    return hasil.map(Catatan.fromMap).toList();
  }

  // UPDATE: mengubah catatan berdasarkan ID.
  Future<int> ubah(Catatan catatan) async {
    final db = await database;

    return db.update(
      'catatan',
      catatan.toMap(),
      where: 'id = ?',
      whereArgs: [catatan.id],
    );
  }

  // DELETE: menghapus catatan berdasarkan ID.
  Future<int> hapus(int id) async {
    final db = await database;

    return db.delete(
      'catatan',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  final DbHelper _dbHelper = DbHelper.instance;

  List<Catatan> _catatan = [];
  bool _memuat = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _muatCatatan();
  }

  Future<void> _muatCatatan() async {
    try {
      final data = await _dbHelper.semua();

      if (!mounted) return;

      setState(() {
        _catatan = data;
        _memuat = false;
        _error = null;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _memuat = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _formCatatan({Catatan? catatan}) async {
    final judulController = TextEditingController(
      text: catatan?.judul ?? '',
    );
    final isiController = TextEditingController(
      text: catatan?.isi ?? '',
    );

    final formKey = GlobalKey<FormState>();

    final hasil = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            catatan == null ? 'Tambah Catatan' : 'Ubah Catatan',
          ),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: judulController,
                    decoration: const InputDecoration(
                      labelText: 'Judul',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Judul wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: isiController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Isi catatan',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Isi catatan wajib diisi';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(dialogContext, true);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );

    if (hasil == true) {
      final dataBaru = Catatan(
        id: catatan?.id,
        judul: judulController.text.trim(),
        isi: isiController.text.trim(),
      );

      try {
        if (catatan == null) {
          await _dbHelper.tambah(dataBaru);
        } else {
          await _dbHelper.ubah(dataBaru);
        }

        await _muatCatatan();
      } catch (e) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyimpan catatan: $e')),
        );
      }
    }

    judulController.dispose();
    isiController.dispose();
  }

  Future<void> _hapusCatatan(Catatan catatan) async {
    final setuju = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus catatan?'),
          content: Text('Catatan "${catatan.judul}" akan dihapus.'),
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

    await _dbHelper.hapus(catatan.id!);
    await _muatCatatan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Catatan'),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            onPressed: _muatCatatan,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _memuat
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Terjadi kesalahan: $_error'),
                  ),
                )
              : _catatan.isEmpty
                  ? const Center(
                      child: Text(
                        'Belum ada catatan.\nTekan + untuk menambahkan.',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: _catatan.length,
                      itemBuilder: (context, index) {
                        final catatan = _catatan[index];

                        return Card(
                          child: ListTile(
                            title: Text(catatan.judul),
                            subtitle: Text(catatan.isi),
                            isThreeLine: true,
                            trailing: PopupMenuButton<String>(
                              onSelected: (aksi) {
                                if (aksi == 'ubah') {
                                  _formCatatan(catatan: catatan);
                                } else if (aksi == 'hapus') {
                                  _hapusCatatan(catatan);
                                }
                              },
                              itemBuilder: (context) => const [
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
                          ),
                        );
                      },
                    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _formCatatan(),
        tooltip: 'Tambah catatan',
        child: const Icon(Icons.add),
      ),
    );
  }
}
