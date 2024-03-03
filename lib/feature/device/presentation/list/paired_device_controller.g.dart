// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paired_device_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pairedDeviceScreenControllerHash() =>
    r'0ff3fa1098f4fad948edddf1d8795fe3eabfc793';

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

abstract class _$PairedDeviceScreenController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<List<Device>>> {
  late final PairedDeviceQuery query;

  FutureOr<Optional<List<Device>>> build(
    PairedDeviceQuery query,
  );
}

/// See also [PairedDeviceScreenController].
@ProviderFor(PairedDeviceScreenController)
const pairedDeviceScreenControllerProvider =
    PairedDeviceScreenControllerFamily();

/// See also [PairedDeviceScreenController].
class PairedDeviceScreenControllerFamily extends Family {
  /// See also [PairedDeviceScreenController].
  const PairedDeviceScreenControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pairedDeviceScreenControllerProvider';

  /// See also [PairedDeviceScreenController].
  PairedDeviceScreenControllerProvider call(
    PairedDeviceQuery query,
  ) {
    return PairedDeviceScreenControllerProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  PairedDeviceScreenControllerProvider getProviderOverride(
    covariant PairedDeviceScreenControllerProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(PairedDeviceScreenController Function() create) {
    return _$PairedDeviceScreenControllerFamilyOverride(this, create);
  }
}

class _$PairedDeviceScreenControllerFamilyOverride implements FamilyOverride {
  _$PairedDeviceScreenControllerFamilyOverride(
      this.overriddenFamily, this.create);

  final PairedDeviceScreenController Function() create;

  @override
  final PairedDeviceScreenControllerFamily overriddenFamily;

  @override
  PairedDeviceScreenControllerProvider getProviderOverride(
    covariant PairedDeviceScreenControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [PairedDeviceScreenController].
class PairedDeviceScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PairedDeviceScreenController,
        Optional<List<Device>>> {
  /// See also [PairedDeviceScreenController].
  PairedDeviceScreenControllerProvider(
    PairedDeviceQuery query,
  ) : this._internal(
          () => PairedDeviceScreenController()..query = query,
          from: pairedDeviceScreenControllerProvider,
          name: r'pairedDeviceScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pairedDeviceScreenControllerHash,
          dependencies: PairedDeviceScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              PairedDeviceScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  PairedDeviceScreenControllerProvider._internal(
    super.create, {
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
    covariant PairedDeviceScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(PairedDeviceScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PairedDeviceScreenControllerProvider._internal(
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
  (PairedDeviceQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PairedDeviceScreenController,
      Optional<List<Device>>> createElement() {
    return _PairedDeviceScreenControllerProviderElement(this);
  }

  PairedDeviceScreenControllerProvider _copyWith(
    PairedDeviceScreenController Function() create,
  ) {
    return PairedDeviceScreenControllerProvider._internal(
      () => create()..query = query,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      query: query,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PairedDeviceScreenControllerProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PairedDeviceScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<List<Device>>> {
  /// The parameter `query` of this provider.
  PairedDeviceQuery get query;
}

class _PairedDeviceScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PairedDeviceScreenController,
        Optional<List<Device>>> with PairedDeviceScreenControllerRef {
  _PairedDeviceScreenControllerProviderElement(super.provider);

  @override
  PairedDeviceQuery get query =>
      (origin as PairedDeviceScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
