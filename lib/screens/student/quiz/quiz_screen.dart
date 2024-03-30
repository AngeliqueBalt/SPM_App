import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/quiz.dart';
import 'package:student_progress_monitor_app/screens/student/quiz/result_screen.dart';

/// The most recent quiz assigned to the student.
/// Students answer questions and are given a score at the end.

class QuizScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizScreen({
    super.key,
    required this.quiz,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isPressed = false;
  Color correctAns = Colors.green;
  Color wrongAns = Colors.red;
  Color btnColor = Colors.grey.shade300;
  int score = 0;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.quiz.name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (final page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: widget.quiz.questions.length,
            itemBuilder: (final context, final index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1} / ${widget.quiz.questions.length}",
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
                    widget.quiz.questions[index].question,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // Buttons for answer options
                  for (int i = 0;
                      i < widget.quiz.questions[index].answers.length;
                      i++)
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
                            ? widget.quiz.questions[index].answers[i].isCorrect
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
                                if (widget.quiz.questions[index].answers[i]
                                    .isCorrect) {
                                  score += 10;
                                }
                              },
                        child: Text(
                          widget.quiz.questions[index].answers[i].answer,
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
                      // Goes to next question
                      // once reaches the end, redirects to result screen
                      OutlinedButton(
                        onPressed: isPressed
                            ? index + 1 == widget.quiz.questions.length
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (final context) =>
                                            ResultScreen(score: score),
                                      ),
                                    );
                                  }
                                : () {
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 600),
                                        curve: Curves.ease);
                                    isPressed = false;
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
                          index + 1 == widget.quiz.questions.length
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
