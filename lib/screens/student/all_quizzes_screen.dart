import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_progress_monitor_app/const/design.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/partials/quiz_card.dart';
import 'package:student_progress_monitor_app/providers/quiz_provider.dart';

/// Students can view each of the previous quizzes they have taken.
/// They can see the score they got on each quiz.
/// They can see the questions and answers and with the answers.

// TODO(A): CHANGE TO ONLY SHOW IF SUBMISSION HAS BEEN MADE

class AllQuizzesScreen extends ConsumerStatefulWidget {
  final Class clazz;

  const AllQuizzesScreen({super.key, required this.clazz});

  @override
  ConsumerState<AllQuizzesScreen> createState() => _AllQuizzesScreenState();
}

class _AllQuizzesScreenState extends ConsumerState<AllQuizzesScreen> {
  @override
  Widget build(final BuildContext context) {
    final quizzes = ref.watch(quizzesProvider(widget.clazz.id).future);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "All Quizzes",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: greenColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: quizzes,
          builder: (final context, final snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final quizzes = snapshot.data!;

            if (quizzes.isEmpty) {
              return const Center(
                child: Text(
                  "No Quizzes",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      for (final theQuiz in quizzes) ...[
                        QuizCard(quiz: theQuiz),
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
