import 'package:crud/src/models/product_model.dart';
import 'package:crud/src/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final productServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final productListProvider = FutureProvider<List<ProductModel>>((ref) async {
  final productService = ref.watch(productServiceProvider);
  return productService.getProducts();
});

final productCreateProvider = Provider((ref) {
  final productService = ref.watch(productServiceProvider);
  return productService.createProduct;
});

final productUpdateProvider =
    FutureProvider.family<void, ProductModel>((ref, product) async {
  final productService = ref.watch(productServiceProvider);
  return productService.updateProduct(product.id, product);
});

final updateProductStateProvider =
    StateProvider<AsyncValue<void>>((ref) => const AsyncData(null));

final productDeleteProvider =
    FutureProvider.family<void, String>((ref, id) async {
  final productService = ref.watch(productServiceProvider);
  return productService.deleteProduct(id);
});
