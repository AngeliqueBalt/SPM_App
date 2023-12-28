import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/screens/student/quiz/data/questions.dart';
import 'package:student_progress_monitor_app/screens/student/quiz/result_screen.dart';

// TODO: Score should be saved to the database
// TODO: Quiz should be saved to the database so that can later be retrieved again

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _controller = PageController(initialPage: 0);

  bool isPressed = false;
  Color correctAns = Colors.green;
  Color wrongAns = Colors.red;
  Color btnColor = Colors.grey.shade300;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Quiz",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFF99C24D),
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1} / ${questions.length}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 30),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    questions[index].question,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Buttons for answer options
                  for (int i = 0; i < questions[index].answers.length; i++)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: MaterialButton(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        color: isPressed
                            ? questions[index].answers.entries.toList()[i].value
                                ? correctAns
                                : wrongAns
                            : btnColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  isPressed = true;
                                });
                                if (questions[index]
                                    .answers
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  score += 10;
                                  print(score);
                                }
                              },
                        child: Text(
                          questions[index].answers.keys.toList()[i],
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: isPressed
                            ? index + 1 == questions.length
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResultScreen(score: score),
                                      ),
                                    );
                                  }
                                : () {
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  }
                            : null,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        child: Text(
                          index + 1 == questions.length
                              ? "See Results"
                              : "Next Question",
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
