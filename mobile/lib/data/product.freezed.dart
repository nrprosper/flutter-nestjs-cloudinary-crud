// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

@JsonKey(name: '_id') String get id; String get name; String get description; double get price; double get lbs; Category get category; List<String> get images; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.lbs, lbs) || other.lbs == lbs)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,lbs,category,const DeepCollectionEquality().hash(images),createdAt,updatedAt);

@override
String toString() {
  return 'Product(id: $id, name: $name, description: $description, price: $price, lbs: $lbs, category: $category, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String description, double price, double lbs, Category category, List<String> images, DateTime? createdAt, DateTime? updatedAt
});


$CategoryCopyWith<$Res> get category;

}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? lbs = null,Object? category = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lbs: null == lbs ? _self.lbs : lbs // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res> get category {
  
  return $CategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({@JsonKey(name: '_id') required this.id, required this.name, required this.description, required this.price, required this.lbs, required this.category, required final  List<String> images, this.createdAt, this.updatedAt}): _images = images;
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String name;
@override final  String description;
@override final  double price;
@override final  double lbs;
@override final  Category category;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.lbs, lbs) || other.lbs == lbs)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,lbs,category,const DeepCollectionEquality().hash(_images),createdAt,updatedAt);

@override
String toString() {
  return 'Product(id: $id, name: $name, description: $description, price: $price, lbs: $lbs, category: $category, images: $images, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String description, double price, double lbs, Category category, List<String> images, DateTime? createdAt, DateTime? updatedAt
});


