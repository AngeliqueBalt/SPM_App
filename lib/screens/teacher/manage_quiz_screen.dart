import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/screens/teacher/new_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_all_quizzes_screen.dart';

/// Where teachers can manage quizzes for the class previously selected.
/// Teachers can add a new quiz, view the current quiz, or view all previous quizzes.

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
              // redirects to form to create new quiz
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
              // redirects to view the most recently added quiz
              OptionCard(
                label: "View Current Quiz",
                color: const Color(0xFF99C24D),
                // TODO: when pressed, shows current quiz/quiz that was just added
                onTap: () {},
              ),
              const SizedBox(height: 20),
              // redirects to a list of all previous quizzes
              OptionCard(
                label: "All Previous Quizzes",
                color: const Color(0xFF99C24D),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TeacherAllQuizzesScreen(),
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
