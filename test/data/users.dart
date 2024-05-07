import 'package:student_progress_monitor_app/models/user.dart';

class IntegrationTestUser {
  final UserType type;
  final String email;
  final String password;

  /// The name of the dashboard that the user should see after logging in.
  final String dashboardName;

  const IntegrationTestUser({
    required this.type,
    required this.email,
    required this.password,
    required this.dashboardName,
  });

  static const admin = IntegrationTestUser(
    type: UserType.admin,
    email: 'admin1@school.com',
    password: 'password123',
    dashboardName: 'Dashboard',
  );

  static const teacher = IntegrationTestUser(
    type: UserType.teacher,
    email: 'teacher1@school.com',
    password: 'password123',
    dashboardName: 'All Classes',
  );

  static const student = IntegrationTestUser(
    type: UserType.student,
    email: 'student1@school.com',
    password: 'password123',
    dashboardName: 'All Classes',
  );

  static const all = [admin, teacher, student];

  static IntegrationTestUser forType(final UserType type) {
    switch (type) {
      case UserType.admin:
        return admin;
      case UserType.teacher:
        return teacher;
      case UserType.student:
        return student;
    }
  }
}
