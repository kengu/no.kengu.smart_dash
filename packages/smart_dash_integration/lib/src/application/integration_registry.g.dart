// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration_registry.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$integrationRegistryHash() =>
    r'ddeed55845d9dfb0622cf69366ea330f15d92f61';

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

/// See also [integrationRegistry].
@ProviderFor(integrationRegistry)
const integrationRegistryProvider = IntegrationRegistryFamily();

/// See also [integrationRegistry].
class IntegrationRegistryFamily extends Family {
  /// See also [integrationRegistry].
  const IntegrationRegistryFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'integrationRegistryProvider';

  /// See also [integrationRegistry].
  IntegrationRegistryProvider call(
    String baseUrl,
  ) {
    return IntegrationRegistryProvider(
      baseUrl,
    );
  }

  @visibleForOverriding
  @override
  IntegrationRegistryProvider getProviderOverride(
    covariant IntegrationRegistryProvider provider,
  ) {
    return call(
      provider.baseUrl,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      IntegrationRegistry Function(IntegrationRegistryRef ref) create) {
    return _$IntegrationRegistryFamilyOverride(this, create);
  }
}

class _$IntegrationRegistryFamilyOverride implements FamilyOverride {
  _$IntegrationRegistryFamilyOverride(this.overriddenFamily, this.create);

  final IntegrationRegistry Function(IntegrationRegistryRef ref) create;

  @override
  final IntegrationRegistryFamily overriddenFamily;

  @override
  IntegrationRegistryProvider getProviderOverride(
    covariant IntegrationRegistryProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [integrationRegistry].
class IntegrationRegistryProvider extends Provider<IntegrationRegistry> {
  /// See also [integrationRegistry].
  IntegrationRegistryProvider(
    String baseUrl,
  ) : this._internal(
          (ref) => integrationRegistry(
            ref as IntegrationRegistryRef,
            baseUrl,
          ),
          from: integrationRegistryProvider,
          name: r'integrationRegistryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$integrationRegistryHash,
          dependencies: IntegrationRegistryFamily._dependencies,
          allTransitiveDependencies:
              IntegrationRegistryFamily._allTransitiveDependencies,
          baseUrl: baseUrl,
        );

  IntegrationRegistryProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.baseUrl,
  }) : super.internal();

  final String baseUrl;

  @override
  Override overrideWith(
    IntegrationRegistry Function(IntegrationRegistryRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IntegrationRegistryProvider._internal(
        (ref) => create(ref as IntegrationRegistryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        baseUrl: baseUrl,
      ),
    );
  }

  @override
  (String,) get argument {
    return (baseUrl,);
  }

  @override
  ProviderElement<IntegrationRegistry> createElement() {
    return _IntegrationRegistryProviderElement(this);
  }

  IntegrationRegistryProvider _copyWith(
    IntegrationRegistry Function(IntegrationRegistryRef ref) create,
  ) {
    return IntegrationRegistryProvider._internal(
      (ref) => create(ref as IntegrationRegistryRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      baseUrl: baseUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IntegrationRegistryProvider && other.baseUrl == baseUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, baseUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IntegrationRegistryRef on ProviderRef<IntegrationRegistry> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _IntegrationRegistryProviderElement
    extends ProviderElement<IntegrationRegistry> with IntegrationRegistryRef {
  _IntegrationRegistryProviderElement(super.provider);

  @override
  String get baseUrl => (origin as IntegrationRegistryProvider).baseUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
