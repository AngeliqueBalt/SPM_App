// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submissions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionsHash() => r'ef06b046b075fb61a0448ff88f508b6a2d367761';

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

abstract class _$Submissions
    extends BuildlessAutoDisposeAsyncNotifier<List<Submission>> {
  late final String classId;
  late final String quizId;

  FutureOr<List<Submission>> build(
    String classId,
    String quizId,
  );
}

/// Provider to deal with the state of the submissions
///
/// Copied from [Submissions].
@ProviderFor(Submissions)
const submissionsProvider = SubmissionsFamily();

/// Provider to deal with the state of the submissions
///
/// Copied from [Submissions].
class SubmissionsFamily extends Family<AsyncValue<List<Submission>>> {
  /// Provider to deal with the state of the submissions
  ///
  /// Copied from [Submissions].
  const SubmissionsFamily();

  /// Provider to deal with the state of the submissions
  ///
  /// Copied from [Submissions].
  SubmissionsProvider call(
    String classId,
    String quizId,
  ) {
    return SubmissionsProvider(
      classId,
      quizId,
    );
  }

  @override
  SubmissionsProvider getProviderOverride(
    covariant SubmissionsProvider provider,
  ) {
    return call(
      provider.classId,
      provider.quizId,
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
  String? get name => r'submissionsProvider';
}

/// Provider to deal with the state of the submissions
///
/// Copied from [Submissions].
class SubmissionsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    Submissions, List<Submission>> {
  /// Provider to deal with the state of the submissions
  ///
  /// Copied from [Submissions].
  SubmissionsProvider(
    String classId,
    String quizId,
  ) : this._internal(
          () => Submissions()
            ..classId = classId
            ..quizId = quizId,
          from: submissionsProvider,
          name: r'submissionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionsHash,
          dependencies: SubmissionsFamily._dependencies,
          allTransitiveDependencies:
              SubmissionsFamily._allTransitiveDependencies,
          classId: classId,
          quizId: quizId,
        );

  SubmissionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.classId,
    required this.quizId,
  }) : super.internal();

  final String classId;
  final String quizId;

  @override
  FutureOr<List<Submission>> runNotifierBuild(
    covariant Submissions notifier,
  ) {
    return notifier.build(
      classId,
      quizId,
    );
  }

  @override
  Override overrideWith(Submissions Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubmissionsProvider._internal(
        () => create()
          ..classId = classId
          ..quizId = quizId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        classId: classId,
        quizId: quizId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Submissions, List<Submission>>
      createElement() {
    return _SubmissionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionsProvider &&
        other.classId == classId &&
        other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classId.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionsRef on AutoDisposeAsyncNotifierProviderRef<List<Submission>> {
  /// The parameter `classId` of this provider.
  String get classId;

  /// The parameter `quizId` of this provider.
  String get quizId;
}

class _SubmissionsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Submissions,
        List<Submission>> with SubmissionsRef {
  _SubmissionsProviderElement(super.provider);

  @override
  String get classId => (origin as SubmissionsProvider).classId;
  @override
  String get quizId => (origin as SubmissionsProvider).quizId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
