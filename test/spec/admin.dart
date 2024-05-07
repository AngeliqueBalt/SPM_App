import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/user.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';

import '../data/users.dart';
import '../mock/find.dart';
import '../mock/provider.dart';
import 'auth.dart';

void testAdminListUsersOfType(final UserType type) {
  testWidgets(
    'F1: the admin can view the list of ${type.value}s',
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

      // Check that we get the admin screen.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);

      // Check for the "All Students", etc., button.
      final allXButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('All ${type.label}s'),
      );

      expect(allXButton, findsOneWidget);

      // Tap the "All Students" button.
      await tester.ensureVisible(allXButton);
      await tester.tap(allXButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the list page.
      expect(find.text("${type.label} List"), findsOneWidget);

      // If the user type is not an admin, then the ID number should be present.
      final bool hasId = type != UserType.admin;

      // If the user type is student, we should expect 100 users, otherwise
      // just one.
      final int userCount = type == UserType.student ? 100 : 1;

      // Check for the known entries.
      for (var userNumber = 1; userNumber <= userCount; userNumber++) {
        expect(
            find.text('Full Name: ${type.label} #$userNumber'), findsOneWidget);
        expect(find.text('Email: ${type.value}$userNumber@school.com'),
            findsOneWidget);

        if (hasId) {
          expect(
              find.text(
                  'ID Number: SCH-${type.label[0]}${userNumber.toString().padLeft(4, '0')}'),
              findsOneWidget);
        }
      }
    },
  );
}

void testAdminCreateUserOfType(final UserType type) {
  testWidgets(
    'F2: the admin can create a user of type ${type.value}',
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

      // Check that we get the admin screen.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);

      // Locate the "Add New User" button
      final addNewUserButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('Add New User'),
      );

      expect(addNewUserButton, findsOneWidget);

      // Tap the "Add New User" button.
      await tester.ensureVisible(addNewUserButton);
      await tester.tap(addNewUserButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the add user page.
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Add New User'),
        ),
        findsOneWidget,
      );

      // Get the user type dropdown
      final userTypeDropdown = find.ancestor(
        of: find.byLabel('Type of user'),
        matching: find.byType(DropdownMenu<UserType>),
      );

      expect(userTypeDropdown, findsOneWidget);

      // Tap the user type dropdown
      await tester.tap(userTypeDropdown);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Tap the option for the label
      final userTypeOption = find.text(type.label).last;
      await tester.ensureVisible(userTypeOption);
      await tester.tap(userTypeOption);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that the user type is set
      expect(
        find.descendant(
            of: find.byType(TextField), matching: find.text(type.label)),
        findsOneWidget,
      );

      // Get the remaining form fields.
      final fullNameField =
          collectively([find.byType(TextField), find.byLabel('Full Name')]);
      final idNumberField =
          collectively([find.byType(TextField), find.byLabel('ID Number')]);
      final emailField =
          collectively([find.byType(TextField), find.byLabel('Email')]);
      final passwordField =
          collectively([find.byType(TextField), find.byLabel('Password')]);

      // Enter the user details
      final newId = type == UserType.student ? 101 : 2;
      await tester.enterText(fullNameField, '${type.label} #$newId');

      if (type != UserType.admin) {
        await tester.enterText(idNumberField,
            'SCH-${type.label[0]}${newId.toString().padLeft(4, '0')}');
      }

      await tester.enterText(emailField, '${type.value}$newId');
      await tester.enterText(passwordField, 'password123');

      // Locate the "Create new user" button
      final createNewUserButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('Create new user'),
      );

      // Tap the "Create new user" button
      await tester.ensureVisible(createNewUserButton);
      await tester.tap(createNewUserButton);

      await tester.pumpAndSettle();

      // Check that we're on the dashboard page.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);
    },
  );
}

void testAdminRemoveUserOfType(final UserType type) {
  testWidgets(
    'F3: the admin can remove a user of type ${type.value}',
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

      // Check that we get the admin screen.
      expect(find.text('Dashboard'), findsOneWidget);

      // Check for the "All Students", etc., button.
      var allXButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('All ${type.label}s'),
      );

      expect(allXButton, findsOneWidget);

      // Tap the "All Students" button.
      await tester.ensureVisible(allXButton);
      await tester.tap(allXButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the list page.
      expect(find.text("${type.label} List"), findsOneWidget);

      // Check that the first and the user we're going to delete are on the
      // page.
      final last = type == UserType.student ? 101 : 2;
      expect(find.text('Full Name: ${type.label} #1'), findsOneWidget);
      expect(find.text('Full Name: ${type.label} #$last'), findsOneWidget);

      // Locate the "Delete" button
      final removeButtons = find.ancestor(
        of: find.byTooltip('Delete'),
        matching: find.byType(IconButton),
      );

      expect(removeButtons, findsNWidgets(last));

      // Tap the "Delete" button
      await tester.ensureVisible(removeButtons.last);
      await tester.pump();
      await tester.tap(removeButtons.last);
      await tester.pumpAndSettle();

      // Check that we're on the dashboard page.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);

      // Check for the "All Students", etc., button.
      allXButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('All ${type.label}s'),
      );

      expect(allXButton, findsOneWidget);

      // Tap the "All Students" button.
      await tester.tap(allXButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the list page.
      expect(find.text("${type.label} List"), findsOneWidget);

      // Check that the user is no longer in the list
      expect(find.text('Full Name: ${type.label} #1'), findsOneWidget);
      expect(find.text('Full Name: ${type.label} #$last'), findsNothing);
    },
  );
}

