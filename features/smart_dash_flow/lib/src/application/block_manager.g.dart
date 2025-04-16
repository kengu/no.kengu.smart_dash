// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockModelFlowHash() => r'b45fb865b2f2cd28fbe33ffcb691c810ac9a9e50';

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

/// See also [blockModelFlow].
@ProviderFor(blockModelFlow)
const blockModelFlowProvider = BlockModelFlowFamily();

/// See also [blockModelFlow].
class BlockModelFlowFamily extends Family<AsyncValue<BlockModel>> {
  /// See also [blockModelFlow].
  const BlockModelFlowFamily();

  /// See also [blockModelFlow].
  BlockModelFlowProvider call(
    BlockFlowQuery query,
  ) {
    return BlockModelFlowProvider(
      query,
    );
  }

  @override
  BlockModelFlowProvider getProviderOverride(
    covariant BlockModelFlowProvider provider,
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
  String? get name => r'blockModelFlowProvider';
}

/// See also [blockModelFlow].
class BlockModelFlowProvider extends AutoDisposeStreamProvider<BlockModel> {
  /// See also [blockModelFlow].
  BlockModelFlowProvider(
    BlockFlowQuery query,
  ) : this._internal(
          (ref) => blockModelFlow(
            ref as BlockModelFlowRef,
            query,
          ),
          from: blockModelFlowProvider,
          name: r'blockModelFlowProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$blockModelFlowHash,
          dependencies: BlockModelFlowFamily._dependencies,
          allTransitiveDependencies:
              BlockModelFlowFamily._allTransitiveDependencies,
          query: query,
        );

  BlockModelFlowProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final BlockFlowQuery query;

  @override
  Override overrideWith(
    Stream<BlockModel> Function(BlockModelFlowRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BlockModelFlowProvider._internal(
        (ref) => create(ref as BlockModelFlowRef),
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
  AutoDisposeStreamProviderElement<BlockModel> createElement() {
    return _BlockModelFlowProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BlockModelFlowProvider && other.query == query;
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
mixin BlockModelFlowRef on AutoDisposeStreamProviderRef<BlockModel> {
  /// The parameter `query` of this provider.
  BlockFlowQuery get query;
}

class _BlockModelFlowProviderElement
    extends AutoDisposeStreamProviderElement<BlockModel>
    with BlockModelFlowRef {
  _BlockModelFlowProviderElement(super.provider);

  @override
  BlockFlowQuery get query => (origin as BlockModelFlowProvider).query;
}

String _$blockManagerHash() => r'482a3c561c1210206edec790be3670e0d343e69a';

/// See also [blockManager].
@ProviderFor(blockManager)
final blockManagerProvider = Provider<BlockManager>.internal(
  blockManager,
  name: r'blockManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$blockManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BlockManagerRef = ProviderRef<BlockManager>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