@override $CategoryCopyWith<$Res> get category;

}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? lbs = null,Object? category = null,Object? images = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lbs: null == lbs ? _self.lbs : lbs // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res> get category {
  
  return $CategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$ProductRequest {

 String get name; String get description; double get price; double get lbs; String get categoryId;
/// Create a copy of ProductRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductRequestCopyWith<ProductRequest> get copyWith => _$ProductRequestCopyWithImpl<ProductRequest>(this as ProductRequest, _$identity);

  /// Serializes this ProductRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.lbs, lbs) || other.lbs == lbs)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,price,lbs,categoryId);

@override
String toString() {
  return 'ProductRequest(name: $name, description: $description, price: $price, lbs: $lbs, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $ProductRequestCopyWith<$Res>  {
  factory $ProductRequestCopyWith(ProductRequest value, $Res Function(ProductRequest) _then) = _$ProductRequestCopyWithImpl;
@useResult
$Res call({
 String name, String description, double price, double lbs, String categoryId
});




}
/// @nodoc
class _$ProductRequestCopyWithImpl<$Res>
    implements $ProductRequestCopyWith<$Res> {
  _$ProductRequestCopyWithImpl(this._self, this._then);

  final ProductRequest _self;
  final $Res Function(ProductRequest) _then;

/// Create a copy of ProductRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? price = null,Object? lbs = null,Object? categoryId = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lbs: null == lbs ? _self.lbs : lbs // ignore: cast_nullable_to_non_nullable
as double,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProductRequest implements ProductRequest {
  const _ProductRequest({required this.name, required this.description, required this.price, required this.lbs, required this.categoryId});
  factory _ProductRequest.fromJson(Map<String, dynamic> json) => _$ProductRequestFromJson(json);

@override final  String name;
@override final  String description;
@override final  double price;
@override final  double lbs;
@override final  String categoryId;

/// Create a copy of ProductRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductRequestCopyWith<_ProductRequest> get copyWith => __$ProductRequestCopyWithImpl<_ProductRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.lbs, lbs) || other.lbs == lbs)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,price,lbs,categoryId);

@override
String toString() {
  return 'ProductRequest(name: $name, description: $description, price: $price, lbs: $lbs, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ProductRequestCopyWith<$Res> implements $ProductRequestCopyWith<$Res> {
  factory _$ProductRequestCopyWith(_ProductRequest value, $Res Function(_ProductRequest) _then) = __$ProductRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, double price, double lbs, String categoryId
});




}
/// @nodoc
class __$ProductRequestCopyWithImpl<$Res>
    implements _$ProductRequestCopyWith<$Res> {
  __$ProductRequestCopyWithImpl(this._self, this._then);

  final _ProductRequest _self;
  final $Res Function(_ProductRequest) _then;

/// Create a copy of ProductRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? price = null,Object? lbs = null,Object? categoryId = null,}) {
  return _then(_ProductRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lbs: null == lbs ? _self.lbs : lbs // ignore: cast_nullable_to_non_nullable
as double,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaginationResponse<T> {

 List<T> get data; PaginationInfo get pagination;
/// Create a copy of PaginationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationResponseCopyWith<T, PaginationResponse<T>> get copyWith => _$PaginationResponseCopyWithImpl<T, PaginationResponse<T>>(this as PaginationResponse<T>, _$identity);

  /// Serializes this PaginationResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationResponse<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'PaginationResponse<$T>(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $PaginationResponseCopyWith<T,$Res>  {
  factory $PaginationResponseCopyWith(PaginationResponse<T> value, $Res Function(PaginationResponse<T>) _then) = _$PaginationResponseCopyWithImpl;
@useResult
$Res call({
 List<T> data, PaginationInfo pagination
});


$PaginationInfoCopyWith<$Res> get pagination;

}
/// @nodoc
class _$PaginationResponseCopyWithImpl<T,$Res>
    implements $PaginationResponseCopyWith<T, $Res> {
  _$PaginationResponseCopyWithImpl(this._self, this._then);

  final PaginationResponse<T> _self;
  final $Res Function(PaginationResponse<T>) _then;

/// Create a copy of PaginationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationInfo,
  ));
}
/// Create a copy of PaginationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoCopyWith<$Res> get pagination {
  
  return $PaginationInfoCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PaginationResponse<T> implements PaginationResponse<T> {
  const _PaginationResponse({required final  List<T> data, required this.pagination}): _data = data;
  factory _PaginationResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginationResponseFromJson(json,fromJsonT);

 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationInfo pagination;

/// Create a copy of PaginationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationResponseCopyWith<T, _PaginationResponse<T>> get copyWith => __$PaginationResponseCopyWithImpl<T, _PaginationResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PaginationResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationResponse<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'PaginationResponse<$T>(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$PaginationResponseCopyWith<T,$Res> implements $PaginationResponseCopyWith<T, $Res> {
  factory _$PaginationResponseCopyWith(_PaginationResponse<T> value, $Res Function(_PaginationResponse<T>) _then) = __$PaginationResponseCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, PaginationInfo pagination
});


@override $PaginationInfoCopyWith<$Res> get pagination;

}
/// @nodoc
class __$PaginationResponseCopyWithImpl<T,$Res>
    implements _$PaginationResponseCopyWith<T, $Res> {
  __$PaginationResponseCopyWithImpl(this._self, this._then);

  final _PaginationResponse<T> _self;
  final $Res Function(_PaginationResponse<T>) _then;

/// Create a copy of PaginationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_PaginationResponse<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationInfo,
  ));
}

/// Create a copy of PaginationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoCopyWith<$Res> get pagination {
  
  return $PaginationInfoCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$PaginationInfo {

 int get totalItems; int get currentPage; int get totalPages; int get itemsPerPage; int get itemsOnCurrentPage;
/// Create a copy of PaginationInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationInfoCopyWith<PaginationInfo> get copyWith => _$PaginationInfoCopyWithImpl<PaginationInfo>(this as PaginationInfo, _$identity);

  /// Serializes this PaginationInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationInfo&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.itemsPerPage, itemsPerPage) || other.itemsPerPage == itemsPerPage)&&(identical(other.itemsOnCurrentPage, itemsOnCurrentPage) || other.itemsOnCurrentPage == itemsOnCurrentPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalItems,currentPage,totalPages,itemsPerPage,itemsOnCurrentPage);

@override
String toString() {
  return 'PaginationInfo(totalItems: $totalItems, currentPage: $currentPage, totalPages: $totalPages, itemsPerPage: $itemsPerPage, itemsOnCurrentPage: $itemsOnCurrentPage)';
}


}

