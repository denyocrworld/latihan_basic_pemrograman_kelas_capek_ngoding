## 10 Analogi Async Function dalam kehidupan sehari-hari.

### 1. **Mengunduh Musik**:

   - Async: Ketika Anda mengunduh musik dari internet, Anda menekan tombol unduh dan melanjutkan aktivitas lain, seperti membaca buku atau menonton TV, sambil menunggu unduhan selesai.
   - Sync: Dalam mode sinkron, Anda harus menunggu di layar unduhan hingga lagu-lagu diunduh satu per satu.

### 2. **Pemesanan Makanan di Drive-Thru**:

   - Async: Saat Anda memesan makanan di drive-thru, Anda memberikan pesanan melalui speaker dan kemudian bisa melanjutkan perjalanan Anda sambil menunggu makanan selesai diproses di belakang.
   - Sync: Dalam mode sinkron, Anda harus menunggu di jalur drive-thru sampai pesanan selesai.

### 3. **Mengisi Bahan Bakar di Pompa Bensin**:

   - Async: Ketika Anda mengisi bahan bakar, Anda bisa mulai pengisian, lalu pergi membayar dan melakukan tugas lain sambil menunggu tangki penuh.
   - Sync: Dalam mode sinkron, Anda harus menunggu di depan pompa sampai pengisian selesai.

### 4. **Paket Pengiriman**:

   - Async: Ketika Anda memesan barang online, kurir mengambil paket dan mengirimkannya ke alamat Anda, sementara Anda bisa melakukan aktivitas lain.
   - Sync: Dalam mode sinkron, Anda harus menunggu di depan pintu rumah Anda untuk menerima paket.

### 5. **Pengiriman Pesan WhatsApp**:

   - Async: Mengirim pesan WhatsApp adalah seperti mengirim pesan dan kemudian melanjutkan kegiatan lain tanpa harus menunggu pesan dikirim.
   - Sync: Mengirim pesan WhatsApp adalah seperti mengirim pesan dan harus menunggu sampai pesan itu benar-benar terkirim sebelum Anda bisa melakukan hal lain.

### 6. **Mengunduh Aplikasi di Ponsel**:

   - Async: Ketika Anda mengunduh aplikasi di ponsel, Anda bisa menekan tombol unduh dan terus menggunakan ponsel Anda untuk tugas lain sambil menunggu aplikasi diunduh.
   - Sync: Dalam mode sinkron, Anda harus menunggu di layar unduhan hingga aplikasi selesai diunduh.

### 7. **Pemesanan Tiket Online**:

   - Async: Setelah memesan tiket online, Anda menerima konfirmasi melalui email atau pesan teks, dan Anda bisa melanjutkan aktivitas lain.
   - Sync: Anda harus menunggu di depan layar komputer sampai konfirmasi muncul.

### 8. **Pembayaran Kartu Kredit Online**:

   - Async: Saat Anda membayar tagihan kartu kredit secara online, Anda mengirim pembayaran dan bisa melanjutkan kegiatan lain sambil menunggu konfirmasi pembayaran.
   - Sync: Dalam mode sinkron, Anda harus menunggu di situs web pembayaran sampai konfirmasi muncul.

### 9. **Pengisian Formulir di Kantor Pos**:

   - Async: Ketika Anda mengisi formulir di kantor pos, Anda bisa menyerahkan formulir tersebut dan kemudian pergi, menyelesaikan tugas-tugas lain sambil menunggu proses pengolahan formulir.
   - Sync: Dalam mode sinkron, Anda harus menunggu di sana sampai formulir diproses.

### 10. **Menyimpan File di Komputer**:

   - Async: Saat Anda menyimpan file besar di komputer, Anda menekan tombol simpan dan bisa melanjutkan pekerjaan lain sambil menunggu file selesai disimpan.
   - Sync: Dalam mode sinkron, Anda harus menunggu sampai proses penyimpanan selesai sebelum bisa melanjutkan pekerjaan.

Dalam analogi-analogi ini, async function memungkinkan Anda untuk melakukan tugas lain sambil menunggu tugas utama selesai, sedangkan sync function memerlukan perhatian terus-menerus pada tugas utama.

## 10 Kasus dimana Async Function sering digunakan

Async function adalah bagian penting dalam pemrograman Flutter untuk mengatasi operasi asinkron. Berikut adalah 10 kasus umum di mana async function sering digunakan dalam aplikasi Flutter:

1. **Mengambil Data dari API**: Ketika Anda melakukan permintaan ke server API untuk mengambil data seperti informasi pengguna atau data produk, Anda akan menggunakan async function untuk menjaga aplikasi tetap responsif selama permintaan tersebut diproses.

