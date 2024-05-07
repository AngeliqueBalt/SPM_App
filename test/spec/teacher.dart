import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';

import '../mock/find.dart';
import '../mock/provider.dart';
import 'auth.dart';

void testTeacherViewClasses() {
  testWidgets(
    'F9: the teacher can view the list of their classes',
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

void testTeacherSelectAndViewIndividualClass() {
  testWidgets(
    'F10: the teacher can select and view an individual class',
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

void testTeacherViewClassList() {
  testWidgets('F11: the teacher can view the list of students in a class',
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

    // Check for "View Students List" button.
    final viewStudentsListButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("View Students List"),
    );

    expect(viewStudentsListButton, findsOneWidget);

    // Tap the "View Students List" button.
    await tester.tap(viewStudentsListButton);

    // Wait for the widget to reflect the new state.
    await tester.pumpAndSettle();

    // Check that we're on the students list page.
    expect(find.text('Class List'), findsOneWidget);

    // Check for the known entries.
    for (var userNumber = 1; userNumber <= 5; userNumber++) {
      expect(find.text('Full Name: ${UserType.student.label} #$userNumber'),
          findsOneWidget);
      expect(
          find.text('Email: ${UserType.student.value}$userNumber@school.com'),
          findsOneWidget);
      expect(
          find.text(
              'ID Number: SCH-${UserType.student.label[0]}${userNumber.toString().padLeft(4, '0')}'),
          findsOneWidget);
    }
  });
}

void testTeacherCreateQuiz() {
  testWidgets('F12: the teacher can create a quiz',
      (final WidgetTester tester) async {
    await assertLoggedIn();

    final (app, _) = createScopedWidget(
      child: const SPMApp(),
    );

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    // Check that we get the teacher dashboard.
    expect(find.text('All Classes'), findsOneWidget);

    final firstClass = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("English"),
    );

    expect(firstClass, findsOneWidget);

    await tester.tap(firstClass);

    await tester.pumpAndSettle();

    expect(find.text('English'), findsOneWidget);

    // Check for "Manage Quizzes" button.
    final manageQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Manage Quizzes"),
    );

    expect(manageQuizzesButton, findsOneWidget);
    await tester.tap(manageQuizzesButton);
    await tester.pumpAndSettle();

    // Check for "Add New Quiz" button.
    final addNewQuizButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Add New Quiz"),
    );

    expect(addNewQuizButton, findsOneWidget);

    await tester.tap(addNewQuizButton);
    await tester.pumpAndSettle();

    // Check that we're on the create quiz page.
    expect(find.text('Create New Quiz'), findsOneWidget);

    for (var i = 0; i < 10; i++) {
      // Check for question title
      expect(find.text("Question ${i + 1}/10"), findsOneWidget);

      // Locate inputs
      final formFields = find.byType(TextField);
      expect(formFields, findsNWidgets(5));

      final questionField = collectively([
        formFields.first,
        find.byHint("Enter your question here"),
      ]);
      expect(questionField, findsOneWidget);

      final answerFields = find.skip(1, formFields);

      final answerCorrectFields = find.byType(Checkbox);
      expect(answerCorrectFields, findsNWidgets(4));

      // Enter question
      await tester.enterText(questionField, "Question ${i + 1}");
      await tester.pump();

      // Enter answers
      for (var j = 0; j < 4; j++) {
        final answerField = collectively([
          answerFields.at(j),
          find.byHint("Enter option ${j + 1}"),
        ]);
        expect(answerField, findsOneWidget);

        await tester.enterText(answerField, j == 0 ? "correct" : "incorrect");
        await tester.pump();
      }

      // Select correct answer
      await tester.ensureVisible(answerCorrectFields.at(0));
      await tester.pump();

      await tester.tap(answerCorrectFields.at(0));
      await tester.pump();

      // Locate and press next button
      if (i < 9) {
        final nextButton = find.text("Next");
        expect(nextButton, findsOneWidget);

        await tester.tap(nextButton);
        await tester.pumpAndSettle();
      } else {
        final previewButton = find.text("Preview");
        expect(previewButton, findsOneWidget);

        await tester.tap(previewButton);
        await tester.pumpAndSettle();
      }
    }

    // Locate and press "Save Quiz" button
    final saveQuizButton = find.text("Save Quiz");
    expect(saveQuizButton, findsOneWidget);

    await tester.tap(saveQuizButton);
    await tester.pumpAndSettle();

    // Give the quiz a name
    final quizNameField = find.byType(TextField);
    expect(quizNameField, findsOneWidget);

    await tester.enterText(quizNameField, "Week 1 Quiz");

    // Locate and press "Save Quiz" button
    final saveDialogButton = find.text("Save");
    expect(saveDialogButton, findsOneWidget);

    await tester.tap(saveDialogButton);
    await tester.pumpAndSettle();

    // Check that we're on the manage quizzes page.
    expect(find.text('Manage Quizzes'), findsOneWidget);
  });
}

