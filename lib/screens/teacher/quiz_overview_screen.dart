import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/data/mock/questions.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/partials/display_quiz_questions.dart';
import 'package:student_progress_monitor_app/providers/quiz_provider.dart';
import 'package:student_progress_monitor_app/screens/teacher/manage_quiz_screen.dart';

/// The screen that displays the quiz overview.
/// This screen allows the teacher to preview the quiz before saving it.

class QuizOverviewScreen extends ConsumerStatefulWidget {
  final Quiz quiz;

  const QuizOverviewScreen({super.key, required this.quiz});

  @override
  ConsumerState<QuizOverviewScreen> createState() => _QuizOverviewScreenState();
}

class _QuizOverviewScreenState extends ConsumerState<QuizOverviewScreen> {
  late final TextEditingController _quizNameController;

  @override
  void initState() {
    _quizNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _quizNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Preview",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 750,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DisplayQuizQuestions(quiz: widget.quiz),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Save button
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () async {
                  await showDialog<String>(
                    context: context,
                    builder: (final context) => AlertDialog(
                      title: const Text("Enter quiz name"),
                      content: TextField(
                        controller: _quizNameController,
                        decoration: const InputDecoration(
                          hintText: "Enter the quiz name",
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      actions: [
                        OutlinedButton(
                          onPressed: () async {
                            await ref
                                .read(quizzesProvider(widget.quiz.classId)
                                    .notifier)
                                .addQuiz(body: {
                              "name": _quizNameController.text.trim(),
                              "questions": widget.quiz.questions
                                  .map((final question) => question.toJson())
                                  .toList(),
                            });

                            if (context.mounted) {
                              context.pushReplacement(
                                  '/class/${widget.quiz.classId}/manage-quizzes');
                            }
                          },
                          child: const Text("Save"),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Save Quiz"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
