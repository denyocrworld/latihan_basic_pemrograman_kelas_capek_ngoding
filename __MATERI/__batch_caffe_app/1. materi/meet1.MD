# Tutorial Bahasa Pemrograman Dart

## Daftar Isi
1. [Variable](#variable)
2. [Convert Variable](#convert-variable)
3. [Tipe Data Khusus](#tipe-data-khusus)
4. [Operator Aritmatika](#operator-aritmatika)
5. [IF Statement](#if-statement)
6. [List dan Map](#list-dan-map)
7. [Null Safety](#null-safety)

---

## Variable
**Analogi:** Panci, Gelas, Mangkok, Piring, Rak Buku, Toples

**Hal penting di variable:**
1. **Deklarasi**: Variabel digunakan untuk menyimpan data. Anda harus mendeklarasikan tipe data variabel sebelum menggunakannya.
2. **Mengambil nilai variable**: Variabel dapat digunakan untuk menyimpan data, dan Anda dapat mengakses data tersebut dengan menggunakan nama variabel.
3. **Mengubah nilai variable**: Nilai dalam variabel bisa diubah selama program berjalan.
4. **Mengkonversi nilai variable**: Kadang-kadang Anda perlu mengkonversi data dari satu tipe ke tipe lain.

```dart
void main() {
  // Deklarasi variabel untuk informasi produk
  String productName = 'Tas Ransel';
  double productPrice = 100.50; //$100.50
  int productStock = 50;
  bool productAvailable = true;

  // Deklarasi variabel untuk informasi pengguna
  String userName = 'John Doe';
  int userAge = 30;
  String userEmail = 'john.doe@example.com';
  bool isPremiumMember = true;

  // Menampilkan informasi produk
  print('===== Informasi Produk =====');
  print('Nama Produk: $productName');
  print('Harga Produk: Rp $productPrice');
  print('Stok Tersedia: $productStock');
  print('Tersedia: ${productAvailable ? 'Ya' : 'Tidak'}');
  print('');

  // Menampilkan informasi pengguna
  print('===== Informasi Pengguna =====');
  print('Nama Pengguna: $userName');
  print('Usia: $userAge tahun');
  print('Email: $userEmail');
  print('Premium Member: ${isPremiumMember ? 'Ya' : 'Tidak'}');
  print('');
}
```

---

## Convert Variable
**Tugas Mentor:**
1. Jelaskan kenapa variabel itu perlu di convert.
2. Contoh konversi data dari String ke int dan sebaliknya.
3. Jelaskan tentang metode `.tryParse()` untuk konversi yang lebih aman.
4. Berikan contoh error ketika mengkonversi variabel, tanyakan pada student penyebab errornya, lalu jelaskan.

```dart
void main() {
  // Contoh konversi dari String ke int (Mengambil jumlah barang dari input pengguna)
  String userInputQuantity = "5";
  int quantity = int.parse(userInputQuantity);
  print("Jumlah Barang (int): $quantity");

  // Contoh konversi dari int ke String (Menampilkan jumlah barang dalam nota)
  int receiptQuantity = 10;
  String strReceiptQuantity = receiptQuantity.toString();
  print("Jumlah Barang dalam Nota (String): $strReceiptQuantity");
}
```

---

## Tipe Data Khusus
Jika ingin menyimpan data tanggal, Anda bisa menggunakan tipe data DateTime.

**Tugas Mentor:**
1. Jelaskan tentang property year, month, today di tipe data DateTime.
2. Jelaskan tentang cara mengkonversi DateTime menjadi format yang berbeda menggunakan paket intl.
3. Jelaskan operator !(not) pada variabel boolean.

```dart
import 'package:intl/intl.dart';

void main() {
  // Contoh penggunaan tipe data DateTime
  DateTime today = DateTime.now();
  print("Hari ini: $today");

  // Mendapatkan komponen-komponen dari tipe data DateTime
  int year = today.year;
  int month = today.month;
  int day = today.day;
  print("Tahun: $year, Bulan: $month, Hari: $day");

  // Contoh penggunaan tipe data bool
  bool isRaining = true;
  bool isSunny = false;
  print("Apakah sedang hujan? $isRaining");
  print("Apakah sedang cerah? $isSunny");
}
```

---

## Operator Aritmatika
**Tugas Mentor:**
1. Jelaskan tentang operator +, -, *, /, %.
2. Jelaskan tentang operator ++ dan --.
3. Jelaskan tentang operator +=, -=, *=, /=.

```dart
void main() {
  int a = 10;
  int b = 5;

  print("a + b = ${a + b}");  // 15
  print("a - b = ${a - b}");  // 5
  print("a * b = ${a * b}");  // 50
  print("a / b = ${a / b}");  // 2.0
  print("a % b = ${a % b}");  // 0

  a++;
  print("a setelah increment: $a");  // 11

  b--;
  print("b setelah decrement: $b");  // 4

  a += 5;
  print("a setelah ditambah 5: $a");  // 16

  b -= 2;
  print("b setelah dikurangi 2: $b");  // 2
}
```

---

## IF Statement

**Analogi:**
Bayangkan Anda berada di sebuah taman bermain yang memiliki beberapa wahana. Ada wahana yang hanya boleh dimainkan oleh anak-anak dengan tinggi di bawah 150 cm, ada juga wahana yang hanya boleh dimainkan oleh orang dewasa dengan tinggi di atas 150 cm dan usia di atas 18 tahun. Anda harus memenuhi kriteria tertentu untuk bisa masuk ke setiap wahana. Dalam hal ini, kriteria tinggi dan usia adalah kondisi, dan keputusan apakah Anda boleh masuk ke wahana tersebut adalah hasil dari evaluasi kondisi tersebut.

**Tugas Mentor:**
1. Jelaskan tentang IF Statement dan bagaimana cara kerjanya.
2. Jelaskan tentang bagaimana menulis kondisi dalam IF Statement.
3. Jelaskan tentang ELSE, ELSE IF, serta penggunaan operator `&&` (dan) dan `||` (atau).

```dart
void main() {
  int age = 20;
  double height = 160.5;

  // Contoh sederhana IF Statement
  if (age >= 17) {
    print("Anda boleh menonton film dewasa.");
  }

  // Contoh dengan ELSE
  if (age >= 20) {
    print("Anda sudah dewasa.");
  } else {
    print("Anda masih remaja.");
  }

  // Contoh dengan ELSE IF
  if (age >= 50) {
    print("Anda termasuk kategori lansia.");
  } else if (age >= 30) {
    print("Anda termasuk kategori dewasa.");
  } else if (age >= 18) {
    print("Anda termasuk kategori pemuda.");
  } else {
    print("Anda masih anak-anak.");
  }

  // Contoh dengan operator && (dan)
  if (height > 150 && age > 18) {
    print("Anda boleh masuk ke wahana untuk orang dewasa.");
  }

  // Contoh dengan operator || (atau)
  if (age < 12 || height < 150) {
    print("Anda boleh masuk ke wahana untuk anak-anak.");
  }
}
```

## List dan Map

**Analogi:**
- **List**: Bayangkan sebuah rak buku. Setiap buku memiliki posisi tertentu di rak tersebut. Jika Anda ingin mengetahui buku apa yang berada di posisi ke-3, Anda bisa langsung melihatnya. Ini mirip dengan bagaimana kita mengakses elemen dalam list menggunakan indeks.
  
- **Map**: Bayangkan sebuah kamus. Di dalam kamus, Anda mencari definisi dari sebuah kata kunci. Kata kunci ini unik dan mengarahkan Anda ke definisi atau informasi tertentu. Dalam pemrograman, kata kunci ini disebut "key" dan informasi atau definisi yang terkait dengan key tersebut disebut "value".

**Tugas Mentor:**
1. Jelaskan tentang list dan map.
2. Jelaskan tentang cara mengakses elemen dalam list dan map.
3. Jelaskan tentang cara menambahkan elemen ke dalam list dan map.

```dart
void main() {
  // Contoh penggunaan list
  List<String> fruits = ["apple", "banana", "cherry"];
  print(fruits[0]);  // apple
  fruits.add("orange");
  print(fruits);  // [apple, banana, cherry, orange]

  // Contoh penggunaan map
  Map<String, int> fruitPrices = {
    "apple": 10000,
    "banana": 5000,
    "cherry": 15000
  };
  print(fruitPrices["apple"]);  // 10000
  fruitPrices["orange"] = 12000;
  print(fruitPrices);  // {apple: 10000, banana: 5000, cherry: 15000, orange: 12000}
}
```

## Null Safety
**Tugas Mentor:**
1. Jelaskan tentang null safety di Dart.
2. Jelaskan tentang operator ?., ??, ??=.

```dart
void main() {
  String? nullableString;
  String nonNullableString = nullableString ?? "Default Value";
  print(nonNullableString);  // Default Value

  nullableString = "Hello, Dart!";
  String anotherString = nullableString!;
  print(anotherString);  // Hello, Dart!

  nullableString?.toUpperCase();
  print(nullableString);  // HELLO, DART!
}
``` 