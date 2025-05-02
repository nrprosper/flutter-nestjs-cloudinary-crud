import 'dart:io';

String? validateRequired(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return '$fieldName is required';
  }
  return null;
}

String? validateNumber(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return '$fieldName is required';
  }
  if (double.tryParse(value) == null) {
    return '$fieldName must be a valid number';
  }
  return null;
}

String? validateImages(List<File> images) {
  if (images.isEmpty) {
    return 'At least one image is required';
  }
  if (images.length > 5) {
    return 'Maximum of 5 images allowed';
  }
  return null;
}

String? validateCategory(String? categoryId) {
  if (categoryId == null || categoryId.isEmpty) {
    return 'Please select a category';
  }
  return null;
}