void testAdminEditUserOfType(final UserType type) {
  testWidgets(
    'F4: the admin can edit a user of type ${type.value}',
    (final WidgetTester tester) async {
      final from = '${type.label} #1';
      final to = '${type.label} #1 (edited)';

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

      // Check that we get the admin screen.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);

      // Check for the "All Students", etc., button.
      var allXButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('All ${type.label}s'),
      );

      expect(allXButton, findsOneWidget);

      // Tap the "All Students" button.
      await tester.ensureVisible(allXButton);
      await tester.tap(allXButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the list page.
      expect(find.text("${type.label} List"), findsOneWidget);

      // Locate the first user.
      expect(find.text("Full Name: $from"), findsOneWidget);
      expect(find.text("Full Name: $to"), findsNothing);

      // Locate the "Edit" button for the first user.
      final editButtons = find.ancestor(
        of: find.byTooltip('Edit'),
        matching: find.byType(IconButton),
      );

      expect(editButtons, findsAny);

      // Tap the "Edit" button
      await tester.ensureVisible(editButtons.first);
      await tester.pump();
      await tester.tap(editButtons.first);
      await tester.pumpAndSettle();

      // Edit the full name to the new value.
      final fullNameField =
          collectively([find.byType(TextField), find.byLabel('Full Name')]);
      await tester.enterText(fullNameField, to);
      await tester.pumpAndSettle();

      // Locate the "Save" button
      final saveButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('Save'),
      );

      // Tap the "Save" button
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      // Check that the user has been updated.
      expect(find.text("Full Name: $from"), findsNothing);
      expect(find.text("Full Name: $to"), findsOneWidget);

      // Press the back button
      final backButton = find.byTooltip('Back');
      expect(backButton, findsOneWidget);
      await tester.tap(backButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the dashboard page.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);

      // Check for the "All Students", etc., button.
      allXButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('All ${type.label}s'),
      );

      expect(allXButton, findsOneWidget);

      // Tap the "All Students" button.
      await tester.tap(allXButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the list page.
      expect(find.text("${type.label} List"), findsOneWidget);

      // Check that the user has been updated.
      expect(find.text("Full Name: $from"), findsNothing);
      expect(find.text("Full Name: $to"), findsOneWidget);

      // Tap the "Edit" button
      await tester.ensureVisible(editButtons.first);
      await tester.pump();
      await tester.tap(editButtons.first);
      await tester.pumpAndSettle();

      // Edit the full name back to the original value.
      await tester.enterText(fullNameField, from);
      await tester.pumpAndSettle();

      // Tap the "Save" button
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      // Check that the user has been updated.
      expect(find.text("Full Name: $from"), findsOneWidget);
      expect(find.text("Full Name: $to"), findsNothing);
    },
  );
}

void testAdminListClasses() {
  testWidgets(
    'F5: the admin can view the list of classes',
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

      // Check that we get the admin screen.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);

      // Check for the "All Classes" button.
      final allClassesButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('All Classes'),
      );

      expect(allClassesButton, findsOneWidget);

      // Tap the "All Classes" button.
      await tester.ensureVisible(allClassesButton);
      await tester.tap(allClassesButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the list page.
      expect(find.text("List of All Classes"), findsOneWidget);

      // Check for the known entries.
      const classNames = [
        "English",
        "Geography",
        "Biology",
        "History",
        "Maths",
        "Computer Science",
      ];
      for (final className in classNames) {
        expect(find.text('Class: $className'), findsOneWidget);
      }

      expect(
          find.text('Teacher: Teacher #1'), findsNWidgets(classNames.length));
    },
  );
}

