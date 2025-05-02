import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/category.dart';
import 'package:mobile/services/category_service.dart';
import 'package:mobile/state/state.dart';

class CategoryViewModel extends StateNotifier<State<List<Category>>> {
  final CategoryService _categoryService;

  CategoryViewModel(this._categoryService) : super(const State.init()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    state = const State.loading();
    try {
      final categories = await _categoryService.getAllCategories();
      state = State.success(categories);
    } catch (e, stackTrace) {
      state = State.error(Exception(e.toString()));
    }
  }

  Future<void> createCategory(CategoryRequest category, File imageFile) async {
    final newCategory = await _categoryService.createCategory(category, imageFile);
    final currentList = state.data ?? [];
    state = State.success([...currentList, newCategory]);
  }

  Future<void> updateCategory(String id, CategoryRequest category, {File? imageFile}) async {
    final updatedCategory = await _categoryService.updateCategory(id, category, imageFile: imageFile);
    final currentList = state.data ?? [];
    final newList = currentList.map((c) => c.id == id ? updatedCategory : c).toList();
    state = State.success(newList);
  }

  Future<void> deleteCategory(String id) async {
    await _categoryService.deleteCategory(id);
    final currentList = state.data ?? [];
    final newList = currentList.where((c) => c.id != id).toList();
    state = State.success(newList);
  }
}