import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/async_builder.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/partials/display_quiz_questions.dart';
import 'package:student_progress_monitor_app/providers/quiz_provider.dart';
import 'package:student_progress_monitor_app/providers/submissions_provider.dart';

/// The screen that displays the summary of a quiz
/// The summary includes the score and the questions and answers.

class QuizSummaryScreen extends StatelessWidget {
  final String classId;
  final String quizId;

  const QuizSummaryScreen({
    super.key,
    required this.classId,
    required this.quizId,
  });

  @override
  Widget build(final BuildContext context) {
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
        builder: (final context, final quiz) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        color: greenColor,
                        height: 30,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Score",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AsyncBuilder(
                          selector: (final ref) =>
                              ref.watch(submissionInfoProvider(quizId)),
                          builder: (final context, final submission) {
                            return Center(
                              child: Text(
                                "${submission!.score}%",
                                style: const TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }),
                      const SizedBox(height: 20),
                      Container(
                        color: greenColor,
                        height: 30,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Quiz Summary",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
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
        });
  }
}
