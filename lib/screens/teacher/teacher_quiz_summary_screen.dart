import 'package:flutter/material.dart';

class TeacherQuizSummaryScreen extends StatefulWidget {
  final String name;

  const TeacherQuizSummaryScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<TeacherQuizSummaryScreen> createState() =>
      _TeacherQuizSummaryScreenState();
}

class _TeacherQuizSummaryScreenState extends State<TeacherQuizSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Teacher Quiz Summary Screen",
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     iconTheme: const IconThemeData(color: Colors.white),
    //     title: Text(
    //       ('${widget.name} Summary'),
    //       style: const TextStyle(
    //           color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
    //     ),
    //     backgroundColor: const Color(0xFF99C24D),
    //     elevation: 0,
    //     toolbarHeight: 50,
    //   ),
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: [
    //               const SizedBox(height: 30),
    //               Container(
    //                 color: const Color(0xFF99C24D),
    //                 height: 30,
    //                 child: const Padding(
    //                   padding: EdgeInsets.only(left: 10),
    //                   child: Text(
    //                     "Average Score",
    //                     style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(height: 20),
    //               // TODO: get summary of all quiz scores from the database to be displayed
    //               const Center(
    //                 child: Text(
    //                   "Average score",
    //                 ),
    //               ),
    //               const SizedBox(height: 20),
    //               Container(
    //                 color: const Color(0xFF99C24D),
    //                 height: 30,
    //                 child: const Padding(
    //                   padding: EdgeInsets.only(left: 10),
    //                   child: Text(
    //                     "Quiz Summary",
    //                     style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white),
    //                   ),
    //                 ),
    //               ),
    //               // TODO: get the quiz questions and answers from the database to be displayed for each quiz
    //               // TODO: get info from quiz overview screen?
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
