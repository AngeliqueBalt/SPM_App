import 'package:chopper/chopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api.freezed.dart';

part 'api.g.dart';

typedef RawApiResponse = Response<Map<String, dynamic>>;

@Freezed(genericArgumentFactories: true)
class Api<T> with _$Api<T> {
  const factory Api({
    required final bool success,
    required final T payload,
  }) = _Api;

  // Api<User>.fromJson(snapshot.data!.body!, User.fromJson)

  factory Api.fromJson(final Map<String, dynamic> json,
          final T Function(Object?) payloadFactory) =>
      _$ApiFromJson(json, (final payload) => payloadFactory(payload));

  static Api<T>? unwrap<T>(
    final T Function(Map<String, dynamic>) factory,
    final Response<Map<String, dynamic>> response,
  ) {
    if (response.body == null) return null;
    return Api<T>.fromJson(
      response.body!,
      (final data) => factory(data as Map<String, dynamic>),
    );
  }

  static Api<List<T>>? unwrapList<T>(
    final T Function(Map<String, dynamic>) factory,
    final Response<Map<String, dynamic>> response,
  ) {
    if (response.body == null) return null;

    return Api<List<T>>.fromJson(
      response.body!,
      (final data) =>
          (data as List).cast<Map<String, dynamic>>().map(factory).toList(),
    );
  }
}
