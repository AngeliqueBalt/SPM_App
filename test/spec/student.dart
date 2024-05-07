import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';

import '../mock/provider.dart';
import 'auth.dart';

void testStudentViewClasses() {
  testWidgets(
    'F21: the student can view the list of their classes',
    (final WidgetTester tester) async {
      await assertLoggedIn();

      final (app, container) = createScopedWidget(
        child: const SPMApp(),
      );

      await tester.pumpWidget(app);

      // Wait for the authentication provider to load (the value should be null
      // for no user).
      await expectLater(
        container.read(authenticationProvider.future),
        completion(isNotNull),
      );

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we get the teacher dashboard.
      expect(find.text('All Classes'), findsOneWidget);
    },
  );
}

void testStudentSelectAndViewIndividualClass() {
  testWidgets(
    'F22: the student can select and view an individual class',
    (final WidgetTester tester) async {
      await assertLoggedIn();

      final (app, container) = createScopedWidget(
        child: const SPMApp(),
      );

      await tester.pumpWidget(app);

      // Wait for the authentication provider to load (the value should be null
      // for no user).
      await expectLater(
        container.read(authenticationProvider.future),
        completion(isNotNull),
      );

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we get the teacher dashboard.
      expect(find.text('All Classes'), findsOneWidget);

      // Check for the first class.
      final firstClass = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text("English"),
      );

      expect(firstClass, findsOneWidget);

      // Tap the first class.
      await tester.tap(firstClass);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the class page.
      expect(find.text('English'), findsOneWidget);
    },
  );
}

void testStudentTakeQuiz() {
  testWidgets(
    'F23: the student can take a quiz',
    (final WidgetTester tester) async {
      await assertLoggedIn();

      final (app, container) = createScopedWidget(
        child: const SPMApp(),
      );

      await tester.pumpWidget(app);

      // Wait for the authentication provider to load (the value should be null
      // for no user).
      await expectLater(
        container.read(authenticationProvider.future),
        completion(isNotNull),
      );

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we get the student dashboard.
      expect(find.text('All Classes'), findsOneWidget);

      // Check for the first class.
      final firstClass = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text("English"),
      );

      expect(firstClass, findsOneWidget);

      // Tap the first class.
      await tester.tap(firstClass);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the class page.
      expect(find.text('English'), findsOneWidget);

      // Check for quiz to take
      final quiz = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text("Take Quiz"),
      );

      expect(quiz, findsOneWidget);

      // Tap the quiz.
      await tester.tap(quiz);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the quiz page.
      expect(find.text('Week 1 Quiz'), findsOneWidget);

      // Sleep for 20s
      // await Future.delayed(const Duration(seconds: 30));

      for (int i = 0; i <= 9; i++) {
        // Check for answer options with text 'correct'
        final correctAnswer = find.descendant(
          of: find.byType(GestureDetector),
          matching: find.text("correct"),
        );

        expect(correctAnswer, findsOneWidget);

        // Tap the correct answer.
        await tester.ensureVisible(correctAnswer);
        await tester.tap(correctAnswer);

        // Wait for the widget to reflect the new state.
        await tester.pump();

        if (i < 9) {
          // Locate and press 'Next' button.
          final nextButton = find.descendant(
            of: find.byType(GestureDetector),
            matching: find.text("Next Question"),
          );

          expect(nextButton, findsOneWidget);

          await tester.ensureVisible(nextButton);
          await tester.pump();
          await tester.tap(nextButton);

          // Wait for the widget to reflect the new state.
          await tester.pumpAndSettle();
        }
      }

      // Locate and press 'See Results' button.
      final seeResultsButton = find.descendant(
        of: find.byType(OutlinedButton),
        matching: find.text("See Results"),
      );
      expect(seeResultsButton, findsOneWidget);

      await tester.ensureVisible(seeResultsButton);
      await tester.pump();
      await tester.tap(seeResultsButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the result page
      expect(find.text('Well Done!'), findsOneWidget);
      expect(find.text('Your score is'), findsOneWidget);
      expect(find.text('100%'), findsOneWidget);

      // Check for 'Done' button.
      final submitButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text("Submit"),
      );

      expect(submitButton, findsOneWidget);

      // Tap the 'Done' button.
      await tester.tap(submitButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the quiz report page.
      expect(find.text('Week 1 Quiz Report'), findsOneWidget);
      expect(find.text('100%'), findsOneWidget);
    },
  );
}

void testStudentViewPreviousQuizzes() {
  testWidgets('F24: the student can view all previously taken quizzes',
      (final WidgetTester tester) async {
    await assertLoggedIn();

    final (app, container) = createScopedWidget(
      child: const SPMApp(),
    );

    await tester.pumpWidget(app);

    // Wait for the authentication provider to load (the value should be null
    // for no user).
    await expectLater(
      container.read(authenticationProvider.future),
      completion(isNotNull),
    );

    // Wait for the widget to reflect the new state.
    await tester.pumpAndSettle();

    // Check that we get the student dashboard.
    expect(find.text('All Classes'), findsOneWidget);

    // Check for the first class.
    final firstClass = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("English"),
    );

    expect(firstClass, findsOneWidget);

    // Tap the first class.
    await tester.tap(firstClass);

    // Wait for the widget to reflect the new state.
    await tester.pumpAndSettle();

    // Check that we're on the class page.
    expect(find.text('English'), findsOneWidget);

    // Locate and tap the 'Past Quizzes' button.
    final pastQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Past Quizzes"),
    );

    expect(pastQuizzesButton, findsOneWidget);
    await tester.tap(pastQuizzesButton);

    // Wait for the widget to reflect the new state.
    await tester.pumpAndSettle();

    // Check that we're on the past quizzes page.
    expect(find.text('Past Quizzes'), findsOneWidget);
  });
}

void testStudentViewQuizResults() {
  testWidgets('F25: the student can view the score of a quiz',
      (final WidgetTester tester) async {
    await assertLoggedIn();

    final (app, container) = createScopedWidget(
      child: const SPMApp(),
    );

    await tester.pumpWidget(app);

    // Wait for the authentication provider to load (the value should be null
    // for no user).
    await expectLater(
      container.read(authenticationProvider.future),
      completion(isNotNull),
    );

    // Wait for the widget to reflect the new state.
    await tester.pumpAndSettle();

    // Check that we get the student dashboard.
    expect(find.text('All Classes'), findsOneWidget);

    // Check for the first class.
    final firstClass = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("English"),
    );

    expect(firstClass, findsOneWidget);

    // Tap the first class.
    await tester.tap(firstClass);

    // Wait for the widget to reflect the new state.
    await tester.pumpAndSettle();

    // Check that we're on the class page.
    expect(find.text('English'), findsOneWidget);

    // Locate and tap the 'Past Quizzes' button.
    final pastQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Past Quizzes"),
    );

    expect(pastQuizzesButton, findsOneWidget);
    await tester.tap(pastQuizzesButton);

    // Wait for the widget to reflect the new state.
    await tester.pumpAndSettle();

    // Check that we're on the past quizzes page.
    expect(find.text('Past Quizzes'), findsOneWidget);

    // Locate and tap the first quiz.
    final firstQuiz = find
        .descendant(
          of: find.byType(GestureDetector),
          matching: find.textContaining("Quiz"),
        )
        .first;

    expect(firstQuiz, findsOneWidget);
    await tester.tap(firstQuiz);

    // Wait for the widget to reflect the new state.
    await tester.pumpAndSettle();

    // Check that we're on the quiz page.
    expect(find.text('Score'), findsOneWidget);
  });
}
