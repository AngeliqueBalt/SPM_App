import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/screens/teacher/manage_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/students_list_screen.dart';

/// This screen is shown when a teacher selects a class from the home screen.
/// Teachers can view the list of students in the selected class.
/// Teachers can manage quizzes for the selected class.

class TeacherClassScreen extends StatelessWidget {
  final String name;

  const TeacherClassScreen({
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
                label: "View Students List",
                color: const Color(0xFF99C24D),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StudentListScreen(),
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
                      builder: (context) => const ManageQuizScreen(),
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
