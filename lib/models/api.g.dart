// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiImpl<T> _$$ApiImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiImpl<T>(
      success: json['success'] as bool,
      payload: fromJsonT(json['payload']),
    );

Map<String, dynamic> _$$ApiImplToJson<T>(
  _$ApiImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'payload': toJsonT(instance.payload),
    };
