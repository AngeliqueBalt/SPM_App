import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_students_list_screen.dart';

// Teachers can view details about each individual class
// Teachers can view the students in the class
// Teachers can assign a new quiz for the class
// Teachers can view the quiz history for the class
// Teachers can view an summary/average progress of whole class over all quizzes

class TeacherClassScreen extends StatelessWidget {
  const TeacherClassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class ..."),
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
                label: "View Students List",
                color: const Color(0xFF99C24D),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TeacherStudentListScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "Manage Quizzes",
                color: const Color(0xFF99C24D),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TeacherQuizScreen(),
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
