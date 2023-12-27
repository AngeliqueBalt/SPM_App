import 'package:flutter/material.dart';

class TeacherPreviousQuizzesScreen extends StatelessWidget {
  const TeacherPreviousQuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Dashboard",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFF99C24D),
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: const SafeArea(
        child: Text("View previous quizzes"),
      ),
    );
  }
}
