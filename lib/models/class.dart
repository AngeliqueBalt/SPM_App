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
    required final List<Quiz> quizzes,
    @JsonKey(name: "activeQuiz") required final String? activeQuizId,
  }) = _Class;

  const Class._();

  Quiz? get activeQuiz => activeQuizId != null
      ? quizzes.where((final quiz) => quiz.id == activeQuizId).first
      : null;

  factory Class.fromJson(final Map<String, dynamic> json) =>
      _$ClassFromJson(json);
}
