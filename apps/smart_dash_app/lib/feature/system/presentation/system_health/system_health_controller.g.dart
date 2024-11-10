// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_health_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$systemHealthScreenControllerHash() =>
    r'b07393a653c391e4115b618637fc1c1f9c2321b8';

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

abstract class _$SystemHealthScreenController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<SystemHealth>> {
  late final SystemHealthQuery query;

  FutureOr<Optional<SystemHealth>> build(
    SystemHealthQuery query,
  );
}

/// See also [SystemHealthScreenController].
@ProviderFor(SystemHealthScreenController)
const systemHealthScreenControllerProvider =
    SystemHealthScreenControllerFamily();

/// See also [SystemHealthScreenController].
class SystemHealthScreenControllerFamily extends Family {
  /// See also [SystemHealthScreenController].
  const SystemHealthScreenControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'systemHealthScreenControllerProvider';

  /// See also [SystemHealthScreenController].
  SystemHealthScreenControllerProvider call(
    SystemHealthQuery query,
  ) {
    return SystemHealthScreenControllerProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  SystemHealthScreenControllerProvider getProviderOverride(
    covariant SystemHealthScreenControllerProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(SystemHealthScreenController Function() create) {
    return _$SystemHealthScreenControllerFamilyOverride(this, create);
  }
}

class _$SystemHealthScreenControllerFamilyOverride implements FamilyOverride {
  _$SystemHealthScreenControllerFamilyOverride(
      this.overriddenFamily, this.create);

  final SystemHealthScreenController Function() create;

  @override
  final SystemHealthScreenControllerFamily overriddenFamily;

  @override
  SystemHealthScreenControllerProvider getProviderOverride(
    covariant SystemHealthScreenControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [SystemHealthScreenController].
class SystemHealthScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SystemHealthScreenController,
        Optional<SystemHealth>> {
  /// See also [SystemHealthScreenController].
  SystemHealthScreenControllerProvider(
    SystemHealthQuery query,
  ) : this._internal(
          () => SystemHealthScreenController()..query = query,
          from: systemHealthScreenControllerProvider,
          name: r'systemHealthScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$systemHealthScreenControllerHash,
          dependencies: SystemHealthScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              SystemHealthScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  SystemHealthScreenControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final SystemHealthQuery query;

  @override
  FutureOr<Optional<SystemHealth>> runNotifierBuild(
    covariant SystemHealthScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(SystemHealthScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SystemHealthScreenControllerProvider._internal(
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
  (SystemHealthQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SystemHealthScreenController,
      Optional<SystemHealth>> createElement() {
    return _SystemHealthScreenControllerProviderElement(this);
  }

  SystemHealthScreenControllerProvider _copyWith(
    SystemHealthScreenController Function() create,
  ) {
    return SystemHealthScreenControllerProvider._internal(
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
    return other is SystemHealthScreenControllerProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SystemHealthScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<SystemHealth>> {
  /// The parameter `query` of this provider.
  SystemHealthQuery get query;
}

class _SystemHealthScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        SystemHealthScreenController,
        Optional<SystemHealth>> with SystemHealthScreenControllerRef {
  _SystemHealthScreenControllerProviderElement(super.provider);

  @override
  SystemHealthQuery get query =>
      (origin as SystemHealthScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
