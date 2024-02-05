import 'package:chopper/chopper.dart';

part 'users.chopper.dart';

@ChopperApi(baseUrl: '/users')
abstract class UsersService extends ChopperService {}
