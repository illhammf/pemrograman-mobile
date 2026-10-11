
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Praktikum 5',
      debugShowCheckedModeBanner: false,
      home: PengaturanPage(),
    );
  }
}

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  final TextEditingController _controller = TextEditingController();

  bool _gelap = false;
  int _bukaKe = 0;
  bool _memuat = true;

  @override
  void initState() {
    super.initState();
    _muat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _muat() async {
    final prefs = await SharedPreferences.getInstance();

    final nama = prefs.getString('nama') ?? '';
    final gelap = prefs.getBool('gelap') ?? false;
    final bukaKe = (prefs.getInt('bukaKe') ?? 0) + 1;

    await prefs.setInt('bukaKe', bukaKe);

    if (!mounted) return;

    setState(() {
      _controller.text = nama;
      _gelap = gelap;
      _bukaKe = bukaKe;
      _memuat = false;
    });
  }

  Future<void> _simpanNama() async {
    final nama = _controller.text.trim();

    if (nama.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nama tidak boleh kosong.'),
        ),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', nama);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Nama berhasil disimpan.'),
      ),
    );
  }

  Future<void> _ubahTema(bool nilai) async {
    setState(() {
      _gelap = nilai;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('gelap', nilai);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _gelap ? Brightness.dark : Brightness.light,
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pengaturan'),
        ),
        body: _memuat
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.settings,
                      size: 72,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        hintText: 'Masukkan nama kamu',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _simpanNama,
                      icon: const Icon(Icons.save),
                      label: const Text('Simpan nama'),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Mode gelap'),
                      subtitle: const Text(
                        'Simpan pilihan tema aplikasi',
                      ),
                      secondary: Icon(
                        _gelap ? Icons.dark_mode : Icons.light_mode,
                      ),
                      value: _gelap,
                      onChanged: _ubahTema,
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.refresh),
                        title: const Text('Jumlah aplikasi dibuka'),
                        subtitle: const Text(
                          'Bertambah setiap aplikasi dijalankan kembali',
                        ),
                        trailing: Text(
                          '$_bukaKe',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
