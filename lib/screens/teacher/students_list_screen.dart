import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/screens/profile_screen.dart';

// Teachers can view a list of all the students in a class
// Teachers can edit the details of a student
// Teachers can add or remove students from the class list

// List of students will be pulled from server
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
                  Container(
                    color: const Color(0xFF99C24D),
                    height: 30,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "All Students",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  for (var theClass in _students) ...[
                    OptionCard(
                      label: theClass,
                      color: const Color(0xFF99C24D),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 300,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text('Student Profile',
                                        style: TextStyle(fontSize: 25)),
                                    const SizedBox(height: 20),
                                    Text("Full Name: $theClass",
                                        style: const TextStyle(fontSize: 20)),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Email: email@school",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "ID Number: 123456789",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      child: const Text('Close'),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 20),
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
