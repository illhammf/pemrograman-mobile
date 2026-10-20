
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<Color> pilihanWarnaTema = [
  Colors.teal,
  Colors.indigo,
  Colors.deepOrange,
  Colors.pink,
];

class Pengaturan extends ChangeNotifier {
  static const String _kunciModeGelap = 'tabungku_mode_gelap';
  static const String _kunciWarna = 'tabungku_warna_tema';
  static const String _kunciTarget = 'tabungku_target_tabungan';

  ThemeMode _mode = ThemeMode.light;
  int _indeksWarna = 0;
  int _targetTabungan = 20000;
  bool _siap = false;

  ThemeMode get mode => _mode;

  int get indeksWarna => _indeksWarna;

  Color get warnaTema => pilihanWarnaTema[_indeksWarna];

  int get targetTabungan => _targetTabungan;

  bool get siap => _siap;

  Future<void> muat() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      _mode = (prefs.getBool(_kunciModeGelap) ?? false)
          ? ThemeMode.dark
          : ThemeMode.light;

      _indeksWarna = (prefs.getInt(_kunciWarna) ?? 0)
          .clamp(0, pilihanWarnaTema.length - 1);

      _targetTabungan = prefs.getInt(_kunciTarget) ?? 20000;

      if (_targetTabungan < 0) {
        _targetTabungan = 20000;
      }
    } catch (e) {
      debugPrint('Gagal memuat pengaturan: $e');
    } finally {
      _siap = true;
      notifyListeners();
    }
  }

  Future<void> ubahMode(bool gelap) async {
    _mode = gelap ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_kunciModeGelap, gelap);
    } catch (e) {
      debugPrint('Gagal menyimpan mode tema: $e');
    }
  }

  Future<void> ubahWarna(int indeks) async {
    if (indeks < 0 || indeks >= pilihanWarnaTema.length) {
      return;
    }

    _indeksWarna = indeks;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_kunciWarna, indeks);
    } catch (e) {
      debugPrint('Gagal menyimpan warna tema: $e');
    }
  }

  Future<void> ubahTarget(int target) async {
    if (target < 0) return;

    _targetTabungan = target;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_kunciTarget, target);
    } catch (e) {
      debugPrint('Gagal menyimpan target tabungan: $e');
    }
  }
}
