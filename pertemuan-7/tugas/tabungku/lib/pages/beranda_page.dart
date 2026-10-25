
import 'package:flutter/material.dart';

import '../data/db_helper.dart';
import '../models/kegiatan.dart';
import '../state/pengaturan.dart';
import '../utils/format.dart';

class BerandaPage extends StatefulWidget {
  final Pengaturan pengaturan;

  const BerandaPage({
    super.key,
    required this.pengaturan,
  });

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final TextEditingController _pencarianController =
      TextEditingController();

  String _kataKunci = '';
  String _filterStatus = 'Semua';

  List<Kegiatan> _filterKegiatan(List<Kegiatan> daftar) {
    final kataKunci = _kataKunci.trim().toLowerCase();

    return daftar.where((kegiatan) {
      final judul = kegiatan.judul.toLowerCase();
      final kategori = kegiatan.kategori.toLowerCase();

      final cocokPencarian =
          judul.contains(kataKunci) ||
          kategori.contains(kataKunci);

      final cocokStatus = switch (_filterStatus) {
        'Belum selesai' => !kegiatan.selesai,
        'Selesai' => kegiatan.selesai,
        _ => true,
      };

      return cocokPencarian && cocokStatus;
    }).toList();
  }

  void _hapusPencarian() {
    _pencarianController.clear();

    setState(() {
      _kataKunci = '';
    });
  }

