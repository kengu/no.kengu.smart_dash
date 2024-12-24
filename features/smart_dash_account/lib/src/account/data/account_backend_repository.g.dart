// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_backend_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$backendAccountRepositoryHash() =>
    r'bff53cfa490c2012f823cef8ca8a600a36c30b74';

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

/// See also [backendAccountRepository].
@ProviderFor(backendAccountRepository)
const backendAccountRepositoryProvider = BackendAccountRepositoryFamily();

/// See also [backendAccountRepository].
class BackendAccountRepositoryFamily extends Family {
  /// See also [backendAccountRepository].
  const BackendAccountRepositoryFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'backendAccountRepositoryProvider';

  /// See also [backendAccountRepository].
  BackendAccountRepositoryProvider call(
    String dbPath,
  ) {
    return BackendAccountRepositoryProvider(
      dbPath,
    );
  }

  @visibleForOverriding
  @override
  BackendAccountRepositoryProvider getProviderOverride(
    covariant BackendAccountRepositoryProvider provider,
  ) {
    return call(
      provider.dbPath,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      BackendAccountRepository Function(BackendAccountRepositoryRef ref)
          create) {
    return _$BackendAccountRepositoryFamilyOverride(this, create);
  }
}

class _$BackendAccountRepositoryFamilyOverride implements FamilyOverride {
  _$BackendAccountRepositoryFamilyOverride(this.overriddenFamily, this.create);

  final BackendAccountRepository Function(BackendAccountRepositoryRef ref)
      create;

  @override
  final BackendAccountRepositoryFamily overriddenFamily;

  @override
  BackendAccountRepositoryProvider getProviderOverride(
    covariant BackendAccountRepositoryProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [backendAccountRepository].
class BackendAccountRepositoryProvider
    extends Provider<BackendAccountRepository> {
  /// See also [backendAccountRepository].
  BackendAccountRepositoryProvider(
    String dbPath,
  ) : this._internal(
          (ref) => backendAccountRepository(
            ref as BackendAccountRepositoryRef,
            dbPath,
          ),
          from: backendAccountRepositoryProvider,
          name: r'backendAccountRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$backendAccountRepositoryHash,
          dependencies: BackendAccountRepositoryFamily._dependencies,
          allTransitiveDependencies:
              BackendAccountRepositoryFamily._allTransitiveDependencies,
          dbPath: dbPath,
        );

  BackendAccountRepositoryProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dbPath,
  }) : super.internal();

  final String dbPath;

  @override
  Override overrideWith(
    BackendAccountRepository Function(BackendAccountRepositoryRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BackendAccountRepositoryProvider._internal(
        (ref) => create(ref as BackendAccountRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dbPath: dbPath,
      ),
    );
  }

  @override
  (String,) get argument {
    return (dbPath,);
  }

  @override
  ProviderElement<BackendAccountRepository> createElement() {
    return _BackendAccountRepositoryProviderElement(this);
  }

  BackendAccountRepositoryProvider _copyWith(
    BackendAccountRepository Function(BackendAccountRepositoryRef ref) create,
  ) {
    return BackendAccountRepositoryProvider._internal(
      (ref) => create(ref as BackendAccountRepositoryRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      dbPath: dbPath,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BackendAccountRepositoryProvider && other.dbPath == dbPath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbPath.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BackendAccountRepositoryRef on ProviderRef<BackendAccountRepository> {
  /// The parameter `dbPath` of this provider.
  String get dbPath;
}

class _BackendAccountRepositoryProviderElement
    extends ProviderElement<BackendAccountRepository>
    with BackendAccountRepositoryRef {
  _BackendAccountRepositoryProviderElement(super.provider);

  @override
  String get dbPath => (origin as BackendAccountRepositoryProvider).dbPath;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
