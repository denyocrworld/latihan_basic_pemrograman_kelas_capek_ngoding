**Bab 4: Prinsip Open/Closed (OCP) dalam Aplikasi POS**

**Pengenalan Prinsip Open/Closed (OCP)**

Dalam kasus aplikasi Point of Sale (POS), Prinsip Open/Closed (OCP) sangat penting. OCP mengatakan bahwa kode kita harus terbuka untuk perluasan (kita dapat menambahkan fitur baru dengan mudah) tetapi tertutup untuk modifikasi (kita tidak perlu mengubah kode yang sudah ada).

### Kasus POS: Pengelolaan Metode Pembayaran

Mari kita asumsikan kita memiliki aplikasi POS sederhana yang dapat menerima beberapa metode pembayaran seperti tunai, kartu kredit, dan e-wallet. Sebagai awal, kita bisa memiliki tiga kelas:

```dart
class PaymentManager {
  void processCashPayment(double amount) {
    // Proses pembayaran tunai
  }

  void processCreditCardPayment(double amount) {
    // Proses pembayaran kartu kredit
  }

  void processEWalletPayment(double amount) {
    // Proses pembayaran e-wallet
  }
}
```

Namun, dengan pendekatan ini, ketika kita ingin menambahkan metode pembayaran baru seperti cek atau transfer bank, kita harus mengubah kode dalam `PaymentManager`, yang melanggar Prinsip OCP.

### Menggunakan Prinsip OCP

Mari kita terapkan Prinsip OCP dengan membuat antarmuka `PaymentMethod` dan kelas-kelas yang mengimplementasinya:

```dart
abstract class PaymentMethod {
  void processPayment(double amount);
}

class CashPayment implements PaymentMethod {
  @override
  void processPayment(double amount) {
    // Proses pembayaran tunai
  }
}

class CreditCardPayment implements PaymentMethod {
  @override
  void processPayment(double amount) {
    // Proses pembayaran kartu kredit
  }
}

class EWalletPayment implements PaymentMethod {
  @override
  void processPayment(double amount) {
    // Proses pembayaran e-wallet
  }
}
```

Dengan menggunakan Prinsip OCP, kita sekarang memiliki hierarki `PaymentMethod` yang dapat dengan mudah diperluas dengan menambahkan kelas-kelas baru untuk metode pembayaran tambahan. Tidak perlu mengubah kode dalam `PaymentManager`.

```dart
class CheckPayment implements PaymentMethod {
  @override
  void processPayment(double amount) {
    // Proses pembayaran dengan cek
  }
}

class BankTransferPayment implements PaymentMethod {
  @override
  void processPayment(double amount) {
    // Proses pembayaran dengan transfer bank
  }
}
```

Ketika kita ingin menambahkan metode pembayaran baru seperti cek atau transfer bank, kita cukup membuat kelas baru yang mengimplementasikan `PaymentMethod` tanpa harus menyentuh kode yang sudah ada dalam `PaymentManager`.

### Manfaat dari Prinsip OCP dalam Aplikasi POS

- Kemampuan menambahkan metode pembayaran baru tanpa mengubah kode yang sudah ada.
- Kode yang lebih terstruktur dan mudah dikelola karena setiap metode pembayaran memiliki kelasnya sendiri.
- Pengurangan risiko bug akibat perubahan pada metode pembayaran yang sudah ada.

Dengan menerapkan Prinsip OCP, kita dapat merancang aplikasi POS yang lebih fleksibel dan mudah diperluas seiring pertumbuhan dan perkembangan bisnis.