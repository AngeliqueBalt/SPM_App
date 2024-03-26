import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/partials/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/screens/teacher/manage_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/students_list_screen.dart';

/// This screen is shown when a teacher selects a class from the home screen.
/// Teachers can view the list of students in the selected class.
/// Teachers can manage quizzes for the selected class.

class TeacherClassScreen extends StatelessWidget {
  final Class clazz;

  const TeacherClassScreen({super.key, required this.clazz});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          clazz.name,
          style: const TextStyle(
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
              OptionCard(
                label: "View Students List",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (final context) =>
                          StudentListScreen(students: clazz.students!),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "Manage Quizzes",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (final context) =>
                          ManageQuizScreen(clazz: clazz),
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
