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
class SnowConsumerClientFamily extends Family<SnowConsumerClient> {
  /// See also [snowConsumerClient].
  const SnowConsumerClientFamily();

  /// See also [snowConsumerClient].
  SnowConsumerClientProvider call(
    String baseUrl,
  ) {
    return SnowConsumerClientProvider(
      baseUrl,
    );
  }

  @override
  SnowConsumerClientProvider getProviderOverride(
    covariant SnowConsumerClientProvider provider,
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
  String? get name => r'snowConsumerClientProvider';
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
    SnowConsumerClient Function(SnowConsumerClientRef provider) create,
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
  ProviderElement<SnowConsumerClient> createElement() {
    return _SnowConsumerClientProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
