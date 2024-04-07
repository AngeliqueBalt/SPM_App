import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/components/async_builder.dart';
import 'package:student_progress_monitor_app/partials/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/providers/submissions_provider.dart';
import 'package:student_progress_monitor_app/screens/student/quiz/quiz_screen.dart';

/// Students can view each of their classes.
/// Students can take a quiz that has been assigned to them.
/// Students can view all previous quizzes they have taken.

class StudentClassScreen extends StatelessWidget {
  final Class clazz;

  const StudentClassScreen({super.key, required this.clazz});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          clazz.name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              AsyncBuilder(
                  selector: (final ref) =>
                      ref.watch(classActiveQuizSubmissionProvider(clazz.id)),
                  builder: (final context, final activeQuizSubmission) {
                    final bool completedActiveQuiz =
                        activeQuizSubmission != null;
                    return Column(
                      children: [
                        if (clazz.activeQuiz != null &&
                            !completedActiveQuiz) ...[
                          OptionCard(
                            label: "Take Quiz",
                            color: greenColor,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (final context) => QuizScreen(
                                    quiz: clazz.activeQuiz!,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ]
                      ],
                    );
                  }),
              // Quiz List
              OptionCard(
                label: "Past Quizzes",
                color: greenColor,
                onTap: () {
                  context.push('/class/${clazz.id}/all-quizzes');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
