import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/admin.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/user.dart';

part 'users_provider.g.dart';

@riverpod
class Users extends _$Users {
  @override
  Future<List<User>> build() async {
    final response = await getApiService<AdminService>().getAll();
    return Api.unwrapList(User.fromJson, response)!.payload;
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(build);
  }
}
