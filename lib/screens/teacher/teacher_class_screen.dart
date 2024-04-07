import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/components/async_builder.dart';
import 'package:student_progress_monitor_app/partials/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/providers/class_provider.dart';
import 'package:student_progress_monitor_app/screens/teacher/students_list_screen.dart';

/// This screen is shown when a teacher selects a class from the home screen.
/// Teachers can view the list of students in the selected class.
/// Teachers can manage quizzes for the selected class.

class TeacherClassScreen extends ConsumerWidget {
  final String classId;

  const TeacherClassScreen({super.key, required this.classId});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return AsyncBuilder(
      selector: (final ref) => ref.watch(classInfoProvider(classId)),
      builder: (final context, final clazz) {
        return SafeArea(
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
                            StudentListScreen(students: clazz.students),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                OptionCard(
                  label: "Manage Quizzes",
                  color: greenColor,
                  onTap: () {
                    context.push('/class/$classId/manage-quizzes');
                  },
                ),
              ],
            ),
          ),
        );
      },
      shellBuilder: (final context, final child, final clazz) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(
              clazz?.name ?? "Loading...",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            backgroundColor: greenColor,
            elevation: 0,
            toolbarHeight: 50,
          ),
          body: child,
        );
      },
    );
  }
}
