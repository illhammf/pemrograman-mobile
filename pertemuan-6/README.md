# Pertemuan 6 — Tema, Routing dan Navigasi, serta Animasi

## Deskripsi

Pertemuan 6 membahas pengembangan antarmuka aplikasi Flutter melalui pengaturan tema, navigasi antarhalaman, navigasi tab bawah, dan animasi.

Materi ini merupakan lanjutan dari pertemuan sebelumnya yang telah membahas widget, state management, form, asynchronous programming, REST API, dan penyimpanan lokal.

## Tujuan Pembelajaran

Setelah menyelesaikan praktikum ini, mahasiswa diharapkan mampu:

1. Membuat tema terang dan gelap menggunakan `ThemeData` dan `ThemeMode`.
2. Mengubah warna tema berdasarkan pilihan pengguna.
3. Menggunakan `Theme.of(context)` untuk menyesuaikan tampilan aplikasi.
4. Menerapkan named routes dan mengirim argumen antarhalaman.
5. Menggunakan `onGenerateRoute` untuk menangani navigasi.
6. Membuat navigasi tab bawah dengan `NavigationBar` dan `IndexedStack`.
7. Menerapkan animasi implisit, animasi eksplisit, dan transisi `Hero`.

## Materi Praktikum

### Bagian A — Tema Terang/Gelap dan Warna Tema

Mempelajari `ThemeData`, `ThemeMode`, `ValueNotifier`, dan `ListenableBuilder` untuk mengatur tampilan aplikasi secara dinamis.

### Bagian B — Named Routes, Argumen, dan Hero

Mempelajari navigasi bernama menggunakan `Navigator.pushNamed`, pengiriman argumen ant halaman, `onGenerateRoute`, dan transisi `Hero`.

### Bagian C — Animasi

Menerapkan animasi menggunakan:

- `AnimatedContainer`
- `AnimatedSwitcher`
- `AnimationController`
- `RotationTransition`

### Bagian D — Navigasi Tab Bawah

Menggabungkan halaman Beranda, Animasi, dan Pengaturan menggunakan `NavigationBar` dan `IndexedStack`.

### Latihan Mandiri

Latihan mandiri mencakup penyimpanan tema menggunakan SharedPreferences, Drawer untuk navigasi, transisi `FadeTransition`, halaman 404, dan animasi `AnimatedOpacity`.

## Tugas Utama

Membuat aplikasi **Galeri/Katalog Interaktif** dengan ketentuan:

- Memiliki minimal tiga tab menggunakan `NavigationBar`.
- Menggunakan named routes dengan argumen untuk halaman detail.
- Menerapkan animasi `Hero` pada halaman detail.
- Menggunakan minimal dua jenis animasi, termasuk animasi implisit dan eksplisit.
- Menyediakan tema terang/gelap serta minimal tiga pilihan warna.
- Menyimpan pengaturan tema agar tetap tersedia setelah aplikasi ditutup.
- Menggunakan `Theme.of(context)` untuk warna dan gaya tampilan.
- Menyertakan screenshot mode terang, mode gelap, dan halaman detail.

## Struktur Folder

```text
pertemuan-6/
├── README.md
├── doc-tugas/
├── praktikum/
│   ├── README.md
│   └── praktikum_6/
└── tugas/
    ├── README.md
    └── galeri_katalog/
```

## Rubrik Penilaian

| Komponen | Bobot |
|---|---:|
| Praktikum Bagian A–D | 30% |
| Latihan mandiri | 20% |
| Tugas Galeri/Katalog | 40% |
| Kerapian kode dan konsistensi tema | 10% |

## Referensi

- [Flutter Themes](https://docs.flutter.dev/cookbook/design/themes)
- [Named Routes](https://docs.flutter.dev/cookbook/navigation/named-routes)
- [Flutter Animations](https://docs.flutter.dev/ui/animations)
- [Hero Animations](https://docs.flutter.dev/ui/animations/hero-animations)

## Identitas

**Nama:** Ilham Firmansyah  
**NIM:** 20240801102  
**Jurusan:** Teknik Informatika  
**Mata Kuliah:** Pemrograman Mobile  
**Pertemuan:** 6
