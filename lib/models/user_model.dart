import 'class_model.dart';

class UserModel {
  String name;
  String email;
  String password;
  bool isTeacher;
  int idNumber;
  List<String> classes;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.isTeacher,
    required this.idNumber,
    required this.classes,
  });
}
