// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmissionImpl _$$SubmissionImplFromJson(Map<String, dynamic> json) =>
    _$SubmissionImpl(
      quiz: Quiz.fromJson(json['quiz'] as Map<String, dynamic>),
      student: User.fromJson(json['student'] as Map<String, dynamic>),
      score: json['score'] as int,
    );

Map<String, dynamic> _$$SubmissionImplToJson(_$SubmissionImpl instance) =>
    <String, dynamic>{
      'quiz': instance.quiz,
      'student': instance.student,
      'score': instance.score,
    };
