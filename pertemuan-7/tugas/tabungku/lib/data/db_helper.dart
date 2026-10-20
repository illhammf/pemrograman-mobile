
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../models/kegiatan.dart';

/// Memberi tahu halaman lain ketika data kegiatan berubah.
final ValueNotifier<int> versiData = ValueNotifier<int>(0);

class DbHelper {
  DbHelper._internal();

  static final DbHelper instance = DbHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await _bukaDatabase();
    return _db!;
  }

  Future<Database> _bukaDatabase() async {
    final lokasiDatabase = await getDatabasesPath();
    final pathDatabase = p.join(lokasiDatabase, 'tabungku.db');

    return openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE kegiatan (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            judul TEXT NOT NULL,
            tanggal TEXT NOT NULL,
            selesai INTEGER NOT NULL DEFAULT 0,
            tipe TEXT NOT NULL,
            nominal INTEGER NOT NULL DEFAULT 0,
            kategori TEXT NOT NULL DEFAULT '-'
          )
        ''');

        await db.execute('''
          CREATE INDEX idx_kegiatan_tanggal
          ON kegiatan(tanggal)
        ''');
      },
    );
  }

  /// Mengambil seluruh kegiatan pada tanggal tertentu.
  Future<List<Kegiatan>> pada(String tanggal) async {
    final db = await database;

    final hasil = await db.query(
      'kegiatan',
      where: 'tanggal = ?',
      whereArgs: [tanggal],
      orderBy: 'selesai ASC, id DESC',
    );

    return hasil.map(Kegiatan.fromMap).toList();
  }

  /// Mengambil satu kegiatan berdasarkan ID.
  Future<Kegiatan?> berdasarkanId(int id) async {
    final db = await database;

    final hasil = await db.query(
      'kegiatan',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (hasil.isEmpty) return null;

    return Kegiatan.fromMap(hasil.first);
  }

  /// Menambahkan kegiatan baru.
  Future<int> tambah(Kegiatan kegiatan) async {
    final db = await database;

    final data = kegiatan.toMap()..remove('id');

    final id = await db.insert(
      'kegiatan',
      data,
      conflictAlgorithm: ConflictAlgorithm.abort,
    );

    _beriTahuPerubahan();
    return id;
  }

  /// Memperbarui kegiatan yang sudah tersimpan.
  Future<int> ubah(Kegiatan kegiatan) async {
    final id = kegiatan.id;

    if (id == null) {
      throw ArgumentError(
        'ID kegiatan wajib tersedia untuk mengubah data.',
      );
    }

    final db = await database;
    final data = kegiatan.toMap()..remove('id');

    final jumlahBerubah = await db.update(
      'kegiatan',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (jumlahBerubah > 0) {
      _beriTahuPerubahan();
    }

    return jumlahBerubah;
  }

  /// Mengubah status selesai atau belum selesai.
  Future<int> ubahStatus(int id, bool selesai) async {
    final db = await database;

    final jumlahBerubah = await db.update(
      'kegiatan',
      {'selesai': selesai ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );

    if (jumlahBerubah > 0) {
      _beriTahuPerubahan();
    }

    return jumlahBerubah;
  }

  /// Menghapus kegiatan berdasarkan ID.
  Future<int> hapus(int id) async {
    final db = await database;

    final jumlahDihapus = await db.delete(
      'kegiatan',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (jumlahDihapus > 0) {
      _beriTahuPerubahan();
    }

    return jumlahDihapus;
  }

  /// Menghitung jumlah kegiatan, selesai, pemasukan, dan pengeluaran.
  ///
  /// Semua kegiatan pada tanggal tersebut ikut dihitung,
  /// termasuk yang belum selesai.
  Future<Ringkasan> ringkasan(String tanggal) async {
    final db = await database;

    final hasil = await db.rawQuery('''
      SELECT
        COUNT(*) AS jumlah,
        COALESCE(SUM(selesai), 0) AS selesai,
        COALESCE(
          SUM(
            CASE
              WHEN tipe = 'pemasukan' THEN nominal
              ELSE 0
            END
          ), 0
        ) AS masuk,
        COALESCE(
          SUM(
            CASE
              WHEN tipe = 'pengeluaran' THEN nominal
              ELSE 0
            END
          ), 0
        ) AS keluar
      FROM kegiatan
      WHERE tanggal = ?
    ''', [tanggal]);

    final baris = hasil.first;

    return Ringkasan(
      jumlahKegiatan: (baris['jumlah'] as num).toInt(),
      selesai: (baris['selesai'] as num).toInt(),
      pemasukan: (baris['masuk'] as num).toInt(),
      pengeluaran: (baris['keluar'] as num).toInt(),
    );
  }

  /// Menghitung pengeluaran berdasarkan kategori pada tanggal tertentu.
  Future<List<Map<String, Object?>>> pengeluaranPerKategori(
    String tanggal,
  ) async {
    final db = await database;

    return db.rawQuery('''
      SELECT
        kategori,
        COALESCE(SUM(nominal), 0) AS total
      FROM kegiatan
      WHERE tanggal = ?
        AND tipe = 'pengeluaran'
      GROUP BY kategori
      ORDER BY total DESC
    ''', [tanggal]);
  }

  /// Mengambil ringkasan tujuh hari terakhir hingga tanggal pilihan.
  ///
  /// tanggalAkhir harus menggunakan format yyyy-MM-dd.
  Future<List<Map<String, Object?>>> laporanTujuhHari(
    String tanggalAkhir,
  ) async {
    final akhir = DateTime.parse(tanggalAkhir);
    final awal = akhir.subtract(const Duration(days: 6));

    final tanggalAwal =
        '${awal.year.toString().padLeft(4, '0')}-'
        '${awal.month.toString().padLeft(2, '0')}-'
        '${awal.day.toString().padLeft(2, '0')}';

    final db = await database;

    return db.rawQuery('''
      SELECT
        tanggal,
        COUNT(*) AS jumlah,
        COALESCE(
          SUM(
            CASE
              WHEN tipe = 'pemasukan' THEN nominal
              ELSE 0
            END
          ), 0
        ) AS masuk,
        COALESCE(
          SUM(
            CASE
              WHEN tipe = 'pengeluaran' THEN nominal
              ELSE 0
            END
          ), 0
        ) AS keluar
      FROM kegiatan
      WHERE tanggal >= ? AND tanggal <= ?
      GROUP BY tanggal
      ORDER BY tanggal ASC
    ''', [tanggalAwal, tanggalAkhir]);
  }

  /// Mencari kegiatan berdasarkan judul.
  /// Digunakan untuk fitur pengembangan lanjutan.
  Future<List<Kegiatan>> cari(String kataKunci) async {
    final db = await database;

    final hasil = await db.query(
      'kegiatan',
      where: 'judul LIKE ?',
      whereArgs: ['%$kataKunci%'],
      orderBy: 'tanggal DESC, id DESC',
    );

    return hasil.map(Kegiatan.fromMap).toList();
  }

  void _beriTahuPerubahan() {
    versiData.value++;
  }

  /// Menutup koneksi database jika diperlukan.
  Future<void> tutup() async {
    final db = _db;

    if (db != null) {
      await db.close();
      _db = null;
    }
  }
}
