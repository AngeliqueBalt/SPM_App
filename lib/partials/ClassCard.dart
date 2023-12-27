import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';

class ClassCard extends StatelessWidget {
  final String name;

  const ClassCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return OptionCard(
      label: name,
      color: const Color(0xFF99C24D),
      onTap: () => context.go('/class/$name'),
    );
  }
}
