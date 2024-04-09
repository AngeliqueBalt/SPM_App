import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
                        // GestureDetector(
                        //   onTap: () => context.go('/class/${clazz.id}'),
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(horizontal: 40),
                        //     child: Container(
                        //       height: 165.0,
                        //       decoration: BoxDecoration(
                        //         color: greenColor,
                        //         borderRadius: BorderRadius.circular(15),
                        //       ),
                        //       padding: const EdgeInsets.symmetric(
                        //         vertical: 15,
                        //         horizontal: 15,
                        //       ),
                        //       child: Center(
                        //         child: Text(
                        //           clazz.name,
                        //           textAlign: TextAlign.center,
                        //           style: const TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 16,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
