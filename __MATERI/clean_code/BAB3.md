**Bab 3: Prinsip Single Responsibility**

**Pengenalan ke Prinsip Single Responsibility**

Dalam bab ini, kita akan menjelajahi Prinsip Single Responsibility (SRP), yang merupakan salah satu pilar penting dari Clean Code. Prinsip ini membantu kita untuk menjaga kode tetap bersih, terstruktur, dan mudah dipahami dengan memastikan bahwa setiap kelas atau modul memiliki satu tanggung jawab utama.

### Apa Itu Prinsip Single Responsibility?

Prinsip Single Responsibility (SRP) menyatakan bahwa sebuah kelas atau modul seharusnya hanya memiliki satu alasan untuk berubah. Dalam konteks ini, "alasan untuk berubah" berarti perubahan dalam kode yang disebabkan oleh perubahan dalam spesifikasi atau tujuan.

Ketika sebuah kelas atau modul memiliki lebih dari satu tanggung jawab, maka jika salah satu tanggung jawab berubah, itu dapat memengaruhi bagian-bagian lain dari kode tersebut. Hal ini dapat mengakibatkan kode yang sulit dipahami, sulit dipelihara, dan rentan terhadap kesalahan.

### Studi Kasus: Implementasi Prinsip SRP

#### Contoh Kelas yang Melanggar Prinsip SRP
```dart
class Customer {
  String name;
  List<Product> products;

  void addProduct(Product product) {
    // Menambahkan produk ke daftar produk pelanggan
  }

  double calculateTotal() {
    // Menghitung total harga produk
  }

  void checkout() {
    // Proses checkout
  }
}
```
Kelas `Customer` di atas melanggar Prinsip SRP karena memiliki tiga tanggung jawab: mengelola daftar produk pelanggan, menghitung total harga produk, dan melakukan proses checkout.

#### Memisahkan Tanggung Jawab
```dart
class Customer {
  String name;
  CartService cart;

  Customer(this.name, this.cart);
}

class CartService {
  List<Product> items;

  void addProduct(Product product) {
    // Menambahkan produk ke keranjang (cart)
  }

  double calculateTotal() {
    // Menghitung total harga produk di keranjang
  }
}

class OrderService {
  void checkout(CartService cart) {
    // Proses checkout
  }
}
```
Dalam contoh yang diperbaiki, kita memisahkan tanggung jawab menjadi tiga kelas yang berbeda: `Customer` untuk mengelola daftar produk pelanggan, `CartService` untuk menghitung total harga produk di keranjang, dan `OrderService` untuk melakukan proses checkout. Ini mengikuti Prinsip SRP dengan lebih baik karena setiap kelas hanya memiliki satu tanggung jawab.

### Manfaat dari Prinsip SRP

- Kode yang lebih mudah dimengerti karena setiap kelas atau modul memiliki fokus yang jelas.
- Pemeliharaan kode yang lebih mudah karena perubahan pada satu tanggung jawab tidak memengaruhi yang lain.
- Kemungkinan kesalahan yang lebih rendah karena tanggung jawab yang terpisah mengurangi kompleksitas.

Dengan menerapkan Prinsip SRP, kita dapat menghasilkan kode Dart yang lebih bersih, terstruktur, dan mudah dikembangkan, serta menghindari adanya kelas atau modul yang memiliki terlalu banyak tanggung jawab yang berbeda.