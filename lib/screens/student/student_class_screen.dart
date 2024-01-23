import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/screens/student/all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/student/quiz/quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/manage_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/students_list_screen.dart';

// Teachers can view details about each individual class
// Teachers can view the students in the class
// Teachers can assign a new quiz for the class
// Teachers can view the quiz history for the class
// Teachers can view an summary/average progress of whole class over all quizzes

/// Students can view each of their classes.
/// Students can take a quiz that has been assigned to them.
/// Students can view all previous quizzes they have taken.
///
class StudentClassScreen extends StatelessWidget {
  final String name;

  const StudentClassScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
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
                label: "Take Quiz",
                color: const Color(0xFF99C24D),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "View All Quizzes",
                color: const Color(0xFF99C24D),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AllQuizzesScreen(),
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
