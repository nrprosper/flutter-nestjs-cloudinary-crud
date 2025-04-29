import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    String? id,
    required String name,
    String? description,
    required String image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}


@freezed
abstract class CategoryRequest with _$CategoryRequest {
  const factory CategoryRequest({
    required String name,
    String? description,
  }) = _CategoryRequest;

  factory CategoryRequest.fromJson(Map<String, dynamic> json) => _$CategoryRequestFromJson(json);
}