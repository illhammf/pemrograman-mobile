# Dokumentasi Project ReviewInsight

Folder ini berisi dokumentasi kebutuhan dan perancangan untuk project ReviewInsight, yaitu sistem analisis ulasan aplikasi mobile berbahasa Indonesia berbasis sentimen dan topik keluhan.

Dokumentasi disusun untuk membantu proses perancangan sebelum implementasi, menjaga konsistensi kebutuhan produk, serta menjadi acuan saat melakukan pengembangan dan pengujian.

## 1. Tujuan Dokumentasi

Dokumentasi project dibuat untuk:

1. Menjelaskan masalah dan tujuan pengembangan ReviewInsight.
2. Menentukan kebutuhan pengguna dan ruang lingkup sistem.
3. Menjabarkan kebutuhan produk menjadi spesifikasi fitur.
4. Mendokumentasikan keputusan perancangan berdasarkan metode Double Diamond.
5. Menjadi acuan dalam implementasi aplikasi mobile, dashboard web, backend API, database, dan layanan AI.
6. Membantu proses konsultasi, evaluasi, dan penilaian project akhir mata kuliah.

Dokumentasi akan diperbarui apabila terdapat perubahan kebutuhan, hasil Research baru, keputusan teknologi, atau masukan dari dosen.

## 2. Daftar Dokumen

### 2.1 Business Requirement Document (BRD)

BRD menjelaskan kebutuhan dan tujuan project pada tingkat bisnis atau kebutuhan sistem secara umum.

Bagian yang dibahas dalam BRD meliputi:

- Ringkasan eksekutif.
- Latar belakang dan justifikasi.
- Tujuan project.
- Ruang lingkup.
- Stakeholder dan pengguna.
- Persyaratan fungsional.
- Persyaratan nonfungsional.
- Arsitektur tingkat tinggi.
- Model data ringkas.
- Alur proses bisnis.
- Teknologi.
- Asumsi.
- Risiko dan mitigasi.
- Kriteria penerimaan.
- Diagram use case.
- Keterkaitan dengan Double Diamond.

BRD digunakan untuk menjelaskan alasan project dibuat, masalah yang ingin diselesaikan, batasan sistem, dan kebutuhan tingkat tinggi yang harus dipenuhi.

### 2.2 Product Requirements Document (PRD)

PRD menjelaskan kebutuhan produk secara lebih terperinci dan menjadi acuan implementasi.

Bagian PRD direncanakan mencakup:

- Pendahuluan dan definisi produk.
- Tujuan produk.
- Persona pengguna.
- User story.
- Product backlog.
- Prioritas fitur dan ruang lingkup MVP.
- Sitemap dan navigasi.
- User flow dan alur proses.
- Spesifikasi fitur.
- Rancangan antarmuka dan wireframe.
- Kebutuhan API dan database.
- Kebutuhan pemrosesan AI.
- Teknologi dan arsitektur implementasi.
- Roadmap pengembangan.
- Acceptance criteria.
- Rencana pengujian.

PRD digunakan untuk menjelaskan apa yang harus dibangun, bagaimana fitur bekerja, bagaimana pengguna berinteraksi dengan sistem, dan bagaimana setiap kebutuhan akan diuji.

### 2.3 Dokumentasi Double Diamond

Dokumentasi Double Diamond digunakan untuk mencatat proses perancangan produk melalui empat tahap.

| Tahap | Fokus | Hasil yang Direncanakan |
|---|---|---|
| Research | Meneliti masalah, literatur, kompetitor, dataset, dan kebutuhan calon pengguna | Matriks literatur, catatan kompetitor, audit dataset, dan hasil validasi |
| Insights | Menyusun temuan dan menentukan masalah prioritas | Pernyataan masalah dan kebutuhan utama |
| Ideation | Mengembangkan solusi, fitur, alur pengguna, dan rancangan sistem | Prioritas fitur, user flow, wireframe, dan arsitektur |
| Prototype | Membuat prototipe dan menguji solusi | Prototipe, hasil evaluasi, dan daftar perbaikan |

Hasil dari setiap tahap akan digunakan sebagai dasar untuk menentukan keputusan pada tahap berikutnya. Temuan Research dapat mengubah prioritas fitur dan ruang lingkup produk apabila ditemukan kebutuhan atau keterbatasan baru.

## 3. Gambaran Sistem

ReviewInsight direncanakan terdiri dari beberapa komponen utama.

