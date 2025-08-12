import 'package:dio/dio.dart';
import 'package:shop_app/model/product.dart';

class ProductRepository {
  final Dio _dio = Dio();

 Future<List<Product>> fetchProducts() async {
  try {
    final response = await _dio.get('https://fakestoreapi.com/products');

    if (response.statusCode == 200) {
      List data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Gagal fetch product, status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Gagal fetch product: $e');
  }
}

}
