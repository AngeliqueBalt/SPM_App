import 'package:chopper/chopper.dart';

part 'integration_test.chopper.dart';

@ChopperApi(baseUrl: '/debug/integration-test')
abstract class IntegrationTestService extends ChopperService {
  static IntegrationTestService create([final ChopperClient? client]) =>
      _$IntegrationTestService(client);

  // Ping the integration test controller (not active in production)
  @Get(path: '/ping')
  Future<Response<String>> ping();

  // Reset the database
  @Get(path: '/reset')
  Future<Response<String>> reset();
}
