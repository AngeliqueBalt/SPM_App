import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/authentication.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/user.dart';

part 'authentication_provider.g.dart';

class CurrentUser {
  final User user;
  final String sessionToken;

  CurrentUser({
    required this.user,
    required this.sessionToken,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      sessionToken: json['sessionToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'sessionToken': sessionToken,
    };
  }
}

@riverpod
class Authentication extends _$Authentication {
  @override
  Future<CurrentUser?> build() async {
    return await readFromStorage();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    final response = await getApiService<AuthenticationService>()
        .login(email: email, password: password);

    final currentUser = CurrentUser.fromJson(response.body!['payload']!);
    await writeToStorage(currentUser);
    state = AsyncData(currentUser);
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await getApiService<AuthenticationService>().logout();
    await writeToStorage(null);
    state = const AsyncData(null);
  }

  static Future<void> writeToStorage(final CurrentUser? user) async {
    if (user != null) {
      storage.write(
        key: "user",
        value: jsonEncode(user.toJson()),
      );
    } else {
      storage.delete(key: "user");
    }
  }

  static Future<CurrentUser?> readFromStorage() async {
    final String? userString = await storage.read(key: "user");
    if (userString == null) {
      return null;
    }
    final Map<String, dynamic> userMap = jsonDecode(userString);
    return CurrentUser.fromJson(userMap);
  }
}

@riverpod
AsyncValue<bool> isAuthenticated(IsAuthenticatedRef ref) {
  final currentUser = ref.watch(authenticationProvider);

  if (currentUser.hasError) return const AsyncData(false);
  if (currentUser.isLoading) return const AsyncLoading();
  return AsyncData(currentUser.value != null);
}
