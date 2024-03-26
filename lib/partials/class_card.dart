import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';

class ClassCard extends StatelessWidget {
  final Class lesson;

  const ClassCard({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(final BuildContext context) {
    return OptionCard(
      // label: name,
      label: lesson.name,
      color: greenColor,
      onTap: () => context.go('/class/${lesson.name}'),
    );
  }
}
