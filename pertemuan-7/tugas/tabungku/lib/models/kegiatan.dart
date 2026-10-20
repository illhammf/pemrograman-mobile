
enum Tipe {
  tanpa,
  pemasukan,
  pengeluaran,
}

class Kegiatan {
  final int? id;
  final String judul;
  final String tanggal;
  final bool selesai;
  final Tipe tipe;
  final int nominal;
  final String kategori;

  const Kegiatan({
    this.id,
    required this.judul,
    required this.tanggal,
    this.selesai = false,
    required this.tipe,
    this.nominal = 0,
    this.kategori = '-',
  });

  int get nilaiTabungan {
    switch (tipe) {
      case Tipe.pemasukan:
        return nominal;
      case Tipe.pengeluaran:
        return -nominal;
      case Tipe.tanpa:
        return 0;
    }
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'judul': judul,
      'tanggal': tanggal,
      'selesai': selesai ? 1 : 0,
      'tipe': tipe.name,
      'nominal': tipe == Tipe.tanpa ? 0 : nominal,
      'kategori':
          tipe == Tipe.pengeluaran ? kategori : '-',
    };
  }

  factory Kegiatan.fromMap(Map<String, Object?> map) {
    final namaTipe = map['tipe'] as String;

    return Kegiatan(
      id: map['id'] as int?,
      judul: map['judul'] as String,
      tanggal: map['tanggal'] as String,
      selesai: (map['selesai'] as int) == 1,
      tipe: Tipe.values.byName(namaTipe),
      nominal: map['nominal'] as int,
      kategori: map['kategori'] as String,
    );
  }

  Kegiatan copyWith({
    int? id,
    String? judul,
    String? tanggal,
    bool? selesai,
    Tipe? tipe,
    int? nominal,
    String? kategori,
  }) {
    return Kegiatan(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      tanggal: tanggal ?? this.tanggal,
      selesai: selesai ?? this.selesai,
      tipe: tipe ?? this.tipe,
      nominal: nominal ?? this.nominal,
      kategori: kategori ?? this.kategori,
    );
  }
}

class Ringkasan {
  final int jumlahKegiatan;
  final int selesai;
  final int pemasukan;
  final int pengeluaran;

  const Ringkasan({
    required this.jumlahKegiatan,
    required this.selesai,
    required this.pemasukan,
    required this.pengeluaran,
  });

  int get belumSelesai => jumlahKegiatan - selesai;

  int get tabungan => pemasukan - pengeluaran;

  double get persentaseSelesai {
    if (jumlahKegiatan == 0) return 0;
    return selesai / jumlahKegiatan;
  }
}
