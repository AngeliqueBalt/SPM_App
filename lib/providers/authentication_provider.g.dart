// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentUserImpl _$$CurrentUserImplFromJson(Map<String, dynamic> json) =>
    _$CurrentUserImpl(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      sessionToken: json['sessionToken'] as String,
    );

Map<String, dynamic> _$$CurrentUserImplToJson(_$CurrentUserImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'sessionToken': instance.sessionToken,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isAuthenticatedHash() => r'9fcc8f901e3a1a6c376f2987f9762b4b165ac42a';

/// See also [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeProvider<AsyncValue<bool>>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAuthenticatedRef = AutoDisposeProviderRef<AsyncValue<bool>>;
String _$authenticationHash() => r'13302b50040ea1b426962af0cb814a983341e316';

/// See also [Authentication].
@ProviderFor(Authentication)
final authenticationProvider =
    AutoDisposeAsyncNotifierProvider<Authentication, CurrentUser?>.internal(
  Authentication.new,
  name: r'authenticationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Authentication = AutoDisposeAsyncNotifier<CurrentUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
