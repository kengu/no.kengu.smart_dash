// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$snowServiceHash() => r'141dd8dff0fc46a4ee21286385b27d541148e0b7';

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
class SnowServiceFamily extends Family<AsyncValue<SnowService>> {
  /// Build a new [SnowService] instance.
  ///
  /// Copied from [snowService].
  const SnowServiceFamily();

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

  @override
  SnowServiceProvider getProviderOverride(
    covariant SnowServiceProvider provider,
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
  String? get name => r'snowServiceProvider';
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
    FutureOr<SnowService> Function(SnowServiceRef provider) create,
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
  FutureProviderElement<SnowService> createElement() {
    return _SnowServiceProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
