// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pairingScreenControllerHash() =>
    r'281e9e50cb7a7e5db4bb4b06a85a8318a222b72e';

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

abstract class _$PairingScreenController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<IntegrationMap>> {
  late final PairingQuery query;

  FutureOr<Optional<IntegrationMap>> build(
    PairingQuery query,
  );
}

/// See also [PairingScreenController].
@ProviderFor(PairingScreenController)
const pairingScreenControllerProvider = PairingScreenControllerFamily();

/// See also [PairingScreenController].
class PairingScreenControllerFamily
    extends Family<AsyncValue<Optional<IntegrationMap>>> {
  /// See also [PairingScreenController].
  const PairingScreenControllerFamily();

  /// See also [PairingScreenController].
  PairingScreenControllerProvider call(
    PairingQuery query,
  ) {
    return PairingScreenControllerProvider(
      query,
    );
  }

  @override
  PairingScreenControllerProvider getProviderOverride(
    covariant PairingScreenControllerProvider provider,
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
  String? get name => r'pairingScreenControllerProvider';
}

/// See also [PairingScreenController].
class PairingScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PairingScreenController,
        Optional<IntegrationMap>> {
  /// See also [PairingScreenController].
  PairingScreenControllerProvider(
    PairingQuery query,
  ) : this._internal(
          () => PairingScreenController()..query = query,
          from: pairingScreenControllerProvider,
          name: r'pairingScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pairingScreenControllerHash,
          dependencies: PairingScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              PairingScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  PairingScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final PairingQuery query;

  @override
  FutureOr<Optional<IntegrationMap>> runNotifierBuild(
    covariant PairingScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(PairingScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PairingScreenControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PairingScreenController,
      Optional<IntegrationMap>> createElement() {
    return _PairingScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PairingScreenControllerProvider && other.query == query;
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
mixin PairingScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<IntegrationMap>> {
  /// The parameter `query` of this provider.
  PairingQuery get query;
}

class _PairingScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PairingScreenController,
        Optional<IntegrationMap>> with PairingScreenControllerRef {
  _PairingScreenControllerProviderElement(super.provider);

  @override
  PairingQuery get query => (origin as PairingScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
