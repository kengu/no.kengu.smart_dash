// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_flow_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockFlowFormControllerHash() =>
    r'64e32ba988e25733998412a3ffbf8c1858a5ae41';

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

abstract class _$BlockFlowFormController
    extends BuildlessAutoDisposeAsyncNotifier<Optional<BlockModel>> {
  late final BlockFlowFormQuery query;

  FutureOr<Optional<BlockModel>> build(
    BlockFlowFormQuery query,
  );
}

/// See also [BlockFlowFormController].
@ProviderFor(BlockFlowFormController)
const blockFlowFormControllerProvider = BlockFlowFormControllerFamily();

/// See also [BlockFlowFormController].
class BlockFlowFormControllerFamily
    extends Family<AsyncValue<Optional<BlockModel>>> {
  /// See also [BlockFlowFormController].
  const BlockFlowFormControllerFamily();

  /// See also [BlockFlowFormController].
  BlockFlowFormControllerProvider call(
    BlockFlowFormQuery query,
  ) {
    return BlockFlowFormControllerProvider(
      query,
    );
  }

  @override
  BlockFlowFormControllerProvider getProviderOverride(
    covariant BlockFlowFormControllerProvider provider,
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
  String? get name => r'blockFlowFormControllerProvider';
}

/// See also [BlockFlowFormController].
class BlockFlowFormControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BlockFlowFormController,
        Optional<BlockModel>> {
  /// See also [BlockFlowFormController].
  BlockFlowFormControllerProvider(
    BlockFlowFormQuery query,
  ) : this._internal(
          () => BlockFlowFormController()..query = query,
          from: blockFlowFormControllerProvider,
          name: r'blockFlowFormControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$blockFlowFormControllerHash,
          dependencies: BlockFlowFormControllerFamily._dependencies,
          allTransitiveDependencies:
              BlockFlowFormControllerFamily._allTransitiveDependencies,
          query: query,
        );

  BlockFlowFormControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final BlockFlowFormQuery query;

  @override
  FutureOr<Optional<BlockModel>> runNotifierBuild(
    covariant BlockFlowFormController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(BlockFlowFormController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BlockFlowFormControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<BlockFlowFormController,
      Optional<BlockModel>> createElement() {
    return _BlockFlowFormControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BlockFlowFormControllerProvider && other.query == query;
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
mixin BlockFlowFormControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Optional<BlockModel>> {
  /// The parameter `query` of this provider.
  BlockFlowFormQuery get query;
}

class _BlockFlowFormControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BlockFlowFormController,
        Optional<BlockModel>> with BlockFlowFormControllerRef {
  _BlockFlowFormControllerProviderElement(super.provider);

  @override
  BlockFlowFormQuery get query =>
      (origin as BlockFlowFormControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
