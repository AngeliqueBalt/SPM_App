import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';

import '../data/users.dart';
import '../mock/find.dart';
import '../mock/provider.dart';

void testLoginAs(final IntegrationTestUser user) {
  testWidgets(
    'F27: ${user.type} can log in using email and password',
    (final WidgetTester tester) async {
      // Build our app and trigger a frame.
      final (app, container) = createScopedWidget(
        child: const SPMApp(),
      );
      await tester.pumpWidget(app);

      // Wait for the authentication provider to load (the value should be null
      // for no user).
      await expectLater(
        container.read(authenticationProvider.future),
        completion(null),
      );

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we get the login screen.
      expect(find.text('Student Progress Monitor'), findsOneWidget);
      expect(find.text('Log In'), findsExactly(2)); // the button and the text

      // Check for the 'email' and 'password' fields.
      final emailField =
          collectively([find.byType(TextField), find.byLabel('Email')]);
      final passwordField =
          collectively([find.byType(TextField), find.byLabel('Password')]);

      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);

      // Check for the 'Log In' button.
      final loginButton = find.descendant(
        of: find.byType(GestureDetector),
        matching: find.text('Log In'),
      );

      expect(loginButton, findsOneWidget);

      // Enter the email and password.
      await tester.enterText(emailField, user.email);
      await tester.enterText(passwordField, user.password);

      // Tap the 'Log In' button.
      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);

      // Wait for the authentication provider to load (the value should be null
      // for no user).
      await expectLater(
        container.read(authenticationProvider.future),
        completion(isNotNull),
      );

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we get the home screen.
      expect(find.text(user.dashboardName), findsOneWidget);
    },
  );
}

Future<void> assertLoggedIn() async {
  if (!await locator.get<FlutterSecureStorage>().containsKey(key: 'user')) {
    throw StateError(
      'No user is logged in. testLogout requires a user and should typically be run after testLoginAs.',
    );
  }
}

void testLogout(final IntegrationTestUser user) {
  testWidgets(
    'F28: ${user.type} can log out',
    (final WidgetTester tester) async {
      await assertLoggedIn();

      // Build our app and trigger a frame.
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

      // Check that we get the dashboard.
      expect(find.text(user.dashboardName), findsOneWidget);

      // Check for the drawer button.
      final openMenuButton = find.descendant(
        of: find.byType(IconButton),
        matching: find.byTooltip('Open navigation menu'),
      );

      expect(openMenuButton, findsOneWidget);

      // Open the drawer.
      await tester.tap(openMenuButton);

      // Wait for the drawer to open.
      await tester.pumpAndSettle();

      // Check for the 'Log Out' button.
      final logoutButton = find.descendant(
        of: find.byType(ListTile),
        matching: find.text('Logout'),
      );

      expect(logoutButton, findsOneWidget);

      // Tap the 'Log Out' button.
      await tester.tap(logoutButton);

      // Wait for the authentication provider to load (the value should be null
      // for no user).
      await expectLater(
        container.read(authenticationProvider.future),
        completion(null),
      );

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we get the login screen.
      expect(find.text('Student Progress Monitor'), findsOneWidget);
      expect(find.text('Log In'), findsExactly(2)); // the button and the text
    },
  );
}
