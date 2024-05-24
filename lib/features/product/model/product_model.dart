// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @Default(-1) int id,
    @Default('') String name,
    @Default(1) @JsonKey(name: 'category_id') int categoryId,
    @Default(-1) @JsonKey(name: 'brand_id') int brandId,
    @Default('') @JsonKey(name: 'image_url') String imageUrl,
    @Default('') String description,
    @Default(-1) int price,
    @Default(-1.0) @JsonKey(name: 'avg_rating') double avgRating,
    @Default(-1) @JsonKey(name: 'total_ratings') int totalRatings,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
