import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';

class QuizCard extends StatelessWidget {
  final String name;

  const QuizCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(final BuildContext context) {
    return OptionCard(
      label: name,
      color: greenColor,
      onTap: () => context.push('/all-quizzes/quiz/$name'),
    );
  }
}
