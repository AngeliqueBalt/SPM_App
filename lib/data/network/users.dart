import 'package:chopper/chopper.dart';

part 'users.chopper.dart';

/// Service for user related operations
/// This service contains the http request to get the current user.

@ChopperApi(baseUrl: '/user')
abstract class UsersService extends ChopperService {
  static UsersService create([final ChopperClient? client]) =>
      _$UsersService(client);

  // any user view their info on profile
  @Get()
  Future<Response<Map<String, dynamic>>> getCurrent();
}
