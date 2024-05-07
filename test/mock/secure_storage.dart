import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MockFlutterSecureStorage implements FlutterSecureStorage {
  final Map<String, String> mockStorage = {};

  MockFlutterSecureStorage({
    final Map<String, String> initialData = const {},
  }) {
    mockStorage.addAll(initialData);
  }

  @override
  Future<bool> containsKey({
    required final String key,
    final IOSOptions? iOptions,
    final AndroidOptions? aOptions,
    final LinuxOptions? lOptions,
    final WebOptions? webOptions,
    final MacOsOptions? mOptions,
    final WindowsOptions? wOptions,
  }) async {
    return mockStorage.containsKey(key);
  }

  @override
  Future<void> delete({
    required final String key,
    final IOSOptions? iOptions,
    final AndroidOptions? aOptions,
    final LinuxOptions? lOptions,
    final WebOptions? webOptions,
    final MacOsOptions? mOptions,
    final WindowsOptions? wOptions,
  }) async {
    mockStorage.remove(key);
  }

  @override
  Future<void> deleteAll({
    final IOSOptions? iOptions,
    final AndroidOptions? aOptions,
    final LinuxOptions? lOptions,
    final WebOptions? webOptions,
    final MacOsOptions? mOptions,
    final WindowsOptions? wOptions,
  }) async {
    mockStorage.clear();
  }

  @override
  Future<String?> read({
    required final String key,
    final IOSOptions? iOptions,
    final AndroidOptions? aOptions,
    final LinuxOptions? lOptions,
    final WebOptions? webOptions,
    final MacOsOptions? mOptions,
    final WindowsOptions? wOptions,
  }) async {
    if (!mockStorage.containsKey(key)) {
      return null;
    }

    return mockStorage[key];
  }

  @override
  Future<Map<String, String>> readAll({
    final IOSOptions? iOptions,
    final AndroidOptions? aOptions,
    final LinuxOptions? lOptions,
    final WebOptions? webOptions,
    final MacOsOptions? mOptions,
    final WindowsOptions? wOptions,
  }) async {
    return {...mockStorage};
  }

  @override
  Future<void> write({
    required final String key,
    required final String? value,
    final IOSOptions? iOptions,
    final AndroidOptions? aOptions,
    final LinuxOptions? lOptions,
    final WebOptions? webOptions,
    final MacOsOptions? mOptions,
    final WindowsOptions? wOptions,
  }) async {
    if (value == null) {
      mockStorage.remove(key);
    } else {
      mockStorage[key] = value;
    }
  }

  @override
  AndroidOptions get aOptions => throw UnimplementedError();

  @override
  IOSOptions get iOptions => throw UnimplementedError();

  @override
  LinuxOptions get lOptions => throw UnimplementedError();

  @override
  MacOsOptions get mOptions => throw UnimplementedError();

  @override
  WindowsOptions get wOptions => throw UnimplementedError();

  @override
  WebOptions get webOptions => throw UnimplementedError();
}
