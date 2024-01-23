import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/screens/teacher/quiz_overview_screen.dart';

/// A form to create a new quiz.
/// Teachers can fill into the form to create a new quiz, giving the question and answer options and mark the correct answer.
/// After creating the quiz, the teacher can view the quiz overview screen to see the quiz they just created and save the quiz.

class NewQuizScreen extends StatefulWidget {
  const NewQuizScreen({super.key});

  @override
  State<NewQuizScreen> createState() => _NewQuizScreenState();
}

class _NewQuizScreenState extends State<NewQuizScreen> {
  bool isPressed = false;
  final PageController _controller = PageController(initialPage: 0);
  bool isCheckedOption1 = false;
  bool isCheckedOption2 = false;
  bool isCheckedOption3 = false;
  bool isCheckedOption4 = false;

  // TODO: questions should be saved to the database
  // TODO: if checkbox is checked, then that is the correct answer
  // TODO: when go to next question, the previous question should be kept till save button is pressed (so that the teacher can go back and edit the question)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Create new Quiz",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFF99C24D),
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1}/10",
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 28),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Quiz form
                  const Text(
                    "Enter Question",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your question here",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Enter Answer Options",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 12,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter option 1",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          // width : 10,
                          child: Checkbox(
                            value: isCheckedOption1,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedOption1 = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 12,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter option 2",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          // width : 10,
                          child: Checkbox(
                            value: isCheckedOption2,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedOption2 = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 12,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter option 3",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          // width : 10,
                          child: Checkbox(
                            value: isCheckedOption3,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedOption3 = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 12,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter option 4",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          // width : 10,
                          child: Checkbox(
                            value: isCheckedOption4,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedOption4 = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  // Buttons for next question and save question
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: index + 1 == 10
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const QuizOverviewScreen(),
                                  ),
                                );
                              }
                            : () {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.ease);
                                isPressed = false;
                              },
                        child: Text(
                          index + 1 == 10 ? "View Quiz" : "Next Question",
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
