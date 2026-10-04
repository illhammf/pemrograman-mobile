# Bagian B — Menyiapkan Paket HTTP

## Tujuan

Menyiapkan aplikasi Flutter agar dapat melakukan komunikasi HTTP dengan REST API.

## 1. Memasang Package HTTP

Jalankan perintah berikut dari folder project:

```bash
flutter pub add http
```

Setelah package ditambahkan, jalankan:

```bash
flutter pub get
```

Package `http` akan digunakan pada bagian berikutnya untuk mengirim HTTP GET request.

---

## 2. Permission Internet Android

Untuk memastikan aplikasi Android dapat mengakses internet, tambahkan permission berikut pada:

```text
android/app/src/main/AndroidManifest.xml
```

Permission:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

Letakkan permission tersebut tepat di atas tag:

```xml
<application>
```

---

## 3. Hasil

Setelah langkah ini:

- Package `http` sudah tersedia pada project.
- Project siap digunakan untuk melakukan HTTP request.
- Permission internet sudah disiapkan pada Android.

---

## 4. Checkpoint

- [ ] Package `http` berhasil ditambahkan.
- [ ] `flutter pub get` berhasil.
- [ ] Permission Internet Android sudah ditambahkan.