void testTeacherViewReport() {
  testWidgets(
      'F16: the teacher can view a report of each quiz, with the questions and a score summary',
      (final WidgetTester tester) async {
    await assertLoggedIn();

    final (app, _) = createScopedWidget(
      child: const SPMApp(),
    );

    await tester.pumpWidget(app);
    await tester.pumpAndSettle();

    // Check that we get the teacher dashboard.
    expect(find.text('All Classes'), findsOneWidget);

    final firstClass = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("English"),
    );

    expect(firstClass, findsOneWidget);
    await tester.tap(firstClass);
    await tester.pumpAndSettle();

    // Check that we're on the class page.
    expect(find.text('English'), findsOneWidget);

    // Locate and press the "Manage Quizzes" button.
    final manageQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Manage Quizzes"),
    );

    expect(manageQuizzesButton, findsOneWidget);
    await tester.tap(manageQuizzesButton);
    await tester.pumpAndSettle();

    // Locate and press the "All Quizzes" button.
    final allQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("All Quizzes"),
    );

    expect(allQuizzesButton, findsOneWidget);
    await tester.ensureVisible(allQuizzesButton);
    await tester.tap(allQuizzesButton);
    await tester.pumpAndSettle();

    // Locate and press the first quiz.
    final quizzes = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.textContaining("Quiz"),
    );

    expect(quizzes, findsNWidgets(2));

    final firstQuiz = quizzes.first;
    expect(firstQuiz, findsOneWidget);
    await tester.tap(firstQuiz);
    await tester.pumpAndSettle();

    // Check that we're on the quiz page.
    expect(find.text('English Quiz Report'), findsOneWidget);

    // Look for the scores.
    expect(find.text('20% – 100%'), findsOneWidget);

    // Look for the known questions and answers.
    // (They are repeated 10 times, once for each question, so we'll just check
    // them all in one go.)
    expect(find.text('Which of these is correct?'), findsNWidgets(10));
    expect(find.text('correct'), findsNWidgets(10));
    expect(find.text('incorrect'), findsNWidgets(30));

    for (int i = 1; i <= 10; i++) {
      expect(find.text('Question $i/10'), findsOneWidget);
    }
  });
}

void testTeacherViewQuizHistory() {
  testWidgets('F13: the teacher can view all previously created quizzes',
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
    await tester.tap(firstClass);
    await tester.pumpAndSettle();
    expect(find.text('English'), findsOneWidget);

    // Check for "Manage Quizzes" button.
    final manageQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Manage Quizzes"),
    );

    expect(manageQuizzesButton, findsOneWidget);
    await tester.tap(manageQuizzesButton);
    await tester.pumpAndSettle();

    // Check for "All Quizzes" button.
    final allQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("All Quizzes"),
    );

    expect(allQuizzesButton, findsOneWidget);
    await tester.tap(allQuizzesButton);
    await tester.pumpAndSettle();

    // Check that we're on the quizzes page.
    expect(find.text('All Quizzes'), findsOneWidget);
  });
}

void testTeacherSetCurrentActiveQuiz() {
  testWidgets('F14: the teacher can set the current active quiz',
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
    await tester.tap(firstClass);
    await tester.pumpAndSettle();
    expect(find.text('English'), findsOneWidget);

    // Check for "Manage Quizzes" button.
    final manageQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Manage Quizzes"),
    );

    expect(manageQuizzesButton, findsOneWidget);
    await tester.tap(manageQuizzesButton);
    await tester.pumpAndSettle();

    // Tap on the 'All Quizzes' button
    final allQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("All Quizzes"),
    );

    expect(allQuizzesButton, findsOneWidget);
    await tester.tap(allQuizzesButton);
    await tester.pumpAndSettle();

    // Open the created "Week 1 Quiz".
    final quizzes = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.textContaining("Week 1 Quiz"),
    );

    expect(quizzes, findsOneWidget);
    await tester.tap(quizzes.first);
    await tester.pumpAndSettle();

    // Check that we're on the quiz page.
    expect(find.text('Week 1 Quiz Report'), findsOneWidget);

    // Locate and press the "Activate Quiz" button.
    final activateQuizButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Activate Quiz"),
    );

    expect(activateQuizButton, findsOneWidget);
    await tester.tap(activateQuizButton);
    await tester.pumpAndSettle();
  });
}

void testTeacherViewCurrentActiveQuiz() {
  testWidgets('F15: the teacher can view the current active quiz',
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
    await tester.tap(firstClass);
    await tester.pumpAndSettle();
    expect(find.text('English'), findsOneWidget);

    // Check for "Manage Quizzes" button.
    final manageQuizzesButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Manage Quizzes"),
    );

    expect(manageQuizzesButton, findsOneWidget);
    await tester.tap(manageQuizzesButton);
    await tester.pumpAndSettle();

    // Check for the "Current Quiz" button
    final currentQuizButton = find.descendant(
      of: find.byType(GestureDetector),
      matching: find.text("Current Quiz"),
    );

    expect(currentQuizButton, findsOneWidget);
    await tester.tap(currentQuizButton);
    await tester.pumpAndSettle();

    // Check that we're on the 'Week 1 Quiz Report' page.
    expect(find.text('Week 1 Quiz Report'), findsOneWidget);

    // Check that there is a button that says 'Deactivate Quiz' (implying
    // that the quiz is active).
    expect(find.text('Deactivate Quiz'), findsOneWidget);
  });
}
