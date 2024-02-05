import 'package:chopper/chopper.dart';

part 'authentication.chopper.dart';

@ChopperApi(baseUrl: '/api/_auth')
abstract class AuthenticationService extends ChopperService {
  static AuthenticationService create([ChopperClient? client]) =>
      _$AuthenticationService(client);

  @Post(path: '/login')
  Future<Response<Map<String, dynamic>>> login({
    @Field() required String email,
    @Field() required String password,
  });

  @Post(path: '/logout', optionalBody: true)
  Future<Response> logout();
}
