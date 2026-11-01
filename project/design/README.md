# ReviewInsight — Design Documentation

Folder ini berisi dokumentasi perancangan antarmuka dan alur penggunaan aplikasi ReviewInsight.

Perancangan dilakukan sebagai acuan sebelum proses implementasi aplikasi mobile menggunakan Flutter. Desain dibuat sederhana agar mudah diterapkan ke dalam kode program dan sesuai dengan ruang lingkup MVP.

## 1. Tujuan Perancangan

Perancangan UI/UX bertujuan untuk:

1. Menggambarkan alur utama penggunaan ReviewInsight.
2. Menentukan tata letak setiap halaman.
3. Menentukan tampilan visual aplikasi.
4. Menjadi acuan dalam pembuatan komponen Flutter.
5. Memastikan fitur utama dapat digunakan melalui navigasi yang sederhana.

## 2. User Flow

ReviewInsight menggunakan satu alur utama:

```text
Mulai
  |
  v
Pengguna membuka aplikasi
  |
  v
Dashboard / Beranda
  |
  v
Melihat ringkasan analisis
  |
  v
Memilih topik keluhan
  |
  v
Detail Topik
  |
  v
Melihat daftar ulasan
  |
  v
Selesai
```

Alur tersebut berfokus pada aktivitas pengguna dalam memahami hasil analisis ulasan.

## 3. Wireframe

Wireframe merupakan rancangan awal yang menunjukkan struktur dan tata letak halaman tanpa menitikberatkan pada warna atau dekorasi.

Halaman yang dirancang:

### 3.1 Dashboard

Menampilkan ringkasan jumlah ulasan, distribusi sentimen, dan daftar topik keluhan.

### 3.2 Detail Topik

Menampilkan nama topik, ringkasan kelompok, jumlah ulasan, dan beberapa contoh ulasan yang termasuk dalam kelompok tersebut.

### 3.3 Daftar Ulasan

Menampilkan kumpulan ulasan berdasarkan topik yang dipilih, dilengkapi pencarian dan filter sentimen.

## 4. Mockup

Mockup merupakan rancangan visual yang menggambarkan tampilan aplikasi setelah wireframe ditentukan.

Identitas visual awal:

| Elemen | Nilai |
|---|---|
| Warna utama | #6C5CE7 |
| Positif | #22C55E |
| Netral | #9CA3AF |
| Negatif | #EF4444 |
| Font | Roboto |
| Gaya | Minimalis dan sederhana |

Komponen antarmuka dirancang menggunakan elemen standar Flutter agar mudah diterapkan pada tahap implementasi.

## 5. Prototype

Prototype merupakan simulasi interaktif yang digunakan untuk menggambarkan perpindahan ant halaman dan interaksi pengguna.

Interaksi utama:

1. Pengguna membuka Dashboard.
2. Pengguna memilih topik keluhan.
3. Sistem menampilkan Detail Topik.
4. Pengguna memilih Lihat Semua Ulasan.
5. Sistem menampilkan Daftar Ulasan.
6. Pengguna dapat kembali ke halaman sebelumnya.

Prototype akan digunakan untuk memeriksa alur navigasi sebelum implementasi final.

## 6. Hubungan dengan Implementasi Flutter

Desain dibuat dengan mempertimbangkan komponen Flutter berikut:

| Elemen Desain | Komponen Flutter |
|---|---|
| Halaman | Scaffold |
| Header | AppBar |
| Kartu statistik | Card |
| Tata letak | Row dan Column |
| Daftar topik | ListView.builder |
| Daftar ulasan | ListView.builder |
| Filter sentimen | ChoiceChip atau SegmentedButton |
| Navigasi | Navigator dan BottomNavigationBar |
| Grafik | Library chart Flutter |

Aplikasi menggunakan pola Model-View-Presenter (MVP) sesuai rancangan arsitektur project.

## 7. Struktur Folder

```text
design/
├── README.md
├── user-flow/
│   └── user-flow-reviewinsight.png
├── wireframe/
│   ├── wireframe-dashboard.png
│   ├── wireframe-detail-topik.png
│   └── wireframe-daftar-ulasan.png
├── mockup/
│   ├── mockup-dashboard.png
│   ├── mockup-detail-topik.png
│   └── mockup-daftar-ulasan.png
└── prototype/
    └── prototype-reviewinsight.png
```

## 8. Catatan

Seluruh rancangan pada folder ini merupakan rancangan awal yang dapat mengalami perubahan berdasarkan masukan dosen, hasil evaluasi prototype, dan kebutuhan implementasi.

Angka, persentase, dan contoh ulasan pada desain hanya digunakan sebagai data ilustrasi. Data final akan menggunakan hasil pemrosesan dataset yang telah ditentukan.

Prototype visual belum dianggap sebagai implementasi aplikasi yang sudah terhubung dengan backend dan AI.