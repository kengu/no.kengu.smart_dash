// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow_consumer_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$snowConsumerClientHash() =>
    r'86c4bee983aca44efcef265ed370e22f8e581cff';

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

/// See also [snowConsumerClient].
@ProviderFor(snowConsumerClient)
const snowConsumerClientProvider = SnowConsumerClientFamily();

/// See also [snowConsumerClient].
class SnowConsumerClientFamily extends Family {
  /// See also [snowConsumerClient].
  const SnowConsumerClientFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'snowConsumerClientProvider';

  /// See also [snowConsumerClient].
  SnowConsumerClientProvider call(
    String baseUrl,
  ) {
    return SnowConsumerClientProvider(
      baseUrl,
    );
  }

  @visibleForOverriding
  @override
  SnowConsumerClientProvider getProviderOverride(
    covariant SnowConsumerClientProvider provider,
  ) {
    return call(
      provider.baseUrl,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      SnowConsumerClient Function(SnowConsumerClientRef ref) create) {
    return _$SnowConsumerClientFamilyOverride(this, create);
  }
}

class _$SnowConsumerClientFamilyOverride implements FamilyOverride {
  _$SnowConsumerClientFamilyOverride(this.overriddenFamily, this.create);

  final SnowConsumerClient Function(SnowConsumerClientRef ref) create;

  @override
  final SnowConsumerClientFamily overriddenFamily;

  @override
  SnowConsumerClientProvider getProviderOverride(
    covariant SnowConsumerClientProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [snowConsumerClient].
class SnowConsumerClientProvider extends Provider<SnowConsumerClient> {
  /// See also [snowConsumerClient].
  SnowConsumerClientProvider(
    String baseUrl,
  ) : this._internal(
          (ref) => snowConsumerClient(
            ref as SnowConsumerClientRef,
            baseUrl,
          ),
          from: snowConsumerClientProvider,
          name: r'snowConsumerClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$snowConsumerClientHash,
          dependencies: SnowConsumerClientFamily._dependencies,
          allTransitiveDependencies:
              SnowConsumerClientFamily._allTransitiveDependencies,
          baseUrl: baseUrl,
        );

  SnowConsumerClientProvider._internal(
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
    SnowConsumerClient Function(SnowConsumerClientRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SnowConsumerClientProvider._internal(
        (ref) => create(ref as SnowConsumerClientRef),
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
  ProviderElement<SnowConsumerClient> createElement() {
    return _SnowConsumerClientProviderElement(this);
  }

  SnowConsumerClientProvider _copyWith(
    SnowConsumerClient Function(SnowConsumerClientRef ref) create,
  ) {
    return SnowConsumerClientProvider._internal(
      (ref) => create(ref as SnowConsumerClientRef),
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
    return other is SnowConsumerClientProvider && other.baseUrl == baseUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, baseUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SnowConsumerClientRef on ProviderRef<SnowConsumerClient> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _SnowConsumerClientProviderElement
    extends ProviderElement<SnowConsumerClient> with SnowConsumerClientRef {
  _SnowConsumerClientProviderElement(super.provider);

  @override
  String get baseUrl => (origin as SnowConsumerClientProvider).baseUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
