import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/data/questions.dart';

import '../routes.dart';

class DisplayQuizQuestions extends StatelessWidget {
  const DisplayQuizQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isTeacher)
            const Text(
                "Note: Only the correct answers are shown, not your own."),
          if (!isTeacher)
            const Divider(
              height: 20,
              thickness: 1,
            ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                              questions[index].answers.keys.elementAt(i),
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    questions[index].answers.values.elementAt(i)
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