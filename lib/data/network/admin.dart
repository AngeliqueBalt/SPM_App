import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'admin.chopper.dart';

@ChopperApi(baseUrl: '/admin/users')
abstract class AdminService extends ChopperService {
  static AdminService create([final ChopperClient? client]) =>
      _$AdminService(client);

  // Admin get all users
  @Get(path: '')
  Future<RawApiResponse> getAll();

// Admin add new user
  @Post(path: '')
  Future<RawApiResponse> addUser({
    @Body() required final Map<String, dynamic> body,
  });

// Admin remove user
  @Delete(path: '/{id}')
  Future<RawApiResponse> removeUser({
    @Path() required final String id,
  });

// Admin update user
  @Patch(path: '/{id}')
  Future<RawApiResponse> editUser({
    @Path() required final String id,
    @Body() required final Map<String, dynamic> body,
  });

// Admin view all classes
// @Get(path: '')
// Future<Response<List<User>>> viewAllClasses ({
// });
}
