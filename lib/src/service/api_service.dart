import 'package:crud/src/constants/string.dart';
import 'package:crud/src/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio dio = Dio();

  final String baseUrl = kBaseUrl;

  Future<void> createProduct(ProductModel product) async {
    try {
      Response response = await dio.post(
        baseUrl,
        data: product.toJson(),
      );
      if (kDebugMode) {
        print('$kProductCreated: ${response.data}');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('$kFailedToCreateProduct: $e');
      }
      rethrow;
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await dio.get(baseUrl);
      List<dynamic> data = response.data;
      return data
          .map((productData) => ProductModel.fromJson(productData))
          .toList();
    } on DioException catch (e) {
      if (kDebugMode) {
        print('$kFailedToFetchProduct: $e');
      }
      rethrow;
    }
  }

  Future<void> updateProduct(String? id, ProductModel updatedProduct) async {
    try {
      final updateUrl = '$baseUrl/$id';
      Response response = await dio.put(
        updateUrl,
        data: updatedProduct.toJson(),
      );
      if (kDebugMode) {
        print('$kProductCreated: ${response.data}');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('$kFailedToUpdateProduct: $e');
      }
      rethrow;
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      final deleteUrl = '$baseUrl/$id';
      Response response = await dio.delete(deleteUrl);
      if (kDebugMode) {
        print('$kProductDeleted: ${response.data}');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('$kFailedToDeleteProduct: $e');
      }
      rethrow;
    }
  }
}
