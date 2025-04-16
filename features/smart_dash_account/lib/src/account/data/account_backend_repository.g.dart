// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_backend_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$backendAccountRepositoryHash() =>
    r'f2bd841e6d041f1ca6b1169817085895355d3e3e';

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
class BackendAccountRepositoryFamily extends Family<AccountBackendRepository> {
  /// See also [backendAccountRepository].
  const BackendAccountRepositoryFamily();

  /// See also [backendAccountRepository].
  BackendAccountRepositoryProvider call(
    String dbPath,
  ) {
    return BackendAccountRepositoryProvider(
      dbPath,
    );
  }

  @override
  BackendAccountRepositoryProvider getProviderOverride(
    covariant BackendAccountRepositoryProvider provider,
  ) {
    return call(
      provider.dbPath,
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
  String? get name => r'backendAccountRepositoryProvider';
}

/// See also [backendAccountRepository].
class BackendAccountRepositoryProvider
    extends Provider<AccountBackendRepository> {
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
    super._createNotifier, {
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
    AccountBackendRepository Function(BackendAccountRepositoryRef provider)
        create,
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
  ProviderElement<AccountBackendRepository> createElement() {
    return _BackendAccountRepositoryProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BackendAccountRepositoryRef on ProviderRef<AccountBackendRepository> {
  /// The parameter `dbPath` of this provider.
  String get dbPath;
}

class _BackendAccountRepositoryProviderElement
    extends ProviderElement<AccountBackendRepository>
    with BackendAccountRepositoryRef {
  _BackendAccountRepositoryProviderElement(super.provider);

  @override
  String get dbPath => (origin as BackendAccountRepositoryProvider).dbPath;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
