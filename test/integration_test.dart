import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:student_progress_monitor_app/data/network/integration_test.dart';
import 'package:student_progress_monitor_app/data/network/network.dart';

import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/user.dart';

import 'data/users.dart';
import 'mock/secure_storage.dart';
import 'spec/admin.dart';
import 'spec/all_users.dart';
import 'spec/auth.dart';
import 'spec/student.dart';
import 'spec/teacher.dart';

// -----------------------------------------------------------------------------
// Test configuration.

final integrationTestBaseUrl = Uri.parse('http://localhost:51549/');

const skipCommonTests = false;

const testUsers = [
  IntegrationTestUser.admin,
  IntegrationTestUser.teacher,
  IntegrationTestUser.student,
];

// -----------------------------------------------------------------------------

final integrationTestStorage = MockFlutterSecureStorage();

Future<void> main() async {
  final integrationTestApiClient = ChopperClient(
    baseUrl: integrationTestBaseUrl,
    services: [
      IntegrationTestService.create(),
    ],
  );

  if ((await integrationTestApiClient
              .getService<IntegrationTestService>()
              .ping())
          .body !=
      'ready') {
    throw Exception(
        'The backend is not running, or it is not in integration test mode.');
  }

  if ((await integrationTestApiClient
              .getService<IntegrationTestService>()
              .reset())
          .body !=
      'ready') {
    throw Exception('Failed to reset the integration test database.');
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  locator
    ..registerSingleton<FlutterSecureStorage>(integrationTestStorage)
    ..registerSingleton<ChopperClient>(setUpClient(
      services: apiServices,
      baseUrl: integrationTestBaseUrl,
    ));

  for (final user in testUsers) {
    // Log in.
    testLoginAs(user);

    // Run tests common to all users.
    if (!skipCommonTests) {
      testViewProfile(user);
    }

    // Run tests based on user type.
    switch (user.type) {
      case UserType.admin:
        group(
          'F1: the admin can view the list of students, teachers and admins',
          () {
            for (final userType in UserType.values) {
              testAdminListUsersOfType(userType);
            }
          },
        );

        group(
          'F2: the admin can create a student, teacher and admin',
          () {
            for (final userType in UserType.values) {
              testAdminCreateUserOfType(userType);
            }
          },
        );

        group('F3: the admin can remove a student, teacher and admin', () {
          for (final userType in UserType.values) {
            testAdminRemoveUserOfType(userType);
          }
        });

        group('F4: the admin can edit a student, teacher and admin', () {
          for (final userType in UserType.values) {
            testAdminEditUserOfType(userType);
          }
        });

        testAdminListClasses(); // F5
        testAdminCreateClass(); // F6
        testAdminRemoveClass(); // F7

      case UserType.teacher:
        testTeacherViewClasses(); // F9
        testTeacherSelectAndViewIndividualClass(); // F10
        testTeacherViewClassList(); // F11
        testTeacherCreateQuiz(); // F12
        testTeacherViewQuizHistory(); // F13
        testTeacherSetCurrentActiveQuiz(); // F14
        testTeacherViewCurrentActiveQuiz(); // F15
        testTeacherViewReport(); // F16

      case UserType.student:
        testStudentViewClasses(); // F21
        testStudentSelectAndViewIndividualClass(); // F22
        testStudentTakeQuiz(); // F23
        testStudentViewPreviousQuizzes(); // F24
        testStudentViewQuizResults(); // F25
    }

    // Log out.
    testLogout(user);
  }
}
