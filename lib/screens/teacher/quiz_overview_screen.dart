import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizOverviewScreen extends StatelessWidget {
  const QuizOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Quiz Overview",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFF99C24D),
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          const Row(
            children: [
              // TODO: reshow the quiz questions and answers
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Save button
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                // TODO: when pressed, saves quiz and redirects to manage quizzes screen
                onPressed: () {
                  context.pushReplacement('/manage-quizzes');
                },
                child: const Text("Save Quiz"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
