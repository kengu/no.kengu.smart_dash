// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flows_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flowsControllerHash() => r'879a244366f847427e3462482543a8f5e4a84286';

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

abstract class _$FlowsController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<List<BlockModel>>> {
  late final FlowsQuery query;

  FutureOr<Optional<List<BlockModel>>> build(
    FlowsQuery query,
  );
}

/// See also [FlowsController].
@ProviderFor(FlowsController)
const flowsControllerProvider = FlowsControllerFamily();

/// See also [FlowsController].
class FlowsControllerFamily
    extends Family<AsyncValue<Optional<List<BlockModel>>>> {
  /// See also [FlowsController].
  const FlowsControllerFamily();

  /// See also [FlowsController].
  FlowsControllerProvider call(
    FlowsQuery query,
  ) {
    return FlowsControllerProvider(
      query,
    );
  }

  @override
  FlowsControllerProvider getProviderOverride(
    covariant FlowsControllerProvider provider,
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
  String? get name => r'flowsControllerProvider';
}

/// See also [FlowsController].
class FlowsControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FlowsController, Optional<List<BlockModel>>> {
  /// See also [FlowsController].
  FlowsControllerProvider(
    FlowsQuery query,
  ) : this._internal(
          () => FlowsController()..query = query,
          from: flowsControllerProvider,
          name: r'flowsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flowsControllerHash,
          dependencies: FlowsControllerFamily._dependencies,
          allTransitiveDependencies:
              FlowsControllerFamily._allTransitiveDependencies,
          query: query,
        );

  FlowsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final FlowsQuery query;

  @override
  FutureOr<Optional<List<BlockModel>>> runNotifierBuild(
    covariant FlowsController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(FlowsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FlowsControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FlowsController,
      Optional<List<BlockModel>>> createElement() {
    return _FlowsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlowsControllerProvider && other.query == query;
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
mixin FlowsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<List<BlockModel>>> {
  /// The parameter `query` of this provider.
  FlowsQuery get query;
}

class _FlowsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FlowsController,
        Optional<List<BlockModel>>> with FlowsControllerRef {
  _FlowsControllerProviderElement(super.provider);

  @override
  FlowsQuery get query => (origin as FlowsControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
