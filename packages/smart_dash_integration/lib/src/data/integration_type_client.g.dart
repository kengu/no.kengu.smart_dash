// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration_type_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$integrationClientHash() => r'950ae0eb736097321642053b413154de6bd5e707';

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

/// See also [integrationClient].
@ProviderFor(integrationClient)
const integrationClientProvider = IntegrationClientFamily();

/// See also [integrationClient].
class IntegrationClientFamily extends Family<IntegrationTypeClient> {
  /// See also [integrationClient].
  const IntegrationClientFamily();

  /// See also [integrationClient].
  IntegrationClientProvider call(
    String baseUrl,
  ) {
    return IntegrationClientProvider(
      baseUrl,
    );
  }

  @override
  IntegrationClientProvider getProviderOverride(
    covariant IntegrationClientProvider provider,
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
  String? get name => r'integrationClientProvider';
}

/// See also [integrationClient].
class IntegrationClientProvider extends Provider<IntegrationTypeClient> {
  /// See also [integrationClient].
  IntegrationClientProvider(
    String baseUrl,
  ) : this._internal(
          (ref) => integrationClient(
            ref as IntegrationClientRef,
            baseUrl,
          ),
          from: integrationClientProvider,
          name: r'integrationClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$integrationClientHash,
          dependencies: IntegrationClientFamily._dependencies,
          allTransitiveDependencies:
              IntegrationClientFamily._allTransitiveDependencies,
          baseUrl: baseUrl,
        );

  IntegrationClientProvider._internal(
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
    IntegrationTypeClient Function(IntegrationClientRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IntegrationClientProvider._internal(
        (ref) => create(ref as IntegrationClientRef),
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
  ProviderElement<IntegrationTypeClient> createElement() {
    return _IntegrationClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IntegrationClientProvider && other.baseUrl == baseUrl;
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
mixin IntegrationClientRef on ProviderRef<IntegrationTypeClient> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _IntegrationClientProviderElement
    extends ProviderElement<IntegrationTypeClient> with IntegrationClientRef {
  _IntegrationClientProviderElement(super.provider);

  @override
  String get baseUrl => (origin as IntegrationClientProvider).baseUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
