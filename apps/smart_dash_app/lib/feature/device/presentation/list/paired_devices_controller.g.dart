// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paired_devices_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pairedDevicesScreenControllerHash() =>
    r'1bc21e90e2e74662df70e6f85e07de468b85eda2';

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

abstract class _$PairedDevicesScreenController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<List<Device>>> {
  late final PairedDeviceQuery query;

  FutureOr<Optional<List<Device>>> build(
    PairedDeviceQuery query,
  );
}

/// See also [PairedDevicesScreenController].
@ProviderFor(PairedDevicesScreenController)
const pairedDevicesScreenControllerProvider =
    PairedDevicesScreenControllerFamily();

/// See also [PairedDevicesScreenController].
class PairedDevicesScreenControllerFamily
    extends Family<AsyncValue<Optional<List<Device>>>> {
  /// See also [PairedDevicesScreenController].
  const PairedDevicesScreenControllerFamily();

  /// See also [PairedDevicesScreenController].
  PairedDevicesScreenControllerProvider call(
    PairedDeviceQuery query,
  ) {
    return PairedDevicesScreenControllerProvider(
      query,
    );
  }

  @override
  PairedDevicesScreenControllerProvider getProviderOverride(
    covariant PairedDevicesScreenControllerProvider provider,
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
  String? get name => r'pairedDevicesScreenControllerProvider';
}

/// See also [PairedDevicesScreenController].
class PairedDevicesScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PairedDevicesScreenController,
        Optional<List<Device>>> {
  /// See also [PairedDevicesScreenController].
  PairedDevicesScreenControllerProvider(
    PairedDeviceQuery query,
  ) : this._internal(
          () => PairedDevicesScreenController()..query = query,
          from: pairedDevicesScreenControllerProvider,
          name: r'pairedDevicesScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pairedDevicesScreenControllerHash,
          dependencies: PairedDevicesScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              PairedDevicesScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  PairedDevicesScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final PairedDeviceQuery query;

  @override
  FutureOr<Optional<List<Device>>> runNotifierBuild(
    covariant PairedDevicesScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(PairedDevicesScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PairedDevicesScreenControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PairedDevicesScreenController,
      Optional<List<Device>>> createElement() {
    return _PairedDevicesScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PairedDevicesScreenControllerProvider &&
        other.query == query;
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
mixin PairedDevicesScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<List<Device>>> {
  /// The parameter `query` of this provider.
  PairedDeviceQuery get query;
}

class _PairedDevicesScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PairedDevicesScreenController,
        Optional<List<Device>>> with PairedDevicesScreenControllerRef {
  _PairedDevicesScreenControllerProviderElement(super.provider);

  @override
  PairedDeviceQuery get query =>
      (origin as PairedDevicesScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
