import 'package:chopper/chopper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/quizzes.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';

part 'quiz_provider.g.dart';

@riverpod
class Quizzes extends _$Quizzes {
  @override
  Future<List<Quiz>> build(final String classId) async {
    final response =
        await getApiService<QuizzesService>().getQuizzes(classId: classId);
    return Api.unwrapList(Quiz.fromJson, response)!.payload;
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => build(classId));
  }

  Future<void> addQuiz({required final Map<String, dynamic> body}) async {
    final response = await getApiService<QuizzesService>()
        .addQuiz(classId: classId, body: body);

    final data =
        Api.unwrap<Map<String, dynamic>>((final data) => data, response);

    // print(data);

    if (data?.success ?? false) {
      final quiz = Quiz.fromJson(data?.payload["quiz"] as Map<String, dynamic>);

      if (state.isLoading || state.hasError) {
        throw StateError(
            "Tried to update list of quizzes while it was being updated");
      }

      final current = state.requireValue;

      state = AsyncData([...current, quiz]);
    }
  }
}
