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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
class FlowFamily extends Family<AsyncValue<FlowEvent>> {
  /// See also [flow].
  const FlowFamily();

  /// See also [flow].
  FlowProvider call(
    FlowEventQuery query,
  ) {
    return FlowProvider(
      query,
    );
  }

  @override
  FlowProvider getProviderOverride(
    covariant FlowProvider provider,
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
  String? get name => r'flowProvider';
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
    super._createNotifier, {
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
    Stream<FlowEvent> Function(FlowRef provider) create,
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
  AutoDisposeStreamProviderElement<FlowEvent> createElement() {
    return _FlowProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
