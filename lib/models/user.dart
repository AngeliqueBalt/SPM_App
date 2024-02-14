import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

enum UserType {
  admin(value: "admin", label: "Admin"),
  teacher(value: "teacher", label: "Teacher"),
  student(value: "student", label: "Student");

  final String value;
  final String label;

  const UserType({
    required this.value,
    String? label,
  }) : label = label ?? value;

  static UserType? fromValue(String value) {
    return UserType.values
        .where((userType) => userType.value == value)
        .firstOrNull;
  }
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    required UserType userType,
    String? idNumber,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
