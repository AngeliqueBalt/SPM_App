import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';

part 'report.g.dart';

@freezed
class Report with _$Report {
  const factory Report({
    required final List<Bucket> buckets,
  }) = _Report;

  factory Report.fromJson(final Map<String, dynamic> json) =>
      _$ReportFromJson(json);
}

@freezed
class Bucket with _$Bucket {
  const factory Bucket({
    required final int minScore,
    required final int maxScore,
    required final double proportion,
  }) = _Bucket;

  factory Bucket.fromJson(final Map<String, dynamic> json) =>
      _$BucketFromJson(json);
}
