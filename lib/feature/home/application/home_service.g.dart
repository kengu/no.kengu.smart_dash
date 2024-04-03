// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeServiceHash() => r'd07e4100d7e3e0c2e91f8f2dd9927bf3d1abaa21';

/// See also [homeService].
@ProviderFor(homeService)
final homeServiceProvider = Provider<HomeService>.internal(
  homeService,
  name: r'homeServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HomeServiceRef = ProviderRef<HomeService>;
String _$getCurrentHomeHash() => r'424ecc0a72fa3998e4803aad187a7dd766dbca2c';

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

String _$getHomesHash() => r'cb3848dde16fd1ef52f47fd4ce01e63c02ee5f6b';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
