// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportHash() => r'19690295d0c6a73b9a1dc76f305f7cc408f182e8';

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

/// See also [report].
@ProviderFor(report)
const reportProvider = ReportFamily();

/// See also [report].
class ReportFamily extends Family<AsyncValue<Report?>> {
  /// See also [report].
  const ReportFamily();

  /// See also [report].
  ReportProvider call(
    String quizId,
  ) {
    return ReportProvider(
      quizId,
    );
  }

  @override
  ReportProvider getProviderOverride(
    covariant ReportProvider provider,
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
  String? get name => r'reportProvider';
}

/// See also [report].
class ReportProvider extends AutoDisposeFutureProvider<Report?> {
  /// See also [report].
  ReportProvider(
    String quizId,
  ) : this._internal(
          (ref) => report(
            ref as ReportRef,
            quizId,
          ),
          from: reportProvider,
          name: r'reportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportHash,
          dependencies: ReportFamily._dependencies,
          allTransitiveDependencies: ReportFamily._allTransitiveDependencies,
          quizId: quizId,
        );

  ReportProvider._internal(
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
    FutureOr<Report?> Function(ReportRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReportProvider._internal(
        (ref) => create(ref as ReportRef),
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
  AutoDisposeFutureProviderElement<Report?> createElement() {
    return _ReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportProvider && other.quizId == quizId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quizId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReportRef on AutoDisposeFutureProviderRef<Report?> {
  /// The parameter `quizId` of this provider.
  String get quizId;
}

class _ReportProviderElement extends AutoDisposeFutureProviderElement<Report?>
    with ReportRef {
  _ReportProviderElement(super.provider);

  @override
  String get quizId => (origin as ReportProvider).quizId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
