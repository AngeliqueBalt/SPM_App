import 'package:student_progress_monitor_app/data/mock/classes.dart' as mock;
import 'package:student_progress_monitor_app/models/class.dart';

enum UserType {
  admin("admin"),
  teacher("teacher"),
  student("student");

  final String value;

  const UserType(this.value);

  static UserType? fromValue(String value) {
    return UserType.values
        .where((userType) => userType.value == value)
        .firstOrNull;
  }
}

class User {
  final String name;
  final String email;
  final UserType userType;
  final String? idNumber;

  const User({
    required this.name,
    required this.email,
    required this.userType,
    this.idNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      idNumber: json['idNumber'] as String?,
      userType: UserType.fromValue(json['userType'] as String)!,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'idNumber': idNumber,
      'userType': userType.value,
    };
  }
}
