
import 'package:flutter/material.dart';

import '../data/db_helper.dart';
import '../models/kegiatan.dart';
import '../utils/format.dart';

class FormKegiatanPage extends StatefulWidget {
  final Kegiatan? kegiatan;

  const FormKegiatanPage({
    super.key,
    this.kegiatan,
  });

  @override
  State<FormKegiatanPage> createState() => _FormKegiatanPageState();
}

class _FormKegiatanPageState extends State<FormKegiatanPage> {
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  final _nominalController = TextEditingController();

  DateTime _tanggal = DateTime.now();
  Tipe _tipe = Tipe.tanpa;
  String _kategori = 'Makanan';
  bool _menyimpan = false;

  static const _kategoriPengeluaran = [
    'Makanan',
    'Transportasi',
    'Belanja',
    'Tagihan',
    'Kesehatan',
    'Pendidikan',
    'Hiburan',
    'Lainnya',
  ];

  bool get _modeUbah => widget.kegiatan != null;

  @override
  void initState() {
    super.initState();

    final data = widget.kegiatan;

    if (data != null) {
      _judulController.text = data.judul;
      _nominalController.text =
          data.nominal == 0 ? '' : data.nominal.toString();
      _tanggal = DateTime.parse(data.tanggal);
      _tipe = data.tipe;

      if (_kategoriPengeluaran.contains(data.kategori)) {
        _kategori = data.kategori;
      }
    }
  }

  @override
  void dispose() {
    _judulController.dispose();
    _nominalController.dispose();
    super.dispose();
  }

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

  Future<void> _simpan() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _menyimpan = true);

    try {
      final nominal = _tipe == Tipe.tanpa
          ? 0
          : int.parse(_nominalController.text.trim());

      final dataLama = widget.kegiatan;

      final kegiatan = Kegiatan(
        id: dataLama?.id,
        judul: _judulController.text.trim(),
        tanggal: tanggalDatabase(_tanggal),
        selesai: dataLama?.selesai ?? false,
        tipe: _tipe,
        nominal: nominal,
        kategori:
            _tipe == Tipe.pengeluaran ? _kategori : '-',
      );

      if (_modeUbah) {
        await DbHelper.instance.ubah(kegiatan);
      } else {
        await DbHelper.instance.tambah(kegiatan);
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _modeUbah
                ? 'Kegiatan berhasil diperbarui.'
                : 'Kegiatan berhasil ditambahkan.',
          ),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan kegiatan: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _menyimpan = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _modeUbah ? 'Ubah Kegiatan' : 'Tambah Kegiatan',
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Informasi Kegiatan',
              style: tema.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _judulController,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Nama kegiatan',
                hintText: 'Contoh: Membeli makan siang',
                prefixIcon: Icon(Icons.edit_note),
                border: OutlineInputBorder(),
              ),
              validator: (nilai) {
                if (nilai == null || nilai.trim().isEmpty) {
                  return 'Nama kegiatan wajib diisi.';
                }

                if (nilai.trim().length < 3) {
                  return 'Nama kegiatan minimal 3 karakter.';
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_month),
                title: const Text('Tanggal'),
                subtitle: Text(formatTanggal(_tanggal)),
                trailing: const Icon(Icons.edit_calendar),
                onTap: _pilihTanggal,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Tipe>(
              value: _tipe,
              decoration: const InputDecoration(
                labelText: 'Jenis kegiatan',
                prefixIcon: Icon(Icons.account_balance_wallet_outlined),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: Tipe.tanpa,
                  child: Text('Kegiatan biasa'),
                ),
                DropdownMenuItem(
                  value: Tipe.pemasukan,
                  child: Text('Pemasukan'),
                ),
                DropdownMenuItem(
                  value: Tipe.pengeluaran,
                  child: Text('Pengeluaran'),
                ),
              ],
              onChanged: (nilai) {
                if (nilai != null) {
                  setState(() => _tipe = nilai);
                }
              },
            ),
            if (_tipe != Tipe.tanpa) ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _nominalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nominal (Rupiah)',
                  hintText: 'Contoh: 25000',
                  prefixIcon: Icon(Icons.payments_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (nilai) {
                  if (_tipe == Tipe.tanpa) return null;

                  final angka = int.tryParse(
                    (nilai ?? '').trim(),
                  );

                  if (angka == null || angka <= 0) {
                    return 'Nominal harus berupa angka lebih dari 0.';
                  }

                  return null;
                },
              ),
            ],
            if (_tipe == Tipe.pengeluaran) ...[
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _kategori,
                decoration: const InputDecoration(
                  labelText: 'Kategori pengeluaran',
                  prefixIcon: Icon(Icons.category_outlined),
                  border: OutlineInputBorder(),
                ),
                items: _kategoriPengeluaran.map((kategori) {
                  return DropdownMenuItem(
                    value: kategori,
                    child: Text(kategori),
                  );
                }).toList(),
                onChanged: (nilai) {
                  if (nilai != null) {
                    setState(() => _kategori = nilai);
                  }
                },
              ),
            ],
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _menyimpan ? null : _simpan,
              icon: _menyimpan
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.save_outlined),
              label: Text(
                _menyimpan ? 'Menyimpan...' : 'Simpan Kegiatan',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
