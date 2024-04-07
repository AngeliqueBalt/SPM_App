import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/components/async_builder.dart';
import 'package:student_progress_monitor_app/partials/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/providers/quiz_provider.dart';

class QuizSummaryCard extends StatelessWidget {
  final String classId;
  final String quizId;

  const QuizSummaryCard(
      {super.key, required this.classId, required this.quizId});

  @override
  Widget build(final BuildContext context) {
    return AsyncBuilder(
      selector: (final ref) => ref.watch(quizInfoProvider(classId, quizId)),
      builder: (final context, final quiz) {
        return OptionCard(
          label: quiz.name,
          color: greenColor,
          onTap: () => context.push('/class/$classId/quiz/$quizId'),
        );
      },
    );
  }
}
