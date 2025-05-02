
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/category.dart';
import 'package:mobile/data/product.dart';
import 'package:mobile/services/category_service.dart';
import 'package:mobile/services/product_service.dart';
import 'package:mobile/state/state.dart';
import 'package:mobile/viewmodel/category_viewmodel.dart';
import 'package:mobile/viewmodel/product_viewmodel.dart';

final categoryServiceProvider = Provider<CategoryService>((ref) {
  return CategoryService();
});


final categoryViewModelProvider = StateNotifierProvider<CategoryViewModel, State<List<Category>>>((ref) {
  final categoryService = ref.watch(categoryServiceProvider);
  return CategoryViewModel(categoryService);
});



final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

final productViewModelProvider = StateNotifierProvider<ProductViewModel, State<List<Product>>>((ref) {
  final productService = ref.watch(productServiceProvider);
  return ProductViewModel(productService);
});