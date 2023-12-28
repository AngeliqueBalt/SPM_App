import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/screens/teacher/new_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_previous_quizzes_screen.dart';

// Teachers can make quizzes and assign them to a class(es)
// Teachers can see all previous quizzes they have made
// Teachers can review results/summary of each quiz

class ManageQuizScreen extends StatelessWidget {
  const ManageQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Quizzes"),
        backgroundColor: const Color(0xFF99C24D),
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              OptionCard(
                label: "Add New Quiz",
                color: const Color(0xFF99C24D),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NewQuizScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "View Previous Quizzes",
                color: const Color(0xFF99C24D),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const TeacherPreviousQuizzesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
