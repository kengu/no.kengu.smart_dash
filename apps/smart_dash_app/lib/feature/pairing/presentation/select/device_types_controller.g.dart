// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_types_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceTypesScreenControllerHash() =>
    r'edbed5afb123824a8ed56e646703e0a391170050';

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

abstract class _$DeviceTypesScreenController
    extends BuildlessAutoDisposeAsyncNotifier<
        Optional<List<DeviceDefinition>>> {
  late final DeviceTypesQuery query;

  FutureOr<Optional<List<DeviceDefinition>>> build(
    DeviceTypesQuery query,
  );
}

/// See also [DeviceTypesScreenController].
@ProviderFor(DeviceTypesScreenController)
const deviceTypesScreenControllerProvider = DeviceTypesScreenControllerFamily();

/// See also [DeviceTypesScreenController].
class DeviceTypesScreenControllerFamily
    extends Family<AsyncValue<Optional<List<DeviceDefinition>>>> {
  /// See also [DeviceTypesScreenController].
  const DeviceTypesScreenControllerFamily();

  /// See also [DeviceTypesScreenController].
  DeviceTypesScreenControllerProvider call(
    DeviceTypesQuery query,
  ) {
    return DeviceTypesScreenControllerProvider(
      query,
    );
  }

  @override
  DeviceTypesScreenControllerProvider getProviderOverride(
    covariant DeviceTypesScreenControllerProvider provider,
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
  String? get name => r'deviceTypesScreenControllerProvider';
}

/// See also [DeviceTypesScreenController].
class DeviceTypesScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DeviceTypesScreenController,
        Optional<List<DeviceDefinition>>> {
  /// See also [DeviceTypesScreenController].
  DeviceTypesScreenControllerProvider(
    DeviceTypesQuery query,
  ) : this._internal(
          () => DeviceTypesScreenController()..query = query,
          from: deviceTypesScreenControllerProvider,
          name: r'deviceTypesScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deviceTypesScreenControllerHash,
          dependencies: DeviceTypesScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              DeviceTypesScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  DeviceTypesScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final DeviceTypesQuery query;

  @override
  FutureOr<Optional<List<DeviceDefinition>>> runNotifierBuild(
    covariant DeviceTypesScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(DeviceTypesScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeviceTypesScreenControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DeviceTypesScreenController,
      Optional<List<DeviceDefinition>>> createElement() {
    return _DeviceTypesScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceTypesScreenControllerProvider && other.query == query;
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
mixin DeviceTypesScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<List<DeviceDefinition>>> {
  /// The parameter `query` of this provider.
  DeviceTypesQuery get query;
}

class _DeviceTypesScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DeviceTypesScreenController,
        Optional<List<DeviceDefinition>>> with DeviceTypesScreenControllerRef {
  _DeviceTypesScreenControllerProviderElement(super.provider);

  @override
  DeviceTypesQuery get query =>
      (origin as DeviceTypesScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
