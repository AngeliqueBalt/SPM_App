// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submissions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$classSubmissionsHash() => r'93c34c8e385c3fe788cb58c34198fb33b5483fdf';

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

/// See also [classSubmissions].
@ProviderFor(classSubmissions)
const classSubmissionsProvider = ClassSubmissionsFamily();

/// See also [classSubmissions].
class ClassSubmissionsFamily extends Family<AsyncValue<List<Submission>>> {
  /// See also [classSubmissions].
  const ClassSubmissionsFamily();

  /// See also [classSubmissions].
  ClassSubmissionsProvider call(
    String classId,
  ) {
    return ClassSubmissionsProvider(
      classId,
    );
  }

  @override
  ClassSubmissionsProvider getProviderOverride(
    covariant ClassSubmissionsProvider provider,
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
  String? get name => r'classSubmissionsProvider';
}

/// See also [classSubmissions].
class ClassSubmissionsProvider
    extends AutoDisposeFutureProvider<List<Submission>> {
  /// See also [classSubmissions].
  ClassSubmissionsProvider(
    String classId,
  ) : this._internal(
          (ref) => classSubmissions(
            ref as ClassSubmissionsRef,
            classId,
          ),
          from: classSubmissionsProvider,
          name: r'classSubmissionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$classSubmissionsHash,
          dependencies: ClassSubmissionsFamily._dependencies,
          allTransitiveDependencies:
              ClassSubmissionsFamily._allTransitiveDependencies,
          classId: classId,
        );

  ClassSubmissionsProvider._internal(
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
    FutureOr<List<Submission>> Function(ClassSubmissionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClassSubmissionsProvider._internal(
        (ref) => create(ref as ClassSubmissionsRef),
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
  AutoDisposeFutureProviderElement<List<Submission>> createElement() {
    return _ClassSubmissionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClassSubmissionsProvider && other.classId == classId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClassSubmissionsRef on AutoDisposeFutureProviderRef<List<Submission>> {
  /// The parameter `classId` of this provider.
  String get classId;
}

class _ClassSubmissionsProviderElement
    extends AutoDisposeFutureProviderElement<List<Submission>>
    with ClassSubmissionsRef {
  _ClassSubmissionsProviderElement(super.provider);

  @override
  String get classId => (origin as ClassSubmissionsProvider).classId;
}

String _$submissionInfoHash() => r'9d764733d361c4420b42492b1dd70043bdf80ecb';

/// See also [submissionInfo].
@ProviderFor(submissionInfo)
const submissionInfoProvider = SubmissionInfoFamily();

/// See also [submissionInfo].
class SubmissionInfoFamily extends Family<AsyncValue<Submission?>> {
  /// See also [submissionInfo].
  const SubmissionInfoFamily();

  /// See also [submissionInfo].
  SubmissionInfoProvider call(
    String quizId,
  ) {
    return SubmissionInfoProvider(
      quizId,
    );
  }

  @override
  SubmissionInfoProvider getProviderOverride(
    covariant SubmissionInfoProvider provider,
  ) {
    return call(
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
  String? get name => r'submissionInfoProvider';
}

/// See also [submissionInfo].
class SubmissionInfoProvider extends AutoDisposeFutureProvider<Submission?> {
  /// See also [submissionInfo].
  SubmissionInfoProvider(
    String quizId,
  ) : this._internal(
          (ref) => submissionInfo(
            ref as SubmissionInfoRef,
            quizId,
          ),
          from: submissionInfoProvider,
          name: r'submissionInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionInfoHash,
          dependencies: SubmissionInfoFamily._dependencies,
          allTransitiveDependencies:
              SubmissionInfoFamily._allTransitiveDependencies,
          quizId: quizId,
        );

  SubmissionInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quizId,
  }) : super.internal();

  final String quizId;

  @override
  Override overrideWith(
    FutureOr<Submission?> Function(SubmissionInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionInfoProvider._internal(
        (ref) => create(ref as SubmissionInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quizId: quizId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Submission?> createElement() {
    return _SubmissionInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmissionInfoProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionInfoRef on AutoDisposeFutureProviderRef<Submission?> {
  /// The parameter `quizId` of this provider.
  String get quizId;
}

class _SubmissionInfoProviderElement
    extends AutoDisposeFutureProviderElement<Submission?>
    with SubmissionInfoRef {
  _SubmissionInfoProviderElement(super.provider);

  @override
  String get quizId => (origin as SubmissionInfoProvider).quizId;
}

String _$classActiveQuizSubmissionHash() =>
    r'2cdadaaf065140b0f0b0b0032dca2b73d7292410';

/// See also [classActiveQuizSubmission].
@ProviderFor(classActiveQuizSubmission)
const classActiveQuizSubmissionProvider = ClassActiveQuizSubmissionFamily();

/// See also [classActiveQuizSubmission].
class ClassActiveQuizSubmissionFamily extends Family<AsyncValue<Submission?>> {
  /// See also [classActiveQuizSubmission].
  const ClassActiveQuizSubmissionFamily();

  /// See also [classActiveQuizSubmission].
  ClassActiveQuizSubmissionProvider call(
    String classId,
  ) {
    return ClassActiveQuizSubmissionProvider(
      classId,
    );
  }

  @override
  ClassActiveQuizSubmissionProvider getProviderOverride(
    covariant ClassActiveQuizSubmissionProvider provider,
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
  String? get name => r'classActiveQuizSubmissionProvider';
}

/// See also [classActiveQuizSubmission].
class ClassActiveQuizSubmissionProvider
    extends AutoDisposeFutureProvider<Submission?> {
  /// See also [classActiveQuizSubmission].
  ClassActiveQuizSubmissionProvider(
    String classId,
  ) : this._internal(
          (ref) => classActiveQuizSubmission(
            ref as ClassActiveQuizSubmissionRef,
            classId,
          ),
          from: classActiveQuizSubmissionProvider,
          name: r'classActiveQuizSubmissionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$classActiveQuizSubmissionHash,
          dependencies: ClassActiveQuizSubmissionFamily._dependencies,
          allTransitiveDependencies:
              ClassActiveQuizSubmissionFamily._allTransitiveDependencies,
          classId: classId,
        );

  ClassActiveQuizSubmissionProvider._internal(
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
    FutureOr<Submission?> Function(ClassActiveQuizSubmissionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClassActiveQuizSubmissionProvider._internal(
        (ref) => create(ref as ClassActiveQuizSubmissionRef),
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
  AutoDisposeFutureProviderElement<Submission?> createElement() {
    return _ClassActiveQuizSubmissionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClassActiveQuizSubmissionProvider &&
        other.classId == classId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, classId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClassActiveQuizSubmissionRef
    on AutoDisposeFutureProviderRef<Submission?> {
  /// The parameter `classId` of this provider.
  String get classId;
}

class _ClassActiveQuizSubmissionProviderElement
    extends AutoDisposeFutureProviderElement<Submission?>
    with ClassActiveQuizSubmissionRef {
  _ClassActiveQuizSubmissionProviderElement(super.provider);

  @override
  String get classId => (origin as ClassActiveQuizSubmissionProvider).classId;
}

String _$submissionsHash() => r'99073c3f3afaff7ca721c26f2dd5c771524c4143';

/// Provider to deal with the state of the submissions
///
/// Copied from [Submissions].
@ProviderFor(Submissions)
final submissionsProvider =
    AutoDisposeAsyncNotifierProvider<Submissions, List<Submission>>.internal(
  Submissions.new,
  name: r'submissionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$submissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Submissions = AutoDisposeAsyncNotifier<List<Submission>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
