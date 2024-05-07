import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/authentication.dart';
import 'package:student_progress_monitor_app/domain/exception.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/user.dart';

part 'authentication_provider.freezed.dart';

part 'authentication_provider.g.dart';

/// This provider is used to store the current user's information.

@freezed
class CurrentUser with _$CurrentUser {
  factory CurrentUser({
    required final User user,
    required final String sessionToken,
  }) = _CurrentUser;

  factory CurrentUser.fromJson(final Map<String, dynamic> json) =>
      _$CurrentUserFromJson(json);
}

@riverpod
class Authentication extends _$Authentication {
  @override
  Future<CurrentUser?> build() async {
    return readFromStorage();
  }

  // Login
  Future<void> login(
      {required final String email, required final String password}) async {
    state = const AsyncLoading();
    final response = await getApiService<AuthenticationService>()
        .login(email: email, password: password);

    if (response.isSuccessful) {
      final currentUser = Api.unwrap(CurrentUser.fromJson, response).payload;
      await writeToStorage(currentUser);
      state = AsyncData(currentUser);
    } else {
      final ex = SPMException(
        (response.error as Map<String, dynamic>)['message'] as String? ??
            'There was an unexpected problem logging you in.',
      );
      state = AsyncError(
        ex,
        StackTrace.current,
      );
      throw ex;
    }
  }

  // Logout
  Future<void> logout() async {
    state = const AsyncLoading();
    await getApiService<AuthenticationService>().logout();
    await writeToStorage(null);
    state = const AsyncData(null);
  }

  static Future<void> writeToStorage(final CurrentUser? user) async {
    if (user != null) {
      await storage.write(
        key: "user",
        value: jsonEncode(user.toJson()),
      );
    } else {
      await storage.delete(key: "user");
    }
  }

  // Read the current user from storage
  static Future<CurrentUser?> readFromStorage() async {
    final String? userString = await storage.read(key: "user");
    if (userString == null) {
      return null;
    }
    final userMap = jsonDecode(userString) as Map<String, dynamic>;
    return CurrentUser.fromJson(userMap);
  }
}

// Checks if the current user is authenticated
@riverpod
AsyncValue<bool> isAuthenticated(final IsAuthenticatedRef ref) {
  final currentUser = ref.watch(authenticationProvider);

  if (currentUser.hasError) return const AsyncData(false);
  if (currentUser.isLoading) return const AsyncLoading();
  return AsyncData(currentUser.value != null);
}
