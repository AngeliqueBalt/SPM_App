import 'package:student_progress_monitor_app/models/user.dart';

User teacher = const User(
  name: "Ethan Anderson",
  email: "Ethan@school.com",
  idNumber: "SCH-T0001",
  userType: UserType.teacher,
);

List<User> students = const [
  User(
    name: "Olivia Martinez",
    email: "Olivia@school.com",
    idNumber: "SCH-S0001",
    userType: UserType.student,
  ),
  User(
    name: "Jackson Harper",
    email: "Jackson@school.com",
    idNumber: "SCH-S0002",
    userType: UserType.student,
  ),
  User(
    name: "Sophia Lewis",
    email: "Sophia@school.com",
    idNumber: "SCH-S0003",
    userType: UserType.student,
  ),
  User(
    name: "Noah Taylor",
    email: "Noah@school.com",
    idNumber: "SCH-S0004",
    userType: UserType.student,
  ),
  User(
    name: "Isabella Carter",
    email: "Isabella@school.com",
    idNumber: "SCH-S0005",
    userType: UserType.student,
  ),
];
