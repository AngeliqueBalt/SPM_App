import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission.g.dart';

part 'submission.freezed.dart';

@freezed
class Submission with _$Submission {
  const factory Submission({
    @JsonKey(name: 'quiz') required final String quizId,
    @JsonKey(name: 'class') required final String classId,
    @JsonKey(name: 'student') required final String studentId,
    required final DateTime submitted,
    required final int score,
  }) = _Submission;

  factory Submission.fromJson(final Map<String, dynamic> json) =>
      _$SubmissionFromJson(json);
}
