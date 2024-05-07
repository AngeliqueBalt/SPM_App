// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration_test.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$IntegrationTestService extends IntegrationTestService {
  _$IntegrationTestService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = IntegrationTestService;

  @override
  Future<Response<String>> ping() {
    final Uri $url = Uri.parse('/debug/integration-test/ping');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<String, String>($request);
  }

  @override
  Future<Response<String>> reset() {
    final Uri $url = Uri.parse('/debug/integration-test/reset');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<String, String>($request);
  }
}
