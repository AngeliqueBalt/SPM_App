import 'package:chopper/chopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api.freezed.dart';

part 'api.g.dart';

typedef RawApiResponse = Response<Map<String, dynamic>>;

@Freezed(genericArgumentFactories: true)
class Api<T> with _$Api {
  const factory Api({
    required bool success,
    required T payload,
  }) = _Api;

  // Api<User>.fromJson(snapshot.data!.body!, User.fromJson)

  factory Api.fromJson(
          Map<String, dynamic> json, T Function(Object?) payloadFactory) =>
      _$ApiFromJson(json, (payload) => payloadFactory(payload));

  static Api<T>? unwrap<T>(
    T Function(Map<String, dynamic>) factory,
    Response<Map<String, dynamic>> response,
  ) {
    if (response.body == null) return null;
    return Api<T>.fromJson(
      response.body!,
      (data) => factory(data as Map<String, dynamic>),
    );
  }

  static Api<List<T>>? unwrapList<T>(
    T Function(Map<String, dynamic>) factory,
    Response<Map<String, dynamic>> response,
  ) {
    if (response.body == null) return null;

    return Api<List<T>>.fromJson(
      response.body!,
      (data) =>
          (data as List).cast<Map<String, dynamic>>().map(factory).toList(),
    );
  }
}
