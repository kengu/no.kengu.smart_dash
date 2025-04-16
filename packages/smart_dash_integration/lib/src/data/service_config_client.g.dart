// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_config_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceConfigClientHash() =>
    r'82b3ee48ce036c9b210edd7af5ae785826646bf7';

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

/// See also [serviceConfigClient].
@ProviderFor(serviceConfigClient)
const serviceConfigClientProvider = ServiceConfigClientFamily();

/// See also [serviceConfigClient].
class ServiceConfigClientFamily extends Family<ServiceConfigClient> {
  /// See also [serviceConfigClient].
  const ServiceConfigClientFamily();

  /// See also [serviceConfigClient].
  ServiceConfigClientProvider call(
    String baseUrl,
  ) {
    return ServiceConfigClientProvider(
      baseUrl,
    );
  }

  @override
  ServiceConfigClientProvider getProviderOverride(
    covariant ServiceConfigClientProvider provider,
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
  String? get name => r'serviceConfigClientProvider';
}

/// See also [serviceConfigClient].
class ServiceConfigClientProvider extends Provider<ServiceConfigClient> {
  /// See also [serviceConfigClient].
  ServiceConfigClientProvider(
    String baseUrl,
  ) : this._internal(
          (ref) => serviceConfigClient(
            ref as ServiceConfigClientRef,
            baseUrl,
          ),
          from: serviceConfigClientProvider,
          name: r'serviceConfigClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$serviceConfigClientHash,
          dependencies: ServiceConfigClientFamily._dependencies,
          allTransitiveDependencies:
              ServiceConfigClientFamily._allTransitiveDependencies,
          baseUrl: baseUrl,
        );

  ServiceConfigClientProvider._internal(
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
    ServiceConfigClient Function(ServiceConfigClientRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ServiceConfigClientProvider._internal(
        (ref) => create(ref as ServiceConfigClientRef),
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
  ProviderElement<ServiceConfigClient> createElement() {
    return _ServiceConfigClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ServiceConfigClientProvider && other.baseUrl == baseUrl;
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
mixin ServiceConfigClientRef on ProviderRef<ServiceConfigClient> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _ServiceConfigClientProviderElement
    extends ProviderElement<ServiceConfigClient> with ServiceConfigClientRef {
  _ServiceConfigClientProviderElement(super.provider);

  @override
  String get baseUrl => (origin as ServiceConfigClientProvider).baseUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
