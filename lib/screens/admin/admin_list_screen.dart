import 'package:flutter/material.dart';
import 'package:student_progress_monitor_app/const/design.dart';

class AdminList extends StatelessWidget {
  const AdminList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Admin List",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [Text("List will go here")],
          ),
        ),
      ),
    );
  }
}
