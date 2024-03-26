import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';

/// This widget displays the questions of a quiz.

class DisplayQuizQuestions extends ConsumerWidget {
  final Quiz quiz;

  const DisplayQuizQuestions({
    super.key,
    required this.quiz,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 750,
                    child: ListView.builder(
                      itemCount: quiz.questions.length,
                      itemBuilder: (final context, final index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Question ${index + 1}/${quiz.questions.length}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              quiz.questions[index].question,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            for (int i = 0;
                                i < quiz.questions[i].answers.length;
                                i++)
                              Text(
                                quiz.questions[index].answers[i].answer,
                                style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      quiz.questions[index].answers[i].isCorrect
                                          ? Colors.green
                                          : Colors.black,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
