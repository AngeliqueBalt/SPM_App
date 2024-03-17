import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';

class QuizCard extends StatelessWidget {
  final String name;
  final Class clazz;

  const QuizCard({
    super.key,
    required this.name,
    required this.clazz,
  });

  @override
  Widget build(final BuildContext context) {
    return OptionCard(
      label: name,
      color: greenColor,
      onTap: () => context.push('/class/${clazz.id}/all-quizzes/quiz/$name'),
    );
  }
}
