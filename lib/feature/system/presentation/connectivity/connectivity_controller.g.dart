// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityScreenControllerHash() =>
    r'3415e7b219686a96fc239bd35e0680a0065a875f';

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

abstract class _$ConnectivityScreenController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<List<Connectivity>>> {
  late final ConnectivityQuery query;

  FutureOr<Optional<List<Connectivity>>> build(
    ConnectivityQuery query,
  );
}

/// See also [ConnectivityScreenController].
@ProviderFor(ConnectivityScreenController)
const connectivityScreenControllerProvider =
    ConnectivityScreenControllerFamily();

/// See also [ConnectivityScreenController].
class ConnectivityScreenControllerFamily extends Family {
  /// See also [ConnectivityScreenController].
  const ConnectivityScreenControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'connectivityScreenControllerProvider';

  /// See also [ConnectivityScreenController].
  ConnectivityScreenControllerProvider call(
    ConnectivityQuery query,
  ) {
    return ConnectivityScreenControllerProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  ConnectivityScreenControllerProvider getProviderOverride(
    covariant ConnectivityScreenControllerProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(ConnectivityScreenController Function() create) {
    return _$ConnectivityScreenControllerFamilyOverride(this, create);
  }
}

class _$ConnectivityScreenControllerFamilyOverride implements FamilyOverride {
  _$ConnectivityScreenControllerFamilyOverride(
      this.overriddenFamily, this.create);

  final ConnectivityScreenController Function() create;

  @override
  final ConnectivityScreenControllerFamily overriddenFamily;

  @override
  ConnectivityScreenControllerProvider getProviderOverride(
    covariant ConnectivityScreenControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [ConnectivityScreenController].
class ConnectivityScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ConnectivityScreenController,
        Optional<List<Connectivity>>> {
  /// See also [ConnectivityScreenController].
  ConnectivityScreenControllerProvider(
    ConnectivityQuery query,
  ) : this._internal(
          () => ConnectivityScreenController()..query = query,
          from: connectivityScreenControllerProvider,
          name: r'connectivityScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$connectivityScreenControllerHash,
          dependencies: ConnectivityScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              ConnectivityScreenControllerFamily._allTransitiveDependencies,
          query: query,
        );

  ConnectivityScreenControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final ConnectivityQuery query;

  @override
  FutureOr<Optional<List<Connectivity>>> runNotifierBuild(
    covariant ConnectivityScreenController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(ConnectivityScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ConnectivityScreenControllerProvider._internal(
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
  (ConnectivityQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ConnectivityScreenController,
      Optional<List<Connectivity>>> createElement() {
    return _ConnectivityScreenControllerProviderElement(this);
  }

  ConnectivityScreenControllerProvider _copyWith(
    ConnectivityScreenController Function() create,
  ) {
    return ConnectivityScreenControllerProvider._internal(
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
    return other is ConnectivityScreenControllerProvider &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ConnectivityScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<List<Connectivity>>> {
  /// The parameter `query` of this provider.
  ConnectivityQuery get query;
}

class _ConnectivityScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        ConnectivityScreenController,
        Optional<List<Connectivity>>> with ConnectivityScreenControllerRef {
  _ConnectivityScreenControllerProviderElement(super.provider);

  @override
  ConnectivityQuery get query =>
      (origin as ConnectivityScreenControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
