// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  lbs: (json['lbs'] as num).toDouble(),
  category: Category.fromJson(json['category'] as Map<String, dynamic>),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'lbs': instance.lbs,
  'category': instance.category,
  'images': instance.images,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_ProductRequest _$ProductRequestFromJson(Map<String, dynamic> json) =>
    _ProductRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      lbs: (json['lbs'] as num).toDouble(),
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$ProductRequestToJson(_ProductRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'lbs': instance.lbs,
      'categoryId': instance.categoryId,
    };

_PaginationResponse<T> _$PaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PaginationResponse<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  pagination: PaginationInfo.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PaginationResponseToJson<T>(
  _PaginationResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'pagination': instance.pagination,
};

_PaginationInfo _$PaginationInfoFromJson(Map<String, dynamic> json) =>
    _PaginationInfo(
      totalItems: (json['totalItems'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      itemsOnCurrentPage: (json['itemsOnCurrentPage'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationInfoToJson(_PaginationInfo instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'itemsPerPage': instance.itemsPerPage,
      'itemsOnCurrentPage': instance.itemsOnCurrentPage,
    };
