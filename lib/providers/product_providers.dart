import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/repository/products_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final productListProvider = FutureProvider<List<Product>>((ref) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.fetchProducts();
});
