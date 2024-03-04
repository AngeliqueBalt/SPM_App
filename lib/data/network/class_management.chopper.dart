// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_management.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ClassManagementService extends ClassManagementService {
  _$ClassManagementService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ClassManagementService;

  @override
  Future<Response<Map<String, dynamic>>> getAllClasses() {
    final Uri $url = Uri.parse('/admin/classes');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> addClass(
      {required Map<String, dynamic> body}) {
    final Uri $url = Uri.parse('/admin/classes');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> removeClass({required String id}) {
    final Uri $url = Uri.parse('/admin/classes/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> editClass({
    required String id,
    required Map<String, dynamic> body,
  }) {
    final Uri $url = Uri.parse('/admin/classes/${id}');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
