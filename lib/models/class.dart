import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/models/user.dart';

part 'class.freezed.dart';

part 'class.g.dart';

@freezed
class Class with _$Class {
  const factory Class({
    required final String id,
    required final String name,
    required final User teacher,
    required final List<User> students,
    required final List<Quiz>? quizzes,
    required final Quiz? activeQuiz,
  }) = _Class;

  factory Class.fromJson(final Map<String, dynamic> json) =>
      _$ClassFromJson(json);
}
