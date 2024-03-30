import 'package:chopper/chopper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/submissions.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/submission.dart';

part 'submissions_provider.g.dart';

/// Provider to deal with the state of the submissions

@riverpod
class Submissions extends _$Submissions {
  @override
  Future<List<Submission>> build(
      final String classId, final String quizId) async {
    final response = await getApiService<SubmissionsService>()
        .getSubmission(classId: classId, quizId: quizId);

    return Api.unwrapList(Submission.fromJson, response)!.payload;
  }

  // New Submission
  Future<void> newSubmission({required final Map<String, dynamic> body}) async {
    final response = await getApiService<SubmissionsService>()
        .newSubmission(body: body, quizId: quizId, classId: classId);

    final data =
        Api.unwrap<Map<String, dynamic>>((final data) => data, response);

    if (data?.success ?? false) {
      final submission = Submission.fromJson(
          data?.payload["submission"] as Map<String, dynamic>);

      if (state.isLoading || state.hasError) {
        throw StateError(
            "Tried to update list of submissions while it was being updated");
      }

      final current = state.requireValue;

      state = AsyncData([...current, submission]);
    }
  }
}
