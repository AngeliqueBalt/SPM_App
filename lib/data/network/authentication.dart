import 'package:chopper/chopper.dart';
import 'package:student_progress_monitor_app/models/api.dart';

part 'authentication.chopper.dart';

/// Service for authentication
/// This file contains the http requests for authentication.

@ChopperApi(baseUrl: '/_auth')
abstract class AuthenticationService extends ChopperService {
  static AuthenticationService create([final ChopperClient? client]) =>
      _$AuthenticationService(client);

  // Login
  @Post(path: '/login')
  Future<RawApiResponse> login({
    @Field() required final String email,
    @Field() required final String password,
  });

  // Logout
  @Post(path: '/logout', optionalBody: true)
  Future<Response<void>> logout();
}
