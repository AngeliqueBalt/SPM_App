import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/score_chart.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/partials/display_quiz_questions.dart';

class TeacherQuizSummaryScreen extends StatefulWidget {
  final String name;

  const TeacherQuizSummaryScreen({
    super.key,
    required this.name,
  });

  @override
  State<TeacherQuizSummaryScreen> createState() =>
      _TeacherQuizSummaryScreenState();
}

class _TeacherQuizSummaryScreenState extends State<TeacherQuizSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          ('${widget.name} Report'),
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
                        "Scores",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // TODO: get summary of all quiz scores from the database to be displayed
                  Center(
                    child: Container(
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
                  const SizedBox(height: 20),
                  // TODO: get the quiz questions and answers from the database to be displayed for each quiz
                  // DisplayQuizQuestions(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
