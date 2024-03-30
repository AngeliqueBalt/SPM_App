import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/partials/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/providers/class_provider.dart';
import 'package:student_progress_monitor_app/providers/quiz_provider.dart';
import 'package:student_progress_monitor_app/screens/teacher/new_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_quiz_summary_screen.dart';

/// Where teachers can manage quizzes for the class previously selected.
/// Teachers can add a new quiz, view the current quiz, or view all previous quizzes.

class ManageQuizScreen extends ConsumerWidget {
  final String classId;

  const ManageQuizScreen({super.key, required this.classId});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final clazz = ref.watch(classInfoProvider(classId)).requireValue;
    final quizzes = ref.watch(quizzesProvider(classId).future);

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
        child: FutureBuilder(
          future: quizzes,
          builder: (final context, final snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Redirects to form to create new quiz
                  OptionCard(
                    label: "Add New Quiz",
                    color: greenColor,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (final context) =>
                              NewQuizScreen(clazz: clazz),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Redirects to view the most recently added quiz
                  if (clazz.activeQuiz != null) ...[
                    OptionCard(
                      label: "Current Quiz",
                      color: greenColor,
                      onTap: () {
                        context.push(
                            '/class/$classId/quiz/${clazz.activeQuiz!.id}');
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                  // Redirects to a list of all quizzes
                  OptionCard(
                    label: "All Quizzes",
                    color: greenColor,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (final context) =>
                              TeacherAllQuizzesScreen(clazz: clazz),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
