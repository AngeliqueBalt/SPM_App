import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'quizzes.chopper.dart';

/// Service for quizzes
/// This file contains the http requests to get all quizzes and add a new quiz.

@ChopperApi(baseUrl: '')
abstract class QuizzesService extends ChopperService {
  static QuizzesService create([final ChopperClient? client]) =>
      _$QuizzesService(client);

  // Get all quizzes
  @Get(path: '/class/{classId}/quiz')
  Future<RawApiResponse> getQuizzes({
    @Path('classId') required final String classId,
  });

  // Add new quiz
  @Post(path: '/class/{classId}/quiz')
  Future<RawApiResponse> addQuiz({
    @Path('classId') required final String classId,
    @Body() required final Map<String, dynamic> body,
  });
}
