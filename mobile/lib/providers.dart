
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/category.dart';
import 'package:mobile/services/category_service.dart';
import 'package:mobile/state/state.dart';
import 'package:mobile/viewmodel/category_viewmodel.dart';

final categoryServiceProvider = Provider<CategoryService>((ref) {
  return CategoryService();
});


final categoryViewModelProvider = StateNotifierProvider<CategoryViewModel, State<List<Category>>>((ref) {
  final categoryService = ref.watch(categoryServiceProvider);
  return CategoryViewModel(categoryService);
});