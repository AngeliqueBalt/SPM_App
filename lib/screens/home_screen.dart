import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/components/navbar.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/partials/ClassCard.dart';

/// Opening page/dashboard for both teachers and students.
/// View of classes for the day and all classes.

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.classes});

  final List<Class> classes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: NavBar(classes: classes),
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
