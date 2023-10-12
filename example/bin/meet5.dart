import 'package:dio/dio.dart';

// Function to get products using DIO
Future<List<dynamic>> getProducts() async {
  throw Exception("404");
  try {
    final dio = Dio();

    final response = await dio.get(
      'https://capekngoding.com/demo/api/products',
      options: Options(
        sendTimeout: Duration(seconds: 100),
        receiveTimeout: Duration(seconds: 100),
      ),
    );

    if (response.statusCode == 404) {
      throw Exception("404");
    }

    if (response.statusCode == 200) {
      final jsonData = response.data;
      final List<dynamic> products = jsonData['data'];
      return products;
    } else {
      throw Exception(
          'Failed to get products. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw DioException(requestOptions: RequestOptions());
  }
}

void main() async {
  /*
  1. 1 tab identation
  2. Alur-nya bisa membingungkan
  */
  /*
  var products = await getProducts();
  print("Berhasil menampilkan product");
  */

  //View = UI
  try {
    List products = await getProducts();
    // print(products);
  } on Exception catch (err) {
    print(err);
  }
}
