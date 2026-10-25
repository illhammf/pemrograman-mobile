
import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/kegiatan.dart';

Future<void> eksporLaporanCsv({
  required List<Kegiatan> kegiatan,
}) async {
  if (kegiatan.isEmpty) {
    throw Exception('Tidak ada kegiatan untuk diekspor.');
  }

  final List<List<dynamic>> baris = [
    [
      'Tanggal',
      'Judul Kegiatan',
      'Kategori',
      'Jenis Transaksi',
      'Status',
      'Pemasukan',
      'Pengeluaran',
    ],
  ];

  for (final item in kegiatan) {
    final bool pemasukan = item.tipe == Tipe.pemasukan;
    final bool pengeluaran = item.tipe == Tipe.pengeluaran;

    baris.add([
      item.tanggal,
      item.judul,
      item.kategori,
      switch (item.tipe) {
        Tipe.pemasukan => 'Pemasukan',
        Tipe.pengeluaran => 'Pengeluaran',
        Tipe.tanpa => 'Kegiatan',
      },
      item.selesai ? 'Selesai' : 'Belum selesai',
      pemasukan ? item.nominal : 0,
      pengeluaran ? item.nominal : 0,
    ]);
  }

  final String isiCsv = _encodeCsv(baris);

  final Directory direktori = await getTemporaryDirectory();

  final String waktu = DateTime.now()
      .toIso8601String()
      .replaceAll(':', '-')
      .replaceAll('.', '-');

  final File file = File(
    '${direktori.path}/laporan_tabungku_$waktu.csv',
  );

  // BOM membantu Excel mengenali teks UTF-8.
  await file.writeAsString(
    '\uFEFF$isiCsv',
    encoding: utf8,
    flush: true,
  );

  await SharePlus.instance.share(
    ShareParams(
      files: [
        XFile(
          file.path,
          mimeType: 'text/csv',
        ),
      ],
      subject: 'Laporan Keuangan TabungKu',
      text: 'Laporan kegiatan dan transaksi dari TabungKu.',
    ),
  );
}

String _encodeCsv(List<List<dynamic>> baris) {
  return baris.map((kolom) {
    return kolom.map((nilai) {
      final teks = nilai?.toString() ?? '';

      // Escape tanda kutip agar format CSV tetap valid.
      final teksAman = teks.replaceAll('"', '""');

      // Bungkus teks dengan tanda kutip jika mengandung
      // koma, tanda kutip, atau baris baru.
      if (teks.contains(',') ||
          teks.contains('"') ||
          teks.contains('\n') ||
          teks.contains('\r')) {
        return '"$teksAman"';
      }

      return teks;
    }).join(',');
  }).join('\r\n');
}
