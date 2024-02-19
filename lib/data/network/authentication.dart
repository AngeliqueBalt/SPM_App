import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'authentication.chopper.dart';

@ChopperApi(baseUrl: '/_auth')
abstract class AuthenticationService extends ChopperService {
  static AuthenticationService create([ChopperClient? client]) =>
      _$AuthenticationService(client);

  @Post(path: '/login')
  Future<RawApiResponse> login({
    @Field() required String email,
    @Field() required String password,
  });

  @Post(path: '/logout', optionalBody: true)
  Future<Response> logout();
}
