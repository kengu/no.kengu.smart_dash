// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$snowServiceHash() => r'2c4d1b9877f3c5513a8faa85e0605e39c206481d';

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

/// Build a new [SnowService] instance.
///
/// Copied from [snowService].
@ProviderFor(snowService)
const snowServiceProvider = SnowServiceFamily();

/// Build a new [SnowService] instance.
///
/// Copied from [snowService].
class SnowServiceFamily extends Family {
  /// Build a new [SnowService] instance.
  ///
  /// Copied from [snowService].
  const SnowServiceFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'snowServiceProvider';

  /// Build a new [SnowService] instance.
  ///
  /// Copied from [snowService].
  SnowServiceProvider call(
    String baseUrl,
  ) {
    return SnowServiceProvider(
      baseUrl,
    );
  }

  @visibleForOverriding
  @override
  SnowServiceProvider getProviderOverride(
    covariant SnowServiceProvider provider,
  ) {
    return call(
      provider.baseUrl,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<SnowService> Function(SnowServiceRef ref) create) {
    return _$SnowServiceFamilyOverride(this, create);
  }
}

class _$SnowServiceFamilyOverride implements FamilyOverride {
  _$SnowServiceFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<SnowService> Function(SnowServiceRef ref) create;

  @override
  final SnowServiceFamily overriddenFamily;

  @override
  SnowServiceProvider getProviderOverride(
    covariant SnowServiceProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// Build a new [SnowService] instance.
///
/// Copied from [snowService].
class SnowServiceProvider extends FutureProvider<SnowService> {
  /// Build a new [SnowService] instance.
  ///
  /// Copied from [snowService].
  SnowServiceProvider(
    String baseUrl,
  ) : this._internal(
          (ref) => snowService(
            ref as SnowServiceRef,
            baseUrl,
          ),
          from: snowServiceProvider,
          name: r'snowServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$snowServiceHash,
          dependencies: SnowServiceFamily._dependencies,
          allTransitiveDependencies:
              SnowServiceFamily._allTransitiveDependencies,
          baseUrl: baseUrl,
        );

  SnowServiceProvider._internal(
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
    FutureOr<SnowService> Function(SnowServiceRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SnowServiceProvider._internal(
        (ref) => create(ref as SnowServiceRef),
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
  FutureProviderElement<SnowService> createElement() {
    return _SnowServiceProviderElement(this);
  }

  SnowServiceProvider _copyWith(
    FutureOr<SnowService> Function(SnowServiceRef ref) create,
  ) {
    return SnowServiceProvider._internal(
      (ref) => create(ref as SnowServiceRef),
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
    return other is SnowServiceProvider && other.baseUrl == baseUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, baseUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SnowServiceRef on FutureProviderRef<SnowService> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _SnowServiceProviderElement extends FutureProviderElement<SnowService>
    with SnowServiceRef {
  _SnowServiceProviderElement(super.provider);

  @override
  String get baseUrl => (origin as SnowServiceProvider).baseUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
