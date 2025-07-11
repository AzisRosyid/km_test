# **Proyek Ujian Suitmedia - Aplikasi Palindrome & Pengguna**

Ini adalah proyek aplikasi mobile yang dibangun menggunakan Flutter sebagai bagian dari proses seleksi di Suitmedia. Aplikasi ini memiliki tiga layar utama dengan fungsionalitas untuk memeriksa kalimat palindrom dan menampilkan daftar pengguna dari API publik.


## **Tampilan Aplikasi**

Berikut adalah tampilan dari setiap layar aplikasi:
***![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeY67hTdEfztr56a3YKB16vKdvVtMIEn45OBO0-PU1KdAl1xmE4brn-Oog1794cunXS-eMDHFDu2GhPrXrFYa8S48FAu4_7wbsXV6z1UeTNw7FWSpTsLjqNQqGogaY-_C5r1CXk?key=Mt-YkpOiPPl7EXs217mn6g)**
***![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeTKySMOdEg45Uf-9lpcHGrxQWVWOXRYRKhiYPZtxDbTP6-F0CEJyiXPTEs5Htgwg7Fb3hTTHKFjkVxeG7fY6YrCMfPjFg-zWpzIP8QjtAq-KAoAorQcItUDOEu4N2pe-DFWUfBPg?key=Mt-YkpOiPPl7EXs217mn6g)**
***![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdsB4o_RLfDY2IY3yrjQUeOpLNJBQAn4hsxs_oAoHaRQYPxYs-OIxlT8OLs8cdHQDQdbQncN3CDk3TI2QCy6DoPWleZBRf_vEiX3J35wprz-QIptIOTiG-rX8ll8gmJiFunLpJ8Ag?key=Mt-YkpOiPPl7EXs217mn6g)**



## **Fitur Utama**

**Layar 1: Palindrome & Navigasi**

* Input untuk nama pengguna.

* Input untuk kalimat yang akan diperiksa.

* Fungsi untuk memeriksa apakah sebuah kalimat merupakan **palindrom**.

* Hasil pengecekan ditampilkan dalam sebuah dialog.

* Navigasi ke layar kedua dengan membawa data nama pengguna.

**Layar 2: Halaman Sambutan**

* Menampilkan pesan selamat datang.

* Menampilkan nama pengguna yang diinput dari layar pertama.

* Menampilkan nama pengguna yang dipilih dari layar ketiga (awalnya kosong).

**Layar 3: Daftar Pengguna**

* Menampilkan daftar pengguna yang diambil dari API publik https\://reqres.in/.

* Implementasi **Infinite Scrolling / Pagination** untuk memuat lebih banyak data saat pengguna menggulir ke bawah.

* Implementasi **Pull-to-Refresh** untuk memuat ulang data dari awal.

* Saat seorang pengguna dipilih, aplikasi akan kembali ke layar kedua dan menampilkan nama lengkap pengguna tersebut.

* Penanganan _error_ jika gambar avatar gagal dimuat, dengan menampilkan ikon _placeholder_.


## **Teknologi yang Digunakan**

- **Framework**: Flutter 3.3.2+

- **Bahasa**: Dart

- **State Management**: [Provider](https://pub.dev/packages/provider)

- **Networking**: [HTTP](https://pub.dev/packages/http)

- **Arsitektur**: Struktur folder yang bersih dan mudah dikelola (dipisahkan berdasarkan fitur: screens, providers, models).


## **Cara Menjalankan Proyek**

Untuk menjalankan proyek ini di lingkungan lokal Anda, ikuti langkah-langkah berikut:

1. **Prasyarat**

    - Pastikan Anda telah menginstal [Flutter SDK](https://flutter.dev/docs/get-started/install).

    - Sebuah IDE seperti VS Code atau Android Studio.

2. **Clone Repositori**\
   git clone \[URL\_REPOSITORI\_ANDA]\
   cd \[NAMA\_FOLDER\_PROYEK]

3. Instal Dependensi\
   Jalankan perintah berikut untuk mengunduh semua package yang dibutuhkan.\
   flutter pub get

4. **Siapkan Aset**

    - Buat folder assets/images/ di direktori utama proyek.

    - Tempatkan file background.png dan ic\_photo.png di dalamnya.

    - Pastikan pubspec.yaml sudah mendaftarkan folder aset:\
  flutter:\
    assets:\
      - assets/images/

5. Jalankan Aplikasi\
   Hubungkan perangkat atau jalankan emulator, lalu jalankan perintah berikut:\
   flutter run


## **Struktur Proyek**

Proyek ini disusun dengan struktur folder yang rapi untuk memudahkan pemeliharaan:

lib/\
├── main.dart             # Titik masuk utama & inisialisasi Provider\
|\
├── models/\
│   └── user.dart         # Model data untuk User\
|\
├── providers/\
│   └── user\_provider.dart  # State management untuk data pengguna\
|\
└── screens/\
    ├── first\_screen.dart   # UI & logika untuk Layar Pertama\
    ├── second\_screen.dart  # UI & logika untuk Layar Kedua\
    └── third\_screen.dart   # UI & logika untuk Layar Ketiga

_Proyek ini dibuat untuk memenuhi persyaratan tes teknis di Suitmedia._
