// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizzesHash() => r'b803e804fe60ccd2ae7dbad67d82da3e38797d25';

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

abstract class _$Quizzes extends BuildlessAutoDisposeAsyncNotifier<List<Quiz>> {
  late final String classId;

  FutureOr<List<Quiz>> build(
    String classId,
  );
}

/// See also [Quizzes].
@ProviderFor(Quizzes)
const quizzesProvider = QuizzesFamily();

/// See also [Quizzes].
class QuizzesFamily extends Family<AsyncValue<List<Quiz>>> {
  /// See also [Quizzes].
  const QuizzesFamily();

  /// See also [Quizzes].
  QuizzesProvider call(
    String classId,
  ) {
    return QuizzesProvider(
      classId,
    );
  }

  @override
  QuizzesProvider getProviderOverride(
    covariant QuizzesProvider provider,
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
  String? get name => r'quizzesProvider';
}

/// See also [Quizzes].
class QuizzesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Quizzes, List<Quiz>> {
  /// See also [Quizzes].
  QuizzesProvider(
    String classId,
  ) : this._internal(
          () => Quizzes()..classId = classId,
          from: quizzesProvider,
          name: r'quizzesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quizzesHash,
          dependencies: QuizzesFamily._dependencies,
          allTransitiveDependencies: QuizzesFamily._allTransitiveDependencies,
          classId: classId,
        );

  QuizzesProvider._internal(
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
  FutureOr<List<Quiz>> runNotifierBuild(
    covariant Quizzes notifier,
  ) {
    return notifier.build(
      classId,
    );
  }

  @override
  Override overrideWith(Quizzes Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuizzesProvider._internal(
        () => create()..classId = classId,
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
  AutoDisposeAsyncNotifierProviderElement<Quizzes, List<Quiz>> createElement() {
    return _QuizzesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuizzesProvider && other.classId == classId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuizzesRef on AutoDisposeAsyncNotifierProviderRef<List<Quiz>> {
  /// The parameter `classId` of this provider.
  String get classId;
}

class _QuizzesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Quizzes, List<Quiz>>
    with QuizzesRef {
  _QuizzesProviderElement(super.provider);

  @override
  String get classId => (origin as QuizzesProvider).classId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
