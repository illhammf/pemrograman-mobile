# ReviewInsight — UI/UX Design Documentation

Dokumentasi ini berisi hasil perancangan antarmuka (UI/UX) project **ReviewInsight**, yaitu sistem analisis ulasan aplikasi mobile berbahasa Indonesia berbasis analisis sentimen dan pengelompokan topik keluhan.

Folder ini secara khusus digunakan untuk menyimpan hasil perancangan visual, mulai dari wireframe, mockup, hingga prototype interaktif menggunakan Figma. Hasil desain menjadi referensi dalam proses pengembangan aplikasi mobile menggunakan Flutter dan dashboard web menggunakan Laravel Blade dan PHP.

## 1. Tujuan Perancangan

Perancangan UI/UX dilakukan untuk memberikan gambaran mengenai tampilan, struktur halaman, komponen, serta alur interaksi pengguna sebelum proses implementasi dimulai.

Tujuan perancangan meliputi:

- Menentukan tata letak dan struktur setiap halaman.
- Menentukan identitas visual ReviewInsight.
- Menjaga konsistensi tampilan aplikasi mobile dan dashboard web.
- Menggambarkan navigasi dan interaksi ant halaman.
- Menyediakan referensi visual untuk implementasi Flutter dan Laravel Blade.
- Mempermudah evaluasi desain serta konsultasi dengan dosen.

## 2. Platform dan Teknologi

ReviewInsight dirancang memiliki dua platform utama:

| Platform | Teknologi | Keterangan |
|---|---|---|
| Mobile Application | Flutter dan Dart | Aplikasi Android untuk mengakses hasil analisis |
| Web Dashboard | Laravel Blade dan PHP | Dashboard untuk menampilkan ringkasan dan visualisasi analisis |

Kedua platform menggunakan identitas visual yang sama, tetapi memiliki tata letak dan pola navigasi yang disesuaikan dengan karakteristik perangkat masing-masing.

## 3. Design System

Identitas visual ReviewInsight menggunakan warna ungu sebagai warna utama untuk memberikan tampilan yang konsisten dan mudah dikenali.

| Elemen | Kode Warna |
|---|---|
| Primary | `#4B16A8` |
| Secondary | `#6D28D9` |
| Accent | `#8B5CF6` |
| Background | `#FFFFFF` |
| Soft Background | `#F8F7FC` |
| Primary Text | `#17152D` |
| Positive | `#16A34A` |
| Neutral | `#9CA3AF` |
| Negative | `#EF4444` |

Komponen visual menggunakan gaya sederhana dan konsisten, seperti rounded cards, tombol, input, ikon, tabel, navigasi, serta grafik untuk menampilkan hasil analisis.

Warna hijau, abu-abu, dan merah digunakan untuk membedakan kategori sentimen positif, netral, dan negatif.

## 4. Wireframe

Wireframe merupakan rancangan awal yang menggambarkan kerangka halaman, tata letak, posisi komponen, dan struktur navigasi sebelum diterapkan desain visual.

### 4.1 Mobile Application Wireframe

Wireframe aplikasi mobile mencakup 14 rancangan layar:

1. Splash Screen
2. Onboarding 1
3. Onboarding 2
4. Onboarding 3
5. Login
6. Register
7. Beranda / Dashboard
8. Daftar Analisis
9. Detail Analisis – Ringkasan
10. Detail Analisis – Sentimen
11. Detail Analisis – Topik
12. Daftar Ulasan
13. Detail Ulasan
14. Profil

**Gambar Wireframe Mobile:**

![Wireframe Aplikasi Mobile](wireframe/Wireframe%20Aplikasi%20ReviewInsight%20Berbahasa%20Indonesia.png)

### 4.2 Web Dashboard Wireframe

Wireframe dashboard web mencakup 10 rancangan halaman:

1. Login
2. Register
3. Dashboard
4. Daftar Analisis
5. Detail Analisis – Ringkasan
6. Detail Analisis – Sentimen
7. Detail Analisis – Topik
8. Detail Analisis – Ulasan
9. Upload / Buat Analisis
10. Pengaturan

**Gambar Wireframe Web:**

![Wireframe Dashboard Web](wireframe/Wireframe%20Dashboard%20ReviewInsight%20Grayscale.png)

## 5. Mockup

Mockup merupakan pengembangan wireframe menjadi desain visual yang lebih lengkap. Pada tahap ini, struktur halaman dilengkapi dengan warna, tipografi, ikon, ilustrasi, tombol, card, dan komponen antarmuka lainnya.

### 5.1 Mobile Application Mockup

Mockup aplikasi mobile mempertahankan identitas visual ungu ReviewInsight dengan navigasi bawah, tampilan ringkasan analisis, distribusi sentimen, daftar topik, dan informasi ulasan.

**Gambar Mockup Mobile:**

![Mockup Aplikasi Mobile](mockup/Kolase%20Mockup%20Aplikasi%20ReviewInsight.png)

### 5.2 Web Dashboard Mockup

