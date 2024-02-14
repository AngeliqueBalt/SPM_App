import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';

class DisplayQuizQuestions extends StatelessWidget {
  final List<Question> questions;

  const DisplayQuizQuestions({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                child: SizedBox(
                  height: 750,
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Question ${index + 1}/${questions.length}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            questions[index].question,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          for (int i = 0; i < questions[i].answers.length; i++)
                            Text(
                              questions[index].answers[i].answer,
                              style: TextStyle(
                                fontSize: 15,
                                color: questions[index].answers[i].isCorrect
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
            ]),
          ),
        ],
      ),
    );
  }
}
