// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$QuizzesService extends QuizzesService {
  _$QuizzesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = QuizzesService;

  @override
  Future<Response<Map<String, dynamic>>> addQuiz({
    required String classId,
    required Map<String, dynamic> body,
  }) {
    final Uri $url = Uri.parse('/class/${classId}/quiz');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
