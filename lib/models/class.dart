import 'package:student_progress_monitor_app/models/user.dart';

class Class {
  final String id;
  final String name;
  final User teacher;
  final List<User> students;

  Class({
    required this.id,
    required this.name,
    required this.teacher,
    required this.students,
  });
}
