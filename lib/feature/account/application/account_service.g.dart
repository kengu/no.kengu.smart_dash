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
String _$getAccountHash() => r'29b0029fa4b87ec404473e71bf5366d591fda42c';

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
  GetAccountProvider call([
    String? userId,
  ]) {
    return GetAccountProvider(
      userId,
    );
  }

  @visibleForOverriding
  @override
  GetAccountProvider getProviderOverride(
    covariant GetAccountProvider provider,
  ) {
    return call(
      provider.userId,
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
  GetAccountProvider([
    String? userId,
  ]) : this._internal(
          (ref) => getAccount(
            ref as GetAccountRef,
            userId,
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
        );

  GetAccountProvider._internal(
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
      ),
    );
  }

  @override
  (String?,) get argument {
    return (userId,);
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
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetAccountProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAccountRef on AutoDisposeFutureProviderRef<Optional<Account>> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _GetAccountProviderElement
    extends AutoDisposeFutureProviderElement<Optional<Account>>
    with GetAccountRef {
  _GetAccountProviderElement(super.provider);

  @override
  String? get userId => (origin as GetAccountProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
