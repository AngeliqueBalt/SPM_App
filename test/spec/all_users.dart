import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/providers/authentication_provider.dart';

import '../data/users.dart';
import '../mock/provider.dart';
import 'auth.dart';

void testViewProfile(final IntegrationTestUser user) {
  testWidgets(
    'F26: ${user.type} can view their profile',
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

      // Check for the 'Profile' button
      final profileButton = find.descendant(
        of: find.byType(ListTile),
        matching: find.text('Profile'),
      );

      expect(profileButton, findsOneWidget);

      // Tap the 'Profile' button.
      await tester.tap(profileButton);

      // Wait for the authentication provider to load (the value should be null
      // for no user).
      await expectLater(
        container.read(authenticationProvider.future),
        completion(isNotNull),
      );

      // Wait for the widget to reflect the new state.
      await tester.pumpAndSettle();

      // Check that we get the home screen.
      expect(find.text("Profile"), findsOneWidget);
    },
  );
}
