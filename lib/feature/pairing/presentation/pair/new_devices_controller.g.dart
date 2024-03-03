// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_devices_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newDevicesScreenControllerHash() =>
    r'9e4d7767ebcccb76c8ee482de8c5d96d357ab0e5';

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
class NewDevicesScreenControllerFamily extends Family {
  /// See also [NewDevicesScreenController].
  const NewDevicesScreenControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newDevicesScreenControllerProvider';

  /// See also [NewDevicesScreenController].
  NewDevicesScreenControllerProvider call(
    NewDevicesQuery query,
  ) {
    return NewDevicesScreenControllerProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  NewDevicesScreenControllerProvider getProviderOverride(
    covariant NewDevicesScreenControllerProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(NewDevicesScreenController Function() create) {
    return _$NewDevicesScreenControllerFamilyOverride(this, create);
  }
}

class _$NewDevicesScreenControllerFamilyOverride implements FamilyOverride {
  _$NewDevicesScreenControllerFamilyOverride(
      this.overriddenFamily, this.create);

  final NewDevicesScreenController Function() create;

  @override
  final NewDevicesScreenControllerFamily overriddenFamily;

  @override
  NewDevicesScreenControllerProvider getProviderOverride(
    covariant NewDevicesScreenControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
  (NewDevicesQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<NewDevicesScreenController,
      Optional<List<Device>>> createElement() {
    return _NewDevicesScreenControllerProviderElement(this);
  }

  NewDevicesScreenControllerProvider _copyWith(
    NewDevicesScreenController Function() create,
  ) {
    return NewDevicesScreenControllerProvider._internal(
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
    return other is NewDevicesScreenControllerProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
