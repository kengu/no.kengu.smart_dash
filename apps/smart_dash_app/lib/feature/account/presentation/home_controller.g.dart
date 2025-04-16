// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeControllerHash() => r'e5e9010b634686c3e531e1f194c6b52cabd759b6';

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
class HomeControllerFamily extends Family<AsyncValue<Optional<HomeData>>> {
  /// See also [HomeController].
  const HomeControllerFamily();

  /// See also [HomeController].
  HomeControllerProvider call(
    HomeQuery query,
  ) {
    return HomeControllerProvider(
      query,
    );
  }

  @override
  HomeControllerProvider getProviderOverride(
    covariant HomeControllerProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'homeControllerProvider';
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
    super._createNotifier, {
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
  AutoDisposeAsyncNotifierProviderElement<HomeController, Optional<HomeData>>
      createElement() {
    return _HomeControllerProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
