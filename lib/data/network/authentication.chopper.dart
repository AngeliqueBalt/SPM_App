// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthenticationService extends AuthenticationService {
  _$AuthenticationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthenticationService;

  @override
  Future<Response<Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) {
    final Uri $url = Uri.parse('/api/_auth/login');
    final $body = <String, dynamic>{
      'email': email,
      'password': password,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<dynamic>> logout() {
    final Uri $url = Uri.parse('/api/_auth/logout');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