/// @nodoc
abstract mixin class $PaginationInfoCopyWith<$Res>  {
  factory $PaginationInfoCopyWith(PaginationInfo value, $Res Function(PaginationInfo) _then) = _$PaginationInfoCopyWithImpl;
@useResult
$Res call({
 int totalItems, int currentPage, int totalPages, int itemsPerPage, int itemsOnCurrentPage
});




}
/// @nodoc
class _$PaginationInfoCopyWithImpl<$Res>
    implements $PaginationInfoCopyWith<$Res> {
  _$PaginationInfoCopyWithImpl(this._self, this._then);

  final PaginationInfo _self;
  final $Res Function(PaginationInfo) _then;

/// Create a copy of PaginationInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalItems = null,Object? currentPage = null,Object? totalPages = null,Object? itemsPerPage = null,Object? itemsOnCurrentPage = null,}) {
  return _then(_self.copyWith(
totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,itemsPerPage: null == itemsPerPage ? _self.itemsPerPage : itemsPerPage // ignore: cast_nullable_to_non_nullable
as int,itemsOnCurrentPage: null == itemsOnCurrentPage ? _self.itemsOnCurrentPage : itemsOnCurrentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PaginationInfo implements PaginationInfo {
  const _PaginationInfo({required this.totalItems, required this.currentPage, required this.totalPages, required this.itemsPerPage, required this.itemsOnCurrentPage});
  factory _PaginationInfo.fromJson(Map<String, dynamic> json) => _$PaginationInfoFromJson(json);

@override final  int totalItems;
@override final  int currentPage;
@override final  int totalPages;
@override final  int itemsPerPage;
@override final  int itemsOnCurrentPage;

/// Create a copy of PaginationInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationInfoCopyWith<_PaginationInfo> get copyWith => __$PaginationInfoCopyWithImpl<_PaginationInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationInfo&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.itemsPerPage, itemsPerPage) || other.itemsPerPage == itemsPerPage)&&(identical(other.itemsOnCurrentPage, itemsOnCurrentPage) || other.itemsOnCurrentPage == itemsOnCurrentPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalItems,currentPage,totalPages,itemsPerPage,itemsOnCurrentPage);

@override
String toString() {
  return 'PaginationInfo(totalItems: $totalItems, currentPage: $currentPage, totalPages: $totalPages, itemsPerPage: $itemsPerPage, itemsOnCurrentPage: $itemsOnCurrentPage)';
}


}

/// @nodoc
abstract mixin class _$PaginationInfoCopyWith<$Res> implements $PaginationInfoCopyWith<$Res> {
  factory _$PaginationInfoCopyWith(_PaginationInfo value, $Res Function(_PaginationInfo) _then) = __$PaginationInfoCopyWithImpl;
@override @useResult
$Res call({
 int totalItems, int currentPage, int totalPages, int itemsPerPage, int itemsOnCurrentPage
});




}
/// @nodoc
class __$PaginationInfoCopyWithImpl<$Res>
    implements _$PaginationInfoCopyWith<$Res> {
  __$PaginationInfoCopyWithImpl(this._self, this._then);

  final _PaginationInfo _self;
  final $Res Function(_PaginationInfo) _then;

/// Create a copy of PaginationInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalItems = null,Object? currentPage = null,Object? totalPages = null,Object? itemsPerPage = null,Object? itemsOnCurrentPage = null,}) {
  return _then(_PaginationInfo(
totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,itemsPerPage: null == itemsPerPage ? _self.itemsPerPage : itemsPerPage // ignore: cast_nullable_to_non_nullable
as int,itemsOnCurrentPage: null == itemsOnCurrentPage ? _self.itemsOnCurrentPage : itemsOnCurrentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
