import 'dart:io';

import 'package:dio/dio.dart';

import '../api_client.dart';
import '../data/product.dart';

class ProductService {
  final Dio _dio;

  ProductService([Dio? dio]) : _dio = dio ?? ApiClient().dio;

  Future<PaginationResponse<Product>> getAllProducts({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _dio.get(
      '/products',
      queryParameters: {'page': page, 'limit': limit},
    );

    return PaginationResponse<Product>.fromJson(
      response.data as Map<String, dynamic>,
          (json) => Product.fromJson(json as Map<String, dynamic>),
    );
  }


  Future<PaginationResponse<Product>> getProductsByCategory(
    String categoryId, {
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _dio.get(
      '/products/category/$categoryId',
      queryParameters: {'page': page, 'limit': limit},
    );
    return PaginationResponse<Product>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => Product.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<Product> createProduct(ProductRequest product, List<File> imageFiles) async {
    try {
      final formData = FormData.fromMap({
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'lbs': product.lbs,
        'categoryId': product.categoryId,
      });

      for (var file in imageFiles) {
        formData.files.add(
          MapEntry(
            'images',
            await MultipartFile.fromFile(
              file.path,
              filename: 'product_image_${DateTime.now().millisecondsSinceEpoch}.jpg',
            ),
          ),
        );
      }

      final response = await _dio.post(
        '/products',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return Product.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          final statusCode = e.response!.statusCode;
          final errorData = e.response!.data;
          String errorMessage = 'Failed to create product';

          if (errorData is Map<String, dynamic> && errorData.containsKey('message')) {
            errorMessage = errorData['message'];
          }

          throw Exception('Error $statusCode: $errorMessage');
        } else {
          throw Exception('Network error: ${e.message}');
        }
      } else {
        throw Exception('Error parsing response: ${e.toString()}');
      }
    }
  }

  Future<Product> updateProduct(
    String id,
    ProductRequest product, {
    List<File>? imageFiles,
  }) async {
    final formData = FormData.fromMap({
      'name': product.name,
      'description': product.description,
      'price': product.price.toString(),
      'lbs': product.lbs.toString(),
      'categoryId': product.categoryId,
    });

    if (imageFiles != null && imageFiles.isNotEmpty) {
      for (var file in imageFiles) {
        formData.files.add(
          MapEntry(
            'images',
            await MultipartFile.fromFile(
              file.path,
              filename:
                  'product_image_${DateTime.now().millisecondsSinceEpoch}.jpg',
            ),
          ),
        );
      }
    }

    final response = await _dio.patch(
      '/products/$id',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return Product.fromJson(response.data);
  }

  Future<bool> deleteProduct(String id) async {
    await _dio.delete('/products/$id');
    return true;
  }
}
