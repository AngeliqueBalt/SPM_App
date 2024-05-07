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
    final String? label,
  }) : label = label ?? value;

  static UserType? fromValue(final String value) {
    return UserType.values
        .where((final userType) => userType.value == value)
        .firstOrNull;
  }

  @override
  toString() => label;
}

@freezed
class User with _$User {
  const factory User({
    required final String id,
    required final String name,
    required final String email,
    required final UserType userType,
    final String? idNumber,
  }) = _User;

  factory User.fromJson(final Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
