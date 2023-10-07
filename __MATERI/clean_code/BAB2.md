**Bab 2: Penamaan Variabel, Fungsi, dan Kelas**

**Menggunakan Nama yang Bermakna**

Dalam bab ini, kita akan menjelajahi pentingnya memberikan nama yang bermakna untuk variabel, fungsi, dan kelas dalam kode Dart. Nama-nama yang bermakna adalah salah satu aspek kunci dari Clean Code.

### Studi Kasus: Menamai Variabel

#### Contoh Buruk: Variabel dengan Nama yang Tidak Bermakna
```dart
var x = 5;
```
Variabel di atas menggunakan nama `x` yang tidak memberikan petunjuk tentang apa yang diwakilinya. Ini adalah contoh buruk karena sulit untuk memahami tujuan variabel ini.

#### Contoh Baik: Variabel dengan Nama yang Bermakna
```dart
var userAge = 30;
```
Variabel di atas menggunakan nama `userAge`, yang dengan jelas mengindikasikan bahwa variabel tersebut berisi usia pengguna. Ini adalah contoh baik karena nama variabel tersebut menjelaskan konteksnya.

### Studi Kasus: Menamai Fungsi

#### Contoh Buruk: Fungsi dengan Nama yang Tidak Bermakna
```dart
double calculate() {
  // ...
}
```
Fungsi di atas memiliki nama `calculate`, yang tidak menjelaskan apa yang sebenarnya dihitung oleh fungsi tersebut. Ini adalah contoh buruk karena sulit untuk memahami tindakan yang dilakukan oleh fungsi ini.

#### Contoh Baik: Fungsi dengan Nama yang Bermakna
```dart
double calculateArea(double length, double width) {
  // ...
}
```
Fungsi di atas memiliki nama `calculateArea`, yang dengan jelas mengindikasikan bahwa fungsi tersebut digunakan untuk menghitung luas berdasarkan panjang dan lebar yang diberikan. Ini adalah contoh baik karena nama fungsi tersebut menjelaskan tindakan yang dilakukan.

### Studi Kasus: Menamai Kelas

#### Contoh Buruk: Penamaan Kelas yang Buruk
```dart
class XYZ {
  // ...
}
```
Kelas di atas memiliki nama `XYZ`, yang tidak memberikan petunjuk apa pun tentang tujuan atau fungsinya. Ini adalah contoh penamaan kelas yang buruk karena tidak bermakna.

#### Contoh Baik: Penamaan Kelas yang Bermakna
```dart
class Customer {
  // ...
}
```
Kelas di atas memiliki nama `Customer`, yang sesuai dengan konsep atau objek yang diwakilinya. Ini adalah contoh baik karena nama kelas ini bermakna.

### Konsistensi dalam Penamaan

Penting untuk menjaga konsistensi dalam penamaan. Dalam kode Anda, pastikan untuk menggunakan konvensi penamaan yang sama untuk memudahkan pemahaman dan konsistensi keseluruhan kode Dart Anda. Dengan memberikan nama yang bermakna, kode Anda akan menjadi lebih eksplisit dalam tujuannya, meningkatkan kualitas keseluruhan dari kode Dart Anda.