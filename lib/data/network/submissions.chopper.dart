// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submissions.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SubmissionsService extends SubmissionsService {
  _$SubmissionsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SubmissionsService;

  @override
  Future<Response<Map<String, dynamic>>> newSubmission({
    required String quizId,
    required String classId,
    required Map<String, dynamic> body,
  }) {
    final Uri $url = Uri.parse('/class/${classId}/quiz/${quizId}/submission');
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
  Future<Response<Map<String, dynamic>>> getSubmissions() {
    final Uri $url = Uri.parse('/user/submissions');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
