import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/screens/profile_screen.dart';

/// Teachers can view a list of all the students in each class.
/// Each students details can be viewed individually.

// TODO: list of classes will be pulled from database
const List _students = [
  'Student A',
  'Student B',
  'Student C',
  'Student D',
  'Student E',
  'Student F',
  'Student G',
  'Student H'
];

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Class List",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFF99C24D),
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  // Repeated for each student in the class
                  // TODO: list of students will be pulled from database
                  for (var theStudents in _students) ...[
                    const Divider(
                      color: Colors.grey,
                      height: 0,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 15),
                          Text(
                            "Full Name: $theStudents",
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Email: email@school",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "ID Number: 123456789",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
