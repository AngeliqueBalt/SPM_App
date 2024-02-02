import 'package:student_progress_monitor_app/models/user_model.dart';

class ClassModel {
  String className;
  String teacher;
  List<UserModel> students;

  ClassModel({
    required this.className,
    required this.teacher,
    required this.students,
  });
}
