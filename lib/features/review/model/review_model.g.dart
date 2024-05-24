// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      productId: json['product_id'] ?? 0,
      avgRating: (json['avg_rating'] as num?)?.toDouble() ?? 0.0,
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'avg_rating': instance.avgRating,
      'reviews': instance.reviews,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      reviewId: (json['review_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'name': instance.name,
      'rating': instance.rating,
      'comment': instance.comment,
    };
