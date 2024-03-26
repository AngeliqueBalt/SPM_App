import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'user_management.chopper.dart';

/// User management service
/// This file contains the http requests for an admin to get all users, add a new user, remove a user, and edit a user.

@ChopperApi(baseUrl: '/admin/users')
abstract class UserManagementService extends ChopperService {
  static UserManagementService create([final ChopperClient? client]) =>
      _$UserManagementService(client);

  // Get all users
  @Get(path: '')
  Future<RawApiResponse> getAll();

  // Add new user
  @Post(path: '')
  Future<RawApiResponse> addUser({
    @Body() required final Map<String, dynamic> body,
  });

  // Remove user
  @Delete(path: '/{id}')
  Future<RawApiResponse> removeUser({
    @Path() required final String id,
  });

  // Update user
  @Patch(path: '/{id}')
  Future<RawApiResponse> editUser({
    @Path() required final String id,
    @Body() required final Map<String, dynamic> body,
  });
}
