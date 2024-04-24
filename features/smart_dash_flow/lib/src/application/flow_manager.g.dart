// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flowManagerHash() => r'756838274d1ee4e619dd14e152c8385c709e0ccd';

/// See also [flowManager].
@ProviderFor(flowManager)
final flowManagerProvider = Provider<FlowManager>.internal(
  flowManager,
  name: r'flowManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$flowManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlowManagerRef = ProviderRef<FlowManager>;
String _$flowHash() => r'91f3c02d787fa612c3068b322b0399fed2d8033c';

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

/// See also [flow].
@ProviderFor(flow)
const flowProvider = FlowFamily();

/// See also [flow].
class FlowFamily extends Family {
  /// See also [flow].
  const FlowFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'flowProvider';

  /// See also [flow].
  FlowProvider call(
    FlowEventQuery query,
  ) {
    return FlowProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  FlowProvider getProviderOverride(
    covariant FlowProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(Stream<FlowEvent> Function(FlowRef ref) create) {
    return _$FlowFamilyOverride(this, create);
  }
}

class _$FlowFamilyOverride implements FamilyOverride {
  _$FlowFamilyOverride(this.overriddenFamily, this.create);

  final Stream<FlowEvent> Function(FlowRef ref) create;

  @override
  final FlowFamily overriddenFamily;

  @override
  FlowProvider getProviderOverride(
    covariant FlowProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [flow].
class FlowProvider extends AutoDisposeStreamProvider<FlowEvent> {
  /// See also [flow].
  FlowProvider(
    FlowEventQuery query,
  ) : this._internal(
          (ref) => flow(
            ref as FlowRef,
            query,
          ),
          from: flowProvider,
          name: r'flowProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$flowHash,
          dependencies: FlowFamily._dependencies,
          allTransitiveDependencies: FlowFamily._allTransitiveDependencies,
          query: query,
        );

  FlowProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final FlowEventQuery query;

  @override
  Override overrideWith(
    Stream<FlowEvent> Function(FlowRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FlowProvider._internal(
        (ref) => create(ref as FlowRef),
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
  (FlowEventQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeStreamProviderElement<FlowEvent> createElement() {
    return _FlowProviderElement(this);
  }

  FlowProvider _copyWith(
    Stream<FlowEvent> Function(FlowRef ref) create,
  ) {
    return FlowProvider._internal(
      (ref) => create(ref as FlowRef),
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
    return other is FlowProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FlowRef on AutoDisposeStreamProviderRef<FlowEvent> {
  /// The parameter `query` of this provider.
  FlowEventQuery get query;
}

class _FlowProviderElement extends AutoDisposeStreamProviderElement<FlowEvent>
    with FlowRef {
  _FlowProviderElement(super.provider);

  @override
  FlowEventQuery get query => (origin as FlowProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
