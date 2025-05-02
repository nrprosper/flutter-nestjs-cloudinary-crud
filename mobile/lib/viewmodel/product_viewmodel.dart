import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/product.dart';
import 'package:mobile/services/product_service.dart';
import 'package:mobile/state/state.dart';

class ProductViewModel extends StateNotifier<State<List<Product>>> {
  final ProductService _productService;
  String? _currentCategoryId;
  int _currentPage = 1;
  bool _hasMore = true;

  ProductViewModel(this._productService) : super(const State.init()) {
    fetchProducts();
  }

  Future<void> setCategory(String categoryId) async {
    if (_currentCategoryId == categoryId) return;
    _currentCategoryId = categoryId;
    _currentPage = 1;
    _hasMore = true;
    await fetchProducts();
  }

  Future<void> fetchProducts({int limit = 10, bool reset = false}) async {
    if (!_hasMore && !reset) return;

    if (reset) {
      _currentPage = 1;
      _hasMore = true;
    }

    state = const State.loading();
    try {
      final response = _currentCategoryId == null
          ? await _productService.getAllProducts(page: _currentPage, limit: limit)
          : await _productService.getProductsByCategory(
        _currentCategoryId!,
        page: _currentPage,
        limit: limit,
      );
      final newProducts = response.data;

      if (_currentPage == 1) {
        state = State.success(newProducts);
      } else {
        final currentList = state.data ?? [];
        state = State.success([...currentList, ...newProducts]);
      }

      _hasMore = newProducts.length == limit;
      if (_hasMore) _currentPage++;
    } catch (e) {
      state = State.error(Exception(e.toString()));
    }
  }

  Future<void> loadMore({int limit = 10}) async {
    if (_hasMore) {
      await fetchProducts(limit: limit);
    }
  }

  Future<void> createProduct(ProductRequest product, List<File> imageFiles) async {
    final newProduct = await _productService.createProduct(product, imageFiles);
    if (_currentCategoryId == null || newProduct.category.id == _currentCategoryId) {
      final currentList = state.data ?? [];
      state = State.success([newProduct, ...currentList]);
    }
  }

  Future<void> updateProduct(String id, ProductRequest product, {List<File>? imageFiles}) async {
    final updatedProduct = await _productService.updateProduct(id, product, imageFiles: imageFiles);
    final currentList = state.data ?? [];
    final index = currentList.indexWhere((p) => p.id == id);
    if (index != -1) {
      if (_currentCategoryId == null || updatedProduct.category.id == _currentCategoryId) {
        final newList = List<Product>.from(currentList);
        newList[index] = updatedProduct;
        state = State.success(newList);
      } else {
        final newList = currentList.where((p) => p.id != id).toList();
        state = State.success(newList);
      }
    }
  }

  Future<void> deleteProduct(String id) async {
    await _productService.deleteProduct(id);
    final currentList = state.data ?? [];
    final newList = currentList.where((p) => p.id != id).toList();
    state = State.success(newList);
  }


}