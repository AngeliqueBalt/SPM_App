import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/screens/teacher/current_quiz_screen.dart';
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
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Manage Quizzes",
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
            children: [
              const SizedBox(height: 20),
              // redirects to form to create new quiz
              OptionCard(
                label: "Add New Quiz",
                color: greenColor,
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
                label: "Current Quiz",
                color: const Color(0xFF99C24D),
                // TODO: when pressed, shows current quiz/quiz that was just added
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CurrentQuizScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // redirects to a list of all previous quizzes
              OptionCard(
                label: "Quiz History",
                color: greenColor,
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
