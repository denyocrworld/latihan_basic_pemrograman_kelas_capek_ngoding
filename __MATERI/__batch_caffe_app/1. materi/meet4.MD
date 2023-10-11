## 3 Alasan Mengapa kita harus membuat Function

1. **Modularitas**:
- **Penjelasan**: Fungsi memungkinkan kode program dibagi menjadi bagian yang lebih kecil dan terorganisir, yang disebut dengan modul. Ini mempermudah pemeliharaan dan pemahaman kode, serta memungkinkan pengembang untuk fokus pada satu bagian tugas pada satu waktu.
- **Contoh**: Dalam aplikasi, Anda dapat memiliki fungsi terpisah untuk menangani registrasi pengguna, otentikasi, dan pembayaran. Ini memisahkan logika bisnis yang berbeda dan membuat kode lebih mudah dikelola.

2. **Reuseabilitas**:
- **Penjelasan**: Fungsi memungkinkan kode yang telah ditulis untuk digunakan kembali tanpa perlu menulis ulang kode yang sama. Hal ini menghemat waktu, mengurangi peluang terjadi kesalahan, dan meningkatkan efisiensi dalam pengembangan perangkat lunak.
- **Contoh**: Anda dapat membuat fungsi untuk menghitung rata-rata dari daftar angka. Kemudian, Anda dapat menggunakan fungsi ini di berbagai bagian program Anda tanpa harus menulis ulang kode perhitungan rata-rata.

3. **Abstraksi**:
- **Penjelasan**: Fungsi memungkinkan kita untuk menyembunyikan detail implementasi dan memberikan nama yang bermakna pada tindakan atau prosedur tertentu. Hal ini mempermudah pemahaman kode secara keseluruhan tanpa perlu memahami detail-detail internalnya.
- **Contoh**: Saat mengirim email melalui API, Anda dapat memiliki fungsi `kirimEmail` yang menerima alamat email, subjek, dan isi pesan. Pengguna kode tersebut hanya perlu tahu bagaimana menggunakan fungsi ini tanpa perlu memahami bagaimana email dikirim secara teknis.

### Mudahnya, buatlah function ketika kamu ingin:
- Menyederhanakan kode yang terlalu panjang
- Menyederhanakan kode yang rumit


### Cara Membuat Function
```dart
return_value_type function_name(argument/parameter) {
    return return_value;
}

//Contoh:
double getTotal(double qty, double price) {
    return qty * price;
}
```

### Tugas Mentor
- Berikan contoh kode untuk menyederhanakan fungsi print di Dart yang memungkinkan warna di console-nya merah, hijau dan kuning. Buatlah method printRed, printGreen dan printYellow.

```dart
void printRed(String text) {
  print('\x1B[31m$text\x1B[0m'); // Warna merah
}

void printGreen(String text) {
  print('\x1B[32m$text\x1B[0m'); // Warna hijau
}

void printYellow(String text) {
  print('\x1B[33m$text\x1B[0m'); // Warna kuning
}
```

- Berikan contoh kode untuk menghitung gaji bersih karyawan. Dimana untuk dalam menghitung gaji, ada ketentuan berikut:
```dart
gajiKotor = (gajiKotor - tax_10%) - asuransi_5%
```

### Argument di Dart

1. **Positional Arguments (Argumen Berdasarkan Urutan)**:
   - Ini adalah jenis argumen yang diberikan kepada fungsi berdasarkan urutan parameter dalam definisi fungsi.
   - Argumen ini harus disusun dalam urutan yang sesuai dengan parameter fungsi.

   Contoh:
   ```dart
   void tambah(int a, int b) {
     print(a + b);
   }

   void main() {
     tambah(5, 3); // 8
   }
   ```

2. **Named Arguments (Argumen Berdasarkan Nama)**:
   - Dalam jenis ini, Anda dapat menyebutkan nama parameter saat memanggil fungsi, sehingga urutan tidak penting.
   - Ini sangat berguna untuk fungsi dengan banyak parameter opsional.

   Contoh:
   ```dart
    void printUserDetail({
        required String nama,
        required int umur,
    }) {
        print('Nama: $nama, Umur: $umur');
    }

    void main() {
        printUserDetail(nama: 'Alice', umur: 30); // Nama: Alice, Umur: 30
    }

   ```

