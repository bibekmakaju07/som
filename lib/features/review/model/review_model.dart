import 'package:freezed_annotation/freezed_annotation.dart';


part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    @JsonKey(name: 'product_id')  @Default(0) productId,
    @JsonKey(name: 'avg_rating')@Default(0.0) double avgRating,
    @Default([]) List<Review> reviews,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}



@freezed
class Review with _$Review {
  factory Review({
  @Default(0)   @JsonKey(name: 'review_id') int reviewId,
   @Default('')  String name,
   @Default(0)  int rating,
   @Default('')  String comment,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
