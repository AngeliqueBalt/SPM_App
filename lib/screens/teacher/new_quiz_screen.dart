import 'package:flutter/material.dart';

class NewQuizScreen extends StatefulWidget {
  const NewQuizScreen({super.key});

  @override
  State<NewQuizScreen> createState() => _NewQuizScreenState();
}

class _NewQuizScreenState extends State<NewQuizScreen> {
  bool btnPressed = false;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

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
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter option 1",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter option 2",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter option 3",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter option 4",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF99C24D),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        // TODO: When pressed, save the question to the database
                        onPressed: () {},
                        child: const Text(
                          "Save Question",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF99C24D),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        // TODO: When pressed, go to next question
                        onPressed: () {
                          _controller!.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut);

                          setState(() {
                            btnPressed = false;
                          });
                        },
                        child: const Text(
                          "Next Question",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
