import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/providers/submissions_provider.dart';

/// Students can view the result from the quiz they have just taken.
/// Students can then return to the list of all previous quizzes they have taken.

class ResultScreen extends ConsumerWidget {
  final int score;
  final String classId;
  final String quizId;

  const ResultScreen({
    required this.score,
    required this.classId,
    required this.quizId,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return Scaffold(
      backgroundColor: greenColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Well Done!",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                "Your score is",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                "$score%",
                style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 60),
              // Redirects to the list of all quizzes
              OutlinedButton(
                onPressed: () async {
                  await ref
                      .read(submissionsProvider(classId, quizId).notifier)
                      .newSubmission(body: {
                    "score": score,
                  });

                  if (context.mounted) {
                    context.pushReplacement('/class/$classId/all-quizzes');
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