void testAdminCreateClass() {
  testWidgets(
    'F6: the admin can create a class',
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

      // Check that we get the admin screen.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);

      // Locate the "Add New Class" button
      final addNewClassButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('Add New Class'),
      );

      expect(addNewClassButton, findsOneWidget);

      // Tap the "Add New Class" button.
      await tester.ensureVisible(addNewClassButton);
      await tester.tap(addNewClassButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the add class page.
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Add New Class'),
        ),
        findsOneWidget,
      );

      // Get the class name field
      final classNameField =
          collectively([find.byType(TextField), find.byLabel('Class Name')]);

      // Enter the class name
      await tester.enterText(classNameField, 'New Class');

      // Get the teacher dropdown
      final teacherDropdown = find.ancestor(
        of: find.byLabel('Teacher'),
        matching: find.byType(DropdownMenu<String>),
      );

      expect(teacherDropdown, findsOneWidget);

      // Tap the user type dropdown
      await tester.tap(teacherDropdown);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Tap the option for the label
      final teacherOption = find.text('Teacher #1 (SCH-T0001)').last;
      await tester.ensureVisible(teacherOption);
      await tester.tap(teacherOption);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that the user type is set
      expect(
        find.descendant(
            of: find.byType(TextField),
            matching: find.text('Teacher #1 (SCH-T0001)')),
        findsOneWidget,
      );

      // Get the student dropdown
      final studentDropdown = find.ancestor(
        of: find.text('Select student(s)'),
        matching: find.byType(MultiSelectDropDown<String>),
      );

      expect(studentDropdown, findsOneWidget);

      // Tap the student dropdown
      await tester.ensureVisible(studentDropdown);
      await tester.tap(studentDropdown);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Get the student dropdown.
      final studentOptionsListSelector = find.ancestor(
        of: find.text("Student #1 (SCH-S0001)"),
        matching: find.descendant(
          of: find.byType(Overlay),
          matching: find.byType(Scrollable),
        ),
      );
      expect(studentOptionsListSelector, findsOneWidget);

      // Check that we have an option for each student
      for (var i = 1; i <= 100; i++) {
        final selector =
            find.text('Student #$i (SCH-S${i.toString().padLeft(4, '0')})');
        await tester.ensureVisible(selector);
        await tester.pump();
        expect(selector, findsOneWidget);
      }

      // Close the overlay
      await tester.tapAt(const Offset(0, 0));
      await tester.pumpAndSettle();

      // Fixes the test when running in landscape mode. (Scrolls the page up
      // by 100px to ensure the top of the dropdown menu options is visible
      // when they are subsequently opened.)
      await tester.drag(
        find.byType(Scrollable).first,
        const Offset(0, 100),
      );

      // Re-open the overlay.
      await tester.tap(studentDropdown);
      await tester.pumpAndSettle();

      // Select the first three students.
      for (var i = 1; i <= 3; i++) {
        final studentOption =
            find.text('Student #$i (SCH-S${i.toString().padLeft(4, '0')})');
        await tester.ensureVisible(studentOption);
        expect(studentOption, findsOneWidget);
        await tester.tap(studentOption);
      }

      await tester.pumpAndSettle();

      // Close the overlay
      await tester.tapAt(const Offset(0, 0));
      await tester.pumpAndSettle();

      // Locate the "Create new class" button
      final createNewClassButton = find.ancestor(
        of: find.text('Create new class'),
        matching: find.byType(OutlinedButton),
      );
      expect(createNewClassButton, findsOneWidget);

      // Tap the "Create new class" button
      await tester.ensureVisible(createNewClassButton);
      await tester.tap(createNewClassButton);
      await tester.pumpAndSettle();

      // Check that we're on the dashboard page.
      expect(
        find.text(IntegrationTestUser.admin.dashboardName),
        findsOneWidget,
      );

      // Check for the "All Classes" button.
      final allClassesButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('All Classes'),
      );

      expect(allClassesButton, findsOneWidget);

      // Tap the "All Classes" button.
      await tester.tap(allClassesButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the list page.
      expect(find.text("List of All Classes"), findsOneWidget);

      // Check that the new class is in the list
      expect(find.text('Class: New Class'), findsOneWidget);
    },
  );
}

void testAdminRemoveClass() {
  testWidgets(
    'F7: the admin can remove a class',
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

      // Check that we get the admin screen.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);

      // Check for the "All Classes" button.
      var allClassesButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('All Classes'),
      );

      expect(allClassesButton, findsOneWidget);

      // Tap the "All Classes" button.
      await tester.ensureVisible(allClassesButton);
      await tester.tap(allClassesButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the list page.
      expect(find.text("List of All Classes"), findsOneWidget);

      // Check that the first and the class we're going to delete are on the
      // page.
      expect(find.text('Class: Geography'), findsOneWidget);

      // Locate the "Delete" button
      final removeButtons = find.ancestor(
        of: find.byTooltip('Delete'),
        matching: find.byType(IconButton),
      );

      expect(removeButtons, findsAny);

      // Tap the "Delete" button
      await tester.ensureVisible(removeButtons.at(1));
      await tester.pump();
      await tester.tap(removeButtons.at(1));
      await tester.pumpAndSettle();

      // Check that we're on the dashboard page.
      expect(
          find.text(IntegrationTestUser.admin.dashboardName), findsOneWidget);

      // Check for the "All Classes" button.
      allClassesButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('All Classes'),
      );

      expect(allClassesButton, findsOneWidget);

      // Tap the "All Students" button.
      await tester.tap(allClassesButton);

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we're on the list page.
      expect(find.text("List of All Classes"), findsOneWidget);

      // Check that the user is no longer in the list
      expect(find.text('Class: Geography'), findsNothing);
    },
  );
}
