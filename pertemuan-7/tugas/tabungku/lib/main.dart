import 'package:flutter/material.dart';

import 'pages/form_kegiatan_page.dart';
import 'pages/shell_page.dart';
import 'models/kegiatan.dart';
import 'state/pengaturan.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pengaturan = Pengaturan();
  await pengaturan.muat();

  runApp(TabungKuApp(pengaturan: pengaturan));
}

class TabungKuApp extends StatelessWidget {
  final Pengaturan pengaturan;

  const TabungKuApp({super.key, required this.pengaturan});

  ThemeData _buatTema(Color warna, Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: warna,
      brightness: brightness,
      scaffoldBackgroundColor: brightness == Brightness.light
          ? const Color(0xFFF5F8F7)
          : null,
      appBarTheme: const AppBarTheme(centerTitle: false),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: brightness == Brightness.light
                ? const Color(0xFFE2E9E6)
                : Colors.white12,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pengaturan,
      builder: (context, _) {
        return MaterialApp(
          title: 'TabungKu',
          debugShowCheckedModeBanner: false,
          theme: _buatTema(pengaturan.warnaTema, Brightness.light),
          darkTheme: _buatTema(pengaturan.warnaTema, Brightness.dark),
          themeMode: pengaturan.mode,
          home: ShellPage(pengaturan: pengaturan),
          onGenerateRoute: (settings) {
            if (settings.name == '/form') {
              final argumen = settings.arguments;

              if (argumen == null || argumen is Kegiatan) {
                return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (_) =>
                      FormKegiatanPage(kegiatan: argumen as Kegiatan?),
                );
              }

              return MaterialPageRoute<void>(
                builder: (_) => const Scaffold(
                  body: Center(child: Text('Data form tidak valid.')),
                ),
              );
            }

            return MaterialPageRoute<void>(
              builder: (_) => Scaffold(
                appBar: AppBar(title: const Text('Halaman tidak ditemukan')),
                body: const Center(
                  child: Text('Halaman yang kamu cari tidak tersedia.'),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
