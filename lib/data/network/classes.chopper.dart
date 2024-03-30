// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ClassesService extends ClassesService {
  _$ClassesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ClassesService;

  @override
  Future<Response<Map<String, dynamic>>> getQuizzes({required String classId}) {
    final Uri $url = Uri.parse('/class/${classId}/quizzes');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> setActiveQuiz({
    required String classId,
    required Map<String, dynamic> body,
  }) {
    final Uri $url = Uri.parse('/class/${classId}/activeQuiz');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
