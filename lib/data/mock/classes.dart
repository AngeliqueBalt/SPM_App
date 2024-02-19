import 'package:student_progress_monitor_app/data/mock/users.dart';
import 'package:student_progress_monitor_app/models/class.dart';

const List<String> classNames = [
  "Computer Science",
  "Mathematics",
  "Biology",
  "Chemistry",
  "English",
  "History",
  "Geography"
];

List<Class> classes = classNames
    .map((name) => Class(
          id: name,
          name: name,
          teacher: teachers[0],
          students: students,
          quizzes: [],
        ))
    .toList();
