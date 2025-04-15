// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountServiceHash() => r'4e729f0da330af94a85e44d1824b8a55a719058a';

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

typedef AccountServiceRef = ProviderRef<AccountService>;
String _$getAccountHash() => r'6e5d5c5dc8f50ace2a254dfafc162497d072c871';

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
class GetAccountFamily extends Family {
  /// See also [getAccount].
  const GetAccountFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getAccountProvider';

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

  @visibleForOverriding
  @override
  GetAccountProvider getProviderOverride(
    covariant GetAccountProvider provider,
  ) {
    return call(
      userId: provider.userId,
      ttl: provider.ttl,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Optional<Account>> Function(GetAccountRef ref) create) {
    return _$GetAccountFamilyOverride(this, create);
  }
}

class _$GetAccountFamilyOverride implements FamilyOverride {
  _$GetAccountFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Optional<Account>> Function(GetAccountRef ref) create;

  @override
  final GetAccountFamily overriddenFamily;

  @override
  GetAccountProvider getProviderOverride(
    covariant GetAccountProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<Optional<Account>> Function(GetAccountRef ref) create,
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
  ({
    String? userId,
    Duration? ttl,
  }) get argument {
    return (
      userId: userId,
      ttl: ttl,
    );
  }

  @override
  AutoDisposeFutureProviderElement<Optional<Account>> createElement() {
    return _GetAccountProviderElement(this);
  }

  GetAccountProvider _copyWith(
    FutureOr<Optional<Account>> Function(GetAccountRef ref) create,
  ) {
    return GetAccountProvider._internal(
      (ref) => create(ref as GetAccountRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      userId: userId,
      ttl: ttl,
    );
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

String _$getCurrentHomeHash() => r'b54bee159603cca39d6c369b6172b35bac32c4a7';

/// See also [getCurrentHome].
@ProviderFor(getCurrentHome)
const getCurrentHomeProvider = GetCurrentHomeFamily();

/// See also [getCurrentHome].
class GetCurrentHomeFamily extends Family {
  /// See also [getCurrentHome].
  const GetCurrentHomeFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCurrentHomeProvider';

  /// See also [getCurrentHome].
  GetCurrentHomeProvider call([
    String? userId,
  ]) {
    return GetCurrentHomeProvider(
      userId,
    );
  }

  @visibleForOverriding
  @override
  GetCurrentHomeProvider getProviderOverride(
    covariant GetCurrentHomeProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Optional<Home>> Function(GetCurrentHomeRef ref) create) {
    return _$GetCurrentHomeFamilyOverride(this, create);
  }
}

class _$GetCurrentHomeFamilyOverride implements FamilyOverride {
  _$GetCurrentHomeFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Optional<Home>> Function(GetCurrentHomeRef ref) create;

  @override
  final GetCurrentHomeFamily overriddenFamily;

  @override
  GetCurrentHomeProvider getProviderOverride(
    covariant GetCurrentHomeProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<Optional<Home>> Function(GetCurrentHomeRef ref) create,
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
  (String?,) get argument {
    return (userId,);
  }

  @override
  AutoDisposeFutureProviderElement<Optional<Home>> createElement() {
    return _GetCurrentHomeProviderElement(this);
  }

  GetCurrentHomeProvider _copyWith(
    FutureOr<Optional<Home>> Function(GetCurrentHomeRef ref) create,
  ) {
    return GetCurrentHomeProvider._internal(
      (ref) => create(ref as GetCurrentHomeRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      userId: userId,
    );
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

String _$getHomesHash() => r'b0c3f4d0827da25bfd8da875466a1cfa4e474b32';

/// See also [getHomes].
@ProviderFor(getHomes)
const getHomesProvider = GetHomesFamily();

/// See also [getHomes].
class GetHomesFamily extends Family {
  /// See also [getHomes].
  const GetHomesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getHomesProvider';

  /// See also [getHomes].
  GetHomesProvider call([
    String? userId,
  ]) {
    return GetHomesProvider(
      userId,
    );
  }

  @visibleForOverriding
  @override
  GetHomesProvider getProviderOverride(
    covariant GetHomesProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<List<Home>> Function(GetHomesRef ref) create) {
    return _$GetHomesFamilyOverride(this, create);
  }
}

class _$GetHomesFamilyOverride implements FamilyOverride {
  _$GetHomesFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<Home>> Function(GetHomesRef ref) create;

  @override
  final GetHomesFamily overriddenFamily;

  @override
  GetHomesProvider getProviderOverride(
    covariant GetHomesProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<List<Home>> Function(GetHomesRef ref) create,
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
  (String?,) get argument {
    return (userId,);
  }

  @override
  AutoDisposeFutureProviderElement<List<Home>> createElement() {
    return _GetHomesProviderElement(this);
  }

  GetHomesProvider _copyWith(
    FutureOr<List<Home>> Function(GetHomesRef ref) create,
  ) {
    return GetHomesProvider._internal(
      (ref) => create(ref as GetHomesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      userId: userId,
    );
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
    r'1beff0904dd4899506709df4b122243de8c0a7c0';

/// See also [getCurrentIntegrationRegistry].
@ProviderFor(getCurrentIntegrationRegistry)
const getCurrentIntegrationRegistryProvider =
    GetCurrentIntegrationRegistryFamily();

/// See also [getCurrentIntegrationRegistry].
class GetCurrentIntegrationRegistryFamily extends Family {
  /// See also [getCurrentIntegrationRegistry].
  const GetCurrentIntegrationRegistryFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCurrentIntegrationRegistryProvider';

  /// See also [getCurrentIntegrationRegistry].
  GetCurrentIntegrationRegistryProvider call([
    String? userId,
  ]) {
    return GetCurrentIntegrationRegistryProvider(
      userId,
    );
  }

  @visibleForOverriding
  @override
  GetCurrentIntegrationRegistryProvider getProviderOverride(
    covariant GetCurrentIntegrationRegistryProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Optional<IntegrationRegistry>> Function(
              GetCurrentIntegrationRegistryRef ref)
          create) {
    return _$GetCurrentIntegrationRegistryFamilyOverride(this, create);
  }
}

class _$GetCurrentIntegrationRegistryFamilyOverride implements FamilyOverride {
  _$GetCurrentIntegrationRegistryFamilyOverride(
      this.overriddenFamily, this.create);

  final FutureOr<Optional<IntegrationRegistry>> Function(
      GetCurrentIntegrationRegistryRef ref) create;

  @override
  final GetCurrentIntegrationRegistryFamily overriddenFamily;

  @override
  GetCurrentIntegrationRegistryProvider getProviderOverride(
    covariant GetCurrentIntegrationRegistryProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [getCurrentIntegrationRegistry].
class GetCurrentIntegrationRegistryProvider
    extends AutoDisposeFutureProvider<Optional<IntegrationRegistry>> {
  /// See also [getCurrentIntegrationRegistry].
  GetCurrentIntegrationRegistryProvider([
    String? userId,
  ]) : this._internal(
          (ref) => getCurrentIntegrationRegistry(
            ref as GetCurrentIntegrationRegistryRef,
            userId,
          ),
          from: getCurrentIntegrationRegistryProvider,
          name: r'getCurrentIntegrationRegistryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCurrentIntegrationRegistryHash,
          dependencies: GetCurrentIntegrationRegistryFamily._dependencies,
          allTransitiveDependencies:
              GetCurrentIntegrationRegistryFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetCurrentIntegrationRegistryProvider._internal(
    super.create, {
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
    FutureOr<Optional<IntegrationRegistry>> Function(
            GetCurrentIntegrationRegistryRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCurrentIntegrationRegistryProvider._internal(
        (ref) => create(ref as GetCurrentIntegrationRegistryRef),
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
  (String?,) get argument {
    return (userId,);
  }

  @override
  AutoDisposeFutureProviderElement<Optional<IntegrationRegistry>>
      createElement() {
    return _GetCurrentIntegrationRegistryProviderElement(this);
  }

  GetCurrentIntegrationRegistryProvider _copyWith(
    FutureOr<Optional<IntegrationRegistry>> Function(
            GetCurrentIntegrationRegistryRef ref)
        create,
  ) {
    return GetCurrentIntegrationRegistryProvider._internal(
      (ref) => create(ref as GetCurrentIntegrationRegistryRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      userId: userId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetCurrentIntegrationRegistryProvider &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCurrentIntegrationRegistryRef
    on AutoDisposeFutureProviderRef<Optional<IntegrationRegistry>> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _GetCurrentIntegrationRegistryProviderElement
    extends AutoDisposeFutureProviderElement<Optional<IntegrationRegistry>>
    with GetCurrentIntegrationRegistryRef {
  _GetCurrentIntegrationRegistryProviderElement(super.provider);

  @override
  String? get userId =>
      (origin as GetCurrentIntegrationRegistryProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
