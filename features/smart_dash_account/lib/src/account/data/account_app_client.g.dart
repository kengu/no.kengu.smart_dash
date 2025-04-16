// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_app_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountClientHash() => r'9582238f316b2b355f40ff9bd24a0cdf2bd6078d';

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
class AccountClientFamily extends Family<AccountAppClient> {
  /// See also [accountClient].
  const AccountClientFamily();

  /// See also [accountClient].
  AccountClientProvider call(
    String baseUrl,
  ) {
    return AccountClientProvider(
      baseUrl,
    );
  }

  @override
  AccountClientProvider getProviderOverride(
    covariant AccountClientProvider provider,
  ) {
    return call(
      provider.baseUrl,
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
  String? get name => r'accountClientProvider';
}

/// See also [accountClient].
class AccountClientProvider extends Provider<AccountAppClient> {
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
    super._createNotifier, {
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
    AccountAppClient Function(AccountClientRef provider) create,
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
  ProviderElement<AccountAppClient> createElement() {
    return _AccountClientProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AccountClientRef on ProviderRef<AccountAppClient> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _AccountClientProviderElement extends ProviderElement<AccountAppClient>
    with AccountClientRef {
  _AccountClientProviderElement(super.provider);

  @override
  String get baseUrl => (origin as AccountClientProvider).baseUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
