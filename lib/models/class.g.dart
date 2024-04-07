// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassImpl _$$ClassImplFromJson(Map<String, dynamic> json) => _$ClassImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      teacher: User.fromJson(json['teacher'] as Map<String, dynamic>),
      students: (json['students'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      quizzes: (json['quizzes'] as List<dynamic>)
          .map((e) => Quiz.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeQuizId: json['activeQuiz'] as String?,
    );

Map<String, dynamic> _$$ClassImplToJson(_$ClassImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teacher': instance.teacher,
      'students': instance.students,
      'quizzes': instance.quizzes,
      'activeQuiz': instance.activeQuizId,
    };
