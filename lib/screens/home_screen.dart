import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/partials/class_card.dart';
import 'package:student_progress_monitor_app/partials/navbar.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/providers/class_provider.dart';

/// Opening page/dashboard for both teachers and students.
/// View all classes.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "All Classes",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: Consumer(
          builder: (final context, final ref, final child) {
            final classesState = ref.watch(classesProvider);

            if (classesState.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final classes = classesState.requireValue;

            if (classes.isEmpty) {
              return const Center(
                  child: Text(
                "No Classes",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ));
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      for (final clazz in classes) ...[
                        ClassCard(lesson: clazz),
                        const SizedBox(height: 20),
                      ],
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
