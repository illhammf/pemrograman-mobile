
import 'package:flutter/material.dart';

import '../data/db_helper.dart';
import '../utils/format.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  DateTime _tanggal = DateTime.now();

  Future<void> _pilihTanggal() async {
    final hasil = await showDatePicker(
      context: context,
      initialDate: _tanggal,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (hasil != null && mounted) {
      setState(() => _tanggal = hasil);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tanggal = tanggalDatabase(_tanggal);
    final tema = Theme.of(context);

    return ValueListenableBuilder<int>(
      valueListenable: versiData,
      builder: (context, versi, _) {
        return FutureBuilder<List<dynamic>>(
          future: Future.wait([
            DbHelper.instance.ringkasan(tanggal),
            DbHelper.instance.pengeluaranPerKategori(tanggal),
            DbHelper.instance.laporanTujuhHari(tanggal),
          ]),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Gagal memuat laporan: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final ringkasan = snapshot.data![0] as dynamic;
            final kategori =
                snapshot.data![1] as List<Map<String, Object?>>;
            final mingguan =
                snapshot.data![2] as List<Map<String, Object?>>;

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.calendar_month),
                    title: const Text('Tanggal laporan'),
                    subtitle: Text(formatTanggal(_tanggal)),
                    trailing: const Icon(Icons.edit_calendar),
                    onTap: _pilihTanggal,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ringkasan Keuangan',
                  style: tema.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _AngkaLaporan(
                  judul: 'Pemasukan',
                  nilai: formatRupiah(ringkasan.pemasukan as int),
                  ikon: Icons.trending_up,
                  warna: Colors.green,
                ),
                const SizedBox(height: 10),
                _AngkaLaporan(
                  judul: 'Pengeluaran',
                  nilai: formatRupiah(ringkasan.pengeluaran as int),
                  ikon: Icons.trending_down,
                  warna: Colors.red,
                ),
                const SizedBox(height: 10),
                _AngkaLaporan(
                  judul: 'Tabungan bersih',
                  nilai: formatRupiah(ringkasan.tabungan as int),
                  ikon: Icons.savings_outlined,
                  warna: ringkasan.tabungan < 0
                      ? tema.colorScheme.error
                      : tema.colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  'Pengeluaran per Kategori',
                  style: tema.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                if (kategori.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Belum ada pengeluaran pada tanggal ini.',
                      ),
                    ),
                  )
                else
                  for (final item in kategori)
                    Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: const Icon(Icons.category_outlined),
                        title: Text(item['kategori'] as String),
                        trailing: Text(
                          formatRupiah((item['total'] as num).toInt()),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                const SizedBox(height: 24),
                Text(
                  'Rekap Tujuh Hari',
                  style: tema.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                if (mingguan.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Belum ada data untuk periode ini.',
                      ),
                    ),
                  )
                else
                  for (final item in mingguan)
                    Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formatTanggal(
                                DateTime.parse(item['tanggal'] as String),
                              ),
                              style: tema.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Pemasukan: ${formatRupiah((item['masuk'] as num).toInt())}',
                            ),
                            Text(
                              'Pengeluaran: ${formatRupiah((item['keluar'] as num).toInt())}',
                            ),
                            Text('Jumlah kegiatan: ${item['jumlah']}'),
                          ],
                        ),
                      ),
                    ),
              ],
            );
          },
        );
      },
    );
  }
}

class _AngkaLaporan extends StatelessWidget {
  final String judul;
  final String nilai;
  final IconData ikon;
  final Color warna;

  const _AngkaLaporan({
    required this.judul,
    required this.nilai,
    required this.ikon,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(ikon, color: warna, size: 30),
        title: Text(judul),
        trailing: Text(
          nilai,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: warna,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