3. **Default Values (Nilai Default)**:
   - Anda dapat memberikan nilai default untuk parameter fungsi. Jika argumen tidak diberikan, nilai default akan digunakan.

   Contoh:
   ```dart
   void printUserDetail({String nama = 'Belum Ditentukan', int umur = 0}) {
     print('Nama: $nama, Umur: $umur');
   }

   void main() {
     printUserDetail(); // Nama: Belum Ditentukan, Umur: 0
   }
   ```

4. **Required Arguments (Argumen Wajib)**:
   - Dengan menggunakan tanda `required`, Anda dapat menandai parameter yang harus diisi saat memanggil fungsi.

   Contoh:
   ```dart
   void printUserDetail({required String nama, required int umur}) {
     print('Nama: $nama, Umur: $umur');
   }

   void main() {
     printUserDetail(nama: 'Bob', umur: 25); // Nama: Bob, Umur: 25
   }
   ```

5. **List and Map Arguments (Argumen Berupa List dan Map)**:
   - Anda juga dapat mengirimkan argumen berupa List atau Map sebagai parameter.

   Contoh:
   ```dart
   void cetakList(List<int> angka) {
     angka.forEach((item) => print(item));
   }

   void main() {
     cetakList([1, 2, 3, 4, 5]);
   }
   ```

   ```dart
   void cetakMap(Map<String, int> data) {
     data.forEach((key, value) => print('$key: $value'));
   }

   void main() {
     cetakMap({'Alice': 30, 'Bob': 25, 'Charlie': 35});
   }
   ```


### Jenis2 Function di Dart

1. **Fungsi Biasa (Function)**:
   Fungsi adalah blok kode yang dapat dipanggil dan digunakan untuk melakukan tugas tertentu.

   Contoh:
   ```dart
   int tambah(int a, int b) {
     return a + b;
   }

   void main() {
     int hasil = tambah(5, 3);
     print('Hasil penambahan: $hasil');
   }
   ```

2. **Fungsi Tanpa Nilai Kembali (Void Function)**:
   Fungsi yang tidak mengembalikan nilai.

   Contoh:
   ```dart
   void sapa() {
     print('Halo, selamat pagi!');
   }

   void main() {
     sapa();
   }
   ```

3. **Fungsi Anonim (Anonymous Function / Lambda Function)**:
   Fungsi yang tidak memiliki nama dan biasanya digunakan dalam ekspresi seperti dalam fungsi `.forEach()` atau `.map()`.

   Contoh:
   ```dart
   void main() {
     var list = [1, 2, 3, 4, 5];
     list.forEach((item) {
       print(item);
     });
   }
   ```

4. **Fungsi Generik (Generic Function)**:
   Fungsi yang dapat bekerja dengan berbagai jenis data tanpa harus mengganti kode.

   Contoh:
   ```dart
   T pilihItem<T>(List<T> list, int indeks) {
     return list[indeks];
   }

   void main() {
     var daftarNama = ['Alice', 'Bob', 'Charlie'];
     var nama = pilihItem(daftarNama, 1);
     print('Nama yang dipilih: $nama');
   }
   ```

5. **Fungsi Rekursif (Recursive Function)**:
   Fungsi yang memanggil dirinya sendiri.

   Contoh:
   ```dart
   int faktorial(int n) {
     if (n <= 1) {
       return 1;
     } else {
       return n * faktorial(n - 1);
     }
   }

   void main() {
     var hasil = faktorial(5);
     print('Hasil faktorial: $hasil');
   }
   ```

6. **Fungsi Getter dan Setter**:
   Fungsi khusus yang digunakan untuk mengakses dan mengubah nilai variabel objek.

   Contoh:
   ```dart
   class Kotak {
     int _panjang = 0;

     int get panjang => _panjang;

     set panjang(int nilai) {
       if (nilai > 0) {
         _panjang = nilai;
       }
     }
   }

   void main() {
     var kotak = Kotak();
     kotak.panjang = 5;
     print('Panjang kotak: ${kotak.panjang}');
   }
   ```