
String formatRupiah(int nominal) {
  final angka = nominal.abs().toString();
  final hasil = StringBuffer();

  for (int i = 0; i < angka.length; i++) {
    hasil.write(angka[i]);

    final sisa = angka.length - i - 1;

    if (sisa > 0 && sisa % 3 == 0) {
      hasil.write('.');
    }
  }

  final tanda = nominal < 0 ? '- ' : '';
  return '${tanda}Rp ${hasil.toString()}';
}

String formatTanggal(DateTime tanggal) {
  const namaBulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  return '${tanggal.day} ${namaBulan[tanggal.month - 1]} '
      '${tanggal.year}';
}

String tanggalDatabase(DateTime tanggal) {
  final tahun = tanggal.year.toString().padLeft(4, '0');
  final bulan = tanggal.month.toString().padLeft(2, '0');
  final hari = tanggal.day.toString().padLeft(2, '0');

  return '$tahun-$bulan-$hari';
}
