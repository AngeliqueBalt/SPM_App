import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/authentication.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/user.dart';

part 'authentication_provider.freezed.dart';

part 'authentication_provider.g.dart';

@freezed
class CurrentUser with _$CurrentUser {
  factory CurrentUser({
    required User user,
    required String sessionToken,
  }) = _CurrentUser;

  factory CurrentUser.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserFromJson(json);
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

    final currentUser = Api.unwrap(CurrentUser.fromJson, response)!.payload;
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
