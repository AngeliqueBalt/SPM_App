import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/partials/display_quiz_questions.dart';

class QuizOverviewScreen extends StatefulWidget {
  final List<Question> questions;

  const QuizOverviewScreen({super.key, required this.questions});

  @override
  State<QuizOverviewScreen> createState() => _QuizOverviewScreenState();
}

class _QuizOverviewScreenState extends State<QuizOverviewScreen> {
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
                  DisplayQuizQuestions(questions: widget.questions),
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
                          hintText: "Enter your question here",
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      actions: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop(_quizNameController.text);
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    ),
                  );

                  // TODO(A): make JSON
                  // jsonEncode(
                  //   questions.map((question) => question.toJson()).toList(),
                  // ),

                  // TODO(A): send to cinnamon

                  // context.pushReplacement('/manage-quizzes');
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
