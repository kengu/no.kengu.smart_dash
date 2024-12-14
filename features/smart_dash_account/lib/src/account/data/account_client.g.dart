// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountClientHash() => r'6688d7fb43667cc42812bd13e912608fa4253750';

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

/// See also [accountClient].
@ProviderFor(accountClient)
const accountClientProvider = AccountClientFamily();

/// See also [accountClient].
class AccountClientFamily extends Family {
  /// See also [accountClient].
  const AccountClientFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'accountClientProvider';

  /// See also [accountClient].
  AccountClientProvider call(
    String baseUrl,
  ) {
    return AccountClientProvider(
      baseUrl,
    );
  }

  @visibleForOverriding
  @override
  AccountClientProvider getProviderOverride(
    covariant AccountClientProvider provider,
  ) {
    return call(
      provider.baseUrl,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(AccountClient Function(AccountClientRef ref) create) {
    return _$AccountClientFamilyOverride(this, create);
  }
}

class _$AccountClientFamilyOverride implements FamilyOverride {
  _$AccountClientFamilyOverride(this.overriddenFamily, this.create);

  final AccountClient Function(AccountClientRef ref) create;

  @override
  final AccountClientFamily overriddenFamily;

  @override
  AccountClientProvider getProviderOverride(
    covariant AccountClientProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [accountClient].
class AccountClientProvider extends Provider<AccountClient> {
  /// See also [accountClient].
  AccountClientProvider(
    String baseUrl,
  ) : this._internal(
          (ref) => accountClient(
            ref as AccountClientRef,
            baseUrl,
          ),
          from: accountClientProvider,
          name: r'accountClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accountClientHash,
          dependencies: AccountClientFamily._dependencies,
          allTransitiveDependencies:
              AccountClientFamily._allTransitiveDependencies,
          baseUrl: baseUrl,
        );

  AccountClientProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.baseUrl,
  }) : super.internal();

  final String baseUrl;

  @override
  Override overrideWith(
    AccountClient Function(AccountClientRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccountClientProvider._internal(
        (ref) => create(ref as AccountClientRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        baseUrl: baseUrl,
      ),
    );
  }

  @override
  (String,) get argument {
    return (baseUrl,);
  }

  @override
  ProviderElement<AccountClient> createElement() {
    return _AccountClientProviderElement(this);
  }

  AccountClientProvider _copyWith(
    AccountClient Function(AccountClientRef ref) create,
  ) {
    return AccountClientProvider._internal(
      (ref) => create(ref as AccountClientRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      baseUrl: baseUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AccountClientProvider && other.baseUrl == baseUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, baseUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccountClientRef on ProviderRef<AccountClient> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _AccountClientProviderElement extends ProviderElement<AccountClient>
    with AccountClientRef {
  _AccountClientProviderElement(super.provider);

  @override
  String get baseUrl => (origin as AccountClientProvider).baseUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
