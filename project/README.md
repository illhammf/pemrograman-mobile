# ReviewInsight

**Sistem Analisis Ulasan Aplikasi Mobile Berbahasa Indonesia Berbasis Sentimen dan Topik Keluhan**

## 1. Tentang Project

ReviewInsight merupakan rancangan project akhir mata kuliah Pemrograman Mobile yang bertujuan mengembangkan sistem untuk membantu pengguna memahami kumpulan ulasan aplikasi mobile berbahasa Indonesia melalui analisis sentimen dan pengelompokan topik.

Ulasan pengguna dapat berisi pendapat, pengalaman, kritik, saran, dan keluhan mengenai aplikasi. Apabila jumlah ulasan cukup banyak, memahami keseluruhan informasi tersebut dengan membaca setiap ulasan satu per satu dapat menjadi kurang praktis.

ReviewInsight dirancang untuk membantu mengolah ulasan menjadi informasi yang lebih terstruktur. Sistem akan memanfaatkan pemrosesan bahasa alami (*Natural Language Processing* atau NLP) untuk mengklasifikasikan sentimen dan mengelompokkan ulasan berdasarkan kemiripan topiknya.

Hasil analisis direncanakan dapat diakses melalui aplikasi mobile dan dashboard web sehingga pengguna dapat melihat ringkasan, menelusuri ulasan, memeriksa topik, serta membuka kembali hasil analisis yang telah tersimpan.

Project ini masih berada pada tahap perancangan kebutuhan dan dokumentasi awal. Pemilihan dataset, metode AI, dan ruang lingkup final akan disesuaikan dengan hasil Research serta masukan dosen.

## 2. Tujuan Project

Tujuan pengembangan ReviewInsight adalah:

1. Membangun aplikasi mobile untuk menampilkan hasil analisis ulasan aplikasi.
2. Menerapkan klasifikasi sentimen berbahasa Indonesia.
3. Mengembangkan pengelompokan topik untuk membantu menemukan tema ulasan yang berulang.
4. Menyediakan dashboard web untuk menampilkan ringkasan dan visualisasi hasil analisis.
5. Mengintegrasikan aplikasi mobile, dashboard web, backend API, database, dan layanan pemrosesan AI.
6. Mengevaluasi kualitas hasil analisis berdasarkan dataset dan metode yang digunakan.
7. Menerapkan pendekatan Double Diamond dalam proses perancangan produk.
8. Menghasilkan dokumentasi kebutuhan, rancangan sistem, implementasi, pengujian, dan deployment.

## 3. Konsep Solusi

ReviewInsight direncanakan memiliki dua fungsi analitik utama.

### 3.1 Analisis Sentimen

Sistem akan mengklasifikasikan ulasan ke dalam kategori:

- Positif
- Netral
- Negatif

Hasil klasifikasi digunakan untuk menampilkan distribusi sentimen dan membantu pengguna memperoleh gambaran umum mengenai isi kumpulan ulasan.

### 3.2 Pengelompokan Topik

Sistem akan mengelompokkan ulasan berdasarkan kemiripan isi teks. Kelompok tersebut dapat membantu pengguna menemukan tema yang berulang, misalnya masalah login, performa aplikasi, atau fitur tertentu apabila memang ditemukan dalam dataset.

Nama topik perlu ditinjau berdasarkan contoh ulasan yang mendukungnya. Hasil AI tidak dianggap selalu benar dan tetap perlu diperiksa sesuai konteks.

## 4. Platform dan Teknologi

Teknologi yang direncanakan untuk pengembangan ReviewInsight adalah:

| Komponen | Teknologi | Fungsi |
|---|---|---|
| Aplikasi mobile | Flutter dan Dart | Menampilkan hasil analisis melalui perangkat Android |
| Arsitektur mobile | Model-View-Presenter (MVP) | Memisahkan tampilan, data, dan logika presentasi |
| Dashboard web | Laravel Blade | Menampilkan grafik, tabel, filter, dan ringkasan analisis |
| Backend | Laravel dan PHP | Mengelola aplikasi web dan menyediakan REST API |
| Database | MySQL | Menyimpan dataset, ulasan, prediksi, topik, dan riwayat |
| Pemrosesan AI | Python jika diperlukan | Menjalankan model analisis sentimen dan pengelompokan topik |
| Machine learning | scikit-learn dan model bahasa yang sesuai | Mendukung eksperimen klasifikasi dan pengolahan teks |
| Version control | Git dan GitHub | Mengelola kode sumber dan dokumentasi |

Daftar teknologi tersebut merupakan rancangan awal. Pilihan final akan ditetapkan setelah pemeriksaan kebutuhan teknis, dataset, lisensi model, dan hasil eksperimen.

## 5. Metode Perancangan

Pengembangan ReviewInsight direncanakan menggunakan pendekatan Double Diamond yang terdiri dari empat tahap.

