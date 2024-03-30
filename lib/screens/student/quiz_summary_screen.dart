import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/data/mock/questions.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/partials/display_quiz_questions.dart';

/// The screen that displays the summary of a quiz
/// The summary includes the score and the questions and answers.

class QuizSummaryScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizSummaryScreen({
    super.key,
    required this.quiz,
  });

  @override
  State<QuizSummaryScreen> createState() => _QuizSummaryScreenState();
}

class _QuizSummaryScreenState extends State<QuizSummaryScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          ('${widget.quiz.name} Report'),
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
                // TODO(A): GET THE SCORE FROM THE DATABASE
                const Center(
                  child: Text(
                    "100",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                DisplayQuizQuestions(quiz: widget.quiz),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
