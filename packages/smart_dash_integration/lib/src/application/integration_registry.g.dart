// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration_registry.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$integrationRegistryHash() =>
    r'3a136774116c3b6b5ebb30cdde9b9b4fdb1423e3';

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
class IntegrationRegistryFamily extends Family<IntegrationRegistry> {
  /// See also [integrationRegistry].
  const IntegrationRegistryFamily();

  /// See also [integrationRegistry].
  IntegrationRegistryProvider call(
    String baseUrl,
  ) {
    return IntegrationRegistryProvider(
      baseUrl,
    );
  }

  @override
  IntegrationRegistryProvider getProviderOverride(
    covariant IntegrationRegistryProvider provider,
  ) {
    return call(
      provider.baseUrl,
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
  String? get name => r'integrationRegistryProvider';
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
    super._createNotifier, {
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
    IntegrationRegistry Function(IntegrationRegistryRef provider) create,
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
  ProviderElement<IntegrationRegistry> createElement() {
    return _IntegrationRegistryProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
