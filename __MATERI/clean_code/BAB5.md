**Bab 5: Prinsip Liskov Substitution (LSP) dalam Aplikasi POS**

**Pengenalan Prinsip Liskov Substitution (LSP)**

Dalam konteks aplikasi POS, kita sering menghadapi situasi di mana kita memiliki berbagai jenis produk yang dapat dijual, seperti barang fisik, layanan, atau voucher diskon. Prinsip Liskov Substitution (LSP) memastikan bahwa setiap jenis produk yang kita buat sebagai turunan dari kelas produk dasar (base class) dapat digunakan secara konsisten dalam aplikasi POS kita.

### Apa Itu Prinsip Liskov Substitution (LSP)?

Prinsip Liskov Substitution (LSP) menyatakan bahwa objek dari kelas turunan (subclass) harus dapat digunakan sebagai pengganti objek kelas dasar (base class) tanpa mengubah koreksi atau kebenaran program. Dalam kata lain, kelas turunan harus mematuhi semua kontrak dan perilaku yang didefinisikan oleh kelas dasar.

### Studi Kasus: Produk dalam Aplikasi POS

Mari kita lihat bagaimana Prinsip LSP diterapkan pada berbagai jenis produk dalam aplikasi POS. Kita memiliki kelas dasar `Product`:

```dart
class Product {
  String name;
  double price;

  Product(this.name, this.price);

  double calculateDiscount(double discountPercentage) {
    return price * (discountPercentage / 100);
  }
}
```

Dan kita memiliki beberapa jenis produk seperti `PhysicalProduct` (barang fisik) dan `ServiceProduct` (layanan):

```dart
class PhysicalProduct extends Product {
  double weight;

  PhysicalProduct(String name, double price, this.weight) : super(name, price);
}

class ServiceProduct extends Product {
  String serviceType;

  ServiceProduct(String name, double price, this.serviceType) : super(name, price);
}
```

Kelas `PhysicalProduct` dan `ServiceProduct` adalah turunan dari kelas `Product`. Prinsip LSP memastikan bahwa kita dapat menggunakan objek `PhysicalProduct` atau `ServiceProduct` dengan cara yang sama seperti `Product` tanpa mempengaruhi koreksi aplikasi POS kita:

```dart
void processProductSale(Product product) {
  // Proses penjualan produk, termasuk perhitungan harga dan diskon
}
```

Kode di atas dapat menerima objek `Product`, `PhysicalProduct`, atau `ServiceProduct`, dan tetap berfungsi dengan benar, sesuai dengan Prinsip LSP.

### Manfaat dari Prinsip Liskov Substitution (LSP)

- Fleksibilitas dalam menggunakan objek turunan.
- Menghindari perubahan yang merusak fungsionalitas yang sudah ada.
- Kemudahan dalam menambahkan jenis produk baru di masa depan.

Dengan menerapkan Prinsip LSP dalam aplikasi POS, kita dapat menghasilkan kode yang lebih terstruktur, mudah diperluas, dan menghindari potensi bug akibat perubahan yang tidak sesuai.