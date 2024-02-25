import 'package:chopper/chopper.dart';

part 'users.chopper.dart';

@ChopperApi(baseUrl: '/user')
abstract class UsersService extends ChopperService {
  static UsersService create([final ChopperClient? client]) =>
      _$UsersService(client);

  // any user view their info on profile
  @Get()
  Future<Response<Map<String, dynamic>>> getCurrent();

// TODO(A): DOES THIS HAVE TO BE DONE HERE? SHOULD THIS ACTUALLY HAVE TO BE IN THE CLASSES SERVICE

// Teacher view list of students in each of their classes
//   @Get(path: '')
//   Future<Response<List<User>>> teacherViewStudents ({
//
//   });
}
