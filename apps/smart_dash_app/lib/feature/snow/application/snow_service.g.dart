// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCurrentSnowServiceHash() =>
    r'a1ff0819e2465e32f2e1d80671a1eea70467a32a';

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
class GetCurrentSnowServiceFamily extends Family {
  /// See also [getCurrentSnowService].
  const GetCurrentSnowServiceFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCurrentSnowServiceProvider';

  /// See also [getCurrentSnowService].
  GetCurrentSnowServiceProvider call([
    String? userId,
  ]) {
    return GetCurrentSnowServiceProvider(
      userId,
    );
  }

  @visibleForOverriding
  @override
  GetCurrentSnowServiceProvider getProviderOverride(
    covariant GetCurrentSnowServiceProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Optional<SnowService>> Function(GetCurrentSnowServiceRef ref)
          create) {
    return _$GetCurrentSnowServiceFamilyOverride(this, create);
  }
}

class _$GetCurrentSnowServiceFamilyOverride implements FamilyOverride {
  _$GetCurrentSnowServiceFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Optional<SnowService>> Function(GetCurrentSnowServiceRef ref)
      create;

  @override
  final GetCurrentSnowServiceFamily overriddenFamily;

  @override
  GetCurrentSnowServiceProvider getProviderOverride(
    covariant GetCurrentSnowServiceProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<Optional<SnowService>> Function(GetCurrentSnowServiceRef ref)
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
  (String?,) get argument {
    return (userId,);
  }

  @override
  AutoDisposeFutureProviderElement<Optional<SnowService>> createElement() {
    return _GetCurrentSnowServiceProviderElement(this);
  }

  GetCurrentSnowServiceProvider _copyWith(
    FutureOr<Optional<SnowService>> Function(GetCurrentSnowServiceRef ref)
        create,
  ) {
    return GetCurrentSnowServiceProvider._internal(
      (ref) => create(ref as GetCurrentSnowServiceRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      userId: userId,
    );
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
