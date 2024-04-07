import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/components/async_builder.dart';
import 'package:student_progress_monitor_app/partials/score_chart.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/partials/display_quiz_questions.dart';
import 'package:student_progress_monitor_app/providers/class_provider.dart';
import 'package:student_progress_monitor_app/providers/quiz_provider.dart';

/// The screen that displays the summary of a quiz
/// The summary includes the a summary of the scores archived by students and the questions and answers.

class TeacherQuizSummaryScreen extends ConsumerWidget {
  final String quizId;
  final String classId;

  const TeacherQuizSummaryScreen({
    super.key,
    required this.quizId,
    required this.classId,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return AsyncBuilder(
      selector: (final ref) => ref.watch(quizInfoProvider(classId, quizId)),
      shellBuilder: (final context, final child, final quiz) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(
              quiz != null ? '${quiz.name} Report' : 'Loading...',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            backgroundColor: greenColor,
            elevation: 0,
            toolbarHeight: 50,
          ),
          body: child,
        );
      },
      builder: (final BuildContext context, final Quiz quiz) {
        final selected =
            ref.watch(classInfoProvider(classId)).valueOrNull?.activeQuiz?.id ==
                quizId;

        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (selected)
                        OutlinedButton(
                          onPressed: () async {
                            await ref
                                .read(quizzesProvider(classId).notifier)
                                .setActiveQuiz(null);
                          },
                          child: const Text("Deactivate Quiz"),
                        )
                      else
                        OutlinedButton(
                          onPressed: () async {
                            await ref
                                .read(quizzesProvider(classId).notifier)
                                .setActiveQuiz(quiz);
                          },
                          child: const Text("Activate Quiz"),
                        )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: greenColor,
                      height: 30,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Scores",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        height: 250,
                        child: ScoreChart(quizId: quizId),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      color: greenColor,
                      height: 30,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Quiz",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    DisplayQuizQuestions(
                      quiz: quiz,
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
