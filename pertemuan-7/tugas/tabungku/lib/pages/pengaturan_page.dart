
import 'package:flutter/material.dart';

import '../state/pengaturan.dart';
import '../utils/format.dart';

class PengaturanPage extends StatelessWidget {
  final Pengaturan pengaturan;

  const PengaturanPage({
    super.key,
    required this.pengaturan,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pengaturan,
      builder: (context, _) {
        final tema = Theme.of(context);

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Pengaturan Tampilan',
              style: tema.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: SwitchListTile(
                secondary: Icon(
                  pengaturan.mode == ThemeMode.dark
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
                title: const Text('Mode gelap'),
                subtitle: Text(
                  pengaturan.mode == ThemeMode.dark
                      ? 'Tema gelap aktif'
                      : 'Tema terang aktif',
                ),
                value: pengaturan.mode == ThemeMode.dark,
                onChanged: pengaturan.ubahMode,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Warna Tema',
              style: tema.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    for (int i = 0; i < pilihanWarnaTema.length; i++)
                      Semantics(
                        label: 'Pilih warna tema ${i + 1}',
                        button: true,
                        child: InkWell(
                          onTap: () => pengaturan.ubahWarna(i),
                          customBorder: const CircleBorder(),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: pilihanWarnaTema[i],
                            child: pengaturan.indeksWarna == i
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
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Target Tabungan Harian',
              style: tema.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatRupiah(pengaturan.targetTabungan),
                      style: tema.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: tema.colorScheme.primary,
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 200000,
                      divisions: 40,
                      label: formatRupiah(pengaturan.targetTabungan),
                      value: pengaturan.targetTabungan
                          .clamp(0, 200000)
                          .toDouble(),
                      onChanged: (nilai) {
                        pengaturan.ubahTarget(nilai.round() ~/ 5000 * 5000);
                      },
                    ),
                    const Text(
                      'Geser untuk mengatur target dalam kelipatan Rp5.000.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: const ListTile(
                leading: Icon(Icons.save_outlined),
                title: Text('Pengaturan tersimpan otomatis'),
                subtitle: Text(
                  'Tema, warna, dan target disimpan secara lokal.',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
