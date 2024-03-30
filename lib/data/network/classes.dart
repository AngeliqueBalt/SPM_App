import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'classes.chopper.dart';

/// Service for classes
/// This file contains the http requests to get the classes.

@ChopperApi(baseUrl: '/class')
abstract class ClassesService extends ChopperService {
  static ClassesService create([final ChopperClient? client]) =>
      _$ClassesService(client);

  // Get all quizzes
  @Get(path: '/{classId}/quizzes')
  Future<RawApiResponse> getQuizzes({
    @Path('classId') required final String classId,
  });

// set active quiz
  @Put(path: '/{classId}/activeQuiz')
  Future<RawApiResponse> setActiveQuiz({
    @Path('classId') required final String classId,
    @Body() required final Map<String, dynamic> body,
  });
}
