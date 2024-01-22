import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';

class QuizCard extends StatelessWidget {
  final String name;

  const QuizCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return OptionCard(
      label: name,
      color: const Color(0xFF99C24D),
      onTap: () => {print(name)},
      // onTap: () => context.go('/quiz/$name'),
    );
  }
}
