// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCurrentSnowServiceHash() =>
    r'fa8962cdb08d10bb96bc14d94b2ee844ae4832e4';

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

/// See also [getCurrentSnowService].
@ProviderFor(getCurrentSnowService)
const getCurrentSnowServiceProvider = GetCurrentSnowServiceFamily();

/// See also [getCurrentSnowService].
class GetCurrentSnowServiceFamily
    extends Family<AsyncValue<Optional<SnowService>>> {
  /// See also [getCurrentSnowService].
  const GetCurrentSnowServiceFamily();

  /// See also [getCurrentSnowService].
  GetCurrentSnowServiceProvider call([
    String? userId,
  ]) {
    return GetCurrentSnowServiceProvider(
      userId,
    );
  }

  @override
  GetCurrentSnowServiceProvider getProviderOverride(
    covariant GetCurrentSnowServiceProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getCurrentSnowServiceProvider';
}

/// See also [getCurrentSnowService].
class GetCurrentSnowServiceProvider
    extends AutoDisposeFutureProvider<Optional<SnowService>> {
  /// See also [getCurrentSnowService].
  GetCurrentSnowServiceProvider([
    String? userId,
  ]) : this._internal(
          (ref) => getCurrentSnowService(
            ref as GetCurrentSnowServiceRef,
            userId,
          ),
          from: getCurrentSnowServiceProvider,
          name: r'getCurrentSnowServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCurrentSnowServiceHash,
          dependencies: GetCurrentSnowServiceFamily._dependencies,
          allTransitiveDependencies:
              GetCurrentSnowServiceFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetCurrentSnowServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String? userId;

  @override
  Override overrideWith(
    FutureOr<Optional<SnowService>> Function(GetCurrentSnowServiceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCurrentSnowServiceProvider._internal(
        (ref) => create(ref as GetCurrentSnowServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Optional<SnowService>> createElement() {
    return _GetCurrentSnowServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCurrentSnowServiceProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCurrentSnowServiceRef
    on AutoDisposeFutureProviderRef<Optional<SnowService>> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _GetCurrentSnowServiceProviderElement
    extends AutoDisposeFutureProviderElement<Optional<SnowService>>
    with GetCurrentSnowServiceRef {
  _GetCurrentSnowServiceProviderElement(super.provider);

  @override
  String? get userId => (origin as GetCurrentSnowServiceProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
