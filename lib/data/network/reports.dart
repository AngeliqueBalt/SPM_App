import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'reports.chopper.dart';

@ChopperApi(baseUrl: 'report')
abstract class ReportServices extends ChopperService {
  static ReportServices create([final ChopperClient? client]) =>
      _$ReportServices(client);

  // Get scores
  @Get(path: '/quiz/{quizId}')
  Future<RawApiResponse> getScores({
    @Path('quizId') required final String quizId,
  });
}
