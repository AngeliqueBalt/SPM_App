// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$classesHash() => r'c0cd451cb0b4161a13a80355145879dc1c7d8d99';

/// See also [classes].
@ProviderFor(classes)
final classesProvider = AutoDisposeFutureProvider<List<Class>>.internal(
  classes,
  name: r'classesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$classesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClassesRef = AutoDisposeFutureProviderRef<List<Class>>;
String _$classInfoHash() => r'b5cf81fd681015c94b656f01422e64e7ae20bf2a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [classInfo].
@ProviderFor(classInfo)
const classInfoProvider = ClassInfoFamily();

/// See also [classInfo].
class ClassInfoFamily extends Family<AsyncValue<Class>> {
  /// See also [classInfo].
  const ClassInfoFamily();

  /// See also [classInfo].
  ClassInfoProvider call(
    String classId,
  ) {
    return ClassInfoProvider(
      classId,
    );
  }

  @override
  ClassInfoProvider getProviderOverride(
    covariant ClassInfoProvider provider,
  ) {
    return call(
      provider.classId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'classInfoProvider';
}

/// See also [classInfo].
class ClassInfoProvider extends AutoDisposeFutureProvider<Class> {
  /// See also [classInfo].
  ClassInfoProvider(
    String classId,
  ) : this._internal(
          (ref) => classInfo(
            ref as ClassInfoRef,
            classId,
          ),
          from: classInfoProvider,
          name: r'classInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$classInfoHash,
          dependencies: ClassInfoFamily._dependencies,
          allTransitiveDependencies: ClassInfoFamily._allTransitiveDependencies,
          classId: classId,
        );

  ClassInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.classId,
  }) : super.internal();

  final String classId;

  @override
  Override overrideWith(
    FutureOr<Class> Function(ClassInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClassInfoProvider._internal(
        (ref) => create(ref as ClassInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        classId: classId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Class> createElement() {
    return _ClassInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClassInfoProvider && other.classId == classId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClassInfoRef on AutoDisposeFutureProviderRef<Class> {
  /// The parameter `classId` of this provider.
  String get classId;
}

class _ClassInfoProviderElement extends AutoDisposeFutureProviderElement<Class>
    with ClassInfoRef {
  _ClassInfoProviderElement(super.provider);

  @override
  String get classId => (origin as ClassInfoProvider).classId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
