import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'submissions.chopper.dart';

/// Service for quiz submissions
/// This file contains the http requests to submit a quiz.

@ChopperApi(baseUrl: '')
abstract class SubmissionsService extends ChopperService {
  static SubmissionsService create([final ChopperClient? client]) =>
      _$SubmissionsService(client);

  // New submission
  @Post(path: '/class/{classId}/quiz/{quizId}/submission')
  Future<RawApiResponse> newSubmission({
    @Path('quizId') required final String quizId,
    @Path('classId') required final String classId,
    @Body() required final Map<String, dynamic> body,
  });

  // Get submission
  @Get(path: '/class/{classId}/quiz/{quizId}/submission')
  Future<RawApiResponse> getSubmission({
    @Path('classId') required final String classId,
    @Path('quizId') required final String quizId,
  });
}
