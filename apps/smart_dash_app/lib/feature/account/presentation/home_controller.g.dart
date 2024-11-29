// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeControllerHash() => r'4ba693bd24fb1daeb256e9b18360bcce90968767';

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

abstract class _$HomeController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<HomeData>> {
  late final HomeQuery query;

  FutureOr<Optional<HomeData>> build(
    HomeQuery query,
  );
}

/// See also [HomeController].
@ProviderFor(HomeController)
const homeControllerProvider = HomeControllerFamily();

/// See also [HomeController].
class HomeControllerFamily extends Family {
  /// See also [HomeController].
  const HomeControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'homeControllerProvider';

  /// See also [HomeController].
  HomeControllerProvider call(
    HomeQuery query,
  ) {
    return HomeControllerProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  HomeControllerProvider getProviderOverride(
    covariant HomeControllerProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(HomeController Function() create) {
    return _$HomeControllerFamilyOverride(this, create);
  }
}

class _$HomeControllerFamilyOverride implements FamilyOverride {
  _$HomeControllerFamilyOverride(this.overriddenFamily, this.create);

  final HomeController Function() create;

  @override
  final HomeControllerFamily overriddenFamily;

  @override
  HomeControllerProvider getProviderOverride(
    covariant HomeControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [HomeController].
class HomeControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    HomeController, Optional<HomeData>> {
  /// See also [HomeController].
  HomeControllerProvider(
    HomeQuery query,
  ) : this._internal(
          () => HomeController()..query = query,
          from: homeControllerProvider,
          name: r'homeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$homeControllerHash,
          dependencies: HomeControllerFamily._dependencies,
          allTransitiveDependencies:
              HomeControllerFamily._allTransitiveDependencies,
          query: query,
        );

  HomeControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final HomeQuery query;

  @override
  FutureOr<Optional<HomeData>> runNotifierBuild(
    covariant HomeController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(HomeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: HomeControllerProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  (HomeQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<HomeController, Optional<HomeData>>
      createElement() {
    return _HomeControllerProviderElement(this);
  }

  HomeControllerProvider _copyWith(
    HomeController Function() create,
  ) {
    return HomeControllerProvider._internal(
      () => create()..query = query,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      query: query,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HomeControllerProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HomeControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<HomeData>> {
  /// The parameter `query` of this provider.
  HomeQuery get query;
}

class _HomeControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<HomeController,
        Optional<HomeData>> with HomeControllerRef {
  _HomeControllerProviderElement(super.provider);

  @override
  HomeQuery get query => (origin as HomeControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
