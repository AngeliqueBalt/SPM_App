import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';

class RegisterNewClass extends StatelessWidget {
  const RegisterNewClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Add New Class",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
    );
  }
}
