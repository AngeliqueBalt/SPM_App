import 'package:student_progress_monitor_app/models/user.dart';

class Class {
  String className;
  User teacher;
  List<User> students;

  Class({
    required this.className,
    required this.teacher,
    required this.students,
  });
}
