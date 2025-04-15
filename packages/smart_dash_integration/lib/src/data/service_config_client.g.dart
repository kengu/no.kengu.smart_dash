// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_config_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceConfigClientHash() =>
    r'4f8c8a04c11fbfed27a9b2f5694e994d6fbee88e';

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
class ServiceConfigClientFamily extends Family {
  /// See also [serviceConfigClient].
  const ServiceConfigClientFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'serviceConfigClientProvider';

  /// See also [serviceConfigClient].
  ServiceConfigClientProvider call(
    String baseUrl,
  ) {
    return ServiceConfigClientProvider(
      baseUrl,
    );
  }

  @visibleForOverriding
  @override
  ServiceConfigClientProvider getProviderOverride(
    covariant ServiceConfigClientProvider provider,
  ) {
    return call(
      provider.baseUrl,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      ServiceConfigClient Function(ServiceConfigClientRef ref) create) {
    return _$ServiceConfigClientFamilyOverride(this, create);
  }
}

class _$ServiceConfigClientFamilyOverride implements FamilyOverride {
  _$ServiceConfigClientFamilyOverride(this.overriddenFamily, this.create);

  final ServiceConfigClient Function(ServiceConfigClientRef ref) create;

  @override
  final ServiceConfigClientFamily overriddenFamily;

  @override
  ServiceConfigClientProvider getProviderOverride(
    covariant ServiceConfigClientProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    ServiceConfigClient Function(ServiceConfigClientRef ref) create,
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
  (String,) get argument {
    return (baseUrl,);
  }

  @override
  ProviderElement<ServiceConfigClient> createElement() {
    return _ServiceConfigClientProviderElement(this);
  }

  ServiceConfigClientProvider _copyWith(
    ServiceConfigClient Function(ServiceConfigClientRef ref) create,
  ) {
    return ServiceConfigClientProvider._internal(
      (ref) => create(ref as ServiceConfigClientRef),
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
    return other is ServiceConfigClientProvider && other.baseUrl == baseUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, baseUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
