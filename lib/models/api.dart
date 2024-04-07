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

  factory Api.fromJson(final Map<String, dynamic> json,
          final T Function(Object?) payloadFactory) =>
      _$ApiFromJson(json, (final payload) => payloadFactory(payload));

  static Api<T> unwrap<T>(
    final T Function(Map<String, dynamic>) factory,
    final Response<Map<String, dynamic>> response,
  ) {
    if (null is T &&
        response.body != null &&
        response.body!['payload'] == null) {
      return Api<T>(success: true, payload: null as T);
    }

    return Api<T>.fromJson(
      response.body!,
      (final data) => factory(data as Map<String, dynamic>),
    );
  }

  static Api<T?> unwrapNullable<T>(
    final T Function(Map<String, dynamic>) factory,
    final Response<Map<String, dynamic>> response,
  ) {
    return unwrap(factory, response);
  }

  static Api<List<T>> unwrapList<T>(
    final T Function(Map<String, dynamic>) factory,
    final Response<Map<String, dynamic>> response,
  ) {
    return Api<List<T>>.fromJson(
      response.body!,
      (final data) =>
          (data as List).cast<Map<String, dynamic>>().map(factory).toList(),
    );
  }
}
