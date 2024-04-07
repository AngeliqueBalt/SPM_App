import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/user_management.dart';
import 'package:student_progress_monitor_app/domain/exception.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/user.dart';

part 'users_provider.g.dart';

/// Provider to deal with the state of the users

@riverpod
class Users extends _$Users {
  @override
  // Gets all users from the database
  Future<List<User>> build() async {
    final response = await getApiService<UserManagementService>().getAll();
    return Api.unwrapList(User.fromJson, response).payload;
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(build);
  }

  // Adds a user to the database
  Future<void> addUser({required final Map<String, dynamic> body}) async {
    final response =
        await getApiService<UserManagementService>().addUser(body: body);

    final data =
        Api.unwrap<Map<String, dynamic>>((final data) => data, response);

    if (data.success) {
      final user = User.fromJson(data.payload["user"] as Map<String, dynamic>);

      if (state.isLoading || state.hasError) {
        throw StateError(
            "Tried to update list of users while it was being updated");
      }

      final current = state.requireValue;

      state = AsyncData([...current, user]);
    } else {
      throw SPMException(
        (response.error as Map<String, dynamic>)['message'] as String? ??
            'There was an unexpected problem while creating the user.',
      );
    }
  }

  // Removes a user from the database
  Future<void> removeUser({required final String id}) async {
    final response =
        await getApiService<UserManagementService>().removeUser(id: id);

    final data =
        Api.unwrap<Map<String, dynamic>>((final data) => data, response);

    if (data.success) {
      if (state.isLoading || state.hasError) {
        throw StateError(
            "Tried to update list of users while it was being updated");
      }

      final newData =
          state.requireValue.where((final user) => user.id != id).toList();

      state = AsyncData(newData);
    }
  }

  // Edits a user in the database
  Future<void> editUser(
      {required final Map<String, dynamic> body,
      required final String id}) async {
    final response = await getApiService<UserManagementService>()
        .editUser(body: body, id: id);

    final data =
        Api.unwrap<Map<String, dynamic>>((final data) => data, response);

    if (data.success) {
      if (state.isLoading || state.hasError) {
        throw StateError(
            "Tried to update list of users while it was being updated");
      }
    }

    final updatedUser = data.payload['user'] as Map<String, dynamic>;

    final updated = state.requireValue
        .map((final user) => user.id == id ? User.fromJson(updatedUser) : user)
        .toList();

    state = AsyncData(updated);
  }
}
