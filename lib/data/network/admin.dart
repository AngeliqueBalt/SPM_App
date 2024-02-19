import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'admin.chopper.dart';

@ChopperApi(baseUrl: '/admin/users')
abstract class AdminService extends ChopperService {
  static AdminService create([ChopperClient? client]) => _$AdminService(client);

  // Admin get all users
  @Get(path: '')
  Future<RawApiResponse> getAll();

// Admin add new user
  @Post(path: '')
  Future<RawApiResponse> addUser({
    @Body() required Map<String, dynamic> body,
  });

// Admin remove user
// @Delete(path: '/{id}')
// Future<void> removeUser ();

// Admin update user
// @Put(path: '')
// Future<void> updateUser ();

// Admin view all classes
// @Get(path: '')
// Future<Response<List<User>>> viewAllClasses ({
//
// });
}
