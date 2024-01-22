import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/partials/QuizCard.dart';

import '../../partials/ClassCard.dart';

class AllQuizzesScreen extends StatefulWidget {
  const AllQuizzesScreen({super.key});

  @override
  State<AllQuizzesScreen> createState() => _AllQuizzesScreenState();
}

class _AllQuizzesScreenState extends State<AllQuizzesScreen> {
  // List of previous quizzes will be pulled from server
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
                  const SizedBox(height: 30),
                  Container(
                    color: const Color(0xFF99C24D),
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "All Classes",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
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
