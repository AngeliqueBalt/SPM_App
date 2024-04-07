import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/submissions.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/submission.dart';
import 'package:student_progress_monitor_app/providers/class_provider.dart';

part 'submissions_provider.g.dart';

/// Provider to deal with the state of the submissions

@riverpod
class Submissions extends _$Submissions {
  @override
  Future<List<Submission>> build() async {
    final response = await getApiService<SubmissionsService>().getSubmissions();
    return Api.unwrapList(Submission.fromJson, response).payload;
  }

  // New Submission
  Future<void> newSubmission({
    required final String classId,
    required final String quizId,
    required final int score,
  }) async {
    final response = await getApiService<SubmissionsService>().newSubmission(
      body: {"score": score},
      quizId: quizId,
      classId: classId,
    );

    final data =
        Api.unwrap<Map<String, dynamic>>((final data) => data, response);

    if (data.success) {
      ref.invalidateSelf();
      state = AsyncData(await build());
    }
  }
}

@riverpod
Future<List<Submission>> classSubmissions(
    final ClassSubmissionsRef ref, final String classId) async {
  return await ref.watch(submissionsProvider.selectAsync((final value) => value
      .where((final Submission submission) => submission.classId == classId)
      .toList()));
}

@riverpod
Future<Submission?> submissionInfo(
    final SubmissionInfoRef ref, final String quizId) async {
  return await ref.watch(submissionsProvider.selectAsync((final value) => value
      .where((final Submission submission) => submission.quizId == quizId)
      .firstOrNull));
}

@riverpod
Future<Submission?> classActiveQuizSubmission(
    final ClassActiveQuizSubmissionRef ref, final String classId) async {
  final classInfo = await ref.watch(classInfoProvider(classId).future);
  if (classInfo.activeQuiz == null) return null;
  return await ref
      .watch(submissionInfoProvider(classInfo.activeQuiz!.id).future);
}
