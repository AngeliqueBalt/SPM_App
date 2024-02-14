import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/user.dart';

class AdminTeacherList extends StatelessWidget {
  final List<User> teachers;

  const AdminTeacherList({super.key, required this.teachers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Teacher List",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var teachers
                  in teachers.where((user) => user.userType == "teacher")) ...[
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
                        "Full Name: ${teachers.name}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Email: ${teachers.email}",
                        style: const TextStyle(fontSize: 12),
                      ),
                      if (teachers.idNumber != null) ...[
                        const SizedBox(height: 10),
                        Text(
                          "ID Number: ${teachers.idNumber}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
