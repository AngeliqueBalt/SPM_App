// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
      buckets: (json['buckets'] as List<dynamic>)
          .map((e) => Bucket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'buckets': instance.buckets,
    };

_$BucketImpl _$$BucketImplFromJson(Map<String, dynamic> json) => _$BucketImpl(
      minScore: json['minScore'] as int,
      maxScore: json['maxScore'] as int,
      proportion: (json['proportion'] as num).toDouble(),
    );

Map<String, dynamic> _$$BucketImplToJson(_$BucketImpl instance) =>
    <String, dynamic>{
      'minScore': instance.minScore,
      'maxScore': instance.maxScore,
      'proportion': instance.proportion,
    };
