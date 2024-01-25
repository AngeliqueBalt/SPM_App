import 'package:flutter/material.dart';

import '../../components/score_chart.dart';

class CurrentQuizScreen extends StatelessWidget {
  const CurrentQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Current Quiz",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFF99C24D),
        elevation: 0,
        toolbarHeight: 50,
      ),
      // TODO: display quiz just created in add new quiz screen
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30),
                  Container(
                    color: const Color(0xFF99C24D),
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Scores",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // TODO: get summary of all quiz scores from the database to be displayed
                  Center(
                    child: Container(
                      height: 250,
                      child: ScoreChart(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: const Color(0xFF99C24D),
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Quiz",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  // TODO: get the quiz questions and answers from the database to be displayed for each quiz
                  // TODO: get info from quiz overview screen?
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
