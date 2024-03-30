import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/partials/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    return OptionCard(
      label: quiz.name,
      color: greenColor,
      onTap: () => context.push('/class/${quiz.classId}/quiz/${quiz.id}'),
    );
  }
}
