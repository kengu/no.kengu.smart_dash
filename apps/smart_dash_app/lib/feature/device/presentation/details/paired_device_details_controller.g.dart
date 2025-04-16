// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paired_device_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pairedDeviceDetailsScreenControllerHash() =>
    r'5a367dd824f571c570eb3604a26888c28b8ec14d';

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

abstract class _$PairedDeviceDetailsScreenController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<Device>> {
  late final PairedDeviceDetailsQuery query;

  FutureOr<Optional<Device>> build(
    PairedDeviceDetailsQuery query,
  );
}

/// See also [PairedDeviceDetailsScreenController].
@ProviderFor(PairedDeviceDetailsScreenController)
const pairedDeviceDetailsScreenControllerProvider =
    PairedDeviceDetailsScreenControllerFamily();

/// See also [PairedDeviceDetailsScreenController].
class PairedDeviceDetailsScreenControllerFamily
    extends Family<AsyncValue<Optional<Device>>> {
  /// See also [PairedDeviceDetailsScreenController].
  const PairedDeviceDetailsScreenControllerFamily();

  /// See also [PairedDeviceDetailsScreenController].
  PairedDeviceDetailsScreenControllerProvider call(
    PairedDeviceDetailsQuery query,
  ) {
    return PairedDeviceDetailsScreenControllerProvider(
      query,
    );
  }

  @override
  PairedDeviceDetailsScreenControllerProvider getProviderOverride(
    covariant PairedDeviceDetailsScreenControllerProvider provider,
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
  String? get name => r'pairedDeviceDetailsScreenControllerProvider';
}

/// See also [PairedDeviceDetailsScreenController].
class PairedDeviceDetailsScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        PairedDeviceDetailsScreenController, Optional<Device>> {
  /// See also [PairedDeviceDetailsScreenController].
  PairedDeviceDetailsScreenControllerProvider(
    PairedDeviceDetailsQuery query,
  ) : this._internal(
          () => PairedDeviceDetailsScreenController()..query = query,
          from: pairedDeviceDetailsScreenControllerProvider,
          name: r'pairedDeviceDetailsScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pairedDeviceDetailsScreenControllerHash,
          dependencies: PairedDeviceDetailsScreenControllerFamily._dependencies,
          allTransitiveDependencies: PairedDeviceDetailsScreenControllerFamily
              ._allTransitiveDependencies,
          query: query,
        );

  PairedDeviceDetailsScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final PairedDeviceDetailsQuery query;

  @override
  FutureOr<Optional<Device>> runNotifierBuild(
    covariant PairedDeviceDetailsScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(PairedDeviceDetailsScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PairedDeviceDetailsScreenControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PairedDeviceDetailsScreenController,
      Optional<Device>> createElement() {
    return _PairedDeviceDetailsScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PairedDeviceDetailsScreenControllerProvider &&
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
mixin PairedDeviceDetailsScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<Device>> {
  /// The parameter `query` of this provider.
  PairedDeviceDetailsQuery get query;
}

class _PairedDeviceDetailsScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PairedDeviceDetailsScreenController,
        Optional<Device>> with PairedDeviceDetailsScreenControllerRef {
  _PairedDeviceDetailsScreenControllerProviderElement(super.provider);

  @override
  PairedDeviceDetailsQuery get query =>
      (origin as PairedDeviceDetailsScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