2. **Membaca/Penyimpanan Lokal**: Ketika Anda perlu menyimpan atau mengambil data dari penyimpanan lokal seperti SQLite atau shared preferences, Anda akan menggunakan async function agar operasi tersebut tidak menghentikan antarmuka pengguna.

3. **Mengunggah/Upload File**: Ketika Anda ingin mengunggah gambar atau file ke server, async function digunakan untuk memungkinkan proses unggahan berjalan di background tanpa menghentikan pengguna.

4. **Mengambil Lokasi Geografis**: Ketika Anda perlu mengambil lokasi geografis dari perangkat, async function digunakan untuk mengambil data lokasi tanpa menghentikan aplikasi.

5. **Penggunaan Timer**: Async function digunakan untuk menjalankan tugas yang berulang dengan interval waktu tertentu, seperti mengambil pembaruan data dari server setiap beberapa menit.

6. **Permission**: Ketika aplikasi Anda memerlukan izin akses ke fitur atau sumber daya perangkat seperti kamera, mikrofon, galeri, atau lokasi, async function digunakan untuk mengelola proses permintaan izin dari pengguna. Anda dapat menggunakan paket Flutter seperti permission_handler untuk mengakses izin dengan asinkron, sehingga aplikasi dapat terus berjalan sambil menunggu izin diberikan oleh pengguna.

## Contoh Async Function

**Async**: Keyword async digunakan untuk mendeklarasikan bahwa sebuah fungsi adalah asinkron, yang berarti fungsi tersebut dapat berjalan secara independen dan tidak akan menghentikan eksekusi kode lainnya.

**Await**: Keyword await digunakan dalam fungsi asinkron untuk menunggu hasil dari operasi asinkron lainnya. Ini memungkinkan Anda untuk menjalankan operasi asinkron secara berurutan, seolah-olah mereka adalah operasi sinkron.

**Future**: objek yang merepresentasikan nilai yang mungkin belum tersedia saat ini, tetapi akan tersedia pada suatu waktu di masa depan. Dalam Flutter, Future sering digunakan untuk mengatasi operasi asinkron dan menjaga responsivitas aplikasi.

```dart
Future<List<dynamic>> getUsers() async {
  final dio = Dio();
  final response =
      await dio.get('https://reqres.in/api/users');
  return response.data["data"];
}
```

```dart
import 'package:dio/dio.dart';

// Function to get products using DIO
Future<List<dynamic>> getProducts() async {
  try {
    final dio = Dio();
    final response =
        await dio.get('https://capekngoding.com/demo/api/products');

    if (response.statusCode == 200) {
      final jsonData = response.data;
      final List<dynamic> products = jsonData['data'];
      return products;
    } else {
      throw Exception(
          'Failed to get products. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to get products. Error: $e');
  }
}

// Function to add a new product using DIO
Future<void> addProduct(Map<String, dynamic> newProduct) async {
  try {
    final dio = Dio();
    await dio.post('https://capekngoding.com/demo/api/products',
        data: newProduct);
  } catch (e) {
    throw Exception('Failed to add product. Error: $e');
  }
}

// Function to update a product using DIO
Future<void> updateProduct(
    int productId, Map<String, dynamic> updatedProduct) async {
  try {
    final dio = Dio();
    final url = 'https://capekngoding.com/demo/api/products/$productId';
    final response = await dio.post(url, data: updatedProduct);

    if (response.statusCode == 200) {
      print('Product updated successfully.');
    } else {
      throw Exception(
          'Failed to update product. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to update product. Error: $e');
  }
}

// Function to delete a product using DIO
Future<void> deleteProduct(int productId) async {
  try {
    final dio = Dio();
    final url = 'https://capekngoding.com/demo/api/products/$productId';
    final response = await dio.delete(url);

    if (response.statusCode == 200) {
      print('Product deleted successfully.');
    } else {
      throw Exception(
          'Failed to delete product. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to delete product. Error: $e');
  }
}

void main() async {
  try {
    print('Fetching products...');
    List<dynamic> products = await getProducts();
    print('Products: $products');

    print('Adding a new product...');
    Map<String, dynamic> newProduct = {
      'name': 'Product D',
      'price': 15.0,
      'description': 'This is Product D'
    };
    await addProduct(newProduct);

    print('Updating a product...');
    int productId = 1;
    Map<String, dynamic> updatedProduct = {
      'name': 'Updated Product',
      'price': 20.0,
      'description': 'This is the updated product'
    };
    await updateProduct(productId, updatedProduct);

    print('Deleting a product...');
    await deleteProduct(productId);
  } catch (e) {
    print('Error: $e');
  }
}
```

## Tugas Mentor
- Contohkan kasus, dimana developer lupa menunggu async function dengan await
- Jelaskan kenapa menggunakan await lebih baik daripada then