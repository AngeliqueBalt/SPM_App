import 'package:chopper/chopper.dart';

part 'users.chopper.dart';

@ChopperApi(baseUrl: '/user')
abstract class UsersService extends ChopperService {
  static UsersService create([final ChopperClient? client]) =>
      _$UsersService(client);

  // any user view their info on profile
  @Get()
  Future<Response<Map<String, dynamic>>> getCurrent();
}
