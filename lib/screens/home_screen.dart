import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:student_progress_monitor_app/components/navbar.dart';
import 'package:student_progress_monitor_app/components/option_card.dart';
import 'package:student_progress_monitor_app/data/classes.dart';
import 'package:student_progress_monitor_app/data/users.dart';
import 'package:student_progress_monitor_app/models/class_model.dart';
import 'package:student_progress_monitor_app/models/user_model.dart';
import 'package:student_progress_monitor_app/partials/ClassCard.dart';

/// Opening page/dashboard for both teachers and students.
/// View of classes for the day and all classes.

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user, required this.classes});

  final UserModel user;
  final List<ClassModel> classes;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(user: widget.user, classes: classes),
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
                        "All Classes",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  for (var lesson in classes) ...[
                    ClassCard(lesson: lesson),
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
