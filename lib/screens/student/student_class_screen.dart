import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/data/mock/questions.dart';
import 'package:student_progress_monitor_app/screens/student/all_quizzes_screen.dart';
import 'package:student_progress_monitor_app/screens/student/quiz/quiz_screen.dart';

/// Students can view each of their classes.
/// Students can take a quiz that has been assigned to them.
/// Students can view all previous quizzes they have taken.
///
class StudentClassScreen extends StatelessWidget {
  final String name;

  const StudentClassScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // TODO: IF NO QUIZ - ADD DIALOG TO SAY NO QUIZ TO TAKE
              OptionCard(
                label: "Take Quiz",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        quiz: sampleQuiz,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              OptionCard(
                label: "All Quizzes",
                color: greenColor,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AllQuizzesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
