**BAB 8: Prinsip Don't Repeat Yourself (DRY) dalam Aplikasi POS**

**Pengenalan Prinsip Don't Repeat Yourself (DRY)**

Dalam konteks aplikasi POS, Prinsip Don't Repeat Yourself (DRY) menekankan pentingnya menghindari duplikasi kode yang dapat mengakibatkan kesalahan yang sulit ditemukan, serta memastikan bahwa kita menggunakan kode yang ada dengan konsisten.

### Apa Itu Prinsip Don't Repeat Yourself (DRY)?

Prinsip Don't Repeat Yourself (DRY) menyatakan bahwa "setiap potongan informasi dalam aplikasi harus memiliki satu sumber kebenaran, otoritatif, dan terlokalisasi." Dalam kata lain, kita tidak boleh menggandakan atau menduplikasi kode, tetapi sebaliknya, kita harus memiliki satu tempat (sumber) yang menjadi otoritas untuk informasi atau logika tertentu.

### Manfaat dari Prinsip Don't Repeat Yourself (DRY)

- Pengurangan duplikasi kode, yang mengurangi potensi kesalahan.
- Konsistensi dalam penggunaan kode yang ada.
- Memudahkan pemeliharaan karena perubahan hanya perlu dilakukan di satu tempat.

### Contoh Penerapan Prinsip DRY

**Contoh: Kalkulasi Harga dengan Diskon dan Pajak**

Pertimbangkan kasus perhitungan harga produk dengan diskon dan pajak dalam aplikasi POS:

```dart
// Tidak Mengikuti Prinsip DRY
double calculateTotalPrice(double price, double discountPercentage, double taxRate) {
  double discountedPrice = price - (price * discountPercentage / 100);
  double taxAmount = discountedPrice * taxRate / 100;
  double totalPrice = discountedPrice + taxAmount;
  return totalPrice;
}
```

Dalam contoh di atas, kode melakukan perhitungan yang sama untuk diskon dan pajak dalam satu fungsi, yang dapat menghasilkan duplikasi kode jika perlu dilakukan di tempat lain dalam aplikasi.

Solusi yang mengikuti Prinsip DRY:

```dart
// Mengikuti Prinsip DRY
double calculateDiscountedPrice(double price, double discountPercentage) {
  return price - (price * discountPercentage / 100);
}

double calculateTaxAmount(double price, double taxRate) {
  return price * taxRate / 100;
}

double calculateTotalPrice(double price, double discountPercentage, double taxRate) {
  double discountedPrice = calculateDiscountedPrice(price, discountPercentage);
  double taxAmount = calculateTaxAmount(discountedPrice, taxRate);
  double totalPrice = discountedPrice + taxAmount;
  return totalPrice;
}
```

Dalam solusi yang mengikuti Prinsip DRY, perhitungan diskon dan pajak dipisahkan ke dalam fungsi-fungsi yang terpisah, sehingga menghindari duplikasi kode dan memudahkan perubahan jika diperlukan.

### Kesimpulan

Prinsip DRY (Don't Repeat Yourself) mengingatkan kita untuk menghindari duplikasi kode, menggandakan informasi, atau memperkenalkan kompleksitas yang tidak perlu dalam kode kita. Dengan melakukan hal ini, kita dapat menciptakan kode yang lebih efisien, lebih mudah dimengerti, dan lebih mudah untuk dikelola dalam aplikasi POS kita.