import 'dart:io';

import 'package:dio/dio.dart';

import '../api_client.dart';
import '../data/category.dart';

class CategoryService {
  final Dio _dio;
  CategoryService([Dio? dio]) : _dio = dio ?? ApiClient().dio;

  Future<List<Category>> getAllCategories() async {
    final response = await _dio.get('/categories');
    return (response.data as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }

  Future<Category> getCategoryById(String id) async {
    final response = await _dio.get('/categories/$id');
    return Category.fromJson(response.data);
  }

  Future<Category> createCategory(CategoryRequest category, File imageFile) async {
    final formData = FormData.fromMap({
      'name': category.name,
      'description': category.description,
      'image': await MultipartFile.fromFile(
        imageFile.path,
        filename: 'category_image.jpg',
      ),
    });
    final response = await _dio.post(
      '/categories',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return Category.fromJson(response.data);
  }

  Future<Category> updateCategory(String id, CategoryRequest category, {File? imageFile}) async {
    final formData = FormData.fromMap({
      'name': category.name,
      'description': category.description,
      if (imageFile != null)
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'category_image.jpg',
        ),
    });
    final response = await _dio.patch(
      '/categories/$id',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return Category.fromJson(response.data);
  }

  Future<bool> deleteCategory(String id) async {
    await _dio.delete('/categories/$id');
    return true;
  }
}