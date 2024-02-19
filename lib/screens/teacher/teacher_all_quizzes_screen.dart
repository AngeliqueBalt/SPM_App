import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/partials/quiz_card.dart';

/// Teachers can view a list of all previously created/assigned quizzes.
/// Each quiz can then be further viewed to see a result summary and the question and answers.

class TeacherAllQuizzesScreen extends StatefulWidget {
  const TeacherAllQuizzesScreen({super.key});

  @override
  State<TeacherAllQuizzesScreen> createState() =>
      _TeacherAllQuizzesScreenState();
}

class _TeacherAllQuizzesScreenState extends State<TeacherAllQuizzesScreen> {
// TODO: list of quizzes will be pulled from database
  final List _quizzes = const [
    'Quiz A',
    'Quiz B',
    'Quiz C',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "All Quizzes",
          style: TextStyle(
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
                  const SizedBox(height: 20),
                  for (var theQuiz in _quizzes) ...[
                    QuizCard(name: theQuiz),
                    const SizedBox(height: 20),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
