// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repositoryViewModelHash() =>
    r'fc0b77ca186ff47f8af15e4c1594eade0dd594eb';

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

abstract class _$RepositoryViewModel<I, T, Q extends RepositoryQuery<I, T>>
    extends BuildlessAsyncNotifier<Optional<RepositoryState<I, T>>> {
  late final Q query;

  FutureOr<Optional<RepositoryState<I, T>>> build(
    Q query,
  );
}

/// See also [RepositoryViewModel].
@ProviderFor(RepositoryViewModel)
const repositoryViewModelProvider = RepositoryViewModelFamily();

/// See also [RepositoryViewModel].
class RepositoryViewModelFamily extends Family {
  /// See also [RepositoryViewModel].
  const RepositoryViewModelFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'repositoryViewModelProvider';

  /// See also [RepositoryViewModel].
  RepositoryViewModelProvider<I, T, Q>
      call<I, T, Q extends RepositoryQuery<I, T>>(
    Q query,
  ) {
    return RepositoryViewModelProvider<I, T, Q>(
      query,
    );
  }

  @visibleForOverriding
  @override
  RepositoryViewModelProvider<Object?, Object?, RepositoryQuery<I, T>>
      getProviderOverride(
    covariant RepositoryViewModelProvider<Object?, Object?,
            RepositoryQuery<I, T>>
        provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(RepositoryViewModel Function() create) {
    return _$RepositoryViewModelFamilyOverride(this, create);
  }
}

class _$RepositoryViewModelFamilyOverride implements FamilyOverride {
  _$RepositoryViewModelFamilyOverride(this.overriddenFamily, this.create);

  final RepositoryViewModel Function() create;

  @override
  final RepositoryViewModelFamily overriddenFamily;

  @override
  RepositoryViewModelProvider getProviderOverride(
    covariant RepositoryViewModelProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [RepositoryViewModel].
class RepositoryViewModelProvider<I, T, Q extends RepositoryQuery<I, T>>
    extends AsyncNotifierProviderImpl<RepositoryViewModel<I, T, Q>,
        Optional<RepositoryState<I, T>>> {
  /// See also [RepositoryViewModel].
  RepositoryViewModelProvider(
    Q query,
  ) : this._internal(
          () => RepositoryViewModel<I, T, Q>()..query = query,
          from: repositoryViewModelProvider,
          name: r'repositoryViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$repositoryViewModelHash,
          dependencies: RepositoryViewModelFamily._dependencies,
          allTransitiveDependencies:
              RepositoryViewModelFamily._allTransitiveDependencies,
          query: query,
        );

  RepositoryViewModelProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final Q query;

  @override
  FutureOr<Optional<RepositoryState<I, T>>> runNotifierBuild(
    covariant RepositoryViewModel<I, T, Q> notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(RepositoryViewModel<I, T, Q> Function() create) {
    return ProviderOverride(
      origin: this,
      override: RepositoryViewModelProvider<I, T, Q>._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  (Q,) get argument {
    return (query,);
  }

  @override
  AsyncNotifierProviderElement<RepositoryViewModel<I, T, Q>,
      Optional<RepositoryState<I, T>>> createElement() {
    return _RepositoryViewModelProviderElement(this);
  }

  RepositoryViewModelProvider _copyWith(
    RepositoryViewModel Function() create,
  ) {
    return RepositoryViewModelProvider._internal(
      () => create()..query = query,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      query: query,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RepositoryViewModelProvider &&
        other.runtimeType == runtimeType &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, I.hashCode);
    hash = _SystemHash.combine(hash, T.hashCode);
    hash = _SystemHash.combine(hash, Q.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RepositoryViewModelRef<I, T, Q extends RepositoryQuery<I, T>>
    on AsyncNotifierProviderRef<Optional<RepositoryState<I, T>>> {
  /// The parameter `query` of this provider.
  Q get query;
}

class _RepositoryViewModelProviderElement<I, T, Q extends RepositoryQuery<I, T>>
    extends AsyncNotifierProviderElement<RepositoryViewModel<I, T, Q>,
        Optional<RepositoryState<I, T>>> with RepositoryViewModelRef<I, T, Q> {
  _RepositoryViewModelProviderElement(super.provider);

  @override
  Q get query => (origin as RepositoryViewModelProvider<I, T, Q>).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
