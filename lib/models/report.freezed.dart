// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  List<Bucket> get buckets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call({List<Bucket> buckets});
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buckets = null,
  }) {
    return _then(_value.copyWith(
      buckets: null == buckets
          ? _value.buckets
          : buckets // ignore: cast_nullable_to_non_nullable
              as List<Bucket>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportImplCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$ReportImplCopyWith(
          _$ReportImpl value, $Res Function(_$ReportImpl) then) =
      __$$ReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Bucket> buckets});
}

/// @nodoc
class __$$ReportImplCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$ReportImpl>
    implements _$$ReportImplCopyWith<$Res> {
  __$$ReportImplCopyWithImpl(
      _$ReportImpl _value, $Res Function(_$ReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buckets = null,
  }) {
    return _then(_$ReportImpl(
      buckets: null == buckets
          ? _value._buckets
          : buckets // ignore: cast_nullable_to_non_nullable
              as List<Bucket>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportImpl implements _Report {
  const _$ReportImpl({required final List<Bucket> buckets})
      : _buckets = buckets;

  factory _$ReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportImplFromJson(json);

  final List<Bucket> _buckets;
  @override
  List<Bucket> get buckets {
    if (_buckets is EqualUnmodifiableListView) return _buckets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buckets);
  }

  @override
  String toString() {
    return 'Report(buckets: $buckets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportImpl &&
            const DeepCollectionEquality().equals(other._buckets, _buckets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_buckets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      __$$ReportImplCopyWithImpl<_$ReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportImplToJson(
      this,
    );
  }
}

abstract class _Report implements Report {
  const factory _Report({required final List<Bucket> buckets}) = _$ReportImpl;

  factory _Report.fromJson(Map<String, dynamic> json) = _$ReportImpl.fromJson;

  @override
  List<Bucket> get buckets;
  @override
  @JsonKey(ignore: true)
  _$$ReportImplCopyWith<_$ReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Bucket _$BucketFromJson(Map<String, dynamic> json) {
  return _Bucket.fromJson(json);
}

/// @nodoc
mixin _$Bucket {
  int get minScore => throw _privateConstructorUsedError;
  int get maxScore => throw _privateConstructorUsedError;
  double get proportion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BucketCopyWith<Bucket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BucketCopyWith<$Res> {
  factory $BucketCopyWith(Bucket value, $Res Function(Bucket) then) =
      _$BucketCopyWithImpl<$Res, Bucket>;
  @useResult
  $Res call({int minScore, int maxScore, double proportion});
}

/// @nodoc
class _$BucketCopyWithImpl<$Res, $Val extends Bucket>
    implements $BucketCopyWith<$Res> {
  _$BucketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minScore = null,
    Object? maxScore = null,
    Object? proportion = null,
  }) {
    return _then(_value.copyWith(
      minScore: null == minScore
          ? _value.minScore
          : minScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int,
      proportion: null == proportion
          ? _value.proportion
          : proportion // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BucketImplCopyWith<$Res> implements $BucketCopyWith<$Res> {
  factory _$$BucketImplCopyWith(
          _$BucketImpl value, $Res Function(_$BucketImpl) then) =
      __$$BucketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int minScore, int maxScore, double proportion});
}

/// @nodoc
class __$$BucketImplCopyWithImpl<$Res>
    extends _$BucketCopyWithImpl<$Res, _$BucketImpl>
    implements _$$BucketImplCopyWith<$Res> {
  __$$BucketImplCopyWithImpl(
      _$BucketImpl _value, $Res Function(_$BucketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minScore = null,
    Object? maxScore = null,
    Object? proportion = null,
  }) {
    return _then(_$BucketImpl(
      minScore: null == minScore
          ? _value.minScore
          : minScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int,
      proportion: null == proportion
          ? _value.proportion
          : proportion // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BucketImpl implements _Bucket {
  const _$BucketImpl(
      {required this.minScore,
      required this.maxScore,
      required this.proportion});

  factory _$BucketImpl.fromJson(Map<String, dynamic> json) =>
      _$$BucketImplFromJson(json);

  @override
  final int minScore;
  @override
  final int maxScore;
  @override
  final double proportion;

  @override
  String toString() {
    return 'Bucket(minScore: $minScore, maxScore: $maxScore, proportion: $proportion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BucketImpl &&
            (identical(other.minScore, minScore) ||
                other.minScore == minScore) &&
            (identical(other.maxScore, maxScore) ||
                other.maxScore == maxScore) &&
            (identical(other.proportion, proportion) ||
                other.proportion == proportion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minScore, maxScore, proportion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BucketImplCopyWith<_$BucketImpl> get copyWith =>
      __$$BucketImplCopyWithImpl<_$BucketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BucketImplToJson(
      this,
    );
  }
}

abstract class _Bucket implements Bucket {
  const factory _Bucket(
      {required final int minScore,
      required final int maxScore,
      required final double proportion}) = _$BucketImpl;

  factory _Bucket.fromJson(Map<String, dynamic> json) = _$BucketImpl.fromJson;

  @override
  int get minScore;
  @override
  int get maxScore;
  @override
  double get proportion;
  @override
  @JsonKey(ignore: true)
  _$$BucketImplCopyWith<_$BucketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
