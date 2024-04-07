import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/async_builder.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/partials/quiz_summary_card.dart';
import 'package:student_progress_monitor_app/providers/submissions_provider.dart';

/// Students can view each of the previous quizzes they have taken.
/// They can see the score they got on each quiz.
/// They can see the questions and answers and with the answers.

class SubmissionsScreen extends StatelessWidget {
  final String classId;

  const SubmissionsScreen({
    super.key,
    required this.classId,
  });

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Past Quizzes",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: AsyncBuilder(
          selector: (final ref) => ref.watch(classSubmissionsProvider(classId)),
          builder: (final context, final submissions) {
            if (submissions.isEmpty) {
              return const Center(
                child: Text(
                  "You have not submitted a quiz yet.",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      for (final submission in submissions) ...[
                        QuizSummaryCard(
                            classId: classId, quizId: submission.quizId),
                        const SizedBox(height: 20),
                      ],
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
