import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';

class AdminStudentList extends StatelessWidget {
  const AdminStudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Student List",
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
            children: [Text("List will go here")],
          ),
        ),
      ),
    );
  }
}
