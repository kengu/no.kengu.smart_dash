// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_health_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$systemHealthScreenControllerHash() =>
    r'8d390c63c16d9bd4abbc88d821f3810f7213d4f2';

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
class SystemHealthScreenControllerFamily
    extends Family<AsyncValue<Optional<SystemHealth>>> {
  /// See also [SystemHealthScreenController].
  const SystemHealthScreenControllerFamily();

  /// See also [SystemHealthScreenController].
  SystemHealthScreenControllerProvider call(
    SystemHealthQuery query,
  ) {
    return SystemHealthScreenControllerProvider(
      query,
    );
  }

  @override
  SystemHealthScreenControllerProvider getProviderOverride(
    covariant SystemHealthScreenControllerProvider provider,
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
  String? get name => r'systemHealthScreenControllerProvider';
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
    super._createNotifier, {
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
  AutoDisposeAsyncNotifierProviderElement<SystemHealthScreenController,
      Optional<SystemHealth>> createElement() {
    return _SystemHealthScreenControllerProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
