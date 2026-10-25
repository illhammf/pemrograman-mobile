
import 'package:flutter/material.dart';

import '../state/pengaturan.dart';
import 'beranda_page.dart';
import 'laporan_page.dart';
import 'pengaturan_page.dart';

class ShellPage extends StatefulWidget {
  final Pengaturan pengaturan;

  const ShellPage({
    super.key,
    required this.pengaturan,
  });

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _indeks = 0;

  static const _judul = [
    'Hari Ini',
    'Laporan',
    'Pengaturan',
  ];

  @override
  Widget build(BuildContext context) {
    final halaman = [
      BerandaPage(pengaturan: widget.pengaturan),
      const LaporanPage(),
      PengaturanPage(pengaturan: widget.pengaturan),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _judul[_indeks],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: IndexedStack(
        index: _indeks,
        children: halaman,
      ),
      floatingActionButton: _indeks == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              icon: const Icon(Icons.add),
              label: const Text('Tambah'),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indeks,
        onDestinationSelected: (indeks) {
          setState(() => _indeks = indeks);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            selectedIcon: Icon(Icons.checklist),
            label: 'Hari Ini',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Laporan',
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
}
