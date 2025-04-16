// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_form_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountFormScreenControllerHash() =>
    r'f59aa4dacb935109067a531e4aff2031f97faab4';

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

abstract class _$AccountFormScreenController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<Account>> {
  late final AccountQuery query;

  FutureOr<Optional<Account>> build(
    AccountQuery query,
  );
}

/// See also [AccountFormScreenController].
@ProviderFor(AccountFormScreenController)
const accountFormScreenControllerProvider = AccountFormScreenControllerFamily();

/// See also [AccountFormScreenController].
class AccountFormScreenControllerFamily
    extends Family<AsyncValue<Optional<Account>>> {
  /// See also [AccountFormScreenController].
  const AccountFormScreenControllerFamily();

  /// See also [AccountFormScreenController].
  AccountFormScreenControllerProvider call(
    AccountQuery query,
  ) {
    return AccountFormScreenControllerProvider(
      query,
    );
  }

  @override
  AccountFormScreenControllerProvider getProviderOverride(
    covariant AccountFormScreenControllerProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'accountFormScreenControllerProvider';
}

/// See also [AccountFormScreenController].
class AccountFormScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AccountFormScreenController,
        Optional<Account>> {
  /// See also [AccountFormScreenController].
  AccountFormScreenControllerProvider(
    AccountQuery query,
  ) : this._internal(
          () => AccountFormScreenController()..query = query,
          from: accountFormScreenControllerProvider,
          name: r'accountFormScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accountFormScreenControllerHash,
          dependencies: AccountFormScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              AccountFormScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  AccountFormScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final AccountQuery query;

  @override
  FutureOr<Optional<Account>> runNotifierBuild(
    covariant AccountFormScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(AccountFormScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AccountFormScreenControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AccountFormScreenController,
      Optional<Account>> createElement() {
    return _AccountFormScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountFormScreenControllerProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AccountFormScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<Account>> {
  /// The parameter `query` of this provider.
  AccountQuery get query;
}

class _AccountFormScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AccountFormScreenController,
        Optional<Account>> with AccountFormScreenControllerRef {
  _AccountFormScreenControllerProviderElement(super.provider);

  @override
  AccountQuery get query =>
      (origin as AccountFormScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