Mockup dashboard web menggunakan sidebar sebagai navigasi utama, navbar, kartu statistik, grafik, tabel, dan halaman pengelolaan analisis.

Desain dibuat dengan mempertimbangkan implementasi menggunakan Laravel Blade agar komponen seperti sidebar, navbar, card, tabel, dan form dapat digunakan kembali pada beberapa halaman.

**Gambar Mockup Web:**

![Mockup Dashboard Web](mockup/Kolase%20Mockup%20Dashboard%20ReviewInsight%20Indonesia.png)

## 6. Figma Prototype

Prototype merupakan simulasi interaktif yang menghubungkan beberapa halaman melalui tombol, navigasi, tab, dan elemen interaktif lainnya.

Prototype dibuat menggunakan Figma untuk menggambarkan alur penggunaan ReviewInsight sebelum aplikasi benar-benar dikembangkan.

### 6.1 Mobile Application Prototype

**Platform:** Flutter / Android

Prototype mobile mencakup alur penggunaan mulai dari Splash Screen, Onboarding, Login, Beranda, Analisis, Detail Analisis, Daftar Ulasan, hingga Profil.

**Tautan Figma:**

[ReviewInsight — Mobile App Prototype](https://www.figma.com/proto/LFeFa2RNYcZPvsV1yWZ7hI/ReviewInsight-%E2%80%94-Mobile-App-Prototype?node-id=6-16798&p=f&t=B3oCf6TQRzwTBx8I-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=6%3A16798)

### 6.2 Web Dashboard Prototype

**Platform:** Laravel Blade / PHP

Prototype web mencakup alur Login, Register, Dashboard, Daftar Analisis, Detail Analisis, Upload Analisis, dan Pengaturan.

**Tautan Figma:**

[ReviewInsight — Web Dashboard Prototype](https://www.figma.com/proto/Tv1NBjV5jorkzTe6RFE5UL/ReviewInsight-%E2%80%94-Web-Dashboard-Prototype?node-id=3-14976&t=Y6Sdn6uOE3Proax8-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=3%3A14976)

**Catatan:** Prototype Figma merupakan simulasi visual dan interaksi antarmuka menggunakan data contoh. Prototype belum terhubung dengan backend, database, maupun layanan AI.

## 7. Hubungan Desain dengan Implementasi

Seluruh hasil perancangan akan digunakan sebagai acuan selama proses implementasi.

| Hasil Perancangan | Rencana Implementasi |
|---|---|
| Mobile Wireframe | Struktur halaman dan navigasi Flutter |
| Mobile Mockup | Tampilan visual dan komponen Flutter |
| Mobile Prototype | Acuan interaksi dan navigasi aplikasi |
| Web Wireframe | Struktur layout dan halaman Laravel Blade |
| Web Mockup | Styling CSS dan komponen dashboard |
| Web Prototype | Acuan interaksi dan navigasi dashboard |

Aplikasi mobile direncanakan menggunakan arsitektur Model-View-Presenter (MVP). Dashboard web menggunakan Laravel Blade dengan layout dan komponen yang dapat digunakan kembali.

## 8. Catatan dan Batasan Desain

Seluruh gambar wireframe, mockup, dan prototype pada folder ini merupakan rancangan awal yang digunakan sebagai referensi pengembangan.

Tampilan akhir ketika diimplementasikan dapat mengalami sedikit perubahan atau penyesuaian, misalnya pada:

- Ukuran dan jarak antarkomponen.
- Posisi elemen pada ukuran layar yang berbeda.
- Bentuk ikon dan ilustrasi.
- Responsivitas tampilan.
- Interaksi tombol dan navigasi.
- Komponen yang disesuaikan dengan kemampuan Flutter atau Laravel Blade.
- Penyesuaian berdasarkan hasil pengujian dan masukan dosen.

Perubahan tersebut dilakukan untuk memastikan desain dapat diterapkan dengan baik secara teknis tanpa menghilangkan identitas visual, fungsi utama, dan alur penggunaan yang telah dirancang.

Angka, persentase, tanggal, nama aplikasi, dan contoh ulasan pada gambar hanya merupakan data ilustrasi. Data aktual akan mengikuti dataset yang nantinya dipilih dan diproses oleh sistem.

Prototype visual juga belum dianggap sebagai implementasi aplikasi yang telah terhubung dengan backend, database, maupun AI.

## 9. Status Perancangan

| Tahapan | Platform Mobile | Platform Web |
|---|---|---|
| Wireframe | Selesai | Selesai |
| Mockup | Selesai | Selesai |
| Prototype Figma | Tersedia | Tersedia |
| Implementasi | Belum dimulai | Belum dimulai |

Status dokumentasi dapat diperbarui seiring perkembangan project.

## 10. Pengembang

**Ilham Firmansyah**

Project Akhir Mata Kuliah Pemrograman Mobile.

Repository ini merupakan dokumentasi dan hasil perancangan awal sebelum tahap implementasi ReviewInsight dimulai.