### 3.1 Aplikasi Mobile

Aplikasi Android dibangun menggunakan Flutter dan Dart. Arsitektur yang direncanakan adalah Model-View-Presenter (MVP).

Aplikasi mobile berfungsi untuk menampilkan ringkasan analisis, distribusi sentimen, daftar ulasan, detail ulasan, topik, serta riwayat analisis.

### 3.2 Dashboard Web

Dashboard dikembangkan menggunakan Laravel Blade dan PHP.

Dashboard berfungsi untuk menampilkan visualisasi analitik, tabel ulasan, distribusi topik, filter, dan informasi hasil analisis.

### 3.3 Backend API

Backend direncanakan menggunakan Laravel untuk menyediakan REST API, mengelola request, mengambil data dari database, dan menghubungkan antarmuka dengan layanan AI.

### 3.4 Database

Database direncanakan menggunakan MySQL untuk menyimpan metadata dataset, ulasan, hasil prediksi sentimen, kelompok topik, dan riwayat analisis.

### 3.5 Layanan AI

Pemrosesan AI direncanakan menggunakan Python apabila dibutuhkan oleh model dan library yang dipilih. Layanan ini akan menjalankan klasifikasi sentimen dan pengelompokan topik berdasarkan hasil eksperimen.

Keputusan teknis final akan ditetapkan setelah pemeriksaan kebutuhan, kecocokan model, lisensi, dan kemampuan sumber daya.

## 4. Status Dokumentasi

Status awal penyusunan dokumentasi adalah sebagai berikut.

| Dokumen/Aktivitas | Status |
|---|---|
| Konsep awal project | Dalam perancangan |
| BRD | Draft awal |
| PRD | Draft awal, bagian 1–5.3 telah disusun |
| Research literatur dan kompetitor | Perlu dilengkapi dan divalidasi |
| Audit dataset dan lisensi | Belum final |
| Validasi kebutuhan dengan dosen | Menunggu konsultasi |
| Sitemap dan user flow | Belum disusun final |
| Wireframe | Belum disusun |
| Spesifikasi API dan database | Rancangan awal |
| Implementasi sistem | Belum dimulai sebagai implementasi final |
| Pengujian dan deployment | Direncanakan pada tahap pengembangan |

Status akan diperbarui seiring perkembangan project dan keputusan yang telah dikonfirmasi.

## 5. Prinsip Penyusunan Dokumentasi

Penyusunan dokumen mengikuti prinsip berikut:

1. **Berdasarkan kebutuhan:** fitur ditentukan berdasarkan masalah dan kebutuhan yang ingin diselesaikan.
2. **Terukur:** kebutuhan harus dapat diperiksa melalui demonstrasi atau pengujian.
3. **Konsisten:** BRD, PRD, rancangan teknis, dan implementasi harus menggunakan istilah dan ruang lingkup yang selaras.
4. **Transparan:** asumsi, keterbatasan, dan keputusan yang belum final harus ditandai dengan jelas.
5. **Bertahap:** rancangan diperbarui berdasarkan hasil Research, masukan dosen, dan evaluasi prototipe.
6. **Realistis:** prioritas fitur mempertimbangkan waktu satu semester dan kapasitas pengembangan individual.
7. **Memperhatikan lisensi:** penggunaan dataset dan model harus mengikuti ketentuan sumbernya.

## 6. Hubungan dengan Implementasi

Dokumentasi ini akan menjadi acuan ketika implementasi dimulai. Setiap fitur yang masuk ruang lingkup MVP harus memiliki kebutuhan yang jelas, alur penggunaan yang dipahami, serta kriteria penerimaan yang dapat diuji.

Perubahan kebutuhan akan dicatat agar alasan perubahan dan dampaknya terhadap fitur lain dapat diketahui.

## 7. Catatan

ReviewInsight masih berada pada tahap perancangan awal. Judul, dataset, metode AI, teknologi final, dan ruang lingkup dapat disesuaikan berdasarkan hasil Research, eksperimen teknis, serta masukan dosen.

Dokumen ini tidak menyatakan bahwa sistem atau fitur yang direncanakan telah selesai dibuat. Status implementasi akan diperbarui berdasarkan hasil pengerjaan yang benar-benar telah dilakukan.

## 8. Pengembang

**Ilham Firmansyah**

Mahasiswa dan pengembang project akhir mata kuliah Pemrograman Mobile.
