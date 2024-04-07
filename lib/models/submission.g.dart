// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmissionImpl _$$SubmissionImplFromJson(Map<String, dynamic> json) =>
    _$SubmissionImpl(
      quizId: json['quiz'] as String,
      classId: json['class'] as String,
      studentId: json['student'] as String,
      submitted: DateTime.parse(json['submitted'] as String),
      score: json['score'] as int,
    );

Map<String, dynamic> _$$SubmissionImplToJson(_$SubmissionImpl instance) =>
    <String, dynamic>{
      'quiz': instance.quizId,
      'class': instance.classId,
      'student': instance.studentId,
      'submitted': instance.submitted.toIso8601String(),
      'score': instance.score,
    };