  @override
  void dispose() {
    _pencarianController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tanggal = tanggalDatabase(DateTime.now());
    final tema = Theme.of(context);

    return ValueListenableBuilder<int>(
      valueListenable: versiData,
      builder: (context, versi, _) {
        return FutureBuilder<List<dynamic>>(
          future: Future.wait([
            DbHelper.instance.pada(tanggal),
            DbHelper.instance.ringkasan(tanggal),
          ]),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Gagal membaca data kegiatan:\n'
                    '${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final kegiatan =
                snapshot.data![0] as List<Kegiatan>;

            final ringkasan =
                snapshot.data![1] as Ringkasan;

            final kegiatanTampil = _filterKegiatan(kegiatan);

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Header halaman.
                Text(
                  'Halo, selamat datang!',
                  style: tema.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  formatTanggal(DateTime.now()),
                  style: tema.textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),

                // Ringkasan keuangan.
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ringkasan Hari Ini',
                          style: tema.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: _InfoAngka(
                                label: 'Pemasukan',
                                nilai: formatRupiah(
                                  ringkasan.pemasukan,
                                ),
                                ikon: Icons.trending_up,
                                warna: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _InfoAngka(
                                label: 'Pengeluaran',
                                nilai: formatRupiah(
                                  ringkasan.pengeluaran,
                                ),
                                ikon: Icons.trending_down,
                                warna: Colors.red,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Saldo tabungan hari ini.
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: ringkasan.tabungan < 0
                                ? tema.colorScheme.errorContainer
                                : tema.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Tabungan Hari Ini'),
                              const SizedBox(height: 4),
                              Text(
                                formatRupiah(ringkasan.tabungan),
                                style: tema.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ringkasan.tabungan < 0
                                      ? tema.colorScheme.onErrorContainer
                                      : tema.colorScheme
                                          .onPrimaryContainer,
                                ),
                              ),

                              if (ringkasan.tabungan < 0)
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    'Pengeluaran lebih besar '
                                    'daripada pemasukan.',
                                  ),
                                ),

                              const SizedBox(height: 16),

                              // Progres target tabungan.
                              AnimatedBuilder(
                                animation: widget.pengaturan,
                                builder: (context, _) {
                                  final target = widget
                                      .pengaturan.targetTabungan;
                                  final tabungan = ringkasan.tabungan;

                                  final progres = target <= 0
                                      ? 0.0
                                      : (tabungan / target)
                                          .clamp(0.0, 1.0)
                                          .toDouble();

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Progres Target Tabungan',
                                            ),
                                          ),
                                          Text(
                                            '${(progres * 100).round()}%',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),

                                      TweenAnimationBuilder<double>(
                                        tween: Tween<double>(
                                          begin: 0,
                                          end: progres,
                                        ),
                                        duration: const Duration(
                                          milliseconds: 700,
                                        ),
                                        curve: Curves.easeOutCubic,
                                        builder: (context, nilai, _) {
                                          return LinearProgressIndicator(
                                            value: nilai,
                                            minHeight: 10,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          );
                                        },
                                      ),

                                      const SizedBox(height: 6),
                                      Text(
                                        'Target: ${formatRupiah(target)}',
                                        style: tema.textTheme.bodySmall,
                                      ),

                                      if (target > 0 &&
                                          tabungan >= target)
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Text(
                                            'Target tabungan hari ini '
                                            'tercapai!',
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Statistik kegiatan.
                        Row(
                          children: [
                            Expanded(
                              child: _InfoAngka(
                                label: 'Total kegiatan',
                                nilai: '${ringkasan.jumlahKegiatan}',
                                ikon: Icons.checklist,
                                warna: tema.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _InfoAngka(
                                label: 'Belum selesai',
                                nilai: '${ringkasan.belumSelesai}',
                                ikon: Icons.pending_actions,
                                warna: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Judul daftar kegiatan.
                Text(
                  'Daftar Kegiatan',
                  style: tema.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // Fitur pencarian judul dan kategori.
                TextField(
                  controller: _pencarianController,
                  onChanged: (nilai) {
                    setState(() {
                      _kataKunci = nilai;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari judul atau kategori kegiatan...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _kataKunci.isEmpty
                        ? null
                        : IconButton(
                            tooltip: 'Hapus pencarian',
                            onPressed: _hapusPencarian,
                            icon: const Icon(Icons.clear),
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Filter status kegiatan.
                DropdownButtonFormField<String>(
                  initialValue: _filterStatus,
                  decoration: InputDecoration(
                    labelText: 'Filter status kegiatan',
                    prefixIcon: const Icon(Icons.filter_list),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Semua',
                      child: Text('Semua kegiatan'),
                    ),
                    DropdownMenuItem(
                      value: 'Belum selesai',
                      child: Text('Belum selesai'),
                    ),
                    DropdownMenuItem(
                      value: 'Selesai',
                      child: Text('Sudah selesai'),
                    ),
                  ],
                  onChanged: (nilai) {
                    if (nilai == null) return;

                    setState(() {
                      _filterStatus = nilai;
                    });
                  },
                ),

                const SizedBox(height: 12),

                // Informasi jumlah hasil filter.
                Text(
                  '${kegiatanTampil.length} dari '
                  '${kegiatan.length} kegiatan ditampilkan',
                  style: tema.textTheme.bodySmall,
                ),

                const SizedBox(height: 8),

                // Daftar kegiatan atau pesan kosong.
                if (kegiatan.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.event_note,
                            size: 44,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Belum ada kegiatan hari ini.',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Tekan tombol Tambah untuk memulai.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                else if (kegiatanTampil.isEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.search_off,
                            size: 44,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Tidak ada kegiatan yang sesuai.',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Coba ubah kata kunci atau filter status.',
                            textAlign: TextAlign.center,
                            style: tema.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 12),
                          OutlinedButton.icon(
                            onPressed: () {
                              _hapusPencarian();

                              setState(() {
                                _filterStatus = 'Semua';
                              });
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text('Reset pencarian dan filter'),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  for (final item in kegiatanTampil)
                    _KegiatanTile(kegiatan: item),

                const SizedBox(height: 80),
              ],
            );
          },
        );
      },
    );
  }
}

// Widget statistik ringkasan.
class _InfoAngka extends StatelessWidget {
  final String label;
  final String nilai;
  final IconData ikon;
  final Color warna;

  const _InfoAngka({
    required this.label,
    required this.nilai,
    required this.ikon,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          ikon,
          color: warna,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          nilai,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

// Widget satu item kegiatan.
class _KegiatanTile extends StatelessWidget {
  final Kegiatan kegiatan;

  const _KegiatanTile({
    required this.kegiatan,
  });

  @override
  Widget build(BuildContext context) {
    final warna = switch (kegiatan.tipe) {
      Tipe.pemasukan => Colors.green,
      Tipe.pengeluaran => Colors.red,
      Tipe.tanpa => Theme.of(context).colorScheme.primary,
    };

    final teksTipe = switch (kegiatan.tipe) {
      Tipe.pemasukan => 'Pemasukan',
      Tipe.pengeluaran => 'Pengeluaran',
      Tipe.tanpa => 'Kegiatan',
    };

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Checkbox(
          value: kegiatan.selesai,
          onChanged: (value) async {
            final id = kegiatan.id;
            if (id == null) return;

            await DbHelper.instance.ubahStatus(
              id,
              value ?? false,
            );
          },
        ),
        title: Text(
          kegiatan.judul,
          style: TextStyle(
            decoration: kegiatan.selesai
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(
          '$teksTipe • ${kegiatan.kategori}',
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (aksi) async {
            final id = kegiatan.id;
            if (id == null) return;

            if (aksi == 'ubah') {
              await Navigator.pushNamed(
                context,
                '/form',
                arguments: kegiatan,
              );
            } else if (aksi == 'hapus') {
              final konfirmasi = await showDialog<bool>(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: const Text('Hapus kegiatan?'),
                  content: Text(
                    'Kegiatan "${kegiatan.judul}" akan dihapus.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext, false);
                      },
                      child: const Text('Batal'),
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(dialogContext, true);
                      },
                      child: const Text('Hapus'),
                    ),
                  ],
                ),
              );

              if (konfirmasi == true) {
                await DbHelper.instance.hapus(id);
              }
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
        isThreeLine: false,
        iconColor: warna,
      ),
    );
  }
}
