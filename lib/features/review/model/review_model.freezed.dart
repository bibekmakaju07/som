// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  @JsonKey(name: 'product_id')
  dynamic get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_rating')
  double get avgRating => throw _privateConstructorUsedError;
  List<Review> get reviews => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') dynamic productId,
      @JsonKey(name: 'avg_rating') double avgRating,
      List<Review> reviews});
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? avgRating = null,
    Object? reviews = null,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      avgRating: null == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewModelImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelImplCopyWith(
          _$ReviewModelImpl value, $Res Function(_$ReviewModelImpl) then) =
      __$$ReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') dynamic productId,
      @JsonKey(name: 'avg_rating') double avgRating,
      List<Review> reviews});
}

/// @nodoc
class __$$ReviewModelImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelImpl>
    implements _$$ReviewModelImplCopyWith<$Res> {
  __$$ReviewModelImplCopyWithImpl(
      _$ReviewModelImpl _value, $Res Function(_$ReviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? avgRating = null,
    Object? reviews = null,
  }) {
    return _then(_$ReviewModelImpl(
      productId: freezed == productId ? _value.productId! : productId,
      avgRating: null == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewModelImpl implements _ReviewModel {
  _$ReviewModelImpl(
      {@JsonKey(name: 'product_id') this.productId = 0,
      @JsonKey(name: 'avg_rating') this.avgRating = 0.0,
      final List<Review> reviews = const []})
      : _reviews = reviews;

  factory _$ReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final dynamic productId;
  @override
  @JsonKey(name: 'avg_rating')
  final double avgRating;
  final List<Review> _reviews;
  @override
  @JsonKey()
  List<Review> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  String toString() {
    return 'ReviewModel(productId: $productId, avgRating: $avgRating, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelImpl &&
            const DeepCollectionEquality().equals(other.productId, productId) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productId),
      avgRating,
      const DeepCollectionEquality().hash(_reviews));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      __$$ReviewModelImplCopyWithImpl<_$ReviewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewModel implements ReviewModel {
  factory _ReviewModel(
      {@JsonKey(name: 'product_id') final dynamic productId,
      @JsonKey(name: 'avg_rating') final double avgRating,
      final List<Review> reviews}) = _$ReviewModelImpl;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$ReviewModelImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  dynamic get productId;
  @override
  @JsonKey(name: 'avg_rating')
  double get avgRating;
  @override
  List<Review> get reviews;
  @override
  @JsonKey(ignore: true)
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  @JsonKey(name: 'review_id')
  int get reviewId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {@JsonKey(name: 'review_id') int reviewId,
      String name,
      int rating,
      String comment});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? name = null,
    Object? rating = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'review_id') int reviewId,
      String name,
      int rating,
      String comment});
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? name = null,
    Object? rating = null,
    Object? comment = null,
  }) {
    return _then(_$ReviewImpl(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  _$ReviewImpl(
      {@JsonKey(name: 'review_id') this.reviewId = 0,
      this.name = '',
      this.rating = 0,
      this.comment = ''});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  @JsonKey(name: 'review_id')
  final int reviewId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int rating;
  @override
  @JsonKey()
  final String comment;

  @override
  String toString() {
    return 'Review(reviewId: $reviewId, name: $name, rating: $rating, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reviewId, name, rating, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  factory _Review(
      {@JsonKey(name: 'review_id') final int reviewId,
      final String name,
      final int rating,
      final String comment}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  @JsonKey(name: 'review_id')
  int get reviewId;
  @override
  String get name;
  @override
  int get rating;
  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
