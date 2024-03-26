import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/classes.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/class.dart';

part 'class_provider.g.dart';

/// A provider that fetches a list of classes.

// Gets all classes from the database
@riverpod
Future<List<Class>> classes(final ClassesRef ref) async {
  final response = await getApiService<ClassesService>().getClasses();
  return Api.unwrapList(Class.fromJson, response)!.payload;
}

// Selects the selected class from the list of classes
@riverpod
Future<Class> classInfo(final ClassInfoRef ref, final String classId) async {
  return await ref.watch(classesProvider.selectAsync((final value) =>
      value.where((final Class clazz) => clazz.id == classId).first));
}
