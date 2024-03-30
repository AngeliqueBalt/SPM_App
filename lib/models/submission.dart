import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/models/user.dart';

part 'submission.g.dart';

part 'submission.freezed.dart';

@freezed
class Submission with _$Submission {
  const factory Submission({
    required final Quiz quiz,
    required final User student,
    required final int score,
  }) = _Submission;

  factory Submission.fromJson(final Map<String, dynamic> json) =>
      _$SubmissionFromJson(json);
}
