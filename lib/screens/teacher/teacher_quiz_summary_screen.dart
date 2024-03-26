import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/score_chart.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/data/mock/questions.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/partials/display_quiz_questions.dart';

class TeacherQuizSummaryScreen extends StatefulWidget {
  final Quiz quiz;

  const TeacherQuizSummaryScreen({
    super.key,
    required this.quiz,
  });

  @override
  State<TeacherQuizSummaryScreen> createState() =>
      _TeacherQuizSummaryScreenState();
}

class _TeacherQuizSummaryScreenState extends State<TeacherQuizSummaryScreen> {
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
                  const SizedBox(height: 15),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("Activate Quiz"),
                  ),
                  const SizedBox(height: 15),
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
                  // TODO(A): get summary of all quiz scores from the database to be displayed
                  const Center(
                    child: SizedBox(
                      height: 250,
                      child: ScoreChart(),
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
                  // TODO(A): get the quiz questions and answers from the database to be displayed for each quiz
                  DisplayQuizQuestions(quiz: widget.quiz),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