### 5.1 Research

Melakukan penelusuran literatur, analisis produk sejenis, pemeriksaan dataset dan lisensi, serta validasi kebutuhan calon pengguna.

### 5.2 Insights

Menyusun temuan Research untuk menentukan masalah utama, kebutuhan pengguna, dan prioritas yang perlu diselesaikan.

### 5.3 Ideation

Mengembangkan alternatif solusi, menentukan fitur prioritas, menyusun alur pengguna, dan merancang antarmuka serta arsitektur sistem.

### 5.4 Prototype

Membuat prototipe antarmuka dan prototipe teknis, kemudian menguji alur penggunaan, integrasi, dan hasil analisis untuk menentukan perbaikan.

## 6. Ruang Lingkup Awal

Fitur yang direncanakan untuk versi awal meliputi:

- Validasi dan pemrosesan dataset ulasan.
- Analisis sentimen.
- Pengelompokan topik.
- Ringkasan distribusi sentimen.
- Daftar dan detail ulasan.
- Penelusuran topik beserta contoh ulasan.
- Dashboard analitik.
- REST API untuk integrasi aplikasi.
- Penyimpanan hasil dan riwayat analisis.
- Pengujian sistem dan evaluasi model.
- Dokumentasi serta deployment untuk demonstrasi.

Pengambilan ulasan secara otomatis dan real-time dari berbagai platform, chatbot serbaguna, prediksi rating masa depan, dan fitur komersial kompleks belum menjadi prioritas pada tahap awal.

## 7. Struktur Repository

```text
project/
├── README.md
└── docs/
    └── README.md
```

Keterangan:

- `README.md`: dokumentasi utama project, berisi gambaran umum, tujuan, konsep solusi, teknologi, metode perancangan, dan ruang lingkup.
- `docs/README.md`: dokumentasi perancangan project, berisi informasi BRD, PRD, tahapan Double Diamond, dan status dokumen.

Struktur ini merupakan struktur dokumentasi awal. Folder aplikasi mobile, backend, dashboard, database, dan pengujian dapat ditambahkan setelah rancangan kebutuhan disetujui.

## 8. Dokumentasi Project

Dokumentasi kebutuhan dan perancangan dikelola pada folder `docs/`.

Dokumen yang direncanakan meliputi:

1. **Business Requirement Document (BRD)** — menjelaskan latar belakang, tujuan, ruang lingkup, stakeholder, kebutuhan fungsional dan nonfungsional, arsitektur tingkat tinggi, risiko, serta kriteria penerimaan.
2. **Product Requirements Document (PRD)** — menjabarkan kebutuhan produk menjadi fitur, user story, product backlog, alur pengguna, spesifikasi fitur, dan kriteria pengujian.
3. **Dokumentasi Double Diamond** — mencatat aktivitas Research, Insights, Ideation, dan Prototype.
4. **Dokumentasi teknis** — menjelaskan arsitektur final, database, API, instalasi, pengujian, dan deployment setelah implementasi dimulai.

Lihat [`docs/README.md`](docs/README.md) untuk informasi lebih lanjut mengenai dokumentasi project.

## 9. Status Pengembangan

**Status saat ini: Perancangan dan penyusunan kebutuhan awal.**

Pekerjaan yang sedang dipersiapkan:

- Penyusunan BRD.
- Penyusunan PRD.
- Penetapan ruang lingkup MVP.
- Penelitian literatur dan produk sejenis.
- Pemeriksaan dataset dan lisensi.
- Penentuan metode AI berdasarkan eksperimen.
- Konsultasi rancangan dengan dosen.

Implementasi akan dilanjutkan setelah arah project, kebutuhan utama, dan kriteria penilaian dikonfirmasi.

## 10. Batasan dan Catatan

ReviewInsight merupakan project akademik yang masih dikembangkan. Manfaat, kualitas model, dan kegunaan sistem belum dianggap terbukti sebelum dilakukan pengujian.

Dataset dan model yang digunakan harus diperiksa lisensinya. Hasil analisis sentimen dan pengelompokan topik merupakan keluaran otomatis yang memiliki keterbatasan sehingga perlu ditafsirkan berdasarkan teks ulasan dan konteksnya.

Ruang lingkup dan teknologi dapat mengalami penyesuaian berdasarkan hasil Research, eksperimen teknis, masukan dosen, dan ketersediaan waktu.

## 11. Pengembang

**Ilham Firmansyah**

Mahasiswa dan pengembang project akhir mata kuliah Pemrograman Mobile.

## 12. Lisensi

Lisensi repository akan ditentukan setelah struktur implementasi dan ketentuan penggunaan dataset serta model yang digunakan diperiksa. Lisensi project tidak secara otomatis menggantikan lisensi pihak ketiga yang digunakan di dalamnya.
