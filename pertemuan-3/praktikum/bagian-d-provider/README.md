# Bagian D — Daftar Tugas dengan Provider

## Tujuan

Membuat aplikasi daftar tugas menggunakan state management Provider.

## Komponen

- ChangeNotifier
- ChangeNotifierProvider
- context.watch
- context.read
- notifyListeners
- Navigator
- ListView.builder

## Model

Setiap tugas memiliki:

- judul
- status selesai

## Operasi

Model menyediakan:

- tambah tugas
- mengubah status selesai
- menghapus tugas

## Halaman

### TugasPage

Menampilkan daftar tugas dan jumlah tugas selesai.

### TambahPage

Digunakan untuk menambahkan tugas baru.

## Konsep State

```text
Provider
   ↓
TugasModel
   ↓
notifyListeners()
   ↓
TugasPage diperbarui