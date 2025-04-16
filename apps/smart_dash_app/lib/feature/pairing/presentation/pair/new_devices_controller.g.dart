// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_devices_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newDevicesScreenControllerHash() =>
    r'd3e1e05316035eff9bdbdeb1900b42db61f8c196';

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

abstract class _$NewDevicesScreenController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<List<Device>>> {
  late final NewDevicesQuery query;

  FutureOr<Optional<List<Device>>> build(
    NewDevicesQuery query,
  );
}

/// See also [NewDevicesScreenController].
@ProviderFor(NewDevicesScreenController)
const newDevicesScreenControllerProvider = NewDevicesScreenControllerFamily();

/// See also [NewDevicesScreenController].
class NewDevicesScreenControllerFamily
    extends Family<AsyncValue<Optional<List<Device>>>> {
  /// See also [NewDevicesScreenController].
  const NewDevicesScreenControllerFamily();

  /// See also [NewDevicesScreenController].
  NewDevicesScreenControllerProvider call(
    NewDevicesQuery query,
  ) {
    return NewDevicesScreenControllerProvider(
      query,
    );
  }

  @override
  NewDevicesScreenControllerProvider getProviderOverride(
    covariant NewDevicesScreenControllerProvider provider,
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
  String? get name => r'newDevicesScreenControllerProvider';
}

/// See also [NewDevicesScreenController].
class NewDevicesScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<NewDevicesScreenController,
        Optional<List<Device>>> {
  /// See also [NewDevicesScreenController].
  NewDevicesScreenControllerProvider(
    NewDevicesQuery query,
  ) : this._internal(
          () => NewDevicesScreenController()..query = query,
          from: newDevicesScreenControllerProvider,
          name: r'newDevicesScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newDevicesScreenControllerHash,
          dependencies: NewDevicesScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              NewDevicesScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  NewDevicesScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final NewDevicesQuery query;

  @override
  FutureOr<Optional<List<Device>>> runNotifierBuild(
    covariant NewDevicesScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(NewDevicesScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: NewDevicesScreenControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<NewDevicesScreenController,
      Optional<List<Device>>> createElement() {
    return _NewDevicesScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewDevicesScreenControllerProvider && other.query == query;
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
mixin NewDevicesScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<List<Device>>> {
  /// The parameter `query` of this provider.
  NewDevicesQuery get query;
}

class _NewDevicesScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NewDevicesScreenController,
        Optional<List<Device>>> with NewDevicesScreenControllerRef {
  _NewDevicesScreenControllerProviderElement(super.provider);

  @override
  NewDevicesQuery get query =>
      (origin as NewDevicesScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
