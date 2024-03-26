import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/providers/quiz_provider.dart';
import 'package:student_progress_monitor_app/screens/teacher/new_quiz_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/teacher/teacher_quiz_summary_screen.dart';

/// Where teachers can manage quizzes for the class previously selected.
/// Teachers can add a new quiz, view the current quiz, or view all previous quizzes.

class ManageQuizScreen extends ConsumerWidget {
  final Class clazz;

  const ManageQuizScreen({super.key, required this.clazz});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final quizzes = ref.watch(quizzesProvider(clazz.id).future);

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
              // print(snapshot);

              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              // final quizzes = snapshot.data!;
              // print(quizzes);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // redirects to form to create new quiz
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
                    // redirects to view the most recently added quiz
                    if (clazz.activeQuiz != null)
                      OptionCard(
                        label: "Current Quiz",
                        color: greenColor,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (final context) =>
                                  TeacherQuizSummaryScreen(
                                      quiz: clazz.activeQuiz!),
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 20),
                    // redirects to a list of all previous quizzes
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
            }),
      ),
    );
  }
}
