import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';

/// This widget displays the questions of a quiz.

class DisplayQuizQuestions extends ConsumerWidget {
  final Quiz quiz;
  final bool shrinkWrap;

  const DisplayQuizQuestions({
    super.key,
    required this.quiz,
    this.shrinkWrap = false,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
              shrinkWrap: shrinkWrap,
              itemCount: quiz.questions.length,
              itemBuilder: (final context, final index) {
                final question = quiz.questions[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${index + 1}/${quiz.questions.length}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      question.question,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    for (final answer in question.answers)
                      Text(
                        answer.answer,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: answer.isCorrect ? greenColor : Colors.black,
                        ),
                      ),
                    const Divider(
                      height: 20,
                      thickness: 2,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
