import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/classes.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/class.dart';

part 'class_provider.g.dart';

// @riverpod
// class Classes extends _$Classes {
//   @override
//   Future<List<Class>> build() async {
//     final response = await getApiService<ClassesService>().getClasses();
//     return Api.unwrapList(Class.fromJson, response)!.payload;
//   }
//
//   Future<void> refresh() async {
//     state = await AsyncValue.guard(build);
//   }
//
//   Future<Class> getClass({required final String id}) async {
//     final response = await getApiService<ClassesService>().getClass(id: id);
//     return Api.unwrap(Class.fromJson, response)!.payload;
//   }
// }

@riverpod
Future<List<Class>> classes(final ClassesRef ref) async {
  final response = await getApiService<ClassesService>().getClasses();
  return Api.unwrapList(Class.fromJson, response)!.payload;
}

@riverpod
Future<Class> classInfo(final ClassInfoRef ref, final String classId) async {
  return await ref.watch(classesProvider.selectAsync((final value) =>
      value.where((final Class clazz) => clazz.id == classId).first));
}
