import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/classes.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/class.dart';

part 'class_provider.g.dart';

@riverpod
class Classes extends _$Classes {
  @override
  Future<List<Class>> build() async {
    final response = await getApiService<ClassesService>().getClasses();
    return Api.unwrapList(Class.fromJson, response)!.payload;
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(build);
  }
}
