import 'package:student_progress_monitor_app/models/user.dart';

List<User> teachers = const [
  User(
    id: '55ef528e-99bf-45f1-b0b3-5689c35bc7bf',
    name: "Ethan Anderson",
    email: "Ethan@school.com",
    idNumber: "SCH-T0001",
    userType: UserType.teacher,
  ),
];

List<User> students = const [
  User(
    id: '38fd4949-0de4-4e60-b65c-57ee8e52114c',
    name: "Olivia Martinez",
    email: "Olivia@school.com",
    idNumber: "SCH-S0001",
    userType: UserType.student,
  ),
  User(
    id: 'bd8471ec-9fa2-4b0f-b402-e0dcaf5b5f7a',
    name: "Jackson Harper",
    email: "Jackson@school.com",
    idNumber: "SCH-S0002",
    userType: UserType.student,
  ),
  User(
    id: '177b1a3a-5590-4ecd-9068-1174315f6917',
    name: "Sophia Lewis",
    email: "Sophia@school.com",
    idNumber: "SCH-S0003",
    userType: UserType.student,
  ),
  User(
    id: '6093f085-9150-4ce9-845b-fd9df9fd54d3',
    name: "Noah Taylor",
    email: "Noah@school.com",
    idNumber: "SCH-S0004",
    userType: UserType.student,
  ),
  User(
    id: '2839aed3-96b5-4997-aeca-27972b467d30',
    name: "Isabella Carter",
    email: "Isabella@school.com",
    idNumber: "SCH-S0005",
    userType: UserType.student,
  ),
];

List<User> admins = const [
  User(
    id: 'b2164e08-7c34-4d93-81d1-1be836bb9bcf',
    name: "Aurora Blake",
    email: "Aurora@school.com",
    userType: UserType.admin,
  ),
];

List<User> users = [...teachers, ...students, ...admins];
