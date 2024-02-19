import 'package:student_progress_monitor_app/models/quiz.dart';

class QuizReport {
  final Quiz quiz;
  final List<int>? scores;

  QuizReport({
    required this.quiz,
    this.scores,
  });
}
