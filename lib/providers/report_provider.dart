import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/reports.dart';
import 'package:student_progress_monitor_app/domain/exception.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/report.dart';

part 'report_provider.g.dart';

@riverpod
Future<Report?> report(final ReportRef ref, final String quizId) async {
  final response =
      await getApiService<ReportServices>().getScores(quizId: quizId);

  final data = Api.unwrapNullable(Report.fromJson, response);

  if (data.success) {
    return data.payload;
  } else {
    throw SPMException(
      (response.error as Map<String, dynamic>)['message'] as String? ??
          'There was an unexpected error getting the score report.',
    );
  }
}
