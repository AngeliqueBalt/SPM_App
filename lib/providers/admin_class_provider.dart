import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_progress_monitor_app/data/network/class_management.dart';
import 'package:student_progress_monitor_app/main.dart';
import 'package:student_progress_monitor_app/models/api.dart';
import 'package:student_progress_monitor_app/models/class.dart';
import 'package:student_progress_monitor_app/models/user.dart';

part 'admin_class_provider.g.dart';

/// Provider for the admin classes.
/// This provider is used to ensure the state of the classes is managed.

@riverpod
class AdminClasses extends _$AdminClasses {
  @override
  // Get all classes from the database
  Future<List<Class>> build() async {
    final response =
        await getApiService<ClassManagementService>().getAllClasses();
    return Api.unwrapList(Class.fromJson, response)!.payload;
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(build);
  }

  // Add a class to the database
  Future<void> addClass({required final Map<String, dynamic> body}) async {
    final response =
        await getApiService<ClassManagementService>().addClass(body: body);

    final data =
        Api.unwrap<Map<String, dynamic>>((final data) => data, response);

    if (data?.success ?? false) {
      final clazz =
          Class.fromJson(data?.payload["class"] as Map<String, dynamic>);

      if (state.isLoading || state.hasError) {
        throw StateError(
            "Tried to update list of classes while it was being updated");
      }

      final current = state.requireValue;

      state = AsyncData([...current, clazz]);
    }
  }

  // Remove a class from the database
  Future<void> removeClass({required final String id}) async {
    final response =
        await getApiService<ClassManagementService>().removeClass(id: id);

    final data =
        Api.unwrap<Map<String, dynamic>>((final data) => data, response);

    if (data?.success ?? false) {
      if (state.isLoading || state.hasError) {
        throw StateError(
            "Tried to update list of classes while it was being updated");
      }

      final newData =
          state.requireValue.where((final clazz) => clazz.id != id).toList();

      state = AsyncData(newData);
    }
  }

// DOES NOT WORK, CAN BE FIXED - NEEDS TO GET CORRECT DATA FROM THE DB
// Future<void> editClass(
//     {required final Map<String, dynamic> body,
//     required final String id}) async {
//   // get response from ClassManagementService editClass
//   // it in id of the class as a string
//   // and the body as a Map<String, dynamic>
//   final response = await getApiService<ClassManagementService>()
//       .editClass(id: id, body: body);
//
//   // the response is unwrapped to get data as a Map<String, dynamic>
//   final data =
//       Api.unwrap<Map<String, dynamic>>((final data) => data, response);
//
//   // if data is true then the state can be updated
//   // else the update cannot happen.
//   if (!(data?.success ?? false)) {
//     throw StateError("There was an issue fetching the data");
//   }
//
//   // The state is checked to see if it is loading or has an error
//   if (state.isLoading || state.hasError) {
//     throw StateError(
//         "Tried to update list of classes while it was being updated");
//   }
//
//   // the new values entered for the name, teacher and students are mapped
//   // to the class where the class id matches the id being passed into the function.
//   final updated = state.requireValue
//       .map((final clazz) => clazz.id == id
//           ? clazz.copyWith(
//               name: data!.payload["name"] as String,
//               teacher: User.fromJson(
//                   data.payload["teacher"] as Map<String, dynamic>),
//               students: data.payload["students"] as List<User>)
//           : clazz)
//       .toList();
//
//   state = AsyncData(updated);
// }
}
