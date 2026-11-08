import 'package:flutter/material.dart';

void main() {
  runApp(const TabungKuLayoutApp());
}

class TabungKuLayoutApp extends StatelessWidget {
  const TabungKuLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabungKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF00897B),
        scaffoldBackgroundColor: const Color(0xFFF4F7F6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F7F6),
          foregroundColor: Color(0xFF173B36),
          centerTitle: false,
        ),
      ),
      home: const RingkasanPage(),
    );
  }
}

// Model sederhana untuk data transaksi statis.
class Transaksi {
  final String judul;
  final String tanggal;
  final String nominal;
  final bool pemasukan;

  const Transaksi({
    required this.judul,
    required this.tanggal,
    required this.nominal,
    required this.pemasukan,
  });
}

class RingkasanPage extends StatelessWidget {
  const RingkasanPage({super.key});

  // Data transaksi dibuat statis sesuai instruksi tugas.
  final List<Transaksi> transaksi = const [
    Transaksi(
      judul: 'Menabung Bulanan',
      tanggal: '08 November 2026',
      nominal: '+ Rp500.000',
      pemasukan: true,
    ),
    Transaksi(
      judul: 'Membeli Buku',
      tanggal: '07 November 2026',
      nominal: '- Rp75.000',
      pemasukan: false,
    ),
    Transaksi(
      judul: 'Uang Saku',
      tanggal: '05 November 2026',
      nominal: '+ Rp200.000',
      pemasukan: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar sebagai judul utama halaman.
      appBar: AppBar(
        title: const Text(
          'Ringkasan Tabungan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      // LayoutBuilder mendeteksi lebar layar untuk menyesuaikan tata letak.
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool layarTablet = constraints.maxWidth >= 700;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: layarTablet ? 32 : 20,
              vertical: 20,
            ),
            child: Center(
              // Membatasi lebar konten agar tetap rapi pada layar besar.
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1050),
                child: layarTablet
                    ? _layoutTablet(context)
                    : _layoutPonsel(context),
              ),
            ),
          );
        },
      ),
    );
  }

  // Tata letak untuk layar ponsel menggunakan Column.
  Widget _layoutPonsel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _kartuRingkasan(),
        const SizedBox(height: 24),
        _judulBagian('Menu Cepat'),
        const SizedBox(height: 12),
        _menuCepat(context),
        const SizedBox(height: 28),
        _judulBagian('Riwayat Transaksi'),
        const SizedBox(height: 12),
        _daftarTransaksi(),
      ],
    );
  }

  // Tata letak tablet menggunakan Row agar dua bagian dapat berdampingan.
  Widget _layoutTablet(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _kartuRingkasan(),
              const SizedBox(height: 24),
              _judulBagian('Menu Cepat'),
              const SizedBox(height: 12),
              _menuCepat(context),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _judulBagian('Riwayat Transaksi'),
              const SizedBox(height: 12),
              _daftarTransaksi(),
            ],
          ),
        ),
      ],
    );
  }

  // Kartu utama yang berisi nama tabungan, saldo, dan target.
  Widget _kartuRingkasan() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF00897B),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.savings_outlined, color: Colors.white, size: 28),
              const SizedBox(width: 10),

              // Expanded memberikan sisa ruang kepada teks.
              Expanded(
                child: Text(
                  'Tabungan Masa Depan',
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          const Text(
            'Saldo Saat Ini',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 6),
          const Text(
            'Rp2.500.000',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Row membagi informasi target dan progres menjadi dua kolom.
          Row(
            children: [
              Expanded(
                child: _informasiSaldo(
                  'Target Tabungan',
                  'Rp5.000.000',
                  Icons.flag_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _informasiSaldo('Terkumpul', '50%', Icons.trending_up),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Indikator progres menggunakan LinearProgressIndicator.
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: 0.5,
              minHeight: 9,
              backgroundColor: Colors.white30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Widget kecil untuk informasi target dan progres tabungan.
  Widget _informasiSaldo(String judul, String nilai, IconData ikon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(ikon, color: Colors.white70, size: 17),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                judul,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          nilai,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Tiga tombol menu menggunakan Row dan Expanded.
  Widget _menuCepat(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _tombolMenu(
            context,
            'Menabung',
            Icons.add_circle_outline,
            const Color(0xFFE0F2F1),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _tombolMenu(
            context,
            'Tarik',
            Icons.remove_circle_outline,
            const Color(0xFFFFF3E0),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _tombolMenu(
            context,
            'Riwayat',
            Icons.history,
            const Color(0xFFEDE7F6),
          ),
        ),
      ],
    );
  }

  // Tampilan masing-masing tombol menu.
  Widget _tombolMenu(
    BuildContext context,
    String judul,
    IconData ikon,
    Color warna,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Menu $judul dipilih')));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 4),
        decoration: BoxDecoration(
          color: warna,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(ikon, size: 27, color: const Color(0xFF24564E)),
            const SizedBox(height: 8),
            Text(
              judul,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24564E),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Judul untuk setiap bagian halaman.
  Widget _judulBagian(String judul) {
    return Text(
      judul,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Color(0xFF173B36),
      ),
    );
  }

  // Daftar transaksi ditampilkan menggunakan ListView.builder.
  Widget _daftarTransaksi() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transaksi.length,
      itemBuilder: (context, index) {
        final item = transaksi[index];

        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 12),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Ikon transaksi.
                Container(
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: item.pemasukan
                        ? const Color(0xFFE0F2F1)
                        : const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item.pemasukan ? Icons.arrow_downward : Icons.arrow_upward,
                    color: item.pemasukan ? Colors.teal : Colors.redAccent,
                  ),
                ),
                const SizedBox(width: 12),

                // Expanded memberikan ruang fleksibel untuk judul dan tanggal.
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.judul,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item.tanggal,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),

                // Nominal tetap terlihat dan tidak terpotong.
                Flexible(
                  child: Text(
                    item.nominal,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: item.pemasukan ? Colors.teal : Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
