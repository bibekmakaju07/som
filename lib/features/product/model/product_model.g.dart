// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      categoryId: (json['category_id'] as num?)?.toInt() ?? 1,
      brandId: (json['brand_id'] as num?)?.toInt() ?? -1,
      imageUrl: json['image_url'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? -1,
      avgRating: (json['avg_rating'] as num?)?.toDouble() ?? -1.0,
      totalRatings: (json['total_ratings'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_id': instance.categoryId,
      'brand_id': instance.brandId,
      'image_url': instance.imageUrl,
      'description': instance.description,
      'price': instance.price,
      'avg_rating': instance.avgRating,
      'total_ratings': instance.totalRatings,
    };
