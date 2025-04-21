import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    String? id,
    required String name,
    required String description,
    required double price,
    required double lbs,
    required Category category,
    required List<String> images,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}


@freezed
abstract class ProductRequest with _$ProductRequest {
  const factory ProductRequest({
    required String name,
    required String description,
    required double price,
    required double lbs,
    required String categoryId,
  }) = _ProductRequest;

  factory ProductRequest.fromJson(Map<String, dynamic> json) => _$ProductRequestFromJson(json);
}

@Freezed(genericArgumentFactories: true)
abstract class PaginationResponse<T> with _$PaginationResponse<T> {
  const factory PaginationResponse({
    required List<T> data,
    required PaginationInfo pagination,
  }) = _PaginationResponse<T>;

  factory PaginationResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) => _$PaginationResponseFromJson(json, fromJsonT);
}

@freezed
abstract class PaginationInfo with _$PaginationInfo {
  const factory PaginationInfo({
    required int totalItems,
    required int currentPage,
    required int totalPages,
    required int itemsPerPage,
    required int itemsOnCurrentPage,
  }) = _PaginationInfo;

  factory PaginationInfo.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoFromJson(json);
}