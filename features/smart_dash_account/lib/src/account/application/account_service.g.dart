// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountServiceHash() => r'17493bf6d1164e5584394fcd0cf622e89f685fb6';

/// See also [accountService].
@ProviderFor(accountService)
final accountServiceProvider = Provider<AccountService>.internal(
  accountService,
  name: r'accountServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AccountServiceRef = ProviderRef<AccountService>;
String _$getAccountHash() => r'2044613a16c324b2133bd1e33f30c6133f50d734';

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

/// See also [getAccount].
@ProviderFor(getAccount)
const getAccountProvider = GetAccountFamily();

/// See also [getAccount].
class GetAccountFamily extends Family<AsyncValue<Optional<Account>>> {
  /// See also [getAccount].
  const GetAccountFamily();

  /// See also [getAccount].
  GetAccountProvider call({
    String? userId,
    Duration? ttl,
  }) {
    return GetAccountProvider(
      userId: userId,
      ttl: ttl,
    );
  }

  @override
  GetAccountProvider getProviderOverride(
    covariant GetAccountProvider provider,
  ) {
    return call(
      userId: provider.userId,
      ttl: provider.ttl,
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
  String? get name => r'getAccountProvider';
}

/// See also [getAccount].
class GetAccountProvider extends AutoDisposeFutureProvider<Optional<Account>> {
  /// See also [getAccount].
  GetAccountProvider({
    String? userId,
    Duration? ttl,
  }) : this._internal(
          (ref) => getAccount(
            ref as GetAccountRef,
            userId: userId,
            ttl: ttl,
          ),
          from: getAccountProvider,
          name: r'getAccountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAccountHash,
          dependencies: GetAccountFamily._dependencies,
          allTransitiveDependencies:
              GetAccountFamily._allTransitiveDependencies,
          userId: userId,
          ttl: ttl,
        );

  GetAccountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.ttl,
  }) : super.internal();

  final String? userId;
  final Duration? ttl;

  @override
  Override overrideWith(
    FutureOr<Optional<Account>> Function(GetAccountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAccountProvider._internal(
        (ref) => create(ref as GetAccountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        ttl: ttl,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Optional<Account>> createElement() {
    return _GetAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAccountProvider &&
        other.userId == userId &&
        other.ttl == ttl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, ttl.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetAccountRef on AutoDisposeFutureProviderRef<Optional<Account>> {
  /// The parameter `userId` of this provider.
  String? get userId;

  /// The parameter `ttl` of this provider.
  Duration? get ttl;
}

class _GetAccountProviderElement
    extends AutoDisposeFutureProviderElement<Optional<Account>>
    with GetAccountRef {
  _GetAccountProviderElement(super.provider);

  @override
  String? get userId => (origin as GetAccountProvider).userId;
  @override
  Duration? get ttl => (origin as GetAccountProvider).ttl;
}

String _$getCurrentHomeHash() => r'1acc0b0cb30f92e67ddfa14279f8cdedcf34f964';

/// See also [getCurrentHome].
@ProviderFor(getCurrentHome)
const getCurrentHomeProvider = GetCurrentHomeFamily();

/// See also [getCurrentHome].
class GetCurrentHomeFamily extends Family<AsyncValue<Optional<Home>>> {
  /// See also [getCurrentHome].
  const GetCurrentHomeFamily();

  /// See also [getCurrentHome].
  GetCurrentHomeProvider call([
    String? userId,
  ]) {
    return GetCurrentHomeProvider(
      userId,
    );
  }

  @override
  GetCurrentHomeProvider getProviderOverride(
    covariant GetCurrentHomeProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getCurrentHomeProvider';
}

/// See also [getCurrentHome].
class GetCurrentHomeProvider extends AutoDisposeFutureProvider<Optional<Home>> {
  /// See also [getCurrentHome].
  GetCurrentHomeProvider([
    String? userId,
  ]) : this._internal(
          (ref) => getCurrentHome(
            ref as GetCurrentHomeRef,
            userId,
          ),
          from: getCurrentHomeProvider,
          name: r'getCurrentHomeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCurrentHomeHash,
          dependencies: GetCurrentHomeFamily._dependencies,
          allTransitiveDependencies:
              GetCurrentHomeFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetCurrentHomeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String? userId;

  @override
  Override overrideWith(
    FutureOr<Optional<Home>> Function(GetCurrentHomeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCurrentHomeProvider._internal(
        (ref) => create(ref as GetCurrentHomeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Optional<Home>> createElement() {
    return _GetCurrentHomeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCurrentHomeProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCurrentHomeRef on AutoDisposeFutureProviderRef<Optional<Home>> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _GetCurrentHomeProviderElement
    extends AutoDisposeFutureProviderElement<Optional<Home>>
    with GetCurrentHomeRef {
  _GetCurrentHomeProviderElement(super.provider);

  @override
  String? get userId => (origin as GetCurrentHomeProvider).userId;
}

String _$getHomesHash() => r'3798290dd7c2c14effe1b544d2b1bc6dc77258d3';

/// See also [getHomes].
@ProviderFor(getHomes)
const getHomesProvider = GetHomesFamily();

/// See also [getHomes].
class GetHomesFamily extends Family<AsyncValue<List<Home>>> {
  /// See also [getHomes].
  const GetHomesFamily();

  /// See also [getHomes].
  GetHomesProvider call([
    String? userId,
  ]) {
    return GetHomesProvider(
      userId,
    );
  }

  @override
  GetHomesProvider getProviderOverride(
    covariant GetHomesProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getHomesProvider';
}

/// See also [getHomes].
class GetHomesProvider extends AutoDisposeFutureProvider<List<Home>> {
  /// See also [getHomes].
  GetHomesProvider([
    String? userId,
  ]) : this._internal(
          (ref) => getHomes(
            ref as GetHomesRef,
            userId,
          ),
          from: getHomesProvider,
          name: r'getHomesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getHomesHash,
          dependencies: GetHomesFamily._dependencies,
          allTransitiveDependencies: GetHomesFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetHomesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String? userId;

  @override
  Override overrideWith(
    FutureOr<List<Home>> Function(GetHomesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetHomesProvider._internal(
        (ref) => create(ref as GetHomesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Home>> createElement() {
    return _GetHomesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetHomesProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetHomesRef on AutoDisposeFutureProviderRef<List<Home>> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _GetHomesProviderElement
    extends AutoDisposeFutureProviderElement<List<Home>> with GetHomesRef {
  _GetHomesProviderElement(super.provider);

  @override
  String? get userId => (origin as GetHomesProvider).userId;
}

String _$getCurrentIntegrationRegistryHash() =>
    r'd1af7c0102d0c165407052e31e5c64197f836fb5';

/// See also [getCurrentIntegrationRegistry].
@ProviderFor(getCurrentIntegrationRegistry)
final getCurrentIntegrationRegistryProvider =
    AutoDisposeFutureProvider<Optional<IntegrationRegistry>>.internal(
  getCurrentIntegrationRegistry,
  name: r'getCurrentIntegrationRegistryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentIntegrationRegistryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCurrentIntegrationRegistryRef
    = AutoDisposeFutureProviderRef<Optional<IntegrationRegistry>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
