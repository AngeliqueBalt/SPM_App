import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/partials/QuizCard.dart';

import '../../partials/ClassCard.dart';

/// Students can view each of the previous quizzes they have taken.
/// They can see the score they got on each quiz.
/// They can see the questions and answers and with the answers.

class AllQuizzesScreen extends StatefulWidget {
  const AllQuizzesScreen({super.key});

  @override
  State<AllQuizzesScreen> createState() => _AllQuizzesScreenState();
}

class _AllQuizzesScreenState extends State<AllQuizzesScreen> {
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
          "All Previous Quizzes",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFF99C24D),
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
                  for (var theClass in _quizzes) ...[
                    QuizCard(name: theClass),
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
